Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 696CBCEE33B
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 18:21:23 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.24217.1728498082735652847
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 11:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XD8fHCWW;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a99422c796eso15782566b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 11:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728498080; x=1729102880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4AHYPZghYqKWZ225VEmcREXeqte/YWdlFWKyb+Ukbg=;
        b=XD8fHCWWJnw9BUsEayUlP59C3XMUilyPs+IAdijMrwjURxXoz0cTWniiOC3imhuvSL
         WcLoWnPh9pt4pDQWKLJJjQwmEhi/GfO3XauFym5qn3n1EAsW5QWIaRe3iubYYoy1NcyE
         by4tReeeL3JbefyjSbgJLuQDngDN0MXcNaTe6d0u9cgxA6UlHVDY7CM2tB3Ci+nMWHdB
         CF6Q4VNp1AXmaBACXmlqqPoPdENUWJKsolkv7VHPqVRuCG26jnSpQ3M/LKLthnArEEpp
         /cybf4MgvmuoRDoNSp3qEtO1i+QS1xYOeLb2d5E/XuU16/HjsIhIG1nsGbCfWlUKkRNK
         twow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728498080; x=1729102880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4AHYPZghYqKWZ225VEmcREXeqte/YWdlFWKyb+Ukbg=;
        b=RVysuJ0MMbRDI+nZczN+Ov1+8hVfgCUMTIjnnNYpTeqkFx8Q304Zqt2/2mR43B/6qY
         C43sZkIYiO+u1SvXPh1ppi6zeYzmbOCthRd1tkeIJV9UOLs7W0QOmru4EVFVE1G9locP
         WwieAGokxspv3p9KYcBrF9A39WmN9uLSxxSvkr6bWv4YdJtep9RQQT4bid8GEwgZMkcU
         ZFwudVJgTUfyFZrnImXPfTwEi3B6qMe2J7w1LVZ//Y3gWbdprG2sB0P4navPbYWq52Kh
         oZf07q6bmNvItmf6Z71mU+cFtokD6w4XTwB4mZIYMPSL9TfBnbMIVtpnnQ5Kiq8rtb+G
         kQuA==
X-Gm-Message-State: AOJu0Yw23Vipl6Mnrac8/p7oPZLaar+8bHU+HYBhaF3WibNhevHmd7El
	IHRh+DcVeTn39DROczm8u1HHnSFgHKB11zGGUZ8HacMeqKJMhJNsjWK/3A==
X-Google-Smtp-Source: AGHT+IG2MhPuCb0UrXrJSAsZo/xzT6uqN9Sj9Ru0svECdCGDm9q0a27Xud8NP8bBLtv6LoRCDxXcaQ==
X-Received: by 2002:a17:907:c19:b0:a99:37af:9cf9 with SMTP id a640c23a62f3a-a999e8cb92emr112329266b.49.1728498080444;
        Wed, 09 Oct 2024 11:21:20 -0700 (PDT)
Received: from localhost.localdomain ([176.33.66.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9954cd8395sm446754466b.30.2024.10.09.11.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 11:21:19 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 3/7] python3-inflate64: switch to PEP-517 build backend
Date: Wed,  9 Oct 2024 21:20:27 +0300
Message-Id: <20241009182031.242045-3-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241009182031.242045-1-alperyasinak1@gmail.com>
References: <20241009182031.242045-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 18:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112739

- The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

- The PyPi package name (defaults to PN without the python3- prefix), so there is no need to set PYPI_PACKAGE as inflate64, it is by default.

- Added missing dependency python3-setuptools-scm-native.

Fix:

 WARNING: python3-inflate64-1.0.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-devtools/python/python3-inflate64_1.0.0.bb        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb b/meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb
index 9fbd5157a..7804152d9 100644
--- a/meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb
@@ -4,12 +4,12 @@ LICENSE = "LGPL-2.1-or-later"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-inherit setuptools3 pypi
+inherit python_setuptools_build_meta pypi
 
 SRC_URI += "file://0001-Do-not-override-const-qualifier.patch"
 SRC_URI[sha256sum] = "3278827b803cf006a1df251f3e13374c7d26db779e5a33329cc11789b804bc2d"
 
-PYPI_PACKAGE = "inflate64"
+DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += "\
     python3-core \
-- 
2.25.1


