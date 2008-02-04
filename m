Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <utx@penguin.cz>) id 1JLz8O-00028e-DX
	for openembedded-devel@openembedded.org; Mon, 04 Feb 2008 12:05:08 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 13E08628091;
	Mon,  4 Feb 2008 12:05:19 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fo5oph$rre$2@ger.gmane.org>
References: <1201544344.5882.45.camel@hammer.suse.cz>
	<20080130124544.1f562944@widy.localdomain>
	<1201695196.27523.52.camel@hammer.suse.cz> <47A2D217.7070000@gmail.com>
	<1202075839.17746.11.camel@utx.utx.cz>  <fo5oph$rre$2@ger.gmane.org>
Date: Mon, 04 Feb 2008 12:05:17 +0100
Message-Id: <1202123118.3689.12.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.0 
Cc: openembedded-devel@openembedded.org
Subject: Re: [patch commit request] kdrive	xserver:	support	for	key	codes 128-255
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
X-List-Received-Date: Mon, 04 Feb 2008 11:05:08 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Dmitry Baryshkov wrote:
> >> 
> >> I guess I probably would be yelled at for not raising this before
> >> committing your patch.
> >> 
> >> Is this patch specific to Zaurus clamshells, akita/spitz/c7x0? In other
> >> words, are there any other devices benifiting from the extended
> >> keycode.
> >>   I vaguely remember Dmitry asked about extended keycode for tosa, but
> >> I'm not sure he's talking about the same thing.
> > 
> > No. It adds support for key codes 128-255 in general.
> > 
> > Let he test to assign these key codes in the kernel driver. He should
> > see them non-mangled in X.
> 
> Thanks. I'll test. Should I use -keybd keyboard or -keybd evdev... ?

Patch affects only the old keyboard driver, not evdev.

See details in the bottom of this mail.

> > Note that is cannot provide codes above 255 - it is a major limitation
> > of X11 protocol.
> 
> Hmmm. According to the <linux/input.h> there are a plenty of keys with 
> keycodes 0x160 -- 0x1ff. They can't be handled by the X11?

No, they can't. http://bugs.freedesktop.org/show_bug.cgi?id=11227

Somebody could design a work-around, but real solution can come with X12
protocol change.

-

Long description:

Here is a description what X does:

xserver-kdrive:
- If XKB is disabled, MEDIUMRAW mode is used.
- If XKB is enabled, AT keyboard scancode interface is used.

xorg-xserver:
- AT keyboard scancode interface is used by default.
- If you have PPC linux with a very very old kernel with
  MAC_ADBKEYCODES support, MEDIUMRAW mode is used.
- evdev driver exists, but its configuration files are not yet working
  properly.


Here is a description what kernel can do:

1. Native RAW mode (AT keyboards only, default in kernel 2.4, can be
   turned on in 2.6 by softraw=0 kernel arg to atkbd).
   X gets exact AT scancodes what from the keyboard.
2. SOFTRAW mode (default in kernel 2.6). Kernel interprets the scancodes
   from keyboard or similar codes from other input devices. Then it
   emulates scancodes of Microsoft Multimedia AT keyboard and sends them
   to the user space.
3. MEDIUMRAW mode (obsolete). Kernel interprets keys presses and sends
   keycodes to the user space using the old-style scancode interface.
   Only key codes < 128 can be transferred.
4. Extended MEDIUMRAW mode (switched in kernel using ioctl()). Kernel
   interprets keys presses and sends keycodes to the user space using
   the old-style scancode interface with a special encapsulation
   (see drivers/char/keyboard.c kernel source, lines 1204-1222).
   Only key codes < 16384 can be transferred.
   This is implemented by my patch:
   http://bugs.freedesktop.org/show_bug.cgi?id=11545
5. Evdev interface. Kernel interprets keys presses and sends keycodes
   to the user space using the evdev interface.

As you can see 1 and 2 are intended to provide the same results (but
they often don't) and 4 and 5 are intended to provide the same results.


Note that there is a major limitation of X11 protocol to 256 keycodes.
http://bugs.freedesktop.org/show_bug.cgi?id=11227
It will be targetted in X12 development, but we should not expect it
soon. X11 is there for about 20 years and it would be hard to change it

-- 
Stanislav Brabec
http://www.penguin.cz/~utx, ICQ 116020046



