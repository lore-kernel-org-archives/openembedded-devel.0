Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F2B7CA5FAD
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:57:53 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1488.1790722672456716639
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=B6aDqWTg;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-343479e6005so879619eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722672; x=1791327472; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cHhbwPUmfVrAXBNW3I4jiE7uALF0GZdkmdCVEJHG1y8=;
        b=B6aDqWTgd9Jqqm1BXdCVqnSA3oikg3mKHq5v+lP3SMCvINQOGxOaGrIB7kQ9hP2Xe3
         BZUMIewt4SK9c+vmwY4maokw5TYdtotqiWe6qsT8l7bPFe9O7PsO1QgJGO++Jh58qtN7
         0WP5JXLqDjWAg2FSysjdZ9yFC2vPlNP7VctPOhst0pDH5Cj593yGVPfhJx2Z/62465GM
         sXY1VIZhdFl7QZFld1GAODnS2czIOcRTORSh6M2UNQbCPnM53hbgI9tc7XqY8QjIPf9Z
         YUcBc+5Y0u8LbtDsm3vk98Ewpr724nga6Qyr7uo1PPIPbOiWSvaf9VLV+Llgs8NCiJKZ
         aLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722672; x=1791327472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cHhbwPUmfVrAXBNW3I4jiE7uALF0GZdkmdCVEJHG1y8=;
        b=rKI1V8dldiCdSLUc5x5JynMjr77NcSDw2kGhN/AnPv0qZugrO+McRH5cwoP//eU9eA
         tVaeVzmHcqk08zBWc5JBIIJYSjkk6MWAot5RFrbFDLxGWSocxCdw/xm1UEF6zg7lPNTF
         o1TToSrazerkwPlrQLr+HuWSU7HXCE7ytVw4IdhfqG9xUp16wklWgoq0rVmpHLKnzDUS
         ib3faMoAeVKtKlZvWQ4njkSCfN0JR3yaeoDItOxPFqyhvPHWd/A4blQdpEuGdq8weM3s
         hPAaaFjmmCBm1AWog/kxZCBsXHAwsB41RTQ5r6fHZOlGfKnjz18XZ1Qo3TEOtw6w5r9E
         EhrQ==
X-Gm-Message-State: AFq9FYLgYXpaM/vAEoVYFvOi9pq0aA7OGs4HLvVN4oDKOsLQVxjB7q/g
	pg2rOgwTLNNMr8frfCCh5X3urLKD9bpXWbeOgeUbsnEyzJFttbA42zSoSh9FBtg541I=
X-Gm-Gg: AYBFou3DnEugKi9ShtBiIDAYZGr5nFC9PcybNbFG77448PiQVCtQgPqHDKdC/M6b1Nv
	sNeSq4Fyt3lYHWzkyMEolFeXxSYWC1yzOtbcBMKu1JWE6g1YhX4/d5z3EtuyaFTOXVTRCkfOCao
	vE0vJlgACRM4sjqX/N065DnDjD06Tv1pkPLhBAzj/5BawDcSFooTP/PjaDHVWcgy0MpZWpqcDyf
	4jNuPucrXU+H2UQpfdyzcB5OXIEM7QyzZqDPbDSaYEkK8D5P3mXdW3U2NP0J3qduqVKbHqBKS7k
	7yLb39wBWU4aql2H443QUY1xFwdxBCupqbmYRT1bKtDZc74wElNYxAS0VJXmSI/3wbbT090U7JF
	c7SUSXw0YNFxPIUSi/tRGrYJSlqb0uJrh5fBLFhh7Hhbv1J2Tncbz5stNjH9haNF3eguNQnuR3E
	8Vo6w1umonSkppN55iOqfdGlbPvVXnH4UJLOe+f4tKWoOHQ+C/RyCvksdRKGcMY+HjOQ6m0tTvt
	IUvvBoHT65eeswNxGOcFVLXPwHn2QZTdBTG+/6BfE1QQkiJUvjcp6UqmYkd1WtNTxfZ7RY6O5tJ
	/Da08MLSM1xr9cj94MuVlh+Dm3jvGivUvTYLtk8w+wB26NkfEIvhWQP4GGbYOlbSv+z5vx950Gz
	ATl2YuDjpxTckx3pK+inzhoYQ0R396yvoDQ2hW8krB0txfYvQGxIU7gcTbP++UIYvrjWfPCKA1q
	Is+WCr8Utn4nq+sGbVvkSHPkAn2hKP1hzVrQaVUWw=
