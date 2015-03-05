Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 46BEE7375A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 08:21:01 +0000 (UTC)
Received: by wivr20 with SMTP id r20so4802874wiv.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2015 00:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bkpoFoin6lPEYUYg6vPbAUMnyUE+HjdfeDvPuLTvfxU=;
	b=rXvd6dGsoRAXW2y3tGO4d6QPZtLzwQZXY0Vub00PivHlsKTaae5yb7fqPt4tPW9Cd5
	NCNtlOZDh9C/YfUHP1tK3OJus7qhwAb/hsMTez/5kyBtKJ4g8nJ/tKesViWhMkfe5XRJ
	aYD5l3l7x3RFSBO6fHfDYUuftuyDdiZkdr/pblNJ3XMCU5oZHhbrBR+TONFDWAsy9IaI
	Rl9ndszjlpJ+ukiN+PSWsKU6SZ9Oq7ETSooyogDodK1DwxlL0qZywmEgo8yf2BKnJOah
	5fj05ctOiXZZOfK2S31SU/z/tAIOFSk5NOwMtJSklkQSFkkizzxNW509m1bPxukEH+ie
	y/xA==
X-Received: by 10.180.207.84 with SMTP id lu20mr62315171wic.17.1425543662882; 
	Thu, 05 Mar 2015 00:21:02 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fs8sm28601771wib.8.2015.03.05.00.21.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 00:21:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 Mar 2015 09:21:06 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150305082106.GL2337@jama>
References: <1425457252-8056-1-git-send-email-mike.looijmans@topic.nl>
	<20150304220348.GK2337@jama> <54F806B4.7040005@topic.nl>
MIME-Version: 1.0
In-Reply-To: <54F806B4.7040005@topic.nl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] opencv: Upgrade to 2.4.11
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
X-List-Received-Date: Thu, 05 Mar 2015 08:21:03 -0000
X-Groupsio-MsgNum: 54635
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PpocKf6TCvdC9BKE"
Content-Disposition: inline

--PpocKf6TCvdC9BKE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 05, 2015 at 08:33:08AM +0100, Mike Looijmans wrote:
> =EF=BB=BFOn 04-03-15 23:03, Martin Jansa wrote:
> > On Wed, Mar 04, 2015 at 09:20:52AM +0100, Mike Looijmans wrote:
> >> Upgrade OpenCV to the 2.4.11 release.
> >>
> >> Remove the opencv-fix-pkgconfig-generation patch which has been integr=
ated upstream,
> >> be it in modified form.
> >> ---
> >>   .../opencv/opencv-fix-pkgconfig-generation.patch   | 44 ------------=
----------
> >>   meta-oe/recipes-support/opencv/opencv_2.4.bb       |  8 ++--
> >>   2 files changed, 3 insertions(+), 49 deletions(-)
> >>   delete mode 100644 meta-oe/recipes-support/opencv/opencv/opencv-fix-=
pkgconfig-generation.patch
> >>
> >> diff --git a/meta-oe/recipes-support/opencv/opencv/opencv-fix-pkgconfi=
g-generation.patch b/meta-oe/recipes-support/opencv/opencv/opencv-fix-pkgco=
nfig-generation.patch
> >> deleted file mode 100644
> >> index d352778..0000000
> >> --- a/meta-oe/recipes-support/opencv/opencv/opencv-fix-pkgconfig-gener=
ation.patch
> >> +++ /dev/null
> >> @@ -1,44 +0,0 @@
> >> -Fix pkg-config generation
> >> -
> >> -Replace absolute library path with library name spec and library sear=
ch
> >> -path option.
> >> -
> >> -The fix has been provided by Ray Rashif (code.opencv.org/issues/1925)
> >> -
> >> -Upstream-Status: Pending
> >> -
> >> -diff -Nbaur OpenCV-2.4.3.orig/cmake/OpenCVGenPkgconfig.cmake OpenCV-2=
=2E4.3/cmake/OpenCVGenPkgconfig.cmake
> >> ---- OpenCV-2.4.3.orig/cmake/OpenCVGenPkgconfig.cmake	2012-11-04 08:40=
:14.243505926 +0000
> >> -+++ OpenCV-2.4.3/cmake/OpenCVGenPkgconfig.cmake	2012-11-04 08:40:42.2=
86649120 +0000
> >> -@@ -10,7 +10,7 @@
> >> - # ------------------------------------------------------------------=
-------------------------
> >> - set(prefix      "${CMAKE_INSTALL_PREFIX}")
> >> - set(exec_prefix "\${prefix}")
> >> --set(libdir      "") #TODO: need link paths for OpenCV_EXTRA_COMPONEN=
TS
> >> -+set(libdir      "\${prefix}/${OPENCV_LIB_INSTALL_PATH}")
> >> - set(includedir  "\${prefix}/${OPENCV_INCLUDE_INSTALL_PATH}")
> >> - set(VERSION     ${OPENCV_VERSION})
> >> -
> >> -@@ -36,10 +36,11 @@
> >> - ocv_list_reverse(OpenCV_EXTRA_COMPONENTS)
> >> -
> >> - #build the list of components
> >> --set(OpenCV_LIB_COMPONENTS_ "")
> >> -+set(OpenCV_LIB_COMPONENTS_ "-L\${libdir}")
> >> - foreach(CVLib ${OpenCV_LIB_COMPONENTS})
> >> -   get_target_property(libpath ${CVLib} LOCATION_${CMAKE_BUILD_TYPE})
> >> -   get_filename_component(libname "${libpath}" NAME)
> >> -+  get_filename_component(lname "${libpath}" NAME_WE)
> >> -
> >> -   if(INSTALL_TO_MANGLED_PATHS)
> >> -     set(libname "${libname}.${OPENCV_VERSION}")
> >> -@@ -52,7 +53,8 @@
> >> -     set(installDir "${OPENCV_LIB_INSTALL_PATH}")
> >> -   endif()
> >> -
> >> --  set(OpenCV_LIB_COMPONENTS_ "${OpenCV_LIB_COMPONENTS_} \${exec_pref=
ix}/${installDir}/${libname}")
> >> -+  string(REPLACE "libopencv" "-lopencv" lname "${lname}")
> >> -+  set(OpenCV_LIB_COMPONENTS_ "${OpenCV_LIB_COMPONENTS_} ${lname}")
> >> - endforeach()
> >> -
> >> - # add extra dependencies required for OpenCV
> >> diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/re=
cipes-support/opencv/opencv_2.4.bb
> >> index 63d7c8b..e57f9a6 100644
> >> --- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
> >> +++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
> >> @@ -9,12 +9,10 @@ ARM_INSTRUCTION_SET =3D "arm"
> >>
> >>   DEPENDS =3D "python-numpy libtool swig swig-native python bzip2 zlib=
 glib-2.0"
