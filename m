Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D955AC624D5
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:05:56 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9048.1788343550103889938
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:05:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EEaris+f;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-395cf2535acso901547a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343549; x=1788948349; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ebLzq8rc+HLstywSNHPN8Nyy4yij8Bmj1sL1+pbwvKQ=;
        b=EEaris+flmZ+5smSMngmp8vdqq5tQchl2+1lXLaAbIsxJpkXF3f+oM9WlWVAeioskK
         VX50iNa0XeL/US2HxO6R1O2qjq0YkhflBF4HzMw7G0Qe17J245UxyYgWaVg2XFw863fK
         d12/F9+/7XjxV1/TzciUCKquOWDyJ4AsB0VlyYkWz2ceMM0AZqGy+x/FEMUtxMcNoUZM
         ESP5//oRGo+QBr/RvZTFq6UQV+DmuncMJF1mBhTVFEQLwG3kZv3xzj7P+ZKmEmjKZGyy
         dVdQK+AXGx6hXG2qxlyREkzzNQTwUzwF+FSN7bHR5pbrQYCTitVfKWUp9yEg9b0nGzQf
         PZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343549; x=1788948349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ebLzq8rc+HLstywSNHPN8Nyy4yij8Bmj1sL1+pbwvKQ=;
        b=mNDPovCLa4WTC73AEpdUdTLRWwx0bZQ9K5d5EE8eqqET7hLfPJH4ueI0zJ5VUVGlql
         fXtBy5mAo4CMCK6Wy2dgkBaR37LkzeWSoaVAEl+95+vM0tdcxAyddaNKAd0o/zw2t9Gu
         eE/dAHCHOfggmQ+Ud3o4mdfFw5IxQ2UOL1ZHWwSiodlx2DhH9w6dYihhbiP3KDfmpSmH
         P4V35sp18P0uMNpntZ26cqGgdjsV/WsDRNSEvKowVgdD603xjTRMWb+hChIDdqItJEy5
         FTY1yUCQTIFbRRKQnSThO9UdS54/TXxbK4wdhn/i0sLO3np0+Tp+1o4Ks5+mhateqLRb
         4LUg==
X-Gm-Message-State: AFuF++mYZ/N9upuNm0PklicV5k9Wqn5jl5FYGcignU/wEWBWVBj8C2Qg
	CBCeIBWbPzF0YVkrxx0kBqOFTbS00JHiTDNiaxCp9VL+EqyA9DPDO6MjZjSwhw==
X-Gm-Gg: AYBFou013QZ6W1Yvb/zTxYz3fg0KolbvQG++F52B3cuKF/JBWe4MDA7P6zOP+POEvKq
	N/Lmt7QVln/K14j4ZIVuZlsJOCsaZILQ44ZBdfwhSgatm/U9MEpVPcLedc9z4SW3CcPv6t1e3py
	rUFyAL7F3kqDyG4XBzX+JYNvwJylIjb7D1S11u7p6oC6yyrkFjn5dWX/yGj4kJ8ZsYcWaWgDW1i
	uT6IR43QtvL1E3bA8fW44AVeiHWFQH4vOLy4X5Ag+M2MGo+rCRmOWYzyFvkpMaJdtcMsdydmo+q
	LC95Je5/dcWld+cYKKu/36/PHEMl0Gbc8m9b5B4/LRS223u0jgZnnsvARC9SUwSKxwSy2dAZlO/
	zfn/cOX67jF4voSuACBiI+WK91clG3A7/va5RIQBOdsFDyzz2lumj3LCMiudBoI+C4Cz7QtEZqH
	gI8mjElBBp3BsCL6MNYGqdPTYtxtwdUi95fsul8N94LIGKr8niHamkflC7fJ6sfAIDis0d0B0E
X-Received: by 2002:a17:90b:5445:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-39af63f7f7amr1489730a91.8.1788343549383;
        Wed, 02 Sep 2026 03:05:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:05:49 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 12/28] editorconfig-core-c: ignore CVE-2024-53849
Date: Wed,  2 Sep 2026 22:04:54 +1200
Message-ID: <20260902100511.2105916-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:05:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129643

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

PR[1] mentioned in the NVD[2] is already part of the upstream version.

[1] https://github.com/editorconfig/editorconfig-core-c/pull/103
[2] https://nvd.nist.gov/vuln/detail/cve-2024-53849

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-devtools/editorconfig/editorconfig-core-c_0.12.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.9.bb b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.9.bb
index c6db2ef38c..319c1724c0 100644
--- a/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.9.bb
+++ b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.9.bb
@@ -15,3 +15,5 @@ DEPENDS = "pcre2"
 do_install:append() {
     sed -i -e 's|${STAGING_DIR_HOST}||g' ${D}${libdir}/cmake/EditorConfig/EditorConfigTargets.cmake
 }
+
+CVE_STATUS[CVE-2024-53849] = "fixed-version: fixed since v0.12.7"

