Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B400F36C32
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 06:28:05 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14176.1776666477464784536
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Apr 2026 23:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UVjVoAUs;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so2398805e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Apr 2026 23:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776666476; x=1777271276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fz83dpZTn9busdByLZj92+0dcc5WDMxdXw2IS+UQlv0=;
        b=UVjVoAUslPs8PJ+0IVL7Frri4kNOPr4njkee44iSfLqmQJzdjVU+VgDMj4z73cLhKW
         TKtMoNKBXbK3mGPSaG8xDnWvdvrK60cn/C2dt9pz/GK1Pk8RkV+bSOiePzP9Xbe3ltK3
         HqzzrfKusAN1zdteg3NqPr1ntmJ+J6ZZu4cD7sFkAulqmEyj1ee8dMwhv3WUbZOUPqwZ
         9wdMdAorCWOap/ljrdi20W5nje5Tr+hrNkGz9I87HixYK1VAc5mlJLU8LJAAgxvqnn8S
         hOBm2KDorI5oFxqaQ/Mn2C24I6Ui0AWNq2YAyNFQCEm5PMbpYfhPfwCLIRK/G91qGBPY
         jmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776666476; x=1777271276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fz83dpZTn9busdByLZj92+0dcc5WDMxdXw2IS+UQlv0=;
        b=i/GSsU7Y6deQp6G82qX3EH2gcTZ/A74J34i93hbbBbLB2ze9RsTT2dO1gA1bbS7UEW
         EBhMKEeLG41747d4KG+iocvPyUO/w4fCmMCIu7rd4Kb3wprwUwwGJVcHaxAaN+F+YQx4
         IfvHUoPSsl6Wq8L5veV4Ia9H3T4YOdZz/RuMA3deyIBO93se9vWPDRbfoYhZX9co6IT0
         PlWJLlKYHrnE2rDYj252M6OKisCx0kDWXNCvXSx7bFZbstnwhYSlgBfFHb3Se/B6jGPX
         GNNvfEV3zU/Ac5rjdFVm/CA7Kdm8krWiovlt0jT4s4hFSHLxTSv5f1Nhib3yjR2dQPRY
         VVyg==
X-Gm-Message-State: AOJu0YyckRfXa3jE+vvqKQT9ajNrzWGekolLfj2PyKfFVanxi9fZbnWw
	U1/vSx9RRNd3FD5BKj3JGruB0eYJB4vpS9tEcsUBbFQmnXFi1sh8f+UeahBCIg==
X-Gm-Gg: AeBDietR4u0dEoKQfLQcWbcorzQkGbnG4MZtryqTJeiJsVEHM1YaIPyU/C/lO6bDVB0
	WTu4PDZEIjMTzR85xCQ/FkCmINyB8WsLJkRSAsl1zCstxEA8P3EUs7W56AgQ6zsGnhkVCfrfncm
	mKibVQXKbCtnjmwrXDTdWjSAJ0QoglvoZps1jnApuVKB6jitWasxEIpy18B8RoLITHbjpeHMwwz
	A4+3O0GK5FT26EwfYqgwIX+qHv2xfxd8Uf0Fu6MEEPipMWQy6LfTDW/z5Sm4pxSc5CHnkSx/Jod
	nbg9bLEmi/hB3nZEwu9DoUaVH6jYgCZFdIYLijvzKx6exkDvtGekJGdGA/7xhXA4NHQDyfkgTw2
	d3CVDk8rlX0WfrFlvy6Vnr3LJL9hvWZpiDDbpDj1RXmLYAqn8gDWTas4B4Ya+mH0JQC/qTiNb9V
	Tm3LzEMmyATSgulpJFJ9pvtTEPb4Cvktg=
X-Received: by 2002:a05:600c:5295:b0:485:30d4:6b9e with SMTP id 5b1f17b1804b1-488fb77facemr179977635e9.21.1776666475772;
        Sun, 19 Apr 2026 23:27:55 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc17f642sm238296665e9.5.2026.04.19.23.27.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:27:55 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 06/17] lcms: patch CVE-2026-41254
Date: Mon, 20 Apr 2026 08:27:38 +0200
Message-ID: <20260420062750.3795917-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420062750.3795917-1-skandigraun@gmail.com>
References: <20260420062750.3795917-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 06:28:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126470

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-41254

