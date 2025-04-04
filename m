Return-Path: <sofiane.hamam@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706CCC36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 15:35:04 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.6.1743780900589274947
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 08:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jf82wymN;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: sofiane.hamam@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-391342fc1f6so1897984f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 08:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1743780899; x=1744385699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SlPGWlq6VwYegs6iVDvnS33NbPIRAjMqOe0j0MqWCaU=;
        b=jf82wymNFaA8E67pLEyBJitkGzQFKPNPG5q+Ikajec7Y2oqkM37UPdrTlChrym+Y1n
         ifbS2QPhSmxh4OnOa9/G/B1TT5IYPPJIFqrq+8R/5h9+iRdhVWKTKAb1Z7fZ4WIc8rXB
         SpiOCpQYuawq2vNBc/ieCU0cQImTOdNexco4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743780899; x=1744385699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SlPGWlq6VwYegs6iVDvnS33NbPIRAjMqOe0j0MqWCaU=;
        b=mcXJFXxEK8cHEfKadHPZCsm8y1gOR40umtbAFiOKuX2VJpFT8Hm0PaJiYkwfKrEG1j
         hTQcfqgeivR/MixMsBTNu3siwG6aEs3taSseTmY63kmtRPNIlSs4T1tLOBjhPcLwF+8N
         zk5r+5ZpJC4mgWMqxVHU2J3R6YYCAQWy2C9sgFdQl4Nyu1Q30YW0u+NEN7ZWmt0RxK4s
         tM7YqOd4Hy4UjJREn+bgOIcVc/hM0hCzbzD/0xRHIvxfGXltxqyUHU0pA06wvkBhflm1
         MBWuiCjU+KZKT4n6cDE1GlPoSgWLoCaoQvIBaD9JfEMIDaShP7XDNG1r74Z/d1jKd4L8
         AjiA==
X-Gm-Message-State: AOJu0Yz0QYsyAOge4g8LQ54os2ZqMiyrnlG0L35z3bWujV3ffKrzUnvQ
	LFiJN1+heiK7PS7UDD8iMwVQ5Fx/29azBjFRxRcEgPlRF2ifo5G8bioLnLhzotgAO7I8TFt2U8M
	N
X-Gm-Gg: ASbGnctFZNEQUfVUM9ToHmSqC6Wu/z7I3RfZBQJaPVbVvvgpyEpp3rU0oSA3deoGpP1
	pNzlY38LJcByKUUk0FI55SIhK9cMSJFR5/xTl0v5rfhzXzv/clUDcolVoHHsJyP+n4SfSk5o3OU
	/47BFoLowP/depatP36tpwpHiXHlp4hrVeowPpaqK8hLZ0ap3XUZEyMDEuWiHtW6HWQ4sCdVyg+
	PnuIkDv57UAJenk8zxdWkSKcnkRrfmLNTIPBEF9+kdae9vDEYTDqR+BR1mNOfSj3TWhtUdnMCty
	fQZ7d0eR7fAFkesTkKgxeYHTVg9jms0vgZ6VurTU8JmdZE2/X94F08A0PWgZtkTopUKSlK1aUZS
	6vMQVRoPMPQ==
X-Google-Smtp-Source: AGHT+IGKDgWzzL4luHQi7Wkpss5Ez99I8R/C3l1hNpiNFPnb3nckgdYTD81xLgvQTGzlWeoooWKfow==
X-Received: by 2002:a05:6000:250a:b0:391:12a5:3cb3 with SMTP id ffacd0b85a97d-39d0873fd19mr3216940f8f.3.1743780898690;
        Fri, 04 Apr 2025 08:34:58 -0700 (PDT)
