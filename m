Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBC8E7AD44
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 14:02:31 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.138944.1766671346397742112
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 06:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BJNf/201;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477563e28a3so41157495e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 06:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766671344; x=1767276144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KLvi0AvqGgC3VLmCrl0IWZ80AThH/tJrJ70ng1vgphQ=;
        b=BJNf/201xB3niUt5u+iSrQhaEnKfImWeKbpneGNOBSobk7PEQuDlLZP3o5lhKjGwR/
         DEMWG+1yhQxD5YXWneU5s9fTA0dGwuUajZO/ctDnTMHg3ZD3ChYYH3jPr3VN0S65Ddbu
         yumhBxVGwE2OqP1flVvLNSyBQJlkj7TXds1otqevWdzmqtKjFpuSCuUiRtD5yEc6kF9m
         K3LutDcA0EsYCR1dQGZx/90SlzEzljIvmsi8yPK5I3fEWyNs8q7u5HEs9xoZ3kGYsGsz
         GH7qYpTm5loHmTIB2zDif+VMMMVAFuImYKtwhQ9TqICckjPAlb7H1vE6ScLv+S9WYXNl
         m3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766671344; x=1767276144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KLvi0AvqGgC3VLmCrl0IWZ80AThH/tJrJ70ng1vgphQ=;
        b=wcu/aspXMirDIUr20ztcDZhCi9JN00CukIx4/Nbs6fg80HyX+dOWbqG9EF87kQcNiY
         HeeDjz1/a2nbLfBPvwunPd1/1FNA4bUv1/2exCwGX6/GmviKXr0Ej+S6DXGYepV2Bm+k
         M+LeGVB8UhFudB9e087bUfOuyMIleNX0vHYc0+8r/24n7Sn0bUGyOElXFRoQ5JGQbCx+
         3UG86uUSll1TRrkfg+SyJoO9HFLZXd8EeFMJYQgivPr0KtBVh2tI8CbOUjfNX872xbY2
         AVi3+/wydsXA7TW7INmt+E9LzMjGwL/Te0pat1AbhN3xnZ9e0gyiOQo6d1819eIQ5BF/
         dOsQ==
X-Gm-Message-State: AOJu0YyVtE5XXePctdG8PdULmhrd7sUTeZuVwWVmKmwt/cFhszG/htCp
	6kS8VwbC8g8XgPMWf4ciPiazV9My7jlgDuHPitVpZfpTMwzH9BDxaNw9nRnGhQ==
X-Gm-Gg: AY/fxX547AF/e8vRQOLqN/0OnKiChFxZoVSseaF4qtflIDO7ow6D39LwjPHnkiZV7Zg
	kROiBN3N78dOKYu1WVRwFhhy9+i2I4J17kBfMFML/Zfp0L8IGiaMhsJkkVQazz3Ub4IdtkTdXKo
	yMGDSOA3uS7BG2iFg7EJe+SEFvTh8MIsbUM+EUa3+WdhNH4q1yLwD4NDEsuq2eqotzq7rcSlOLE
	WakPz/KNqPM1a/i0sXwTq6vAc2QUnomeJWwWSW6ZnYbzjHrK04z6HM1B+x9C27av/MFs8oDsNDo
	adSGfrRQkX10RDcBBHfdrCb+IjDu1nTlQ6frn08SmqXcyPXQO/hKTCTvllKGXMnuTxaK6EZNGZO
	xhVp9LF9GhGTOFhzQ9ajZjBoMwMdiuVN/OI18jdQRBYd4hIlSPqbSJCPwur6mmpM+dkgfoqfjDY
	GUtscCFM4w
X-Google-Smtp-Source: AGHT+IE3OmKjDd7h4es7Dx2qJxWvYagR17mR3BsbdrVK+ogj8448uNRXW8pXuJXZ7RpEHEdI53m1Fw==
X-Received: by 2002:a05:600c:19ca:b0:477:a289:d854 with SMTP id 5b1f17b1804b1-47d18b98f87mr213046155e9.5.1766671344376;
        Thu, 25 Dec 2025 06:02:24 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27c2260sm388573965e9.15.2025.12.25.06.02.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 06:02:23 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/4] snappy: add CVE_PRODUCT
Date: Thu, 25 Dec 2025 15:02:18 +0100
Message-ID: <20251225140223.3015168-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 14:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122922

From: Emil Kronborg Andersen <emkan@prevas.dk>

If CVE_PRODUCT is not explicitly set to google:snappy, CVEs are
found for https://github.com/KnpLabs/snappy instead.

Signed-off-by: Emil Kronborg Andersen <emkan@prevas.dk>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b888130e957eb4fe9d69fd70f3b3778ba980b728)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/snappy/snappy_1.1.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb b/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
index 0d58345d7a..9e0e43ce8f 100644
--- a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
+++ b/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
@@ -24,3 +24,5 @@ PACKAGECONFIG[lzo] = "-DHAVE_LIBLZO2=1,-DHAVE_LIBLZO2=0,lzo,"
 TARGET_CFLAGS += "-fPIC"
 
 EXTRA_OECMAKE += '-DBUILD_SHARED_LIBS="ON" -DSNAPPY_BUILD_TESTS="OFF" -DSNAPPY_BUILD_BENCHMARKS="OFF"'
+
+CVE_PRODUCT = "google:snappy"

