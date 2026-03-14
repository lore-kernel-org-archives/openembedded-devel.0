Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B6810706D8
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 12:40:55 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8878.1773492049423829870
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Mar 2026 05:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HEx8Q6do;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48539d21b76so21441935e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 05:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773492048; x=1774096848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lty3sWl6sbd/7OgPo9fiHIhvJbkvROg8JY6yXRgyVzQ=;
        b=HEx8Q6do4ORTBEM8KcOnbPWPjIfQWSlJ6aWvSRy70WLvQtfbZ7cMCkTVHWfafwoZQi
         hE8umnnPXsqkfVDsGnHj0YBo9XbSv25F5No8ZrmJt7PDq/j8ywjQ1BS6DPzhayftAiHN
         4I3xfGSyltq25yd9L2zsTvoBUAp2ONETKvMsAa4gOOobTVlKWti6VqmSX0njcY73sLx9
         6oBq514MfI4UUDckLjqNEucVbI+Tv1QL6LP+6UysyJRSxPqe5OlnYqTg8tGPr8ZhWNvs
         3V7sF2pplghvpxDFlQXZQOVe1wMQTqLK53j//xqq/SdAD0j8hPnEfSENpH07UibAp5yI
         xwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773492048; x=1774096848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lty3sWl6sbd/7OgPo9fiHIhvJbkvROg8JY6yXRgyVzQ=;
        b=jQYZ1su0dIE6911SU/GSfwNArUURPl0HgKZDrh8I0rcmFLvM5xiOQ/77xiea3j5+U7
         Yzrjf/XD+vPoBGa20ATpxjotlFpuuhNGRdyekRrstbv/KgkJLDqjCTkaizcN473NXjgh
         Auyl03ipAj+GhTENoEKNxlPe5wocfETR2nN2CkP8xwWsBN+BINukOt1RF+xf1sFdQgwS
         Ws0U5RKDG6zroM4QvZXHC3Ge+so1hNTPYIFlLOCQlxxGK3JbfA8tSJueWJehAQciSlkn
         OpYOmsLXbormH0KDE7ynkMZX7GLwtWfJTIVaRNhKUNkdBXW0ZmtZdO4bHFBn+8C+yWx8
         GXzA==
X-Gm-Message-State: AOJu0YzbnauAcCUaIMf+agRJM3man2hyjy1DIuMvWSIPTLqBSPX0h8kn
	xiUW1NYiuTBWKuhWZwT6O1Vyi+T1vQnOmGlbGhG80ikZ1IfBqD+vvQNlnRKb5Q==
X-Gm-Gg: ATEYQzwJ7z94mDXcj1HgAG+GQi52/KOjvzy8ZTAOO3W8nqFQzFSRlT9ZixYCBtm8FyL
	4jW3haTE31e9QGsiFN3NeTStHLvOeEqkVHjOxtHFXnfpGIFrUdJ8kQI0cO2YosDhoT/ZrIZtTqt
	Yt7ezEoKEosuI9ABgIsRUZrtaXm5lA7owHbB3lGKFIwyU7G/pxJTUFakF2oT6GALX8LRBvyUn7I
	riFXyy5yq3xGxxPUADTVygtacoj5fC5tCM9fTptvgDMfodLWlpHKLTKbHdbBDa1OYOBhvy2XITU
	eQjvHulxxYZM60pwyObYCw8pDVNNGqnKohQfupBi5Ni0TyDGlYqNy35J//BiEjdFY04I+M8nzV/
	3HXYwglyVau1Z2sU3qLzmrRWFeLO9+3eA+/Oa42JkpmpvenGwnFUzU2ljUeslXwJU1pXNhYZffE
	9KjbHfXErgAXPNMtjRFNaJ
X-Received: by 2002:a05:600c:8b45:b0:485:4526:ee05 with SMTP id 5b1f17b1804b1-48556700c0dmr104796065e9.19.1773492047408;
        Sat, 14 Mar 2026 05:40:47 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48558fd09d8sm118564135e9.7.2026.03.14.05.40.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 05:40:46 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] bcc: add missing build dependency
Date: Sat, 14 Mar 2026 13:40:46 +0100
Message-ID: <20260314124046.3326920-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 12:40:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125205

Without xz present, compilation fails with the following error:

| <...>/x86_64-oe-linux-ld: warning: liblzma.so.5, needed by <...>/libbcc.so, not found (try using -rpath or -rpath-link)
| <...>/x86_64-oe-linux-ld: <...>/libbcc.so: undefined reference to `lzma_code@XZ_5.0'
| <...>/x86_64-oe-linux-ld: <...>/libbcc.so: undefined reference to `lzma_end@XZ_5.0'
| <...>/x86_64-oe-linux-ld: <...>/libbcc.so: undefined reference to `lzma_stream_decoder@XZ_5.0'
| collect2: error: ld returned 1 exit status

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../meta-python/recipes-devtools/bcc/bcc_0.35.0.bb               | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.35.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.35.0.bb
index 4051d7fe11..6e821cca7a 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.35.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.35.0.bb
@@ -13,6 +13,7 @@ DEPENDS += "bison-native \
             clang \
             libbpf \
             python3-setuptools-native \
+            xz \
             "
 
 RDEPENDS:${PN} += "bash python3 python3-core python3-setuptools xz"

