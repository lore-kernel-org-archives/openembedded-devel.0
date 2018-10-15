Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id AC03D60043
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 11:11:13 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 193-v6so19142046wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 04:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=B1U/5RHlEeWk7R4TWacZJiXcrKssDztKBUaT7gRes9Q=;
	b=l/q8v0moL576GeFFkZoP+QdagPwrtQgONw5FEN80eMwoUOacfY8oBmXIkBVabS0Lr0
	E2RRChaPP8C7AFHqKCy8khXLU06BV65gy70JgH3Asc2hEWqdp09UCI4HlBH5sJUGmFtR
	SbRvRDs4gjjZ4y2RnWJDjH5v3aJ3adDTUbY7Di//l3VAqhyNUG1UW3DrXdqOUXGN6HU3
	uXcVgC6XXzEkK1OR/CDpNOap9MO1zUP2A9gO9P1ek8Ot/UMWlvrR42PtRlXzIOBzveI5
	xQek6Bnsi40Gw+zjxtmQhxHAeNXSH5kh8imDu9r/pKbuvK3GJwDjPjKDswOVbUB2Gpqn
	bbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=B1U/5RHlEeWk7R4TWacZJiXcrKssDztKBUaT7gRes9Q=;
	b=RpCaGTe7YesUCpu38viM6JZSLDdPNQIoFkdJ7DeJQk0v4ZrlSc/hdi5N2O98wtJiMN
	hSCwKSAjE+OIZw5MRCG2B7+Nwkh1EkZE3hyOSBXSiFOQPZkJihsJx+RyowMPZ6Sgwbdl
	rcZEC9UTGUvRChwi2KqNTXxY8aXLms5iByJMeoiHp4837jag88qK/wszy56Yqiem5yOR
	zAQ9H+Z2rhaA4WcuUSKxlZSrozADrHAanBFvel3yUI2w7ffbXzkfcYBJoAGox8iCzCxy
	ovQoRLdpbt9r6m4AE0YGUcxTJNs7YuZb0hm6iPJiuxI2TyZGDPKbuyPcpvbtUK1U7fCS
	323w==
X-Gm-Message-State: ABuFfojzGhPVwnYlvf12A29NB9o368/Mfq8zkRueagYNZSDt5Z8zV/5X
	9deTOYUj4jErvV0wM1AO5+4=
X-Google-Smtp-Source: ACcGV63GNKVqU2BY9BfECzDt1Ta2QZu2d9UK+/jvXMWRXg6wRo/4UcGDNMdxx36bQvgJFflI/PqTww==
X-Received: by 2002:a1c:3b87:: with SMTP id
	i129-v6mr12346803wma.42.1539601874053; 
	Mon, 15 Oct 2018 04:11:14 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	t2-v6sm8876672wrr.7.2018.10.15.04.11.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Oct 2018 04:11:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 15 Oct 2018 13:11:12 +0200
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Message-ID: <20181015111112.GA1342@jama>
References: <20181008091749.45975-1-uvv.mail@gmail.com>
	<CAMKF1sp-q=SJ+R=bGNeCpSL_=ufUuqDJAnCPVMmVEZ2H7zYcjg@mail.gmail.com>
	<CAKHfEah9WnNyh-wzdibsALB648po7RC4sKdNy5dWKYWpMDfL9g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKHfEah9WnNyh-wzdibsALB648po7RC4sKdNy5dWKYWpMDfL9g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] glog: upgrade 0.3.4 -> 0.3.5
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
X-List-Received-Date: Mon, 15 Oct 2018 11:11:13 -0000
X-Groupsio-MsgNum: 74994
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 09, 2018 at 11:52:36AM +0200, Vyacheslav Yurkov wrote:
> Well, two obvious reasons:
> - glog fixes between 0.3.4 and 0.3.5
> - cmake support, which simplifies dependency handling when SDK generation
> is involved (for example for libraries like ceres-solver)
>=20
> I need to update my patch for finding libunwind, so I will send another
> version soon. The question I have now is that glog builds static library =
by
> default. What is the policy in that regard? Should a shared library be
> preferred by default?

I know I'm a bit late, but I have some questions about shared library.

The preferred default should IMHO be the same as with 0.3.4 version
which was shared library, but that's easy to add with small bbappend
having:
EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON"

but unfortunately the SONAME in the library changed from:
objdump -x usr/lib/libglog.so.0.0.0 | grep SONAME
  SONAME               libglog.so.0
in 0.3.4 to:
objdump -x usr/lib/libglog.so.0.3.5  | grep SONAME
  SONAME               libglog.so.0.3.5

Which breaks all our prebuilt binaries which now correctly complain that
there isn't libglog.so.0 provider in dependencies:
QA Issue: /usr/lib/libfoo.so.1.2.3 contained in package libfoo requires lib=
glog.so.0, but no providers found in RDEPENDS_libfoo

