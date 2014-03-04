Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 05DEB6AE14
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Mar 2014 22:01:19 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h14so637234eaj.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Mar 2014 14:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kDoExNuQ7wNzO8TDEp8zZ0qnjLSrv9w2BtEQlfOQvqg=;
	b=hoURgNJLCJw9913L6fouWhFHHeqhzJ23yyMYAHUwa+C+fBjv8b5xVsnYJQHmEjL70R
	ynX7IexxLqRe1nhSDB/01kuYZ4JEmYM8tgQNisLWLcr/836MPGUf3giU/6vrlAqK4exK
	GZY3DOeMR9fUlMjsGDz6nVI4NeVwXGpD8S4oiGMTNSlpP7ps5NUFT0jugK7yTzsuNqSv
	nS76NrkO3h2cOfiYVpzTo5/QKgSU/3y4mDIB+nG78gfBoFnBGOtsWJjTHpY7B8u8sGs4
	Nf6kEgRQmOmdGWdVT7HoR9SqCIrkxBgFQFBTtmSicrJcSGtlM2VnI3RnYbsRLW3Bzlnt
	6dCw==
X-Received: by 10.14.103.67 with SMTP id e43mr1789146eeg.94.1393970480548;
	Tue, 04 Mar 2014 14:01:20 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id x6sm918596eew.20.2014.03.04.14.01.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Mar 2014 14:01:19 -0800 (PST)
Date: Tue, 4 Mar 2014 23:01:25 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140304220125.GT26981@jama>
References: <1393943165-25177-1-git-send-email-net147@gmail.com>
	<20140304204324.GF22890@denix.org>
MIME-Version: 1.0
In-Reply-To: <20140304204324.GF22890@denix.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5][PATCH v2] qtbase: prevent artifacts on raster windows using eglfs plugin
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
X-List-Received-Date: Tue, 04 Mar 2014 22:01:22 -0000
X-Groupsio-MsgNum: 48509
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dPKyTZoWbiJp7FfC"
Content-Disposition: inline

--dPKyTZoWbiJp7FfC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 04, 2014 at 03:43:24PM -0500, Denys Dmytriyenko wrote:
> On Wed, Mar 05, 2014 at 01:26:05AM +1100, Jonathan Liu wrote:
> > Signed-off-by: Jonathan Liu <net147@gmail.com>
> > ---
> >  recipes-qt/qt5/qtbase.inc                          |  1 +
> >  .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  |  2 +-
> >  ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  2 +-
> >  .../0003-Add-external-hostbindir-option.patch      |  2 +-
> >  ...p-Prefix-default-LIBDIRS-and-INCDIRS-with.patch |  2 +-
> >  .../0005-qt_module-Fix-pkgconfig-replacement.patch |  2 +-
> >  ...on-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch |  2 +-
> >  ....prf-Allow-to-add-extra-arguments-to-make.patch |  2 +-
> >  ...ake-pulseaudio-alsa-freetype-a-configurab.patch |  2 +-
> >  ...E_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch |  2 +-
> >  ...0-qmake-is-already-built-in-qtbase-native.patch |  2 +-
> >  ...-building-a-separate-qmake-for-the-target.patch |  2 +-
> >  .../0012-qtbase-allow-build-of-examples.patch      |  2 +-
> >  .../0013-QOpenGLPaintDevice-sub-area-support.patch |  2 +-
> >  ...gl-error-for-platforms-only-supporting-on.patch |  2 +-
> >  .../0015-Fix-linuxfb-argument-mmsize-parsing.patch |  2 +-
> >  .../qtbase/0016-eglfs-Fix-quad-coordinates.patch   | 39 ++++++++++++++=
++++++++
> >  17 files changed, 55 insertions(+), 15 deletions(-)
> >  create mode 100644 recipes-qt/qt5/qtbase/0016-eglfs-Fix-quad-coordinat=
es.patch
> >=20
> > diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> > index f1a10bb..e5d98df 100644
> > --- a/recipes-qt/qt5/qtbase.inc
> > +++ b/recipes-qt/qt5/qtbase.inc
> > @@ -20,6 +20,7 @@ SRC_URI +=3D "\
> >      file://0013-QOpenGLPaintDevice-sub-area-support.patch \
> >      file://0014-eglfs-fix-egl-error-for-platforms-only-supporting-on.p=
atch \
> >      file://0015-Fix-linuxfb-argument-mmsize-parsing.patch \
> > +    file://0016-eglfs-Fix-quad-coordinates.patch \
> >  "
> > =20
> >  DEPENDS +=3D "qtbase-native"
> > diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b=
/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> > index 030a091..b256f14 100644
> > --- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> > +++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> > @@ -1,7 +1,7 @@
> >  From f883ec8652ee603d9bb9def7eb669ed82c493961 Mon Sep 17 00:00:00 2001
> >  From: Martin Jansa <Martin.Jansa@gmail.com>
> >  Date: Mon, 15 Apr 2013 04:29:32 +0200
> > -Subject: [PATCH 01/15] Add linux-oe-g++ platform
> > +Subject: [PATCH 01/16] Add linux-oe-g++ platform
>=20
> Not sure you need to touch every patch in the original series to update t=
he=20
> count. Maintainers should probably do that when they feel the need... But=
 it's=20