> >>
> >> -SRCREV =3D "df8e28283f09825cca0c2902160b7abebcfe1b64"
> >> -SRC_URI =3D "git://github.com/Itseez/opencv.git;branch=3D2.4 \
> >> -           file://opencv-fix-pkgconfig-generation.patch \
> >> -"
> >> +SRCREV =3D "2c9547e3147779001811d01936aed38f560929fc"
> >> +SRC_URI =3D "git://github.com/Itseez/opencv.git;branch=3D2.4"
> >>
> >> -PV =3D "2.4.9+git${SRCPV}"
> >> +PV =3D "2.4.11+git${SRCPV}"
> >
> > Please Fix this issue first:
> > WARNING: QA Issue: libopencv-highgui rdepends on jasper, but it isn't a
> > build dependency? [build-deps]
> > WARNING: QA Issue: libopencv-highgui rdepends on libdc1394, but it isn't
> > a build dependency? [build-deps]
>=20
> I didn't get any warnings, which platform did you use?

See http://www.openembedded.org/wiki/Bitbake_World_Status_Setup

> I guess the recipe needs some explicit "disable" calls, it probably=20
> auto-detected these on your system.

You'll see these warnings only if you build jasper from meta-oe and
libdc1394 from meta-multimedia before building opencv.

And yes, it needs to be explicitly disabled.

> >>   S =3D "${WORKDIR}/git"
> >>
> >> --
> >> 1.9.1
> >>
> >> --
> >>=20
>=20
> Met vriendelijke groet / kind regards,
>=20
> Mike Looijmans
> System Expert
>=20
>=20
> TOPIC Embedded Systems
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: (+31) (0) 499 33 69 79
> Telefax:  (+31) (0) 499 33 69 70
> E-mail: mike.looijmans@topic.nl
> Website: www.topic.nl
>=20
> Please consider the environment before printing this e-mail
>=20
> Topic zoekt gedreven (embedded) software specialisten!
> http://topic.nl/vacatures/topic-zoekt-software-engineers/
>=20
> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PpocKf6TCvdC9BKE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT4EfIACgkQN1Ujt2V2gBwqRACeJ4nDJY090aHKUClAB2C+jnvq
1OYAn02kIsQxIJCdz5n0kfe+311H4rg5
=GPTr
-----END PGP SIGNATURE-----

--PpocKf6TCvdC9BKE--
