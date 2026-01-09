Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5133D26D6F
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 15:59:40 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13177.1767974373300888187
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 07:59:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=uJsQocbU;
 spf=pass (domain: konsulko.com, ip: 209.85.208.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-65063a95558so6354134a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 07:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1767974371; x=1768579171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6OvdHZTAIeXhFfP87enmploPrkmsqoT+8ODeNp3I4Q=;
        b=uJsQocbUW64q6SxwVmNMWzkdsIpuRh8MmBtFU4VYF1mJWlcYvrpZMxgrCD2VNmTMmj
         O0Loexxy0xpRDp/QUTJwP8tYvKnPpHWJ00KlEmYDeOtSnlL+fI+9LrS2ji+dZp4W2OGw
         KiuaXZbpWjLuNmUsr9o0pOrxe+GW149ZcQ8mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767974371; x=1768579171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u6OvdHZTAIeXhFfP87enmploPrkmsqoT+8ODeNp3I4Q=;
        b=FqumH9DuyzGHNECkwhs3uJqI6M+y0p6c1jTwEdp6+QOfO0BGdoi9qULY9TBBkkAI8k
         Rax1f1YjWq7Tzxcg1rS7rE3mh2S6nJzc/KKK7+XQC4At7GxyEsvc1mh/cwADDoQJ+059
         tkQUpo+h4kXrNyk1YoRu59U/erSrpQpa2J8g+sUBVy7WDuNfFP/r0o5Zirs/dunWtIJ5
         DpQSD0j2StFuKF2cIJW1qD08qRPM5mXc7bA3gpY0MF0jtTCCr64Fe6BjKjr+1PMxHMwP
         gvWjZMYtFzlaMreVCwfnIOW64qcygVs7nkNgEF3RS2J2VhI7jgayiLGD+AVz1DftBv0m
         0TfQ==
X-Gm-Message-State: AOJu0YzOUP7QPLBGN3AWOOOhqQOUcJr6FZt6mBaQ3hgf0GEtCta2aUNs
	ulhoytVG3k3Ae4gPYyR3M0avmpBQTyI/yUzc5/On4PhZuqyY50GIbywb9Vin7MNS9PRonUmvBW3
	KxSx7
X-Gm-Gg: AY/fxX7GLLbCedHDmFa2WOYRV6LOhbDfrH0E+xzFs80hWJiKARiegOsjjd7aMcq8dE0
	unDEg+/uN/YCO4VGRtcdjYiekI1ANphOBvfMTN0WcbRIQHyew1M5WP2AoljN5W0obGcR78e1tgf
	Gi5bAmZZFvHGqzz29bywr19Zm+nrTm0a16aMHXYej7cZ3VI1Sv12W9Jghae8JJ8VZJMMOF1QXtN
	eIBU1gjEXJ10IxYch0I4tJ7DziJyx3R/P8iyqpJaF8nx/TmlnkY7z4sCHudDzLMO8PhXRJe5B5I
	0wEzYVj2HFClxfXJLmlof+ufFcJiPHVdSWlSUpOO42gm/YLU1XHLWwWtdeF7kNVlQz+JMxYc542
	3OHMCFxITm2Zz8/pPFc8/PiwwNzTZ3FEWc+Mzzi4YfZzqCKr88nK4vulAwXl9ejmZa6TbLc4H1r
	ZtPR9LOef8sMfgzr6PIC+QjIuY
X-Google-Smtp-Source: AGHT+IFyTAo5EDo56YhCxSjt9JWYbQaCt1JkpdEimFRd+wnsjHOun7wLBuXzbLRrwiRIvwsV80+fQQ==
X-Received: by 2002:aa7:c850:0:b0:64c:fc09:c956 with SMTP id 4fb4d7f45d1cf-65097e5e47dmr6580014a12.29.1767974371459;
        Fri, 09 Jan 2026 07:59:31 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d4acsm10781444a12.30.2026.01.09.07.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:59:31 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-xmlschema: Upgrade 4.2.0 -> 4.3.0
Date: Fri,  9 Jan 2026 17:59:26 +0200
Message-ID: <20260109155927.3850975-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260109155927.3850975-1-leon.anavi@konsulko.com>
References: <20260109155927.3850975-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 15:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123308

Upgrade to release 4.3.0:

- Add arguments validation for schemas and validation methods (by
  validation contexts)
- Add custom XPath parser for find/findall/iterfind APIs on schemas
  for match singleton sequence also if position is a number greater
  than 1 in predicate expression
- Improve build of XSD elements and groups, using a three-state
  built flag for components
- Extend and fix memory tests (Python 3.14+ seems to consume more
  memory)
- Drop support for Python 3.9 and add development support for
  Python 3.15

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-xmlschema_4.2.0.bb => python3-xmlschema_4.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_4.2.0.bb => python3-xmlschema_4.3.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_4.2.0.bb b/meta-python/recipes-devtools/python/python3-xmlschema_4.3.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-xmlschema_4.2.0.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_4.3.0.bb
index 7ff9b8a21d..86554f087f 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_4.3.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "The xmlschema library is an implementation of XML Schema for Python."
 HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=26aa26eda991a3a2b61c11b62d3fda65"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=385fddea479acdec12ab77a938f68cd9"
 
-SRC_URI[sha256sum] = "b1f88c53493b2e75471977cbf218d939b872d0c7046bb63d48cc219fa7e241b9"
+SRC_URI[sha256sum] = "174c531dd869cd29bf2d1203603d9e619bddf168d6289725738914c96c80936e"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


