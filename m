Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ECD1D116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 14:03:50 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22017.1764597827854650758
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 06:03:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=o3WxMK2S;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42e2e40582eso859789f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 06:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764597826; x=1765202626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uJkIM6mlTl71JpIaQhPe7jfTyzYbIboFpnX5OX8d7ms=;
        b=o3WxMK2SKATp6iJx9mn1rivpMLVTmOWlPm0gyE4eLshEMrtKsXvKvP9K3pdylaONgK
         VQPxYpF6KucqFO8kf8dfMW8UdBdsg83MEkjN9Ztp1rUGBiDxZutaNdDByTGCSzUxqvMr
         WMd9mY+9AbUBSondF7pic7fd/15AORrw2qqPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764597826; x=1765202626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJkIM6mlTl71JpIaQhPe7jfTyzYbIboFpnX5OX8d7ms=;
        b=bC0KEtDIRecIe5FJbtmRenPQQ4JygEpEii37E3GL2i5phfWyt5oME/byVZ3BYvaGW3
         CpOKZZZxPtMxtBrfnPdKTqHGro8ON6soBo1cLSNBZ2KnGf9Me1dQJ5NSGO2rgEhQE2KU
         6MkVpteLvu5eUInr23tbt5o/4l1xAukX2FKGfMIuHfRvfgCbHhhBZ0Sdtax/ZA205rbO
         gdMFeV9w6js/c2x0wjqguCq1jnw3RzvKVC392Kb1kSGPMK9+SvfaZZEpo/u5efE+LFsd
         NyHc9bAouejKIZMuU6s/w6usP+zP7HVtF3JalogxXtODMItaaIIiUrmG7Bq1PXyv5DAP
         GKJw==
X-Gm-Message-State: AOJu0YwaHWZ7LZW5B+088b7Ck65pWYfzC9F+evO1Zele+2dFgzAy13aw
	wtfqfCtncvbzEfCU/e54sm0JrOKQLUAmGnyw55bh0CZsPMIkuu5bynqgNKgOTanUd0yljtg4j0w
	Nwy/x
X-Gm-Gg: ASbGncu6GHJCKKaggEbWO+MJ8kSjtDMD8l6dai4dPWvlfhFU6l8+DlnhHEWwfKBFEoI
	q+bTthy2rvfuztRjWtL7VIZCwj61qsqFxsPBXkZmO/v69eHN+8dnqFwunlDOiPAkaXTWX1INrd4
	umcMwgP5tw4IcBeVT/cOD9dW52SDv2+U2De9fw0kMvNA8JRiWidbItIQDVHL0ZFy2LuW9Z2MqAJ
	dIV8PPzXSksj1LUsZR0HqEoY1XSiOkWvF7DUBGdbIVz2PukaCDOcaz0NWcgrWozqJWz9jkvNZPB
	rMCjxKJVcF88yO2ljIMsFNx/1JICmbTL09a6KUeKrMs/jGpi0n/S0KM3hv8x8/hKfOHWd6t7BjY
	icvp0D2ofYoqKIzNJm9oO4P5c/MuBikSkmVk2+ryVQNq0c4qobPpx4mlASKEWbGytPJLAs2ahqw
	OZUggt8CeQyvm56ryRWBRSdGju/yFMzNUq2sI=
X-Google-Smtp-Source: AGHT+IGqbpl6uUlCdBSnxeTZtMvrBI+xAQc1CV4g4ars8zP/cMbYDtGquPs2VGjURReqtsqs0IMlRg==
X-Received: by 2002:a05:6000:22c3:b0:42b:47ef:1d53 with SMTP id ffacd0b85a97d-42e0f204341mr27374258f8f.16.1764597823944;
        Mon, 01 Dec 2025 06:03:43 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1cac4fd7sm26628117f8f.42.2025.12.01.06.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 06:03:43 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2] python3-gast: Upgrade 0.6.0 -> 0.7.0
Date: Mon,  1 Dec 2025 16:03:39 +0200
Message-ID: <20251201140339.394082-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 14:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122209

Upgrade to release 0.7.0:

- Update unparser to harmonize output across revisions and handle
  python 3.12+ features
- Fix support for TypeVar, TypeVarTupe and ParamSpec
- Support t-string from python 3.14
- Adjust test incompatible with py2
- Support _field_types field for every AST class
- Make gast.dump more generic across python version
- Only pass existing attributes as keyword parameters in gast_to_ast
- Initial oss-fuzz integration
- Support [g]ast.get_source_segment
- Fix gast.get_docstring implementation
- Initialize ast node with known fields to avoid deprecation warning
  in Python 3.13
- Add missing type_params attribute for ClassDef node before
  Python 3.12

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-gast_0.6.0.bb => python3-gast_0.7.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gast_0.6.0.bb => python3-gast_0.7.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-gast_0.6.0.bb b/meta-python/recipes-devtools/python/python3-gast_0.7.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-gast_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-gast_0.7.0.bb
index af46c3feb7..93301f0943 100644
--- a/meta-python/recipes-devtools/python/python3-gast_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gast_0.7.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3ad9b6802e713fc5e307e1230f1ea90"
 
-SRC_URI[sha256sum] = "88fc5300d32c7ac6ca7b515310862f71e6fdf2c029bbec7c66c0f5dd47b6b1fb"
+SRC_URI[sha256sum] = "0bb14cd1b806722e91ddbab6fb86bba148c22b40e7ff11e248974e04c8adfdae"
 
 inherit pypi setuptools3
 
-- 
2.47.3


