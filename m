Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id D3B6E73D46
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Nov 2015 09:43:14 +0000 (UTC)
Received: by wmnn186 with SMTP id n186so94574822wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Nov 2015 01:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cg8FCCv4AVPZfSgNGIzPmwHzEpSmgc8jZyqedC42ybg=;
	b=fbjgglb6NN8z9o7Q8CxaKYYKH52tc9rUBlKSHlxDxB7I9/aGa+L+CiUYftOC+OcKV1
	6OBHUxvYH4RGtgpUlA1ukJWMsABh3wV6JIXJsqLkY9rQjgTL9OfGTws2dpziHbmZvwGI
	IHM+XIX2qDlNGS/LZz0a/LG7pmYdeDFakJga3tuEyz50Ax18fLlqLYdYFz7aSt4ECdYC
	13huk/PFlFiYI8XRVsUJBYohEEZ7V0tEvFATeqMDhUsTKkdQJy/B1apABVrvvqDtJeWj
	q997EscG/4UydXDl+RRfaK5d9qFAYjWkJxHUVAkIkq4wwTYxrKD1taM7ZuKpeEMgJD89
	/GQw==
X-Received: by 10.28.170.18 with SMTP id t18mr26234714wme.73.1447062193739;
	Mon, 09 Nov 2015 01:43:13 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	r9sm14400429wjz.35.2015.11.09.01.43.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Nov 2015 01:43:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 9 Nov 2015 10:43:17 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151109094317.GA2569@jama>
References: <1446980869-13083-1-git-send-email-Martin.Jansa@gmail.com>
	<CALbNGRQk84xAEK01=RAKK3vsY5X0CTqUUAD6Sb6GXqpMEDRswg@mail.gmail.com>
	<CA+chaQfyy2rFonPRt6v7_wML08JUCFWLnoRic2Rbr33LDiHnaQ@mail.gmail.com>
	<CAMKF1sow6gD0p7oaROFyV+yUmQ5jnfkZe0S6-Za0GwAc=nL=-A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sow6gD0p7oaROFyV+yUmQ5jnfkZe0S6-Za0GwAc=nL=-A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][meta-oe] Revert "luajit: Upgrade to 2.1 beta1"
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
X-List-Received-Date: Mon, 09 Nov 2015 09:43:18 -0000
X-Groupsio-MsgNum: 58415
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline

--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 08, 2015 at 07:41:28PM -0800, Khem Raj wrote:
> Martin
>=20
> The build failures are not due to luajit, they are due to lua itself
> being upgraded beyond 5.1 and its ABI incompatible. Its being
> highlighted
> by luajit 2.1 most probbably, If the lua 5.1 reintroduction patch has
> been applied then we can look into the fact that lua 5.1 is chosen for
> these packages.

It's failing with this commit even without lua 5.2 upgrade.

And it's beta anyway, so I would like to revert this for jethro branch
and then it can be re-applied in master when sysdig and devilspie are
working correctly with it, ok?

