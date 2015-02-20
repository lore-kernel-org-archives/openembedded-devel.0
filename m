Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id D9088716CE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2015 13:43:54 +0000 (UTC)
Received: by wevl61 with SMTP id l61so1541524wev.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2015 05:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=B0J1EDUMjnYRiE4QQQib4UYGQ42m0yOkM3oYsm5IHow=;
	b=QUKsjw257MET4XikwjThw+Dz2a7m1pkZH8ApbfvFfFaViFzPTk1fCQQCSUWa4eEO9t
	iLKfGB/WnVVB+mYCZgzxGa4n1euGbaEQZheGBxlW3qrLtUnV7dDHzcrQD7rB777qQw/m
	wETEllJie/kens3mL/KIumcBFuJazUCgd/9vAr8m3rqomLAtEavEZjp3DNyTag71mOkH
	YcBm2nBTLYIlmFXIvU2UCSk1Z7TM3vcZijRMBOWruPsz1INTd9cmftJ/jHn+EExCpPc/
	75zwEPNjimLZD3YXIeurcvgfyfi68I9p5ZPT2fAOW7Jk7DcUJc84/EQWhwCM3/IlW6Dp
	Z/Pw==
X-Received: by 10.194.75.193 with SMTP id e1mr18790077wjw.126.1424439834997;
	Fri, 20 Feb 2015 05:43:54 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fs8sm2467228wib.8.2015.02.20.05.43.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Feb 2015 05:43:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 20 Feb 2015 14:43:58 +0100
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20150220134358.GE2322@jama>
References: <1423788858-16687-1-git-send-email-gary@mlbassoc.com>
	<CA+chaQdfVy4bdE+-Yq7YakQ9pYnSkDLEGiqxAsVnkq7rP26KrA@mail.gmail.com>
	<54DD5AED.9050707@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <54DD5AED.9050707@mlbassoc.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] mplayer2: Remove blacklist
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
X-List-Received-Date: Fri, 20 Feb 2015 13:43:55 -0000
X-Groupsio-MsgNum: 54429
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B0nZA57HJSoPbsHY"
Content-Disposition: inline

--B0nZA57HJSoPbsHY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2015 at 07:01:17PM -0700, Gary Thomas wrote:
> On 2015-02-12 18:08, Martin Jansa wrote:
> > Does it have --enable-* options for the new PACKAGECONFIGs? If yes then=
 it should specify them as well (advantage at least in some projects is tha=
t when it explicitly asking for
> > foo and foo is unusable it will end with fatal error instead of ignorin=
g broken foo dependency.
>=20
> No, those are auto-discover and only have disable options.

Please add REQUIRED_DISTRO_FEATURES =3D "x11"
because it depends on couple of recipes which aren't available without
x11: xsp, libxv, virtual/libx11, libxscrnsaver

and it should set LICENSE_FLAGS like libpostproc has to resolve:
ERROR: Nothing PROVIDES 'libpostproc' (but meta-oe/meta-oe/recipes-multimed=
ia/mplayer/mplayer2_git.bb DEPENDS on or otherwise requires it)
ERROR: libpostproc was skipped: because it has a restricted license not whi=
telisted in LICENSE_FLAGS_WHITELIST

> > On Fri, Feb 13, 2015 at 1:54 AM, Gary Thomas <gary@mlbassoc.com <mailto=
:gary@mlbassoc.com>> wrote:
> >
> >     mplayer2 no longer needs to be blacklisted as OE-core has moved
> >     to libav_9.16.
> >
> >     [v2-v3] Also update build dependencies to quash QA warnings, using
> >     PACKAGECONFIG for most optional features.
> >
> >     Signed-off-by: Gary Thomas <gary@mlbassoc.com <mailto:gary@mlbassoc=
=2Ecom>>
> >     ---
> >       meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb <http://mplaye=
r2_git.bb> | 9 ++++++---
> >       1 file changed, 6 insertions(+), 3 deletions(-)
> >
> >     diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb <ht=
tp://mplayer2_git.bb> b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb =
<http://mplayer2_git.bb>
> >     index 7c04ff1..2de26b0 100644
> >     --- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb <http://mp=
layer2_git.bb>
> >     +++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb <http://mp=
layer2_git.bb>
> >     @@ -3,7 +3,7 @@ SECTION =3D "multimedia"
> >       HOMEPAGE =3D "http://www.mplayerhq.hu/"
> >       DEPENDS =3D "libvpx libdvdread libtheora virtual/libsdl ffmpeg xs=
p zlib \
> >                  libpng jpeg liba52 freetype fontconfig alsa-lib lzo nc=
urses \
> >     -           libxv virtual/libx11 libass speex faad2"
> >     +           libxv virtual/libx11 libass speex faad2 libxscrnsaver"
> >
> >       RDEPENDS_${PN} =3D "mplayer-common"
> >       PROVIDES =3D "mplayer"
> >     @@ -13,8 +13,6 @@ RCONFLICTS_${PN} =3D "mplayer"
> >       LICENSE =3D "GPLv3"
> >       LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd32239bcb673463ab874e8=
0d47fae504"
> >
> >     -PNBLACKLIST[mplayer2] ?=3D "Requires newer libav which has negativ=
e D_P"
> >     -
> >       SRC_URI =3D "git://repo.or.cz/mplayer.git <http://repo.or.cz/mpla=
yer.git> \
> >           file://0001-configure-don-t-disable-ASS-support-when-explicit=
ly-.patch \
> >       "
> >     @@ -109,9 +107,14 @@ EXTRA_OECONF =3D " \
> >       EXTRA_OECONF_append_armv6 =3D " --enable-armv6"
> >       EXTRA_OECONF_append_armv7a =3D " --enable-armv6 --enable-neon"
> >
> >     +PACKAGECONFIG ??=3D "vorbis postproc"
> >       PACKAGECONFIG[mad] =3D "--enable-mad,--disable-mad,libmad"
> >       PACKAGECONFIG[a52] =3D "--enable-liba52,--disable-liba52,liba52"
> >       PACKAGECONFIG[lame] =3D ",,lame"
> >     +PACKAGECONFIG[postproc] =3D ",--disable-libpostproc,libpostproc"
> >     +PACKAGECONFIG[vorbis] =3D ",--disable-libvorbis,libvorbis"
> >     +PACKAGECONFIG[portaudio] =3D ",--disable-portaudio,portaudio-v19"
> >     +PACKAGECONFIG[mpg123] =3D ",--disable-mpg123,mpg123"
> >
> >       FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-poi=
nter -frename-registers -O4 -ffast-math"
> >       BUILD_OPTIMIZATION =3D "${FULL_OPTIMIZATION}"
> >     --
> >     1.9.1
> >
> >     --
> >     _______________________________________________
> >     Openembedded-devel mailing list
> >     Openembedded-devel@lists.openembedded.org <mailto:Openembedded-deve=
l@lists.openembedded.org>
> >     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
>=20
> --=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--B0nZA57HJSoPbsHY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTnOh4ACgkQN1Ujt2V2gBxS9ACeOnHDdR8gfDl54f+t2j09K47o
bEAAn3rTfaVSPEV/jPpM4KJVSQPBf/kp
=9pDt
-----END PGP SIGNATURE-----

--B0nZA57HJSoPbsHY--