Received: from FRSMI25-BPYTOP.. (205.226.7.93.rev.sfr.net. [93.7.226.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b6a1esm4664785f8f.45.2025.04.04.08.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 08:34:58 -0700 (PDT)
From: Sofiane HAMAM <sofiane.hamam@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Sofiane HAMAM <sofiane.hamam@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] openocd : Fix non reproducible build
Date: Fri,  4 Apr 2025 17:34:48 +0200
Message-ID: <20250404153448.2765425-1-sofiane.hamam@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 15:35:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116589

This package defines PKGBLDDATE as build timestamp which makes
it non reproducible. Use SOURCE_DATE_EPOCH if it is found, otherwise
use build timestamp. Following best practices, see :
https://reproducible-builds.org/docs/source-date-epoch/

Co-developed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
---
 ...SOURCE_DATE_EPOCH-environment-variab.patch | 38 +++++++++++++++++++
 .../recipes-devtools/openocd/openocd_git.bb   |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch

diff --git a/meta-oe/recipes-devtools/openocd/openocd/0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch b/meta-oe/recipes-devtools/openocd/openocd/0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch
new file mode 100644
index 000000000..0f90cac91
--- /dev/null
+++ b/meta-oe/recipes-devtools/openocd/openocd/0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch
@@ -0,0 +1,38 @@
+From 65969a2b73ce93db4c80f1706677351b0e57fa72 Mon Sep 17 00:00:00 2001
+From: Sofiane HAMAM <sofiane.hamam@smile.fr>
+Date: Fri, 28 Mar 2025 12:31:17 +0100
+Subject: [PATCH] Makefile.am: Use SOURCE_DATE_EPOCH environment variable
+
+This package defines PKGBLDDATE as build timestamp which makes
+it non reproducible. Use SOURCE_DATE_EPOCH if it is found, otherwise
+use build timestamp. Following best practices, see :
+https://reproducible-builds.org/docs/source-date-epoch/
+
+The patch is BSD compatible too.
+
+Change-Id: I26c1a00f2e8059ae31fe72a794b5962af5a84f44
+Co-developed-by: default avatarYoann Congal <yoann.congal@smile.fr>
+Signed-off-by: default avatarYoann Congal <yoann.congal@smile.fr>
+Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
+
+Upstream-Status: Submitted [https://review.openocd.org/c/openocd/+/8619]
+---
+ src/Makefile.am | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 6d79cd631..9ca697407 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -30,7 +30,10 @@ if RELEASE
+ else
+ %C%_libopenocd_la_CPPFLAGS += -DRELSTR=\"`$(top_srcdir)/guess-rev.sh $(top_srcdir)`\"
+ %C%_libopenocd_la_CPPFLAGS += -DGITVERSION=\"`cd $(top_srcdir) && git describe`\"
+-%C%_libopenocd_la_CPPFLAGS += -DPKGBLDDATE=\"`date +%F-%R`\"
++%C%_libopenocd_la_CPPFLAGS += -DPKGBLDDATE=\"`DATE_FMT=+%F-%R; \
++	SOURCE_DATE_EPOCH="$${SOURCE_DATE_EPOCH:-$$(date +%s)}"; \
++	date -u -d "@$$SOURCE_DATE_EPOCH" "$$DATE_FMT" 2>/dev/null || \
++	date -u -r "$$SOURCE_DATE_EPOCH" "$$DATE_FMT" 2>/dev/null || date -u "$$DATE_FMT"`\"
+ endif
+ 
+ # add default CPPFLAGS
diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 559fe29ff..b1ce2ec16 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -9,6 +9,7 @@ SRC_URI = " \
     git://repo.or.cz/r/git2cl.git;protocol=http;destsuffix=tools/git2cl;name=git2cl;branch=master \
     git://github.com/msteveb/jimtcl.git;protocol=https;destsuffix=git/jimtcl;name=jimtcl;branch=master \
     git://repo.or.cz/r/libjaylink.git;protocol=http;destsuffix=git/src/jtag/drivers/libjaylink;name=libjaylink;branch=master \
+    file://0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch \
 "
 
 SRCREV_FORMAT = "openocd"

