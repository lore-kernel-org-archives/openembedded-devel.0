Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78AC9FED9F4
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 17:23:52 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81720.1773768229524875238
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 10:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IlmY/lOg;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4853fd7b59aso37755065e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 10:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773768228; x=1774373028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RE7/1RbLB5OiJ5XI1frqtwG8TkEEOZvFiPU6zLmXC2c=;
        b=IlmY/lOgxWGbQQl0dBMhMuPdZkMBJ/O1leUR7EBYAqd4v6VnMtvJ3ilnu4M0NiAYCc
         uAQ/CT9eiIOMb3oa7mn8rSjffcoRxikz4ZhpxPXdEpQw/H0wiquwYjOc7PpwR0VK+BGf
         nQJGI5ruBcoC5n+sPYHQdweYgBCDTf4iX3okjqHh/6KoID9IABDJHePnc1hhM8W8w5o6
         QHbNt9eoYZ70JzLNeXzyZ27uHMuo0jvnxa1Q7rRTsIhvpRMFvcdjfKYIBgBhVWc5uOWg
         uQudkevQ+Hr07iZBL8o9eFp3e/A446FYh+kGzLY4QusJD/3hb3yBY901+em9THGWkQap
         kKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773768228; x=1774373028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RE7/1RbLB5OiJ5XI1frqtwG8TkEEOZvFiPU6zLmXC2c=;
        b=i0hm/HL+WPVImklUMf0q39SE9iTPHkQPqCmiC47VfaQUoCCsPO6a4mGq56L5SYRh5F
         Ree6wu1dFnkJI3T6AqUjxdLr7s8GUMqcNfcVwbdmVjcp43ga7Xs0bd4lsZ006K27j4tl
         FHNS8URbAzB+q/mRH0oonuQVn7nPNNEgjff1KZ/7JkqhZ20IJaJFlmIWRgNV0NiJdnVh
         Y2B2jlUO8OX4z+8Fcz3Ud+Ka3v8juJg9Af+PE8qnGoxfdtJTp69ami+SlvIglwsi0ejs
         vHRwwRKHk9aF8bhkF6fp8646PeDUYxUxnwr3iV3uC35swVdbh6W6kYPdnDD04xVfxwmw
         2ERQ==
X-Gm-Message-State: AOJu0YydOEVUwW0uSz9fSV0JVpMXUz+tbNiTIGdpH7TebhmY/GwKrFTz
	BNvfI/eelvnnvgp1CH5O40kbSZ4bNtf9PJ99mQiPz2+UqXWEz0cgH5V0EocPYA==
X-Gm-Gg: ATEYQzzrKmn1XMiaZeDZ9HJhh7ZR7fnJZ6VZvuu2TVLtDD9nfi6/2lL6uQncz9mG9ts
	nsGiQE/hj6aj3tVvt4yv/Ht9mbQq7L3++e8pbIiPwmhiP91kfAJiiGYIXJjvPZGhUH+K2kbEMwx
	95NBaEqs7syNLMjckLUJl4mL4JgX3IOPVeNJ9GmpSZMJJFmOL+WYed5L1dSmIHGg9EnwedGzRwK
	3Zlso+tlbeWc+01mshOCNTZVpNQh0thj7pSfXr9yQLtPiuy0LxwlS6AaKCghLY+/ygxCQVaejWJ
	BFm8WxfvkYdiNY6W0KytnDiRsVBx8IkiKkXrq34RXAE91Wz8iMWr5J9ctUMnvMzDsDxpWVqdGKL
	v1tsqhGAuB6zFK5RxIOp/Vnx2f4fPtCZFXqukVK942fWTr1NhyuQg5jXS+b0NqxZX/Yfdao569G
	g0z+qD4rIrDjT2kEjC5c9rwe5mUilLPps=
X-Received: by 2002:a05:600c:46c5:b0:485:419c:4eba with SMTP id 5b1f17b1804b1-486f441fbfcmr6238275e9.1.1773768227395;
        Tue, 17 Mar 2026 10:23:47 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48634a7ac93sm61717385e9.2.2026.03.17.10.23.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:23:47 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/7] libsodium: mark CVE-2025-69277 patched
Date: Tue, 17 Mar 2026 18:23:40 +0100
Message-ID: <20260317172346.2862459-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 17:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125323

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-69277

The vulnerability has been fixed[1] since version 1.0.20, but NVD
tracks it without version info. Mark it patched explicitly.

[1]: https://github.com/jedisct1/libsodium/commit/f2da4cd8cb26599a0285a6ab0c02948e361a674a
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-crypto/libsodium/libsodium_1.0.21.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.21.bb b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.21.bb
index 9f07634c41..a1647d2a30 100644
--- a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.21.bb
+++ b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.21.bb
@@ -13,3 +13,5 @@ SRC_URI[sha256sum] = "9e4285c7a419e82dedb0be63a72eea357d6943bc3e28e6735bf600dd48
 inherit autotools
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2025-69277] = "fixed-version: fixed in 1.0.20"

