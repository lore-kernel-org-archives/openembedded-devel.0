Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73585D44160
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 09:29:13 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9215.1765531745195206774
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 01:29:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cp1Xz0A2;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29812589890so12657545ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 01:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765531744; x=1766136544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oj3iCaXCUUW4SuHCHg9x0jgdhGe0bMLMA60z/GuNv7E=;
        b=Cp1Xz0A2xFRsaHecuhDF6j8XeKGNM4kxxPYqBdamOkSaGLY5kLq/rzBJNWFUBA5UT3
         79h6rVLsPA5ND4y0N9iGeFugFqMyZfcn6WrAtjB98Mmv/zmDfp5vz0j+GctVaCb2muS1
         v6KgbSAiRc0UjAY1c9rJNxs2lz0OtD6YxmCccUKnC93XYStK8RSSzgVpNeGEoeX47QwO
         UxkmUGpeam9sEiibRvvKpLthA4HeVNU0/AhSdzHKyOk8mskhq//WDtu8sPbPsXIqZfh1
         aRlvztYVM1XJiYzMqt4pvYVSgV7UyUo/R1Kbg3XXgJIO0iFJxW6/XU6o2y3JtGZKJFro
         7eCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765531744; x=1766136544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oj3iCaXCUUW4SuHCHg9x0jgdhGe0bMLMA60z/GuNv7E=;
        b=IO1iSvyuhhrg5/PYzRtg72euZJc0LY+tmHy/jJ4DXv/wvMbkzOSyQor/U9bXI4ip3K
         xrEGNATAVyUguTnk/IIfZU4t+uwPSuGFqSkcGlFtnlHJ2v15dzi9O7EwX9vsj79R3g8Y
         jdFVXeMLIAG2EZlJWqgDcHNkfvqzYWySmfITbOxCtxsGy0hOiTMmQE4s1/Q3cbtHGxZW
         mS5f1/ycl50OvBPoORoVsaB1Cq46PaqY5gOtuylnDwxjA48cnpdys3NYh9ylkGV7v/2Z
         n/4EHJ2574XeQWtXFQJghY/DvmKs1bjqAjn9GyP0x61KxvW9mAUn9k9OTQEshQdv8+Tv
         aA7g==
X-Gm-Message-State: AOJu0YxH3NQ6qOhkOa465TS4sl++TWB/CW6DG0WF0C8TOjLpbZ8mN0lK
	qAs3PTiTpeI8clysiod4oDidLlwOXSMys7dP6pInBuGWmB/UIR7oljZzTtqcxg==
X-Gm-Gg: AY/fxX5O+gU93CLm/b/CxdeapjkIzxsH9KM9Cdn7LwncyvBIXxcUwHk3fJRIMABjz1i
	i5uYdjRSvYLQYpH2p63LSAhCisoqpZ+geWuPNtwXeRwJ3ZUqgMkIUKK5TIap3hqmX53jFJpPRqk
	dETW6Dgl9LsL66S3jRl6eerA9Ob93/FZSS+lN5J3EsekgoS3il1x+dUXSMKOLT1gBf9KyQXL69w
	zQTAnUg2zw879DuTikHNvynGVIuja6h6IO6bIJjtwL5j2vhJTAtjyx3XDoXSxoT8UQCLOblkPEP
	DhBYWNtXbFN2yGLQvpCXnGPpdBm0S74yDgWpVRf9An7i57DwyfhE2zJ1K0pg8MWyCfyc2sMPaD+
	z/HdSjIiRxFLVqSd5YufTEiFmokW1YlBIkcSyDw6YiS9BGAoQqMUbtMMIMr65T8a+Qoip/dBU9B
	PEALVyFMrUV8U6zYF52cDKq9fHVs3uY73HUw==
X-Google-Smtp-Source: AGHT+IEiwjoLWjuEXK2wgB82e4UzwHpHiCieGXNLyKIMs6pTVNYdmsztzKIvAk0Ub1kOPWBbyYSNMg==
X-Received: by 2002:a17:902:da47:b0:29f:13d2:1c67 with SMTP id d9443c01a7336-29f26d0d376mr12813645ad.16.1765531744303;
        Fri, 12 Dec 2025 01:29:04 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b36c98sm48025805ad.8.2025.12.12.01.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 01:29:03 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-filesystems][whinlatter][PATCH] e2tools: Fix buildpaths in ptests
Date: Fri, 12 Dec 2025 14:58:57 +0530
Message-ID: <20251212092857.211174-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 09:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122599

From: Khem Raj <raj.khem@gmail.com>

Currently the path checks are escaping QA check for buildpath detection but config.status
still has paths which show up in reproduciblity failures, comparing build in path A and
build in path B, content of config.status don't end up same.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0856c5613234c61d809b9c983bc45c750144ebd8)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-utils/e2tools/e2tools_0.1.2.bb       | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
index 219735acd1..b7b925da0e 100644
--- a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
+++ b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
@@ -39,7 +39,21 @@ do_install_ptest() {
         ${D}${PTEST_PATH}/build/autom4te.cache \
         ${D}${PTEST_PATH}/*/*/.git ${D}${PTEST_PATH}/*/*/.github \
         ${D}${PTEST_PATH}/*/*/autom4te.cache
-    sed -i -e 's;${TMPDIR};;g' ${D}${PTEST_PATH}/build/config.status
+    sed -e 's@[^ ]*-ffile-prefix-map=[^ "]*@@g' \
+        -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
+        -e 's@[^ ]*-fmacro-prefix-map=[^ "]*@@g' \
+        -e 's@[^ ]*--sysroot=[^ "]*@@g' \
+        -e 's@[^ ]*--with-libtool-sysroot=[^ "]*@@g' \
+        -e 's@[^ ]*--with-install-prefix=[^ "]*@@g' \
+        -e '/EXT2FS_CFLAGS/d' \
+        -e '/LDFLAGS/d' \
+        -e '/PKG_CONFIG_PATH/d' \
+        -e '/PKG_CONFIG_LIBDIR/d' \
+        -e 's@${S}@${PTEST_PATH}@g' \
+        -e 's@${B}@${PTEST_PATH}/build@g' \
+        -e 's@${HOSTTOOLS_DIR}@@g' \
+        -e 's@${RECIPE_SYSROOT}@@g' \
+        -i ${D}${PTEST_PATH}/build/config.status
 }
 
 RDEPENDS:${PN}-ptest += "bash coreutils e2fsprogs e2tools gawk make perl"

