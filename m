Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7DA9A731AA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 11:48:58 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id p187so61023411wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 03:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=X3YnmLj2p6Pn5Vj2cpbUHj+MVykofTQsGuZHfAJ+7qE=;
	b=PGEW1Hz6ukxlLyIL7XPIrGa5lI0bnlRpDweLklWx2CvvggOFrfHogkBJMDooFbQdO+
	OpU1hzFxk4RGbl8h/xdCnxDHcLVh/zRoAVNvGe4FUYKt8IbF3g6B9/0LdMeytdwGrAkb
	hff3Gw9WdzpwpafP84b+P7r0Xmcx6gm2tAMbm41Xq29BihcodilXMTdR+xj0buXtthy1
	jThf5E8WSPCs8RifQ7Vgr5Duv9iMeKY92+EqSOZedfHLUEeleKYawZfLIAOor6LY3Z2H
	xL/WgyloZNVRZCdp4FUh9qLcIGpxZN1xlrnv2Eiu5s48ihfr5/824LAlsx2HU3S6LEfe
	6pcg==
X-Received: by 10.194.173.233 with SMTP id bn9mr3540126wjc.1.1450439338869;
	Fri, 18 Dec 2015 03:48:58 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l20sm6372027wmd.20.2015.12.18.03.48.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Dec 2015 03:48:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Dec 2015 12:51:29 +0100
To: Trevor Woerner <twoerner@gmail.com>
Message-ID: <20151218115129.GE2563@jama>
References: <1448993965-32226-1-git-send-email-twoerner@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1448993965-32226-1-git-send-email-twoerner@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] nodejs: cleanup and update
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Dec 2015 11:48:59 -0000
X-Groupsio-MsgNum: 59095
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IU5/I01NYhRvwH70"
Content-Disposition: inline

--IU5/I01NYhRvwH70
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 01, 2015 at 01:19:25PM -0500, Trevor Woerner wrote:
> Remove old nodejs_0.4.12 and update nodejs_0.12.7 to the latest stable
> nodejs_4.2.2.

It does something strange with CC and ends with invalid parameter for
qemuarm:

arm-oe-linux-gnueabi-g++: error: unrecognized argument in option '-mfpu=3Dv=
fpv2'

http://errors.yoctoproject.org/Errors/Details/22678/

