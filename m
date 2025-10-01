Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788B9CCD186
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:53:08 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.18627.1759326783681388218
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F1TYI4Dn;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6366b7fd337so3319754a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326782; x=1759931582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5OLAuhdQ7hsN9OiDH78z6Tfxp99yqel6NKpBKK0GQwg=;
        b=F1TYI4DnfH/SvD70Tjd1rPZxM+8jvK9+bAIcTiNlykT+N0RgTHlJ1X1pzwWB2wdgt5
         ORBQJWWHVH9NfXZY9LHiKblqGO4kYhisFtqrcuu/Y7LxueqOfkrGyhBBiAc1UksBb19n
         D01uMNN9Na7nS/LArK8pQ9gArBdOq//1r/d3Joj2A+XhXcVLcDeT9Zck5xnLLW5jaLSJ
         z3NBjBvzjHyAUcjWrYQxDHP9JlE7slI8QtJJCqbvJmyRJS8d4nRRGqi0UpxMlPrPXeG+
         aqegRE2y/gorG8eFTVf7u5mCnZtwdqwualbZ8NqMsoC1cpXufS+7gf776qm56ij/pjmb
         9m0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326782; x=1759931582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OLAuhdQ7hsN9OiDH78z6Tfxp99yqel6NKpBKK0GQwg=;
        b=E8MbDmHKrcIkemizW8EMp0L7WhpjEm3t/FOFYjGlN4FxmOHm4hrYV7wY5SdcdL5efv
         NUT8quO1N8qyLXd7ArY1zEh1aRFvJ09l/W4qPgNTgfuTdcQOVyzeyX//lSt0z/9BvMwm
         E8qaP/bo1nWl2ipl3dxFYX9ngb98j0obQEZsLN+FwMpJXju2yaWazlPfRVvNYY4bFK0J
         m2Agqg+D1/wxdi9KVixUaZOlJa8fnSvd79bwJtv4eooxqBY5AYLy3zRk+2U05tpZBkLX
         XgeWApNdt/PW1iWuUvJZ2ZR2SuqP5JpMiYLGLK7dRaPhBgUUjPWZ1ZVuL6Y3H6EkfpQ7
         25zQ==
X-Gm-Message-State: AOJu0YyR3186sRhpNift4/KMDX4Sdc5CDzL+ycBewMx1giTqeBW2PlnS
	eVFTt55JlEaDmVJeGAmmOEOrR6q3c0X8UlOBQPo7s5Kwt6EtzGhG4rETKWathA==
X-Gm-Gg: ASbGncss5nuc5i7mEPaZbyMJ2vEgCMpxthqvWTMsmbf2XGhOQl9zpKn2OIscCRW6rzl
	nOPBx/F+h8puzbmOiDIXz+Maaf/k36qSona/xE8onp7xFTXzIvVzr7cqnmFew3GgDWNYc3dB627
	fkrI/+KFTrU/JwQ+WFl9sPWBhnSxZZc4XD+57pyz5q7ByvEymzbJxIhKo0/nsPsT6POATL/sIFg
	8rEBJ+MjR1YuWtZe+yHHlr8X94fnE8OOj/85Dp7ZL0d4e2J5qUuFISeyONc9009PWOuzXrasgXi
	rsL8FNjCo6BZRq1FhqcGc062cSsrfJ110MBCB2QKIv7Msu7UrNP9Ja1UFg4+RV7fV6emHzpy2QV
	/pw/vTVbOPVgPc4h3cnRDo3139ExgsWfF4JMFWAKUJPj8v8LCqRQ6K9k=
X-Google-Smtp-Source: AGHT+IFW+8INVkajKqEi8Gvq6Azbpnc4gQcdfGs+yt/Eqk0fTXmGyTiD3Qe9nbvVcFhHYfUpmuxfpw==
X-Received: by 2002:a05:6402:4409:b0:632:bc36:db59 with SMTP id 4fb4d7f45d1cf-63678bced0amr3916610a12.1.1759326781694;
        Wed, 01 Oct 2025 06:53:01 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.53.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:53:01 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 21/25] libmad: patch CVE-2017-8372 and CVE-2017-8373
Date: Wed,  1 Oct 2025 15:52:39 +0200
Message-ID: <20251001135243.1490753-22-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
References: <20251001135243.1490753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120136

From: Peter Marko <peter.marko@siemens.com>

Pick patch [1] from Debian based on [2] and [3].

