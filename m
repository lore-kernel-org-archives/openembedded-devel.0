Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6D54671AD1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 14:50:08 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id d21so6388611pll.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 06:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+avYfM2RyhJpbE+2PMeBvws+iONv5FwHWbx1qheup3w=;
	b=BbV5OZ5DVrvv33nezoDZwVVWAnZfbkBitVqzFKRtP2gJC9fX3ye/MJ2oYxxDmBSjER
	fF+rZ5npbwYENapajyG1paAHuPeTqjG99rckWwqhaXHCp4M3QSYQBL2crcP/hI92d6vY
	yqc6U9oyx2Np2C6fRqnB/WX8wclGVrudAHr4KTUG+kA1YYIXrfOxSrgE8mpOeptYZOLd
	aeg7xBNPimtmxs3xRIA/2wwCIQ8LFltsQiBIJc91apKQhkc3OxGeGFeSDEMvvqnC0TrB
	6EIMO5+JiEjmCkNbZNOlusjl+YcpTC3q7fdk9P4RO6Horre5DrEhn/gE5H4MpWHNacPs
	Hqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+avYfM2RyhJpbE+2PMeBvws+iONv5FwHWbx1qheup3w=;
	b=Kd0k9IhJPZDbTOoHROg3ef9yLv2doRF+dGEgNcGmf/XoWQJQUf/SL7TWRF43D89xLw
	jhNUTVvacrZxN7Tn7UpwfA5+XcIKK0vE/28yVDnIFoTHaD4UehJd6+aAvLGoSb2ROkuS
	b2CFmEsIfZkw1UAE5z5+TqKHZNQhw1NSs4z4UpXj+e5nV0NwlNpFw+FRqVWfBvNzl88I
	8vGuZ7mElW61Tk+5OoybLhivw9XaeCcg4AwFbwxm4/OtOSVyQdBP9mx22j5TBhKzTnbY
	/hCK/lKO6ACIEe858NaA2Cp18GjM8GnQAbWEq8/5SmiuMwgSsbYPzsMb/wfSpxGrB3YJ
	dGIw==
X-Gm-Message-State: AJaThX6uSKmOJQNn9ri533gL9dTqjWB8ex+83MBNCI3sVg0Xx1NZN+3m
	F1UDolsmDXETC9UagCsH0fWo94ewJlDt1ljAxeI=
X-Google-Smtp-Source: AGs4zMa0f8ilR9paZunhtI9NL5F1ItRpSpte+8P0DoakeS2XOpoUkUPrWwv+ujJVmqFqEagCYZI4ZkuTYT5g2JpjhXA=
X-Received: by 10.84.217.2 with SMTP id o2mr6457004pli.338.1512139810346; Fri,
	01 Dec 2017 06:50:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Fri, 1 Dec 2017 06:49:39 -0800 (PST)
In-Reply-To: <20171201110816.13519-5-schnitzeltony@gmail.com>
References: <20171201110816.13519-1-schnitzeltony@gmail.com>
	<20171201110816.13519-5-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Dec 2017 06:49:39 -0800
