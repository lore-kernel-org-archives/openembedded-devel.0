Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF65F589C4
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:49:55 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18684.1776948589774223905
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hZnoOaB4;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35fc2b18363so7419950a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 05:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948589; x=1777553389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4WQ2JMQ3mWa1zfTKtv6qC4WX7ypyxfbiVxAo+Atrsw=;
        b=hZnoOaB4ENwAiDJmW+azSVILF1QRNG7iHcaDAmZ6AWrTavCj6mnBOLy1IIya4gFba9
         DuVvSlZASejBKPb81xgqTrvS4xQuNLTM5NUjSxVJksh3OTclWdovzCumq+llA7Z8bFoZ
         JWnkSsgkeYNViR/BOLIZ7WmjvHKZ+/GhWZvjhNf3fpPh7CxvsxzTNCEWWUIfas6cI5Tk
         hGF6cNg9yWjaaIFCAwU4UNBhPms9vyUy7L4PZBBU+OJ43+QD0zFzu1FbGXs+u9/aD+8H
         HmINeG/CGKqQzIG5qeyK3BQulqwO/VsJnk3DBDU5czAPm10eGsmVRzhNgCThy5jz5JpM
         bsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948589; x=1777553389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s4WQ2JMQ3mWa1zfTKtv6qC4WX7ypyxfbiVxAo+Atrsw=;
        b=KPUuzEDMYlN/uuSsOdLB1/5E4Kk0yN5Yx0v58+JSQP14Q+WYdhnFdqBi0yYFtCpWvE
         Jacwclqu8u+HyyECzbD5h1a7iBBTgdSzozmUgkmlVRuEErINE2MP0KOnyiCsHmonYjQS
         IG3eb3FsVWXsYNLRFIJA4Q9ju1FJAcVkBINtTscY0B5jJxAa3eV7fq0uMiSMLnQ7WIgB
         xLxCyUPtyidcmt8Ran+xg5fM8kxz7eUV33uZAN762TU9E7NtSv4IGJQYV/UCkdi3v8jX
         1yxbX6SSPK+/RmMMPr/CnTOL3FtKEpS9JC7UO1N0/iCzUN5QA9bYTkEGE9qeeQpcJREl
         X4Yg==
X-Gm-Message-State: AOJu0Yy3SvV6a4G7Yvk8aobtF7BKah5Tr02Ramuuo8CG/i0zlsbhUISY
	eaHsRo7/jfKzm0Jf3WK8dDTa60kW+T05X8Y1WW3ky8TbqWGu9D/NijppKRM4ZBde
X-Gm-Gg: AeBDietxM7XxYV9GNQV0FgNaiUZUVtHnd9metC0LXHsXstSyb6ibvYD7Y/w1FmGik2f
	Gu2xHlbYSO6gnQozRyCgyVt+t6VsVpXQXS44GeTJXc+xRm4XxPkY7Y/eqpnXKp44LeSva0KnYzJ
	TUdjNZ1AxeV8QflzzVXgc0qeBBRU0Us7hIbJtgglKdJeQFeY339kA2AXAxHxoipvxk60aOWHU78
	Jm/nsBkpBVSOu3AmfM7fE/rlKmIaLF4dNqZyMW0/5LJ1bo2z8FsgsRuL9nedIN+Lzi6rIsNTHtu
	9wS+DDwtYBDPrXCcaMV6uZHGxIYzmXYmaFgFOOEgSKFoRDrPiM+90OGrKmLqHWqM9y1/TsWpnws
	PhpjBF9HTsDDko1MyF/K8eOGFCoYRXXFRVM0z5FlFnb/qSkIoEy8Vx/Tl/lPa1DFAAjb8ed5Rzf
	Sb768LTRjblA62YkcSJlhh5y25VPSA2nNd+kjum6A97olJsA4=
X-Received: by 2002:a17:90b:35c6:b0:35e:5aa5:ae38 with SMTP id 98e67ed59e1d1-361403ebe7cmr24665271a91.9.1776948589011;
        Thu, 23 Apr 2026 05:49:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa14487sm204043415ad.18.2026.04.23.05.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:49:48 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 16/19] openjpeg: patch CVE-2026-6192
Date: Fri, 24 Apr 2026 00:48:14 +1200
Message-ID: <20260423124823.1983261-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
References: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 12:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126592

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
index 971cdb2ff9..6f89551a21 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
@@ -8,6 +8,7 @@ DEPENDS = "libpng tiff lcms zlib"
 SRC_URI = "git://github.com/uclouvain/openjpeg.git;branch=master;protocol=https \
            file://0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
            file://CVE-2023-39327.patch \
+           file://CVE-2026-6192.patch \
            "
 SRCREV = "6c4a29b00211eb0430fa0e5e890f1ce5c80f409f"
 

