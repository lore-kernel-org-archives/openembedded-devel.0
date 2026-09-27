Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F409C9832F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:51:24 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35364.1790506279473505252
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:51:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Yopl/MHV;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso728525a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506279; x=1791111079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j4CxouKh4bq6fol6xsBeOT/3n2b+NZD8TgeSfSXTxAA=;
        b=Yopl/MHVqkGIlf6w6SfTVuWYpgQUxbY61nUOelrlO+YMykKZgWHm31wmuUMaUZ/96m
         cCW0HxLZ2nrloSC7kYN5chaU7aT7dPWdxb8JtumUzxqq1qO4uFzDhwVLUiB3nr5U5luT
         iwkONcn8u4e+gFaE5vDvh8W7UbvHOA4CGtqx7KWnqjcM7Zfe2FsSPM3t2/NqBlomGwPv
         gAYXxYSNtliaB4TI0HO/TebcG4s5iUkmndB/n43ERs5FhRSXNNsb0ppnIIEBy0ZVaXwF
         nF3roOyNZsifkEpMJnOL1VcIKw7kYjLdkLX+Weqerkg9TYZA6vAfVGlei86ZY4Bsm0+N
         kIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506279; x=1791111079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j4CxouKh4bq6fol6xsBeOT/3n2b+NZD8TgeSfSXTxAA=;
        b=LmBgY1Ew3zUZlUUdaGcX/KNI8M/B8UW8exopEn5Whk7emg/XTposts8BbvSScyyc5j
         bPWr6ag7yuK3fn0JUUKqpTjIc7tG7dgcFwywa6vVaYpaIh+6hWWphgMc/RVfNhxxrmhk
         9Omx6Ja9tAt75zz9DSkoF3P/jxWSOtjY2zifPCzQep9YLB5SYr6vM63ZMICDeROFj4v2
         N7XfzReBB4tSl6uWdnL8xsAJilXRFTcXozPRG9lCVL0q5lQdosEKhEEVYcirKZRGt7Il
         ALtQ5FerlMG8BEIim1HFsXLSNG6jwQ7FulPqoTDb4a5YZWRzPQXZo0IHN6uPCBVBga+2
         zuow==
X-Gm-Message-State: AFuF++ls602GD6cMfkvbSszEUFdpEv3ssGqls8Acd6U6GlYkqeJGAZLA
	crftXjo/qJnR2n/6U2FRAm+FUQoCbI/dL4TPzf7TPHDXq+p6lgdPr8i40EoSHg==
X-Gm-Gg: AYBFou2iud0X5RY4pixo0Yme/fgCK6X3Up9WI56CNouVMt3YEBqActnUvBZzLOrgyYg
	CMBU/WPgjFt+7AA13IfzdIZbCzru/KIK4J6YGmFOgJi6hyjjTvrhczdVF3bnoKHm2i1hzvCLOLv
	br7toJmUaJMODABKaEhjUJUlHmF6wBY9Y+RmodtHnIm2pdZtIgvu4DvHRL+cmbXsV+1aOCvnhzG
	oIBEu8oZTBUVUAas/SI8H7v6rFHKVdcnO1ZoSbcntAgejdvhtNBVsQP4/SkfxqCnA/H1PLlMZXk
	6QVsZ7nk6zyIXWL6zALK8SfH8iaJ6n8wGbF5g8MCdp0FDjkpB/SM/1Q7FsveJmA1zbCmiigKxlg
	KxbKd8wEoPyKI7qPCwbD2T257LY3xZnfwgqEWpeoqruS8ALRd5JOy3iNQ9XFwCE+IheRSLYNcpU
	YWlNQ4ssIoNeZy2lUkhUw380x2xWKBrNl/XmbAWBWI/r1WRSKcQ1fxOSqm3OQG6Rj5YW2Extli2
	x309NFhP7dkL045gIUNad/QVdMZTdP8Zw==
X-Received: by 2002:a05:6a21:4ea6:b0:3dd:85aa:452a with SMTP id adf61e73a8af0-3de0e8d32b0mr10130911637.37.1790506278803;
        Sun, 27 Sep 2026 03:51:18 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:51:16 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 25/35] flatcc: upgrade 0.6.3 -> 0.6.4
Date: Sun, 27 Sep 2026 23:49:52 +1300
Message-ID: <20260927105002.1832451-25-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:51:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130359

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/dvidelabs/flatcc/releases/tag/v0.6.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../flatcc/{flatcc_0.6.3.bb => flatcc_0.6.4.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/flatcc/{flatcc_0.6.3.bb => flatcc_0.6.4.bb} (93%)

diff --git a/meta-oe/recipes-devtools/flatcc/flatcc_0.6.3.bb b/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb
similarity index 93%
rename from meta-oe/recipes-devtools/flatcc/flatcc_0.6.3.bb
rename to meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb
index d330be7fed..059f888eed 100644
--- a/meta-oe/recipes-devtools/flatcc/flatcc_0.6.3.bb
+++ b/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb
@@ -7,7 +7,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b3d8fb7158bf7e2600ba3191428dc4ef"
 
 SRC_URI = "git://github.com/dvidelabs/flatcc.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "503799885b5517ea9d316c17e35471178c09e35a"
+SRCREV = "fec0275c0d0c5b6f495ab48d51fcde521d72b5fc"
 
 inherit cmake
 

