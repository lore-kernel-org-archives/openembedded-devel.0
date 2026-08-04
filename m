Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16AEBC55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:41:12 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24990.1785872470710850290
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Xx6kq/x1;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so201302a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872470; x=1786477270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fczw3vZx8dUJMxKxekriCe2B+zxkJchiTvTrKoMwo4I=;
        b=Xx6kq/x14N4yWPJT6+/F2UtfYOiaBi9S9camKq5MBS+0z6td1yzMDJ2dL6D9PVB/5U
         PAhB+mktNJWNT/JESEh1uCHvDacEpwHRprgVskaOFEYkld22oWefAs/pYXBx5KEP8LEE
         Kva1fX498jgYg/xSww8hf8wFJR9IFUfaTSyVxgqG1vdknOl1YrM0TRiq80WIlUIY6KXR
         IJhIjKLi6CyRDMs8o3p+j6wcPff20L8CiS9MQlP8JLNPWSCl4MmIlzJx5fp9K7Vi6qXR
         RwkGh4yOIqPGU65tX+ccaCqlAx6gl3oBwTVXSb1kCtUxeEYQPMAQ6p1xRy/MpLcPWoyF
         243g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872470; x=1786477270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fczw3vZx8dUJMxKxekriCe2B+zxkJchiTvTrKoMwo4I=;
        b=UluDBoouovWBfyHK8VC1fyAffJEH53E8RjGF2NZJGhaMOmuiz2B4wWfbAKnu6SXEye
         7CzLHzR9O6iBPcxpAMng4lDnuCZN+/P2vMNr9RcjYsv6GTswfBVaoyGWGAZ5V1JhVrMQ
         nE3T2Fn0pSJj6Tzvsmn8pubfcBIUNE8trs92UT91uULZn5X5IvT/3qICZxCOsn29Kgew
         OMDso8R6o8/7FjRZsQcwwRh1yE9fPROHz6gAW0HoxFGRLTl0jr++Km81uB/jbBua1uOe
         Y8UbC8xf6K4lc2O27Z4WRWD8rTJN7Q4vIJV67RNUjaVSrs2gdiOw4ON3VjdW/DhLwkkN
         fiEA==
X-Gm-Message-State: AOJu0Yw9wIKnOK8KU3gUVsACk8+lGHqeGZxKJSVZRxYCw5GnlPTrf3ze
	QiCTnGKTyy/CHaoUZr0+bsS30KcFQtnZKbCxTm4/zjwpAxfbHKkqvoanhM0bdw==
X-Gm-Gg: AR+sD10FVN0j3bjNZJ+CJFXg9lhIwWhg6Jlbi6yrNecfbUpVZpyXdT6seJqz/Ru1Vmf
	sim13k3foL5n1Oa18g+QxuULOzJZOkqczjflwY1JfHKQBLZp3tySpNksb1CfJXEguXrLnRv/VZ5
	0TkJdDZUicEwCNncMctShY4gADNFy/lKTXLC2GPxGRmjGqzVPK70F9psjVjEfotV7Ui4sTCPvAm
	6PBMFoRMrmRoXSGR33k6Oj+pvX0Mpz6bp3CLH+IjAkCBgfdG/FYEXbjG9xoQnUHwcQlHiCBSCRS
	PsqctYKy7rtVnena4yasxJpc7TULPxZ5V+iscLp6ZjpBf0H7DKDHpKv94ylukaAwjeGGbmquj3j
	U2CsqVHSRYQYfscg/UgmiLtvFftnEm9oH377+Wb1FGyMxN9qtRgxTufJ3CePTZcgsHnKbWjtmRs
	53SxVKnhrbpOJq1a3dlHUiBReFbWKVzAZaXy3hUBTgKDHYXMj+3IA0tJJ2ejsY/S7LWf9OwLuzW
	w==
X-Received: by 2002:a17:90b:5112:b0:38e:542:6485 with SMTP id 98e67ed59e1d1-3903c5919c4mr1122981a91.12.1785872469927;
        Tue, 04 Aug 2026 12:41:09 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:41:09 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 24/36] fluidsynth: fix branch after recipe update
Date: Wed,  5 Aug 2026 07:39:51 +1200
Message-ID: <20260804194003.3158916-24-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128771

From: Markus Volk <f_l_k@t-online.de>

- use nobranch=1
- use tag=v${PV}

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 1c1a63b2a0d8c0f0a9b0f5a87a407f6bdfa3ee68)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-multimedia/fluidsynth/fluidsynth_2.5.3.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.5.3.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.5.3.bb
index 4dbf4d1fc7..f579d1ddd2 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.5.3.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.5.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
 DEPENDS = "glib-2.0"
 
 SRC_URI = " \
-    git://github.com/FluidSynth/fluidsynth.git;name=fluidsynth;branch=master;protocol=https \
+    git://github.com/FluidSynth/fluidsynth.git;name=fluidsynth;nobranch=1;protocol=https;tag=v${PV} \
     git://github.com/kthohr/gcem.git;name=gcem;subdir=${S}/gcem;protocol=https;nobranch=1 \
     git://github.com/Signalsmith-Audio/basics.git;name=signalsmith-audio-basics;subdir=${S}/signalsmith-audio-basics;protocol=https;nobranch=1 \
     file://0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch \

