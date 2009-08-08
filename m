Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MZlz9-0000Xj-UJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Aug 2009 15:29:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 9206E1417194
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Aug 2009 15:04:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U22lWcK5Tvhg
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Aug 2009 15:04:26 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 672581416BA9
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Aug 2009 15:04:26 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 08 Aug 2009 15:13:24 +0200
Message-Id: <1249737204.8277.22.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: libgtkstylus: working on new version
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
X-List-Received-Date: Sat, 08 Aug 2009 13:29:24 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hallo.

After a bit of learning of GTK+ event processing, I decided to improve
old version of libgtkstylus a bit.

Writing an event rewriting utility that does not break behavior of
application is a surprisingly complex task.

I would be glad if more people will test it before the release.

Current versions contains a critical asserts. Please report any console
output it application aborts on assert.

On devices with a broken noisy input driver (e. g. drivers for ADS7846,
Zaurus), configure with --enable-jitter-filter (read INSTALL for more).

Bug fixes:

New version never eats motion hints.

New features:

Right button emulation on Fn button is on by default

Middle button emulation on right Ctrl
On Zaurus it is recommended together with this addition in .profile:
if test -n "$DISPLAY" ; then
xmodmap - <<EOF
keycode 105 = Control_R
add mod5 = Control_R
EOF
fi

(You may easily change the modifier# in the source.)

New version suppresses or delays enter, leave and motion events when
stylus is not used. It is intended to prevent unwanted highlighting in
place of the last tap and suppress tooltips.

There are still several problems to fix, but version 0.4rc4 usability
seems to be comparable with version 0.3.

References:
http://ftp.penguin.cz/pub/users/utx/gtk-modules/


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



