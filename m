Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NANKR-00034U-0P
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Nov 2009 13:38:42 +0100
Received: (qmail 12088 invoked by uid 813007); 17 Nov 2009 12:37:17 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 17 Nov 2009 12:37:17 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Nov 2009 13:37:17 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc5-00402-gb6727b1; KDE/4.3.2; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <200911171337.35127.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: RFC: Geode machines support changes
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
X-List-Received-Date: Tue, 17 Nov 2009 12:38:42 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable


Hi

Currently .dev tree supports AMD GeodeGX and GeodeLX based machines:

=2D "geodegx"        - generic config
=2D "iei-nanogx-466" - IEI Nano GX-466

=2D "geodelx"        - generic config
=2D "alix"           - PC Engines Alix 1c/d mainboard
=2D "xo"             - OLPC XO v1

=46or "geodegx" we have linux-geodegx-2.4.24 kernel which was added with=20
machine. Looks like no one use it and we got linux-2.6.31 update some time =
ago=20
from Petr =C5=A0tetiar (who works on "iei-nanogx-466" SBC). Update needs to=
 be=20
selected in machine config anyway and is not yet building.

=46or "geodelx" we use linux-geodelx-2.6.11 which also was added with machi=
ne.=20
Other good device with this CPU is "alix" which is now set to linux-2.6.25 =
as=20
I did not booted this board for quite long time. OLPC is 3rd device with th=
is=20
CPU which we support.

GeodeLX processor is i586 class. Has MMX, 3Dnow and few other flags from th=
at=20
family. We treat it as i486 anyway as someone noted that they are faster th=
at=20
way.

I would like to do few changes:

1. drop "geodelx" kernel and machine config.
2. rename "alix" to "geodelx" and use Alix defconfig
3. move all target related flags from machine configs to tune-geode.inc
   - TARGET_ARCH
   - glibc tune (GLIBC_ADDONS, GLIBC_EXTRA_OECONF)

Then we can consider changing TARGET_ARCH to i586 for Geode machines.

Opinions? suggestions?

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




