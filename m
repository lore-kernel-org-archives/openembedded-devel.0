Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <utx@penguin.cz>) id 1JKE8p-0003ck-1T
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2008 15:42:22 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 14D336280D7;
	Wed, 30 Jan 2008 13:13:17 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <20080130124544.1f562944@widy.localdomain>
References: <1201544344.5882.45.camel@hammer.suse.cz>
	<20080130124544.1f562944@widy.localdomain>
Date: Wed, 30 Jan 2008 13:13:16 +0100
Message-Id: <1201695196.27523.52.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.0 
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [patch commit request] kdrive xserver: support for key	codes	128-255
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
X-List-Received-Date: Wed, 30 Jan 2008 14:42:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
> On Mon, 28 Jan 2008 19:19:04 +0100
> Stanislav Brabec <utx@penguin.cz> wrote:

> Can you please elaborate what the application of this patch would mean
> for OE (besides fixing support for one specific obscure peripheral)? 

Support of key codes 128-255 from the /usr/include/linux/input.h in
kdrive.

> Based on this comment: "Note: Extended MEDIUMRAW mode and evdev mode
> should provide the same keycodes" in
> http://bugs.freedesktop.org/show_bug.cgi?id=11545 , I would think that
> it would bring us interface-stable workaround until X.org and we fully
> convert to evdev?

Yes. Extended MEDIUMRAW mode and evdev are using different interfaces,
but they are intended to return the same key codes.

My patch extends keycode support from 0-127 to 0-255.

> Is that how you perceive it? Should we declare the
> problem of 8-bit keycodes solved right now, and stop recommending
> kernel developers to fit their keys into 7 bits? Is this patch
> suitable
> for merging to stable branch?

Short description:

Yes. Current kernel already sends Extended MEDIUMRAW codes for
keys > 127, but xserver is not able to interpret them.


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
5. Evdev interface. Kernel interprets keys presses and sends keycodes
   to the user space using the evdev interface.

As you can see 1 and 2 are intended to provide the same results (but
they often don't) and 4 and 5 are intended to provide the same results.


Note that there is a major limitation of X11 protocol to 256 keycodes.
http://bugs.freedesktop.org/show_bug.cgi?id=11227
It will be targetted in X12 development, but we should not expect it
soon. X11 is there for about 20 years and it would be hard to change it.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