>=20
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  .../nodejs/nodejs4/libev-cross-cc_0.4.12.patch     | 13 ------
>  meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb  | 49 ----------------=
------
>  .../nodejs/{nodejs_0.12.7.bb =3D> nodejs_4.2.2.bb}   |  6 +--
>  3 files changed, 3 insertions(+), 65 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-c=
c_0.4.12.patch
>  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_0.12.7.bb =3D> nodejs_4.2=
=2E2.bb} (93%)
>=20
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-cc_0.4.1=
2.patch b/meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-cc_0.4.12.pat=
ch
> deleted file mode 100644
> index 2b9838f..0000000
> --- a/meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-cc_0.4.12.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -diff --git a/deps/libev/wscript b/deps/libev/wscript
> -index 4f6c9a8..1796749 100644
> ---- a/deps/libev/wscript
> -+++ b/deps/libev/wscript
> -@@ -58,7 +58,7 @@ def configure(conf):
> -           return 0;
> -       }
> -   """
> --  conf.check_cc(fragment=3Dcode, define_name=3D"HAVE_CLOCK_SYSCALL", ex=
ecute=3DTrue,
> -+  conf.check_cc(fragment=3Dcode, define_name=3D"HAVE_CLOCK_SYSCALL", ex=
ecute=3DFalse,
> -                 msg=3D"Checking for SYS_clock_gettime")
> -=20
> -   have_librt =3D conf.check(lib=3D'rt', uselib_store=3D'RT')
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs4_0.4.12.bb
> deleted file mode 100644
> index c73cefc..0000000
> --- a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -SUMMARY =3D "nodeJS Evented I/O for V8 JavaScript"
> -HOMEPAGE =3D "http://nodejs.org"
> -LICENSE =3D "MIT & Zlib"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd6237f3a840aef5b7880fb4e49eec=
fe5"
> -
> -DEPENDS =3D "openssl"
> -
> -PNBLACKLIST[nodejs4] ?=3D "Used only by currently blacklisted cloud9 and=
 fails to build for qemuarm with thumb: error: #error For thumb inter-worki=
ng we require an architecture which supports blx"
> -
> -SRC_URI =3D " \
> -    http://nodejs.org/dist/node-v${PV}.tar.gz \
> -    file://libev-cross-cc_${PV}.patch \
> -"
> -SRC_URI[md5sum] =3D "a6375eaa43db5356bf443e25b828ae16"
> -SRC_URI[sha256sum] =3D "c01af05b933ad4d2ca39f63cac057f54f032a4d83cff8711=
e42650ccee24fce4"
> -
> -S =3D "${WORKDIR}/node-v${PV}"
> -
> -# v8 errors out if you have set CCACHE
> -CCACHE =3D ""
> -
> -do_configure () {
> -    sed -i -e 's:/usr/lib:${STAGING_LIBDIR}:g' wscript
> -    sed -i -e 's:/usr/local/lib:${STAGING_LIBDIR}:g' wscript
> -    ./configure --prefix=3D${prefix} --without-snapshot
> -}
> -
> -do_compile () {
> -    make
> -}
> -
> -do_install () {
> -    oe_runmake install DESTDIR=3D${D}
> -
> -    # fix namespace conflicts with other nodejs recipes
> -    mv ${D}${bindir}/node ${D}${bindir}/node4
> -    mv ${D}${bindir}/node-waf ${D}${bindir}/node4-waf
> -
> -    mv ${D}${includedir}/node ${D}${includedir}/node4
> -
> -    mv ${D}${libdir}/node ${D}${libdir}/node4
> -    mv ${D}${libdir}/pkgconfig/nodejs.pc ${D}${libdir}/pkgconfig/nodejs4=
=2Epc
> -    sed -i -e s:include/node:include/node4: ${D}${libdir}/pkgconfig/node=
js4.pc
> -
> -    mv ${D}${datadir}/man/man1/node.1 ${D}${datadir}/man/man1/node4.1
> -}
> -
> -FILES_${PN} +=3D "${libdir}/node4/wafadmin"
> -BBCLASSEXTEND =3D "native"
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb b/meta-oe/r=
ecipes-devtools/nodejs/nodejs_4.2.2.bb
> similarity index 93%
> rename from meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs_4.2.2.bb
> index 41eb5ee..2ca2403 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.2.2.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
>  HOMEPAGE =3D "http://nodejs.org"
>  LICENSE =3D "MIT & BSD & Artistic-2.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D14115ff11211df04b031ec7d40b6d=
31b"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dee90ba97d933fc8d56e97812b7dd6=
2e9"
> =20
>  DEPENDS =3D "openssl"
> =20
> @@ -9,8 +9,8 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.ta=
r.gz \
>      file://enable-armv5e-build.patch \
>      file://no-registry.patch \
>  "
> -SRC_URI[md5sum] =3D "5523ec4347d7fe6b0f6dda1d1c7799d5"
> -SRC_URI[sha256sum] =3D "b23d64df051c9c969b0c583f802d5d71de342e53067127a5=
061415be7e12f39d"
> +SRC_URI[md5sum] =3D "7c46c158e4c9a44cfbd039951c13dfe6"
> +SRC_URI[sha256sum] =3D "00e709353435b436b5bbf5e62272ebb15fe801065422c4c2=
afe2b93456210cb1"
> =20
>  S =3D "${WORKDIR}/node-v${PV}"
> =20
> --=20
> 2.6.0.rc3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IU5/I01NYhRvwH70
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZz80EACgkQN1Ujt2V2gBxBmACcCcy4cGHCRHXKMKyRxyTrao+H
Iy8AoIAKokunJkBDZznQJtvuNdj6Izjg
=pLsB
-----END PGP SIGNATURE-----

--IU5/I01NYhRvwH70--
