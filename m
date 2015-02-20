Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8C94B6B6B7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2015 14:33:55 +0000 (UTC)
Received: by wesx3 with SMTP id x3so5941490wes.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2015 06:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wD44mYDalAX8qVqJb8QXt9QkfUXEapOmmqgZ3AmaHCE=;
	b=SwuCZZqyQry4QTgx0stSpaVlji3RuL2h96/KFxOn8rfox2DeweRzsZ93tlMnHU8Pzq
	4S8J4nlqNU8Jt3wMeUY1n9c//49z9qBY9fATGUwnvoSfWq5H5Su6iPXk25ayOljfuoWd
	wZgSnMJoYufe884ZKF4W8/cPSUgZ/qHFJUTnfUKl0Apg5podjORMS1LNrVBWSTpYt6g1
	+jZ6hla/ZcOy1Y9pQZYQz3WKgliWlxQtQTo95fCzj/Zv4WTV+ZDmDD9qgEELSfAdaMTf
	X0u51urjxiFVW5ZDihBBnq2tHox1VFld+Sx95eizs+Av9IXXqPKIj3WPOZU5uA+NYZsE
	LpeA==
X-Received: by 10.180.74.111 with SMTP id s15mr6085764wiv.61.1424442836005;
	Fri, 20 Feb 2015 06:33:56 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	yy9sm42327427wjc.20.2015.02.20.06.33.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Feb 2015 06:33:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 20 Feb 2015 15:34:00 +0100
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20150220143400.GH2322@jama>
References: <1423788858-16687-1-git-send-email-gary@mlbassoc.com>
	<CA+chaQdfVy4bdE+-Yq7YakQ9pYnSkDLEGiqxAsVnkq7rP26KrA@mail.gmail.com>
	<54DD5AED.9050707@mlbassoc.com> <20150220134358.GE2322@jama>
	<54E73E6E.3040303@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <54E73E6E.3040303@mlbassoc.com>
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
X-List-Received-Date: Fri, 20 Feb 2015 14:33:55 -0000
X-Groupsio-MsgNum: 54431
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XjbSsFHOHxvQpKib"
Content-Disposition: inline

