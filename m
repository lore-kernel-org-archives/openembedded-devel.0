Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A36FF8864
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 13:04:22 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18128.1777208656342461751
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Apr 2026 06:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VIyWcbXh;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c79662668bbso3460847a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 06:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777208655; x=1777813455; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kONViNeGPF9c9MdYm6pTMMW9wgMZFQeHtamrtCBQxgw=;
        b=VIyWcbXh1PGiGuel0N7erIvW4vi+AqPrvXwRTfbyLlDc+22NP47iWeukxllHQN9AEN
         WU957fR9Z1DHndMSRMUH7YYEmkqXhVMiQi32RNUKrcGMcp1i0Uz1R7iJck//wjZl8Vxz
         1Kht25kvIWpfQswy/cloGsiv9pxzLDYxvWpDVyc0+Ht305U80buT6CHrQWGNNG27x6gd
         1Fcd3sFF1dbj6dXm0do0fkB956O6TeVwAfS5gijiNmWf/2DsMRnFi9L8QgeD0E6TX77t
         DFMmMURDOqMH2jWIKkTkfV1f9TcQN00GAfKU5B1blGlVDsu4h9DzcRD48TTAxtVvdgqo
         BUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777208655; x=1777813455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kONViNeGPF9c9MdYm6pTMMW9wgMZFQeHtamrtCBQxgw=;
        b=oqu/jikuSDyCQGy2nNby+FciS8cR9PPrLevBD9DDRSSLSGmmyUPlt7MQyKXp9WrnU1
         ooiOH/DcHcuZ6jiFMmFOb+0sK9s51Jg0KCoyUBCsislwX2nI4k8dGSiNkTQY9UH3/gAF
         ADwObFY+jgTYBOw9UftlCiXYo2Afll14u0Me2rySICw09HUhhObjFtqYXGEIDJTYPpDq
         VXnIkAoWlxs8SepCbDPbZ9fVBpidHhBXJ+YhrKnrBZaJg6gG+OfbESwBRd6AbruB5npP
         +ejZAciywocwgZGhpwOqJadxLMin1c1Ye9dtnXTLJPkbaWoZMe7WvKDQicvc25gUVfOK
         IbNA==
X-Gm-Message-State: AOJu0Yzp7a154eX2DCEZjc93UETjXzxRWUt3+QAdvafOuNS3eXvoBvWD
	XOxqsnhE4l+9vuaoT0EWVwavGANfxeU/JzYNsEGrUPuw57qe918kixW53QII1Yj9
X-Gm-Gg: AeBDiesofWoVvzOMmUK9PTeENqIoMLgR57EqC1gIhdGaNWkiLylv/+ZAf/whh6pEyoP
	BNkIUR8Tt2Gkum+F1UAvdcdOqhqnHbMIRbEYfndYehyTgmema5POXiIVUCN807IYGhpmEsh8T/t
	GZF2hCNFjzzBqEMx6XpQjC7RZh0ePCdZmyDY/455FTxRxbjoAy4SEl8NEhEf2TUt7d0GZP+QyAZ
	Umq1mPO2Cu57RJQuWXblgr/SucsUTfFLrM8iZqaA683gkIQO3wkRXrIxCU+gTrtlyOsRWvk85rV
	9wUmY9jFLYMi1+hT3aj79b9/xRVs8Yj0olyz0QYErEY2ytmpUE9C0gG9HVPoRqp8M/usDSBXyop
	x2olDE2eGNEIE68LUsIPR8iwfd5Ykpn6inJW0HnQ1J91qiXeP7xowmKPR6c/x5xOAk0RoKq2AGy
	iGMsOCmMnU8DSXXQP9D0GHS9q8Z6dkxcmNfxUhDv+ZWTnPtWw=
X-Received: by 2002:a17:902:d501:b0:2b2:5099:2f3e with SMTP id d9443c01a7336-2b5f9e7be29mr430485265ad.4.1777208655470;
        Sun, 26 Apr 2026 06:04:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff98csm277490935ad.3.2026.04.26.06.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 06:04:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 5/9] openjpeg: patch CVE-2026-6192
Date: Mon, 27 Apr 2026 01:03:47 +1200
Message-ID: <20260426130351.793052-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426130351.793052-1-ankur.tyagi85@gmail.com>
References: <20260426130351.793052-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 13:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126621

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-6192

Backport the patch referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 09050325e6e0736beccc40d125e56430054b7cb8)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../openjpeg/openjpeg/CVE-2026-6192.patch     | 35 +++++++++++++++++++
 .../openjpeg/openjpeg_2.5.4.bb                |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2026-6192.patch

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2026-6192.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2026-6192.patch
new file mode 100644
index 0000000000..49be9bd0a6
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2026-6192.patch
@@ -0,0 +1,35 @@
+From 776b00ff792a3c54b65f3bd92dbe7476a5a54106 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sun, 5 Apr 2026 13:25:27 +0200
+Subject: [PATCH] opj_pi_initialise_encode() (write code path): avoid potential
+ integer overflow leading to insufficient memory allocation
+
+Fixes #1619
+
+CVE: CVE-2026-6192
+Upstream-Status: Backport [https://github.com/uclouvain/openjpeg/commit/839936aa33eb8899bbbd80fda02796bb65068951]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/lib/openjp2/pi.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/lib/openjp2/pi.c b/src/lib/openjp2/pi.c
+index 15ac3314..4abb87af 100644
+--- a/src/lib/openjp2/pi.c
++++ b/src/lib/openjp2/pi.c
+@@ -1694,9 +1694,12 @@ opj_pi_iterator_t *opj_pi_initialise_encode(const opj_image_t *p_image,
+     l_current_pi = l_pi;
+ 
+     /* memory allocation for include*/
+-    l_current_pi->include_size = l_tcp->numlayers * l_step_l;
+-    l_current_pi->include = (OPJ_INT16*) opj_calloc(l_current_pi->include_size,
+-                            sizeof(OPJ_INT16));
++    l_current_pi->include = NULL;
++    if (l_step_l <= UINT_MAX / l_tcp->numlayers) {
++        l_current_pi->include_size = l_tcp->numlayers * l_step_l;
++        l_current_pi->include = (OPJ_INT16*) opj_calloc(l_current_pi->include_size,
++                                sizeof(OPJ_INT16));
++    }
+     if (!l_current_pi->include) {
+         opj_free(l_tmp_data);
+         opj_free(l_tmp_ptr);
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
index d559cc9f7a..6dd3dd7542 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
@@ -8,6 +8,7 @@ DEPENDS = "libpng tiff lcms zlib"
 SRC_URI = "git://github.com/uclouvain/openjpeg.git;branch=master;protocol=https \
            file://0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
            file://CVE-2023-39327.patch \
+           file://CVE-2026-6192.patch \
            "
 SRCREV = "6c4a29b00211eb0430fa0e5e890f1ce5c80f409f"
 S = "${WORKDIR}/git"

