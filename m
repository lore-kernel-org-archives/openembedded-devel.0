Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9B8C369C2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 12:32:47 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.7706.1744893160748959460
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Apr 2025 05:32:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=SDAeYJEC;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so6449095e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 05:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1744893159; x=1745497959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1fGHYv9bkPZvFDter0GCmcO9J7vAr8iCYGS6zOWJOg=;
        b=SDAeYJECjtY+3YB07PIKZGkqCz/1ItU4wvubQeQbY0fHIHsKYd9/HdKtmpSrQXrLzZ
         w+Fcv7NdaH7yW7a5RWEsYVHgIRGKkBrJMyuUvBKNAN3CicU6kZJvMnsPl3X4G//1KKEv
         rFow0v4g3O1qB0ps+fQtv3O9YHF1q4/vORZQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744893159; x=1745497959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1fGHYv9bkPZvFDter0GCmcO9J7vAr8iCYGS6zOWJOg=;
        b=LxYqfg5Vp+0Jnek6iKi0eJOlyRPjTUr1YiRWHdP3vMh3bHyVw8Q/T6hIirfMeXUM6H
         6NWY6qOX7QPO+IfABkyMEGBBA2qLNG+6ok5xj86mbAH3iWav1KrVJpdhLj7IzPy/DtM+
         9HgioUpPz6T0VFAbkDxdtQybyWd0r9ANx9MNNIBYMyfLzrnQwJsJiAPPzj/R/aYVYI63
         u/lTA69rzXSQLX1Ahv/Zown538o81m20u1hBgUlkBTaT1dUCRsLmguaw4r9Mun59WcK/
         XVVlBnpJ+cbFw8Tm6RQbdK2WQN9CHLryRl8eQk4vm2+UCFkqUISuLJ6WYBIr9F1ioSwS
         1ePA==
X-Gm-Message-State: AOJu0YxMI+yc9PZZpEoZiP6VBS36hQfEUY1gRy4ax/XK9yJt+mD2vlMY
	OxGNGzi84sD4z9vy9yIJiTxlpe7AJObj75B1HogZhg7J9Z6pm9kmrL2xxv7pKG+v/q93KTfXjn/
	1
X-Gm-Gg: ASbGnctJZK79JtcdhppJPQCUugI74drCJeExi8b4BdnTHLsd6f6jPTezVmvDO8D42jJ
	Vbwh75Baq9GwnUNnbwKs0HGhUgeOulJE9H/ZdVSlCTRbulVXIvxC2N7Q6jFRGb7qphEeuZDvxXb
	9E4c2CCAamOVFP+mI8DaBh1MMKteOxzQhdVKyeU3/1hs9/XsFg5lAFC62KUuh6rlteAYEnB4OHr
	dGPbHcnRDoPt7TmjZlh3c+3n/HSNkrnKy0zD6XLVHM83/nf8SRBpp4rdnL0Ob/CmLEKeQRE9lzt
	y45NbOO/ikef4I8DH7C06v6WaewXHYtQDnjSPoj99kpRQn3Pm+/rixY=
X-Google-Smtp-Source: AGHT+IERBP2mzV/Pp8y5dFHw+nxysYlc0BNiCboNUcEdX8fCtLabfPBwGPFB8ZbTkazhlbg4fguMKg==
X-Received: by 2002:a05:600c:4f8f:b0:43d:1b95:6d0e with SMTP id 5b1f17b1804b1-440600e06c5mr36558765e9.23.1744893158881;
        Thu, 17 Apr 2025 05:32:38 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96407esm20208804f8f.17.2025.04.17.05.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:32:38 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/6] python3-eth-utils: Upgrade 5.2.0 -> 5.3.0
Date: Thu, 17 Apr 2025 15:32:31 +0300
Message-Id: <20250417123231.3063208-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250417123231.3063208-1-leon.anavi@konsulko.com>
References: <20250417123231.3063208-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 12:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116936

Upgrade to release 5.3.0:

- Replace arg["name"] with arg.get("name") to correctly handle
  optional names
- Add new methods: to_wei_decimals, and from_wei_decimals which
  take a number instead of a string
- Add CamelModel pydantic model for validating objects and
  serializing to camelCase when used with by_alias=True, with
  the general expectation of a well-formed JSON-RPC object.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-eth-utils_5.2.0.bb => python3-eth-utils_5.3.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-utils_5.2.0.bb => python3-eth-utils_5.3.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.bb b/meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
index 435d032a84..84db8b32b3 100644
--- a/meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d3f53e7cc5bf80b16eff1f4a38c73182"
 
-SRC_URI[sha256sum] = "17e474eb654df6e18f20797b22c6caabb77415a996b3ba0f3cc8df3437463134"
+SRC_URI[sha256sum] = "1f096867ac6be895f456fa3acb26e9573ae66e753abad9208f316d24d6178156"
 
 PYPI_PACKAGE = "eth_utils"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
@@ -16,4 +16,5 @@ RDEPENDS:${PN} += " \
     python3-eth-typing \
     python3-setuptools \
     python3-toolz \
+    python3-pydantic \
 "
-- 
2.39.5