--XjbSsFHOHxvQpKib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2015 at 07:02:22AM -0700, Gary Thomas wrote:
> On 2015-02-20 06:43, Martin Jansa wrote:
> > On Thu, Feb 12, 2015 at 07:01:17PM -0700, Gary Thomas wrote:
> >> On 2015-02-12 18:08, Martin Jansa wrote:
> >>> Does it have --enable-* options for the new PACKAGECONFIGs? If yes th=
en it should specify them as well (advantage at least in some projects is t=
hat when it explicitly asking for
> >>> foo and foo is unusable it will end with fatal error instead of ignor=
ing broken foo dependency.
> >>
> >> No, those are auto-discover and only have disable options.
> >
> > Please add REQUIRED_DISTRO_FEATURES =3D "x11"
> > because it depends on couple of recipes which aren't available without
> > x11: xsp, libxv, virtual/libx11, libxscrnsaver
> >
> > and it should set LICENSE_FLAGS like libpostproc has to resolve:
> > ERROR: Nothing PROVIDES 'libpostproc' (but meta-oe/meta-oe/recipes-mult=
imedia/mplayer/mplayer2_git.bb DEPENDS on or otherwise requires it)
> > ERROR: libpostproc was skipped: because it has a restricted license not=
 whitelisted in LICENSE_FLAGS_WHITELIST
>=20
> Is there a way to make these conditional?  For example, you could build
> without libpostproc and the result would not need the commercial license.
> There may also be a way to build without X11, but I've not investigated
> that yet.

You have added postproc to default PACKAGECONFIG, I haven't tried if it
works without it. The same for x11 related dependencies.

> >>> On Fri, Feb 13, 2015 at 1:54 AM, Gary Thomas <gary@mlbassoc.com <mail=
to:gary@mlbassoc.com>> wrote:
> >>>
> >>>      mplayer2 no longer needs to be blacklisted as OE-core has moved
> >>>      to libav_9.16.
> >>>
> >>>      [v2-v3] Also update build dependencies to quash QA warnings, usi=
ng
> >>>      PACKAGECONFIG for most optional features.
> >>>
> >>>      Signed-off-by: Gary Thomas <gary@mlbassoc.com <mailto:gary@mlbas=
soc.com>>
> >>>      ---
> >>>        meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb <http://mpl=
ayer2_git.bb> | 9 ++++++---
> >>>        1 file changed, 6 insertions(+), 3 deletions(-)
> >>>
> >>>      diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb =
<http://mplayer2_git.bb> b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.=
bb <http://mplayer2_git.bb>
> >>>      index 7c04ff1..2de26b0 100644
> >>>      --- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb <http:/=
/mplayer2_git.bb>
> >>>      +++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb <http:/=
/mplayer2_git.bb>
> >>>      @@ -3,7 +3,7 @@ SECTION =3D "multimedia"
> >>>        HOMEPAGE =3D "http://www.mplayerhq.hu/"
> >>>        DEPENDS =3D "libvpx libdvdread libtheora virtual/libsdl ffmpeg=
 xsp zlib \
> >>>                   libpng jpeg liba52 freetype fontconfig alsa-lib lzo=
 ncurses \
> >>>      -           libxv virtual/libx11 libass speex faad2"
> >>>      +           libxv virtual/libx11 libass speex faad2 libxscrnsave=
r"
> >>>
> >>>        RDEPENDS_${PN} =3D "mplayer-common"
> >>>        PROVIDES =3D "mplayer"
> >>>      @@ -13,8 +13,6 @@ RCONFLICTS_${PN} =3D "mplayer"
> >>>        LICENSE =3D "GPLv3"
> >>>        LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd32239bcb673463ab87=
4e80d47fae504"
> >>>
> >>>      -PNBLACKLIST[mplayer2] ?=3D "Requires newer libav which has nega=
tive D_P"
> >>>      -
> >>>        SRC_URI =3D "git://repo.or.cz/mplayer.git <http://repo.or.cz/m=
player.git> \
> >>>            file://0001-configure-don-t-disable-ASS-support-when-expli=
citly-.patch \
> >>>        "
> >>>      @@ -109,9 +107,14 @@ EXTRA_OECONF =3D " \
> >>>        EXTRA_OECONF_append_armv6 =3D " --enable-armv6"
> >>>        EXTRA_OECONF_append_armv7a =3D " --enable-armv6 --enable-neon"
> >>>
> >>>      +PACKAGECONFIG ??=3D "vorbis postproc"
> >>>        PACKAGECONFIG[mad] =3D "--enable-mad,--disable-mad,libmad"
> >>>        PACKAGECONFIG[a52] =3D "--enable-liba52,--disable-liba52,liba5=
2"
> >>>        PACKAGECONFIG[lame] =3D ",,lame"
> >>>      +PACKAGECONFIG[postproc] =3D ",--disable-libpostproc,libpostproc"
> >>>      +PACKAGECONFIG[vorbis] =3D ",--disable-libvorbis,libvorbis"
> >>>      +PACKAGECONFIG[portaudio] =3D ",--disable-portaudio,portaudio-v1=
9"
> >>>      +PACKAGECONFIG[mpg123] =3D ",--disable-mpg123,mpg123"
> >>>
> >>>        FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-=
pointer -frename-registers -O4 -ffast-math"
> >>>        BUILD_OPTIMIZATION =3D "${FULL_OPTIMIZATION}"
> >>>      --
> >>>      1.9.1
> >>>
> >>>      --
> >>>      _______________________________________________
> >>>      Openembedded-devel mailing list
> >>>      Openembedded-devel@lists.openembedded.org <mailto:Openembedded-d=
evel@lists.openembedded.org>
> >>>      http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>
> >>>
> >>
> >> --
> >> ------------------------------------------------------------
> >> Gary Thomas                 |  Consulting for the
> >> MLB Associates              |    Embedded world
> >> ------------------------------------------------------------
> >
>=20
> --=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XjbSsFHOHxvQpKib
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTnRdgACgkQN1Ujt2V2gBy+UwCguThSiKjEWEL75Pc7fOX6iWQW
8SoAoLLRGkCCXvlz6GrA96Sa4Ljj8lc1
=mYYr
-----END PGP SIGNATURE-----

--XjbSsFHOHxvQpKib--
