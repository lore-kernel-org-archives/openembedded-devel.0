Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C35E7FDE9
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 21:14:10 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1564.1770066846228822903
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 13:14:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J4HkV/rx;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so47674735e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 13:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770066844; x=1770671644; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nzVQ8m2jfOdGzUTsk9Q9rVJDLNexz1aoHHWs+5bUZN4=;
        b=J4HkV/rxCAkUktHXBpomuLYx9iK1254IcQkI0+CBOn75Kj+Pv7vw1caStlzLUJ2CCF
         wU2C/cyj6MgDGoIG6zN98C8IH4vvD9EgyI6bSV6S+J0gekDIAdENbHdajYtD27cbGG4+
         Vs/vp6hf2hQwIBfOlhckYk8rHE0O76aNBEX2UnZfSeZqNNDlna00r+7R6BPImd1YmTU/
         QjI9d33aoXWkFDygRvraf7ZyJODBZkE1lvGcwUYcrPLIiQ54FwWJKcneaefdmU2vVj67
         KKCa1EPfDI3QncDPr95u7vaPW24YAg6c/j3jopC+khvo4myB8Lb22nNxGYU6/9tiTp6c
         mU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770066844; x=1770671644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nzVQ8m2jfOdGzUTsk9Q9rVJDLNexz1aoHHWs+5bUZN4=;
        b=bhgE6uy6ZB52uyYNUNvpfWi2eOcequqqeuJUaZFmdKzIHDNjViM1y5dS9Awk9XB9oz
         4aE6Lw0u0MC9dzNs+6VtPX0qqMYkhZL102E+KRH7+yK9yFkYKrIcc6Mxcaa3imx5K0qe
         +l0tgXGVPX4W9t5XjPgEFXV0KJAbsYV+m6IFaBPsJUWKUr6jnQsaWvRY9xBsGEVOofKn
         T6lHqSvcMx/uXh4ORCN2KweNo9s5raATPOcQV3BlErI8wSuQQ1bAJsr4FgnYhlrlBmSJ
         6LEa+DoQ7MIaIn+25gY2F6g1cJE7kPTMdTWvDppPGgiY4FMIXljpmPFuAAbejPttuvaL
         ynfA==
X-Gm-Message-State: AOJu0YxDDGxqG9MYabc2xFz5ESiUL0cOkbUs9li+VduDJ+vZVmONZ4lY
	AygkccJB+OCQedrlvMmorsIlmF4/dVA/Ds9w9ELVktn9g6y29Z0vKAEVw0FpYQ==
X-Gm-Gg: AZuq6aIJlO6DMy7BLLjl2VhVuM03wY+cPUGL6swUB5aGe3bitZhQFXSHsO1Vr/fhyb9
	hQQhn1+lUoRhuqhIUEs/k4KVqajAwZL1O8hYSGc6gY5HSQ4A/mheBjkxtcqJhfFfrgDkBM4o+1B
	CKDCLXJaksBznbpiZTvH6PkRpj56NUiUCPUedjrdEYW7eX93WNml4m0Ql5Oz7YA+rty8w+DN+zi
	NuXveaariuU7AlP2PfuM49eTy1clPUgj8nM7/UEpyl+eUhYLQA6nnkbv/mrIKOJAZIpppCjkAqg
	0QeAnoFOvkw4dSkNK9Bl0x3BMI36tiQrhpj4amnFX19OYN/pggZO+egB5990qXY+HcF0EKQf4Pb
	QcrnrtVqLODePWqzD4Iva735HYB7FHtJ4OzwlbmjSgGTf+ZXz/pmMjeOo+k75chMq3NCmBHcUcK
	b4WnABrujF
X-Received: by 2002:a05:6000:2c08:b0:431:5ac:1fc with SMTP id ffacd0b85a97d-435f3a7a4acmr20334846f8f.14.1770066844422;
        Mon, 02 Feb 2026 13:14:04 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce64sm48756747f8f.26.2026.02.02.13.14.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 13:14:04 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 03/15] fontforge: patch CVE-2025-15269
Date: Mon,  2 Feb 2026 22:13:49 +0100
Message-ID: <20260202211401.1287664-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202211401.1287664-1-skandigraun@gmail.com>
References: <20260202211401.1287664-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 21:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124076

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-15269

Pick the patch that refers to this vulnerability ID explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../fontforge/fontforge/CVE-2025-15269.patch  | 35 +++++++++++++++++++
 .../fontforge/fontforge_20230101.bb           |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch
new file mode 100644
index 0000000000..af04085016
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch
@@ -0,0 +1,35 @@
+From 904971c570f0697a9052c6fa699f1a2c9b2669a2 Mon Sep 17 00:00:00 2001
+From: Ahmet Furkan Kavraz
+ <55850855+ahmetfurkankavraz@users.noreply.github.com>
+Date: Sat, 10 Jan 2026 20:06:53 +0100
+Subject: [PATCH] Fix CVE-2025-15269: Use-after-free in SFD ligature parsing
+ (#5722)
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
+index 4db9feebb..894176254 100644
+--- a/fontforge/sfd.c
++++ b/fontforge/sfd.c
+@@ -4786,6 +4786,7 @@ static PST1 *LigaCreateFromOldStyleMultiple(PST1 *liga) {
+     while ( (pt = strrchr(liga->pst.u.lig.components,';'))!=NULL ) {
+ 	new = chunkalloc(sizeof( PST1 ));
+ 	*new = *liga;
++	new->pst.next = NULL;
+ 	new->pst.u.lig.components = copy(pt+1);
+ 	last->pst.next = (PST *) new;
+ 	last = new;
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
index 1680c7b2e0..7db8a66654 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
            file://CVE-2025-15279-1.patch \
            file://CVE-2025-15279-2.patch \
            file://CVE-2025-15275.patch \
+           file://CVE-2025-15269.patch \
            "
 
 EXTRA_OECMAKE = "-DENABLE_DOCS=OFF"

