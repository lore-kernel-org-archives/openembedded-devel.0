Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmkxR-0003Lk-UQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:47:09 +0100
Received: by mail-ee0-f48.google.com with SMTP id b57so3242835eek.21
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=DWoHZi1eyZoR+AUk49wsYVqF6NNr9qqVg2ANFCME5eI=;
	b=vSbEXeaJXGlQPw+hp7oq4JirF+DXDwqRxcTpSC3xwHxvAZ2Fq45Git+ty4AfQwsI1Z
	QBu7V3vUu8DbPUJa3FvnBWHgpDIc7q+bFgr+k+jLwCbA3sHTPVECjjEpyViCNCYqBm6K
	1unFBGggOIUx9MvBDmSDXAueXfZHeQcR0T+JOclXZo2kusJR41ZoLHlvjuaJSLEBAvKe
	9O5s97chzp2mE8tanGh230khUqWzBj9oRt4beuKTTgbqvSSZkNrP3F0in60ifQuhA7ZH
	REkBCIHHKOhhTsYXqBS/X/numZSrv1usd7fKYr9YcSD9vjxhN+Wmsun/CZQeOcg9s4QA
	1K6g==
X-Received: by 10.14.0.71 with SMTP id 47mr47443613eea.19.1356265941633;
	Sun, 23 Dec 2012 04:32:21 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id k4sm34614478eep.15.2012.12.23.04.32.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:32:21 -0800 (PST)
Date: Sun, 23 Dec 2012 13:32:18 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121223123218.GH8988@jama.palm1.palmone.com>
References: <1356098450-27475-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1356098450-27475-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][meta-multimedia][PATCH 1/6] xbmc: first try at making it build for non-GLES platforms
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
X-List-Received-Date: Sun, 23 Dec 2012 12:47:10 -0000
X-Groupsio-MsgNum: 42360
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IbVRjBtIbJdbeK1C"
Content-Disposition: inline

--IbVRjBtIbJdbeK1C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 21, 2012 at 03:00:45PM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
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

Here it fails on libmad detection:
| configure:21352: checking for libmad soname
| configure:21378: result: no
| configure:21381: error: Unable to determine soname of libmad library

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IbVRjBtIbJdbeK1C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDW+dIACgkQN1Ujt2V2gBy+kACgtHq0u8jMGq2JWPAEea33JkBP
lKMAoKG6hIlE8yp0wSX2wcr9fVerbQqS
=ahse
-----END PGP SIGNATURE-----

--IbVRjBtIbJdbeK1C--
