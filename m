Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1B8CCFA18
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:21:25 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17899.1763014876747905139
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mM8SOGf4;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo398316b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014876; x=1763619676; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzXwWuejhBM16dCbayxqM3FWUzijolDpmPm4lgEfRdo=;
        b=mM8SOGf4pi+lANOjqaIb+cy/knVpBQF0jPMu9a7RJEnmBWVQEq0CcjB7b2cJwRYRlN
         sn+ExFJ/1xe6+P5WIqmqo8MWLow5gNhfvq6hezO2tTp4NlEgP3LaFytexNZkhEkY5+57
         ayGdM6rXiJI8f3+uGtV35BLPzLu6mTxGzO/nYG/pnFiF7OfcIRQgsfXMklsDYDkV3oYs
         ll4d+GrQOBQy0lHmHNqZ/OdryIJS4NLfVCoX4DG7KugEoirksuspS3UoAUS7RxJNpAET
         Gk58+5nk0you9NrpZ+6L5s7KMww8YC16gn9Q4LgIZiNPM71LChHRsvVr0EiOOVhHqd30
         Nqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014876; x=1763619676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vzXwWuejhBM16dCbayxqM3FWUzijolDpmPm4lgEfRdo=;
        b=U+ujal/EOfq3bszC/LiAibPwfZGTz9te8tjvUKbhr74SWUyGQ5cys1quieBozlzSzp
         RIjWwAF663SmaluJY06xVprD6vUQFEkyMMXl7UeeHkrciCYyoDVs8fZoDzjOijDeqW/Z
         CwqjsR/MQNftppJJLMw7wK2R2SC2ihhPDZ+Gwukbf8j3+Cd+kxKdG7wKvCMcGYGeQFZK
         vj+ex9H5dVgyKVDAq6UVcWOfxGu8xTPlF9Ydy9MQB4h8crxM4kMNvd/KiPJ90kbhm0ct
         mHXpslNMsQwt0fqUCHvtcYXPbQF/tVpk/IRierAymjJdlMMsX44YUfzFZlV4zwDPhcJd
         qrEQ==
X-Gm-Message-State: AOJu0Yxv91SagG+a2bo6lOMzodzvmHmurXW0ZzdPxcxODEIR23t03zcN
	q9WgkpFKeV0uNN9vM4qhLnTq5G9iymZjtkdCOk4nSQeLYsju0fnwn7hewsWRzA==
X-Gm-Gg: ASbGncsyVaxVAtGNeaEgFiLQwsLfqyvgWrHbWkOLvReyEu75eVb71TltnuSp5krqoS/
	WmxZDuuDlARJQ36p+4K67WO3f/80E5tzotG4+IVIHlBtyzdF0X/T4yDFWytCKfWHsoytgjv76Hq
	g0YH4j0ItUczKYHT0C57Vt57qj1zRN0EBxybgTzu6GKyxhkJ8xUduzgpxdZGYa/jJYEjqDWhnNo
	ZYlzpJP0sKWaz0wsYlRv5t/7Ug7nhdaf0E6R2LrFwPCLyMbV5OVw39zAWlLKFxNK+dsqJvUkNDr
	EvSE1o+p0yu3kv64sK3P5sbOONXUP/bnPmLEvvCKw0hXpMo5Wa1rD10wgB3MEV5rpFK59DgazfT
	XEjX7Jmv/HtJ7SzCRJdTV2IkCZJJZmfOUMlnHgM5cTQBTQKv3cdYAQPLIwbjfNWAy+NRURRMz9C
	CTPbhFjsbmGpLwAw==
X-Google-Smtp-Source: AGHT+IH/vc92iD6PsPaYBkkM9CJyaFnayB4Al/7W9IMm3Own5xhVzeJY7yWE42WyuFQ/e2s1EyrzxQ==
X-Received: by 2002:a05:6a00:9508:b0:7a5:9cf5:b34c with SMTP id d2e1a72fcca58-7b7a4ee23b2mr5751881b3a.23.1763014876051;
        Wed, 12 Nov 2025 22:21:16 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:21:15 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 37/38] cryptsetup: upgrade 2.7.4 -> 2.7.5
Date: Thu, 13 Nov 2025 19:19:12 +1300
Message-ID: <20251113061914.3756301-37-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:21:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121635

From: Yi Zhao <yi.zhao@windriver.com>

Release Notes:
https://www.kernel.org/pub/linux/utils/cryptsetup/v2.7/v2.7.5-ReleaseNotes

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cf174f190d75736aaa6c3ffe7e82d86d19930420)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../cryptsetup/{cryptsetup_2.7.4.bb => cryptsetup_2.7.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.7.4.bb => cryptsetup_2.7.5.bb} (98%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.4.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb
similarity index 98%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.4.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb
index a57d79d6f7..54b47ea3fd 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.4.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb
@@ -20,7 +20,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "dce29903a58f7b774fe61191e7e6de955de0f40d9e27b0028ffcf3438c0e9480"
+SRC_URI[sha256sum] = "d2be4395b8f503b0ebf4b2d81db90c35a97050a358ee21fe62a0dfb66e5d5522"
 
 inherit autotools gettext pkgconfig
 