[1] https://salsa.debian.org/multimedia-team/libmad/-/blob/debian/0.15.1b-11/debian/patches/md_size.diff?ref_type=tags
[2] https://security-tracker.debian.org/tracker/CVE-2017-8372
[3] https://security-tracker.debian.org/tracker/CVE-2017-8373

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 437635f608f2d9b69fefcde9ebfcff2bab64d35e)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libmad/CVE-2017-8372_CVE-2017-8373.patch  | 69 +++++++++++++++++++
 .../libmad/libmad_0.15.1b.bb                  |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/libmad/libmad/CVE-2017-8372_CVE-2017-8373.patch

diff --git a/meta-oe/recipes-multimedia/libmad/libmad/CVE-2017-8372_CVE-2017-8373.patch b/meta-oe/recipes-multimedia/libmad/libmad/CVE-2017-8372_CVE-2017-8373.patch
new file mode 100644
index 0000000000..a57df492d0
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libmad/libmad/CVE-2017-8372_CVE-2017-8373.patch
@@ -0,0 +1,69 @@
+From 7e8f6e5118e31455924940141a761a1589e8d85d Mon Sep 17 00:00:00 2001
+From: Kurt Roeckx <kurt@roeckx.be>
+Date: Sun, 28 Jan 2018 15:44:08 +0100
+Subject: [PATCH] Check the size of the main data
+
+The main data to decode a frame can come from the current frame and part of the
+previous frame, the so called bit reservoir. si.main_data_begin is the part of
+the previous frame we need for this frame. frame_space is the amount of main
+data that can be in this frame, and next_md_begin is the part of this frame that
+is going to be used for the next frame.
+
+The maximum amount of data from a previous frame that the format allows is 511
+bytes. The maximum frame size for the defined bitrates is at MPEG 2.5 layer 2
+at 320 kbit/s and 8 kHz sample rate which gives 72 * (320000 / 8000) + 1 = 2881.
+So those defines are not large enough:
+ # define MAD_BUFFER_GUARD      8
+ # define MAD_BUFFER_MDLEN      (511 + 2048 + MAD_BUFFER_GUARD)
+
+There is also support for a "free" bitrate which allows you to create any frame
+size, which can be larger than the buffer.
+
+Changing the defines is not an option since it's part of the ABI, so we check
+that the main data fits in the bufer.
+
+The previous frame data is stored in *stream->main_data and contains
+stream->md_len bytes. If stream->md_len is larger than the data we
+need from the previous frame (si.main_data_begin) it still wouldn't fit
+in the buffer, so just keep the data that we need.
+
+Source: https://salsa.debian.org/multimedia-team/libmad/-/blob/debian/0.15.1b-11/debian/patches/md_size.diff?ref_type=tags
+
+CVE: CVE-2017-8372
+CVE: CVE-2017-8373
+Upstream-Status: Inactive-Upstream [lastrelease: 2018]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ layer3.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/layer3.c b/layer3.c
+index 4e5d3fa..7dc4ca6 100644
+--- a/layer3.c
++++ b/layer3.c
+@@ -2608,6 +2608,11 @@ int mad_layer_III(struct mad_stream *stream, struct mad_frame *frame)
+     next_md_begin = 0;
+ 
+   md_len = si.main_data_begin + frame_space - next_md_begin;
++  if (md_len + MAD_BUFFER_GUARD > MAD_BUFFER_MDLEN) {
++    stream->error = MAD_ERROR_LOSTSYNC;
++    stream->sync = 0;
++    return -1;
++  }
+ 
+   frame_used = 0;
+ 
+@@ -2625,8 +2630,11 @@ int mad_layer_III(struct mad_stream *stream, struct mad_frame *frame)
+       }
+     }
+     else {
+-      mad_bit_init(&ptr,
+-		   *stream->main_data + stream->md_len - si.main_data_begin);
++      memmove(stream->main_data,
++	*stream->main_data + stream->md_len - si.main_data_begin,
++	si.main_data_begin);
++      stream->md_len = si.main_data_begin;
++      mad_bit_init(&ptr, *stream->main_data);
+ 
+       if (md_len > si.main_data_begin) {
+ 	assert(stream->md_len + md_len -
diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
index 869ac93da9..a710af1acc 100644
--- a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://downloads.sourceforge.net/mad/libmad-${PV}.tar.gz \
     file://fix_for_mips_with_gcc-4.5.0.patch \
     file://obsolete_automake_macros.patch \
     file://automake-foreign.patch \
+    file://CVE-2017-8372_CVE-2017-8373.patch \
 "
 SRC_URI:append:toolchain-clang = " file://0004-Remove-clang-unsupported-compiler-flags.patch "
 

