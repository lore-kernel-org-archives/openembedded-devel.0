Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ilya.muromec@gmail.com>) id 1McUYn-0000u0-Lh
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Aug 2009 03:29:25 +0200
Received: by bwz17 with SMTP id 17so1673674bwz.21
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Aug 2009 18:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=j8PH1qIzzbH0+5bSOZRL78z1lDFyG7n94/M7SFI9+KI=;
	b=nuOxXY8bCZdDHnOoJMX6YBwc/ljMcIk4XuekbbzuiMlmaWgiEMwJ9L7PhI5kxzYM5L
	1UlJzXmYZqWD1Z4kcXUHudLCCeqxhyYCH0DiBi54MhWeSlvYPAQAKKSDazaZjm96LUEr
	suG61UctkLScD/eqCxkqkFuhriCAtopPulk7E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=DKULRyHcQscvu2ax5tc87RR4Z2l8O0Hmp+A863WrwUbbFLnOC6Hzu5269f+I+6ALPI
	GLEWiluGKM6PqO6aYAIZ/59xhNEVmhWTR7VFBIVPQonSTfPgFvqpCrreC0PPDicEwCFq
	So9zigiVLDPoFbLCIml7w/qMQfYBt+s+PwAMw=
MIME-Version: 1.0
Received: by 10.204.19.138 with SMTP id a10mr1921796bkb.68.1250385155990; Sat, 
	15 Aug 2009 18:12:35 -0700 (PDT)
Date: Sun, 16 Aug 2009 04:12:35 +0300
Message-ID: <800a98740908151812r65a3c267h104241a2e32a1222@mail.gmail.com>
From: Ilya Petrov <ilya.muromec@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	OpenEzx <openezx-devel@lists.openezx.org>
Subject: [patch] add 18 bpp support to psplash
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Aug 2009 01:29:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi!

Here is small patch to add 18bpp support to psplash.
This needed for motorola ezx gen2 machines (like moto a1200).


diff --git a/recipes/psplash/files/psplash-18bpp.patch
b/recipes/psplash/files/psplash-18bpp.patch
new file mode 100644
index 0000000..b043f56
--- /dev/null
+++ b/recipes/psplash/files/psplash-18bpp.patch
@@ -0,0 +1,42 @@
+--- psplash/psplash-fb.c        2007-08-29 21:27:49.000000000 +0300
++++ /home/muromec/psplash/psplash-fb.c  2009-08-16 03:59:07.000000000 +0300
+@@ -72,6 +72,7 @@
+   fb->real_width  = fb->width  = fb_var.xres;
+   fb->real_height = fb->height = fb_var.yres;
+   fb->bpp    = fb_var.bits_per_pixel;
++  fb->color  = fb_var.red.length + fb_var.green.length + fb_var.blue.length;
+   fb->stride = fb_fix.line_length;
+   fb->type   = fb_fix.type;
+   fb->visual = fb_fix.visual;
+@@ -176,7 +177,7 @@
+     }
+
+   /* FIXME: handle no RGB orderings */
+-  switch (fb->bpp)
++  switch (fb->color)
+     {
+     case 24:
+     case 32:
+@@ -184,6 +185,10 @@
+       *(fb->data + off + 1) = green;
+       *(fb->data + off + 2) = blue;
+       break;
++    case 18:
++      *(fb->data + off)     = (red>>2) | ((green&0x0C)<<4);
++      *(fb->data + off + 1) = ((green&0xF0)>>4) | ((blue&0x3C)<<2);
++      *(fb->data + off + 2) = (blue&0xC0)>>6;
+     case 16:
+       *(volatile uint16 *) (fb->data + off)
+        = ((red >> 3) << 11) | ((green >> 2) << 5) | (blue >> 3);
+diff -ru psplash/psplash-fb.h /home/muromec/psplash/psplash-fb.h
+--- psplash/psplash-fb.h        2007-08-29 21:27:49.000000000 +0300
++++ /home/muromec/psplash/psplash-fb.h  2009-08-16 03:58:20.000000000 +0300
+@@ -26,6 +26,7 @@
+   int            visual;
+   int            width, height;
+   int            bpp;
++  int            color;
+   int            stride;
+   char         *data;
+   char         *base;
+
diff --git a/recipes/psplash/psplash-angstrom_svn.bb
b/recipes/psplash/psplash-angstrom_svn.bb

-- index f65fb81..fc5e4c2 100644
--- a/recipes/psplash/psplash-angstrom_svn.bb
+++ b/recipes/psplash/psplash-angstrom_svn.bb
@@ -10,6 +10,7 @@ ALTERNATIVE_PRIORITY = "20"
 # You might also want to patch the colors (see patch)

 SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=psplash;proto=http \
+          file://psplash-18bpp.patch;patch=1 \
           file://logo-math.patch;patch=1 \
           file://psplash-hand-img.h \
           file://psplash-bar-img.h \
 wbr, Ilya
 ICQ: none, Jabber: ilya.muromec@jabber.ru


