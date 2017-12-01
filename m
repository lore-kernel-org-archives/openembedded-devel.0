Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f196.google.com (mail-yb0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1A997786BF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 17:35:45 +0000 (UTC)
Received: by mail-yb0-f196.google.com with SMTP id g187so4279210yba.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 09:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hhduzSYszvJSOzMSK7DkAXnMLbjJAU4U8tuc3qLpPpQ=;
	b=n8DAMeOV3bcu4eA8A0Z1OLpz1mWsvdyB44BEqzLt2ebzG6M4QKvoJ1bFUpbeh00mdW
	Q1a2BfBAFKIuEYSw+lzR2BI3Tq/iJw7NON32uSbCZWV1UxSNbohG4zFnN9w19wdbf0EB
	isNua7dCHovybc3RRTYtZsGkP3v+IJoKdEMJGPxLfS8wKXrktujnaW4ktZafF5ZlHmwg
	mx86WaoxfjpVWHyhlaEpDex2BAeuPrLSINw5moXUbaaIXWBnwAxRpXatsyCtUxQJxhwb
	RFYMRrl43LNuu8bp0zQKfMEH2TZ0uLWa0KD7gaFJrsXKW/mrIgBhbrt+qLBbpel4i/ix
	JDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hhduzSYszvJSOzMSK7DkAXnMLbjJAU4U8tuc3qLpPpQ=;
	b=gZLxUZKKk12ZEEauFYeaU3mligF81Y5dXIMVUN6Sql83IXreZFVux9pEVD+6SF2c7S
	o9kE/hBtc58D8AjK5/eqacITeW1Zy0luBK2yr0D8sBoOaKXSFiMZyE+9n9s3yZAIASKL
	zunbXH3HEdukVldr4XwKmqpMTAjM7z/cI1toYGNJ+++FA9ue1fVUwOFFK0gBYPrsj8y8
	HST/Q+a2f2YS4KdU3YZ7T+Bbbtp+T4/B+mJP4sS7BpfAkA1FBScq+36YMWfMRWXY5wT0
	+Kwx0S3/GoC6r9YrpYM3Yu4CIuvdf9BYiCoXFt6AttJHuYVcgJWgJM23wnRDacjbDEEW
	yKLA==
X-Gm-Message-State: AJaThX47qdSbqIjpYgC1qIntiqYalj4hHkQUyKKkvUb/32He9yqR6zYf
	92oW+PuLJAfcbKci51NDFnKkqg49r3z9vtiJu2w=
X-Google-Smtp-Source: AGs4zMZ8Avfp8QNhygeXG3gBaQmPLBJqcWtEjo64LRsWXWq5ZQG9897bGyarmwcVRiBg2TZuQmx4Ifo14kIgAmesKm8=
X-Received: by 10.37.20.9 with SMTP id 9mr4220597ybu.283.1512149747132; Fri,
	01 Dec 2017 09:35:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.98.21 with HTTP; Fri, 1 Dec 2017 09:35:46 -0800 (PST)
In-Reply-To: <CAMKF1spQVcCKkpfBng=BdfvTyGyESKtMABy7gn_qqBK-2Fv5aA@mail.gmail.com>
References: <20171201110816.13519-1-schnitzeltony@gmail.com>
	<20171201110816.13519-5-schnitzeltony@gmail.com>
	<CAMKF1spQVcCKkpfBng=BdfvTyGyESKtMABy7gn_qqBK-2Fv5aA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 1 Dec 2017 18:35:46 +0100
Message-ID: <CALbNGRQXaw9wwhv_-uBJbRfUhSJScrmRJ9JSEWGazbX4zdQtHQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Fri, 01 Dec 2017 17:35:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2017 at 3:49 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Dec 1, 2017 at 3:08 AM, Andreas M=C3=BCller <schnitzeltony@gmail.=
com>
> wrote:
> > * Use floats instead of double for sound calculations. This improves
> >   performance notable and was default for version 1.1.6 using autotools=
.
> > * Fix buffer overrun when using floats
> > * Make use of ARM NEON for multithreading enabled
> >
> > Performance and sound correctnes was tested with qtractor and a reworke=
d
> > version of fluidsynth-dssi [1-2]. Tests were performed for single- and
> > multithreading enabled.
> >
> > [1] https://github.com/schnitzeltony/fluidsynth-dssi/commit/
> bad09c6f5c5508c5f5330aa5188510f975e50c50
> > [2] https://github.com/schnitzeltony/meta-qt5-extra/
> blob/master/recipes-misc/recipes-multimedia/fluidsynth/
> fluidsynth-dssi_1.0.0.bb
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  ...uffer-overrun-in-fluid_synth_nwrite_float.patch | 32 +++++++++
> >  ...N-accelaration-for-float-multithreaded-se.patch | 76
> ++++++++++++++++++++++
> >  .../fluidsynth/fluidsynth_1.1.8.bb                 |  8 ++-
> >  3 files changed, 114 insertions(+), 2 deletions(-)
> >  create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/files=
/
> 0001-avoid-buffer-overrun-in-fluid_synth_nwrite_float.patch
> >  create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/files=
/
> 0002-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch
> >
> > diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/files/
> 0001-avoid-buffer-overrun-in-fluid_synth_nwrite_float.patch
> b/meta-multimedia/recipes-multimedia/fluidsynth/files/
> 0001-avoid-buffer-overrun-in-fluid_synth_nwrite_float.patch
> > new file mode 100644
> > index 0000000..dda76cf
> > --- /dev/null
> > +++ b/meta-multimedia/recipes-multimedia/fluidsynth/files/
> 0001-avoid-buffer-overrun-in-fluid_synth_nwrite_float.patch
> > @@ -0,0 +1,32 @@
> > +From a13cb63103aa56b5e8bad816c7d13d6e01c0cd9f Mon Sep 17 00:00:00 2001
> > +From: derselbst <tom.mbrt@googlemail.com>
> > +Date: Sun, 26 Nov 2017 22:12:12 +0100
> > +Subject: [PATCH 1/2] avoid buffer overrun in fluid_synth_nwrite_float(=
)
> > +
> > +Upstream-Status: Backport [1]
> > +
> > +[1] https://github.com/FluidSynth/fluidsynth/commit/
> a13cb63103aa56b5e8bad816c7d13d6e01c0cd9f
> > +---
> > + src/synth/fluid_synth.c | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/src/synth/fluid_synth.c b/src/synth/fluid_synth.c
> > +index 266d759..14f6b21 100644
> > +--- a/src/synth/fluid_synth.c
> > ++++ b/src/synth/fluid_synth.c
> > +@@ -2752,10 +2752,10 @@ fluid_synth_nwrite_float(fluid_synth_t* synth,
> int len,
> > +     {
> > + #ifdef WITH_FLOAT
> > +       if(fx_left !=3D NULL)
> > +-        FLUID_MEMCPY(fx_left[i + count], fx_left_in[i], bytes);
> > ++        FLUID_MEMCPY(fx_left[i] + count, fx_left_in[i], bytes);
> > +
> > +       if(fx_right !=3D NULL)
> > +-        FLUID_MEMCPY(fx_right[i + count], fx_right_in[i], bytes);
> > ++        FLUID_MEMCPY(fx_right[i] + count, fx_right_in[i], bytes);
> > + #else //WITH_FLOAT
> > +       int j;
> > +       if(fx_left !=3D NULL) {
> > +--
> > +2.9.5
> > +
> > diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/files/
> 0002-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch
> b/meta-multimedia/recipes-multimedia/fluidsynth/files/0002-Use-ARM-NEON-
> accelaration-for-float-multithreaded-se.patch
> > new file mode 100644
> > index 0000000..0e1846e
> > --- /dev/null
> > +++ b/meta-multimedia/recipes-multimedia/fluidsynth/files/
> 0002-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch
> > @@ -0,0 +1,76 @@
> > +From 2de7e128fbdf528716b500cf27ed9a4358c931c9 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail=
.com>
> > +Date: Fri, 24 Nov 2017 00:05:35 +0100
> > +Subject: [PATCH 2/2] Use ARM-NEON accelaration for float-multithreaded
> setups
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > +---
> > + src/rvoice/fluid_rvoice_mixer.c | 26 ++++++++++++++++++++++++++
> > + 1 file changed, 26 insertions(+)
> > +
> > +diff --git a/src/rvoice/fluid_rvoice_mixer.c b/src/rvoice/fluid_rvoice=
_
> mixer.c
> > +index 9616518..dbf8057 100644
> > +--- a/src/rvoice/fluid_rvoice_mixer.c
> > ++++ b/src/rvoice/fluid_rvoice_mixer.c
> > +@@ -27,6 +27,10 @@
> > + #include "fluid_ladspa.h"
> > + #include "fluid_synth.h"
> > +
> > ++#if defined(__ARM_NEON__)
> > ++#include "arm_neon.h"
> > ++#endif
> > ++
> > +
> > + #define ENABLE_MIXER_THREADS 1
> > +
> > +@@ -794,20 +798,42 @@ fluid_mixer_buffers_mix(fluid_mixer_buffers_t*
> dest, fluid_mixer_buffers_t* src)
> > +   if (minbuf > src->buf_count)
> > +     minbuf =3D src->buf_count;
> > +   for (i=3D0; i < minbuf; i++) {
> > ++#if defined(__ARM_NEON__) && defined(WITH_FLOAT)
> > ++    for (j=3D0; j < scount; j+=3D4) {
> > ++        float32x4_t vleft =3D vld1q_f32(&dest->left_buf[i][j]);
> > ++        float32x4_t vright =3D vld1q_f32(&dest->right_buf[i][j]);
> > ++        vleft =3D vaddq_f32(vleft, vld1q_f32(&src->left_buf[i][j]));
> > ++        vright =3D vaddq_f32(vright, vld1q_f32(&src->right_buf[i][j])=
);
> > ++        vst1q_f32(&dest->left_buf[i][j], vleft);
> > ++        vst1q_f32(&dest->right_buf[i][j], vright);
> > ++    }
>
> > I wonder if gcc could be initiated to see if it can vectorize the code,
> here
> > have you tried setting cmdline options or may be pragma hints
>
>
I've sent patches like these to some projects. If I remember correctly
first one was jack2 [1]. For that I wrote some performance tests [2] and
tested vectorizing either but with disappointing results. This is ~ a year
ago and I think intrinsics are still the option performing better.

[1]
https://github.com/jackaudio/jack2/commit/77bb8be12e0d856fbc004cf57185ab36a=
2df04c2
[2]
https://github.com/jackaudio/jack2/commit/c32b823860bc8e887774ab10bc3e9bd76=
e85e3f3

Andreas

