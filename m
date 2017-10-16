Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id A381C77E8C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 20:58:15 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id q42so4230543wrb.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 13:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DZdVKKWmuQgsTibEdel9FrDaFEd5m6NaHrqkkJvPB4w=;
	b=OpCmSjkRQcvDHzrNKieZCE0Ybjtc6bk/FRVEDhmDwcRBzMSGGdL2IIcFsHlafRClLf
	UJfkkGLLAGNYEnzRM4XTsf0qUjUXr1SY67j5RFKdm+BmuY/MtLI4Lz/U0amFZD/hfhHV
	tY47SWm2/8KR0DulJYP57LcmENArx3WrZ06Lhov6BoMA4CE3Fu9FSISN55dOATXwQ7d2
	DbW2EqCGFAMR7khYsCs6v2bBeycwUD7SXvUaG1ZDZHwqGyDV0Ij5ysdp0S3Td2+dd05i
	dnoc1C3d/NRJ8JBqvDpaYC8miiwgRdegkDqYgmdlXTp8z2544H2W5RaEaBz9diolS2Ya
	b7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DZdVKKWmuQgsTibEdel9FrDaFEd5m6NaHrqkkJvPB4w=;
	b=d5F9CZ/lcqpALCna9JYYTHK0PywCu5iiYRG/SpdTZts1lnh5U7Z5O6uu2eezYs8qlI
	VMvuN5ZsMFVNG95q2wgPe5OdEsfrCpzYjW0kr8WHHLSZAD588JQhxgnXY0K2Fd+KfOIx
	2t2C83MBgrkSi3EBdmzS4HlS/aPcMDqE9VqnR0lPiGVoictuDjONEMib4/NJkaHESbQm
	Xw7/UwYS8ctPHpsmQcYrdA/xhrMKaICHk5M3QPA9KyD9srSLIIILjda5mfYeErc0Z6b5
	KMdX8R8ZuTHU/elgJkMFN65rCgv20NGLUMfFrR/4oe305Wnncuyv5M9OcZq2oaXiP9wh
	Fwdg==
X-Gm-Message-State: AMCzsaV7tLLfBLf87SqAbmgZg6LPfCe5TEpKKFM2b9LQc/5UMJT17Sou
	sMCMSohMHQiZNG/lYCoGR3+cA/Rgk1vxCKnErYk=
X-Google-Smtp-Source: ABhQp+RE7xIHu8IG0uMbCAMkEJva4Cl4Ecrko24jius40Vn9gMaTB5m/2+Gn4LHmYGKsAcnOTV7b40yfFNS1qrFCCOs=
X-Received: by 10.223.155.203 with SMTP id e11mr1553639wrc.104.1508187496564; 
	Mon, 16 Oct 2017 13:58:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Mon, 16 Oct 2017 13:58:16 -0700 (PDT)
In-Reply-To: <20171016160529.c8698d8408842a1b6df4aea5@linux.intel.com>
References: <20171016104228.18892-1-schnitzeltony@googlemail.com>
	<20171016124028.71360b0fba325a145b94bfbf@linux.intel.com>
	<CALbNGRSpy07F+E_Ou1_ieMAb0Y62PKDddxOBb+mvo2Qg-GG+LA@mail.gmail.com>
	<20171016160529.c8698d8408842a1b6df4aea5@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 16 Oct 2017 22:58:16 +0200
Message-ID: <CA+chaQf0YhjxtdFqEYjuhPgdCBOqe38pvUYwqHXrgqq4dHAvHQ@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Mon, 16 Oct 2017 20:58:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's already in master-next, if it builds fine, I don't require v2 to be
sent.

On Mon, Oct 16, 2017 at 11:05 PM, Leonardo Sandoval <
leonardo.sandoval.gonzalez@linux.intel.com> wrote:

