Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1NaFyy-0000jt-Kk
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jan 2010 23:03:31 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 63E411400BDA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2010 23:03:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jm31STxdflSv
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2010 23:03:51 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 35592140973E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2010 23:03:51 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Jan 2010 23:02:38 +0100
Message-Id: <1264629758.8244.95.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.0 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] Koen Kooi: gtk+ 2.18.3: enable xkb for angstrom
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
X-List-Received-Date: Wed, 27 Jan 2010 22:03:31 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Thanks for enabling XKB.

I was thinking about a more complicated solution in distro config, but
did not yet implement it.


Maybe doing the reverse (enable XKB for everything except listed
distributions) would be better:


1. GTK+ works correctly without enabling XKB only:
- If the system has no keyboard
or
- If the system uses xserver-kdrive-1.3.0.0
and
- Nobody uses this GTK+ on a remote XKB capable display.

Later kdrive versions have problems with keyboard
(see /etc/X11/Xinit.d/98keymap-fixup). Maybe it has something to do with
optional-xkb.patch.

Note that enabling XKB in GTK+ does not add large amount of code
(several hundreds of lines).


2. xserver-common hardcodes many xmodmap calls in /etc/init.d/Xinit.d.
It surely breaks the default XKB keymap.

Thinking about it, maybe something like directory /etc/machine/xorg,
/etc/machine/kdrive etc., where /etc/machine may be created by a
separate package or a symlink configured during the first boot would be
better than calling MACHINE=`awk 'BEGIN { FS=": " } /Hardware/ { print
$2 } ' </proc/cpuinfo` ten times.
(Well, the packaging time solution may have files inside /etc/default
or /etc/sysconfig.)


Note:
1. also affects:
xorg-app/xdpyinfo
xorg-app/xset
xorg-lib/libxt



________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