Backport the patches referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../lcms/lcms/CVE-2026-41254_1.patch          | 28 +++++++++++++++
 .../lcms/lcms/CVE-2026-41254_2.patch          | 34 +++++++++++++++++++
 meta-oe/recipes-support/lcms/lcms_2.18.bb     |  5 ++-
 3 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/lcms/lcms/CVE-2026-41254_1.patch
 create mode 100644 meta-oe/recipes-support/lcms/lcms/CVE-2026-41254_2.patch

diff --git a/meta-oe/recipes-support/lcms/lcms/CVE-2026-41254_1.patch b/meta-oe/recipes-support/lcms/lcms/CVE-2026-41254_1.patch
new file mode 100644
index 0000000000..2ed8e9f587
--- /dev/null
+++ b/meta-oe/recipes-support/lcms/lcms/CVE-2026-41254_1.patch
@@ -0,0 +1,28 @@
+From c83cfcd249d06950a307cee8d1e22b7f6a78a8a7 Mon Sep 17 00:00:00 2001
+From: Marti Maria <marti.maria@littlecms.com>
+Date: Thu, 19 Feb 2026 09:07:20 +0100
+Subject: [PATCH] Fix integer overflow in CubeSize()
+
+Thanks to @zerojackyi for reporting
+
+CVE: CVE-2026-41254
+Upstream-Status: Backport [https://github.com/mm2/Little-CMS/commit/da6110b1d14abc394633a388209abd5ebedd7ab0]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/cmslut.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/cmslut.c b/src/cmslut.c
+index 1089148..b245209 100644
+--- a/src/cmslut.c
++++ b/src/cmslut.c
+@@ -460,7 +460,8 @@ void EvaluateCLUTfloatIn16(const cmsFloat32Number In[], cmsFloat32Number Out[],
+ static
+ cmsUInt32Number CubeSize(const cmsUInt32Number Dims[], cmsUInt32Number b)
+ {
+-    cmsUInt32Number rv, dim;
++    cmsUInt32Number dim;
++    cmsUInt64Number rv;
+ 
+     _cmsAssert(Dims != NULL);
+ 
diff --git a/meta-oe/recipes-support/lcms/lcms/CVE-2026-41254_2.patch b/meta-oe/recipes-support/lcms/lcms/CVE-2026-41254_2.patch
new file mode 100644
index 0000000000..be8c759a6f
--- /dev/null
+++ b/meta-oe/recipes-support/lcms/lcms/CVE-2026-41254_2.patch
@@ -0,0 +1,34 @@
+From f5994aea02d5620f3182cafdcf116ffe9d6c9fd2 Mon Sep 17 00:00:00 2001
+From: Marti Maria <marti.maria@littlecms.com>
+Date: Thu, 12 Mar 2026 22:57:35 +0100
+Subject: [PATCH] check for overflow
+
+Thanks to Guanni Qu for detecting & reporting the issue
+
+CVE: CVE-2026-41254
+Upstream-Status: Backport [https://github.com/mm2/Little-CMS/commit/e0641b1828d0a1af5ecb1b11fe22f24fceefd4bc]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/cmslut.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/cmslut.c b/src/cmslut.c
+index b245209..c1dbb32 100644
+--- a/src/cmslut.c
++++ b/src/cmslut.c
+@@ -468,12 +468,12 @@ cmsUInt32Number CubeSize(const cmsUInt32Number Dims[], cmsUInt32Number b)
+     for (rv = 1; b > 0; b--) {
+ 
+         dim = Dims[b-1];
+-        if (dim <= 1) return 0;  // Error
+-
+-        rv *= dim;
++        if (dim <= 1) return 0;  
+ 
+         // Check for overflow
+         if (rv > UINT_MAX / dim) return 0;
++
++        rv *= dim;
+     }
+ 
+     // Again, prevent overflow
diff --git a/meta-oe/recipes-support/lcms/lcms_2.18.bb b/meta-oe/recipes-support/lcms/lcms_2.18.bb
index 79e4a6f694..1ff3b3908f 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.18.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.18.bb
@@ -3,7 +3,10 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e9ce323c4b71c943a785db90142b228a"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz \
+           file://CVE-2026-41254_1.patch \
+           file://CVE-2026-41254_2.patch \
+           "
 SRC_URI[sha256sum] = "ee67be3566f459362c1ee094fde2c159d33fa0390aa4ed5f5af676f9e5004347"
 
 DEPENDS = "tiff"