> On Mon, 16 Oct 2017 21:44:23 +0200
> Andreas M=C3=BCller <schnitzeltony@googlemail.com> wrote:
>
> > On Mon, Oct 16, 2017 at 7:40 PM, Leonardo Sandoval <
> > leonardo.sandoval.gonzalez@linux.intel.com> wrote:
> >
> > > On Mon, 16 Oct 2017 12:42:28 +0200
> > > Andreas M=C3=BCller <schnitzeltony@googlemail.com> wrote:
> > >
> > > > * project has moved from sourceforge to github
> > > > * autotools was replaced by cmake [1]
> > >
> > > Worth noting that  license changed from LGPL-2.0+ to LPGL-2.1.
> >
> > Yes I forgot to mention
> >
> > > In case you send a v2, use a lower -M value for your git-format-patch
> > > command, this may detect the rename.
> > >
> > I have
> >
> > [diff]
> >     renames =3D true
>
> I use git-format-patch which by defaults does renames with 50 of
> similarity index (defined by -M). I believe there is a git-diff-config fo=
r
> the latter value.
>
> >
> > in my .gitconfig which does this job fine usually. I think rename due t=
o
> > changes in almost all lines.
> >
> > V2 required?
>
> worth it in my opinion.
>
> I just format your patch with the -M2 and this is the output, indicating
> that lots of stuff change but makes it easier to read.
>
> diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsyn
> th_1.1.6.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsyn
> th_1.1.8.bb
> similarity index 23%
> rename from meta-multimedia/recipes-multimedia/fluidsynth/fluidsyn
> th_1.1.6.bb
> rename to meta-multimedia/recipes-multimedia/fluidsynth/fluidsyn
> th_1.1.8.bb
> index 88981e44b..754fadc2e 100644
> --- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
> +++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb
> @@ -1,23 +1,19 @@
>  SUMMARY =3D "Fluidsynth is a software synthesizer"
>  HOMEPAGE =3D "http://www.fluidsynth.org/"
>  SECTION =3D "libs/multimedia"
> -LICENSE =3D "LGPL-2.0+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De198e9aac94943d0ec29a7dae8c29=
416"
> +LICENSE =3D "LGPL-2.1"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfc178bcd425090939a8b634d1d6a9=
594"
>
>  DEPENDS =3D "alsa-lib ncurses glib-2.0"
>
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BP}/${BP}.tar.gz"
> -SRC_URI[md5sum] =3D "ae5aca6de824b4173667cbd3a310b263"
> -SRC_URI[sha256sum] =3D "50853391d9ebeda9b4db787efb23f9
> 8b1e26b7296dd2bb5d0d96b5bccee2171c"
> +SRC_URI =3D "git://github.com/FluidSynth/fluidsynth.git;branch=3D1.1.x"
> +SRCREV =3D "12e7afe3a806a6b397f28e0ca4bc6bab9ebe7047"
> +S =3D "${WORKDIR}/git"
>
> -inherit autotools-brokensep pkgconfig lib_package
> +inherit cmake pkgconfig lib_package
>
>  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio',
> d)}"
> -PACKAGECONFIG[sndfile] =3D "--enable-libsndfile-support,-
> -disable-libsndfile-support,libsndfile1"
> -PACKAGECONFIG[jack] =3D "--enable-jack-support,--disable-jack-support,ja=
ck"
> -PACKAGECONFIG[pulseaudio] =3D "--enable-pulse-support,--
> disable-pulse-support,pulseaudio"
> -PACKAGECONFIG[portaudio] =3D "--enable-portaudio-support,--
> disable-portaudio-support,portaudio-v19"
> -
> -do_configure_prepend () {
> -    rm -f ${S}/m4/*
> -}
> +PACKAGECONFIG[sndfile] =3D "-Denable-libsndfile-support=3D
> ON,-Denable-libsndfile-support=3DOFF,libsndfile1"
> +PACKAGECONFIG[jack] =3D "-Denable-jack-support=3DON,-
> Denable-jack-support=3DOFF,jack"
> +PACKAGECONFIG[pulseaudio] =3D "-Denable-pulseaudio=3DON,--
> Denable-pulseaudio=3DOFF,pulseaudio"
> +PACKAGECONFIG[portaudio] =3D "-Denable-portaudio=3DON,-Denable-portaudio=
=3DOFF,
> portaudio-v19"
>
>
>
> >
> > Andreas
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> --
> Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

