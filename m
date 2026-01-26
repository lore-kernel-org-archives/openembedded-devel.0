Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F9ED13C00
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 13:05:16 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18911.1769432709908208646
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 05:05:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IiUHSkLf;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so34940665e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 05:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769432708; x=1770037508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vaOyIqDsXT7R7wtFL0tTbMAE5+7+8tPGaRPejr4VBd0=;
        b=IiUHSkLfoZLaHy5dKb7HNo7wmn2P9K+TrtVQTKTpiKL8aH7QCswtc2kPM6HDoeluLd
         5dvFy2Nzo+BxgCBLKY/X5XFAt+ahc8v2MqXx/mBQG75IF5NtNlwbmF8i/Doszqbk3dKX
         TW7l7vMDHfYXp//H9hl565iaFawgcvokckFdmiODVYDzl7So9aCZ4FwgQqRIcHxYfJzK
         CdFQbFe+LFlJtqzddSFbSvYsnMg8nlkThwY/BO03qi255SXMaKdJDvXMpd127DyVumS4
         dWgNzUG+PAB1kBbEpIK7urLTqALNbl4MgOijHLl6peKleqd0OweIesUkGwH/qR2qC3NX
         Nfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769432708; x=1770037508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vaOyIqDsXT7R7wtFL0tTbMAE5+7+8tPGaRPejr4VBd0=;
        b=rr3HEEX86XrQXemZwKkae5TjNR32NTSiu7LBXX6wevvuhhukH4ic+0tBQ2gkZmFjyg
         9SkN0OA/lrvZGFiPBSkboKFzRI2tm/rh7ESpGKETAVTty+TSmcvZ7EZrvlwTNMf8BHNw
         PioqP759g7gc76CYJzykajCC9D0C0VWEao9derZiwbcm5sB5I/3er00pTIYbkAcDG7Ht
         IFYiAmbxdtSzpo3vH/Knf2igx7SrERfgderkaScGLbwaAq3Aa6ME4yHA0bRFfrfrB6Rb
         Yf0xb1xO4uevwYXMQoAwRZAqJ/OpUladXP8V2WXEazrqZyOnDiz34t5ubK97TXg1x4qm
         jnKA==
X-Gm-Message-State: AOJu0Yx0b9q/pdwy3fgi/7Qo68H3bnPFXt52TXQxZSSkZXcI0Ed4dulB
	udZ3ucez07P7iNnxHFOzBFdArx1ZuLvGoye4mWR+tJAaLaC8qPaqZ12Byz8vxg==
X-Gm-Gg: AZuq6aKfBXbplY95DyCJCHNLgysNBzMC9bnRT7eRzvGQe3zBn6P2n1SAdLPBSXJUSh2
	ehMpvRAmE7PpcmyeU1QYxItH4XVzbfpPAH7GTILCAcjYmLzqqGX08biQkMLgTn0KArMCvp1grDs
	tjVP4/y1u0j1cPZT82CvaqPsUt26pY+7APFrAvDKg9+YMOECQ4RFhLOeEVOW4XuJcEjOoHXIUPG
	msj+ys5xJm4u6WWyGmJMycOcA/dPO/yu8V9pfpMomHlLsboE9Ky+shyo4w1ACEwWLn1t+1Yg3Xb
	XmGosnfAx7WJNP6dxGO7MLKnZWBK3pLl8HppoXJZDrBh06iyqnwAgV2LmcFTkNDdMXjylxPK7at
	/U5fZNCsrez6V/jr72Qk1YFypQ8bCa5CKpQttTQYmCrTSN+MsH46S6kVtVJraVHQBo1sB7Akuc1
	XaNd0xamnw
X-Received: by 2002:a05:6000:400f:b0:431:2ff:128f with SMTP id ffacd0b85a97d-435c9a8eaafmr7709236f8f.6.1769432707881;
        Mon, 26 Jan 2026 05:05:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24b54sm30897978f8f.15.2026.01.26.05.05.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 05:05:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][scarthgap][PATCH 01/11] sox: patch CVE-2017-11332
Date: Mon, 26 Jan 2026 14:04:55 +0100
Message-ID: <20260126130506.82699-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 13:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123878

Details: https://nvd.nist.gov/vuln/detail/CVE-2017-11332

Pick the patch that was identified by Debian[1] as the solution.

[1]: https://security-tracker.debian.org/tracker/CVE-2017-11332

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../sox/sox/CVE-2017-11332.patch              | 28 +++++++++++++++++++
 .../recipes-multimedia/sox/sox_14.4.2.bb      |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11332.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11332.patch b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11332.patch
new file mode 100644
index 0000000000..383813e469
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11332.patch
@@ -0,0 +1,28 @@
+From 80479b4978ddeb6fadb75007abc81f1ca2c50abb Mon Sep 17 00:00:00 2001
+From: Mans Rullgard <mans@mansr.com>
+Date: Sun, 5 Nov 2017 16:29:28 +0000
+Subject: [PATCH] wav: fix crash if channel count is zero (CVE-2017-11332)
+
+CVE: CVE-2017-11332
+Upstream-Status: Backport [https://github.com/mansr/sox/commit/7405bcaacb1ded8c595cb751d407cf738cb26571]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/wav.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/wav.c b/src/wav.c
+index 5202556..71fd52a 100644
+--- a/src/wav.c
++++ b/src/wav.c
+@@ -712,6 +712,11 @@ static int startread(sox_format_t * ft)
+     else
+         lsx_report("User options overriding channels read in .wav header");
+ 
++    if (ft->signal.channels == 0) {
++        lsx_fail_errno(ft, SOX_EHDR, "Channel count is zero");
++        return SOX_EOF;
++    }
++
+     if (ft->signal.rate == 0 || ft->signal.rate == dwSamplesPerSecond)
+         ft->signal.rate = dwSamplesPerSecond;
+     else
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index a79fb15d39..38566735bc 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -30,6 +30,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=751419260aa954499f7abaabaa882bbe \
 SRC_URI = "${SOURCEFORGE_MIRROR}/sox/sox-${PV}.tar.gz \
            file://0001-remove-the-error-line-and-live-without-file-type-det.patch \
            file://0001-Update-exported-symbol-list.patch \
+           file://CVE-2017-11332.patch \
            "
 SRC_URI[md5sum] = "d04fba2d9245e661f245de0577f48a33"
 SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3bb55f6c"

