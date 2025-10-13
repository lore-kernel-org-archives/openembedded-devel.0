Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F59CCD190
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 13:17:39 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.43437.1760361451681419277
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 06:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ozZiZty5;
 spf=pass (domain: konsulko.com, ip: 209.85.218.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b48d8deaef9so755626466b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 06:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1760361450; x=1760966250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slcNdJxaJCxMPjzuo+w+fa54RS/rXalxG0I+zzJUziU=;
        b=ozZiZty50R5n/ZzOmb/45iDatkfWWbA/TbN4FoPvajWOGIF0xfPi0wCBVw+fio89Gq
         Qt5d6x34hjiS3PauTrQU2152aswLFNdGbAkggFL+8UlEhyazCuN+OjJOMEdGSQNspk64
         voCkAqeqNluKaVIr1lWmAzppigFaFw77czxrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760361450; x=1760966250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slcNdJxaJCxMPjzuo+w+fa54RS/rXalxG0I+zzJUziU=;
        b=NqEcwVqZ7JMhQPqDQKJ63VSKixgLc0RGInetRdtE1VJL9P1HR+1bKuAheyjZ0YlMzC
         7PC8gR3xIuLzHXJD7ye0yoZXvQyJgTR1nXxPxwMbdC4Otdy42GgVnWlSLnSjTVIUW/rB
         ZfApBcqO+4PAt0/FOqPMLJGkp2Z1+IOFRzlT+yDhDQmkVa/9Gy/TcaSs0rvqWHWDKdmV
         dyXx7xyY7XdwR/ZM5Dd2SoHmeylWkqjEalMviANdjyBzZTdWChWev93vtbpH4JQ6bliP
         iuK2XE3utsB6TK1Y31WMQXgtNtu0rQ54n4QV4cim81KxJfEPLVEFMAXNpDYaoKQr0h8K
         Vjbg==
X-Gm-Message-State: AOJu0Yx9TbbuUpu5z1WdorL4YPHeAmcnQnTaVa7Ti2zWQBI1P5VoCAHw
	BVAD+5M88gHCydNX3R5fjtWDt9mC4ozMHRHt3fCB8nq6/UCoq3xHHGcjQV9BPX7HeGXycD4Cbja
	3yklE
X-Gm-Gg: ASbGncuOzOj3nswPS22pC2aMwJw3mKpAhsrqDAP+QoCwy33FHq5Wi8APmlKqQkkLUqo
	OdsGY/MGLscs+Q2fcR4SmIO3FBBW8JNZYIjOxhYNdFKzSxYTuvt7NDIz/ZfBaRKe7MY1HguHwt1
	YHI9UI1YPtb8+IRYMFyFGHmlaw/NsLWNPh/1iT3V93JSBgZYndCMIZ6O84vS9mHam/bg+yYpTza
	qSxPTTk0WV40MGkqXyvBjNZme08QScEbk4m++HsEcykcHfFUI1pEfq8fqWbP+ovm3/CkSDTCrkt
	2ImZv+fHDl/yTj8uOogVP9lYrwfKfYKHtMJ1SPvUFf9Xw3sshLZegHwLVwepCYvdfujPQf7fgyB
	hRtB34j2wrAnT+xLaHIJogkokEyjxLjmJLcnQUjEqDAiSVInT3xSrkTE=
X-Google-Smtp-Source: AGHT+IE4Hkvjr/UM3iaEkIK7xfLwAxICOy1pSW54127lkMPZKZ7sbdpC87NiHYNF7i1Oz3b0mHgM7A==
X-Received: by 2002:a17:907:9489:b0:b1d:285c:e0ef with SMTP id a640c23a62f3a-b50ab27db76mr2024972566b.26.1760361449505;
        Mon, 13 Oct 2025 06:17:29 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d952a273sm948768366b.83.2025.10.13.06.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 06:17:28 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-yarl: Upgrade 1.21.0 -> 1.22.0
Date: Mon, 13 Oct 2025 16:17:23 +0300
Message-ID: <20251013131725.2583786-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013131725.2583786-1-leon.anavi@konsulko.com>
References: <20251013131725.2583786-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 13:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120529

Upgrade to 1.22.0:

- Added arm64 Windows wheel builds

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-yarl_1.21.0.bb => python3-yarl_1.22.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.21.0.bb => python3-yarl_1.22.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.21.0.bb b/meta-python/recipes-devtools/python/python3-yarl_1.22.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-yarl_1.21.0.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.22.0.bb
index 595717b8ab..6be8a6773c 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.22.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "866c17223f7d734377a260a2800e14791cb5e55ec252de624e053a0b36b8568a"
+SRC_URI[sha256sum] = "bebf8557577d4401ba8bd9ff33906f1376c877aa78d1fe216ad01b4d6745af71"
 
 PYPI_PACKAGE = "yarl"
 
-- 
2.47.3


