Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1497C83F1D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 09:54:16 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.4620.1752573248158963570
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 02:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=P4L/lMLN;
 spf=pass (domain: konsulko.com, ip: 209.85.218.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae3cd8fdd77so1063879166b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 02:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1752573246; x=1753178046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFMx3Nuo2Wy7yJOyv0t3Ky2oCSKBJdXOKvZLAnWvRJA=;
        b=P4L/lMLNouER03gCR2UFqMLTKx20jK8JI9GJAijW1ONB6dik9FAcu/BIv7pz2UysMY
         8paCCCCbYXIzC4jG/MkaAIo+4JvXg/Ip9C5gcL8oWfxJjsLKhwHHW9YtUEdyYpKTe5BS
         KyfE2sIZYlhQEQdK/qdpJl0k5d3xznRAjyNq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752573246; x=1753178046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFMx3Nuo2Wy7yJOyv0t3Ky2oCSKBJdXOKvZLAnWvRJA=;
        b=O+YHA6W8xa18rOfA/HOoc47MMOd7oK3U3F+yHxiMDxwfxZrqRYEjxMErVr0CmnNimz
         o+ePPdfm/4l6owaDD1MBXnmTHegER9R8g1vkFH0GWb0iWxXzX2bVYjdkGSh4G5MhEUs1
         zVqg+g0dSqsg8OfDNer0XJWiPqY4A/yNypIAFaJ++FvS3t178V6cPq6d4/pH93nVz7LL
         3YB/a8MQyzjp+R4VtMdYVL9Ts2p3TBTHj5JhocJzx1R9KeS4KWXvnrL9p+B1fUaCr897
         vKXiEReAHmfweT6TTdj0X01QC/F25n17e+wosxgG7MkiKNDkCTMtxnJdShEQawptiOHX
         mTiQ==
X-Gm-Message-State: AOJu0Yy8MsgtNmXreuQrFtYHTI0ECYKSxQi5UGOoGLWAky+4ExQXcNQr
	iNY0raUcnA9yZHeJ90HSlYqed4xSe/yR+ioaoiQILq7VLqErYQQL0GuWT2OxntH4sXKsibhmH1+
	BL28P
X-Gm-Gg: ASbGnctQIou3cP8wZU3/KBEs8HT2WBA/J7T5+aGZ2StlG5OfcQkK/NeuMaGbIWASC16
	ovEbYRy4s+QTAR12vKhgnellCCRVQcpLyy13heP/AZ0m6/Yft7nTRrg8CmLn3J2BbCTt4l0DWZq
	tOTpQQjfmcQG8OM6TlwkZJYpVzqlD1Xxr9pWlKFD76Expv6jfjxU9n74bUUeS06eEKrqRCxlWO5
	GRDzjh4gQvonOxdT4WWkUJvIF4Rwxav/TgLdL2fZ8B52SUJ+6a8aY1lse7C+j/UUkylHc1O8NrU
	ePLX9ezlEBhvZEOwQ3ZAeuPJpv+sBKAWx7JY4pQaf7JVIuUiE0uxpc8hmuwr7OXJNyjVmZhutU1
	to28vla69i5YTTmKOQWXL4iFGd845Xp/AuLgH
X-Google-Smtp-Source: AGHT+IH+K9SgUMfU3Mrg1AlWahZUAbAUHG5OzuJqsgxM1QcE/7bkq/hM93CFT8k3ORp8PI2U8+F9Cg==
X-Received: by 2002:a17:907:1c9f:b0:ae3:6659:180b with SMTP id a640c23a62f3a-ae6fcbc11d4mr1785029266b.29.1752573245987;
        Tue, 15 Jul 2025 02:54:05 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82652b9sm983670266b.78.2025.07.15.02.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 02:54:05 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-bandit: Upgrade 1.8.5 -> 1.8.6
Date: Tue, 15 Jul 2025 12:54:02 +0300
Message-Id: <20250715095402.591088-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250715095402.591088-1-leon.anavi@konsulko.com>
References: <20250715095402.591088-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 09:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118557

Upgrade to release 1.8.6:

- Bump sigstore/cosign-installer from 3.8.2 to 3.9.0
- Bump docker/setup-buildx-action from 3.10.0 to 3.11.1
- Added hint to FreeBSD package in doc/source/integrations.rst
- Bump sigstore/cosign-installer from 3.9.0 to 3.9.1
- Huggingface revision pinning

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-bandit_1.8.5.bb => python3-bandit_1.8.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bandit_1.8.5.bb => python3-bandit_1.8.6.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.8.5.bb b/meta-python/recipes-devtools/python/python3-bandit_1.8.6.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-bandit_1.8.5.bb
rename to meta-python/recipes-devtools/python/python3-bandit_1.8.6.bb
index 2cf13183e7..211d579869 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.8.5.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.8.6.bb
@@ -2,7 +2,7 @@ SUMMARY = "Security oriented static analyser for python code."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "db812e9c39b8868c0fed5278b77fffbbaba828b4891bc80e34b9c50373201cfd"
+SRC_URI[sha256sum] = "dbfe9c25fc6961c2078593de55fd19f2559f9e45b99f1272341f5b95dea4e56b"
 
 DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
 
-- 
2.39.5


