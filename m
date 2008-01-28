Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <utx@penguin.cz>) id 1JJYZO-0006fq-DV
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2008 19:18:58 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id F09096280CA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2008 19:19:04 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Jan 2008 19:19:04 +0100
Message-Id: <1201544344.5882.45.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.0 
Subject: [patch commit request] kdrive xserver: support for key codes	128-255
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2008 18:18:58 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hallo.

Would be anybody with commit privileges to OE mtn so kind and review and
commit attached fixes regarding keycodes 128-255 in kdrive xserver.

It is required for input devices generating these key codes (e. g. Sharp
CE-RH2 on Zaurus Spitz/Akita).

This patch works perfectly for me for more than half year.

Patch is not device specific and should work for all input devices. It
was reviewed by the Linux Extended MEDIUMRAW mode author.

Attached mtn patch fixes
http://bugs.openembedded.org/show_bug.cgi?id=2637
[Bug 2637] fixes to make Sharp CE-RH2 remote working in X

This bug remains for more than half year without any response.

This bug is also pending in upstream as
http://bugs.freedesktop.org/show_bug.cgi?id=11545
[Bug 11545] patch to support Linux Extended MEDIUMRAW keyboard mode


#
# old_revision [54d430eac081b6372e156d9c6d7b9a44d9c9422f]
#
# add_file "packages/xorg-xserver/xserver-kdrive-1.3.0.0/linux-keyboard-mediumraw.patch"
#  content [e5ade42dad2df4fd8a283ea21343e22ea1b5b5d6]
# 
# add_file "packages/xorg-xserver/xserver-kdrive-1.4/linux-keyboard-mediumraw.patch"
#  content [faca4d8feba0272517c84f11ac61a39c0b055556]
# 
# patch "packages/xorg-xserver/xserver-kdrive_1.3.0.0.bb"
#  from [c8df66fc28ad69123340b7acdf08b827bc631c09]
#    to [41e45777f92b716da705a52140e3ce499b8f2d36]
# 
# patch "packages/xorg-xserver/xserver-kdrive_1.4.bb"
#  from [fc1b8a97acf55bb4abc9d1d2ad120b71d1d4f15a]
#    to [a78356c698a321739be60a164cee8f7a77c158fa]
#
============================================================
--- packages/xorg-xserver/xserver-kdrive-1.3.0.0/linux-keyboard-mediumraw.patch	e5ade42dad2df4fd8a283ea21343e22ea1b5b5d6
+++ packages/xorg-xserver/xserver-kdrive-1.3.0.0/linux-keyboard-mediumraw.patch	e5ade42dad2df4fd8a283ea21343e22ea1b5b5d6
@@ -0,0 +1,83 @@
+Index: xorg-server-1.3.0.0/hw/kdrive/linux/keyboard.c
+===================================================================
+--- xorg-server-1.3.0.0.orig/hw/kdrive/linux/keyboard.c	2006-11-16 18:01:23.000000000 +0000
++++ xorg-server-1.3.0.0/hw/kdrive/linux/keyboard.c	2007-08-12 12:14:29.000000000 +0000
+@@ -384,14 +384,35 @@
+ LinuxKeyboardRead (int fd, void *closure)
+ {
+     unsigned char   buf[256], *b;
+-    int		    n;
++    int		    n, mediumraw_data, mediumraw_event;
++    static enum { LOWKEY, BYTE1, BYTE2 } mediumraw_state = LOWKEY;
+ 
+     while ((n = read (fd, buf, sizeof (buf))) > 0)
+     {
+ 	b = buf;
+ 	while (n--)
+ 	{
+-	    KdEnqueueKeyboardEvent (b[0] & 0x7f, b[0] & 0x80);
++	    switch (mediumraw_state)
++	    {
++	    case LOWKEY:
++		if ( (b[0] & 0x7f) == 0)
++		{
++		    mediumraw_state = BYTE1;
++		    mediumraw_event = b[0] & 0x80;
++		}
++		else
++		    KdEnqueueKeyboardEvent (b[0] & 0x7f, b[0] & 0x80);
++		break;
++	    case BYTE1:
++		mediumraw_data = (b[0] & 0x7f) << 7;
++		mediumraw_state = BYTE2;
++		break;
++	    case BYTE2:
++		/* FIXME: KdEnqueueKeyboardEvent should accept word size */
++		KdEnqueueKeyboardEvent ( mediumraw_data | (b[0] & 0x7f), mediumraw_event);
++		mediumraw_state = LOWKEY;
++		break;
++	    }
+ 	    b++;
+ 	}
+     }
+Index: xorg-server-1.3.0.0/hw/xfree86/os-support/linux/lnx_kbd.c
+===================================================================
+--- xorg-server-1.3.0.0.orig/hw/xfree86/os-support/linux/lnx_kbd.c	2006-11-16 18:01:25.000000000 +0000
++++ xorg-server-1.3.0.0/hw/xfree86/os-support/linux/lnx_kbd.c	2007-08-12 12:14:29.000000000 +0000
+@@ -430,12 +430,32 @@
+ {
+     KbdDevPtr pKbd = (KbdDevPtr) pInfo->private;
+     unsigned char rBuf[64];
+-    int nBytes, i;
++    int nBytes, i, mediumraw_data, mediumraw_event;
++    static enum { LOWKEY, BYTE1, BYTE2 } mediumraw_state = LOWKEY;
+     if ((nBytes = read( pInfo->fd, (char *)rBuf, sizeof(rBuf))) > 0) {
+-       for (i = 0; i < nBytes; i++)
+-           pKbd->PostEvent(pInfo, rBuf[i] & 0x7f,
+-                           rBuf[i] & 0x80 ? FALSE : TRUE);
++       for (i = 0; i < nBytes; i++) {
++           switch (mediumraw_state) {
++           case LOWKEY:
++               if ( (rBuf[i] & 0x7f) == 0) {
++                   mediumraw_state = BYTE1;
++                   mediumraw_event = rBuf[i] & 0x80;
++               }
++               else
++                   pKbd->PostEvent(pInfo, rBuf[i] & 0x7f,
++                                   rBuf[i] & 0x80 ? FALSE : TRUE);
++               break;
++           case BYTE1:
++               mediumraw_data = (rBuf[i] & 0x7f) << 7;
++               mediumraw_state = BYTE2;
++               break;
++           case BYTE2:
++               pKbd->PostEvent(pInfo, mediumraw_data | (rBuf[i] & 0x7f),
++                               mediumraw_event ? FALSE : TRUE);
++               mediumraw_state = LOWKEY;
++               break;
++           }
+        }
++    }
+ }
+ 
+ static Bool
============================================================
--- packages/xorg-xserver/xserver-kdrive-1.4/linux-keyboard-mediumraw.patch	faca4d8feba0272517c84f11ac61a39c0b055556
+++ packages/xorg-xserver/xserver-kdrive-1.4/linux-keyboard-mediumraw.patch	faca4d8feba0272517c84f11ac61a39c0b055556
@@ -0,0 +1,44 @@
+Index: git/hw/kdrive/linux/keyboard.c
+===================================================================
+--- git.orig/hw/kdrive/linux/keyboard.c	2007-11-14 21:30:45.000000000 +0000
++++ git/hw/kdrive/linux/keyboard.c	2007-11-15 12:00:11.000000000 +0000
+@@ -42,6 +42,8 @@
+ #include <sys/ioctl.h>
+ 
+ extern int LinuxConsoleFd;
++static unsigned char mediumraw_data, mediumraw_up;
++static enum { DEFAULT, EXTBYTE1, EXTBYTE2 } mediumraw_state = DEFAULT;
+ 
+ static const KeySym linux_to_x[256] = {
+ 	NoSymbol,	NoSymbol,	NoSymbol,	NoSymbol,
+@@ -701,7 +703,29 @@
+             else
+ #endif
+                 scancode = b[0] & 0x7f;
+-	    KdEnqueueKeyboardEvent (closure, scancode, b[0] & 0x80);
++	    /* This is extended medium raw mode interpreter
++	       see linux/drivers/keyboard.c (kbd->kbdmode == VC_MEDIUMRAW) */
++	    switch (mediumraw_state)
++	    {
++	    case DEFAULT:
++		if (scancode == 0)
++		{
++		    mediumraw_state = EXTBYTE1;
++		    mediumraw_up = b[0] & 0x80;
++		}
++		else
++		    KdEnqueueKeyboardEvent (closure, scancode, b[0] & 0x80);
++		break;
++	    case EXTBYTE1:
++		mediumraw_data = scancode;
++		mediumraw_state = EXTBYTE2;
++		break;
++	    case EXTBYTE2:
++		/* Note: Only codes < 256 will pass correctly through KdEnqueueKeyboardEvent() */
++	      KdEnqueueKeyboardEvent (closure, (int)mediumraw_data << 7 | scancode, mediumraw_up);
++		mediumraw_state = DEFAULT;
++		break;
++	    }
+ 	    b++;
+ 	}
+     }
============================================================
--- packages/xorg-xserver/xserver-kdrive_1.3.0.0.bb	c8df66fc28ad69123340b7acdf08b827bc631c09
+++ packages/xorg-xserver/xserver-kdrive_1.3.0.0.bb	41e45777f92b716da705a52140e3ce499b8f2d36
@@ -20,6 +20,7 @@ SRC_URI = "${XORG_MIRROR}/individual/xse
 	file://w100-autofoo.patch;patch=1 \
 	file://w100-fix-offscreen-bmp.patch;patch=1 \
         file://kdrive-1.3-18bpp.patch;patch=1 \
+        file://linux-keyboard-mediumraw.patch;patch=1 \
         file://gumstix-kmode.patch;patch=1 \
         file://smedia-glamo.patch;patch=1 \
         file://build-glamo.patch;patch=1 \
============================================================
--- packages/xorg-xserver/xserver-kdrive_1.4.bb	fc1b8a97acf55bb4abc9d1d2ad120b71d1d4f15a
+++ packages/xorg-xserver/xserver-kdrive_1.4.bb	a78356c698a321739be60a164cee8f7a77c158fa
@@ -16,6 +16,7 @@ SRC_URI = "${XORG_MIRROR}/individual/xse
 	file://w100-autofoo.patch;patch=1 \
 	file://w100-fix-offscreen-bmp.patch;patch=1 \
 	file://w100-new-input-world-order.patch;patch=1 \
+	file://linux-keyboard-mediumraw.patch;patch=1 \
 	file://xcalibrate-new-input-world-order.patch;patch=1 \
 	file://tslib-default-device.patch;patch=1 \
 	file://fbdev-evdev.patch;patch=1 \

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



