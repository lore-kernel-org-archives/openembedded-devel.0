Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 55B8B77E8C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 20:55:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Oct 2017 13:55:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,371,1503385200"; 
   d="scan'208";a="856565"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga001.jf.intel.com with SMTP; 16 Oct 2017 13:55:41 -0700
Date: Mon, 16 Oct 2017 16:05:29 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-Id: <20171016160529.c8698d8408842a1b6df4aea5@linux.intel.com>
In-Reply-To: <CALbNGRSpy07F+E_Ou1_ieMAb0Y62PKDddxOBb+mvo2Qg-GG+LA@mail.gmail.com>
References: <20171016104228.18892-1-schnitzeltony@googlemail.com>
	<20171016124028.71360b0fba325a145b94bfbf@linux.intel.com>
	<CALbNGRSpy07F+E_Ou1_ieMAb0Y62PKDddxOBb+mvo2Qg-GG+LA@mail.gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 16 Oct 2017 20:55:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Oct 2017 21:44:23 +0200
Andreas M=FCller <schnitzeltony@googlemail.com> wrote:

> On Mon, Oct 16, 2017 at 7:40 PM, Leonardo Sandoval <
> leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>=20
> > On Mon, 16 Oct 2017 12:42:28 +0200
> > Andreas M=FCller <schnitzeltony@googlemail.com> wrote:
> >
> > > * project has moved from sourceforge to github
> > > * autotools was replaced by cmake [1]
> >
> > Worth noting that  license changed from LGPL-2.0+ to LPGL-2.1.
>=20
> Yes I forgot to mention
>=20
> > In case you send a v2, use a lower -M value for your git-format-patch
> > command, this may detect the rename.
> >
> I have
>=20
> [diff]
>     renames =3D true

I use git-format-patch which by defaults does renames with 50 of similarity=
 index (defined by -M). I believe there is a git-diff-config for the latter=
 value.

>=20
> in my .gitconfig which does this job fine usually. I think rename due to
> changes in almost all lines.
>=20
> V2 required?

worth it in my opinion.

I just format your patch with the -M2 and this is the output, indicating th=
at lots of stuff change but makes it easier to read.

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6=
.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb
similarity index 23%
rename from meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.=
bb
rename to meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb
index 88981e44b..754fadc2e 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb
@@ -1,23 +1,19 @@
 SUMMARY =3D "Fluidsynth is a software synthesizer"
 HOMEPAGE =3D "http://www.fluidsynth.org/"
 SECTION =3D "libs/multimedia"
-LICENSE =3D "LGPL-2.0+"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De198e9aac94943d0ec29a7dae8c2941=
6"
+LICENSE =3D "LGPL-2.1"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfc178bcd425090939a8b634d1d6a959=
4"
=20
 DEPENDS =3D "alsa-lib ncurses glib-2.0"
=20
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BP}/${BP}.tar.gz"
-SRC_URI[md5sum] =3D "ae5aca6de824b4173667cbd3a310b263"
-SRC_URI[sha256sum] =3D "50853391d9ebeda9b4db787efb23f98b1e26b7296dd2bb5d0d=
96b5bccee2171c"
+SRC_URI =3D "git://github.com/FluidSynth/fluidsynth.git;branch=3D1.1.x"
+SRCREV =3D "12e7afe3a806a6b397f28e0ca4bc6bab9ebe7047"
+S =3D "${WORKDIR}/git"
=20
-inherit autotools-brokensep pkgconfig lib_package
+inherit cmake pkgconfig lib_package
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d=
)}"
-PACKAGECONFIG[sndfile] =3D "--enable-libsndfile-support,--disable-libsndfi=
le-support,libsndfile1"
-PACKAGECONFIG[jack] =3D "--enable-jack-support,--disable-jack-support,jack"
-PACKAGECONFIG[pulseaudio] =3D "--enable-pulse-support,--disable-pulse-supp=
ort,pulseaudio"
-PACKAGECONFIG[portaudio] =3D "--enable-portaudio-support,--disable-portaud=
io-support,portaudio-v19"
-
-do_configure_prepend () {
-    rm -f ${S}/m4/*
-}
+PACKAGECONFIG[sndfile] =3D "-Denable-libsndfile-support=3DON,-Denable-libs=
ndfile-support=3DOFF,libsndfile1"
+PACKAGECONFIG[jack] =3D "-Denable-jack-support=3DON,-Denable-jack-support=
=3DOFF,jack"
+PACKAGECONFIG[pulseaudio] =3D "-Denable-pulseaudio=3DON,--Denable-pulseaud=
io=3DOFF,pulseaudio"
+PACKAGECONFIG[portaudio] =3D "-Denable-portaudio=3DON,-Denable-portaudio=
=3DOFF,portaudio-v19"



>=20
> Andreas
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