X-Received: by 2002:a05:7300:ff44:b0:343:562f:a671 with SMTP id 5a478bee46e88-34af7c523f5mr4067695eec.6.1790722671661;
        Tue, 29 Sep 2026 15:57:51 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:57:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 16/26] leancrypto: drop redundant <linux/prctl.h> include
Date: Tue, 29 Sep 2026 15:57:13 -0700
Message-ID: <20260929225723.1046705-16-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:57:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130503

secure_execution_linux.c includes both <sys/prctl.h> and
<linux/prctl.h>; musl's <sys/prctl.h> already declares everything
needed, and including the raw uapi header afterwards redefines struct
prctl_mm_map.

AI-Generated: Uses Claude Code

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ..._linux-drop-redundant-linux-prctl.h-.patch | 35 +++++++++++++++++++
 .../leancrypto/leancrypto_1.9.0.bb            |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/leancrypto/files/0001-secure_execution_linux-drop-redundant-linux-prctl.h-.patch

diff --git a/meta-oe/recipes-crypto/leancrypto/files/0001-secure_execution_linux-drop-redundant-linux-prctl.h-.patch b/meta-oe/recipes-crypto/leancrypto/files/0001-secure_execution_linux-drop-redundant-linux-prctl.h-.patch
new file mode 100644
index 0000000000..dd6db04c2d
--- /dev/null
+++ b/meta-oe/recipes-crypto/leancrypto/files/0001-secure_execution_linux-drop-redundant-linux-prctl.h-.patch
@@ -0,0 +1,35 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 02:14:39 +0000
+Subject: [PATCH] secure_execution_linux: drop redundant linux/prctl.h include
+
+<sys/prctl.h> alone already provides everything this file needs
+(PR_SET_SPECULATION_CTRL, the PR_SPEC_* constants, and struct
+prctl_mm_map on libcs that define it). Do not also include
+<linux/prctl.h>: musl's <sys/prctl.h> defines struct prctl_mm_map
+unconditionally, and <linux/prctl.h> defines the identical struct with
+no compatibility guard against it, so including both is a hard
+"redefinition of 'prctl_mm_map'" error.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+diff --git a/internal/src/secure_execution_linux.c b/internal/src/secure_execution_linux.c
+index 7264edf..df57a88 100644
+--- a/internal/src/secure_execution_linux.c
++++ b/internal/src/secure_execution_linux.c
+@@ -17,7 +17,14 @@
+  * DAMAGE.
+  */
+
+-#include <linux/prctl.h>
++/*
++ * <sys/prctl.h> alone already provides everything this file needs
++ * (PR_SET_SPECULATION_CTRL, the PR_SPEC_* constants, and on some libcs
++ * struct prctl_mm_map). Do not also include <linux/prctl.h>: musl's
++ * <sys/prctl.h> defines struct prctl_mm_map unconditionally, and
++ * <linux/prctl.h> defines the identical struct with no compatibility
++ * guard against it, so including both is a hard "redefinition" error.
++ */
+ #include <sys/prctl.h>
+
+ #include "ext_headers_internal.h"
diff --git a/meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.0.bb b/meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.0.bb
index 566f44fb76..5cd9f02254 100644
--- a/meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.0.bb
+++ b/meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.0.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = " \
 SECTION = "libs"
 SRC_URI = "git://github.com/smuellerDD/leancrypto.git;branch=master;protocol=https;tag=v${PV} \
            file://leancrypto-tests.sh \
+           file://0001-secure_execution_linux-drop-redundant-linux-prctl.h-.patch \
            "
 SRCREV = "0110b781707c7bdde88482933811387b744d21eb"
 

