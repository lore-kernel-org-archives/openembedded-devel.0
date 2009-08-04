Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MYK9q-0002Bo-8s
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Aug 2009 15:34:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id DAA441409713
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2009 15:22:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OCg7i2S-DB+R
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2009 15:22:26 +0200 (CEST)
Received: from [10.20.1.86] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id A3C651416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2009 15:22:26 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200908031513.05326.marcin@juszkiewicz.com.pl>
References: <200908031513.05326.marcin@juszkiewicz.com.pl>
Date: Tue, 04 Aug 2009 15:18:53 +0200
Message-Id: <1249391933.21103.58.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.27.2 
Subject: Re: [RFC] Xserver-common 1.30
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
X-List-Received-Date: Tue, 04 Aug 2009 13:34:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz wrote:
> Hi
> 
> We have two packages which do similar things: 
> 
> - xserver-common from GPE
> - xserver-kdrive-common from Poky
> 
> Basically they do the same -- select proper XServer, arguments to pass 
> for it and have session scripts. Kdrive version uses 'xinit' to 
> initialize X11 session as root user, GPE version is expected to be used 
> with gpe-dm/gpe-login combo which handles user login.
> 
> This gave us few mistakes in past - some developers patched one of them 
> for their device but the other one was used in image etc.

Yes semi-pseudo-universal files makes it hardly maintainable.
Maintainers of different platforms afraid or removing obsolete hacks for
a different platform and add their own hack instead.

> Some time ago I looked at xserver-common 1.25 and created over 20 
> patches for it:
> 
> - moved xmodmap files to xmodmap/ dir
> - use machine_id from init.d/functions

What about /etc/default/machine_id (possibly generated on the first
boot)? It would save several launching of AWK interpreter in scripts.

> - xserver:

Well, universal simple wrapper using machine-specific
/etc/default/xserver would make sense. I can imagine arguments like:
XSERVER_TYPE, KDRIVE_EXTRA_ARGS, XORG_EXTRA_ARGS, DPI,
DISPLAY_ORIENTATION, INPUT_ORIENTATION and others, if they will be
needed.

In particular, Xserver script tries to cover both xorg and kdrive, but
xorg/kdrive switch is installed-packages-based, but machine detection is
hardware based.

As a result, installing xorg on a machine configured for kdrive causes a
Xorg syntax error - xorg does not understand most of the arguments, just
only -dpi.

> - xserver: introduced MOUSE variable for "-mouse" argument (KDrive only)
Or KDRIVE_MOUSE= in /etc/default/display?

> Most of patches were used to create 1.30 version which is available as 
> tarball from GPE project. But due to my fault this version is broken...
> 
> Today I pushed 1.30 into OE metadata with few other patches which are 
> expected to fix errors left in 1.30 release. It was not too much tested 
> on devices so beware if your target do not works properly with it.
> 
> In short my patching ideas were:
> 
> - set DPI in separate variable instead of being part of ARGS
>   + some devices needs only DPI setting
>   + default ARGS are usually fine for devices
> - use /etc/default/xserver for setting ARGS/DPI for new devices
>   + no need to patch Xserver anymore
>   + easy to tweak on device itself

Yes, it's a good idea.

> - xmodmap stuff should be machine dependent so only one xmodmap is
>   present on device

Yes, and skip checks for platform in 12keymap

>   (this part was not done yet)

Agree, but:

- the keymap-fixup multiple load hack should be moved to kdrive >= 1.4
packages.

- XKB-less kdrive installations may even live completely without X
keyboard map

- Xorg installations may live without calling xmodmap explicitly

Other notes:

setdpi looks like a black magic, making X resources file machine
specific would make more sense

40xmodmap. What is the purpose? Which platform has /proc/hal?

01xrandr (set the default default orientation) seems to be obsolete

> - zaurusd, devmand should provide session scripts instead of being
>   called from Ts_calibrate script
>   (this part was not done yet)

zaurusd should be started during boot. There is no need to start it in X
session scripts (well, the way zaurusd accesses DISPLAY is incredibly
ugly). I don't know devmand.

> I would like other developers to use it and test does it work on their 
> devices.
> 
> In future I would like to add support for using "xinit" in 
> /etc/X11/Xserver so 'xserver-common' package could be used for rootmode 
> X11 systems (which would eliminate 'xserver-kdrive-common' package).
> 
> What do you think about it?

Yes, everything that gets rid mix of common code, platform specific
hacks, hardware specific hacks and software specific hacks makes a lot
of sense.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



