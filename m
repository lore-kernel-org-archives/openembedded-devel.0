Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BB6FCC05A
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 18:33:56 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1728.1772822031019537574
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Mar 2026 10:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kcltdiCN;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439ac15f35fso6139904f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 10:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772822029; x=1773426829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1DLqPUXEHq/zI8rYUe+khtzW/zDu+UkYSiAWZl/Tsk=;
        b=kcltdiCNFkX00o9E6FvO8Skh1xZZxq3F28oXrzRNVmNxdqUEYq9CwDHZuah0DS91pv
         0BJAwr9fmvOAg1Ep3Q1XXmkvpOBKcYt3Z9wdZ22voOimkxotFmtULTjZh4PvPYarS1ng
         qFT4kMX/gM3RP2FVgLUS4ZOrRHSVI1qWWFSX4dRSP8cWSThZC8RTcKX5JfGbrolDZSSy
         5R29Ugs9xE8Rrqz2ll1Ur4tHVrlvUGYrabH9w9rIv5JkZA9Nn5jghxGEBw2DkgB4I6cq
         Xaj1TDgFwdfsqHurRdbI1tukllio7ZO2ZWvsGylTLWjmi6G43GqipgyTXdc9jfIcgCWN
         OirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772822029; x=1773426829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z1DLqPUXEHq/zI8rYUe+khtzW/zDu+UkYSiAWZl/Tsk=;
        b=gHgtEkd/cvGDdFRhGyDUq52b4BZLEg0WbkvfL1PSnm6/aLCS3nVP5oL38I28JN8zVS
         YlLA3agg4hnxd4UygVLyIzfMpVkneO9FoZkARJA9uaO5IZ3jDj421OCSzYXCd378LbOW
         5csprt+D5FOVn2tbwhH8STOxEdtkHwM27Am5itxYB1IcdDZ+SXcsIb+n8E14/Z+v7aZw
         F6LlCXJGhzNQpxsBqch6ondF6tg2Kvm636rqooSZ8qjWWj5rX2ODLmXyWkliI8wL6DrJ
         0aaKfHiIk7OfeAOoPhvUPjAwJylmrhkVGKRo3pzaVh9KMWW1bZ/k/cV0HxKr5eeAl3rO
         csng==
X-Gm-Message-State: AOJu0YylKRUW8CEHi3+4D0DzExjLW1lFOmibfp4ByKWSJhuFdDMmeiZc
	UxJ9DiUeM7sIOOwHrhh/tQb9yBXfPDWVZB6494haHkkTYOKuZp/iHeEMC7QQVA==
X-Gm-Gg: ATEYQzx7IBivrpdrtZDO4eCmtHBM9uRO3m7AKqRo/+Wa27xr+gUA9j5t+bN+hSbWvB2
	9QhInivL4jfH/xegVCbouiL85OfZv/5VEwjeDUitlB4W+/VUFn7pwc7lt5NVsyNxbbC28YQRl07
	1FNoJCwgmpikCOHx9P82ftBC/dZlRFS/6Jepal/o4SHe3e92xXxThtUVVGpUR7rRhEhLUE4n1PL
	TdT0yHYMuDj07RqXeD2zpXu9xBDor2559vErj1wINfn0c1hrqv/4l+EzT9XdoNtyIyi45JnNnji
	eaxxTZoyK7ZBQssEDgyvoPdc2hY6IIYZhhfugKHYI6dwVQHw/NOX4tqvAWtctWSoMBAnoagM+24
	vtei35jH8rQ1XfPyx8X5O9iCsSUyQtuom9RS2GCpJopJHS5J6Xu4P3ioHfjbjvJTPkPXEF74QHs
	pe9n24zFVmf3A/i1Pd4tWK
X-Received: by 2002:a05:6000:2887:b0:439:b057:cb12 with SMTP id ffacd0b85a97d-439da332c4cmr5796222f8f.22.1772822029134;
        Fri, 06 Mar 2026 10:33:49 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae4b860sm5846929f8f.36.2026.03.06.10.33.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 10:33:48 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 2/6] libheif: patch CVE-2025-68431
Date: Fri,  6 Mar 2026 19:33:43 +0100
Message-ID: <20260306183347.1014705-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306183347.1014705-1-skandigraun@gmail.com>
References: <20260306183347.1014705-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 18:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124918

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-68431

Backport the patch referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libheif/libheif/CVE-2025-68431.patch      | 26 +++++++++++++++++++
 .../libheif/libheif_1.20.2.bb                 |  4 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2025-68431.patch

diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2025-68431.patch b/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2025-68431.patch
new file mode 100644
index 0000000000..829d94c113
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2025-68431.patch
@@ -0,0 +1,26 @@
+From 6747399f04736d9bc59e36befae2946c448553a5 Mon Sep 17 00:00:00 2001
+From: Dirk Farin <dirk.farin@gmail.com>
+Date: Tue, 11 Nov 2025 19:47:50 +0100
+Subject: [PATCH] fix wrong copy width in overlay images (thanks to Aldo
+ Ristori for reporting this)
+
+CVE: CVE-2025-68431
+Upstream-Status: Backport [https://github.com/strukturag/libheif/commit/b8c12a7b70f46c9516711a988483bed377b78d46]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libheif/pixelimage.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libheif/pixelimage.cc b/libheif/pixelimage.cc
+index b46aaf06..d147f66e 100644
+--- a/libheif/pixelimage.cc
++++ b/libheif/pixelimage.cc
+@@ -1348,7 +1348,7 @@ Error HeifPixelImage::overlay(std::shared_ptr<HeifPixelImage>& overlay, int32_t
+       if (!has_alpha) {
+         memcpy(out_p + out_x0 + (out_y0 + y - in_y0) * out_stride,
+                in_p + in_x0 + y * in_stride,
+-               in_w - in_x0);
++               in_w);
+       }
+       else {
+         for (uint32_t x = in_x0; x < in_w; x++) {
diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.20.2.bb b/meta-multimedia/recipes-multimedia/libheif/libheif_1.20.2.bb
index b268b37d8e..b9083ddd23 100644
--- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.20.2.bb
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.20.2.bb
@@ -6,7 +6,9 @@ LICENSE_FLAGS = "commercial"
 
 COMPATIBLE_MACHINE:powerpc64le = "null"
 
-SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=v1.20.x-releases"
+SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=v1.20.x-releases \
+           file://CVE-2025-68431.patch \
+           "
 
 SRCREV = "35dad50a9145332a7bfdf1ff6aef6801fb613d68"
 

