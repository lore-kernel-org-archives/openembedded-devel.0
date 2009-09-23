Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MqZJw-0002Bo-5s
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Sep 2009 23:24:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 5D673140972C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2009 23:17:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2ZVKTqRuSVQ
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2009 23:17:54 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 34AAA1416BA8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2009 23:17:53 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Sep 2009 23:23:38 +0200
Message-Id: <1253741018.5229.23.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: functional Matchbox2 in oe.dev
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
X-List-Received-Date: Wed, 23 Sep 2009 21:24:19 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hallo.

I just spent some time to make Matchbox2 working, as I considered is as
possible optimal solution for minimalistic GTK+/GPE based environment.

Resipes are now available in oe.dev. Just call bitbake matchbox2,
install and and enjoy. Read /etc/matchbox2/defaults and customize the
session script. And feel free to improve recipes.

There were several crashes, that made it unusable, and problems with the
icon theme. There is still a lot of things to do, but the code base is
now usable for the daily work.

The Matchbox2 code is almost minimalistic and easy to understand. But it
seems that upstream is recently almost dead (no response for submitted
patches, no activity in SVN for several months), so all fixes are now
added to OE as patches.

Benefits over Matchbox1:
- The whole panel is just one process.
- Application launcher should not generate 10 wake-ups per second.
- Based on standard GTK+ widgets, shares look and feel with GPE.
- Capable to share the same area for window title and panel (however the
  way, where window is border-less and the panel contains window
  operations applet {as some eee distros have} looks more smart).
- Panel and window manager handles XRandR well (not yet the desktop).
- Better handles new .desktop icon specification.

Window switching keys are now hardcoded: Alt+d, Alt+n, Alt+p. I guess
that Fn+something may be better. (I have been even using the Calendar
key on Zaurus, as I don't use PIM.)


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