> up to them to decide one way or another, just saying that this patch will=
 be=20
> cleaner otherwise...

=46rom my perspective, I usually use https://github.com/meta-qt5/qtbase to
prepare the patches and then dump them all, put them to qtbase dir just
to see if they are different and if the only change are these numbers I
don't include them in commit.

In some cases (e.g. when upgrading) when there is even small change in
only one .patch file, I'll update the numbers in all of them. Or when I
forgot to exclude them.

So I agree it would be a bit cleaner, but still I plan to take this and
I'm happy to see patches which I can easily add to qtbase fork on
github.

> >  * This qmake.conf unlike other platforms reads most variables from
> >    shell environment, because it's easier for qt recipes to export
> > diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.co=
nf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow=
-to-set-qt.conf-from-the-outside-u.patch
> > index 525260a..870aa9f 100644
> > --- a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from=
-the-outside-u.patch
> > +++ b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from=
-the-outside-u.patch
> > @@ -1,7 +1,7 @@
> >  From 841d1f06f3fd2f59f6b18067b02d5fcfc93aaa7a Mon Sep 17 00:00:00 2001
> >  From: Holger Freyther <zecke@selfish.org>
> >  Date: Wed, 26 Sep 2012 17:22:30 +0200
> > -Subject: [PATCH 02/15] qlibraryinfo: allow to set qt.conf from the out=
side
> > +Subject: [PATCH 02/16] qlibraryinfo: allow to set qt.conf from the out=
side
> >   using the environment
> > =20
> >  Allow to set a qt.conf from the outside using the environment. This al=
lows
> > diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.=
patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
> > index 91b0a6c..c82e9d1 100644
> > --- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
> > +++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
> > @@ -1,7 +1,7 @@
> >  From 3648eeddaed0cf31fba226ec713d2321f398974f Mon Sep 17 00:00:00 2001
> >  From: Martin Jansa <Martin.Jansa@gmail.com>
> >  Date: Sat, 6 Apr 2013 13:15:07 +0200
> > -Subject: [PATCH 03/15] Add -external-hostbindir option
> > +Subject: [PATCH 03/16] Add -external-hostbindir option
> > =20
> >  * when cross-compiling it's sometimes useful to use existing tools fro=
m machine
> >    (or in OpenEmbedded built with separate native recipe) when building=
 for target
