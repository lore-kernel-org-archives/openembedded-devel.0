Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NAOem-0003XG-RR
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Nov 2009 15:03:49 +0100
Received: (qmail 29355 invoked by uid 813007); 17 Nov 2009 14:02:22 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 17 Nov 2009 14:02:22 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Nov 2009 15:02:39 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc5-00402-gb6727b1; KDE/4.3.2; x86_64; ;
	)
References: <200911171337.35127.marcin@juszkiewicz.com.pl>
In-Reply-To: <200911171337.35127.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
Message-Id: <200911171502.40498.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Geode machines support changes
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
X-List-Received-Date: Tue, 17 Nov 2009 14:03:49 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia wtorek, 17 listopada 2009 o 13:37:17 Marcin Juszkiewicz napisa=C5=82(a=
):

> GeodeLX processor is i586 class. Has MMX, 3Dnow and few other flags from
>  that family. We treat it as i486 anyway as someone noted that they are
>  faster that way.
>=20
> I would like to do few changes:
>=20
> 1. drop "geodelx" kernel and machine config.
> 2. rename "alix" to "geodelx" and use Alix defconfig
> 3. move all target related flags from machine configs to tune-geode.inc
>    - TARGET_ARCH
>    - glibc tune (GLIBC_ADDONS, GLIBC_EXTRA_OECONF)
  4. move "geodegx" to linux-2.6.31 with copy of "iei-nanogx-466" defconfig

> Then we can consider changing TARGET_ARCH to i586 for Geode machines.

I found one problem with it. Currently we have some geode machines as i586 =
and=20
some as i486 but packages are generated with "geode" arch each time. Same f=
or=20
tmp/cross/ dir etc. So we will need to decide for all devices at once.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




