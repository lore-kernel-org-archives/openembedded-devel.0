Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 036DD65CA7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Aug 2014 09:19:43 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id bs8so671987wib.14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Aug 2014 02:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dEVkMPHmUfG3qAJokLU9IEvzbaXX4yGPCPDSTQC6Pj0=;
	b=OadzYfU69+gwM1/NtwG6MIK0LjjEj5S+BhGWIgI5sIoshw4+ywz1DFM8zkqhH7LMI7
	WYdMc0BFY4WmOUWAyGyIt4K0IvCKVSlBRALmVDFMD9GC/nsly+grs+wQeTScl/Cxy3EW
	kZkjlni/Rdxb3dQqCnQMDXgFWp75movVEV5bXND9KZnayTvm6egcii1MzwFzMLHXwAJa
	5tYOgHpyfd6o0jD1Rd+kdtkpfvRl/eezEjQ19tIJUATCv9U5Mg3om2ex7HqbRj+Zxsma
	ojATnBLKeUevxbxbFum+XUA396PTwIOmf3mJbrdwJxzYTZ7u7UFxwe1fwifmU1M+p/nd
	bmpQ==
X-Received: by 10.180.189.4 with SMTP id ge4mr2819970wic.25.1407489584613;
	Fri, 08 Aug 2014 02:19:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f6sm15980437wja.25.2014.08.08.02.19.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Aug 2014 02:19:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 8 Aug 2014 11:20:15 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140808092015.GA14848@jama>
References: <1407329735-31105-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1407329735-31105-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] libwmf: use pkgconfig for freetype
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
X-List-Received-Date: Fri, 08 Aug 2014 09:19:51 -0000
X-Groupsio-MsgNum: 51493
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0FWGRsEUTYx4i2U9"
Content-Disposition: inline

