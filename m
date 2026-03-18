Return-Path: <nitin.wankhade333@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FC110854D3
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 09:09:18 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9868.1773824953210824739
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 02:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HrJqcrG5;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b0500a8152so2265425ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 02:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773824952; x=1774429752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+OVUHgkOVBEQDfvJmpQKoo9qIbMv7M0D5WNug0uZ8wk=;
        b=HrJqcrG5nbGREnSW7/NSfXEtSzK26UKnVEjXZ0c2E/2OT90y8+25XNR4OljMs5xgz/
         JRyxD89O7fvBByR4vG9U5ha9kvQx0yRqUtNUJZa+dmrYbEAu0cshQGBCmrgUKVD2CVnP
         8fnzbe+tmjm+GC7jvBblI4VyvOhckoliNPAX2rAxp2AiD2+TL1MHIFUwdZDwwAGnd1mA
         71hD4WK4R2bz935+q56XzCLGESH1MrZ9uqJCmjdWCnUSdzFCEUw9BPDq2SZB7eWN0XO6
         OzgwxQ3grfE9+dYwBDHsfChLqz2+R39ehDxVWzJEKplwLUDLUnaMLojN34jrhTIXXxUH
         6Fjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773824952; x=1774429752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OVUHgkOVBEQDfvJmpQKoo9qIbMv7M0D5WNug0uZ8wk=;
        b=IHUdFAns4cq9deh2vN1bQOzfUPLJE2YOC5AigRFKMI0RzdSdfOi6bdEWjrvso4jUgJ
         /N/EOLNfsafOiL93UmQgB2UjxJNIxD95VSgna2wRf/7nZgbTcOiEysl8SYTuiuk9ZbIb
         sH4XX6bj66RaeX51G7PmArimBzHakw1+4f1XoctgNy09EJ23BAHYCSyEu3b3yQY7pCF8
         AzRrXrG8YJNMV0sUVkNq0hwnQ2qIbgrhYaS8e2I4Cv4X2I+xZWzPXYDRCGDqGh6fZ+ze
         iCfzY1ha2Lz2lEDqknr0mPBUgHquyK0tex8ew6B986ZzfIPkCyOuMGuuhGokSoto+QVn
         k4BQ==
X-Gm-Message-State: AOJu0YzfUQIKfx7UnKMOgXZ00O/NES5H0RcPHw43ZAIPNLTzdAb8JNMS
	LCeq2DmJ4bwUkw0Y/LVv3Nw55O0Hfs4WFUxu4N4eyaTr9/1fAtkUJak+DMxq3Q==
X-Gm-Gg: ATEYQzybuRv3cwP72NVJtFbjTjOa9Cez60SkTWKmqNckcF92+MohkF2Oc2A/XPK/2uM
	tg2tpTEdI9v+hNWEJ4zxjQ8YisLyxPxaRmNb74FpYuFYIas5be3zk/yOsIw/FcibxZT/AICR6WK
	V5HcrrEP1sIW42BZE/1M2ovlvlnMvy687aigd1ghJHTpgPRrQc1SS/sQxPrMKKyMgU3V1fO3dxN
	dIW7KvJEU1hk13PambtgeMd932oVK9T2l0pLe2n/xiJeNDnVEPpJNbQv7E6UuoocRa2wNemMG75
	pF5Kh0S0f13753+d3173lzrezPyBruYTxjImiPNhRDkX6iUfaD0mxAble3+HoNnhj+Sqy1s0/UD
	VjhacLdOc2kUG4ZgbsS6qa58gy5gEXI9ThCB80w1qWwCiauVnadKhrV08qtI8sTc1xxMAOzGHgu
	jilmIoGujpq+B9WgooHls7DQmNUjwdruDc13oiP17ORaA=
X-Received: by 2002:a05:6a00:1a16:b0:824:9b3b:787e with SMTP id d2e1a72fcca58-82a6ac9e787mr1209924b3a.1.1773824951690;
        Wed, 18 Mar 2026 02:09:11 -0700 (PDT)
Received: from LL-3324L.kpit.com ([122.167.115.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6befc046sm2590361b3a.59.2026.03.18.02.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:09:11 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
X-Google-Original-From: Nitin Wankhade <nitin.wankhade@partner.bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: nitin.wankhade@kpit.com,
	Nitin Wankhade <nitin.wankhade333@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 1/6] imagemagick: Fix CVE-2025-43965
Date: Wed, 18 Mar 2026 14:43:33 +0530
Message-Id: <20260318091338.483937-1-nitin.wankhade@partner.bmw.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 09:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125354

Reference: https://github.com/ImageMagick/ImageMagick/commit/bac413a26073923d3ffb258adaab07fb3fe8fdc9

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 .../imagemagick/files/CVE-2025-43965.patch    | 21 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2025-43965.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2025-43965.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2025-43965.patch
new file mode 100644
index 0000000000..385536957f
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2025-43965.patch
@@ -0,0 +1,21 @@
+From bac413a26073923d3ffb258adaab07fb3fe8fdc9 Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Sat, 8 Feb 2025 23:31:39 +0100
+
+Subject: [PATCH] imagemagick: Fix CVE-2025-43965
+CVE: CVE-2025-43965
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/bac413a26073923d3ffb258adaab07fb3fe8fdc9]
+Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
+===
+diff --git a/coders/miff.c b/coders/miff.c
+index 21b91d0..91bd36a 100644
+--- a/coders/miff.c
++++ b/coders/miff.c
+@@ -1307,6 +1307,7 @@ static Image *ReadMIFFImage(const ImageInfo *image_info,
+     if (quantum_format != UndefinedQuantumFormat)
+       {
+         status=SetQuantumFormat(image,quantum_info,quantum_format);
++        image->depth=quantum_info->depth;
+         if (status == MagickFalse)
+           ThrowMIFFException(ResourceLimitError,"MemoryAllocationFailed");
+       }
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index 81f4596456..c4e48b4bbe 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -48,6 +48,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
     file://CVE-2022-1115.patch \
     file://CVE-2025-65955.patch \
     file://CVE-2025-62171.patch \
+    file://CVE-2025-43965.patch \
 "
 
 SRCREV = "35b4991eb0939a327f3489988c366e21068b0178"
-- 
2.34.1


