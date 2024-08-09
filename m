Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8192CC531DB
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 15:49:06 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.87197.1723218543477573129
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 08:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cY+Ororz;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-368440b073bso1330595f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 08:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723218541; x=1723823341; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woZRl8PltuDzB6tF+RON3puWkXx5ofrq9cMeO79kzTE=;
        b=cY+OrorzTNFOBRaXH0LD7fIO6V7Vr+3zAfUdMsr9RyIHzbFPEb2KUL8gnfritLq8Q/
         +lAeYulguJIVsQo3Cp6yoMobK+eRwhhmC5jLWOdJN2PyRD23SDDc3h6mBXQVWMpPob39
         0mAE3/rIK/16YaxfuI3ZmTIvk67HbBOOHJ/8R+fWwBIDd795XMNc+a7aONWaNj+Vmnc4
         6IbXxRbq0lGZZREblbFZ+xcTPn2obwqMi46pT9v97b9/62ommPuFyUkmf8pwVBgshkqX
         rWKydM7gwmFT7SrRU88FyfgTqhPlctFYlZOUZllFJQSrQW4AQopZ9gAo/V0BrRw7j3s4
         1VIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723218541; x=1723823341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=woZRl8PltuDzB6tF+RON3puWkXx5ofrq9cMeO79kzTE=;
        b=Zen8sTCOA0Dsg8O21suapo/Yl2wH28r/c0Vr7i/dvpEd7AiwuJ/ce4bm1C2WKeED4Y
         RJD+H3ETpKK/+EYS+eJgh3VTgMVGBRMa0wWkD/TllWZSNyGxKtsfUK5A6swXqdvHuUbo
         MLu8ytyZTrHJjWk3T9VwcMFDBEEZ9wIoqqK6bnE4a1o5Wec+5Wcen2g+Nyzymgw9uY8w
         omgCrAr8ab2QXppcvaLBwKxMefbXAnIMzvyTpZR+ldiWJYRjf0S9DM+Pco+tuPgojgmK
         8jHOeLuO/INT3Tg22EkI55+WZoczWV2AsAma1lA0iGsQGEB13YoxREDRbIGhQjTKbTWF
         RXwg==
X-Gm-Message-State: AOJu0YzzFRdDI6juWULoMLW2IkvQRpfS+KSeYRph7unfUpos+4MuvRBF
	BGBryCMsQYI0ARACq46r72LL+IuNLDYRUMy0TBHHnERvrk/VaS5fnAjKSgFU
X-Google-Smtp-Source: AGHT+IF8D5jkaqi+tUHcTTjfqKWE0oqpnxGi+lTQAgPMYTS//2rgvWDu8SUoCPWvl3FqzN28Qsrg+A==
X-Received: by 2002:adf:a31d:0:b0:367:938f:550 with SMTP id ffacd0b85a97d-36d281e5965mr4515661f8f.25.1723218541451;
        Fri, 09 Aug 2024 08:49:01 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c738eb4sm81195555e9.14.2024.08.09.08.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 08:49:01 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 08/13] python3-pyjwt: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 18:48:25 +0300
Message-Id: <20240809154830.14927-8-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240809154830.14927-1-alperyasinak1@gmail.com>
References: <20240809154830.14927-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 15:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111704

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-pyjwt-2.8.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
index 92a8f44c6..06d481a3b 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 SRC_URI[sha256sum] = "57e28d156e3d5c10088e0c68abb90bfac3df82b40a71bd0daa20c65ccd5c23de"
 
 PYPI_PACKAGE = "PyJWT"
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} = " \
     python3-json \
-- 
2.25.1