Which is quite unfortunate for minor upgrade. Did they really change the
ABI (and expect to change it in all future minor upgrades) or is this
change just unexpected side-effect of using cmake instead of autotools?

It looks the later, because if I build 0.3.5 version with autotools I
get:
objdump -x usr/lib/libglog.so.0.0.0 | grep SONAME
  SONAME               libglog.so.0

and there is patch for SOVERSION here as well:
https://github.com/google/or-tools/blob/master/patches/glog.patch

applied in master:
https://github.com/google/glog/blob/master/CMakeLists.txt#L493
https://github.com/google/glog/commit/6b6e38a7d53fe01f42ce34384cf4ba4c50e8c=
b65#diff-af3b638bc2a3e6c650974192a53c7291

patch coming with this change backported to make it possible again to
use the shared library.

>=20
> Vyacheslav
>=20
> On Mon, Oct 8, 2018 at 3:42 PM Khem Raj <raj.khem@gmail.com> wrote:
>=20
> > On Mon, Oct 8, 2018 at 2:18 AM Vyacheslav Yurkov <uvv.mail@gmail.com>
> > wrote:
> > >
> > > Upgraded glog recipe to a new stable version in favor of cmake
> > configuration
> > > Old configure.ac patch is removed.
> > >
> > > Another cmake patch is added. When UNWIND_LIBRARY is used directly as=
 a
