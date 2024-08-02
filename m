Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E3FC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 15:30:44 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.95645.1722612642175019476
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Aug 2024 08:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LrmTp5uV;
 spf=pass (domain: konsulko.com, ip: 209.85.208.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5b8c2a6135eso1150266a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Aug 2024 08:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1722612640; x=1723217440; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQE+/yavyi0rGi0L4MRnmFrhMRG/YSa5RP1f3WTSREw=;
        b=LrmTp5uVplcOaLE6J3oh8xD08JO+wTOXcyuP9DMCRt/SKRtznF8IQ+SWRq60u8LgC6
         e9gksLGmlbh3d6I2q5zWTzbbWfaMlNeJNNXO33NayPvmmudZ6esTosqeBUr8rHHXevff
         92yPqEYlyabxfBYrSbVNLUQyOc9gizG8j/NWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722612640; x=1723217440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQE+/yavyi0rGi0L4MRnmFrhMRG/YSa5RP1f3WTSREw=;
        b=KwkqFWS7UhxNl2Wd0KAksMAK2jM+rv4yolQ1VqpMUxALW0i64AYMqit4aZAUwTTPu3
         w7KNG6jTAAeqdX6pD2Q4+dzI0CkLZIwPJnEnFAaHEQDY0/X5qpaW9crwSD7VRhU6HJA0
         iuk+sD2L2zCgf8yd0m5G26PSv59gRN6dCoY+xG2OxHzNP1K+h/FGyGRvTXKk6zMTm86A
         VJobtT2jQRR3JK6pdabmRPzoaYA4Uhq6BnkhxO/UDTmcqXvFwfYJO/1QwsAB0jYHJTHR
         9CjsUlZ9WHME1f7UHPe1ZJ517sXv0XT7t6/5F7Ugzp834gBCcwp8Hps8OnSWw9rFTlD5
         TeEQ==
X-Gm-Message-State: AOJu0Yz84NBhHHLdLfn8OMtrmdNZBYHMEpexEV1YQceL0aTc/MSdg4Aj
	OGgD8fhx0h7sXqeC06CaGFQIdSWPeGbDlPlPN6CMaGkNp6gh/4EiozB3qr5LoslNS4n/z0e8bXT
	u
X-Google-Smtp-Source: AGHT+IEx+4L6MQmWZgVSz3vNzNPPGrQKrWI3PslUYwapIxUf3+zIUHUF1RIDzrqKt9IZMftAS5U8IQ==
X-Received: by 2002:a05:6402:27c9:b0:5a2:bfd1:b892 with SMTP id 4fb4d7f45d1cf-5b77c778f42mr5276320a12.11.1722612640376;
        Fri, 02 Aug 2024 08:30:40 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b839719fdesm1246863a12.8.2024.08.02.08.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 08:30:40 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-aiosignal: switch to PEP-517 build backend
Date: Fri,  2 Aug 2024 18:30:33 +0300
Message-Id: <20240802153036.2649396-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240802153036.2649396-1-leon.anavi@konsulko.com>
References: <20240802153036.2649396-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Aug 2024 15:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111498

The project has a proper pyproject.toml which declares the
setuptools.build.meta PEP-517 backend.

Fixes:
WARNING: python3-aiosignal-1.3.1-r0 do_check_backend:
QA Issue: inherits setuptools3 but has pyproject.toml with
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-aiosignal_1.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-aiosignal_1.3.1.bb b/meta-python/recipes-devtools/python/python3-aiosignal_1.3.1.bb
index fd4ec767c..029f13cd4 100644
--- a/meta-python/recipes-devtools/python/python3-aiosignal_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiosignal_1.3.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cf056e8e7a0a5477451af18b7b5aa98c"
 
 SRC_URI[sha256sum] = "54cd96e15e1649b75d6c87526a6ff0b6c1b0dd3459f43d9ca11d48c339b68cfc"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.39.2


