Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web09.9082.1617892968018546807
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 07:42:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bqHTmdv5;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id v70so2385953qkb.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 07:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Hic8ur+QnfWWczHILCp4vxpqStm5rvhIp9Z7hLEUNoQ=;
        b=bqHTmdv53qHkEXx/Dd9X3RdfkaHCoGV/KPrzZwB/4Z7h2GDAE6laXaExRlwkDgN5YA
         r9YS69Apa6TXAACgbmqOONpvkYAllQDru6sd4O96X49/yMY5gPfLjzVOR9/mtDvNKPIo
         R6tDOPSsbWKln8sEE17njTinHiPeb5DjF6pPRH1KL4IVGII1SWFb2NSVGAbgaNl97ywj
         jRIgKXY1fWn8WID1VBVq+th9v+7mAzP4s+lSCPNG6HmdBL5p6GRyAyyQ+JF7EDHF4LOe
         OZCDl/NIgph3LiIgF9PI0aATdfmPtHMbFvnYTsKZ/5wpAZQLNvIZwk7NNRTNqFBcXIxG
         JYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Hic8ur+QnfWWczHILCp4vxpqStm5rvhIp9Z7hLEUNoQ=;
        b=Vkd886ha1QNfq3OTH6SEHLYjDFOmNXeODntyjNvlFxuUis3CoNpkOsYO3KnvoK4Aie
         Pkj6iAfbt54UHWjPs88fFn1/s2Ke+rOrEnXlEkR546JN6FMCIVXrGV8N/byen2b3u/B8
         M4aBit0vOxuYFDdDec5LKl7E5A0o4lrO2Wpe6zEwjFNtPnNNUpgEBfnLinkZMeYCtCY/
         wYmgUh7cjlAHV2BxrJpGXhbXbLnAWewa/iixku35B4oqOzHt1hq3P/Z/AekuV27mCvQZ
         l6cHK9ywRnGBdqU6nQGOMMam3uSRH/WrptuTXHW1NxrJcdnDKHNBavd60nFzVB/PJCU4
         ALgQ==
X-Gm-Message-State: AOAM53164AfXtvDCa9iganEIrNHLI+MLMbsDMIaJH7ePF0c+8sQNQvPG
	UUA3yxOo+csSdDrJLzArnyjBjYJgJbctcvh9u4Q=
X-Google-Smtp-Source: ABdhPJzYeOzKou3BS+SBPs45zJH3yr/DD3w0XkGXgmfYajwF8eJ6ulGC5QVWgZ4oHASmmFolrLSVzxW4b+98eVvzxv8=
X-Received: by 2002:a05:620a:12ae:: with SMTP id x14mr8908370qki.25.1617892967023;
 Thu, 08 Apr 2021 07:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210407221829.606871-1-schnitzeltony@gmail.com>
 <1673B361F4D94ACE.4742@lists.openembedded.org> <CALbNGRQfiRRdbws434sNW5-5EnLqon55JLozdUm8R_V65_GvzQ@mail.gmail.com>
In-Reply-To: <CALbNGRQfiRRdbws434sNW5-5EnLqon55JLozdUm8R_V65_GvzQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 8 Apr 2021 07:42:21 -0700
Message-ID: <CAMKF1sqVmjueJdni+Muux-a4FkB5ccZ9G3VCAQR5wr8ZW_wm7Q@mail.gmail.com>
Subject: Re: [oe] [PATCH 5/6] fluidsynth: upgrade 2.1.7 -> 2.2.0
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

there is patching error on musl


ERROR: fluidsynth-2.2.0-r0 do_patch: Fuzz detected:

Applying patch 0002-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.p=
atch
patching file src/synth/fluid_synth.c
Hunk #1 succeeded at 3628 with fuzz 1 (offset 322 lines).
Hunk #2 succeeded at 3719 (offset 333 lines).
Hunk #3 succeeded at 3749 (offset 333 lines).
Hunk #4 succeeded at 3762 (offset 333 lines).
Hunk #5 succeeded at 3770 (offset 333 lines).
Hunk #6 succeeded at 3801 (offset 333 lines).
Hunk #7 succeeded at 3834 (offset 333 lines).
Hunk #8 succeeded at 3847 (offset 333 lines).
Hunk #9 succeeded at 3855 (offset 333 lines).

fluidsynth-2.2.0: Patch log indicates that patches do not apply
cleanly. [patch-fuzz]


