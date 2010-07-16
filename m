Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1OZfAD-0007Gj-QM
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 09:16:57 +0200
Received: (qmail 7975 invoked by uid 813007); 16 Jul 2010 07:16:49 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 16 Jul 2010 07:16:49 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jul 2010 09:17:05 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.35-6-generic; KDE/4.4.92; x86_64; ; )
References: <1279227362-6279-1-git-send-email-fransmeulenbroeks@gmail.com>
In-Reply-To: <1279227362-6279-1-git-send-email-fransmeulenbroeks@gmail.com>
MIME-Version: 1.0
Message-Id: <201007160917.07949.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,PLING_QUERY,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] binutils: added COMPATIBLE_TARGET_SYS = "(?!nios2)"
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
X-List-Received-Date: Fri, 16 Jul 2010 07:16:57 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia czwartek, 15 lipca 2010 o 22:56:02 Frans Meulenbroeks napisa=C5=82(a):
> added COMPATIBLE_TARGET_SYS =3D "(?!nios2)" to all versions
> that do not support nios2.
>=20
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> Once accepted I will remove the pinning from nios2.inc
>=20
> Frans
>=20
>  recipes/binutils/binutils_2.14.90.0.6.bb      |    2 ++
>  recipes/binutils/binutils_2.14.90.0.7.bb      |    2 ++
>  recipes/binutils/binutils_2.15.94.0.1.bb      |    2 ++
>  recipes/binutils/binutils_2.16.1.bb           |    2 ++
>  recipes/binutils/binutils_2.16.91.0.6.bb      |    2 ++
>  recipes/binutils/binutils_2.16.91.0.7.bb      |    2 ++
>  recipes/binutils/binutils_2.16.bb             |    2 ++
>  recipes/binutils/binutils_2.17.50.0.1.bb      |    2 ++
>  recipes/binutils/binutils_2.17.50.0.5.bb      |    2 ++
>  recipes/binutils/binutils_2.17.50.0.8.bb      |    2 ++
>  recipes/binutils/binutils_2.17.bb             |    2 ++
>  recipes/binutils/binutils_2.18.50.0.7.bb      |    2 ++
>  recipes/binutils/binutils_2.18.atmel.1.0.1.bb |    2 ++
>  recipes/binutils/binutils_2.18.bb             |    2 ++
>  recipes/binutils/binutils_2.19.1.bb           |    2 ++
>  recipes/binutils/binutils_2.19.51.0.3.bb      |    2 ++
>  recipes/binutils/binutils_2.19.51.bb          |    2 ++
>  recipes/binutils/binutils_2.19.bb             |    2 ++
>  recipes/binutils/binutils_2.20.bb             |    2 ++
>  recipes/binutils/binutils_cvs.bb              |    2 ++
>  20 files changed, 40 insertions(+), 0 deletions(-)

Maybe instead of populating so many files set it in binutils.inc (so all=20
version will be marked as incompatible) and then set COMPATIBLE_TARGET_SYS=
=3D""=20
in version which is compatible.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




