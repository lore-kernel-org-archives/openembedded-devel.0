Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.468.1617833923963065275
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 15:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CbM8BeFd;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id j199-20020a1c23d00000b0290123bb155f6aso1890530wmj.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Apr 2021 15:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IAt8p8Cj2ptpNc0KbK4ZDNiUVglSFfgIs2q3IojqpV8=;
        b=CbM8BeFdYpEiGLAsUTJDnistVytYAjuBWnDyRNHd3ToZ7WmXp31fhkCtf0K+yWAIMN
         zbROdh73mza9hLz7OfBBZxtdrhAEYk7Ylh7pnBiqHhEQpiZ8Ura6wK6AgUtOiohCQhhJ
         ki/C5lpZGNqkVkbUvva8Nmig1a0taFz8Ov5Iqj3otaWY8eT87N19A5HFea1FsFqpcfNY
         0GaR3CIpfQjGJTFAA8Ndeq5oPlb0TdXIAgot1Hy0/fKpqWYc/aF5flfRNKtY0qywSjda
         iJ2jQE3OQiAc5rnVjPiwGfH2hRqQBOPO69iikJu/SLwBmJQpYe/1tB+8Wl4jcQFPz4r7
         EwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IAt8p8Cj2ptpNc0KbK4ZDNiUVglSFfgIs2q3IojqpV8=;
        b=mqe3/E/NsXPhJ5qh1+xvEQRu37xxy4ShkQ5Ze0qSeXcj3O+Ac6iLy5jt+M4lh83C6I
         yUN1UFLA6sQL2KygMRPoxgZhHSCeoS/gfyiMV3IS9JuRbW/KcRUacKXM0+lW7Lv+wqX5
         jOoDRLhdW0OAojCOggwz0LmoYXulkeF6RQjA4HzMgSaP4wiy9zHUtiRTQAvLYg9ZTbZ8
         aZWNCBC/MRBKnDv3ytUI7esM6EziXBPg4Rutp2HS5na37AGuXqUxMzE1ebzRLHeUVAmB
         nSNMV2RgiI3d4+7k4RGoc51eeXSPbuLt30XQdDNYRv/BwhwelNyT9bOxGeAhUA0bnt6M
         VjYA==
X-Gm-Message-State: AOAM532aq+5lYmHC7VEl9Fi6anc7r9r9DBkTI6AKO2RTULr2QDTBievd
	H2YUHZYjMTOg/+9v/R0Utdr5QLeE8rU=
X-Google-Smtp-Source: ABdhPJz5/fTyaGnmidqt0WdRBNtOaaSllE2t/Fg3ibS4XzehFPA3x0n7mxE+7i/cJAj3u86e1zgZyw==
X-Received: by 2002:a1c:3581:: with SMTP id c123mr5122465wma.118.1617833922270;
        Wed, 07 Apr 2021 15:18:42 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f1192521410777e3304dd72.dip0.t-ipconnect.de. [2003:f0:7f11:9252:1410:777e:3304:dd72])
        by smtp.gmail.com with ESMTPSA id e9sm27462434wrv.92.2021.04.07.15.18.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 15:18:41 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/6] fluidsynth: upgrade 2.1.7 -> 2.2.0
Date: Thu,  8 Apr 2021 00:18:28 +0200
Message-Id: <20210407221829.606871-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210407221829.606871-1-schnitzeltony@gmail.com>
References: <20210407221829.606871-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
---
 .../fluidsynth/fluidsynth.inc                 |  6 ++---
 ...te_float-Allow-zero-pointer-for-left.patch | 26 +++++++++----------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index 74a2683ac..63ba54c34 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -4,9 +4,9 @@ SECTION = "libs/multimedia"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
-SRC_URI = "git://github.com/FluidSynth/fluidsynth.git;branch=2.1.x"
-SRCREV = "e2d67ea77237046b703d537aec90620c22f7f629"
+SRC_URI = "git://github.com/FluidSynth/fluidsynth.git"
+SRCREV = "8413c35aca641567baf13e9b16e9839019ebf99d"
 S = "${WORKDIR}/git"
-PV = "2.1.7"
+PV = "2.2.0"
 
 inherit cmake pkgconfig lib_package
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0002-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.patch b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0002-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.patch
index 94daa951c..f7debc5ad 100644
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
2.26.2