On Thu, Apr 8, 2021 at 12:17 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> On Thu, Apr 8, 2021 at 12:18 AM Andreas M=C3=BCller via
> lists.openembedded.org
> <schnitzeltony=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > The only fallout by API/ABI changes in my world build was meta-games/s=
cummvm.
> > Fix was sent [1]
> >
> > fluidsynth 2.2.0
> > This release breaks ABI compatibility! Refer to the API docs for detai=
ls.
> > A C++98 compliant compiler is now required to build fluidsynth (mailin=
g list thread)
> >
> > New features
> >
> >     Support loading SoundFonts >2GiB on Windows (#629)
> >     Major overhaul of the sequencer and its event queue (#604)
> >         Overlapping notes can be handled (#637)
> >         Performance improvement, since the event queue no longer block=
s the rendering thread
> >         Time scale is not limited to 1000 anymore and can therefore be=
 used for tempo changes
> >     The following audio drivers have gained multi-channel support
> >         DSound (#667, thanks to @jjceresa)
> >         WaveOut (#667, thanks to @jjceresa)
> >     The WinMIDI driver supports multiple devices (#677, thanks to @jjc=
eresa)
> >     Handle GS DT1 SysEx messages for setting whether a channel is used=
 for rhythm part (#708, thanks to @chirs241097)
> >     Support use of UTF-8 filenames under Windows (#718, thanks to @get=
raid-gg)
> >     Improved support for overriding tempo of the MIDI player (#711, #7=
13, thanks to @jjceresa)
> >     Handle settings-related commands in user command file before initi=
alizing other objects (#739)
> >     SoundFont loading has been parallelized (#746, #812, requires open=
MP)
> >     The Oboe driver has gained a lower latency and other updates (#740=
, #741, #747)
> >     WASAPI driver has been added (#754, thanks to @chirs241097)
> >
> > General
> >
> >     Fix race condition in fluid_player_callback (#783, thanks to @arcl=
n)
> >     Improvements to LADSPA subsystem (#795, thanks to @mawe42)
> >
> > [1] https://github.com/cazfi/meta-games/pull/58
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  .../fluidsynth/fluidsynth.inc                 |  6 ++---
> >  ...te_float-Allow-zero-pointer-for-left.patch | 26 +++++++++---------=
-
> >  2 files changed, 16 insertions(+), 16 deletions(-)
> >
> > diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.=
inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
> > index 74a2683ac..63ba54c34 100644
> > --- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
> > +++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
> > @@ -4,9 +4,9 @@ SECTION =3D "libs/multimedia"
> >  LICENSE =3D "LGPL-2.1"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfc178bcd425090939a8b634d1d=
6a9594"
> >
> > -SRC_URI =3D "git://github.com/FluidSynth/fluidsynth.git;branch=3D2.1.=
x"
> > -SRCREV =3D "e2d67ea77237046b703d537aec90620c22f7f629"
> > +SRC_URI =3D "git://github.com/FluidSynth/fluidsynth.git"
> > +SRCREV =3D "8413c35aca641567baf13e9b16e9839019ebf99d"
> >  S =3D "${WORKDIR}/git"
> > -PV =3D "2.1.7"
> > +PV =3D "2.2.0"
> >
> >  inherit cmake pkgconfig lib_package
> > diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/=
0002-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.patch b/meta-mult=
imedia/recipes-multimedia/fluidsynth/fluidsynth/0002-fluid_synth_nwrite_flo=
at-Allow-zero-pointer-for-left.patch
> > index 94daa951c..f7debc5ad 100644
> > --- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0002-fl=
uid_synth_nwrite_float-Allow-zero-pointer-for-left.patch
> > +++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0002-fl=
uid_synth_nwrite_float-Allow-zero-pointer-for-left.patch
> > @@ -17,15 +17,15 @@ Upstream-Status: Submitted [1]
> >
> >  Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> >  ---
> > - src/synth/fluid_synth.c | 69 ++++++++++++++++++++++++++++++++++-----=
----------
> > + src/synth/fluid_synth.c | 69 ++++++++++++++++++++++++++++-----------=
--
> >   1 file changed, 48 insertions(+), 21 deletions(-)
> >
> >  diff --git a/src/synth/fluid_synth.c b/src/synth/fluid_synth.c
> > -index 0df620d3..379f8216 100644
> > +index 1eb5d737..6c876efa 100644
> >  --- a/src/synth/fluid_synth.c
> >  +++ b/src/synth/fluid_synth.c
> > -@@ -3306,10 +3306,10 @@ fluid_synth_program_reset(fluid_synth_t *synt=
h)
> > -  * Synthesize a block of floating point audio to separate audio buff=
ers (multichannel rendering). First effect channel used by reverb, second f=
or chorus.
> > +@@ -3628,10 +3628,10 @@ fluid_synth_program_reset(fluid_synth_t *synt=
h)
> > +  *
> >    * @param synth FluidSynth instance
> >    * @param len Count of audio frames to synthesize
> >  - * @param left Array of float buffers to store left channel of plana=
r audio (as many as \c synth.audio-channels buffers, each of \c len in size=
)
> > @@ -38,8 +38,8 @@ index 0df620d3..379f8216 100644
> >  + * @param fx_right Since 1.1.7: If not \c NULL, array of float buffe=
rs to store right effect channels (size: dito). Since 2.0.3: NULL allowed f=
or array entry
> >    * @return #FLUID_OK on success, #FLUID_FAILED otherwise
> >    *
> > -  * @note Should only be called from synthesis thread.
> > -@@ -3386,15 +3386,27 @@ fluid_synth_nwrite_float(fluid_synth_t *synth=
, int len,
> > +  * First effect channel used by reverb, second for chorus.
> > +@@ -3719,15 +3719,27 @@ fluid_synth_nwrite_float(fluid_synth_t *synth=
, int len,
> >           for(i =3D 0; i < synth->audio_channels; i++)
> >           {
> >   #ifdef WITH_FLOAT
> > @@ -71,7 +71,7 @@ index 0df620d3..379f8216 100644
> >               }
> >
> >   #endif //WITH_FLOAT
> > -@@ -3404,12 +3416,12 @@ fluid_synth_nwrite_float(fluid_synth_t *synth=
, int len,
> > +@@ -3737,12 +3749,12 @@ fluid_synth_nwrite_float(fluid_synth_t *synth=
, int len,
> >           {
> >   #ifdef WITH_FLOAT
> >
> > @@ -86,7 +86,7 @@ index 0df620d3..379f8216 100644
> >               {
> >                   FLUID_MEMCPY(fx_right[i], &fx_right_in[i * FLUID_BUF=
SIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT + synth->cur], bytes);
> >               }
> > -@@ -3417,7 +3429,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, =
int len,
> > +@@ -3750,7 +3762,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, =
int len,
> >   #else //WITH_FLOAT
> >               int j;
> >
> > @@ -95,7 +95,7 @@ index 0df620d3..379f8216 100644
> >               {
> >                   for(j =3D 0; j < num; j++)
> >                   {
> > -@@ -3425,7 +3437,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, =
int len,
> > +@@ -3758,7 +3770,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, =
int len,
> >                   }
> >               }
> >
> > @@ -104,7 +104,7 @@ index 0df620d3..379f8216 100644
> >               {
> >                   for(j =3D 0; j < num; j++)
> >                   {
> > -@@ -3456,15 +3468,30 @@ fluid_synth_nwrite_float(fluid_synth_t *synth=
, int len,
> > +@@ -3789,15 +3801,30 @@ fluid_synth_nwrite_float(fluid_synth_t *synth=
, int len,
> >           for(i =3D 0; i < synth->audio_channels; i++)
> >           {
> >   #ifdef WITH_FLOAT
> > @@ -140,7 +140,7 @@ index 0df620d3..379f8216 100644
> >               }
> >
> >   #endif //WITH_FLOAT
> > -@@ -3474,12 +3501,12 @@ fluid_synth_nwrite_float(fluid_synth_t *synth=
, int len,
> > +@@ -3807,12 +3834,12 @@ fluid_synth_nwrite_float(fluid_synth_t *synth=
, int len,
> >           {
> >   #ifdef WITH_FLOAT
> >
> > @@ -155,7 +155,7 @@ index 0df620d3..379f8216 100644
> >               {
> >                   FLUID_MEMCPY(fx_right[i] + count, &fx_right_in[i * F=
LUID_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT], bytes);
> >               }
> > -@@ -3487,7 +3514,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, =
int len,
> > +@@ -3820,7 +3847,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, =
int len,
> >   #else //WITH_FLOAT
> >               int j;
> >
> > @@ -164,7 +164,7 @@ index 0df620d3..379f8216 100644
> >               {
> >                   for(j =3D 0; j < num; j++)
> >                   {
> > -@@ -3495,7 +3522,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, =
int len,
> > +@@ -3828,7 +3855,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, =
int len,
> >                   }
> >               }
> >
> > --
> > 2.26.2
> >
> Sorry & thanks for rebasing Khem - was about to send V2
>
> Andreas
>
>=20
>
