Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB49E7E0D5
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 11:39:18 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45589.1770637154221490205
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 03:39:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U3NseKsJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so48799065e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 03:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770637152; x=1771241952; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPp7FEq9X1pWomhWvNsnlWP0TwYxk8plMYwCC+2L7/M=;
        b=U3NseKsJB0Fni0GKZRWiaiK/OrTZ0jeiSHW/lOLIbD2+yMPgccIFLFdNBEztb0OSIy
         Fzy7HLaEH7wk+Ar9sEKN68fiM0d7pfv8EOD3VDpzvKhvXtjBoStrejd9gn50M2rKTyZo
         r6EAWqZzixdTA009jkUd9meSIVx0rr1jWhxFJYA8Erg7ftJizgBo2ZY8/1PZzfd+XmoV
         owOMM5/m/QxrIaPCoWEbYx9s3jN6nUHRGfrsGci5odi3lCdXnrPnV4i36HtNf7lkJGWA
         XGg5CcH+y6SVGgNzdq0JENw0Q0msbEdN8mHvxe3OrclhDVt9ls8ujuf824Uc8QHWI0oy
         RCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770637152; x=1771241952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hPp7FEq9X1pWomhWvNsnlWP0TwYxk8plMYwCC+2L7/M=;
        b=ov+nt9L7ZVpXOwHcSdTk/M8koyr3+/5iruCPGGJBkDoXjmMgofV0hQHjh2ZEcpOKRG
         rlFEuqS+h3c0IQmGhfmdh4YsfaClO9R0O+1/hMJ5Chz2OW97H4cMmXdoi15BH0xqMKIU
         IIK/xiBLFgh54fWOkm3y5jBQ8t3n0lu0GbtCRslGBHrtPpleG7qLI7XiNSrWO0Z4g6dF
         ctxzg9vti5msGUxl34LFWzV2MU8dFHk3tb5zpHynbP72blH0+o3XyItCa6xaLLM5vsEQ
         SHeNfarsaMlBZEJmhL7Bf7h5q5y851QS5M7DE0Vr8oLuos+fyrSy396zVDcrK4l/hLzR
         3VCQ==
X-Gm-Message-State: AOJu0Ywqx/eTpwQHe6hPXfSHTeHrC7PyXYJIfjPJB8TK+7ZFgodfd+Ql
	QAVGW4S9lPk5fezXE0fxjFIXJgOUYtqiT3wVIEq+KBiCgX/VAwzy69hkHrKxJw==
X-Gm-Gg: AZuq6aINun0v0kAK/2Eiec3lvL835YZjQTuvE0JK971WpSUAGDoNJV2M03vfyWWOxdb
	zGfCTNR6VdGJiqiGxHSV8mr8LeYNU8XCHEVmeocbEfjtz+tvZF7wySqLUPuTGO3GgPjs3cMaUAG
	CPTjNLtI7K+eDwRxrJWi/pycK5bnZnNo7xFbVe0ggN9DYWsGLY3vwsEQ73yvvczXgOlz+BwmoSD
	/O7HmG1H2UqhrXTBOWcOELvJ+q4mmXxccVbTAlsgkUoBSJOClNzWX/VyFfq1jAxRtWmaLPGaexk
	V9rOtGMAiVnw/cprXsPc74tZXH76q2nrDbuhw84WYC5XUx01J7BXqjjMtkDNt/n5uIMQ4fx4rf1
	vpQBbMejRR6EuULnzLVVxFfi6Glat83Lk8UCbaSI6b772h6p2eJditI3/tMkwmD3Z160qE7EVLr
	3j7Dg3RLnG
X-Received: by 2002:a05:600c:64c6:b0:477:a36f:1a57 with SMTP id 5b1f17b1804b1-483201fffeamr150281935e9.3.1770637152462;
        Mon, 09 Feb 2026 03:39:12 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834304232bsm56030375e9.2.2026.02.09.03.39.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 03:39:12 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 11/16] sox: patch CVE-2019-8354
Date: Mon,  9 Feb 2026 12:38:58 +0100
Message-ID: <20260209113904.3442496-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209113904.3442496-1-skandigraun@gmail.com>
References: <20260209113904.3442496-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 11:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124306

Details: https://nvd.nist.gov/vuln/detail/CVE-2019-8354

Pick the patch that was identified by Debian[1] as the solution.

[1]: https://security-tracker.debian.org/tracker/CVE-2019-8354

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../sox/sox/CVE-2019-8354.patch               | 29 +++++++++++++++++++
 .../recipes-multimedia/sox/sox_14.4.2.bb      |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2019-8354.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2019-8354.patch b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2019-8354.patch
new file mode 100644
index 0000000000..c45917c1c9
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2019-8354.patch
@@ -0,0 +1,29 @@
+From 5066f093b08b4033f59ea6d99001f059e919239b Mon Sep 17 00:00:00 2001
+From: Mans Rullgard <mans@mansr.com>
+Date: Wed, 24 Apr 2019 14:57:34 +0100
+Subject: [PATCH] fix possible buffer size overflow in lsx_make_lpf()
+ (CVE-2019-8354)
+
+The multiplication in the size argument malloc() might overflow,
+resulting in a small buffer being allocated.  Use calloc() instead.
+
+CVE: CVE-2019-8354
+Upstream-Status: Backport [https://github.com/mansr/sox/commit/f70911261a84333b077c29908e1242f69d7439eb]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/effects_i_dsp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/effects_i_dsp.c b/src/effects_i_dsp.c
+index a979b50..e32dfa0 100644
+--- a/src/effects_i_dsp.c
++++ b/src/effects_i_dsp.c
+@@ -357,7 +357,7 @@ double * lsx_make_lpf(int num_taps, double Fc, double beta, double rho,
+     double scale, sox_bool dc_norm)
+ {
+   int i, m = num_taps - 1;
+-  double * h = malloc(num_taps * sizeof(*h)), sum = 0;
++  double * h = calloc(num_taps, sizeof(*h)), sum = 0;
+   double mult = scale / lsx_bessel_I_0(beta), mult1 = 1 / (.5 * m + rho);
+   assert(Fc >= 0 && Fc <= 1);
+   lsx_debug("make_lpf(n=%i Fc=%.7g β=%g ρ=%g dc-norm=%i scale=%g)", num_taps, Fc, beta, rho, dc_norm, scale);
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 2eb3adbf97..b2b2542cd5 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -39,6 +39,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/sox/sox-${PV}.tar.gz \
            file://CVE-2017-15642.patch \
            file://CVE-2017-18189.patch \
            file://CVE-2019-13590.patch \
+           file://CVE-2019-8354.patch \
            "
 SRC_URI[md5sum] = "d04fba2d9245e661f245de0577f48a33"
 SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3bb55f6c"

