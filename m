Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 460ADD13C06
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 13:05:27 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18921.1769432717586838466
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 05:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vqg90eUK;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-432d28870ddso2307793f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 05:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769432716; x=1770037516; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HF2jRCm6wrzmSmmCKVuExxJn7ClfNoJF2m9otH4mO+0=;
        b=Vqg90eUKrihLa2urLptSuSp29IslJMrXgifFZkqjgweipnNafRcb6JJpQ9Je5t/UM/
         jfuvQWPs+HR/tUNNCRtOEqIIsCOBrc/0Hns5dZ94t1XXjrnORQGX63Zps8KAxinMA1IJ
         0Flj/6ctjMgNzQ8ULEL9ERELU1FhGwo9WhnbIQNEp8dRiQYKye5XzP3NT6iSacYSsAaR
         qnT+SvtPIKF02I9VLXFafjxgQYhxQo6wOA+H3eMlKSpPQ2aYPM+wBWy+faDUKrPTcAWk
         Hjty65BlxNMRCcU/AosbzFepIsGvbpN0CCLcJMqRhGYFwasHMuwPlvj8qHIYnbViCmyC
         PVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769432716; x=1770037516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HF2jRCm6wrzmSmmCKVuExxJn7ClfNoJF2m9otH4mO+0=;
        b=hmh9Iz/kXOAyDaOTHsZUCEymHoRR8GRFigEOEDsmVcnc6I44rqDOJN6SReAm1EPOz6
         MAbIXVCcdZ59OXOzRhAaPPZqFRrSsgmJTyWwksgV5gmcrwYvMWFAC0+ha/fB3cf2WOFs
         vJd5CegoCTeS8nbQ9w72bh+4qwpVT8xnHUB4DtIhChuEymbf6UhEbekAnqDpCgpw7+XT
         Pmss65E6qWgo8jBpkr7IO/3vHS7quqiS6rJCaqRz/KfeRYBOdusqL87DAop0+++d6CAp
         oMXb72LyaQq3dlInFpOcbaTEsExphOgr0McT6dAby2Lnm0WSa6vONn5iV59HHzGP/H9f
         p2nA==
X-Gm-Message-State: AOJu0YwnYgFKQm/Phmr34GEA6SKJafKFNpxQpCo2N7GJyaeLNVOQD9bj
	dZ6pBmljNh4LVQMLmv+anO2V/qqeTrMuqZX22PDF8oJQ5wEPZ7+FDhHpbiWiTg==
X-Gm-Gg: AZuq6aL4DDHGQjvZSRtTJLO73CPf84B3g1GAoSmy7HR8/HbtQiCpXAM5DHEjTUMgLkf
	9NwQR3tA4vEjazohVfJam5WEd4fduvvPOeC59E5YipgN40YWsi3mHcmaoYllBGOQYGC2tm0q/5g
	GxNPypBlnRdq1PjHG4YAPTJCzspeg0peBuNe4Yyyrjs4nRi1FR50dytDglT+VE7s/7lwvMFdeHr
	hgcjT/B+hcWnrKPRVleV8cyhCUvAq5qDkkl8UCDRvE/JQTXesH3AMPEW5eH/HkQBwqFls9pxq7q
	t+T4DSVnHzkYZS+jToxgPEzii0c9bLmAswmkCqmzuLVwLGJm/ExDxQnMOf0IIjmSTFet3/Owx/Z
	Ys/7F3S1QAoNOV682IuiijFp444YXydZ95x8APxMZhEBii1V49JMU8iGS2fu+ZgLVkOTUf4uLWo
	OeRV/bVVOO
X-Received: by 2002:a5d:588d:0:b0:431:5ca:c1a9 with SMTP id ffacd0b85a97d-435ca14784cmr7168135f8f.23.1769432715696;
        Mon, 26 Jan 2026 05:05:15 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24b54sm30897978f8f.15.2026.01.26.05.05.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 05:05:15 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][scarthgap][PATCH 11/11] sox: patch CVE-2019-8354
Date: Mon, 26 Jan 2026 14:05:05 +0100
Message-ID: <20260126130506.82699-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126130506.82699-1-skandigraun@gmail.com>
References: <20260126130506.82699-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 13:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123888

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
index 5b47382334..24acd882fc 100644
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

