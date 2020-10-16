Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.7794.1602823245849822459
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2020 21:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dyENwDXf;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id l18so690738pgg.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2020 21:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l7jWJ2IZxFythxPcdgQZFbdggW7qA0/wDclrouCCNko=;
        b=dyENwDXfoA+LzoMuAshiCVJhrqDFrGzfkqiIOG5onVmSMGK5jrqoF5MggLHdXpb/Zt
         ufbgGZTLwvDRO7D0yrU4YlY7s/vRqyDCqIPCX7snEpEmAFVujvIqEsGJvA5YEHdcJzov
         Z/Gqduu1MCcx9f1ssNoj3CbNJ62OARanCPtk+v2bUy7RlNgcAqUxIaNT6yuRtiz7j5O2
         MCrm2TzQxoTAjMqmqB2s8G1awpsf3jenyvBWu3RG9TMDtYvKt2OZ6OwTgknBXyT8Pq93
         FVlvZ8aa+Pzbb1bKJXN3OzlqTJhpi6dYPCyIwvCrI6gHuH4KDUl7p2RKmc1E5zLaqafU
         HYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l7jWJ2IZxFythxPcdgQZFbdggW7qA0/wDclrouCCNko=;
        b=lPEidDZJBLcXvLARAkTXgUJRlzqy60ZDlEegUU9UNi3N1PCxrviFah4t85rvhp2RMt
         QAaRYvc/hPAkefKqHZEwSUfjEY/P3meJarEU/rTIhPNYlGMFBC6bgxiZe8CXUtz+T9WE
         EveMbO0BqbzdHHSDE51rAiJx82e5qPEtDAHgO67XJT5Ofu6OmdKQGvUJ3t073GenjzT1
         dHPH2i5iY0EKfDjp6IUWOhHv3d7hTOBWRTOeVkp1un0LTXYrngiSFzudzTlrK6IYllUO
         Qbxm8w1bzhrl+aZjwHcYAeybxhLor6gBzJ3kxE82peDFjYsxAC0/OoE0e0oLjN+iMMpO
         CjZw==
X-Gm-Message-State: AOAM531E2sgBEexgZgEUx0/9kJq8w3Xig+96U3XFBxUB3cfLt3TYHDsx
	OyJBKDPcpTGCvoj8hfOZRV1FJYcrRT69ww==
X-Google-Smtp-Source: ABdhPJxfcg3j5oPLMMBYuSG5ogq6EMkP9Yutk+IbbC557TOKAXRuC2PVT5/kZahV0VL/RtdUYQHR7A==
X-Received: by 2002:a62:1851:0:b029:154:8ed7:bf5d with SMTP id 78-20020a6218510000b02901548ed7bf5dmr1916487pfy.66.1602823244930;
        Thu, 15 Oct 2020 21:40:44 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4467])
        by smtp.gmail.com with ESMTPSA id e5sm1025997pfl.216.2020.10.15.21.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 21:40:44 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] recipes: Use new license names in LIC_FILES_CHKSUM
Date: Thu, 15 Oct 2020 21:40:39 -0700
Message-Id: <20201016044039.832318-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201016044039.832318-1-raj.khem@gmail.com>
References: <20201016044039.832318-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb   | 2 +-
 meta-oe/recipes-kernel/spidev-test/spidev-test.bb               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index fb6125e2a5..a7b9396c2e 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -3,7 +3,7 @@ SECTION = "console/utils"
 LICENSE = "Apache-2.0 & GPL-2.0 & BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = " \
     file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10 \
-    file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 \
+    file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6 \
     file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=cb641bc04cda31daea161b1bc15da69f \
     file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9 \
 "
diff --git a/meta-oe/recipes-kernel/spidev-test/spidev-test.bb b/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
index 6626302919..974cb1e93c 100644
--- a/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
+++ b/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Test SPI devices"
 DESCRIPTION = "SPI testing utility using the spidev driver"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 PROVIDES = "virtual/spidev-test"
 
 inherit bash-completion kernelsrc kernel-arch
-- 
2.28.0

