Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBFFE63CAC
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 17:06:33 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42800.1769360788580442057
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jan 2026 09:06:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JuplmH2Y;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43591b55727so3648604f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 09:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769360787; x=1769965587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUnEeEdwaTkb+DygLjwAdHou17txBGAuR5ms7idS7Z0=;
        b=JuplmH2YsIU1D6uIRo0co7/wo0GW9TpIppH7u5TI9wWWZFIwUrZvYQ33RkN9EhXHCi
         B0E98GjJXgS54fAk2ESee1s2nLKS7w070tbduRPvBmjox1ZhTCnk6WPTuYmPav18f31a
         duOWTKW6OGsVvtfM9eQhKiv+GM2R+1sazx5mT9oofiuOCdPfMtN2cxmFoSem8QrOwMJg
         WDgED/O6s2HZGJMa4yQ+PY0HjAkZM4MOr4sgUxOTD6mWp4+p38441dci+Q+xrYgIrGoW
         nI8Z3chWLGWgsWRG3B49CJZJhi5OOGGX9t1xxKgOCQPhODSn3MGdPrmHnRmVBB2K+Zfx
         3XSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769360787; x=1769965587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUnEeEdwaTkb+DygLjwAdHou17txBGAuR5ms7idS7Z0=;
        b=bqRY0fBKkX0Xytz8VjDtvlsRAda+2hGYnl7pNmnS5yGKdmKqFxyN6K2bKf/wnlO7vx
         I8AEiAMjDPKqAsdwUlbF6zhVYPFlOSnszXdyD2El5udcSgH6Z3RrvHxRTPhoR55zSHFw
         IbV3DmGQ2eUSha+/kGzQ63wgv9kJRFWCof39hffnmuKuCfrp8xln2/gSZLfxWeJQrY+g
         WaFaXxLy1TCr009m8U0HMY6PRY58MBmpQk1vRguVAl2m30X38Zo7ANh7ccKY9PC16Z7K
         At3+KtQZXPouXUu8NHBBQQyO6ma+ujH1waeDFklPFuuTCfOmyNQLnxiUthPBN+PgyDjN
         4X0g==
X-Gm-Message-State: AOJu0YzXVD8rG9178yaMzn0x/b6A3SuXlbKKvWdiY0Thtj5iArxfJtGC
	Yfgefe26uN3lyeUK6lJf4X0lQdtMb80LjEDGaLjP23btoAOEMxAufupVo17/AA==
X-Gm-Gg: AZuq6aJpUkvUcqM9yFLNwveo8UmSVRubZsf3YPnGrmpxsQZcfvDhpzw8IUvnMzwnj60
	hXADO4q+85fNJSFDOt5sYAQ72mZ6N/Cj8gYzfmQh7d3gx1I5m3zXxD9m+PCjxLGZASN87OHEWSG
	LjTnqUH/LEQM7HtsFzjXEv/EOQv/+/V1Xjm6XFmSQRjjCe9MrkCtOFCMqsVhNHnn2FGTZGGVrrS
	yQ1K/n/gMxFOEYB/yJaMMRQnxhHCcUTHpN87BdjPIt0yDvUk1+HOmcKYECD+rFe3Cl/EzQkpsQ5
	QlKnlGYay2/5XCXCv4BQOADmBdBknVBEBbu8aiUrN5VMvIdlo4BiPqLqgSdhlTmHUAu0+T805uk
	iiOfmjS4EWCU8jfBh+ImoYUp4J068G3Ta3UN5W/2Y96WexNlCUmcQU2q9e/GfpC2Ektmwkq6QZQ
	X/WX47tEf2
X-Received: by 2002:a05:6000:609:b0:435:b776:304c with SMTP id ffacd0b85a97d-435ca1ada66mr3104686f8f.30.1769360786651;
        Sun, 25 Jan 2026 09:06:26 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1b6e2besm23431414f8f.0.2026.01.25.09.06.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 09:06:26 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/6] linux-atm: fix SRC_URI
Date: Sun, 25 Jan 2026 18:06:20 +0100
Message-ID: <20260125170625.3178555-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 17:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123840

The original SRC_URI's certificate has expired - change it to a working URL.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
index 3d679d7dc7..b43900a94d 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
+++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.0-only"
 
 DEPENDS = "flex flex-native"
 
-SRC_URI = "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}/${PV}/${BP}.tar.gz \
            file://link-with-ldflags.patch \
            file://install-from-buildir.patch \
            file://0001-fix-compile-error-with-linux-kernel-v4.8.patch \

