Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8664ED12671
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 20:44:12 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3364.1764708251656270404
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 12:44:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cc6gBA4k;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47774d3536dso1916125e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 12:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764708250; x=1765313050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFjEOBy+aW3IHdNBeoO5oa2nZgfHGmVuyDRNngROJt8=;
        b=cc6gBA4kTsMfuHkq0E3W8qFoMZ/X4eq9q5SYiLENDUmparaGq3OhijAli5M4fMtuKG
         IGgWMwI2llY6DjD7vcLU0SBxNUzfMF70jJpNCN0FpoW5k/8IQJ5ArLBPFiAzIw8C0jGf
         lpBahvO6forlnSt+PDrfnC1yNm6jZk6In6+a5Rd9CdklYaGinuCOeg5zSs55gZLt8lCR
         PWVbIq73glmNcenX/D24L6ZeECYrFTeJiLx3TBHY48djXGRTrPggm/GTMHKewgwqHV4s
         OR4UzPbat0pSQxC44xY4G/8STWXzG5UKc/LdAD/vLMRlvxD79ltu3BHbpsIOqLdSs2qh
         vkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764708250; x=1765313050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MFjEOBy+aW3IHdNBeoO5oa2nZgfHGmVuyDRNngROJt8=;
        b=Er+3+hLaDAIJjOceiM8ZuVDlp8y8JiF+GyBMHpeQRNsE7EgejwxAuW/0Aca9QdNRld
         tC3wcJFRBgyTIOuT85uCzUNhlSz/85JgDHKwr+LB+2NkLbjUImueauHvgy4k8A7gqxVQ
         hQkpF1Yki7IDMB1NVJkSE3l7Nal7bF3a9WaB35WIjZ4OOMj22kf5kfsRgYKXF4aZtsBn
         sLbgeI0A+W4mk4qdrQ9cSurZRnBAkdaBW424HCjMIFG086yNz5HDDJ1WwXWzM6+GDTvi
         NAMdlJPjrkf4oV3uCO/XO5hUzECi0BzqOXdAq7SMfmSGpNBjkHg25c/mCnRaVo3ZOvxL
         bs2Q==
X-Gm-Message-State: AOJu0YzYxHA09rS3wDllmdebDItrGBJ4V3Io9AXKeNexsitRXKKDzJ93
	od1r4k8ii2BYkc85EwiNDPhuBPcLNPflfuAuRal2CYNpNhJysOxdr58UZZivCg==
X-Gm-Gg: ASbGncvgKPen82uvPRiiaFjQIzZFG969lKUp9ck+khZg88+OsJH8z/Dh6yBrSzPspeZ
	GXgMcdblX+MZ3srYTcCr7UxrWJLR0CdvgrbevSMwpsAhv+W1YIOZ14E1Gd/ZTBc/6gpZ+KK6XR9
	gi/wrHv2VN4OBBwZSbI5AH9CjLoD/Vgbv7Yf2BF5YDQ+UNBVv5eZ9JFRaymfrBWcryb6tbC4OKc
	djUMa+epgS6zIAtRlbhQYushkvzX/+vwEBODjrSxdMghaeg6LXd8XqSgaG89wzba2/CbDY0xI4w
	3KPi1naX22gXZ5rdKjX0usiW1kBQOeF/aYdcOmDqwER77qVAicJ6XsJlbALv1qJXGaIlg55t5d+
	c3Ai+RHXVp6EeRYq+inzt+a0m3cSka2CkAW8Z4tswL/CzpmmFHJqoCjt3rjy8wsUzJGidgBqsHk
	JaiRl3ML3NRXxwNH/pmLM=
X-Google-Smtp-Source: AGHT+IGhuuYKgiyXpJYR89VWr8UaQtI1xlkLSJ7IPONG3GEBxGlfDZqIrVDx61kOBiuTXp7hkQyJEw==
X-Received: by 2002:a05:600c:3541:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-47926fc1d3bmr49855465e9.16.1764708249858;
        Tue, 02 Dec 2025 12:44:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a7971c7sm8383295e9.2.2025.12.02.12.44.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 12:44:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 3/6] gupnp: upgrade 1.6.6 -> 1.6.9
Date: Tue,  2 Dec 2025 21:44:04 +0100
Message-ID: <20251202204407.3755450-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202204407.3755450-1-skandigraun@gmail.com>
References: <20251202204407.3755450-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 20:44:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122268

Drop patch that was incorporated in this release.

Changelog:

1.6.9:
 - Linux-CM: Fix a potential memory leak
 - Fix documentation link for libsoup
 - Fix unnecessary g_thread_unref in tests
 - Fix issues with Since: in documentation
1.6.8:
 - ServiceProxyAction: Remove some left-over debug output
 - ServiceProxyAction: Stop leaking the HTTP response
 - Docs: Fix various issues
 - ServiceProxyAction: Add get_value_as()
 - Linux-CM: Silence a false-positive with scan-build
1.6.7:
 - Fix compatiblity with libxml2 2.12.x
 - Improve reproducability
 - ControlPoint: Fix re-scan
 - ContextManager: Fix boot-id update
 - Context: Fix crash if served URI is not an IP address

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...mplate-use-basename-instead-of-filen.patch | 32 -------------------
 .../gupnp/{gupnp_1.6.6.bb => gupnp_1.6.9.bb}  |  5 +--
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-gupnp-enums.c.template-use-basename-instead-of-filen.patch
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp_1.6.6.bb => gupnp_1.6.9.bb} (83%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-gupnp-enums.c.template-use-basename-instead-of-filen.patch b/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-gupnp-enums.c.template-use-basename-instead-of-filen.patch
deleted file mode 100644
index 373eb4548e..0000000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-gupnp-enums.c.template-use-basename-instead-of-filen.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From f875a0afe24fdebdefc46d132f6722dfcb55115a Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Wed, 24 Apr 2024 18:52:45 +0200
-Subject: [PATCH] gupnp-enums.c.template: use @basename@ instead of @filename@
-
-This would prevent the build path from leaking into the source code.
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gupnp/-/merge_requests/36]
----
- libgupnp/gupnp-enums.c.template | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libgupnp/gupnp-enums.c.template b/libgupnp/gupnp-enums.c.template
-index 3ce5fa4..a7ff89c 100644
---- a/libgupnp/gupnp-enums.c.template
-+++ b/libgupnp/gupnp-enums.c.template
-@@ -3,8 +3,8 @@
- 
- /*** END file-header ***/
- /*** BEGIN file-production ***/
--/* enumerations from "@filename@" */
--#include "@filename@"
-+/* enumerations from "@basename@" */
-+#include "@basename@"
- /*** END file-production ***/
- /*** BEGIN value-header ***/
- GType
--- 
-2.44.0
-
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.9.bb
similarity index 83%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.9.bb
index 7d9b8a477f..ee980cd382 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.9.bb
@@ -6,10 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 DEPENDS = "e2fsprogs gssdp libsoup-3.0 libxml2"
 
 inherit gnomebase pkgconfig vala gobject-introspection
-
-SRC_URI[archive.sha256sum] = "c9dc50e8c78b3792d1b0e6c5c5f52c93e9345d3dae2891e311a993a574f5a04f"
-SRC_URI += "file://0001-gupnp-enums.c.template-use-basename-instead-of-filen.patch"
-
+SRC_URI[archive.sha256sum] = "2edb6ee3613558e62f538735368aee27151b7e09d4e2e2c51606833da801869b"
 
 SYSROOT_PREPROCESS_FUNCS += "gupnp_sysroot_preprocess"
 

