Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94EA0C636D6
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 01:52:10 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.2809.1675129929141340800
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jan 2023 17:52:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aacn6goA;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id l4-20020a17090a850400b0023013402671so806349pjn.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 17:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRRb4/DN1yq6wYk8+jFxDsuzSIbUCfME9lNu/W9aQfA=;
        b=aacn6goAwEs1S1BEBNSUNlTP1JXZbMZPEpyyaB9JRZyJYx9ldM3zPAfQRjTp17PXBo
         unraVoNzWkAZPkMDVq9TgfREgsWiXqvOhfthyOJVA/YstgcCyN4b+6kM5QSiWvSHe1CZ
         MMiX+C9kKeMW2kIGa4yNUgdTSFeF2iPhzplKsQQ1/XT/6iC4xqW6I/hBuzubOwNcQXcf
         k/+B8AHYCkGet2S2vGbaxuNKHbcGh4lm6XGC8APqucxYSFTKF1QwDK048lc14uq7JbR6
         EmVgn5EWLyxVwfx765LamNLrm6MDR4ONi4hvryWhffo2BtIRc9bt1G0JqADM9d4AicFd
         fPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SRRb4/DN1yq6wYk8+jFxDsuzSIbUCfME9lNu/W9aQfA=;
        b=mHC/TH68p4A/SyS4ec0mlbegK1C15Ntd7wNQcig6VTE9sz7YJ7sh8tkzoKDuaGl87f
         ugYHnf7NjyagH+g5JdpcV1C9jQgNmPQcetH/PnJzrnedtlE6d0BwiSH07mk6gQqpHx+G
         770kT6bBxn3m+KmRY1oULgnN3fJvboab8zsCjsf9WyDbpkA/RoM6cj5/uNxuFYB+E6wF
         NM8NLxLKyP+Gp3Fln2NvPFO3kifhP1n5lpVClfLMFcJ325mmbZru9tZbR6iKdbpUHK9A
         aYeGxbmSsezW8WKDMFg8f6W7gxyRsHSUNSsX2VH0vrRpOOpoZUgz3vTAHhqQX7V4fYBM
         1gaA==
X-Gm-Message-State: AO0yUKVcCXoRL9AMWEe0/UTJuPHlxqmS4iEh0rTnuGIX+8Pr4R8c6JLp
	3KfOyp1fsgFpjjXHLfkIV3fAyk00m16Z9A==
X-Google-Smtp-Source: AK7set/fFZLSZuX0J+47SuxOrwsoZqPDOsEMRAjankynPfg0ni2rwjXWhv5sRsWsqE0YhKH4XUv6kA==
X-Received: by 2002:a05:6a21:6da2:b0:bc:b8d:9ee3 with SMTP id wl34-20020a056a216da200b000bc0b8d9ee3mr23102086pzb.46.1675129928312;
        Mon, 30 Jan 2023 17:52:08 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id mj8-20020a17090b368800b0021900ba8eeesm10096859pjb.2.2023.01.30.17.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 17:52:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 7/8] tesseract: Fix build with gcc13
Date: Mon, 30 Jan 2023 17:51:59 -0800
Message-Id: <20230131015200.3862532-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131015200.3862532-1-raj.khem@gmail.com>
References: <20230131015200.3862532-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 01:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100868

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ild-with-gcc-13-by-including-cstdint.patch | 32 +++++++++++++++++++
 .../tesseract/tesseract_5.3.0.bb              |  2 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/0001-Fix-build-with-gcc-13-by-including-cstdint.patch

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract/0001-Fix-build-with-gcc-13-by-including-cstdint.patch b/meta-oe/recipes-graphics/tesseract/tesseract/0001-Fix-build-with-gcc-13-by-including-cstdint.patch
new file mode 100644
index 0000000000..2978080c92
--- /dev/null
+++ b/meta-oe/recipes-graphics/tesseract/tesseract/0001-Fix-build-with-gcc-13-by-including-cstdint.patch
@@ -0,0 +1,32 @@
+From 2025b53de6b3d97285d7c5f80497493007c586c3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 30 Jan 2023 11:27:07 -0800
+Subject: [PATCH] Fix build with gcc 13 by including <cstdint>
+
+gcc 13 moved some includes around and as a result <cstdint> is
+no longer transitively included [1]. Explicitly include it for
+int32_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Upstream-Status: Submitted [https://github.com/tesseract-ocr/tesseract/pull/4009]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/ccutil/params.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ccutil/params.h b/src/ccutil/params.h
+index f514d870..0f3f8743 100644
+--- a/src/ccutil/params.h
++++ b/src/ccutil/params.h
+@@ -21,6 +21,7 @@
+ 
+ #include <tesseract/export.h> // for TESS_API
+ 
++#include <cstdint>
+ #include <cstdio>
+ #include <cstring>
+ #include <string>
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.3.0.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.3.0.bb
index f791ad546b..057a7cd859 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.3.0.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.3.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCREV = "080da83cc51c4ef8b324a7e03146fe0bd7e0944b"
 SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https \
-          "
+           file://0001-Fix-build-with-gcc-13-by-including-cstdint.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.1