Message-ID: <CAMKF1spQVcCKkpfBng=BdfvTyGyESKtMABy7gn_qqBK-2Fv5aA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 04/10] fluidsynth: performance improvements
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
X-List-Received-Date: Fri, 01 Dec 2017 14:50:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2017 at 3:08 AM, Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
> * Use floats instead of double for sound calculations. This improves
>   performance notable and was default for version 1.1.6 using autotools.
> * Fix buffer overrun when using floats
> * Make use of ARM NEON for multithreading enabled
>
> Performance and sound correctnes was tested with qtractor and a reworked
> version of fluidsynth-dssi [1-2]. Tests were performed for single- and
> multithreading enabled.
>
> [1] https://github.com/schnitzeltony/fluidsynth-dssi/commit/bad09c6f5c550=
8c5f5330aa5188510f975e50c50
> [2] https://github.com/schnitzeltony/meta-qt5-extra/blob/master/recipes-m=
isc/recipes-multimedia/fluidsynth/fluidsynth-dssi_1.0.0.bb
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  ...uffer-overrun-in-fluid_synth_nwrite_float.patch | 32 +++++++++
>  ...N-accelaration-for-float-multithreaded-se.patch | 76 ++++++++++++++++=
++++++
>  .../fluidsynth/fluidsynth_1.1.8.bb                 |  8 ++-
>  3 files changed, 114 insertions(+), 2 deletions(-)
>  create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/files/0=
001-avoid-buffer-overrun-in-fluid_synth_nwrite_float.patch
>  create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/files/0=
002-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch
>
> diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/files/0001-avo=
id-buffer-overrun-in-fluid_synth_nwrite_float.patch b/meta-multimedia/recip=
es-multimedia/fluidsynth/files/0001-avoid-buffer-overrun-in-fluid_synth_nwr=
ite_float.patch
> new file mode 100644
> index 0000000..dda76cf
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/fluidsynth/files/0001-avoid-buff=
er-overrun-in-fluid_synth_nwrite_float.patch
> @@ -0,0 +1,32 @@
> +From a13cb63103aa56b5e8bad816c7d13d6e01c0cd9f Mon Sep 17 00:00:00 2001
> +From: derselbst <tom.mbrt@googlemail.com>
> +Date: Sun, 26 Nov 2017 22:12:12 +0100
> +Subject: [PATCH 1/2] avoid buffer overrun in fluid_synth_nwrite_float()
> +
> +Upstream-Status: Backport [1]
> +
> +[1] https://github.com/FluidSynth/fluidsynth/commit/a13cb63103aa56b5e8ba=
d816c7d13d6e01c0cd9f
> +---
> + src/synth/fluid_synth.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/synth/fluid_synth.c b/src/synth/fluid_synth.c
> +index 266d759..14f6b21 100644
> +--- a/src/synth/fluid_synth.c
> ++++ b/src/synth/fluid_synth.c
> +@@ -2752,10 +2752,10 @@ fluid_synth_nwrite_float(fluid_synth_t* synth, i=
nt len,
> +     {
> + #ifdef WITH_FLOAT
> +       if(fx_left !=3D NULL)
> +-        FLUID_MEMCPY(fx_left[i + count], fx_left_in[i], bytes);
> ++        FLUID_MEMCPY(fx_left[i] + count, fx_left_in[i], bytes);
> +
> +       if(fx_right !=3D NULL)
> +-        FLUID_MEMCPY(fx_right[i + count], fx_right_in[i], bytes);
> ++        FLUID_MEMCPY(fx_right[i] + count, fx_right_in[i], bytes);
> + #else //WITH_FLOAT
> +       int j;
> +       if(fx_left !=3D NULL) {
> +--
> +2.9.5
> +
> diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/files/0002-Use=
-ARM-NEON-accelaration-for-float-multithreaded-se.patch b/meta-multimedia/r=
ecipes-multimedia/fluidsynth/files/0002-Use-ARM-NEON-accelaration-for-float=
-multithreaded-se.patch
> new file mode 100644
> index 0000000..0e1846e
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/fluidsynth/files/0002-Use-ARM-NE=
ON-accelaration-for-float-multithreaded-se.patch
> @@ -0,0 +1,76 @@
> +From 2de7e128fbdf528716b500cf27ed9a4358c931c9 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> +Date: Fri, 24 Nov 2017 00:05:35 +0100
> +Subject: [PATCH 2/2] Use ARM-NEON accelaration for float-multithreaded s=
etups
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +---
> + src/rvoice/fluid_rvoice_mixer.c | 26 ++++++++++++++++++++++++++
> + 1 file changed, 26 insertions(+)
> +
> +diff --git a/src/rvoice/fluid_rvoice_mixer.c b/src/rvoice/fluid_rvoice_m=
ixer.c
> +index 9616518..dbf8057 100644
> +--- a/src/rvoice/fluid_rvoice_mixer.c
> ++++ b/src/rvoice/fluid_rvoice_mixer.c
> +@@ -27,6 +27,10 @@
> + #include "fluid_ladspa.h"
> + #include "fluid_synth.h"
> +
> ++#if defined(__ARM_NEON__)
> ++#include "arm_neon.h"
> ++#endif
> ++
> +
> + #define ENABLE_MIXER_THREADS 1
> +
> +@@ -794,20 +798,42 @@ fluid_mixer_buffers_mix(fluid_mixer_buffers_t* des=
t, fluid_mixer_buffers_t* src)
> +   if (minbuf > src->buf_count)
> +     minbuf =3D src->buf_count;
> +   for (i=3D0; i < minbuf; i++) {
> ++#if defined(__ARM_NEON__) && defined(WITH_FLOAT)
> ++    for (j=3D0; j < scount; j+=3D4) {
> ++        float32x4_t vleft =3D vld1q_f32(&dest->left_buf[i][j]);
> ++        float32x4_t vright =3D vld1q_f32(&dest->right_buf[i][j]);
> ++        vleft =3D vaddq_f32(vleft, vld1q_f32(&src->left_buf[i][j]));
> ++        vright =3D vaddq_f32(vright, vld1q_f32(&src->right_buf[i][j]));
> ++        vst1q_f32(&dest->left_buf[i][j], vleft);
> ++        vst1q_f32(&dest->right_buf[i][j], vright);
> ++    }

I wonder if gcc could be initiated to see if it can vectorize the code, her=
e
have you tried setting cmdline options or may be pragma hints

> ++#else
> +     for (j=3D0; j < scount; j++) {
> +       dest->left_buf[i][j] +=3D src->left_buf[i][j];
> +       dest->right_buf[i][j] +=3D src->right_buf[i][j];
> +     }
> ++#endif
> +   }
> +
> +   minbuf =3D dest->fx_buf_count;
> +   if (minbuf > src->fx_buf_count)
> +     minbuf =3D src->fx_buf_count;
> +   for (i=3D0; i < minbuf; i++) {
> ++#if defined(__ARM_NEON__) && defined(WITH_FLOAT)
> ++    for (j=3D0; j < scount; j+=3D4) {
> ++        float32x4_t vleft =3D vld1q_f32(&dest->fx_left_buf[i][j]);
> ++        float32x4_t vright =3D vld1q_f32(&dest->fx_right_buf[i][j]);
> ++        vleft =3D vaddq_f32(vleft, vld1q_f32(&src->fx_left_buf[i][j]));
> ++        vright =3D vaddq_f32(vright, vld1q_f32(&src->fx_right_buf[i][j]=
));
> ++        vst1q_f32(&dest->fx_left_buf[i][j], vleft);
> ++        vst1q_f32(&dest->fx_right_buf[i][j], vright);
> ++    }
> ++#else
> +     for (j=3D0; j < scount; j++) {
> +       dest->fx_left_buf[i][j] +=3D src->fx_left_buf[i][j];
> +       dest->fx_right_buf[i][j] +=3D src->fx_right_buf[i][j];
> +     }
> ++#endif
> +   }
> + }
> +
> +--
> +2.9.5
> +
> diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1=
.8.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb
> index ef4c606..406bbf7 100644
> --- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb
> +++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb
> @@ -6,13 +6,17 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfc178bcd4250=
90939a8b634d1d6a9594"
>
>  DEPENDS =3D "alsa-lib ncurses glib-2.0"
>
> -SRC_URI =3D "git://github.com/FluidSynth/fluidsynth.git;branch=3D1.1.x"
> +SRC_URI =3D " \
> +    git://github.com/FluidSynth/fluidsynth.git;branch=3D1.1.x \
> +    file://0001-avoid-buffer-overrun-in-fluid_synth_nwrite_float.patch \
> +    file://0002-Use-ARM-NEON-accelaration-for-float-multithreaded-se.pat=
ch \
> +"
>  SRCREV =3D "12e7afe3a806a6b397f28e0ca4bc6bab9ebe7047"
>  S =3D "${WORKDIR}/git"
>
>  inherit cmake pkgconfig lib_package
>
> -EXTRA_OECMAKE =3D "-DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib', =
'')}"
> +EXTRA_OECMAKE =3D "-Denable-floats=3DON -DLIB_SUFFIX=3D${@d.getVar('base=
lib').replace('lib', '')}"
>
>  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio',=
 d)}"
>  PACKAGECONFIG[sndfile] =3D "-Denable-libsndfile-support=3DON,-Denable-li=
bsndfile-support=3DOFF,libsndfile1"
> --
> 2.9.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

