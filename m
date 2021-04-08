Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web09.4732.1617866250608316508
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 00:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PwNFTRB6;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id i190so1119518pfc.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 00:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JeTo6VJEjytdwq6NLqJumbBq6TAuDGo2YM56UgX0UW4=;
        b=PwNFTRB6yV9WHk5LxykYVcMXTBrzZJJgud5hPCmqTISTu4i+mQxuHpYsbWxNTYS4kO
         vDHI5w6oLCSNFl19BnMX55mgzjK58RH9Ljr0pq/zTi7T7zFujlTqZ35Co9NKgd6bqRt5
         Ip3r2SNsXVfoh6QPpVPrF+NVcfHHqI/3WdSeYaW5J5IVFEKid9pkZqc50wtAJvxBgOMk
         +Mpbj07zlmd1LYEoLt+CRsqFpy3Ntwd9tpVIBYq7FMD7iwFKuum5gA8kTgwrjDUkwmAL
         ETFV25BVVQRHwVo/JEk9CQptumv3HpblbWwQ6xzkjYSULxvAMf9tx8wnEqahURWk1mXc
         5rPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JeTo6VJEjytdwq6NLqJumbBq6TAuDGo2YM56UgX0UW4=;
        b=Ot9CtTuWXtvKHF7BzqW5g/NYujZmEP7P0Qa8usAXr6dx6F6Rrd9mREtWf65QMLk8ik
         tF3LvLsv3nsEElyVWbMsVhmSxHJ6LMWLr+wU2yp1mghy9H9/xA/URvaj/MVoHQrK6y6c
         zwPQX/cEapkkfFUTRbexxu39C2L4Falrd9P84QSHkg4kNbKWPSmemlEFgW8V3f2+m4Hr
         ZGMT+XvrnH2wmEQXQ//7wX7GUhv4IJK56WMRAvgfClDNQit9/CETOwoIXFfcilIFSYGZ
         AYC0NsFkO7GpfPD5o7Wanp970bfNnDM+jAEoZ/8KFFJnuMmrnYamsTmP0HYcyDjeVTCo
         1+Rg==
X-Gm-Message-State: AOAM532dnxqHebFs4cE9A5iE7tD5XJOJfY9MiQ5ic0oiSfp3cKWiHJsB
	DBG2wu4fRLmQbeyixWb68QWttmCPl6s/nb7N/PA=
X-Google-Smtp-Source: ABdhPJwbPGdj9zN9SEuAJqQjcfrJRy84N3fvFcaGv1h21ttP36d6+8SF+RUlManOnl5LLmlAwxN8k7H4uxMequBliv8=
X-Received: by 2002:aa7:8f31:0:b029:1f8:987a:53dc with SMTP id
 y17-20020aa78f310000b02901f8987a53dcmr6110085pfr.58.1617866249987; Thu, 08
 Apr 2021 00:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210407221829.606871-1-schnitzeltony@gmail.com> <1673B361F4D94ACE.4742@lists.openembedded.org>