--0FWGRsEUTYx4i2U9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2014 at 02:55:35PM +0200, Koen Kooi wrote:
> And while we're at it list freetype in DEPENDS as well.
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  ...001-configure-use-pkg-config-for-freetype.patch | 67 ++++++++++++++++=
++++++
>  meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb  | 11 ++--
>  2 files changed, 73 insertions(+), 5 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/0001-configure=
-use-pkg-config-for-freetype.patch
>=20
> diff --git a/meta-oe/recipes-extended/libwmf/libwmf/0001-configure-use-pk=
g-config-for-freetype.patch b/meta-oe/recipes-extended/libwmf/libwmf/0001-c=
onfigure-use-pkg-config-for-freetype.patch
> new file mode 100644
> index 0000000..0f133e2
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libwmf/libwmf/0001-configure-use-pkg-confi=
g-for-freetype.patch
> @@ -0,0 +1,67 @@
> +From 61655f82224cadb261e81f8bae111eaaa7bdf531 Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Wed, 6 Aug 2014 14:53:03 +0200
> +Subject: [PATCH] configure: use pkg-config for freetype
> +
> +Upstream-status: Pending
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> + configure.ac | 37 ++++++++-----------------------------
> + 1 file changed, 8 insertions(+), 29 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 3cfe974..0055a8c 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -399,40 +399,19 @@ AC_ARG_WITH(freetype,[  --with-freetype=3DDIR     =
use freetype2 in DIR],[
> + 	fi
> + ])
> +=20
> +-if [ test -n "$FREETYPE_DIR" ]; then
> +-	AC_PATH_PROG(FREETYPE_CONFIG,freetype-config, ,[$FREETYPE_DIR/bin:$PAT=
H])
> +-else
> +-	AC_PATH_PROG(FREETYPE_CONFIG,freetype-config)
> +-fi
> +-
> +-if [ test -n "$FREETYPE_CONFIG" ]; then
> +-	if [ test -n "$FREETYPE_DIR" ]; then
> +-		freetype_cflags=3D"`$FREETYPE_CONFIG --cflags` -I$FREETYPE_DIR/includ=
e"
> +-		freetype_libs=3D`$FREETYPE_CONFIG --libs`
> +-	else
> +-		freetype_cflags=3D`$FREETYPE_CONFIG --cflags`
> +-		freetype_libs=3D`$FREETYPE_CONFIG --libs`
> +-	fi
> +-else
> +-	if [ test -n "$FREETYPE_DIR" ]; then
> +-		freetype_cflags=3D"-I$FREETYPE_DIR/include/freetype2 -I$FREETYPE_DIR/=
include"
> +-		freetype_libs=3D"-L$FREETYPE_DIR/lib -lfreetype"
> +-	else
> +-		freetype_cflags=3D""
> +-		freetype_libs=3D"-lfreetype"
> +-	fi
> +-fi
> +-
> +-CPPFLAGS=3D"$freetype_cflags $CPPFLAGS"
> +-LDFLAGS=3D"$LDFLAGS $freetype_libs"
> ++PKG_CHECK_MODULES(FREETYPE2, freetype2,=20
> ++    CFLAGS=3D"$CFLAGS $FREETYPE2_CFLAGS"
> ++    LDFLAGS=3D"$LDFLAGS $FREETYPE2_LIBS",
> ++    AC_MSG_ERROR([*** Unable to find FreeType2 library (http://www.free=
type.org/)])
> ++)
> +=20
> + AC_CHECK_LIB(freetype,FT_Init_FreeType,[
> +-	WMF_FT_LDFLAGS=3D"$freetype_libs"
> ++	WMF_FT_LDFLAGS=3D"$FREETYPE2_LIBS"
> + ],[	AC_MSG_ERROR([* * * freetype(2) is required * * *])
> + ])
> + AC_CHECK_HEADER(ft2build.h,[
> +-	WMF_FT_CFLAGS=3D"$freetype_cflags"
> +-	WMF_FT_CONFIG_CFLAGS=3D"$freetype_cflags"
> ++	WMF_FT_CFLAGS=3D"$FREETYPE2_CFLAGS"
> ++	WMF_FT_CONFIG_CFLAGS=3D"$FREETYPE2_CFLAGS"
> + ],[	AC_MSG_ERROR([* * * freetype(2) is required * * *])
> + ])
> +=20
> +--=20
> +1.9.0
> +
> diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb b/meta-oe/=
recipes-extended/libwmf/libwmf_0.2.8.4.bb
> index 9f88ded..746c4bd 100644
> --- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
> +++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
> @@ -7,10 +7,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba=
36caa9b7df079bae19f"
> =20
>  PR =3D "r3"
> =20
> -PNBLACKLIST[libwmf] =3D "BROKEN: needs to be updated to use freetype2 pk=
g-config instead of freetype-config"
> -
> -DEPENDS_virtclass-native =3D "libpng-native jpeg-native"
> -DEPENDS =3D "libpng jpeg expat gtk+"
> +DEPENDS_virtclass-native =3D "freetype-native libpng-native jpeg-native"
> +DEPENDS =3D "freetype libpng jpeg expat gtk+"
> =20
>  BBCLASSEXTEND =3D "native"
> =20
> @@ -18,7 +16,10 @@ inherit autotools

Missing pkgconfig inherit, but I'll fix it before merging this one
(patched already in master-next).

> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/wvware/${BPN}/${PV}/${BPN}-${PV}.tar.=
gz;name=3Dtarball \
>             file://libwmf-0.2.8.4-intoverflow.patch \
> -           file://libwmf-0.2.8.4-useafterfree.patch"
> +           file://libwmf-0.2.8.4-useafterfree.patch \
> +           file://0001-configure-use-pkg-config-for-freetype.patch \
> +          "
> +
>  SRC_URI[tarball.md5sum] =3D "d1177739bf1ceb07f57421f0cee191e0"
>  SRC_URI[tarball.sha256sum] =3D "5b345c69220545d003ad52bfd035d5d6f4f075e6=
5204114a9e875e84895a7cf8"
> =20
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0FWGRsEUTYx4i2U9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPklk8ACgkQN1Ujt2V2gBxQwACfVg0/+cSrIV70zQ2E4UuzVWfO
E5oAnju+L/jyYiSq7vUnOoVLpL3ieMB2
=4DW5
-----END PGP SIGNATURE-----

--0FWGRsEUTYx4i2U9--
