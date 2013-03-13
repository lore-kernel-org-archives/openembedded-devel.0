Received: from mail-da0-f42.google.com ([209.85.210.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFk43-0006SC-Oj
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 12:42:05 +0100
Received: by mail-da0-f42.google.com with SMTP id n15so372946dad.29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 04:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=u0ECI4Z47mUX1OfVRkD+czOulirqUowGD1hI+x3+Z9k=;
	b=jH0lZHXW7lZe7jdfJdBXP6jkgSeQnMFbYxJI/U3uVhySIXLI30aEOnF94kpkYGb7a/
	++1cwFFlRbriLH7JxZZlSYHUrGlS4mNFrrnZozwv+5uZO8sKPHISPCynwE3SaOdMXYZ5
	vWqqxLJd0UVDKRLgo2qkihGDc95tY2ZmpY2SBplswzuAa4lqHAiDNGvj2dawzKpk1MO0
	BnbEo98APDTU5gAhaNm0TCbUDAyTabvEVRnUw3vLs+7s7ASxoXAxV5JvYBkF2wMSJHqI
	d5p6g+53FJRXHVO4k70lDuHM9O+ufKWB89o63hgCzsCD5OBH0qr1rlR778vEvDlahmgP
	L/jg==
X-Received: by 10.68.196.225 with SMTP id ip1mr45488704pbc.72.1363173906291;
	Wed, 13 Mar 2013 04:25:06 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qd8sm29168107pbc.29.2013.03.13.04.25.03
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 04:25:05 -0700 (PDT)
Date: Wed, 13 Mar 2013 12:24:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313112457.GE3260@jama>
References: <1362998354-7195-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1362998354-7195-1-git-send-email-koen@dominion.thruhere.net>
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
X-List-Received-Date: Wed, 13 Mar 2013 11:42:05 -0000
X-Groupsio-MsgNum: 43516
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JBi0ZxuS5uaEhkUZ"
Content-Disposition: inline

--JBi0ZxuS5uaEhkUZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2013 at 11:39:13AM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Hi,

it still fails on qemuarm builds:

| CPP     xbmc/cores/dvdplayer/DVDClock.o
| In file included from DVDClock.cpp:25:0:
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/xbmc/11.0-r14+gitrAUTOINC+82388d55dae79cbb2e486e307e23202e76a43=
efa/git/xbmc/utils/MathUtils.h: In member function 'int CDVDClock::UpdateFr=
amerate(double, double*)':
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/xbmc/11.0-r14+gitrAUTOINC+82388d55dae79cbb2e486e307e23202e76a43=
efa/git/xbmc/utils/MathUtils.h:101:28: error: impossible constraint in 'asm'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/xbmc/11.0-r14+gitrAUTOINC+82388d55dae79cbb2e486e307e23202e76a43=
efa/git/xbmc/utils/MathUtils.h:101:28: error: impossible constraint in 'asm'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/xbmc/11.0-r14+gitrAUTOINC+82388d55dae79cbb2e486e307e23202e76a43=
efa/git/xbmc/utils/MathUtils.h:101:28: error: impossible constraint in 'asm'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/xbmc/11.0-r14+gitrAUTOINC+82388d55dae79cbb2e486e307e23202e76a43=
efa/git/xbmc/utils/MathUtils.h:101:28: error: impossible constraint in 'asm'
| make[1]: *** [DVDClock.o] Error 1
| make: *** [xbmc/cores/dvdplayer/DVDPlayer.a] Error 2
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see /home/jenkins/oe/shr-core-branche=
s/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xbmc/11.0-r14+gitrAUTOI=
NC+82388d55dae79cbb2e486e307e23202e76a43efa/temp/log.do_compile.30414 for f=
urther information)
NOTE: recipe xbmc-11.0-r14+gitrAUTOINC+82388d55dae79cbb2e486e307e23202e76a4=
3efa: task do_compile: Failed
ERROR: Task 7628 (/home/jenkins/oe/shr-core-branches/shr-core/meta-openembe=
dded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, do_compile) fail=
ed with exit code '1'

Full log:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30312_110444.log/

> ---
>  .../recipes-mediacentre/xbmc/xbmc_git.bb           |    7 ++++---
>  1 files changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/meta-=
multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
> index 74bf710..6331306 100644
> --- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
> +++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
> @@ -3,13 +3,13 @@ DESCRIPTION =3D "XBMC Media Center"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.GPL;md5=3D6eb631b6da7fdb01508a80213=
ffc35ff"
> =20
> -DEPENDS =3D "libusb1 libcec libplist expat yajl gperf-native libxmu frib=
idi mpeg2dec ffmpeg samba fontconfig curl python libass libmodplug libmicro=
httpd wavpack libmms cmake-native libsdl-image libsdl-mixer virtual/egl mys=
ql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca avahi libsamplerate=
0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-native zlib=
 libtinyxml"
> +DEPENDS =3D "libmad libusb1 libcec libplist expat yajl gperf-native libx=
mu fribidi mpeg2dec ffmpeg samba fontconfig curl python libass libmodplug l=
ibmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virtual/=
egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca avahi libsam=
plerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-nati=
ve zlib libtinyxml"
>  #require recipes/egl/egl.inc
> =20
>  SRCREV =3D "82388d55dae79cbb2e486e307e23202e76a43efa"
> =20
>  PV =3D "11.0"
> -PR =3D "r14"
> +PR =3D "r15"
>  PR_append =3D "+gitr${SRCPV}"
>  SRC_URI =3D "git://github.com/xbmc/xbmc.git;branch=3Deden;protocol=3Dgit=
 \
>             file://0001-configure-don-t-run-python-distutils-to-find-STAG=
ING.patch \
> @@ -26,13 +26,14 @@ CACHED_CONFIGUREVARS +=3D " \
>   ac_cv_path_PYTHON=3D"${STAGING_BINDIR_NATIVE}/python-native/python" \
>  "
> =20
> +
>  EXTRA_OECONF =3D " \
>   --disable-rpath \
> - --enable-gles \
>   --enable-libusb \
>   --enable-airplay \
>   --disable-optical-drive \
>   --enable-external-libraries \
> + ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-gl', '--enable-=
gles', d)} \
>  "
> =20
>  FULL_OPTIMIZATION_armv7a =3D "-fexpensive-optimizations -fomit-frame-poi=
nter -O4 -ffast-math"
> --=20
> 1.7.7.6
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JBi0ZxuS5uaEhkUZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAYgkACgkQN1Ujt2V2gBwJgwCeJta6iNvYShcUb1j2HzOrgz5r
nXsAn1GbbQAgkby/Vu6VolQjhJcefBIx
=ZAHF
-----END PGP SIGNATURE-----

--JBi0ZxuS5uaEhkUZ--
