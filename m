Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.12202.1618187643816991073
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Apr 2021 17:34:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=avisKzQ3;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id r12so17416310ejr.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Apr 2021 17:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3NeHJ6wGxccBPpFn0giJ46Am+PFNq3biW+QXt3MSCh0=;
        b=avisKzQ3Su0utxCCxma4NQGvpODd5Q0ShXjbb6Murf2FEXnhTLTw8fY+3G9UPL/i6u
         YXihzzc1u6kGS5XfAXKylYCIemB0dmFTJXLatnCUs0IKIApchu765ZnxQJ1b8luxg4mD
         Ie9f6VHUobFKiDoAlzbSAfiCZKpfuB+Cel2VhXVSyRFyGg7Um+rMdY5KvzK9MSkSa+O4
         dmlMY0WdM0S3nYyNtQh5vXKGCOuLybvTGUiTNuKhMRak70betgEzPKkhzLQZDTGma1cr
         r9vzx88v1Pk00OkIMFh1INH2Jl4QC834fo1Ck7nOnlnsJWomAqOd+cawm9JYtBVYFaDS
         jEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3NeHJ6wGxccBPpFn0giJ46Am+PFNq3biW+QXt3MSCh0=;
        b=JXK46nlQHqe3yDTQnO0WDwBg8nzP9oTrvWKaaXA74oXV7/dqVncSuRnBaKSJDo6F+j
         kWzEVAGImMYhDatuPMaRlUC2k9otCb4ZOlSMvfw3q/kdW8i9haJWPYmRS5i828fNtAF5
         LBZdrZrRja0RZTdKcMO2F66XYtwm4VV3sLSVFK7EDLQX/Dwhr75Zne34F19NaqoUs9PL
         lR4P07kA2Xm1NNbQSU2YfxfTs/vxPXmfD4iXkYWJlpBrgOVVmAyQ2Zje6w4u6aVrFA2P
         NIWpyj+3xlTgn7gWaj8IcrBXQZci0E8+Kg3AXpfhINYSRcnnUfvb1ftUjJNUHG5EL82e
         YpOA==
X-Gm-Message-State: AOAM5312EAWWGgnEzL6544tGyMMta2Ee40bPcmPoQ3AgAtgiTuJX84mq
	McKIuNwb0vjxiSYlEucIVerVP+A56Yw=
X-Google-Smtp-Source: ABdhPJxTYWImY6++nn7suLWTFyCq43PVzPiCcmBv4geiw3C9POMk+qMfSO+QdUoxdkc0XF1tw0nLXg==
X-Received: by 2002:a17:907:6289:: with SMTP id nd9mr24855259ejc.384.1618187642165;
        Sun, 11 Apr 2021 17:34:02 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f04dc492d0bd779440c396b.dip0.t-ipconnect.de. [2003:f0:7f04:dc49:2d0b:d779:440c:396b])
        by smtp.gmail.com with ESMTPSA id h15sm4703762ejs.72.2021.04.11.17.34.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 17:34:01 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 1/2] fluidsynth: upgrade 2.1.7 -> 2.2.0
Date: Mon, 12 Apr 2021 02:33:52 +0200
Message-Id: <20210412003353.1888691-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
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
V1 -> V2: Refresh patches to fix fuzz warning
 .../fluidsynth/fluidsynth.inc                 |  4 +--
 ...te_float-Allow-zero-pointer-for-left.patch | 26 +++++++++----------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index c2badc446..63ba54c34 100644
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

