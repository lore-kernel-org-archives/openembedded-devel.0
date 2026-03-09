Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D40C3F41810
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 16:33:34 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18999.1773074011872876399
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 09:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h4iIBvV4;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4853aec185aso11277505e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 09:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773074010; x=1773678810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=te3NzfaHuc9wevL9VhzFkUaclYzFtTNtg0HjSahyIj8=;
        b=h4iIBvV4ejhcuUSwShydmUwf7XoKdsnduRkGz4l+lB9iJpsZ0PKYAs4Cs+K2hy6uVQ
         tD6KU9rdrSL7E1r7YUw6jy4lM1NfrhaFzXtVz+7R1Dl4MkPP/92Ha4AZ1EmGq/lHy7Zh
         7JKRqB43TOxpj++TLoO9n4It336BA7sQ1IIdpJiR8CBmFqTxiY+T12Wc9TS8prtiTDpt
         dhQ26P4ePFlRbIgIjR9Qci0m70dymmDPPiJAuFCGUllbnWPL9Oex7zos+y0Vh50DbciJ
         4brLc2vWfxHaevW0ti8h9qEGtUiN6cHasLH3trZ52R7Q1A44jEocdpuELcAfWtV5MBft
         L09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773074010; x=1773678810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=te3NzfaHuc9wevL9VhzFkUaclYzFtTNtg0HjSahyIj8=;
        b=HL13V/8vKWHmGWqV8OPQV5jIJGdmxd7Kh/3Jy1Xws/riSrFdgVbSTlvEqxxwKY95d9
         WQS/hPX8N6eoLuQ00y1D/UBO+z5mn173+ohrsrz3lfp8mvdM2SkTBfVNfiXJhTHbkY4r
         To6IaL/HimM8Fr1BJlSAHt4FukLxMdAb/M3F+ousM90lbabGS2zvnmfLPklhLxmuMDYy
         whCHq1y/Ahe6sauE64kciRqkt+9jMGbvJVOQFUAV2Mz2o3s31RL2ixh++DAi3jAzcPvt
         0AqojqAVvP/ESquhDP/YTH4JnEfKIegG0tctF56Xn7s857+gkpFcN1sgDF2oWoTOwWT5
         1PqA==
X-Gm-Message-State: AOJu0YwJkKJel1KEIo7Xm0IXpnUYKB3zsBHqzNHbQyeCo5Hnm1Jzgjsk
	6tJJ+c2R4ea8SHB+JAdyocDRBix4Tm+IVxArkaARyQC2UyzGre9jBoxtwwdMoA==
X-Gm-Gg: ATEYQzxGxbb5nw51EmB4RRpjEGfpPf8rcejDB91FbMnPPOCDNBLwG9ZeJWlE2GBFrNJ
	OEUogrjgaVuNZdter7nEYUTVNK+TuP2EkTUmlELGOzDZKz+hE96svHTqDsBzSW0NQrIP9T4n+FG
	gYRjbICMeM8gp1cGihWOZrpbmHo7fe4ytdGVbp1/o79Wvx5dieQmgf0Iz+90bONj7KSnx8Ycfis
	E+lcAqcndKO1eIzqpxf3CSgKPVd9rcBzaVqyQL3JBEHn3s8nD5F9qFmRR+SQ/WOZXZml64Y4J93
	Ku9h4pAM4npoGyCoxEbmH1PIZD+R5LDjWtj55wxOGrS5cHCha+NRklf11418b1BYFWSMhHJJM0s
	BIlnILLqWLtk8oRN036wbvSfmKhJ7BdWVfvrS1BD74ww1CyRj05E9IeZ1XZdYGscqrpiWpwGDHM
	8wnvZREJVm8w9PCFWlYpKP
X-Received: by 2002:a05:600c:3b92:b0:485:3dfc:57a with SMTP id 5b1f17b1804b1-4853dfc07d7mr45492655e9.32.1773074009829;
        Mon, 09 Mar 2026 09:33:29 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485237e8095sm168438005e9.2.2026.03.09.09.33.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 09:33:29 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] ettercap: patch CVE-2026-3603
