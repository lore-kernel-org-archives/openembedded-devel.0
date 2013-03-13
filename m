Received: from mail-da0-f49.google.com ([209.85.210.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFkBK-0006iK-AR
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 12:49:20 +0100
Received: by mail-da0-f49.google.com with SMTP id t11so374069daj.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 04:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=XEYBBmP1x0UoAk+4jETrAmJ6JVToYr7KppFG7Au31OM=;
	b=p3ZqEIRfM59yQGrWJXfbKquZhmt8bCd54U815pwlz6/1qnEtwc1bLVNW0dNMW239ag
	Y91oGu3yMppLqqy+21sShPD+KIvAOoZnJ2syUv52dTgihe47Rvlj3QBWEiao+fIwmERI
	V4q/QPBmqpU32YOx3KSwXeddqIQic7hp2OBxAj+15ko9mWBrxkKGcNooXZt540Xvvz07
	5h2cmFwW/Qxztvz+z3MpTpAu79Cj0BtwuBbdUYfGrysI5lhpYDXUVNUnmJvD3JgRZNuG
	3bH4ZbwlR9bB+ju5Bd318MFP0hBFz20TOi10m1avV8X22JA62rQ2kGQe3hzqv5rZ1A9U
	I4Zg==
X-Received: by 10.68.177.162 with SMTP id cr2mr6741928pbc.179.1363174356788;
	Wed, 13 Mar 2013 04:32:36 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id tm1sm29223511pbc.11.2013.03.13.04.32.34
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 04:32:35 -0700 (PDT)
Date: Wed, 13 Mar 2013 12:32:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313113227.GF3260@jama>
References: <1362998354-7195-1-git-send-email-koen@dominion.thruhere.net>
	<20130313112457.GE3260@jama>
MIME-Version: 1.0
In-Reply-To: <20130313112457.GE3260@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-multimedia][PATCH 1/2] xbmc: first try at making it build for non-GLES platforms
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
X-List-Received-Date: Wed, 13 Mar 2013 11:49:28 -0000
X-Groupsio-MsgNum: 43517
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MZf7D3rAEoQgPanC"
Content-Disposition: inline

--MZf7D3rAEoQgPanC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2013 at 12:24:57PM +0100, Martin Jansa wrote:
> On Mon, Mar 11, 2013 at 11:39:13AM +0100, Koen Kooi wrote:
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>=20
> Hi,
>=20
> it still fails on qemuarm builds:
>=20
> | CPP     xbmc/cores/dvdplayer/DVDClock.o
> | In file included from DVDClock.cpp:25:0:
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-=
linux-gnueabi/xbmc/11.0-r14+gitrAUTOINC+82388d55dae79cbb2e486e307e23202e76a=
43efa/git/xbmc/utils/MathUtils.h: In member function 'int CDVDClock::Update=
Framerate(double, double*)':
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-=
linux-gnueabi/xbmc/11.0-r14+gitrAUTOINC+82388d55dae79cbb2e486e307e23202e76a=
43efa/git/xbmc/utils/MathUtils.h:101:28: error: impossible constraint in 'a=
sm'
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-=
linux-gnueabi/xbmc/11.0-r14+gitrAUTOINC+82388d55dae79cbb2e486e307e23202e76a=
43efa/git/xbmc/utils/MathUtils.h:101:28: error: impossible constraint in 'a=
sm'
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-=
linux-gnueabi/xbmc/11.0-r14+gitrAUTOINC+82388d55dae79cbb2e486e307e23202e76a=
43efa/git/xbmc/utils/MathUtils.h:101:28: error: impossible constraint in 'a=
sm'
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-=
linux-gnueabi/xbmc/11.0-r14+gitrAUTOINC+82388d55dae79cbb2e486e307e23202e76a=
43efa/git/xbmc/utils/MathUtils.h:101:28: error: impossible constraint in 'a=
sm'
> | make[1]: *** [DVDClock.o] Error 1
> | make: *** [xbmc/cores/dvdplayer/DVDPlayer.a] Error 2
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (see /home/jenkins/oe/shr-core-branc=
hes/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xbmc/11.0-r14+gitrAUT=
OINC+82388d55dae79cbb2e486e307e23202e76a43efa/temp/log.do_compile.30414 for=
 further information)
> NOTE: recipe xbmc-11.0-r14+gitrAUTOINC+82388d55dae79cbb2e486e307e23202e76=
a43efa: task do_compile: Failed
> ERROR: Task 7628 (/home/jenkins/oe/shr-core-branches/shr-core/meta-openem=
bedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, do_compile) fa=
iled with exit code '1'
>=20
> Full log:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130312_110444.log/

Ignore this one, another build with this patch actually included is
running now.

>=20
> > ---
> >  .../recipes-mediacentre/xbmc/xbmc_git.bb           |    7 ++++---
> >  1 files changed, 4 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/met=
a-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
> > index 74bf710..6331306 100644
> > --- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
> > +++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
> > @@ -3,13 +3,13 @@ DESCRIPTION =3D "XBMC Media Center"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE.GPL;md5=3D6eb631b6da7fdb01508a802=
13ffc35ff"
> > =20
> > -DEPENDS =3D "libusb1 libcec libplist expat yajl gperf-native libxmu fr=
ibidi mpeg2dec ffmpeg samba fontconfig curl python libass libmodplug libmic=
rohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virtual/egl m=
ysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca avahi libsamplera=
te0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-native zl=
ib libtinyxml"
> > +DEPENDS =3D "libmad libusb1 libcec libplist expat yajl gperf-native li=
bxmu fribidi mpeg2dec ffmpeg samba fontconfig curl python libass libmodplug=
 libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virtua=
l/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca avahi libs=
amplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-na=
tive zlib libtinyxml"
> >  #require recipes/egl/egl.inc
> > =20
> >  SRCREV =3D "82388d55dae79cbb2e486e307e23202e76a43efa"
> > =20
> >  PV =3D "11.0"
> > -PR =3D "r14"
> > +PR =3D "r15"
> >  PR_append =3D "+gitr${SRCPV}"
> >  SRC_URI =3D "git://github.com/xbmc/xbmc.git;branch=3Deden;protocol=3Dg=
it \
> >             file://0001-configure-don-t-run-python-distutils-to-find-ST=
AGING.patch \
> > @@ -26,13 +26,14 @@ CACHED_CONFIGUREVARS +=3D " \
> >   ac_cv_path_PYTHON=3D"${STAGING_BINDIR_NATIVE}/python-native/python" \
> >  "
> > =20
> > +
> >  EXTRA_OECONF =3D " \
> >   --disable-rpath \
> > - --enable-gles \
> >   --enable-libusb \
> >   --enable-airplay \
> >   --disable-optical-drive \
> >   --enable-external-libraries \
> > + ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-gl', '--enabl=
e-gles', d)} \
> >  "
> > =20
> >  FULL_OPTIMIZATION_armv7a =3D "-fexpensive-optimizations -fomit-frame-p=
ointer -O4 -ffast-math"
> > --=20
> > 1.7.7.6
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MZf7D3rAEoQgPanC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAY8sACgkQN1Ujt2V2gBwHYwCgrjGRoCP2JHTOP6QnkBZvyPAB
UR0AoKJ5h1p80ABenaDOeCEse0k97m/W
=+9bD
-----END PGP SIGNATURE-----

--MZf7D3rAEoQgPanC--