>=20
> and yes the 32bit host dependencies has always been a requirement for lua=
jit.
>=20
> On Sun, Nov 8, 2015 at 12:50 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > Was it needed for 2.0 as well? If yes, then I'll re-add it.
> >
> > On Sun, Nov 8, 2015 at 9:32 PM, Andreas M=FCller <schnitzeltony@googlem=
ail.com
> >> wrote:
> >
> >> On Sun, Nov 8, 2015 at 12:07 PM, Martin Jansa <martin.jansa@gmail.com>
> >> wrote:
> >> > This reverts commit 2ce3086aa859178fb5f7d6db9876229c8ed5a6eb.
> >> >
> >> > Causes sysdig and devilspie2 build failures.
> >> >
> >> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> > ---
> >> >  ...p-automatically-this-leaves-the-stripping.patch | 33 +++++++++++
> >> >  meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb    | 56
> >> ++++++++++++++++++
> >> >  meta-oe/recipes-devtools/luajit/luajit_2.1.bb      | 67
> >> ----------------------
> >> >  3 files changed, 89 insertions(+), 67 deletions(-)
> >> >  create mode 100644
> >> meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatically=
-this-leaves-the-stripping.patch
> >> >  create mode 100644 meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
> >> >  delete mode 100644 meta-oe/recipes-devtools/luajit/luajit_2.1.bb
> >> >
> >> > diff --git
> >> a/meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatical=
ly-this-leaves-the-stripping.patch
> >> b/meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatical=
ly-this-leaves-the-stripping.patch
> >> > new file mode 100644
> >> > index 0000000..f123b3f
> >> > --- /dev/null
> >> > +++
> >> b/meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatical=
ly-this-leaves-the-stripping.patch
> >> > @@ -0,0 +1,33 @@
> >> > +From 528009f5ca0685c95ef27f6c8957160499c0576a Mon Sep 17 00:00:00 2=
001
> >> > +From: Khem Raj <raj.khem@gmail.com>
> >> > +Date: Fri, 10 May 2013 10:42:45 -0700
> >> > +Subject: [PATCH] Do not strip automatically, this leaves the stripp=
ing
> >> > + busines to OE
> >> > +
> >> > +Upstream-Status: Inappropriate [OE-Specific]
> >> > +
> >> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > +---
> >> > + src/Makefile |    2 --
> >> > + 1 file changed, 2 deletions(-)
> >> > +
> >> > +diff --git a/src/Makefile b/src/Makefile
> >> > +index 278324a..5ecd6d5 100644
> >> > +--- a/src/Makefile
> >> > ++++ b/src/Makefile
> >> > +@@ -665,12 +665,10 @@ $(LUAJIT_A): $(LJVMCORE_O)
> >> > + $(LUAJIT_SO): $(LJVMCORE_O)
> >> > +       $(E) "DYNLINK   $@"
> >> > +       $(Q)$(TARGET_LD) $(TARGET_ASHLDFLAGS) -o $@ $(LJVMCORE_DYNO)
> >> $(TARGET_ALIBS)
> >> > +-      $(Q)$(TARGET_STRIP) $@
> >> > +
> >> > + $(LUAJIT_T): $(TARGET_O) $(LUAJIT_O) $(TARGET_DEP)
> >> > +       $(E) "LINK      $@"
> >> > +       $(Q)$(TARGET_LD) $(TARGET_ALDFLAGS) -o $@ $(LUAJIT_O)
> >> $(TARGET_O) $(TARGET_ALIBS)
> >> > +-      $(Q)$(TARGET_STRIP) $@
> >> > +       $(E) "OK        Successfully built LuaJIT"
> >> > +
> >> > +
> >> ######################################################################=
########
> >> > +--
> >> > +1.7.9.5
> >> > +
> >> > diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
> >> b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
> >> > new file mode 100644
> >> > index 0000000..4a15a4e
> >> > --- /dev/null
> >> > +++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
> >> > @@ -0,0 +1,56 @@
> >> > +SUMMARY =3D "Just-In-Time Compiler for Lua"
> >> > +LICENSE =3D "MIT"
> >> > +LIC_FILES_CHKSUM =3D
> >> "file://COPYRIGHT;md5=3D3992f1fbae3b8b061f9056b7fcda8cc6"
> >> > +HOMEPAGE =3D "http://luajit.org"
> >> > +
> >> > +SRC_URI =3D "http://luajit.org/download/LuaJIT-${PV}.tar.gz \
> >> > +
> >>  file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patc=
h \
> >> > +"
> >> > +SRC_URI[md5sum] =3D "dd9c38307f2223a504cbfb96e477eca0"
> >> > +SRC_URI[sha256sum] =3D
> >> "620fa4eb12375021bef6e4f237cbd2dd5d49e56beb414bee052c746beef1807d"
> >> > +
> >> > +S =3D "${WORKDIR}/LuaJIT-${PV}"
> >> > +
> >> > +inherit pkgconfig binconfig
> >> > +
> >> > +BBCLASSEXTEND =3D "native"
> >> > +
> >> > +do_configure_prepend() {
> >> > +    sed -i 's:PREFIX=3D /usr/local:PREFIX=3D ${prefix}:g' ${S}/Make=
file
> >> > +    sed -i 's:MULTILIB=3D lib:MULTILIB=3D ${baselib}:g' ${S}/Makefi=
le
> >> > +}
> >> > +
> >> > +EXTRA_OEMAKE =3D 'CROSS=3D${HOST_PREFIX} \
> >> > +                TARGET_CFLAGS=3D"${TOOLCHAIN_OPTIONS} ${HOST_CC_ARC=
H}" \
> >> > +                TARGET_LDFLAGS=3D"${TOOLCHAIN_OPTIONS}" \
> >> > +                TARGET_SHLDFLAGS=3D"${TOOLCHAIN_OPTIONS}"'
> >> > +EXTRA_OEMAKE_append_powerpc =3D ' HOST_CC=3D"${BUILD_CC} -m32"'
> >> > +EXTRA_OEMAKE_append_x86 =3D ' HOST_CC=3D"${BUILD_CC} -m32"'
> >> > +EXTRA_OEMAKE_append_x86-64 =3D ' HOST_CC=3D"${BUILD_CC}"'
> >> > +EXTRA_OEMAKE_append_powerpc64 =3D ' HOST_CC=3D"${BUILD_CC}"'
> >> > +EXTRA_OEMAKE_append_arm =3D ' HOST_CC=3D"${BUILD_CC} -m32"'
> >> > +EXTRA_OEMAKE_append_mips64 =3D ' HOST_CC=3D"${BUILD_CC} -m32"'
> >> > +
> >> > +do_compile () {
> >> > +    oe_runmake
> >> > +}
> >> > +
> >> > +do_install () {
> >> > +    oe_runmake 'DESTDIR=3D${D}' install
> >> > +    rmdir ${D}${datadir}/lua/5.* \
> >> > +          ${D}${datadir}/lua \
> >> > +          ${D}${libdir}/lua/5.* \
> >> > +          ${D}${libdir}/lua
> >> > +}
> >> > +
> >> > +PACKAGES +=3D 'luajit-common'
> >> > +
> >> > +FILES_${PN} +=3D "${libdir}/libluajit-5.1.so.2 \
> >> > +    ${libdir}/libluajit-5.1.so.${PV} \
> >> > +"
> >> > +FILES_${PN}-dev +=3D "${libdir}/libluajit-5.1.a \
> >> > +    ${libdir}/libluajit-5.1.so \
> >> > +    ${libdir}/pkgconfig/luajit.pc \
> >> > +"
> >> > +FILES_luajit-common =3D "${datadir}/${BPN}-${PV}"
> >> > +
> >> > diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.1.bb
> >> b/meta-oe/recipes-devtools/luajit/luajit_2.1.bb
> >> > deleted file mode 100644
> >> > index 5cee532..0000000
> >> > --- a/meta-oe/recipes-devtools/luajit/luajit_2.1.bb
> >> > +++ /dev/null
> >> > @@ -1,67 +0,0 @@
> >> > -SUMMARY =3D "Just-In-Time Compiler for Lua"
> >> > -LICENSE =3D "MIT"
> >> > -LIC_FILES_CHKSUM =3D
> >> "file://COPYRIGHT;md5=3D3992f1fbae3b8b061f9056b7fcda8cc6"
> >> > -HOMEPAGE =3D "http://luajit.org"
> >> > -
> >> > -SRCREV =3D "776c6935ed807fc3b1ee6cd89a0cf682ffb7e9de"
> >> > -SRC_URI =3D "git://
> >> luajit.org/git/luajit-2.0.git;protocol=3Dhttp;branch=3Dv${PV} \
> >> > -"
> >> > -
> >> > -SPIN =3D ".0-beta1"
> >> > -
> >> > -S =3D "${WORKDIR}/git"
> >> > -
> >> > -inherit pkgconfig binconfig
> >> > -
> >> > -BBCLASSEXTEND =3D "native"
> >> > -
> >> > -do_configure_prepend() {
> >> > -    sed -i 's:PREFIX=3D /usr/local:PREFIX=3D ${prefix}:g' ${S}/Make=
file
> >> > -    sed -i 's:MULTILIB=3D lib:MULTILIB=3D ${baselib}:g' ${S}/Makefi=
le
> >> > -}
> >> > -
> >> > -EXTRA_OEMAKE =3D 'CROSS=3D${HOST_PREFIX} \
> >> > -                TARGET_CFLAGS=3D"${TOOLCHAIN_OPTIONS} ${HOST_CC_ARC=
H}" \
> >> > -                TARGET_LDFLAGS=3D"${TOOLCHAIN_OPTIONS}" \
> >> > -                TARGET_SHLDFLAGS=3D"${TOOLCHAIN_OPTIONS}"
> >> TARGET_STRIP=3D"/bin/echo"'
> >> > -
> >> Would it be a big issue to re-add comment below - I was not aware of
> >> the build host requirements and there could be other users
> >> > -# Important note: On the build machine bit compatible glibc-dev and
> >> libgcc must
> >> > -# be installed. E.g if the target architecture has 32 bit (see '-m3=
2'
> >> below),
> >> > -# 32 bit versions of glibc-dev/libgcc (e.g glibc-devel.i686 /
> >> libgcc.i686 on
> >> > -# fedora) are required.
> >> > -#
> >> > -# Otherwise the following error occurs:
> >> > -# | /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No =
such
> >> file or directory
> >> > -# |  # include <gnu/stubs-32.h>
> >> > -
> >> Andreas
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZAanwACgkQN1Ujt2V2gByI2wCfatD3fNQxaAMap1dX5eaUZhAa
xGcAoKJnThf2bNPwp813YoBM0l1AEsE3
=V+X0
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