> > diff --git a/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIB=
DIRS-and-INCDIRS-with.patch b/recipes-qt/qt5/qtbase/0004-configureapp-Prefi=
x-default-LIBDIRS-and-INCDIRS-with.patch
> > index b1cdfa4..f1184e5 100644
> > --- a/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-an=
d-INCDIRS-with.patch
> > +++ b/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-an=
d-INCDIRS-with.patch
> > @@ -1,7 +1,7 @@
> >  From 698f073fb8cc6dc1ced277b6ae2056cb9d02f2d5 Mon Sep 17 00:00:00 2001
> >  From: Martin Jansa <Martin.Jansa@gmail.com>
> >  Date: Sat, 27 Apr 2013 22:33:33 +0200
> > -Subject: [PATCH 04/15] configureapp: Prefix default LIBDIRS and INCDIR=
S with
> > +Subject: [PATCH 04/16] configureapp: Prefix default LIBDIRS and INCDIR=
S with
> >   SYSROOT
> > =20
> >  Upstream-Status: Pending
> > diff --git a/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replace=
ment.patch b/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement=
=2Epatch
> > index 9ac5f6a..f1770bd 100644
> > --- a/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.pa=
tch
> > +++ b/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.pa=
tch
> > @@ -1,7 +1,7 @@
> >  From 7999eeb3f2ab1150aa301ec26ae9bf0788d09c9e Mon Sep 17 00:00:00 2001
> >  From: Martin Jansa <Martin.Jansa@gmail.com>
> >  Date: Sat, 27 Apr 2013 23:15:37 +0200
> > -Subject: [PATCH 05/15] qt_module: Fix pkgconfig replacement
> > +Subject: [PATCH 05/16] qt_module: Fix pkgconfig replacement
> >  MIME-Version: 1.0
> >  Content-Type: text/plain; charset=3DUTF-8
> >  Content-Transfer-Encoding: 8bit
> > diff --git a/recipes-qt/qt5/qtbase/0006-configure-don-t-export-SYSTEM_V=
ARIABLES-to-.qmake.va.patch b/recipes-qt/qt5/qtbase/0006-configure-don-t-ex=
port-SYSTEM_VARIABLES-to-.qmake.va.patch
> > index d514da3..0bd53cf 100644
> > --- a/recipes-qt/qt5/qtbase/0006-configure-don-t-export-SYSTEM_VARIABLE=
S-to-.qmake.va.patch
> > +++ b/recipes-qt/qt5/qtbase/0006-configure-don-t-export-SYSTEM_VARIABLE=
S-to-.qmake.va.patch
> > @@ -1,7 +1,7 @@
> >  From ebd38fc708cf7190e47a75754235f56fa5d86300 Mon Sep 17 00:00:00 2001
> >  From: Martin Jansa <Martin.Jansa@gmail.com>
> >  Date: Wed, 8 May 2013 23:54:35 +0200
> > -Subject: [PATCH 06/15] configure: don't export SYSTEM_VARIABLES to .qm=
ake.vars
> > +Subject: [PATCH 06/16] configure: don't export SYSTEM_VARIABLES to .qm=
ake.vars
> > =20
> >  * linux-oe-g++ should handle this correctly and exporting LD as QMAKE_=
LINK is
> >    causing issues as we need g++ to be used as linker
> > diff --git a/recipes-qt/qt5/qtbase/0007-configure.prf-Allow-to-add-extr=
a-arguments-to-make.patch b/recipes-qt/qt5/qtbase/0007-configure.prf-Allow-=
to-add-extra-arguments-to-make.patch
> > index 821e5b8..abe26a1 100644
> > --- a/recipes-qt/qt5/qtbase/0007-configure.prf-Allow-to-add-extra-argum=
ents-to-make.patch
> > +++ b/recipes-qt/qt5/qtbase/0007-configure.prf-Allow-to-add-extra-argum=
ents-to-make.patch
> > @@ -1,7 +1,7 @@
> >  From 828eecd8f361cb965bd40f535435efa91665c8e5 Mon Sep 17 00:00:00 2001
> >  From: Martin Jansa <Martin.Jansa@gmail.com>
> >  Date: Thu, 9 May 2013 10:06:50 +0200
> > -Subject: [PATCH 07/15] configure.prf: Allow to add extra arguments to =
make
> > +Subject: [PATCH 07/16] configure.prf: Allow to add extra arguments to =
make
> > =20
> >  * sometimes we would like to add -e or define some variable and respec=
t it from both
> >    Makefiles used in configure tests and also Makefiles to build the ap=
plication
> > diff --git a/recipes-qt/qt5/qtbase/0008-configure-make-pulseaudio-alsa-=
freetype-a-configurab.patch b/recipes-qt/qt5/qtbase/0008-configure-make-pul=
seaudio-alsa-freetype-a-configurab.patch
> > index 4abc465..7011025 100644
> > --- a/recipes-qt/qt5/qtbase/0008-configure-make-pulseaudio-alsa-freetyp=
e-a-configurab.patch
> > +++ b/recipes-qt/qt5/qtbase/0008-configure-make-pulseaudio-alsa-freetyp=
e-a-configurab.patch
> > @@ -1,7 +1,7 @@
> >  From 3923edc900d1b3dd23e0a6af3a32255707cd497c Mon Sep 17 00:00:00 2001
> >  From: Paul Eggleton <paul.eggleton@linux.intel.com>
> >  Date: Tue, 28 Feb 2012 15:10:24 +0000
> > -Subject: [PATCH 08/15] configure: make pulseaudio, alsa, freetype a
> > +Subject: [PATCH 08/16] configure: make pulseaudio, alsa, freetype a
> >   configurable option
> > =20
> >  Allows disabling pulseaudio, alsa, freetype support at configure time
> > diff --git a/recipes-qt/qt5/qtbase/0009-cmake-Use-OE_QMAKE_PATH_EXTERNA=
L_HOST_BINS-to-determ.patch b/recipes-qt/qt5/qtbase/0009-cmake-Use-OE_QMAKE=
_PATH_EXTERNAL_HOST_BINS-to-determ.patch
> > index b52d02d..6b7bc1e 100644
> > --- a/recipes-qt/qt5/qtbase/0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_=
BINS-to-determ.patch
> > +++ b/recipes-qt/qt5/qtbase/0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_=
BINS-to-determ.patch
> > @@ -1,7 +1,7 @@
> >  From acbd622d1b91c1aa9ec8c48d10d91354d175345c Mon Sep 17 00:00:00 2001
> >  From: Simon Busch <morphis@gravedo.de>
> >  Date: Mon, 22 Jul 2013 21:09:41 +0000
> > -Subject: [PATCH 09/15] cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to
> > +Subject: [PATCH 09/16] cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to
> >   determine path to host binaries
> > =20
> >  Upstream-Status: Inappropiate (configuration)
> > diff --git a/recipes-qt/qt5/qtbase/0010-qmake-is-already-built-in-qtbas=
e-native.patch b/recipes-qt/qt5/qtbase/0010-qmake-is-already-built-in-qtbas=
e-native.patch
> > index eb2da1e..e9266cb 100644
> > --- a/recipes-qt/qt5/qtbase/0010-qmake-is-already-built-in-qtbase-nativ=
e.patch
> > +++ b/recipes-qt/qt5/qtbase/0010-qmake-is-already-built-in-qtbase-nativ=
e.patch
> > @@ -1,7 +1,7 @@
> >  From 77a18a9fe2d0e4a1dcd95e2d78c85eb37452bc73 Mon Sep 17 00:00:00 2001
> >  From: Michael Krelin <hacker@klever.net>
> >  Date: Mon, 29 Oct 2012 20:07:49 -0700
> > -Subject: [PATCH 10/15] qmake is already built in qtbase-native
> > +Subject: [PATCH 10/16] qmake is already built in qtbase-native
> > =20
> >  Ported from OE by: Yu Ke <ke.yu@intel.com>
> >  Upstream-Status: Inappropriate [configuration]
> > diff --git a/recipes-qt/qt5/qtbase/0011-Allow-building-a-separate-qmake=
-for-the-target.patch b/recipes-qt/qt5/qtbase/0011-Allow-building-a-separat=
e-qmake-for-the-target.patch
> > index e028f35..a477348 100644
> > --- a/recipes-qt/qt5/qtbase/0011-Allow-building-a-separate-qmake-for-th=
e-target.patch
> > +++ b/recipes-qt/qt5/qtbase/0011-Allow-building-a-separate-qmake-for-th=
e-target.patch
> > @@ -1,7 +1,7 @@
> >  From dd14f3eda61669c66c95dbcbca3afbd61f9aa746 Mon Sep 17 00:00:00 2001
> >  From: Paul Eggleton <paul.eggleton@linux.intel.com>
> >  Date: Mon, 29 Oct 2012 20:26:36 -0700
> > -Subject: [PATCH 11/15] Allow building a separate qmake for the target
> > +Subject: [PATCH 11/16] Allow building a separate qmake for the target
> > =20
> >  Upstream-Status: Inappropriate [config]
> > =20
> > diff --git a/recipes-qt/qt5/qtbase/0012-qtbase-allow-build-of-examples.=
patch b/recipes-qt/qt5/qtbase/0012-qtbase-allow-build-of-examples.patch
> > index 3e8f1e2..19ba150 100644
> > --- a/recipes-qt/qt5/qtbase/0012-qtbase-allow-build-of-examples.patch
> > +++ b/recipes-qt/qt5/qtbase/0012-qtbase-allow-build-of-examples.patch
> > @@ -1,7 +1,7 @@
> >  From 6e5e22110b4731b4324d309bc579393f422ba99d Mon Sep 17 00:00:00 2001
> >  From: =3D?UTF-8?q?Eric=3D20B=3DC3=3DA9nard?=3D <eric@eukrea.com>
> >  Date: Sat, 25 May 2013 17:34:32 +0200
> > -Subject: [PATCH 12/15] qtbase: allow build of examples
> > +Subject: [PATCH 12/16] qtbase: allow build of examples
> >  MIME-Version: 1.0
> >  Content-Type: text/plain; charset=3DUTF-8
> >  Content-Transfer-Encoding: 8bit
> > diff --git a/recipes-qt/qt5/qtbase/0013-QOpenGLPaintDevice-sub-area-sup=
port.patch b/recipes-qt/qt5/qtbase/0013-QOpenGLPaintDevice-sub-area-support=
=2Epatch
> > index 8366364..e1eabb5 100644
> > --- a/recipes-qt/qt5/qtbase/0013-QOpenGLPaintDevice-sub-area-support.pa=
tch
> > +++ b/recipes-qt/qt5/qtbase/0013-QOpenGLPaintDevice-sub-area-support.pa=
tch
> > @@ -1,7 +1,7 @@
> >  From 2fad0a6fa3c06577995ac44ed0a2a12eaef819c2 Mon Sep 17 00:00:00 2001
> >  From: Jani Hautakangas <jani.hautakangas@ixonos.com>
> >  Date: Thu, 16 May 2013 09:52:07 +0300
> > -Subject: [PATCH 13/15] QOpenGLPaintDevice sub-area support
> > +Subject: [PATCH 13/16] QOpenGLPaintDevice sub-area support
> > =20
> >  Allows creating QOpenGLPaintDevice targetting sub-area
> >  of binded framebuffer.
> > diff --git a/recipes-qt/qt5/qtbase/0014-eglfs-fix-egl-error-for-platfor=
ms-only-supporting-on.patch b/recipes-qt/qt5/qtbase/0014-eglfs-fix-egl-erro=
r-for-platforms-only-supporting-on.patch
> > index 9c366b6..0835a6f 100644
> > --- a/recipes-qt/qt5/qtbase/0014-eglfs-fix-egl-error-for-platforms-only=
-supporting-on.patch
> > +++ b/recipes-qt/qt5/qtbase/0014-eglfs-fix-egl-error-for-platforms-only=
-supporting-on.patch
> > @@ -1,7 +1,7 @@
> >  From c8995c6eb6cf4bfa8daf1e3e96bd4885a096f405 Mon Sep 17 00:00:00 2001
> >  From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googl=
email.com>
> >  Date: Wed, 5 Feb 2014 18:35:08 +0100
> > -Subject: [PATCH 14/15] eglfs: fix egl error for platforms only support=
ing one
> > +Subject: [PATCH 14/16] eglfs: fix egl error for platforms only support=
ing one
> >   window/surface
> >  MIME-Version: 1.0
> >  Content-Type: text/plain; charset=3DUTF-8
> > diff --git a/recipes-qt/qt5/qtbase/0015-Fix-linuxfb-argument-mmsize-par=
sing.patch b/recipes-qt/qt5/qtbase/0015-Fix-linuxfb-argument-mmsize-parsing=
=2Epatch
> > index c9836c8..a4b1379 100644
> > --- a/recipes-qt/qt5/qtbase/0015-Fix-linuxfb-argument-mmsize-parsing.pa=
tch
> > +++ b/recipes-qt/qt5/qtbase/0015-Fix-linuxfb-argument-mmsize-parsing.pa=
tch
> > @@ -1,7 +1,7 @@
> >  From 99979159a404df09495c8ddd6a052837f66b8739 Mon Sep 17 00:00:00 2001
> >  From: =3D?UTF-8?q?Peter=3D20K=3DC3=3DBCmmel?=3D <syntheticpp@gmx.net>
> >  Date: Fri, 7 Feb 2014 13:12:37 +0100
> > -Subject: [PATCH 15/15] Fix linuxfb argument 'mmsize' parsing
> > +Subject: [PATCH 15/16] Fix linuxfb argument 'mmsize' parsing
> > =20
> >  Parse first for 'mmsize' because the regex for 'size' also fits to 'mm=
size'.
> > =20
> > diff --git a/recipes-qt/qt5/qtbase/0016-eglfs-Fix-quad-coordinates.patc=
h b/recipes-qt/qt5/qtbase/0016-eglfs-Fix-quad-coordinates.patch
> > new file mode 100644
> > index 0000000..f0dfc9c
> > --- /dev/null
> > +++ b/recipes-qt/qt5/qtbase/0016-eglfs-Fix-quad-coordinates.patch
> > @@ -0,0 +1,39 @@
> > +From 84756d94c73885803ad8044099ab47c0c49b5076 Mon Sep 17 00:00:00 2001
> > +From: Laszlo Agocs <laszlo.agocs@digia.com>
> > +Date: Thu, 23 Jan 2014 11:45:22 +0100
> > +Subject: [PATCH 16/16] eglfs: Fix quad coordinates
> > +
> > +Prevent artifacts on raster windows by properly mapping
> > +the coordinates to [-1,1].
> > +
> > +Upstream-Status: Backport
> > +
> > +Task-number: QTBUG-36370
> > +Change-Id: I95d0d03952f597ef4ce6a950c6533a3af2df964a
> > +Reviewed-by: Andy Nichols <andy.nichols@digia.com>
> > +Signed-off-by: Jonathan Liu <net147@gmail.com>
> > +---
> > + src/plugins/platforms/eglfs/qeglfscompositor.cpp | 5 +++--
> > + 1 file changed, 3 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/src/plugins/platforms/eglfs/qeglfscompositor.cpp b/src/pl=
ugins/platforms/eglfs/qeglfscompositor.cpp
> > +index 845bb5b..1efc4f7 100644
> > +--- a/src/plugins/platforms/eglfs/qeglfscompositor.cpp
> > ++++ b/src/plugins/platforms/eglfs/qeglfscompositor.cpp
> > +@@ -153,10 +153,11 @@ void QEglFSCompositor::render(QEglFSWindow *wind=
ow, uint texture, bool raster)
> > +     QPoint tl =3D r.topLeft();
> > +     QPoint br =3D r.bottomRight();
> > +=20
> > ++    // Map to [-1,1]
> > +     GLfloat x1 =3D (tl.x() / sr.width()) * 2 - 1;
> > +-    GLfloat x2 =3D (br.x() / sr.width()) * 2 - 1;
> > +     GLfloat y1 =3D ((sr.height() - tl.y()) / sr.height()) * 2 - 1;
> > +-    GLfloat y2 =3D ((sr.height() - br.y()) / sr.height()) * 2 - 1;
> > ++    GLfloat x2 =3D ((br.x() + 1) / sr.width()) * 2 - 1;
> > ++    GLfloat y2 =3D ((sr.height() - (br.y() + 1)) / sr.height()) * 2 -=
 1;
> > +=20
> > +     if (!raster)
> > +         qSwap(y1, y2);
> > +--=20
> > +1.7.1
> > +
> > --=20
> > 1.9.0
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dPKyTZoWbiJp7FfC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMWTTUACgkQN1Ujt2V2gBzm/QCgglQkxehaPncLM4s9FEMBv9hu
erwAnRTx0OAI1MoE7oJGkHS4Ccs1pzCh
=s9O3
-----END PGP SIGNATURE-----

--dPKyTZoWbiJp7FfC--
