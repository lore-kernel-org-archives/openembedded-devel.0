Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE50D25051
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 08:36:22 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29253.1768206977565795907
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 00:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZVvycRyM;
 spf=pass (domain: konsulko.com, ip: 209.85.208.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64b7a38f07eso9458988a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 00:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1768206976; x=1768811776; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnA+0QiFRm3xGcsk/iZGF2yoMYJBbBmJfb48sA5F2w4=;
        b=ZVvycRyMfuAYATpQBmgc8yAI5K0DlHI6arauLpIvyZXPmyKB7+TtkBci4G0hhZlUYQ
         4EIUzr+vi3fj9KX6+OBRfFy4Z7YnBMOjGGkyyYObTa0S5L8TpUAqs5bPTbWi3YMPnXXp
         Bsanj6kim1PB+WEl5iqH9eZ/Ens2LspfVQu+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768206976; x=1768811776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hnA+0QiFRm3xGcsk/iZGF2yoMYJBbBmJfb48sA5F2w4=;
        b=bYyiTFX3lEqFgzI2pFH1tXh2qTHObMpqvzdxPBmpZwCCs1my0K0C17mcET3mKs+OLD
         0jVj8hob1dOQw7BpWm3v/kNSI4sKG86r8ylY4/rLmck9tv5OFM6MJHDXLHXkhXgU8wb/
         UPOqC12d6EdRqIdqSn74iXOpDz8b6PttG9eomcn7OuwHqV3VW+lwfcCv8YH/QlORTIeg
         NLZ3ceSarQS+EaTFSOcpmiAA8ekMXEEn2JNJAzKnz9RgnWQtt6jkpoM2IR/KqUY3ZLrA
         pqun8phmLJmECBeIQ50mTIG/uMMuC84VFl3OOQtixHubF1LWWg3vkq7SbN09XkZc3Vlf
         EvuQ==
X-Gm-Message-State: AOJu0YyY6Bfu2i1qWYPtiPQw9oJbSqXkXsfDI02GAv64U2EdxQ8bxRx1
	ZGG5IRDvbI0kghmza2b49vtBZBf19ayCacbdBAaY5Iv781cjiuVxv/1KhHcKFeZ71T5X2tmfHBf
	MJN1p
X-Gm-Gg: AY/fxX5hfd4cbzYJfYL5XwW1H6rnU8BUw9CqqOUtR1A7wEuN+eCL7M53Cal7uxnob6z
	u0TkURkYGM9VTdyLnmgAjfEcppO1Zmoh8GW12Gay5Wp0jN/dHfaV1cmzhMzh04dKHUFJ7PVbPGR
	lZeEiMlG4q7yaEf900gqnA/U4nOgg0nh0Iq3/PFb2otTwtPMj6AE2LZ3S4K2/H4sGAOPmtgwlfF
	Sk6tytdocN5I5exW2hjFk8n+nnRlfaawZmv0wLtlFt8l8R19hjtFNPApUj/3UUQrH9X43aR5+VU
	nhJoSk0aq9ObJXCYNhaSswLX/c8TZtqfiNtsxxpkLEGPmc6VH+KVAbIeUeIu3XU306YuAq54Ky7
	ylYr8O+ow86HVK77/alo5adQ8PtUUQARsj4hgO8DF41ITI/mdtRAjZucYCe9CKziO/pF3ttIJu6
	GnScjlwUolFvkapv/C1liCAekl
X-Google-Smtp-Source: AGHT+IHf4bIx3FtYw+Ob31iIgfsc5jRzES+8SDJ5U1ki621vuHKQiUF0andIBYDorr0m1Z08x7aaiw==
X-Received: by 2002:a05:6402:42cf:b0:64d:5693:3e7c with SMTP id 4fb4d7f45d1cf-65097e71766mr14303029a12.28.1768206975674;
        Mon, 12 Jan 2026 00:36:15 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6648fsm16971938a12.28.2026.01.12.00.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:36:15 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-aiodns: Upgrade 3.6.1 -> 4.0.0
Date: Mon, 12 Jan 2026 10:36:11 +0200
Message-ID: <20260112083611.4017493-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112083611.4017493-1-leon.anavi@konsulko.com>
References: <20260112083611.4017493-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 08:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123368

Upgrade to release 4.0.0:

- Added new query_dns() method returning native pycares 5.x
  DNSResult types
- Deprecated query() method - still works with backward-compatible
  result types
- Deprecated gethostbyname() method - use getaddrinfo() instead
- Added compatibility layer for pycares 4.x result types to ease
  migration
- Updated dependencies

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-aiodns_3.6.1.bb => python3-aiodns_4.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiodns_3.6.1.bb => python3-aiodns_4.0.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-aiodns_3.6.1.bb b/meta-python/recipes-devtools/python/python3-aiodns_4.0.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-aiodns_3.6.1.bb
rename to meta-python/recipes-devtools/python/python3-aiodns_4.0.0.bb
index 4d40a0e486..2f4459d338 100644
--- a/meta-python/recipes-devtools/python/python3-aiodns_3.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiodns_4.0.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/saghul/aiodns"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d574ab425d1fcb37c9f1ad3961f18527"
 
-SRC_URI[sha256sum] = "b0e9ce98718a5b8f7ca8cd16fc393163374bc2412236b91f6c851d066e3324b6"
+SRC_URI[sha256sum] = "17be26a936ba788c849ba5fd20e0ba69d8c46e6273e846eb5430eae2630ce5b1"
 
 PYPI_PACKAGE = "aiodns"
 
-- 
2.47.3