> > public
> > > dependency then absolute path is stored in cmake config file.
> > > This is an issue when glog is used as part of generated SDK, which was
> > built
> > > on another machine. When SDK is installed on developer's machine,
> > > cmake config contains a full path to non-existent location.
> > > The solution is to find libunwind during configure stage and store ta=
rget
> > > name as a dependency, not a full path
> > >
> > > Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> > > ---
> > >  ...gure.ac-Allow-user-to-disable-gflags.patch | 35 -----------------=
--
> > >  ...0001-find-libunwind-during-configure.patch | 30 ++++++++++++++++
> > >  .../glog/{glog_0.3.4.bb =3D> glog_0.3.5.bb}     | 13 +++----
> > >  3 files changed, 37 insertions(+), 41 deletions(-)
> > >  delete mode 100644
> > meta-oe/recipes-support/glog/glog/0001-configure.ac-Allow-user-to-disab=
le-gflags.patch
> > >  create mode 100644
> > meta-oe/recipes-support/glog/glog/0001-find-libunwind-during-configure.=
patch
> > >  rename meta-oe/recipes-support/glog/{glog_0.3.4.bb =3D> glog_0.3.5.b=
b}
> > (55%)
> > >
> > > diff --git
> > a/meta-oe/recipes-support/glog/glog/0001-configure.ac-Allow-user-to-dis=
able-gflags.patch
> > b/meta-oe/recipes-support/glog/glog/0001-configure.ac-Allow-user-to-dis=
able-gflags.patch
> > > deleted file mode 100644
> > > index 596281ff6..000000000
> > > ---
> > a/meta-oe/recipes-support/glog/glog/0001-configure.ac-Allow-user-to-dis=
able-gflags.patch
> > > +++ /dev/null
> > > @@ -1,35 +0,0 @@
> > > -From 0fabde0515e180c53961c27346dd7a79cffa4c1f Mon Sep 17 00:00:00 20=
01
> > > -From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > > -Date: Thu, 11 Aug 2016 11:49:36 +0200
> > > -Subject: [PATCH] configure.ac: Allow user to disable gflags
> > > -
> > > -Under some circumstances like cross-compilation, the user might not =
want
> > > -to enable support for gflags.
> > > -
> > > -This patch allows support for --without-gflags
> > > -
> > > -Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > > ----
> > > - configure.ac | 6 +++++-
> > > - 1 file changed, 5 insertions(+), 1 deletion(-)
> > > -
> > > -diff --git a/configure.ac b/configure.ac
> > > -index 7b4d21e7ae8a..eba5e5cda1ea 100644
> > > ---- a/configure.ac
> > > -+++ b/configure.ac
> > > -@@ -136,7 +136,11 @@ AC_ARG_WITH(gflags,
> > AS_HELP_STRING[--with-gflags=3DGFLAGS_DIR],
> > > -   CFLAGS=3D"$CFLAGS $GFLAGS_CFLAGS"
> > > -   LIBS=3D"$LIBS $GFLAGS_LIBS"
> > > - )
> > > --AC_CHECK_LIB(gflags, main, ac_cv_have_libgflags=3D1,
> > ac_cv_have_libgflags=3D0)
> > > -+if test x"$with_gflags" =3D x"no"; then
> > > -+  ac_cv_have_libgflags=3D0
> > > -+else
> > > -+  AC_CHECK_LIB(gflags, main, ac_cv_have_libgflags=3D1,
> > ac_cv_have_libgflags=3D0)
> > > -+fi
> > > - if test x"$ac_cv_have_libgflags" =3D x"1"; then
> > > -   AC_DEFINE(HAVE_LIB_GFLAGS, 1, [define if you have google gflags
> > library])
> > > -   if test x"$GFLAGS_LIBS" =3D x""; then
> > > ---
> > > -2.8.1
> > > -
> > > diff --git
> > a/meta-oe/recipes-support/glog/glog/0001-find-libunwind-during-configur=
e.patch
> > b/meta-oe/recipes-support/glog/glog/0001-find-libunwind-during-configur=
e.patch
> > > new file mode 100644
> > > index 000000000..33dc9d38a
> > > --- /dev/null
> > > +++
> > b/meta-oe/recipes-support/glog/glog/0001-find-libunwind-during-configur=
e.patch
> > > @@ -0,0 +1,30 @@
> > > +diff -ur git/CMakeLists.txt ../0.3.5-r0.unwind/git/CMakeLists.txt
> > > +--- git/CMakeLists.txt 2018-10-08 08:54:15.118989400 +0200
> > > ++++ ../0.3.5-r0.unwind/git/CMakeLists.txt      2018-10-05
> > 16:26:59.745922318 +0200
> > > +@@ -384,7 +384,9 @@
> > > + set_target_properties (glog PROPERTIES POSITION_INDEPENDENT_CODE ON)
> > > +
> > > + if (UNWIND_LIBRARY)
> > > +-  target_link_libraries (glog PUBLIC ${UNWIND_LIBRARY})
> > > ++  add_library(unwind SHARED IMPORTED)
> > > ++  set_target_properties(unwind PROPERTIES IMPORTED_LOCATION
> > ${UNWIND_LIBRARY})
> > > ++  target_link_libraries (glog PUBLIC unwind)
> > > + endif (UNWIND_LIBRARY)
> > > +
> > > + if (HAVE_PTHREAD)
> > > +diff -ur git/glog-config.cmake.in ../0.3.5-r0.unwind/git/
> > glog-config.cmake.in
> > > +--- git/glog-config.cmake.in   2018-10-08 08:54:15.122989699 +0200
> > > ++++ ../0.3.5-r0.unwind/git/glog-config.cmake.in        2018-10-08
> > 08:14:48.550745810 +0200
> > > +@@ -4,4 +4,12 @@
> > > +
> > > + @gflags_DEPENDENCY@
> > > +
> > > ++find_library (UNWIND_LIBRARY NAMES unwind DOC "unwind library")
> > > ++mark_as_advanced (UNWIND_LIBRARY)
> > > ++
> > > ++if (UNWIND_LIBRARY)
> > > ++  add_library(unwind SHARED IMPORTED)
> > > ++  set_target_properties(unwind PROPERTIES IMPORTED_LOCATION
> > ${UNWIND_LIBRARY})
> > > ++endif (UNWIND_LIBRARY)
> > > ++
> > > + include ("${CMAKE_CURRENT_LIST_DIR}/glog-targets.cmake")
> > > diff --git a/meta-oe/recipes-support/glog/glog_0.3.4.bb
> > b/meta-oe/recipes-support/glog/glog_0.3.5.bb
> > > similarity index 55%
> > > rename from meta-oe/recipes-support/glog/glog_0.3.4.bb
> > > rename to meta-oe/recipes-support/glog/glog_0.3.5.bb
> > > index d7c1974c6..bf7df53f3 100644
> > > --- a/meta-oe/recipes-support/glog/glog_0.3.4.bb
> > > +++ b/meta-oe/recipes-support/glog/glog_0.3.5.bb
> > > @@ -9,15 +9,16 @@ LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3Ddc9db360e0bbd4e46672f3fd91dd6c4b"
> > >  DEPENDS =3D "libunwind"
> > >
> > >  SRC_URI =3D " \
> > > -    git://github.com/google/glog.git \
> > > -    file://0001-configure.ac-Allow-user-to-disable-gflags.patch \
> > > +    git://github.com/google/glog.git;branch=3Dv035 \
> > > +    file://0001-find-libunwind-during-configure.patch \
> > >  "
> > >
> > > -SRCREV =3D "d8cb47f77d1c31779f3ff890e1a5748483778d6a"
> > > +SRCREV =3D "a6a166db069520dbbd653c97c2e5b12e08a8bb26"
> > >
> > >  S =3D "${WORKDIR}/git"
> > >
> > > -PACKAGECONFIG ??=3D ""
> > > -PACKAGECONFIG[gflags] =3D ",--without-gflags,gflags,"
> > > +inherit cmake
> > >
> > > -inherit autotools pkgconfig
> > > +RDEPENDS_${PN}-dev =3D ""
> > > +RRECOMMENDS_${PN}-dev =3D "${PN}-staticdev"
> > > +RRECOMMENDS_${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV})"
> >
> > why do we need the above change
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW8R1zwAKCRA3VSO3ZXaA
HE/oAJ0fLnBPnIVJMOKlvFXCgF0c/wyk2QCeMaWAqNgwC7sTung01oKMfPRCZGA=
=jifu
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
