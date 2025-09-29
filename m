Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A67D1CCA468
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 13:04:35 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.53203.1759151071089378283
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 06:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bhzoXpnq;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6364eb32535so1065494a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 06:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151069; x=1759755869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1yM6lZ8BEden+KDhisVozyNDOiLzLX7XQjudrr4VA/Y=;
        b=bhzoXpnqGZ02c4z7TRuRD/wy26/zgazQq9TZ//umx5Zgx/l0yw+hBYcte4LBtwIbDK
         eFFavvOtbk07afy81SfUHqoEeXjALr1KgPMfL1jBnZC6Ah3fZxHbYC95ohGcgZ4cVVYk
         KviV4YRK4ElEK4gTVIgYl2f4bEfqlfDffpknX6kjbMXtqE5ir7nRRU+wvFIGzfMgJTc0
         3rN9TfV81ks+Fg0JYfUXUgyk+QmQWXW4OTteGZHCiPKZ5gm9coelug8esh8AVx7uFiW3
         84W7/QYLkk49lJwoAR4o7QslOXxHB8dx4oSDP1EuQma2aAaJwq8zPWqA+HtMasyNPjmC
         8RLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151069; x=1759755869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yM6lZ8BEden+KDhisVozyNDOiLzLX7XQjudrr4VA/Y=;
        b=ucWfDC7Ar0tUK2+FJIvwCz9LcJea1pVduCL1j3G2uNO4eOBoy3vISN2RUOeNpu5dpf
         Nym95pvw9XdwP8sMDiuuJqZcdw+o0p+Dfe4RACGrDorj3V+88/zPYmAsEF5PISm0X0z3
         lTSeoY44o9Sa0ZsM7Zksf2uDR1HLHHeru0plomRPjEE1SPCOXLPkLErnkiDhiV3CN1xx
         1V9dM15DZnlkda1+hvmrwvadvG7vWCQfysX5Ze1J/WlZea/0ELOCSDXREl66HDFNgFKn
         aG16X+loDXv+zSNlOIy5W5q/0uqvwfHdr70Hxfc0ZdNsmkDtOVCbWDUxaUBj4ETvKd1z
         xzUA==
X-Gm-Message-State: AOJu0Yw6HYrC0RolXiKsO6k/yiMSJ4B3SS43SjI9+258t9HM42qherds
	Een8/JuFEDht4O9b3bSeahfWRCkJ0k/VZjW00qUQ6p1vFZSNRsNVDd/m4bGGNA==
X-Gm-Gg: ASbGncsoLofIj6XFYOQnAo6QHrYexOh17vKBh/xkyTls0YSfVZgc2SHQx+w/YXcyr+3
	oB6XYTiwdzGeKAJmzO/vqFIS3T6gPqNgmIvdxR6dlE0HnjrATV1vnHGoPeNnuKz4aoDJWTT4p1p
	EXlV/w6jmKGJpPPAnvi2erTvNvMsV9TajE6ckyq3tLINfPnZkxeWvU0x/E9GY3ABfWzpHwzuMfN
	wAAOglmUsSHAuyvkhXOiImwqPq6Pwz4/AZysZqrcXqxJ26u/dFRPMKLPJHO8dOkh/h/+aGSmxWF
	mxgCMQEofxKtdrnJImCHSYPYK0grDSOapmMK3rnvJuHSNYgaC7WEnmEHhz0Lsi0Q1ljztlVHZui
	KtTnW83T9Qd8eXH0vV/5N
X-Google-Smtp-Source: AGHT+IH60wadwHAKxHolvF88V7YP2pIdEVopiyWEEjg9vmKV4PXEWbm63utR9OgxONZb9Una7J9KcA==
X-Received: by 2002:a17:907:3da5:b0:b3f:1924:c25f with SMTP id a640c23a62f3a-b3f1924c3bfmr388844766b.3.1759151069343;
        Mon, 29 Sep 2025 06:04:29 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cbd81bcfdsm335426166b.82.2025.09.29.06.04.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:04:28 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 02/22] lksctp-tools: upgrade 1.0.19 -> 1.0.20
Date: Mon, 29 Sep 2025 15:04:05 +0200
Message-ID: <20250929130425.2912077-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929130425.2912077-1-skandigraun@gmail.com>
References: <20250929130425.2912077-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 13:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120015

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog:
https://github.com/sctp/lksctp-tools/blob/v1.0.20/ChangeLog

Drop redundant variables LK_REL, SOLIBVERSION and SOLIBMAJORVERSION in
recipe.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 162039c327f065d87730565b18fdc3986844a065)

Adapted to Kirkstone.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...lksctp-tools_1.0.19.bb => lksctp-tools_1.0.20.bb} | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)
 rename meta-networking/recipes-support/lksctp-tools/{lksctp-tools_1.0.19.bb => lksctp-tools_1.0.20.bb} (80%)

diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.20.bb
similarity index 80%
rename from meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb
rename to meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.20.bb
index 4a9d2f54d9..51d9605624 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.20.bb
@@ -8,10 +8,9 @@ LIC_FILES_CHKSUM = " \
     file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e \
 "
 
-SRCREV = "05b50d379ff0037de4957bb2a1befcce88b70225"
+SRCREV = "311fcdeb5cb41612d4be66b16f0f2ad6675a6af8"
 
 PV .= "+git${SRCPV}"
-LK_REL = "1.0.19"
 
 SRC_URI = " \
     git://github.com/sctp/lksctp-tools.git;branch=master;protocol=https \
@@ -34,19 +33,14 @@ do_install_ptest () {
     done
 }
 
-SOLIBVERSION="${LK_REL}"
-SOLIBMAJORVERSION="1"
-
 PACKAGES =+ "${PN}-withsctp ${PN}-utils"
 
 FILES:${PN} = " \
-    ${libdir}/libsctp.so.${SOLIBVERSION} \
-    ${libdir}/libsctp.so.${SOLIBMAJORVERSION} \
+    ${libdir}/libsctp.so.* \
 "
 
 FILES:${PN}-withsctp = " \
-    ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBVERSION} \
-    ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBMAJORVERSION} \
+    ${libdir}/lksctp-tools/libwithsctp.so.* \
 "
 
 FILES:${PN}-dev += " \

