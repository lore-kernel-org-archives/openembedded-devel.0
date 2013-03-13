Received: from mail-yh0-f49.google.com ([209.85.213.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFotn-0007lH-FT
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 17:51:47 +0100
Received: by mail-yh0-f49.google.com with SMTP id m1so205737yhg.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=wm88V51mf20Kxsx/wboOkfEii+g8KVrHahN+uMEb1vs=;
	b=nmBxD5jBHSVE9Yzulc63BYicXngaj/x0tJGKev3NJ0bE4cJLWJ800MF/kF94s8XyYK
	IxmkfDpbgjntbPrCssP1KEq0qWGCZjX1q9dhoVLZ0RY3WMPiCo09kgXaGy/3lZL0Ej3c
	CFkJ++aUud9DYpI1FohywiFjIJFW57x+Evj6QFZAwyJX54HLdHoJpaBM7fHKf97LZDPc
	Pcjmlt0aCnmkQ1U4DDcNHIIiWOr3RsdElcLZqrkzjuMwQUMlxTlokyPj25b2AWNkgd6L
	/qIr7MjWe0AZofkejubVQaaekZguuzQSJOvYCRGstV7P7QRZwKuhtT0U7Q72hTr6OHjx
	vBFw==
X-Received: by 10.236.197.71 with SMTP id s47mr15936232yhn.78.1363192490075;
	Wed, 13 Mar 2013 09:34:50 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id q26sm36300453yhl.22.2013.03.13.09.34.47
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:34:49 -0700 (PDT)
Date: Wed, 13 Mar 2013 17:34:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313163442.GQ3260@jama>
References: <1362998354-7195-1-git-send-email-koen@dominion.thruhere.net>
	<20130313112457.GE3260@jama> <20130313113227.GF3260@jama>
MIME-Version: 1.0
In-Reply-To: <20130313113227.GF3260@jama>
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
X-List-Received-Date: Wed, 13 Mar 2013 16:51:54 -0000
X-Groupsio-MsgNum: 43529
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y9o+fgG4MNl0mnzl"
Content-Disposition: inline

--Y9o+fgG4MNl0mnzl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2013 at 12:32:27PM +0100, Martin Jansa wrote:
> On Wed, Mar 13, 2013 at 12:24:57PM +0100, Martin Jansa wrote:
> > On Mon, Mar 11, 2013 at 11:39:13AM +0100, Koen Kooi wrote:
> > > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >=20
> > Hi,
> >=20
> > it still fails on qemuarm builds:
> >=20
> > | CPP     xbmc/cores/dvdplayer/DVDClock.o
> > | In file included from DVDClock.cpp:25:0:
> > | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-o=
e-linux-gnueabi/xbmc/11.0-r14+gitrAUTOINC+82388d55dae79cbb2e486e307e23202e7=
6a43efa/git/xbmc/utils/MathUtils.h: In member function 'int CDVDClock::Upda=
teFramerate(double, double*)':
> > | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-o=
e-linux-gnueabi/xbmc/11.0-r14+gitrAUTOINC+82388d55dae79cbb2e486e307e23202e7=
6a43efa/git/xbmc/utils/MathUtils.h:101:28: error: impossible constraint in =
'asm'
> > | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-o=
e-linux-gnueabi/xbmc/11.0-r14+gitrAUTOINC+82388d55dae79cbb2e486e307e23202e7=
6a43efa/git/xbmc/utils/MathUtils.h:101:28: error: impossible constraint in =
'asm'
> > | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-o=
e-linux-gnueabi/xbmc/11.0-r14+gitrAUTOINC+82388d55dae79cbb2e486e307e23202e7=
6a43efa/git/xbmc/utils/MathUtils.h:101:28: error: impossible constraint in =
'asm'
> > | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-o=
e-linux-gnueabi/xbmc/11.0-r14+gitrAUTOINC+82388d55dae79cbb2e486e307e23202e7=
6a43efa/git/xbmc/utils/MathUtils.h:101:28: error: impossible constraint in =
'asm'
> > | make[1]: *** [DVDClock.o] Error 1
> > | make: *** [xbmc/cores/dvdplayer/DVDPlayer.a] Error 2
> > | ERROR: oe_runmake failed
> > | ERROR: Function failed: do_compile (see /home/jenkins/oe/shr-core-bra=
nches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xbmc/11.0-r14+gitrA=
UTOINC+82388d55dae79cbb2e486e307e23202e76a43efa/temp/log.do_compile.30414 f=
or further information)
> > NOTE: recipe xbmc-11.0-r14+gitrAUTOINC+82388d55dae79cbb2e486e307e23202e=
76a43efa: task do_compile: Failed
> > ERROR: Task 7628 (/home/jenkins/oe/shr-core-branches/shr-core/meta-open=
embedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, do_compile) =
failed with exit code '1'
> >=20
> > Full log:
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world=
=2E20130312_110444.log/
>=20
> Ignore this one, another build with this patch actually included is
> running now.

Ignore ignored, it still fails like this with r15.

>=20
> >=20
> > > ---
> > >  .../recipes-mediacentre/xbmc/xbmc_git.bb           |    7 ++++---
> > >  1 files changed, 4 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/m=
eta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
> > > index 74bf710..6331306 100644
> > > --- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
> > > +++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
> > > @@ -3,13 +3,13 @@ DESCRIPTION =3D "XBMC Media Center"
> > >  LICENSE =3D "GPLv2"
> > >  LIC_FILES_CHKSUM =3D "file://LICENSE.GPL;md5=3D6eb631b6da7fdb01508a8=
0213ffc35ff"
> > > =20
> > > -DEPENDS =3D "libusb1 libcec libplist expat yajl gperf-native libxmu =
fribidi mpeg2dec ffmpeg samba fontconfig curl python libass libmodplug libm=
icrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virtual/egl=
 mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca avahi libsample=
rate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-native =
zlib libtinyxml"
> > > +DEPENDS =3D "libmad libusb1 libcec libplist expat yajl gperf-native =
libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl python libass libmodpl=
ug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virt=
ual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca avahi li=
bsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-=
native zlib libtinyxml"
> > >  #require recipes/egl/egl.inc
> > > =20
> > >  SRCREV =3D "82388d55dae79cbb2e486e307e23202e76a43efa"
> > > =20
> > >  PV =3D "11.0"
> > > -PR =3D "r14"
> > > +PR =3D "r15"
> > >  PR_append =3D "+gitr${SRCPV}"
> > >  SRC_URI =3D "git://github.com/xbmc/xbmc.git;branch=3Deden;protocol=
=3Dgit \
> > >             file://0001-configure-don-t-run-python-distutils-to-find-=
STAGING.patch \
> > > @@ -26,13 +26,14 @@ CACHED_CONFIGUREVARS +=3D " \
> > >   ac_cv_path_PYTHON=3D"${STAGING_BINDIR_NATIVE}/python-native/python"=
 \
> > >  "
> > > =20
> > > +
> > >  EXTRA_OECONF =3D " \
> > >   --disable-rpath \
> > > - --enable-gles \
> > >   --enable-libusb \
> > >   --enable-airplay \
> > >   --disable-optical-drive \
> > >   --enable-external-libraries \
> > > + ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-gl', '--ena=
ble-gles', d)} \
> > >  "
> > > =20
> > >  FULL_OPTIMIZATION_armv7a =3D "-fexpensive-optimizations -fomit-frame=
-pointer -O4 -ffast-math"
> > > --=20
> > > 1.7.7.6
> > >=20
> > >=20
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
>=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Y9o+fgG4MNl0mnzl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAqqIACgkQN1Ujt2V2gBwDLgCfZgneKyr2wL52zcgHp2HOSq21
byMAnRMjMxRmUlvC/zVwPAMjTDvV/FYF
=+KKn
-----END PGP SIGNATURE-----

--Y9o+fgG4MNl0mnzl--
