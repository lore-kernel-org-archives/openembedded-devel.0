Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE6C7E7719C
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 20:09:31 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web10.688.1736539764432422431
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 12:09:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-844d555491eso74429839f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 12:09:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736539763; x=1737144563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icF+853R+CL69NyBXTR9N/uPBYK05kRi6kFmyZxiHrc=;
        b=vdiB8BvRU1FfpTjEnVVwHz6jS/QFrM78Z/G5wtRSRlXkV7l1N5SzRxMEv2zKeiOdZF
         j6HHBcQT4fp8eWId9Ov4VhKQcZXsUU31TNg9yHMHBfeJHwEShC23ciUYEPDAzBZhaItL
         Lg5mntjKF5VfCDm88JZ0Any29Pkfo1iCWA0/MuLyrgMtq0IMQNVfgSqFKT6Opq/GK+xz
         HahFQmH2LDh7ZLcOFKpElGbAcD3lwwoKbeyWBd5m2COZGBbiF7MGCRl1O4nUqkV1wKUL
         qBbTcREgqgYAufo9RrqMik2bmC9PpUF2UDB4FO0+NFwTPklxPZCd3JRVa1lTN6TyDwSx
         XC/g==
X-Gm-Message-State: AOJu0YywxjkubCsfPnPvWDlrXrfODp2kjR/p44jXfwHLbtP6EOiuVCZg
	mFQC+yw3eQGiolBb4W3jivEP4XZzvDYNswPIWISzXbMTLlpjsyl9RtaQvA==
X-Gm-Gg: ASbGnctRpq27tNUDg9n/RRrkCgB/BYkFNWKMZOwFm3DITWU5eV0Sg0vQQbbVjjlGOU/
	HxqFBBaH0Nw23HulNrGFDQlY1FDtWNt4U2AOV0rlKR54RDN73ZHpTPfv2h0hCF0m8ob6gRU3lpD
	j/RLui/qydtXz27mLgEGVcrBg6tpcGLBocd2v31v6fioaCyQCX6TXtHEUaHc9HVgAVeQpG4pIUN
	0Q665div3JVA4qdcbE06OTDQCEHXMeXyg9tyBWo607vrl6DA5TIQJ9vOn/hVg/fAoZKTAy3cdjm
	cSbxtD5uKNJicT/2WDsSD7pMcw==
X-Google-Smtp-Source: AGHT+IFV7e28kT6GV0eYwmvvn28I7vk/nbfYcyFE/mpisP9YLMAqRgWXQQYoPnhFLEaPFmxb2ukerA==
X-Received: by 2002:a05:6602:750a:b0:83b:28e2:4985 with SMTP id ca18e2360f4ac-84ce01e97bbmr1206084739f.12.1736539763209;
        Fri, 10 Jan 2025 12:09:23 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d61fc84dasm104467139f.46.2025.01.10.12.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 12:09:21 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 12/13] python3-typeguard: update recipe to use the ptest-python-pytest class
Date: Fri, 10 Jan 2025 20:08:21 +0000
Message-Id: <20250110200822.3958062-12-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110200822.3958062-1-derek@asterius.io>
References: <20250110200822.3958062-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 20:09:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114802

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-typeguard/run-ptest              |  3 ---
 .../python/python3-typeguard_4.4.1.bb               | 13 +------------
 2 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-typeguard/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-typeguard/run-ptest b/meta-python/recipes-devtools/python/python3-typeguard/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-typeguard/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-typeguard_4.4.1.bb b/meta-python/recipes-devtools/python/python3-typeguard_4.4.1.bb
index 8b2604e4a..45b32f512 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_4.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_4.4.1.bb
@@ -5,11 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
 SRC_URI[sha256sum] = "0d22a89d00b453b47c49875f42b6601b961757541a2e1e0ef517b6e24213c21b"
 
-inherit pypi python_setuptools_build_meta ptest
-
-SRC_URI += " \
-        file://run-ptest \
-"
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 RDEPENDS:${PN} += " \
     python3-core \
@@ -19,18 +15,11 @@ RDEPENDS:${PN} += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
     python3-typing-extensions \
-    python3-unittest-automake-output \
     python3-unixadmin \
     python3-mypy \
 "
 
-do_install_ptest() {
-        install -d ${D}${PTEST_PATH}/tests
-        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 DEPENDS += "\
     python3-distutils-extra-native \
     python3-setuptools-scm-native \
-- 
2.34.1


