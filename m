Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AB3D5B86B
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 19:33:50 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3191.1765827224959498009
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 11:33:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZaHSneBU;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4775ae77516so46269475e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 11:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765827223; x=1766432023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YQTAlcJ9FgARnvD3PfOtmqXQ5n79fLjc252bLEo35ac=;
        b=ZaHSneBUZsJy96ir6y54wI9fjavnizOOr9d2dEgZ+6rnucpr9SBOIwGs1EXOzzCK4j
         01Geg6Er/TKJfD4Kk1NXWvVmdc4MI7kDwraCJ6w+UEK5yTKnYv7xDz0LNukdLYwEH9A2
         ypx2btdl9reWnl/87zWkgRVQzKaH00egIiz5XGg+aHXnb5R2YeM92S7/oST7YsuYIrP8
         TAioVOqgO1ZYjvoMOrTIdGPi1ydZDJG2w4Z7kUGlAZ92ARdwz+wVNVA9f0NoA6/w4o5W
         g3SY9RYPEeL2pdKRcsksnGnB89GBEmpdjyycK2CZEpgKled1J+841oV5tiEYca/c2nZ9
         r46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765827223; x=1766432023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQTAlcJ9FgARnvD3PfOtmqXQ5n79fLjc252bLEo35ac=;
        b=bADT8SJaVx/okJvy5FV5SCl7BxSuEb3Cc5J8fhV3m8RzTvX1azTxPugVfGofE9DvCO
         f1r96IPqXwEhWvGWDsVY7HNuTgQi4krVcIOFyYLVcqindf7rOiqIl8hAGJhOP5uUHX6T
         dr8G1PHhdU9BbPkSOKZStvGeEII8muuXT5RCjjgSXI+r+56FDcsCDrd4i7LcKF5nzkcI
         EedtcueIhR4d6WOOXNtEVJXG5i/4AbwpcHtODQ8EvkNcUMu4S1NZ/HpGvTOP2Uzkm/qb
         UjX5NNfUCjrQnmXfPymtAb3uAuOXUWPrTe6zhkFg0I23WT4POydbvWhvgG+8OVggfbdM
         R9og==
X-Gm-Message-State: AOJu0Yw868PV7IaurEWVhwGzqLXaTXfzmZs65tVj9AKcbEBSnfi6syUt
	Vks2uXzPPATXgvGwRFE0rzA/ZaJ9DbSob/RdP1ceOKpxq4s221Rln7KJgSFKbg==
X-Gm-Gg: AY/fxX4jRxotwpVz/ynelb/Y+M9Ze+Mi1tQuPs2RxZQHjPqYirJLQQtVuRmSqLDbKl2
	RYeKTi2MQXf9HMep0X5xGVqTRHgrpWzELqc6I+d3wPXWC3jHLqmqL0W3kNsEkFU5bN/nItrt3t9
	QsvwJluPf5WulcDVpxzpKNGJqFjHb5rS34tXyT7KemHn8nUYq8KaAUQ/xRorInP0P7/yp64iyxg
	iRSiEx966bD02oIQtH6ALX8b0fhEV3M6IPvaf0bJkvjJftLrpponffqs7uP9f80GPGQ7i3ZrE01
	C5cKZKwui39bFVskn7gUedhbUNhBnPL4AcYc9uIKgezUlAG/+DCwY9kJLTkN6fCy/jOTa676Iwb
	FXY0ppL+y+obvdswNZYZ07xgCb0ZBUlD+i4v4y0y560IlyUdQIdL2N3m7eX/zHsFI5nLuhyWmIU
	valzbMcvtG
X-Google-Smtp-Source: AGHT+IGVI6jNI2Mro1H1bdCECXTfUv0HSPf4mhsfcAfRGscYAU8f/waLEgpqTeJsuNGxYWXS/XgzvQ==
X-Received: by 2002:a05:600c:444b:b0:477:9b4a:a82 with SMTP id 5b1f17b1804b1-47a8f91561cmr119048875e9.35.1765827223156;
        Mon, 15 Dec 2025 11:33:43 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f8e90f2sm198728625e9.13.2025.12.15.11.33.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 11:33:41 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/2] audit: Fix CVE_PRODUCT
Date: Mon, 15 Dec 2025 20:33:39 +0100
Message-ID: <20251215193340.1057380-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 19:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122668

From: Shinji Matsunaga <shin.matsunaga@fujitsu.com>

Fix "audit" set in CVE_PRODUCT to "linux:audit" to detect only vulnerabilities where the vendor is "linux".

Currently, CVE_PRODUCT also detects vulnerabilities where the vendor is "visionsoft",
which are unrelated to the "audit" in this recipe.
https://www.opencve.io/cve?vendor=visionsoft&product=audit

In addition, all the vulnerabilities currently detected in "audit" have the vendor of "visionsoft" or "linux".
Therefore, fix "audit" set in CVE_PRODUCT to "linux:audit".

Signed-off-by: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e87e51da49fe121be8f6dd4cec3263a345f2f876)

Adapted to Kirkstone.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-security/audit/audit_2.8.5.bb | 2 ++
 meta-oe/recipes-security/audit/audit_3.0.8.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-oe/recipes-security/audit/audit_2.8.5.bb b/meta-oe/recipes-security/audit/audit_2.8.5.bb
index 347c855063..c8f235b1a3 100644
--- a/meta-oe/recipes-security/audit/audit_2.8.5.bb
+++ b/meta-oe/recipes-security/audit/audit_2.8.5.bb
@@ -107,3 +107,5 @@ do_install:append() {
 	# Create /var/spool/audit directory for audisp-remote
 	install -m 0700 -d ${D}${localstatedir}/spool/audit
 }
+
+CVE_PRODUCT = "linux:audit"
diff --git a/meta-oe/recipes-security/audit/audit_3.0.8.bb b/meta-oe/recipes-security/audit/audit_3.0.8.bb
index c17899d4f6..759d8a40bc 100644
--- a/meta-oe/recipes-security/audit/audit_3.0.8.bb
+++ b/meta-oe/recipes-security/audit/audit_3.0.8.bb
@@ -113,3 +113,5 @@ do_install:append() {
 	# Create /var/spool/audit directory for audisp-remote
 	install -m 0700 -d ${D}${localstatedir}/spool/audit
 }
+
+CVE_PRODUCT = "linux:audit"

