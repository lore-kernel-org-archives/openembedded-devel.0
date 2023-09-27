Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B48E80A93
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 06:26:26 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.12010.1695795977745288652
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 23:26:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: straka.derek@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7740cf93901so574546085a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 23:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695795976; x=1696400776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WJRlPEeZK5kM79+CxeFZEcWTtOqV37GhXXVSUxPThxA=;
        b=Hc8p+XD+LQkUZlCEV7a0c0d4TbNRToo4mmOx2ytzrt7WZ6Y0ZxV4BrfkwN+tTXnbp4
         jJwHjKK/rCVBho17xhu527UBnCHS8YqhVspFPCmYDfx7ZRRf/sZChxIAreFrA7Osm63i
         gwLC72c12w9UINU5n4T51IXY2JNxDs/liNPkFEiUEQqikmjFw0051Gdv525ohw/r3qxi
         flaFmuWModQNyaNIRwTm3qm1WxhxlsLLV5CU3WIk+8aMaXNYe2whdFV2WCWXQu0bIwvu
         FqnlVupLpStUZ5zGMR/5Uk2k0IA5pszLetXhc/vPN+5FuEDh0IBHqw86Wp19fr0M/E2Z
         NL6w==
X-Gm-Message-State: AOJu0Yzc2+jvhfKWV+MMPzPZaXSZzMc5DQtNqvdk0DSccWvhUWQSU95n
	LI5jpa0t2LaVshiyTAv66mzMjIvNEHDz5w==
X-Google-Smtp-Source: AGHT+IFoy/6K4qGJ16aGUeN1DTdDkdF7lK8laW5+s9RVm2uTDZKb+p9r2qm+VQmzwcANza2P63FqjQ==
X-Received: by 2002:a05:620a:2ef:b0:770:67e3:1fee with SMTP id a15-20020a05620a02ef00b0077067e31feemr991360qko.65.1695795976130;
        Tue, 26 Sep 2023 23:26:16 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id q21-20020ae9e415000000b00767177a5bebsm5231253qkc.56.2023.09.26.23.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 23:26:15 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-pytz-deprecation-shim: Remove outdated recipe meant to be a short lived shim
Date: Wed, 27 Sep 2023 06:26:05 +0000
Message-Id: <20230927062605.1703566-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 06:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105170

The upstream package hasn't been updated since 2020 and was meant to be a short term bridge to remote pytz.  As noted in the usage documents, "This library is intended for temporary usage only, and should allow you to drop your dependency on pytz while also giving your users notice that eventually you will remove support for the pytz-specific interface."  Three years should be sufficient for folks to move on from a temp library, so removing the recipe.

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python3-pytz-deprecation-shim_0.1.0.post0.bb  | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytz-deprecation-shim_0.1.0.post0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytz-deprecation-shim_0.1.0.post0.bb b/meta-python/recipes-devtools/python/python3-pytz-deprecation-shim_0.1.0.post0.bb
deleted file mode 100644
index 022cf39ac..000000000
--- a/meta-python/recipes-devtools/python/python3-pytz-deprecation-shim_0.1.0.post0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Shims to help you safely remove pytz"
-HOMEPAGE = "https://github.com/pganssle/pytz-deprecation-shim"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fca9fd5c15a28eb874ba38577a585d48"
-
-SRC_URI[sha256sum] = "af097bae1b616dde5c5744441e2ddc69e74dfdcb0c263129610d85b87445a59d"
-
-PYPI_PACKAGE = "pytz_deprecation_shim"
-PYPI_SRC_URI = "https://files.pythonhosted.org/packages/94/f0/909f94fea74759654390a3e1a9e4e185b6cd9aa810e533e3586f39da3097/${PYPI_PACKAGE}-${PV}.tar.gz"
-
-inherit pypi python_setuptools_build_meta
-
-RDEPENDS:${PN} += "\
-        ${PYTHON_PN}-zoneinfo \
-"
-- 
2.34.1


