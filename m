Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1NUpli-0005GV-HX
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 00:03:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 63D6514018AE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 00:03:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jsqQCn0p8hh1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 00:03:16 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 347731416BA8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 00:03:16 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Jan 2010 00:01:30 +0100
Message-Id: <1263337290.13906.27.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.0 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: GTK+, disabled XKB a.k.a. why keymaps/ModeSwitch don't work well in GPE or XFCE
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
X-List-Received-Date: Tue, 12 Jan 2010 23:03:26 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Hallo.

We just spent some time by debugging of an annoying bug - broken
Mode_Switch key in GPE and XFCE.

Surprisingly, the problem affects only GTK+ applications and it is
caused by --disable-xkb configure options in OE gtk+ recipes(*).

It
- made impossible to upgrade to the new version of kdrive on Zaurus
- now makes impossible to upgrade to Xorg on Zaurus
- causes keyboard breakage on Always Innovating Touch Book.
  http://bugzilla.alwaysinnovating.com/show_bug.cgi?id=41

So there is a question: Why XKB is disabled in OE GTK+? Does it have any
reason or it is a relict from the ancient age of kdrive based
systems(**)? If it is true, I propose a patch to remove --disable-xkb
not only from gtk+, but also all xorg-app and xorg-lib, or at least move
this option to distribution configuration.

Distributions that want to stay with XKB disabled probably want to use
xserver-kdrive <= 1.3.0.0. (Well, maybe newer kdrives can disable xkb as
well, but it caused strange problems on device with keyboard (keyboard
map required more tries before its loading succeeded, broken Mode_Switch
etc.).)

(*) Yes, it seems that there is either a bug while XKB-incapable GTK+
runs on XKB-capable X server, or there is a problem of combination of
XKB capable and incapable libraries, but it should not affect the
decision.

(**) If there is a demand, it is still possible to create gtk
+-xkb-less_*.bb recipes and build both variants.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



