Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6027ECA1007
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 04:54:35 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.70004.1756788867260297265
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Sep 2025 21:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=h309yFmR;
 spf=pass (domain: mvista.com, ip: 209.85.210.173, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-77246079bc9so2369358b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 21:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1756788866; x=1757393666; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s6adkRSu0LD7lnIBOS6rwkQRCOb1JWqnM+UVkLzDPxI=;
        b=h309yFmRrc+ruQVkMXZVGj8xpf0C7myfbhozi7kFdjK1thI8ewVWsQ0JqDzEsCXUpg
         pE65n9r8tRJIoRvmOi7ZTT9UTtVudvFqThE8c2u5zVob3PLbjMQ314MXW+UkKcX5vo3o
         QcLPOrJ88AKlWWzog86tGeJeLdUx1qoYi7FLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756788866; x=1757393666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s6adkRSu0LD7lnIBOS6rwkQRCOb1JWqnM+UVkLzDPxI=;
        b=UxOUcn6luHmSOXO8yGlGqXpZR5j9XeUIMOlHd4YDlNhe2xia85hHoQUsjEE2QUcc11
         hnoSU7FPSbPZ6m2PXQiwAQds0msnh1uHPnJhYrjPM3unwqtO8BH8/P9g8RZE/83mNmvn
         h++Pm7/WZWb/sFD0TewszDeu6FJpPL60vEWcGzwf0uPhcNs8mxWPU5Mo93eB4QvIq5dV
         HwEu+kx9hkbuNszKVZamaGFclJuXG1NlpVKlOtKieOSwE7ESU9MYrw3sB9oSWr8L06IT
         f51GCF6PCcFuwvjycAR7/2Kc+OkLHaF2kH6pIf1Wt/DeeKadsEb2AkQSTl6P8uxqE2Hr
         zoTg==
X-Gm-Message-State: AOJu0YwR5qhUzUEWpjbBqV1yJAOsCCTHUQqLkiyFlFEpdRSK3TLQr+rB
	T3mhvwAMR5jb5FBeESaIEx0z0e3nwpEQHGO9yU5NrWQ0gqOC50axC5SAP/slk6iFFA33WGL6kIL
	e+aulEmk=
X-Gm-Gg: ASbGncuNnaIrJK5RkL1KYoctzr8hdf2wcWCpWgqHWc8HnBD0OK3LuvhU3kYaQDqyNje
	QQvuHRkEFfIU+9O2SyJ2+pt3vjeEoG102DhOBnfYcYXrtNPhrT34FV+v3WvTeAYCZ8QYC/At/e3
	XCFMc9zMqzz27PMzH5PqQ6n8kiTkVFVUu2K8w2+F4F63dU0+OYOxwGe7lOsIfwql3hHapd7KfVJ
	jEke57T0ZvT1HJbmyy6RMZ/7zRAI/I9+WgYdg1QWQLRiUwK3DmQ3qb4vRDsCnbuW1CgdMtbUpBo
	sVs4W3hUp/kX2q4jBh2RjKr0MrVuryAnJ4+RDVmQr+NNxfDyrUP96/Wp/mWX6BDbBvDoEpGO1F8
	alzRNywHkHPriRk2RMYjszpeswAwz+7y/pK9XOD61XiRN
X-Google-Smtp-Source: AGHT+IFYgd4Yv32VBy7OUVmXNeoiXKRQOnvE3WgMu9TFcFPMtuz62MIDf34qRDZw0y5XBCjYzIRNPA==
X-Received: by 2002:a05:6a20:12c7:b0:243:b411:ae53 with SMTP id adf61e73a8af0-243d6dd56acmr13507756637.11.1756788866099;
        Mon, 01 Sep 2025 21:54:26 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.193.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4beb67sm12167181b3a.65.2025.09.01.21.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 21:54:25 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH] openjpeg: Fix CVE-2025-50952
Date: Tue,  2 Sep 2025 10:24:17 +0530
Message-Id: <20250902045417.20173-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 04:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119167

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream commit:
https://github.com/uclouvain/openjpeg/commit/d903fbb4ab9ccf9b96c8bc7398fafc0007505a37

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../openjpeg/openjpeg/CVE-2025-50952.patch    | 32 +++++++++++++++++++
 .../openjpeg/openjpeg_2.4.0.bb                |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-50952.patch

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-50952.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-50952.patch
new file mode 100644
index 0000000000..6d16b37980
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-50952.patch
@@ -0,0 +1,32 @@
+From d903fbb4ab9ccf9b96c8bc7398fafc0007505a37 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sun, 18 Feb 2024 17:17:00 +0100
+Subject: [PATCH] opj_dwt_decode_tile(): avoid potential
+ UndefinedBehaviorSanitizer 'applying zero offset to null pointer' (fixes
+ #1505)
+
+Upstream-Status: Backport [https://github.com/uclouvain/openjpeg/commit/d903fbb4ab9ccf9b96c8bc7398fafc0007505a37]
+CVE: CVE-2025-50952
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/lib/openjp2/dwt.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/lib/openjp2/dwt.c b/src/lib/openjp2/dwt.c
+index 4164ba09..f42c47b6 100644
+--- a/src/lib/openjp2/dwt.c
++++ b/src/lib/openjp2/dwt.c
+@@ -2080,7 +2080,9 @@ static OPJ_BOOL opj_dwt_decode_tile(opj_thread_pool_t* tp,
+     OPJ_SIZE_T h_mem_size;
+     int num_threads;
+ 
+-    if (numres == 1U) {
++    /* Not entirely sure for the return code of w == 0 which is triggered per */
++    /* https://github.com/uclouvain/openjpeg/issues/1505 */
++    if (numres == 1U || w == 0) {
+         return OPJ_TRUE;
+     }
+     num_threads = opj_thread_pool_get_thread_count(tp);
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
index feecb957ba..fbfbab7aaf 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
     file://0001-sycc422_to_rgb-fix-out-of-bounds-read-accesses-when-.patch \
     file://0001-opj_j2k_add_tlmarker-validate-that-current-tile-part.patch \
     file://CVE-2023-39327.patch \
+    file://CVE-2025-50952.patch \
 "
 SRCREV = "37ac30ceff6640bbab502388c5e0fa0bff23f505"
 S = "${WORKDIR}/git"
-- 
2.25.1


