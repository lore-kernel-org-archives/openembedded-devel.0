Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4688DCCF9F7
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 13:40:58 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.6299.1761745256790227401
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 06:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j5eR5Syn;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ee64bc6b90so5272869f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 06:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761745255; x=1762350055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/bcQ1dv2VZiYMl1WeanZq18l31UsUtGMofU+OPj89MM=;
        b=j5eR5Syn4Rn/0CQcEW3bWNQU3UVRogSEQL3Ap4GGPbUySSQVFt89VdDz92JL0ehi5f
         zIfb/NjtQZYkORhdfoR35UiS+ZcGjiQD5fN9ezTGGjimcCNrXMmtdi2OnCcjFDMORtRr
         j+WXhFJwkjN+tI0DhwiFdUwzQ2251LSuKD9Sh++05RkwlWUX+hoP5ok4HAq4fTt3U1hK
         FWGSZo9IL3PzbRZHVRkxb3L3A0pvo2G8O271ttFDSt4seMifkVQG5duON+wJFB0davS2
         4YZrtivzAYOVQ7wtQxdcRArxjcCRe/JbEVSCq25Exd61PyZGCEuuOlazougvLB/42t3P
         J+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761745255; x=1762350055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/bcQ1dv2VZiYMl1WeanZq18l31UsUtGMofU+OPj89MM=;
        b=F2dr38hM052r6s8K+RjdjuaMc3HlGqz8K/YYerNenfCFzejQG+2ePmo8FNf29o357h
         nYAAya3adGjV+th1valRScjdpY2/1mtyqCo5Yp5iyCDzusb0ca71ZgIYbornceCfpusk
         ll+v19t4mvFF9CpkBoTgjOlTVF7lJL4M7SW4UJwqKtCymOf2WbHBtVCTlTwPwxyMrPFo
         y+pM7+5o+8UbtAOLc18QhXcYMDgGwZWPY3w59YI6lc/Ipgob4zDegjBa9qK3ZlNVOr6I
         SIk8FvHWhJ7Ns46r7NBTIH+Rwfp7Cvsy6OrrcZiKU0H07dcNVjFKOaRe7w31WQOspIqM
         hGGA==
X-Gm-Message-State: AOJu0Yzx+Km3FUfrEVgHzyeTUvS/qnGD4R7oIM2cW7Ur7RJQ2ScDXb+0
	hFBqJSjAJ608TYPDTlrlMDIYFN9ubnnwMVLl6lATl8udAUx+9tjQwPEFVuU49mTo
X-Gm-Gg: ASbGncvNNR9FXvrKeSZoRA2tUlvw1t0eLnVbeMP08OrIg6z063IiUKTtPbSyrkUnW80
	c1hoJKPDnITefA3yQSojjTXch40GYfgI0pYLHZbApcbQ+SFdHl7rpX9jhCveXrg4lj1CZxdo6ZT
	cxGXP7tz4QxqOD0r8WH/merd+I+HVEopWkSz5ScCaGv+WQ85zI9ftlO5A4ApIG3SXerCl/VBcVY
	ZbWTUQNMUgsYSMLvxdZ1ZC0MvLUyNGQOAjNq7iUpWRLdcbPXcmtAzLWiDXQVo0keVh5OnUum1Q4
	f/LlKuUs6EtcwsWsvCRETjErymW38QedUObMPRb0AKhX3Yg/1SVoL0TRhLm/T1ncDPI/3CD9udy
	3DiftlZl7p/zrlz0qq/84qnHg8Qg9J7dx2D/uxifCa6KC3CIkcXXavCssVy6I6WC6mgMJbn8VRA
	==
X-Google-Smtp-Source: AGHT+IHvkC6Fv4EBUmU4yjhluCdZvhK4DBvu5aAJHRbMUaBtedI9QMe7eUMxtTVq91qRLKjUCWXCmA==
X-Received: by 2002:a05:6000:22c1:b0:427:921:8972 with SMTP id ffacd0b85a97d-429aefd8373mr2438651f8f.40.1761745254978;
        Wed, 29 Oct 2025 06:40:54 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d5678sm25950484f8f.22.2025.10.29.06.40.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:40:54 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][kirkstone][PATCH 5/5] libcrypt-openssl-guess-perl: fix ptests
Date: Wed, 29 Oct 2025 14:40:50 +0100
Message-ID: <20251029134050.3455088-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251029134050.3455088-1-skandigraun@gmail.com>
References: <20251029134050.3455088-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 13:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121156

Add missing dependency.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
index d64fc296e2..9790dc4c63 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
@@ -32,5 +32,6 @@ BBCLASSEXTEND = "native"
 PROVIDES += "libcrypt-openssl-guess"
 
 RDEPENDS:${PN}-ptest += "\
+    perl-module-english \
     perl-module-test-more \
 "

