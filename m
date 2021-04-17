Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.3486.1618693588997599816
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uLmFRt/D;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id h15so2943370pfv.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MEoPYi39p7lDjwnjepL523eV3Z0QMYlJcNplq5wB91M=;
        b=uLmFRt/D/NVE626I7BGe/dvG5dwqXYZWNVEZvSL6avRqjhaBO6Kl66wgqKnhDTF9g1
         tW1fCNU+v82fE1KJQSPqinXwORgpPePYeY5XlXwK7VBxeqqVEPDp7DLuoBPytRuxH5Uf
         grGJy8S/bY1txKR+Gemhob87PFbPfphmwRv1Sfiz3lXwWzGUqH/WoII/JYQHDSXNK1Xj
         X+rLF5ci2Q+Y0QTW3b7bHrL42+8cI/1k/ltoFmZlLsmau7EuZwWU2dJiagPn7tSovF2H
         CoTHlPW20olFH4nxREnkJfVi+J6E65XX6u2QcJY1x/9mvYCpL+UipRL/a5p+U+8y1Uit
         ROrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MEoPYi39p7lDjwnjepL523eV3Z0QMYlJcNplq5wB91M=;
        b=fFNzSRnL/gzk1kbF3HNAYnpaadGrkE0WxTusyWxLxPyikq5QLUnKE/3Qf6jL/AlIJs
         yf1g18WxA2ZtipYCLxW2eOdDOoUyXNi5gt6g9vPUzQ61KNZQzD5R+ps33bf5LGwOm+G/
         suZ2/jb3yMIgI5g6G/iDks0pAC1HkfBUlmXTwdkHc4vlS18Z0CojTuxWjhTFx4IUGi6I
         GflWkPudmcIMAeP6L19e+uxtrVuOmt3CyjbLncOAiHRsWyf5Iw9AaQlwUE8h2whgvWGI
         PozFmCOSvkv0sLP6LNL6BPEFu8aOaliBl81V/phpmU6zh5IjomXgVtaHT6qNzLVHs4Qm
         qopQ==
X-Gm-Message-State: AOAM533ukbTwmUIBbjEJqcJJJD5Mw4+dUIsnEWMCt3zrif+Ju0QPmNl2
	0ueDlAWuYwMLFQoz3Mq1CKENd82DioRGkw==
X-Google-Smtp-Source: ABdhPJwlNZJH3Iy4e/8QgJFyGU1v5fkWlYRyjHFcC4NB84JMB9kXUciqKyxeM/BkrfEjsocq7r8boA==
X-Received: by 2002:a65:418a:: with SMTP id a10mr4748146pgq.307.1618693588266;
        Sat, 17 Apr 2021 14:06:28 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:28 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 26/50] fluidsynth: upgrade 2.1.7 -> 2.2.0
Date: Sat, 17 Apr 2021 14:05:35 -0700
Message-Id: <c0f45f2525050ef9b5ab608eba49aa71673ec6c4.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

The only fallout by API/ABI changes in my world build was meta-games/scummvm.
Fix was sent [1]

fluidsynth 2.2.0
This release breaks ABI compatibility! Refer to the API docs for details.
A C++98 compliant compiler is now required to build fluidsynth (mailing list thread)

