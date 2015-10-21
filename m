Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6D4FF769A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 16:52:04 +0000 (UTC)
Received: by wicfx6 with SMTP id fx6so100291810wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 09:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6G87RCKJaj7ysyDBBVtxd3yUiGT70uKamlf1CcAPGXk=;
	b=GHM7PN5OFlT8alPDE8w+h26RIXHbfAP2KLy0pL9tPAAaXe5hjlPszKP1cGMSuMjj4P
	0OJlS37FypUdGztTUl/8VuDpxonkIfEhiG3IHNbGGOHqgLID3HLVxH/9ehFfs8AzSDeg
	X3/e/4LIGkp/BztfoyLkV/7MBnqXcNv7l0tyvARNWvBopXbh1THwfZeHekX+X+2bGaej
	g9TlCBKiQlC4Xl3Zfn+AlT3ZMYoMGRlKKV3bObqHeVXMRrZx8FU66uI55o/mRMoqpK1g
	FVHLbWBEjWZnIW763tXqlSvnSyek9Eh/ekvx43e8GpNZ6A4kS6ikdfXpVFrQjEUv0/u/
	3CEw==
X-Received: by 10.194.24.100 with SMTP id t4mr13383096wjf.121.1445446323925;
	Wed, 21 Oct 2015 09:52:03 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id t7sm19287789wib.1.2015.10.21.09.52.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Oct 2015 09:52:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 21 Oct 2015 18:52:21 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151021165221.GG2556@jama>
References: <1445315359-30016-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1445315359-30016-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] luajit: Upgrade to 2.1 beta1
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
X-List-Received-Date: Wed, 21 Oct 2015 16:52:05 -0000
X-Groupsio-MsgNum: 57954
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nqkreNcslJAfgyzk"
Content-Disposition: inline

--nqkreNcslJAfgyzk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2015 at 09:29:19PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...p-automatically-this-leaves-the-stripping.patch | 33 ----------------=
------
>  .../luajit/{luajit_2.0.4.bb =3D> luajit_2.1.bb}      | 17 +++++------
>  2 files changed, 9 insertions(+), 41 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-st=
rip-automatically-this-leaves-the-stripping.patch
>  rename meta-oe/recipes-devtools/luajit/{luajit_2.0.4.bb =3D> luajit_2.1.=
bb} (74%)
>=20
> diff --git a/meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-aut=
omatically-this-leaves-the-stripping.patch b/meta-oe/recipes-devtools/luaji=
t/luajit/0001-Do-not-strip-automatically-this-leaves-the-stripping.patch
> deleted file mode 100644
> index f123b3f..0000000
> --- a/meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatica=
lly-this-leaves-the-stripping.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 528009f5ca0685c95ef27f6c8957160499c0576a Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 10 May 2013 10:42:45 -0700
> -Subject: [PATCH] Do not strip automatically, this leaves the stripping
> - busines to OE
> -
> -Upstream-Status: Inappropriate [OE-Specific]
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/Makefile |    2 --
> - 1 file changed, 2 deletions(-)
> -
> -diff --git a/src/Makefile b/src/Makefile
> -index 278324a..5ecd6d5 100644
> ---- a/src/Makefile
> -+++ b/src/Makefile
> -@@ -665,12 +665,10 @@ $(LUAJIT_A): $(LJVMCORE_O)
> - $(LUAJIT_SO): $(LJVMCORE_O)
> - 	$(E) "DYNLINK   $@"
> - 	$(Q)$(TARGET_LD) $(TARGET_ASHLDFLAGS) -o $@ $(LJVMCORE_DYNO) $(TARGET_=
ALIBS)
> --	$(Q)$(TARGET_STRIP) $@
> -=20
> - $(LUAJIT_T): $(TARGET_O) $(LUAJIT_O) $(TARGET_DEP)
> - 	$(E) "LINK      $@"
> - 	$(Q)$(TARGET_LD) $(TARGET_ALDFLAGS) -o $@ $(LUAJIT_O) $(TARGET_O) $(TA=
RGET_ALIBS)
> --	$(Q)$(TARGET_STRIP) $@
> - 	$(E) "OK        Successfully built LuaJIT"
> -=20
> - #######################################################################=
#######
> ---=20
> -1.7.9.5
> -
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb b/meta-oe/re=
cipes-devtools/luajit/luajit_2.1.bb
> similarity index 74%
> rename from meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
> rename to meta-oe/recipes-devtools/luajit/luajit_2.1.bb
> index 4a15a4e..ba439d0 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_2.1.bb
> @@ -3,13 +3,13 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D3992f1fbae3b8b061f9056b7fcd=
a8cc6"
>  HOMEPAGE =3D "http://luajit.org"
> =20
> -SRC_URI =3D "http://luajit.org/download/LuaJIT-${PV}.tar.gz \
> -           file://0001-Do-not-strip-automatically-this-leaves-the-stripp=
ing.patch \
> +SRCREV =3D "776c6935ed807fc3b1ee6cd89a0cf682ffb7e9de"
> +SRC_URI =3D "git://luajit.org/git/luajit-2.0.git;protocol=3Dhttp;branch=
=3Dv${PV} \
>  "
> -SRC_URI[md5sum] =3D "dd9c38307f2223a504cbfb96e477eca0"
> -SRC_URI[sha256sum] =3D "620fa4eb12375021bef6e4f237cbd2dd5d49e56beb414bee=
052c746beef1807d"
> =20
> -S =3D "${WORKDIR}/LuaJIT-${PV}"
> +SPIN =3D ".0-beta1"

