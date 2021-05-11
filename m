Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.7073.1620698861131186060
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 19:07:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sNLuGgWo;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id j3-20020a05600c4843b02901484662c4ebso342693wmo.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 May 2021 19:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cAid1U30BtmvAQmocYUxIX8j/ZO5dOFtFLPMfzlpqpU=;
        b=sNLuGgWogfm17XJ9iTaZf6iCDPgt/DqiKEf+j4AHDLwmE9jqBulHf4eX3w1v2oJKCY
         YNhuVZd4g6r/mIaORR1nhgurs/Yq6iWh+IZGfICURQ56/y8ErR/8rgjwpwkFnSrG8FFp
         MJbWLpSKcokXVd7bWBKGhqpuHzeQu5Z5SkthiZyPNzQQcp5b09M+2nZ2bqsahSv0Ep7S
         QWWXOlz0BEEeyyuuApTznELVUzH0gqhl3BBZwRh8sTTYhPAQPz2TQk0RCPirqqlJNRFo
         iS22AY2rHyC2cxNi0qqpVHMFW/GkV2+dBzBU4dLyZy8Dqsae8FLK7SqW+drfdRtBECEB
         2Y5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cAid1U30BtmvAQmocYUxIX8j/ZO5dOFtFLPMfzlpqpU=;
        b=LikO4+wQIn/G/tA15d3loKDSgSrlWIdBeo++/qeEM0oP4lYp7s6V4YnKvjhHnCrJef
         KKGdsJanSpGGWm6yc/HZrwPOwng36wbi5+wYcaZDdQLlc1+3OABVjcKIU55OWyO4i4Sc
         oy6OQbO+/1SBuT+sPE4hCvdcFHGAn0iYiPqtMpzoPOgcnTFIJvlFetbeQ6kn5y4K0uwo
         PbX2JBYsMbvK7HgH9k3W2v91KJVTRvGLV58uv6r/qgQhvK+O8Ws6oSfJcCswCcguA27m
         Ir8BRqJM7U6bk0OGA3l4To8VCDnEMw0RKGs9rTD8j4iUWSALEsa6pyKXp1mI4bco6Ka5
         9YwA==
X-Gm-Message-State: AOAM531NJ44Dnu8MXS2oLj2J8bV02awt2CWfGCO7skmWQP08h2zGl9CF
	3yXcuOB3rsj+DM0wRQpzLmWatgf8smc=
X-Google-Smtp-Source: ABdhPJyyt3RXRFIzxKJ2n9dPT3KJK4HI8gJvYlu6fFUaXFB9JMuj/OTKRnIO9ff/3K61p9ENTLaHpA==
X-Received: by 2002:a1c:a5cb:: with SMTP id o194mr29764176wme.91.1620698859756;
        Mon, 10 May 2021 19:07:39 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f4fac346ac282ef7d435921.dip0.t-ipconnect.de. [2003:f0:7f4f:ac34:6ac2:82ef:7d43:5921])
        by smtp.gmail.com with ESMTPSA id n12sm20145075wmq.29.2021.05.10.19.07.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 19:07:39 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/7] fluidsynth: upgrade 2.2.0 -> 2.2.1
Date: Tue, 11 May 2021 04:07:23 +0200
Message-Id: <20210511020725.346160-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511020725.346160-1-schnitzeltony@gmail.com>
References: <20210511020725.346160-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Make ALSA the default driver on Linux (#878)
* Coreaudio driver failed to initialize on MacOS 11 (#803, thanks to @ringoz)
* WaveOut driver failed to initialize (#873, thanks to @carlo-bramini)
* COM initialization in WASAPI driver is no longer performed in the caller's
  context (#839, thanks to @pedrolcl)
* WASPI driver now supports reverb and chorus (#836, thanks to @chirs241097)
* Handle SysEx GM/GM2 mode on, GS reset, and XG reset (#877, thanks to @kode54)
* Old behaviour of fluid_player_join has been restored to prevent infinite loop
  in client code (#872)
* The Soundfont loader code has been refactored, illegal generators will now be
  skipped more consequently (#823, thanks to @mawe42)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index 63ba54c34..a8c8b4cd3 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -5,8 +5,8 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
 SRC_URI = "git://github.com/FluidSynth/fluidsynth.git"
-SRCREV = "8413c35aca641567baf13e9b16e9839019ebf99d"
+SRCREV = "90a6c52e1c347d1c4283b0de9f860ed2fbc413bc"
 S = "${WORKDIR}/git"
-PV = "2.2.0"
+PV = "2.2.1"
 
 inherit cmake pkgconfig lib_package
-- 
2.30.2