New features

    Support loading SoundFonts >2GiB on Windows (#629)
    Major overhaul of the sequencer and its event queue (#604)
        Overlapping notes can be handled (#637)
        Performance improvement, since the event queue no longer blocks the rendering thread
        Time scale is not limited to 1000 anymore and can therefore be used for tempo changes
    The following audio drivers have gained multi-channel support
        DSound (#667, thanks to @jjceresa)
        WaveOut (#667, thanks to @jjceresa)
    The WinMIDI driver supports multiple devices (#677, thanks to @jjceresa)
    Handle GS DT1 SysEx messages for setting whether a channel is used for rhythm part (#708, thanks to @chirs241097)
    Support use of UTF-8 filenames under Windows (#718, thanks to @getraid-gg)
    Improved support for overriding tempo of the MIDI player (#711, #713, thanks to @jjceresa)
    Handle settings-related commands in user command file before initializing other objects (#739)
    SoundFont loading has been parallelized (#746, #812, requires openMP)
    The Oboe driver has gained a lower latency and other updates (#740, #741, #747)
    WASAPI driver has been added (#754, thanks to @chirs241097)

General

    Fix race condition in fluid_player_callback (#783, thanks to @arcln)
    Improvements to LADSPA subsystem (#795, thanks to @mawe42)

[1] https://github.com/cazfi/meta-games/pull/58

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f186377359fa1f4db8e6c6a8a4f40f774591af8e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../fluidsynth/fluidsynth.inc                 |  4 +--
 ...te_float-Allow-zero-pointer-for-left.patch | 26 +++++++++----------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index c2badc4469f..63ba54c34c9 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -5,8 +5,8 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
 SRC_URI = "git://github.com/FluidSynth/fluidsynth.git"
-SRCREV = "e2d67ea77237046b703d537aec90620c22f7f629"
+SRCREV = "8413c35aca641567baf13e9b16e9839019ebf99d"
 S = "${WORKDIR}/git"
-PV = "2.1.7"
+PV = "2.2.0"
 
 inherit cmake pkgconfig lib_package
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0002-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.patch b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0002-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.patch
index 94daa951c69..f7debc5ad47 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0002-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.patch
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0002-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.patch
@@ -17,15 +17,15 @@ Upstream-Status: Submitted [1]
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
- src/synth/fluid_synth.c | 69 ++++++++++++++++++++++++++++++++++---------------
+ src/synth/fluid_synth.c | 69 ++++++++++++++++++++++++++++-------------
  1 file changed, 48 insertions(+), 21 deletions(-)
 
 diff --git a/src/synth/fluid_synth.c b/src/synth/fluid_synth.c
-index 0df620d3..379f8216 100644
+index 1eb5d737..6c876efa 100644
 --- a/src/synth/fluid_synth.c
 +++ b/src/synth/fluid_synth.c
-@@ -3306,10 +3306,10 @@ fluid_synth_program_reset(fluid_synth_t *synth)
-  * Synthesize a block of floating point audio to separate audio buffers (multichannel rendering). First effect channel used by reverb, second for chorus.
+@@ -3628,10 +3628,10 @@ fluid_synth_program_reset(fluid_synth_t *synth)
+  *
   * @param synth FluidSynth instance
   * @param len Count of audio frames to synthesize
 - * @param left Array of float buffers to store left channel of planar audio (as many as \c synth.audio-channels buffers, each of \c len in size)
@@ -38,8 +38,8 @@ index 0df620d3..379f8216 100644
 + * @param fx_right Since 1.1.7: If not \c NULL, array of float buffers to store right effect channels (size: dito). Since 2.0.3: NULL allowed for array entry
   * @return #FLUID_OK on success, #FLUID_FAILED otherwise
   *
-  * @note Should only be called from synthesis thread.
-@@ -3386,15 +3386,27 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int len,
+  * First effect channel used by reverb, second for chorus.
+@@ -3719,15 +3719,27 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int len,
          for(i = 0; i < synth->audio_channels; i++)
          {
  #ifdef WITH_FLOAT
@@ -71,7 +71,7 @@ index 0df620d3..379f8216 100644
              }
  
  #endif //WITH_FLOAT
-@@ -3404,12 +3416,12 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int len,
+@@ -3737,12 +3749,12 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int len,
          {
  #ifdef WITH_FLOAT
  
@@ -86,7 +86,7 @@ index 0df620d3..379f8216 100644
              {
                  FLUID_MEMCPY(fx_right[i], &fx_right_in[i * FLUID_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT + synth->cur], bytes);
              }
-@@ -3417,7 +3429,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int len,
+@@ -3750,7 +3762,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int len,
  #else //WITH_FLOAT
              int j;
  
@@ -95,7 +95,7 @@ index 0df620d3..379f8216 100644
              {
                  for(j = 0; j < num; j++)
                  {
-@@ -3425,7 +3437,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int len,
+@@ -3758,7 +3770,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int len,
                  }
              }
  
@@ -104,7 +104,7 @@ index 0df620d3..379f8216 100644
              {
                  for(j = 0; j < num; j++)
                  {
-@@ -3456,15 +3468,30 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int len,
+@@ -3789,15 +3801,30 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int len,
          for(i = 0; i < synth->audio_channels; i++)
          {
  #ifdef WITH_FLOAT
@@ -140,7 +140,7 @@ index 0df620d3..379f8216 100644
              }
  
  #endif //WITH_FLOAT
-@@ -3474,12 +3501,12 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int len,
+@@ -3807,12 +3834,12 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int len,
          {
  #ifdef WITH_FLOAT
  
@@ -155,7 +155,7 @@ index 0df620d3..379f8216 100644
              {
                  FLUID_MEMCPY(fx_right[i] + count, &fx_right_in[i * FLUID_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT], bytes);
              }
-@@ -3487,7 +3514,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int len,
+@@ -3820,7 +3847,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int len,
  #else //WITH_FLOAT
              int j;
  
@@ -164,7 +164,7 @@ index 0df620d3..379f8216 100644
              {
                  for(j = 0; j < num; j++)
                  {
-@@ -3495,7 +3522,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int len,
+@@ -3828,7 +3855,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int len,
                  }
              }
  
-- 
2.17.1

