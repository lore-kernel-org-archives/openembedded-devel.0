Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NpMdw-0002ZH-0h
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 15:12:16 +0100
Received: (qmail 25035 invoked by uid 813007); 10 Mar 2010 14:09:15 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 10 Mar 2010 14:09:15 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Mar 2010 15:08:33 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc7-00064-gac73fdd; KDE/4.4.1; x86_64; ;
	)
References: <20100310135425.31263.61632.stgit@ES-J7S4D2J.amer.consind.ge.com>
In-Reply-To: <20100310135425.31263.61632.stgit@ES-J7S4D2J.amer.consind.ge.com>
MIME-Version: 1.0
Message-Id: <201003101508.35525.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add Freescale P2020DS Demo Board
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
X-List-Received-Date: Wed, 10 Mar 2010 14:12:17 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia =C5=9Broda, 10 marca 2010 o 14:54:25 Martyn Welch napisa=C5=82(a):
> --- a/recipes/linux/linux_2.6.33.bb
> +++ b/recipes/linux/linux_2.6.33.bb
> @@ -2,9 +2,14 @@ require linux.inc
> =20
>  # Mark archs/machines that this kernel supports
>  DEFAULT_PREFERENCE =3D "-1"
> +DEFAULT_PREFERENCE_p2020ds =3D "1"
> =20
>  SRC_URI =3D
> "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/${P}.tar.bz2;name=3Dkernel \
> file://defconfig"
> =20
>  SRC_URI[kernel.md5sum] =3D "c3883760b18d50e8d78819c54d579b00"
>  SRC_URI[kernel.sha256sum] =3D
> "63e237de3b3c4c46a21833b9ce7e20574548d52dabbd1a8bf376041e4455d5c6" +
> +do_configure_p2020ds() {
> +       oe_runmake mpc85xx_defconfig
> +}

OE policy is to keep defconfig inside of OE tree. Please add mpc85xx_defcon=
fig=20
as recipes/linux/linux-2.6.33/p2020ds/defconfig and resubmit.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




