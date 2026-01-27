Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E4BD25944
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 06:50:35 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4659.1769496624658528366
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 22:50:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MPWDwa+3;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee07570deso40297395e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 22:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769496623; x=1770101423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJKVzu82VYfhv1YSGYn/AjshpR7RCq0xz4BtaUXh6TE=;
        b=MPWDwa+33CaVALG85XL6suxKU0mWmbZVfvnPn+h/0TNs4y1lfcuqtS5WZAJN5sCRnH
         YwHkK4YqJfChkTJwE92879/bRMOw+e4liVSZr4+87TQeccdMnSoguAT2GiKR5Imm9/XG
         0eePpKiBZdUO9T59pkGvOS8jRZAVfXS5UKPPF7JURXlmpvh2tFtm+d72T+b4zK6mz15G
         ZyMyGH1VUW9NcPc+9Lt8BtRnCl+fLG1VHR6l7I5BbcVifwebmsn/n5SK1os9QwirYWIf
         25mCkF7cE2q+KJHIbPsKvYe2rzqC1vVNutiO6wM8cjTYH1N8q8r0pS1s+yPrcTxxinya
         5bkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769496623; x=1770101423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YJKVzu82VYfhv1YSGYn/AjshpR7RCq0xz4BtaUXh6TE=;
        b=m8m21OGmc71yR82Fxr4Zz9JO0sTKNrtb05w6t3HtNlow+kEjQrQpfkEpubWDZ14EVy
         +npTXhWGkhgC21qfy9jdiVSGUKpKIfzPvPwPS/wZ9XSJX7BWs0OHlvoj3evyF83azfrp
         oXOEfNUx/sFeXBsCJnFpFKimDPuuQagDHeenWz6F4lM9Xv1gAbTGen8Em02TgGYPv8Y9
         dnINP0dLMAMFjlBURPxyVFot49vFJtrmnBaq17XJxL8VPz4pzpc2vIPS1tw4eUhxeSx9
         0RHjSjjV5MsqX8/0oPM/yuuObDaOEiFnw8yNYlStiFDx/yEuR4FmjxzEjFRG+uoYfQY7
         T7kA==
X-Gm-Message-State: AOJu0YxxGHW6LK9SoOxalyQYJA5U0d2vkDMsjpzR3qy+VIZM48SXLlk8
	qT7KKzVeGu+5Qnd5PJmCEM4GYtRfQzIVTdj4RCbTodwv2wMk3Usb4DNbAR49Og==
X-Gm-Gg: AZuq6aKodiMzGv/MlsQcc0E5cDH9OL6BvgV3y3ReBL21eK5ZGg0AGP3MGfGppi9MDBZ
	4Zw/rCtnBZjErnyHwlqf2f0HgJ7wqAjb7v6kavSNKukrYhF5pUn7gKz9fXf2yW/YiMwnfUASnRD
	+ve58nDwyD1XEJ/kVxLWILocLIzEoY2HOLV+jhiAttYg8TZ8QsyA+1t4PA1X0BTqx40N0G23uvC
	lhRAiGaWJDtUesC2KQJCV8ZP3t3mkR0OX1ItJYFGLfR1fGPRaN/bhFOFczIon3O8EN9FuFyHnOq
	/sNL++z8c5en4SCG1YUygmRpXw12bDKW+iGgPUZCgjn9uv9LVMdEXfFU3ODsZRRH8hPc7zD3b3s
	TRpJ/nr54GtxpGeCW62GdemnT5CVHWTFgdBiaXgtcJbcN6+v5CE2S3PNHVq2YrPliUH3AObvE4x
	6rOBQUiUsc
X-Received: by 2002:a05:600c:64ce:b0:475:dd8d:2f52 with SMTP id 5b1f17b1804b1-48069c92cacmr6623975e9.32.1769496622906;
        Mon, 26 Jan 2026 22:50:22 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bf8sm35191925f8f.11.2026.01.26.22.50.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 22:50:22 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 4/4] fontforge: patch CVE-2025-15269
Date: Tue, 27 Jan 2026 07:50:18 +0100
Message-ID: <20260127065019.1324332-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127065019.1324332-1-skandigraun@gmail.com>
References: <20260127065019.1324332-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 06:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123911

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-15269

Pick the patch that refers to this vulnerability ID explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: no change
v1: https://lists.openembedded.org/g/openembedded-devel/message/123872

 .../fontforge/fontforge/CVE-2025-15269.patch  | 36 +++++++++++++++++++
 .../fontforge/fontforge_20251009.bb           |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch
new file mode 100644
index 0000000000..a3e26d407a
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch
@@ -0,0 +1,36 @@
+From 6a23476bc5eea880f3f24496710a6133c92a198b Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sat, 10 Jan 2026 20:06:53 +0100
+Subject: [PATCH] Fix CVE-2025-15269: Use-after-free in SFD ligature parsing
+ (#5722)
+
+From: Ahmet Furkan Kavraz <55850855+ahmetfurkankavraz@users.noreply.github.com>
+
+Prevent circular linked list in LigaCreateFromOldStyleMultiple by clearing
+the next pointer after shallow copy. The shallow copy propagates liga's
+modified next pointer from previous iterations, creating a cycle that
+causes double-free when the list is traversed and freed.
+
+Fixes: CVE-2025-15269 | ZDI-25-1195 | ZDI-CAN-28564
+
+Co-authored-by: Ahmet Furkan Kavraz <kavraz@amazon.com>
+
+CVE: CVE-2025-15269
+Upstream-Status: Backport [https://github.com/fontforge/fontforge/commit/6aea6db5da332d8ac94e3501bb83c1b21f52074d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ fontforge/sfd.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/fontforge/sfd.c b/fontforge/sfd.c
+index e19d3a30f..be4220515 100644
+--- a/fontforge/sfd.c
++++ b/fontforge/sfd.c
+@@ -4647,6 +4647,7 @@ static PST1 *LigaCreateFromOldStyleMultiple(PST1 *liga) {
+     while ( (pt = strrchr(liga->pst.u.lig.components,';'))!=NULL ) {
+ 	new = chunkalloc(sizeof( PST1 ));
+ 	*new = *liga;
++	new->pst.next = NULL;
+ 	new->pst.u.lig.components = copy(pt+1);
+ 	last->pst.next = (PST *) new;
+ 	last = new;
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
index 4203c1ef58..cc45740153 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https;tag=$
            file://CVE-2025-15279-1.patch \
            file://CVE-2025-15279-2.patch \
            file://CVE-2025-15275.patch \
+           file://CVE-2025-15269.patch \
            "
 
 EXTRA_OECMAKE = "-DENABLE_DOCS=OFF"