Date: Mon,  9 Mar 2026 17:33:28 +0100
Message-ID: <20260309163328.489102-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 16:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125000

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-3606

Pick the commit that is marked to solve the related Github
issue[1]. Its commit message also references the CVE ID explicitly.

[1]: https://github.com/Ettercap/ettercap/issues/1297

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../ettercap/ettercap/CVE-2026-3603.patch     | 48 +++++++++++++++++++
 .../ettercap/ettercap_0.8.4.bb                |  4 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3603.patch

diff --git a/meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3603.patch b/meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3603.patch
new file mode 100644
index 0000000000..e1b19ea05b
--- /dev/null
+++ b/meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3603.patch
@@ -0,0 +1,48 @@
+From a7347f49b928f47fc37805c9f3a70a9487d45a65 Mon Sep 17 00:00:00 2001
+From: Alexander Koeppe <alexander@koeppe.rocks>
+Date: Sun, 8 Mar 2026 17:57:39 +0100
+Subject: [PATCH] Fix heap-out-of-bounds read issue in etterfilter
+ (CVE-2026-3606)
+
+CVE: CVE-2026-3603
+Upstream-Status: Backport [https://github.com/Ettercap/ettercap/commit/41c312d4be6f6067968a275bf66b2abd2a0ba385]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ include/ec.h                  | 6 ++++++
+ utils/etterfilter/ef_output.c | 4 ++--
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/include/ec.h b/include/ec.h
+index d69de613..80c7eaba 100644
+--- a/include/ec.h
++++ b/include/ec.h
+@@ -94,6 +94,12 @@
+    ON_ERROR(x, NULL, "virtual memory exhausted"); \
+ } while(0)
+ 
++#define SAFE_RECALLOC(x, s) do { \
++   x = realloc(x, s); \
++   ON_ERROR(x, NULL, "virtual memory exhausted"); \
++   memset(x, 0, s); \
++} while(0)
++
+ #define SAFE_STRDUP(x, s) do{ \
+    x = strdup(s); \
+    ON_ERROR(x, NULL, "virtual memory exhausted"); \
+diff --git a/utils/etterfilter/ef_output.c b/utils/etterfilter/ef_output.c
+index 2530e599..2f49177e 100644
+--- a/utils/etterfilter/ef_output.c
++++ b/utils/etterfilter/ef_output.c
+@@ -150,10 +150,10 @@ static size_t create_data_segment(u_char** data, struct filter_header *fh, struc
+ static size_t add_data_segment(u_char **data, size_t base, u_char **string, size_t slen)
+ {
+    /* make room for the new string */
+-   SAFE_REALLOC(*data, base + slen + 1);
++   SAFE_RECALLOC(*data, base + slen + 1);
+ 
+    /* copy the string, NULL separated */
+-   memcpy(*data + base, *string, slen + 1);
++   memcpy(*data + base, *string, slen);
+ 
+    /* 
+     * change the pointer to the new string location 
diff --git a/meta-networking/recipes-support/ettercap/ettercap_0.8.4.bb b/meta-networking/recipes-support/ettercap/ettercap_0.8.4.bb
index 3784d12b85..b806a77164 100644
--- a/meta-networking/recipes-support/ettercap/ettercap_0.8.4.bb
+++ b/meta-networking/recipes-support/ettercap/ettercap_0.8.4.bb
@@ -21,7 +21,9 @@ DEPENDS += "ethtool \
 
 RDEPENDS:${PN} += "bash ethtool libgcc"
 
-SRC_URI = "gitsm://github.com/Ettercap/ettercap;branch=master;protocol=https;tag=v${PV}"
+SRC_URI = "gitsm://github.com/Ettercap/ettercap;branch=master;protocol=https;tag=v${PV} \
+           file://CVE-2026-3603.patch \
+           "
 
 SRCREV = "41da65f4026a9e4cea928e61941b976d9279f508"
 

