Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3981ECCA476
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:53:08 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.18628.1759326786183153971
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JAGRha3w;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-61a8c134533so13685431a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326784; x=1759931584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=naeHL1Pl+emxrSf0gOO+08qA/y21uqlSMJB29cKn2E8=;
        b=JAGRha3woFcIbvtnnZhDts+nmwt3IZ2elzzN3bUAII5ADNl7IntGl+8qlU7YHZWzHH
         DVXoD8/IYkZIugMhwA88klErQ4XSugTirh90F0nXjvdCzF70p8yMmW8PgYRXlM9WW/pb
         lnVBERNr3s79mHW+PA2e6O1t1RxsQibELiaL0rVxgT/9frCUM4ctj1XtfaN5xlYb3Zdc
         SYvQNRxY3uVFmKu8HME+FhZLH2MIozJDmUM9ZuwXNGYt5p4IinjOtEeDhjctA3pfaYXH
         fLF+6lSJhCa37We1CYBW9XHEB65nvqKFrOwUhd4JyGuu50bq2FJRLim4xMOqf2QQlcI5
         +vwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326784; x=1759931584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=naeHL1Pl+emxrSf0gOO+08qA/y21uqlSMJB29cKn2E8=;
        b=ldoX0uu0gKBtrR5E6ovE9GZymI13vBct6hXVZXQy2/MuO9k67TgMBTocsM4N5q53Rk
         HU/mZ3mzetKwuiqtjFc54iZmi0FXhvIsfjTBypSFCLDuw67eNYfyIqq3lm16NOFgoQGv
         dxqeXTwAdMsvDNrouOibFdhFUbLesBNw1Q9tHNe7d34xOJgkqXiK6Y25VGdZRRnmf3HM
         tvXKqRw1Tl3byVOrGo73dVDU2EOzIYuAuUKk+xp/Rvgh2oQ1oJLRa1YquXf8KR6jj4wd
         xbto3RRIp64nwbyBa0xG6d7fhmTbqTc3YyLEY7JwRu+5It0yKcABvd9NkBmk863+Mzjm
         vlAw==
X-Gm-Message-State: AOJu0Yzt0MxGYV6McIPBqRCuYUmvNk9LtT88Yo1w4PdKurvtck/sFzQc
	SC0/mEg1JiUfpHZsk2IFUXm9sRrquKdkXvo9TRuE9CB4vwGxeVkbRMjAFvNMgg==
X-Gm-Gg: ASbGncuTitZHquaLKt4xRZ8cIygGT5mJoYSNkmqAc6M+IWPzIFSEzpZrbCpJnb9g+KE
	M3wVKzhfstB1Y9w820Ug1hjAKe08khOQjoIHP/KRNDz3dDVp/r+rmAo1DYRltzj7spPHbcJuNBg
	D9qOvQ+tuc5KlxLepguN2N77VxeDUH9URAaCaAfFwUvrP86V5cuDhTRJYjonjMTwDnHhODKsMBy
	+kp1pY/w1/+zq9bHxFGmYu1H7pxcwxh0pSjLTuqBvXWVZq8yqnUhKK0Vt8gCe3yb+Yq5j1GfW/2
	ocPxVqotX8aCAyVcmZoHUyLg0rQ82UR/hKIDSAjxM342PlBPEBVdbUYWiArVU2katDJtOnkIkJu
	fMF5aAAKg14pZE1oCUHaTtIr4Sx20kAHrTZdGLBYQQL8q
X-Google-Smtp-Source: AGHT+IFoDapFpceVv7bV1bKpDsF2jGAQOw+zXylUIvLhGcqancZ4bg4EVRZHdguxF8Dbq95td+CKWQ==
X-Received: by 2002:a05:6402:348a:b0:632:ad83:aa3d with SMTP id 4fb4d7f45d1cf-63678ce68a1mr4318103a12.23.1759326784443;
        Wed, 01 Oct 2025 06:53:04 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.53.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:53:02 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 23/25] python3-nmap: add missing run-time dependencies
Date: Wed,  1 Oct 2025 15:52:41 +0200
Message-ID: <20251001135243.1490753-24-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
References: <20251001135243.1490753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120138

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e20ebe6ce4f8b991cd4f153352274850d416f090)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-security/nmap/nmap_7.80.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/nmap/nmap_7.80.bb b/meta-oe/recipes-security/nmap/nmap_7.80.bb
index 030f033485..52c62cde30 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.80.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.80.bb
@@ -59,4 +59,8 @@ do_install:append() {
 
 FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR} ${datadir}/ncat"
 
-RDEPENDS:${PN} += "python3-core"
+RDEPENDS:${PN} += " \
+    python3-difflib \
+    python3-asyncio \
+    python3-xml \
+"

