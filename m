Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E51CAC58E
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 09:00:55 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.28069.1757926854121262409
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Sep 2025 02:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U/87yIFD;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b0b6bf0097aso228103366b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Sep 2025 02:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757926852; x=1758531652; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Otpg2FMuxhvxzOcqSNjZdgUgveRNd+GC7DnuW40HO4w=;
        b=U/87yIFDKgj9KomSlFFi2WlOie+Y3t7xpt6y+uNFDuJjzOwykSPpA3631h/LNeI0FJ
         5Vt5QuejDumwoSYV/GNNbsohcXg3yLUusxXywUV6EP1IbRXfmCA2ArXF5eP/bcw7qiHp
         xFV8yJ4iVAAWAF11FDywl1R4rpxNeJH1ii9rITAVrT9B504DE1FOF0cCS7IcehlQgRDl
         I6M4tZhrAwRpUesUQc2hfJhG4YQuxssR2QNa3RFBnpnfATjK/a7nAn/zhk00LptLWKyZ
         SuvMkAICpv4mxCunxK3FUFElvdOELbiLVx4/+J2rCy1IEHwDZhhuxKgHhAydTPC9DeeG
         VAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757926852; x=1758531652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Otpg2FMuxhvxzOcqSNjZdgUgveRNd+GC7DnuW40HO4w=;
        b=nADQ6jwD7liaREk6iztAtfmfC/aDc8LuimdNSXHhOtlm/mr955qS95V6mvYpaoLKIT
         2JJVGIPjpc3cYyfwFliE6XpROJ7aE82GsHwkBTStnvBd1iXUrhZMw+hpqrGGg+Gin5yN
         A2XT8poj0FTqE7aw5Ag48VypPC51mB1Ndr6+CZiHHGBM5ZEcZUWriJQav5p52VcSwkf1
         QkLRil0djvoWFLA2c/YZ40ZK37ekNenraC8ax1Rc953WFYaERXfZnfK+v6Fr4lwf+vPb
         IwXUPYbyXCvJoflhGJnQwOgVBQyy9ly3GiwNfID/mtj1L0/CZY2ct60XFZEMBCg+Pb1d
         LN3Q==
X-Gm-Message-State: AOJu0Yx5JfqQaC5bpOnJL+JT5HevjW+GLeLRZ8kORGSd12yMhHP9q8EX
	tm5LRXuJfNTW80rcAA6jVbSQPYpT1Ol21j62iuZ6adtjBCSisRh0O1ZlkQ//Fw==
X-Gm-Gg: ASbGncuHdeSUR6Z7dC4x7A1RPqX0wJRviadpiRAysnlP05rmseLN6ENueKHi7UQksxU
	uFhiY6lX+abbiEY580ZWLdA2QM2sn2W5tbjxQdmkA8eCUsSkhDXNCDhYtOj1W81K+1aN9jdp7r5
	3PxU3bgPGMLPAEPVi6UXnQldxBa0isxPRRj1AWOT6lTXdY/z4OUv6Mnnyj76YgZ5iFnvsxi1nnT
	/aUD6sdCEkU3J+u2D+9uUXtjucCqHr/JgBXZ3+amjd4k4Q7RNtzyfn/f/+oe6RH3FR5817eKENJ
	a5mr7TnqCeYgwGZRq30d/dCJA6gfEDIAKvSRtXy79WA+72TePlKeeRJoPPBMIq6FMVxFeTPFyqV
	PBjDqmRSes7+2Stt58RfEbIJBVw==
X-Google-Smtp-Source: AGHT+IGgt9gzvrxNe+D2xzeRheyhxA/gWI433VsD45W4FtGET50JBjAX5Y3m1SA4GKkWwUVKc1xrVw==
X-Received: by 2002:a17:907:3d0b:b0:afe:b311:a274 with SMTP id a640c23a62f3a-b07c3833dc1mr1147852666b.46.1757926852112;
        Mon, 15 Sep 2025 02:00:52 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b333437bsm892917266b.95.2025.09.15.02.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 02:00:51 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH] nodejs: fix build with gcc-15 on host
Date: Mon, 15 Sep 2025 11:00:46 +0200
Message-ID: <20250915090046.15252-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Sep 2025 09:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119404

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../0001-src-fix-build-with-GCC-15.patch      | 33 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_20.18.2.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-src-fix-build-with-GCC-15.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-src-fix-build-with-GCC-15.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-src-fix-build-with-GCC-15.patch
new file mode 100644
index 0000000000..9d09f4f482
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-src-fix-build-with-GCC-15.patch
@@ -0,0 +1,33 @@
+From bade7a1866618b9e46358b839fe5fdf16b1db2be Mon Sep 17 00:00:00 2001
+From: tjuhaszrh <tjuhasz@redhat.com>
+Date: Sat, 25 Jan 2025 10:34:54 +0100
+Subject: [PATCH] src: fix build with GCC 15
+
+Added cstdint to worker_inspector as on more recent version of gcc
+the build was failing due to changes to libstdc++ and the removal
+of transitive includes.
+
+PR-URL: https://github.com/nodejs/node/pull/56740
+Fixes: https://github.com/nodejs/node/issues/56731
+Reviewed-By: Antoine du Hamel <duhamelantoine1995@gmail.com>
+Reviewed-By: Chengzhong Wu <legendecas@gmail.com>
+Reviewed-By: Richard Lau <rlau@redhat.com>
+Reviewed-By: James M Snell <jasnell@gmail.com>
+
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/bade7a1866618b9e46358b839fe5fdf16b1db2be]
+---
+ src/inspector/worker_inspector.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/inspector/worker_inspector.h b/src/inspector/worker_inspector.h
+index d3254d5aa0ebe4..24403bb1704c40 100644
+--- a/src/inspector/worker_inspector.h
++++ b/src/inspector/worker_inspector.h
+@@ -5,6 +5,7 @@
+ #error("This header can only be used when inspector is enabled")
+ #endif
+ 
++#include <cstdint>
+ #include <memory>
+ #include <string>
+ #include <unordered_map>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
index bef62f88eb..8af90e782a 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://libatomic.patch \
            file://182d9c05e78.patch \
            file://zlib-fix-pointer-alignment.patch \
+           file://0001-src-fix-build-with-GCC-15.patch \
            file://run-ptest \
            "
 SRC_URI:append:class-target = " \

