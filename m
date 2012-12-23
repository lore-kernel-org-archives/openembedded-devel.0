Received: from mail-ea0-f172.google.com ([209.85.215.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmrZz-0000rG-Fb
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 20:51:23 +0100
Received: by mail-ea0-f172.google.com with SMTP id a1so2703975eaa.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 11:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=dEbn+FBOIqHhfRW/AI+0ZtfMpciE9yDr+8eJyVHMfA4=;
	b=lDt5dGMPonNnCk708Ou54uKeNURNYloPcxvJ3IrJ42oVaGE6Zrj4zTbZ6/kriCvDjT
	gTz9ptRQorrK6ypafatWoeuD0JPGd1ujANVzHDUOg/vvcWTPUyzwUQ19LLsoWOuZeYuF
	fg3b7V6IUIXpmc5u8V2Rh7nuHNXOT3uP4ums/aFUwOsZoz9Dpl0qA0kHfAMvIpTRYE3R
	E2EhitLF/L/wqakKvym2YNmLiZSZYt676v0wzjvPSlQoSC3zo5yt5E3BsWEwdimM+Klt
	whM2u6BpL4A0NEmOG/HWZb4e/jDUo1o/8BGGw9udWFAZy9F0j3rG0WfN/ds8pUMl7YX8
	BXHg==
X-Received: by 10.14.203.8 with SMTP id e8mr50291467eeo.2.1356291394756;
	Sun, 23 Dec 2012 11:36:34 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b49sm36689525eem.16.2012.12.23.11.36.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 11:36:34 -0800 (PST)
Date: Sun, 23 Dec 2012 20:36:35 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20121223193635.GK8988@jama.palm1.palmone.com>
References: <1356098450-27475-1-git-send-email-koen@dominion.thruhere.net>
	<20121223123218.GH8988@jama.palm1.palmone.com>
	<171D86C5-6254-4C2D-BF07-D18D7BA2194B@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <171D86C5-6254-4C2D-BF07-D18D7BA2194B@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Sun, 23 Dec 2012 19:51:23 -0000
X-Groupsio-MsgNum: 42379
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cEobB2knsyc5ebfU"
Content-Disposition: inline

--cEobB2knsyc5ebfU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 23, 2012 at 08:34:05PM +0100, Koen Kooi wrote:
>=20
> Op 23 dec. 2012, om 13:32 heeft Martin Jansa <martin.jansa@gmail.com> het=
 volgende geschreven:
>=20
> > On Fri, Dec 21, 2012 at 03:00:45PM +0100, Koen Kooi wrote:
> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >> ---
> >> .../recipes-mediacentre/xbmc/xbmc_git.bb           |    7 ++++---
> >> 1 files changed, 4 insertions(+), 3 deletions(-)
> >>=20
> >> diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/me=
ta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
> >> index 74bf710..6331306 100644
> >> --- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
> >> +++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
> >> @@ -3,13 +3,13 @@ DESCRIPTION =3D "XBMC Media Center"
> >> LICENSE =3D "GPLv2"
> >> LIC_FILES_CHKSUM =3D "file://LICENSE.GPL;md5=3D6eb631b6da7fdb01508a802=
13ffc35ff"
> >>=20
> >> -DEPENDS =3D "libusb1 libcec libplist expat yajl gperf-native libxmu f=
ribidi mpeg2dec ffmpeg samba fontconfig curl python libass libmodplug libmi=
crohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virtual/egl =
mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca avahi libsampler=
ate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-native z=
lib libtinyxml"
> >> +DEPENDS =3D "libmad libusb1 libcec libplist expat yajl gperf-native l=
ibxmu fribidi mpeg2dec ffmpeg samba fontconfig curl python libass libmodplu=
g libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virtu=
al/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca avahi lib=
samplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-n=
ative zlib libtinyxml"
> >> #require recipes/egl/egl.inc
> >>=20
> >> SRCREV =3D "82388d55dae79cbb2e486e307e23202e76a43efa"
> >>=20
> >> PV =3D "11.0"
> >> -PR =3D "r14"
> >> +PR =3D "r15"
> >> PR_append =3D "+gitr${SRCPV}"
> >> SRC_URI =3D "git://github.com/xbmc/xbmc.git;branch=3Deden;protocol=3Dg=
it \
> >>            file://0001-configure-don-t-run-python-distutils-to-find-ST=
AGING.patch \
> >> @@ -26,13 +26,14 @@ CACHED_CONFIGUREVARS +=3D " \
> >>  ac_cv_path_PYTHON=3D"${STAGING_BINDIR_NATIVE}/python-native/python" \
> >> "
> >>=20
> >> +
> >> EXTRA_OECONF =3D " \
> >>  --disable-rpath \
> >> - --enable-gles \
> >>  --enable-libusb \
> >>  --enable-airplay \
> >>  --disable-optical-drive \
> >>  --enable-external-libraries \
> >> + ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-gl', '--enab=
le-gles', d)} \
> >> "
> >>=20
> >> FULL_OPTIMIZATION_armv7a =3D "-fexpensive-optimizations -fomit-frame-p=
ointer -O4 -ffast-math"
> >=20
> > Here it fails on libmad detection:
> > | configure:21352: checking for libmad soname
> > | configure:21378: result: no
> > | configure:21381: error: Unable to determine soname of libmad library
>=20
> Which architecture? I saw this on x86, but not on armv7a. It should be fi=
xed either way, though :)

armv5te (qemuarm).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cEobB2knsyc5ebfU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDXXUMACgkQN1Ujt2V2gBxCXgCfRhZTeWjNijB8OK1fgXOLU0GX
BDoAoKp96wRrKkWSNFpAmwAvFQ6WsrF4
=rdBr
-----END PGP SIGNATURE-----

--cEobB2knsyc5ebfU--