In-Reply-To: <1673B361F4D94ACE.4742@lists.openembedded.org>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Thu, 8 Apr 2021 09:17:18 +0200
Message-ID: <CALbNGRQfiRRdbws434sNW5-5EnLqon55JLozdUm8R_V65_GvzQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 5/6] fluidsynth: upgrade 2.1.7 -> 2.2.0
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 8, 2021 at 12:18 AM Andreas M=C3=BCller via
lists.openembedded.org
<schnitzeltony=3Dgmail.com@lists.openembedded.org> wrote:
>
> The only fallout by API/ABI changes in my world build was meta-games/scum=
mvm.
> Fix was sent [1]
>
> fluidsynth 2.2.0
> This release breaks ABI compatibility! Refer to the API docs for details.
> A C++98 compliant compiler is now required to build fluidsynth (mailing l=
ist thread)
>
> New features
>
>     Support loading SoundFonts >2GiB on Windows (#629)
>     Major overhaul of the sequencer and its event queue (#604)
>         Overlapping notes can be handled (#637)
>         Performance improvement, since the event queue no longer blocks t=
he rendering thread
>         Time scale is not limited to 1000 anymore and can therefore be us=
ed for tempo changes
>     The following audio drivers have gained multi-channel support
>         DSound (#667, thanks to @jjceresa)
>         WaveOut (#667, thanks to @jjceresa)
>     The WinMIDI driver supports multiple devices (#677, thanks to @jjcere=
sa)
>     Handle GS DT1 SysEx messages for setting whether a channel is used fo=
r rhythm part (#708, thanks to @chirs241097)
>     Support use of UTF-8 filenames under Windows (#718, thanks to @getrai=
d-gg)
>     Improved support for overriding tempo of the MIDI player (#711, #713,=
 thanks to @jjceresa)
>     Handle settings-related commands in user command file before initiali=
zing other objects (#739)
>     SoundFont loading has been parallelized (#746, #812, requires openMP)
>     The Oboe driver has gained a lower latency and other updates (#740, #=
741, #747)
>     WASAPI driver has been added (#754, thanks to @chirs241097)
>
> General
>
>     Fix race condition in fluid_player_callback (#783, thanks to @arcln)
>     Improvements to LADSPA subsystem (#795, thanks to @mawe42)
>
> [1] https://github.com/cazfi/meta-games/pull/58
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../fluidsynth/fluidsynth.inc                 |  6 ++---
>  ...te_float-Allow-zero-pointer-for-left.patch | 26 +++++++++----------
>  2 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc=
 b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
> index 74a2683ac..63ba54c34 100644
> --- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
> +++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
> @@ -4,9 +4,9 @@ SECTION =3D "libs/multimedia"
>  LICENSE =3D "LGPL-2.1"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfc178bcd425090939a8b634d1d6a9=
594"
>
> -SRC_URI =3D "git://github.com/FluidSynth/fluidsynth.git;branch=3D2.1.x"
> -SRCREV =3D "e2d67ea77237046b703d537aec90620c22f7f629"
> +SRC_URI =3D "git://github.com/FluidSynth/fluidsynth.git"
> +SRCREV =3D "8413c35aca641567baf13e9b16e9839019ebf99d"
>  S =3D "${WORKDIR}/git"
> -PV =3D "2.1.7"
> +PV =3D "2.2.0"
>
>  inherit cmake pkgconfig lib_package
> diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/000=
2-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.patch b/meta-multime=
dia/recipes-multimedia/fluidsynth/fluidsynth/0002-fluid_synth_nwrite_float-=
Allow-zero-pointer-for-left.patch
> index 94daa951c..f7debc5ad 100644
> --- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0002-fluid=
_synth_nwrite_float-Allow-zero-pointer-for-left.patch
> +++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0002-fluid=
_synth_nwrite_float-Allow-zero-pointer-for-left.patch
> @@ -17,15 +17,15 @@ Upstream-Status: Submitted [1]
>
>  Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>  ---
> - src/synth/fluid_synth.c | 69 ++++++++++++++++++++++++++++++++++--------=
-------
> + src/synth/fluid_synth.c | 69 ++++++++++++++++++++++++++++-------------
>   1 file changed, 48 insertions(+), 21 deletions(-)
>
>  diff --git a/src/synth/fluid_synth.c b/src/synth/fluid_synth.c
> -index 0df620d3..379f8216 100644
> +index 1eb5d737..6c876efa 100644
>  --- a/src/synth/fluid_synth.c
>  +++ b/src/synth/fluid_synth.c
> -@@ -3306,10 +3306,10 @@ fluid_synth_program_reset(fluid_synth_t *synth)
> -  * Synthesize a block of floating point audio to separate audio buffers=
 (multichannel rendering). First effect channel used by reverb, second for =
chorus.
> +@@ -3628,10 +3628,10 @@ fluid_synth_program_reset(fluid_synth_t *synth)
> +  *
>    * @param synth FluidSynth instance
>    * @param len Count of audio frames to synthesize
>  - * @param left Array of float buffers to store left channel of planar a=
udio (as many as \c synth.audio-channels buffers, each of \c len in size)
> @@ -38,8 +38,8 @@ index 0df620d3..379f8216 100644
>  + * @param fx_right Since 1.1.7: If not \c NULL, array of float buffers =
to store right effect channels (size: dito). Since 2.0.3: NULL allowed for =
array entry
>    * @return #FLUID_OK on success, #FLUID_FAILED otherwise
>    *
> -  * @note Should only be called from synthesis thread.
> -@@ -3386,15 +3386,27 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, i=
nt len,
> +  * First effect channel used by reverb, second for chorus.
> +@@ -3719,15 +3719,27 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, i=
nt len,
>           for(i =3D 0; i < synth->audio_channels; i++)
>           {
>   #ifdef WITH_FLOAT
> @@ -71,7 +71,7 @@ index 0df620d3..379f8216 100644
>               }
>
>   #endif //WITH_FLOAT
> -@@ -3404,12 +3416,12 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, i=
nt len,
> +@@ -3737,12 +3749,12 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, i=
nt len,
>           {
>   #ifdef WITH_FLOAT
>
> @@ -86,7 +86,7 @@ index 0df620d3..379f8216 100644
>               {
>                   FLUID_MEMCPY(fx_right[i], &fx_right_in[i * FLUID_BUFSIZ=
E * FLUID_MIXER_MAX_BUFFERS_DEFAULT + synth->cur], bytes);
>               }
> -@@ -3417,7 +3429,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int=
 len,
> +@@ -3750,7 +3762,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int=
 len,
>   #else //WITH_FLOAT
>               int j;
>
> @@ -95,7 +95,7 @@ index 0df620d3..379f8216 100644
>               {
>                   for(j =3D 0; j < num; j++)
>                   {
> -@@ -3425,7 +3437,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int=
 len,
> +@@ -3758,7 +3770,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int=
 len,
>                   }
>               }
>
> @@ -104,7 +104,7 @@ index 0df620d3..379f8216 100644
>               {
>                   for(j =3D 0; j < num; j++)
>                   {
> -@@ -3456,15 +3468,30 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, i=
nt len,
> +@@ -3789,15 +3801,30 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, i=
nt len,
>           for(i =3D 0; i < synth->audio_channels; i++)
>           {
>   #ifdef WITH_FLOAT
> @@ -140,7 +140,7 @@ index 0df620d3..379f8216 100644
>               }
>
>   #endif //WITH_FLOAT
> -@@ -3474,12 +3501,12 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, i=
nt len,
> +@@ -3807,12 +3834,12 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, i=
nt len,
>           {
>   #ifdef WITH_FLOAT
>
> @@ -155,7 +155,7 @@ index 0df620d3..379f8216 100644
>               {
>                   FLUID_MEMCPY(fx_right[i] + count, &fx_right_in[i * FLUI=
D_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT], bytes);
>               }
> -@@ -3487,7 +3514,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int=
 len,
> +@@ -3820,7 +3847,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int=
 len,
>   #else //WITH_FLOAT
>               int j;
>
> @@ -164,7 +164,7 @@ index 0df620d3..379f8216 100644
>               {
>                   for(j =3D 0; j < num; j++)
>                   {
> -@@ -3495,7 +3522,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int=
 len,
> +@@ -3828,7 +3855,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int=
 len,
>                   }
>               }
>
> --
> 2.26.2
>
Sorry & thanks for rebasing Khem - was about to send V2

Andreas
