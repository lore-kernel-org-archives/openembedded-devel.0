Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web12.972.1602637591175325344
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 18:06:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=blhWwbW2;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id t20so1358191edr.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2020 18:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FYCTAWFyDHzFHNjZ8/ZpmiwLuHyexGcSlLva65AImsg=;
        b=blhWwbW2ykwa2xlqcjuIxR9EqzC8/ZYB4CaruO8u8wEHjkyT/vURrtRlPffxdpJ3EA
         IJRIU05Ur6w99jMWOR73aiGtiH9NYD7b0EtPSSzwwAHAkY8UsgLpglVVlpcljX2iXB4t
         RdfchpCjWuQR5yGi0pkSRIMEACrbbhDHDPFrAt7hyc30stxDOetbpAEU7PZr5VoSkfF0
         ssXvoOqbGsOjlLvyHHyWl5pHe/qvddxhVAdNw2CcMVapRaGiFTtZxuS/he51zNIE6QKK
         CUYqdOy4MLArS+VR+GyrIwmCA5yKXNj/avGaKF/LiAxc7uZNVPOzgnD3S/w5Dtw9GuX0
         7SOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FYCTAWFyDHzFHNjZ8/ZpmiwLuHyexGcSlLva65AImsg=;
        b=b87qIf1y5oz4wka1AoIcXb2vUngaX8zN75ho2k9GGv+xId0Z8P+lKdtsjjEM1GuDq+
         T0KyuVXm3ct2okBnSm+ydO/RK3P6ERhmQT3k3hr4/fPs4INzcPonyVbT7K9KCa2Bbfdo
         doi/oWRtUIohO32yan4qUuiVK7LTKZX1YCpp9Olj2ap52AW/Ij1hWD+wUd30oWzSKzR7
         VK/vGFhZRKRhVmHUBc8L5x0OR0Gq8qc6enHfN4KIKsgwcZyd+T9+8DZMT63HzoRDXXmJ
         +e4iZWGsKtRj0akPUwjI+RdW38uMr5M4OFASRRhy7OE3mpPViwZOEzK+kcEqbTBY7TfN
         kHzw==
X-Gm-Message-State: AOAM531ebLo37uSyJbm3+UO62nCuhuAIrOTtnP1PvSZzTAcZ/g6rvVvJ
	zdTTRvRbvWlAdVjzq8GXeazIKf1hcTM=
X-Google-Smtp-Source: ABdhPJxJyYGQyp4KSILTT58FUSyTwZwngEhxOs02lhKrAOz6/3cj0496FOOZN3h86ZhmGd97WcTIFA==
X-Received: by 2002:aa7:d782:: with SMTP id s2mr2508392edq.111.1602637589146;
        Tue, 13 Oct 2020 18:06:29 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f375957a175fbdd89b9baae.dip0.t-ipconnect.de. [2003:f0:7f37:5957:a175:fbdd:89b9:baae])
        by smtp.gmail.com with ESMTPSA id i20sm592594edv.96.2020.10.13.18.06.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 18:06:27 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/8] fluidsynth: upgrade 2.1.3 -> 2.1.5
Date: Wed, 14 Oct 2020 03:06:10 +0200
Message-Id: <20201014010617.1086948-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fluidsynth 2.1.5:
* loading DLS may have failed in certain setup environments (#666)
* fix a build failure with GCC 4.8 (#661, thanks to @ffontaine)

fluidsynth 2.1.4:
* fix an uninitialized memory access possibly triggering an FPE trap
* fix several regressions introduced in 2.1.3:
    fluid_synth_start() failed for certain presets
    fix a NULL dereference in jack driver
    fix a stack-based overflow when creating the synth

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-multimedia/fluidsynth/fluidsynth.inc            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index fcc9df8c3..73c1d0db6 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -4,9 +4,9 @@ SECTION = "libs/multimedia"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
-SRC_URI = "git://github.com/FluidSynth/fluidsynth.git"
-SRCREV = "19a20eb8526465fdf940b740b13462d71e190a1a"
+SRC_URI = "git://github.com/FluidSynth/fluidsynth.git;branch=2.1.x"
+SRCREV = "6776569abe9a885bcec14141692fa93c0568d51c"
 S = "${WORKDIR}/git"
-PV = "2.1.3"
+PV = "2.1.5"
 
 inherit cmake pkgconfig lib_package
-- 
2.26.2

