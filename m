Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BF7F171B86
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 17:30:39 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Oct 2017 10:30:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,387,1503385200"; d="scan'208";a="163250480"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by fmsmga005.fm.intel.com with SMTP; 16 Oct 2017 10:30:40 -0700
Date: Mon, 16 Oct 2017 12:40:28 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-Id: <20171016124028.71360b0fba325a145b94bfbf@linux.intel.com>
In-Reply-To: <20171016104228.18892-1-schnitzeltony@googlemail.com>
References: <20171016104228.18892-1-schnitzeltony@googlemail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] fluidsynth: update 1.1.6 -> 1.1.8
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
X-List-Received-Date: Mon, 16 Oct 2017 17:30:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Oct 2017 12:42:28 +0200
Andreas M=FCller <schnitzeltony@googlemail.com> wrote:

> * project has moved from sourceforge to github
> * autotools was replaced by cmake [1]

Worth noting that  license changed from LGPL-2.0+ to LPGL-2.1. In case you =
send a v2, use a lower -M value for your git-format-patch command, this may=
 detect the rename.

>=20
> [1] https://github.com/FluidSynth/fluidsynth/commit/3939941c5f3fdaef6bf92=
58fabd5725e7666554a
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../fluidsynth/fluidsynth_1.1.6.bb                 | 23 ----------------=
------
>  .../fluidsynth/fluidsynth_1.1.8.bb                 | 19 ++++++++++++++++=
++
>  2 files changed, 19 insertions(+), 23 deletions(-)
>  delete mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsy=
nth_1.1.6.bb
>  create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsy=
nth_1.1.8.bb
>=20
> diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1=
.6.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
> deleted file mode 100644
> index 88981e4..0000000
> --- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -SUMMARY =3D "Fluidsynth is a software synthesizer"
> -HOMEPAGE =3D "http://www.fluidsynth.org/"
> -SECTION =3D "libs/multimedia"
> -LICENSE =3D "LGPL-2.0+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De198e9aac94943d0ec29a7dae8c29=
416"
> -
> -DEPENDS =3D "alsa-lib ncurses glib-2.0"
> -
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BP}/${BP}.tar.gz"
> -SRC_URI[md5sum] =3D "ae5aca6de824b4173667cbd3a310b263"
> -SRC_URI[sha256sum] =3D "50853391d9ebeda9b4db787efb23f98b1e26b7296dd2bb5d=
0d96b5bccee2171c"
> -
> -inherit autotools-brokensep pkgconfig lib_package
> -
> -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio',=
 d)}"
> -PACKAGECONFIG[sndfile] =3D "--enable-libsndfile-support,--disable-libsnd=
file-support,libsndfile1"
> -PACKAGECONFIG[jack] =3D "--enable-jack-support,--disable-jack-support,ja=
ck"
> -PACKAGECONFIG[pulseaudio] =3D "--enable-pulse-support,--disable-pulse-su=
pport,pulseaudio"
> -PACKAGECONFIG[portaudio] =3D "--enable-portaudio-support,--disable-porta=
udio-support,portaudio-v19"
> -
> -do_configure_prepend () {
> -    rm -f ${S}/m4/*
> -}
> diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1=
.8.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb
> new file mode 100644
> index 0000000..754fadc
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb
> @@ -0,0 +1,19 @@
> +SUMMARY =3D "Fluidsynth is a software synthesizer"
> +HOMEPAGE =3D "http://www.fluidsynth.org/"
> +SECTION =3D "libs/multimedia"
> +LICENSE =3D "LGPL-2.1"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfc178bcd425090939a8b634d1d6a9=
594"
> +
> +DEPENDS =3D "alsa-lib ncurses glib-2.0"
> +
> +SRC_URI =3D "git://github.com/FluidSynth/fluidsynth.git;branch=3D1.1.x"
> +SRCREV =3D "12e7afe3a806a6b397f28e0ca4bc6bab9ebe7047"
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake pkgconfig lib_package
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio',=
 d)}"
> +PACKAGECONFIG[sndfile] =3D "-Denable-libsndfile-support=3DON,-Denable-li=
bsndfile-support=3DOFF,libsndfile1"
> +PACKAGECONFIG[jack] =3D "-Denable-jack-support=3DON,-Denable-jack-suppor=
t=3DOFF,jack"
> +PACKAGECONFIG[pulseaudio] =3D "-Denable-pulseaudio=3DON,--Denable-pulsea=
udio=3DOFF,pulseaudio"
> +PACKAGECONFIG[portaudio] =3D "-Denable-portaudio=3DON,-Denable-portaudio=
=3DOFF,portaudio-v19"
> --=20
> 2.9.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

