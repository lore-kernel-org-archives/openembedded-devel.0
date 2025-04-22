Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BCC8C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 14:18:46 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.41081.1745331519449317725
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 07:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YOTPgKI5;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so38714905e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 07:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1745331518; x=1745936318; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbPII04JRy9ZXmgM2S6PTuKTRxzVG5BPsdOc1lTGFd0=;
        b=YOTPgKI58SIr/roZob7PV5EY9SLnO/hAqZmb1RYc/xsrka2xtX2I6GnPmZQwJqWvul
         6lfh6xcNuCghtROe6uiZiz+12mNAQbRCyXldS49rss/zQGmyMEaBOtlllRYbrM/BW7tD
         BYTe0EZgOZemIvwF7T3NJq+o7NpSOZnKgjucU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745331518; x=1745936318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbPII04JRy9ZXmgM2S6PTuKTRxzVG5BPsdOc1lTGFd0=;
        b=W6KLIpA6jfRQWJAwMhFP5i/qC3RV6dM+DxCE5BrlPj9cgjlLgtOEoa168z0rtONYnf
         U9xZdG48BNe4l4H942+XzMR+qtiAKbxgfkW0YETZnG+4oUbFem84T3qz/qnE5rZM4by9
         +TlDf6e8XYjScle/W3RE2jw2nnTVzW4Lgt8NNlZdyFzvHlpmRR2PsAquYUpiIaZq/0CT
         QsVp4qBCI7wMdX6CzBhg4+Vqj2jvjEYKSccIrMVwF57g9JUxqJP3/SkRQBKbXqkKlfUm
         y9L/FJOl8DYZHVSnbY2aku5m6pKJoPij+yGuIdFmitTzy50hKM19+DqcVvIOvkfCd0Z9
         y8Ng==
X-Gm-Message-State: AOJu0YypIDThZNAfNrwVHf/dwEsS+cIIqMD8brN1F2RrSXI5498CGSqP
	jHmu2DEWUXnjYHt0J4CJoHxpOQsVmFZoIkuEypC8o9/dGSazwnJXtfn/RQt4lmllaPQke64QC9z
	1
X-Gm-Gg: ASbGncvrYQkHs0UsHsDe4QUeIp2ccP7shd8Jl+cWlEt1WnpBe6wYuloOuZyF5xPS6i4
	lDskRzxM2nA4ZLLGEtqQ6bEK9U82SQ2+xLPHk5Uq8gpVsmWVvDohgONmPW4Tpe2ixb+290zec40
	3AzHjrG9rLnpIQFKYZCzNMFYCxSTeXEEfdwUpyitRJQj3nHmtcoG9ut3TXJfXsSNz/tefRvswRr
	uHVJdPfFgMOkE2+TwkyCGvlu1UBa9RAkvyrhZldTliE1k+cGPCEUjAMpn1mfBMj5qe1sYE8V44i
	ZpqcaNNGPEZdrzbBUQIEoNSv30/uVbaD8xjmIZ+wztFj5+uJO66e/eY=
X-Google-Smtp-Source: AGHT+IEI1akswkWSN0IhnHxJ8MNhrMxhgRHwW/3pB4THTadhtJolyBFVJRq9RGW87o8oXCJG7fKH2g==
X-Received: by 2002:a05:6000:459e:b0:39c:1258:2dc7 with SMTP id ffacd0b85a97d-39efbaf1ed8mr9027015f8f.56.1745331517601;
        Tue, 22 Apr 2025 07:18:37 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408d04802fsm12388875e9.1.2025.04.22.07.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:18:37 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-aniso8601: Upgrade 10.0.0 -> 10.0.1
Date: Tue, 22 Apr 2025 17:18:32 +0300
Message-Id: <20250422141833.862036-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250422141833.862036-1-leon.anavi@konsulko.com>
References: <20250422141833.862036-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 14:18:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117058

Upgrade to release 10.0.1:

- year_range_check will only shift 0s in from the left for year
  strings of length 2. Since parse_date throws an IsoFormatError
  for year strings of lengths other than 2 or 4 this shouldn't
  significantly change any public API consumers.
- Specify changelog location in setup.py
- Change to Woodpecker CI
- Add a CI pipeline to test builders when a tag is pushed

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-aniso8601_10.0.0.bb => python3-aniso8601_10.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aniso8601_10.0.0.bb => python3-aniso8601_10.0.1.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-aniso8601_10.0.0.bb b/meta-python/recipes-devtools/python/python3-aniso8601_10.0.1.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-aniso8601_10.0.0.bb
rename to meta-python/recipes-devtools/python/python3-aniso8601_10.0.1.bb
index 4fe18d18eb..8996c4b26d 100644
--- a/meta-python/recipes-devtools/python/python3-aniso8601_10.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aniso8601_10.0.1.bb
@@ -3,6 +3,6 @@ DESCRIPTION = "A library for parsing ISO 8601 strings."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ba35a7f4192a3ea09a01f4e8169a56bc"
 
-SRC_URI[sha256sum] = "ff1d0fc2346688c62c0151547136ac30e322896ed8af316ef7602c47da9426cf"
+SRC_URI[sha256sum] = "25488f8663dd1528ae1f54f94ac1ea51ae25b4d531539b8bc707fed184d16845"
 
 inherit pypi setuptools3
-- 
2.39.5


