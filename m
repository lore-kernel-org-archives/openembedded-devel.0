Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AAAC61DA4
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 01:52:10 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.2767.1675129926634233224
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jan 2023 17:52:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aoQNMoGH;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id jh15so4537756plb.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 17:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=meeEXZgJQHrx2HSu3AEr7bOe2AGNNjaozD4XqyKSSQM=;
        b=aoQNMoGHvsA4RlCf7WanKlJI8GovpwQD92Y9dmaQ2bba1gGt0qmRA/L3XKpk+kl7bo
         Or0lxNH2Oma3PDb/OhoJTFtiRBDQhi8gaTrLT4jnvkgbpI+ms3FUB9ScuNteu+OpbrrP
         lLGYrFOmsl/Chdm9oSJW3FgUuVETc26blirZA3meahY2Bq0Wa8eCq+OexvtN2iuOuo6n
         e7EF7y0QZCFqjGvmuKp/d+ZeA9IoayGO7N5E7G101+k6E79yglfP+s8JJD/4XJATEtuH
         1Z26u6sb6eg2QRgf6KH8OqQcoxyxCeGw8+wIJnIsmhA5LdLU+bBOmSapKntGbCxA50tN
         MJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=meeEXZgJQHrx2HSu3AEr7bOe2AGNNjaozD4XqyKSSQM=;
        b=KWo3NGdwzNse8mQrBT13mD2t/3c8wbtOd5KXxvznhYxjBLHs+klaNIp2OBQRfmAVtu
         21nbubFRF29IrWdYra8Jf0NPAXO4zgX+P9dtGWaj/TBwp3wYiKXams3LwALm57rTgYZB
         m3msW9GpGimeDN5YI5bnc3BmjsDDgY1TeILjlxRphyeo5LHClyJn8JlRmHVreAB3zAfI
         oQtzxzfHwBo5agqAre8ChPYkM8Q9qhijWIfZv6kXK/yN+KH5TPqU3VJIK5vTeVTibGDX
         Xz5r7/LIN/mtxX2pxb7ePwEGTwDOmjrz6HiN7Ec8nXO2wp7nh+uQi10MahSFewQ0wziM
         18vw==
X-Gm-Message-State: AO0yUKUjR8/VCV0wqTly1HzylaOZSGeE+QQAWhrnCr0bhJBtJyjtmYtG
	SK7LVT6/L1ePAq+dmtOQGNCkgAKFV5wrYw==
X-Google-Smtp-Source: AK7set+ingWLqWvHbOiTqEsu60GSQwYRPo51S7N/NTAhunTri7P5idecFE4VhKoTo9ZA9qQdEGDqNA==
X-Received: by 2002:a17:90b:4d81:b0:22c:61c1:18dd with SMTP id oj1-20020a17090b4d8100b0022c61c118ddmr11934091pjb.10.1675129925671;
        Mon, 30 Jan 2023 17:52:05 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id mj8-20020a17090b368800b0021900ba8eeesm10096859pjb.2.2023.01.30.17.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 17:52:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/8] perfetto: Fix build with gcc13
Date: Mon, 30 Jan 2023 17:51:56 -0800
Message-Id: <20230131015200.3862532-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131015200.3862532-1-raj.khem@gmail.com>
References: <20230131015200.3862532-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 01:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100865

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ng-header-cstdint-for-uintXX_t-types.patch | 58 +++++++++++++++++++
 meta-oe/recipes-devtools/perfetto/perfetto.bb |  3 +-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/perfetto/files/0001-Add-missing-header-cstdint-for-uintXX_t-types.patch

diff --git a/meta-oe/recipes-devtools/perfetto/files/0001-Add-missing-header-cstdint-for-uintXX_t-types.patch b/meta-oe/recipes-devtools/perfetto/files/0001-Add-missing-header-cstdint-for-uintXX_t-types.patch
new file mode 100644
index 0000000000..d08721ae65
--- /dev/null
+++ b/meta-oe/recipes-devtools/perfetto/files/0001-Add-missing-header-cstdint-for-uintXX_t-types.patch
@@ -0,0 +1,58 @@
+From e63949205682bbd2a0e33e256119472d704a2549 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 29 Jan 2023 22:03:01 -0800
+Subject: [PATCH] Add missing header <cstdint> for uintXX_t types
+
+This is detected by gcc-13
+gcc 13 moved some includes around and as a result <cstdint> is no
+longer transitively included [1]. Explicitly include it for uintXX_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Upstream-Status: Submitted [https://android-review.googlesource.com/c/platform/external/perfetto/+/2399128]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/perfetto/ext/base/http/sha1.h    | 1 +
+ include/perfetto/ext/base/uuid.h         | 1 +
+ src/traced/probes/common/cpu_freq_info.h | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/include/perfetto/ext/base/http/sha1.h b/include/perfetto/ext/base/http/sha1.h
+index c583d69d4..7e3a48c83 100644
+--- a/include/perfetto/ext/base/http/sha1.h
++++ b/include/perfetto/ext/base/http/sha1.h
+@@ -20,6 +20,7 @@
+ #include <stddef.h>
+ 
+ #include <array>
++#include <cstdint>
+ #include <string>
+ 
+ namespace perfetto {
+diff --git a/include/perfetto/ext/base/uuid.h b/include/perfetto/ext/base/uuid.h
+index 1b4c53815..472042fab 100644
+--- a/include/perfetto/ext/base/uuid.h
++++ b/include/perfetto/ext/base/uuid.h
+@@ -18,6 +18,7 @@
+ #define INCLUDE_PERFETTO_EXT_BASE_UUID_H_
+ 
+ #include <array>
++#include <cstdint>
+ #include <string>
+ 
+ #include "perfetto/ext/base/optional.h"
+diff --git a/src/traced/probes/common/cpu_freq_info.h b/src/traced/probes/common/cpu_freq_info.h
+index 36f7f9c09..8232cbf64 100644
+--- a/src/traced/probes/common/cpu_freq_info.h
++++ b/src/traced/probes/common/cpu_freq_info.h
+@@ -17,6 +17,7 @@
+ #ifndef SRC_TRACED_PROBES_COMMON_CPU_FREQ_INFO_H_
+ #define SRC_TRACED_PROBES_COMMON_CPU_FREQ_INFO_H_
+ 
++#include <cstdint>
+ #include <map>
+ #include <string>
+ #include <vector>
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/recipes-devtools/perfetto/perfetto.bb
index 1605de489f..3cc732b700 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
@@ -17,7 +17,8 @@ SRC_URI:append = " \
            git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libunwind.git;protocol=https;destsuffix=git/buildtools/libunwind;branch=main;name=libunwind \
            git://android.googlesource.com/platform/external/zlib.git;branch=master;protocol=https;destsuffix=git/buildtools/zlib;name=zlib \
            https://storage.googleapis.com/perfetto/gn-linux64-1968-0725d782;subdir=git/buildtools/;name=gn \
-           file://0001-Remove-check_build_deps-build-steps.patch "
+           file://0001-Remove-check_build_deps-build-steps.patch \
+           file://0001-Add-missing-header-cstdint-for-uintXX_t-types.patch"
 
 SRCREV_protobuf = "6a59a2ad1f61d9696092f79b6d74368b4d7970a3"
 SRCREV_libcxx = "d9040c75cfea5928c804ab7c235fed06a63f743a"
-- 
2.39.1


