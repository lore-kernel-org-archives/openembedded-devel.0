Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 11B776B7AD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2014 05:35:17 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id jt11so4308801pbb.25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 21:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:message-id:mime-version:subject:date:references
	:to:in-reply-to;
	bh=Tyj56+BnmwHIrpvJBJMuw4kLOhBD44iN+zVqX0Bt2ao=;
	b=WWroCRsqUWPpUQE2BvWX75T3qCrKzATbOiu9AyQ2vDgEIZnAej0qgjDvoA44/1RVAa
	FMOa6Yl5xGXk0taG9CJAQJP90c1o+vjMM/q43mobS0HbkHrPQNQfWVXvwPKl4sIcPVNt
	52XcWG7vNRO2gF1raocif7CbfBjevnjFKDGXveA+uLOTZ4UI6bNexdaOIX11sZ92GNQa
	isftIfOyoY5dD0up1Re5NkiaHLicSfBUErTxhFSa+2+QrlTfmNFdKCib2NH1MGTM/4HT
	AqT4FxAYh3x1UoG5mdr0A7uTiO7HguB01Ak8RCnbIBB5TMP/YOXjsAIL8sZYyobWKzBB
	gFlg==
X-Received: by 10.69.20.11 with SMTP id gy11mr13470608pbd.64.1393047318527;
	Fri, 21 Feb 2014 21:35:18 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	ac5sm27243013pbc.37.2014.02.21.21.35.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 21 Feb 2014 21:35:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <82327528-6272-46BB-A91A-847762280752@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
Date: Fri, 21 Feb 2014 21:35:15 -0800
References: <1393047007-20507-1-git-send-email-armccurdy@gmail.com>
	<1393047007-20507-2-git-send-email-armccurdy@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
In-Reply-To: <1393047007-20507-2-git-send-email-armccurdy@gmail.com>
X-Mailer: Apple Mail (2.1827)
Subject: Re: [meta-qt5][PATCH v2 2/2] qtwebkit-examples: add RDEPENDS for ca-certificates
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
X-List-Received-Date: Sat, 22 Feb 2014 05:35:18 -0000
X-Groupsio-MsgNum: 48262
Content-Type: multipart/signed;
	boundary="Apple-Mail=_908C7EF1-635D-4D33-8ED1-ED9ACB827C25";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_908C7EF1-635D-4D33-8ED1-ED9ACB827C25
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


On Feb 21, 2014, at 9:30 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> If qtbase is configured with openssl support then the
> qtwebkit browser example apps require CA certificates.

looks ok now

>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
> recipes-qt/qt5/qt5.inc               | 2 ++
> recipes-qt/qt5/qtbase.inc            | 2 +-
> recipes-qt/qt5/qtwebkit-examples.inc | 1 +
> 3 files changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
> index 7e739c5..e2a1662 100644
> --- a/recipes-qt/qt5/qt5.inc
> +++ b/recipes-qt/qt5/qt5.inc
> @@ -7,6 +7,8 @@ inherit qmake5
> ICU =3D "icu "
> ICU_powerpc =3D "pango"
>=20
> +PACKAGECONFIG_OPENSSL ?=3D "openssl"
> +
> QT_MODULE ?=3D "${BPN}"
>=20
> # we don't want conflicts with qt4
> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index 6a0149a..d805c47 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -47,7 +47,7 @@ PACKAGECONFIG ??=3D " \
>     udev \
>     evdev \
>     widgets \
> -    openssl \
> +    ${PACKAGECONFIG_OPENSSL} \
>     ${PACKAGECONFIG_GL} \
>     ${PACKAGECONFIG_FB} \
>     ${PACKAGECONFIG_X11} \
> diff --git a/recipes-qt/qt5/qtwebkit-examples.inc =
b/recipes-qt/qt5/qtwebkit-examples.inc
> index 50c28cd..84f16a4 100644
> --- a/recipes-qt/qt5/qtwebkit-examples.inc
> +++ b/recipes-qt/qt5/qtwebkit-examples.inc
> @@ -10,3 +10,4 @@ SRC_URI +=3D " \
>=20
> DEPENDS +=3D "qtwebkit"
> RDEPENDS_${PN}-examples +=3D "qtwebkit-qmlplugins"
> +RDEPENDS_${PN}-examples +=3D =
"${@base_contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates', =
'', d)}"
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_908C7EF1-635D-4D33-8ED1-ED9ACB827C25
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMINxQACgkQuwUzVZGdMxSMkwCfUW0WWAraElweXsIdio3jwKOd
+a0An1mCyaFIVpI6X4MjmmcPzOAWHtdY
=DMva
-----END PGP SIGNATURE-----

--Apple-Mail=_908C7EF1-635D-4D33-8ED1-ED9ACB827C25--