This seems to break meta-oe/recipes-extended/sysdig/sysdig_git.bb

| -- Could NOT find Lua51 (missing:  LUA_LIBRARIES LUA_INCLUDE_DIR)
| CMake Error at CMakeLists.txt:116 (message):
|   Couldn't find system LuaJIT or Lua
|


> +
> +S =3D "${WORKDIR}/git"
> =20
>  inherit pkgconfig binconfig
> =20
> @@ -23,7 +23,7 @@ do_configure_prepend() {
>  EXTRA_OEMAKE =3D 'CROSS=3D${HOST_PREFIX} \
>                  TARGET_CFLAGS=3D"${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}" \
>                  TARGET_LDFLAGS=3D"${TOOLCHAIN_OPTIONS}" \
> -                TARGET_SHLDFLAGS=3D"${TOOLCHAIN_OPTIONS}"'
> +                TARGET_SHLDFLAGS=3D"${TOOLCHAIN_OPTIONS}" TARGET_STRIP=
=3D"/bin/echo"'
>  EXTRA_OEMAKE_append_powerpc =3D ' HOST_CC=3D"${BUILD_CC} -m32"'
>  EXTRA_OEMAKE_append_x86 =3D ' HOST_CC=3D"${BUILD_CC} -m32"'
>  EXTRA_OEMAKE_append_x86-64 =3D ' HOST_CC=3D"${BUILD_CC}"'
> @@ -36,7 +36,8 @@ do_compile () {
>  }
> =20
>  do_install () {
> -    oe_runmake 'DESTDIR=3D${D}' install
> +    oe_runmake 'DESTDIR=3D${D}' 'TARGET_STRIP=3D/bin/echo' install
> +    ln -s ${bindir}/${BPN}-${PV}${SPIN} ${D}${bindir}/luajit
>      rmdir ${D}${datadir}/lua/5.* \
>            ${D}${datadir}/lua \
>            ${D}${libdir}/lua/5.* \
> @@ -52,5 +53,5 @@ FILES_${PN}-dev +=3D "${libdir}/libluajit-5.1.a \
>      ${libdir}/libluajit-5.1.so \
>      ${libdir}/pkgconfig/luajit.pc \
>  "
> -FILES_luajit-common =3D "${datadir}/${BPN}-${PV}"
> +FILES_luajit-common =3D "${datadir}/${BPN}-${PV}${SPIN}"
> =20
> --=20
> 2.6.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nqkreNcslJAfgyzk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYnwsQACgkQN1Ujt2V2gBzRyACgrpCwO9PkavCE653nKVmkpIsv
sT8AoKJ8yIrw50AuqTpN6Kg29Q0lPVMp
=tJOA
-----END PGP SIGNATURE-----

--nqkreNcslJAfgyzk--
