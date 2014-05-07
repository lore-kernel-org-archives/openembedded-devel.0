Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id B634A605B2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 12:33:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,1003,1389740400"; d="scan'208";a="50840725"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 07 May 2014 14:33:25 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Wed, 7 May 2014 14:33:24 +0200
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.44]) by
	COSNADEXC12.usr.ingenico.loc ([10.31.4.212]) with mapi id
	14.02.0328.009; Wed, 7 May 2014 14:33:24 +0200
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] xdelta3: add optional lzma support
Thread-Index: AQHPae6nhKe4y7CyvkyHj5+hZg0hdps1DJLQ
Date: Wed, 7 May 2014 12:33:23 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050B9DBFEF05@COSNADEXC13.usr.ingenico.loc>
References: <1399463007-14787-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<lkd8cb$5n2$1@ger.gmane.org>
In-Reply-To: <lkd8cb$5n2$1@ger.gmane.org>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.2.97]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] xdelta3: add optional lzma support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 May 2014 12:33:27 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I understand that depending if lzma.h is previously installed or not, the r=
esult binary is different.
So you recommend to enable lzma ?

By the way, could you reexplain if I should write:
PACKAGECONFIG ?=3D "lzma"
Or
PACKAGECONFIG ??=3D "lzma"

Regards,
Matt


-----Message d'origine-----
De=A0: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedd=
ed-devel-bounces@lists.openembedded.org] De la part de Koen Kooi
Envoy=E9=A0: mercredi 7 mai 2014 14:19
=C0=A0: openembedded-devel@lists.openembedded.org
Objet=A0: Re: [oe] [meta-oe][PATCH] xdelta3: add optional lzma support

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Matthieu Crapet schreef op 07-05-14 13:43:
> Using PACKAGECONFIG. Disabled by default.
>=20
> Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com> ---=20
> meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb | 4 ++++ 1 file=20
> changed,
> 4 insertions(+)
>=20
> diff --git a/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb
> b/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb index=20
> 16a72ee..f3b4754
> 100644 --- a/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb +++=20
> b/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb @@ -13,3 +13,7 @@=20
> SRC_URI[md5sum] =3D "c3ae3286ce4193de8e03d5bcaccf3bc3"=20
> SRC_URI[sha256sum] =3D "3a86f29c95664fb44b8a40ff22d9bcc3e87aa8c01f0ff7593=
1a7fa78ed3d2e55"
>=20
> inherit autotools + +# Optional secondary compression +PACKAGECONFIG=20
> ?=3D "" +PACKAGECONFIG[lzma] =3D ",,xz"

If there's not configure switch for it, add it to DEPENDS to avoid suprises=
.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTaiTLMkyGM64RGpERAglxAKCBVh+CyLipm+C+VJeQFQ3UZc1LSQCfdeVH
3sFkaMpsdr6M977BEM4EVDQ=3D
=3DGnvt
-----END PGP SIGNATURE-----

--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

