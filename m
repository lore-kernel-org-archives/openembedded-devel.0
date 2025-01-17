Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB95BC02185
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 20:30:52 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web10.4855.1737145843817906467
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 12:30:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3ce7c4115e8so12607635ab.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 12:30:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737145842; x=1737750642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hReuyBwswIsANocHFd0MvTLW59W6R+pyjQ66iNMS98=;
        b=eEQufBJHYg1gn5jZkvsIIKJzojQjtMqe03ITGU/gRKWZAcjlfufnLU+ITfWfeB1hRn
         LPLNt4Q1yrWSHxVongttEbXRZX3g1C5+UUXXKdqgCM2aGeu5rJm9y29a1g+FxR84n/ih
         I3SmsAtYJ7xX+5X6dAHiN6E35O7QOr3zvxmBctSVES1WN/rzdbEeG2ao+kwjA2n0z04T
         XuPANeY6QoYsZqlUrTMI3CVty3ljsog9NSfTctlsMxB/EYWy/2air8A9jEwKScyqMwYB
         N/Ez3Jz1bj93SiT90njQp9TqUEMjUaYmkVruRKOYN9EGzpC8o/rIPpCCseBTlm4G0cbp
         GmfA==
X-Gm-Message-State: AOJu0Yyinp9DfOyXPGwf3lKjeT2Swgz0d3BC10IZwa9k8m/8hfe3wSq8
	CO9uObAV4YEQk4bNpRpzCUqpyT1Sk4b1mlCu3YYw1YEVEZI+IV1jRihnZg==
X-Gm-Gg: ASbGnctQtjdLT+O00/5vegwoEgsrjkaiU+4b7PE7EQXWo1hybY1Azfp8JwjrGdrmrDz
	Q0nphlFmRT+C+8w0yTaZzCAqjFEUWHr7cDAU3zbyrigEoF58l1SVv5hNTG0dYCKweqyIJplX+AG
	Xc/aaJ1iJb+EYbjSlT2NsczpwHTyL5WzXa2aYiBpsnt6s5hCzcmAS6KdllukyFVaVPESd4M0GkJ
	XwOvGUasxeO/kp3BiT4xRrZCcF63KhsRvZMnx0W6XN5IzGIVfjpZygnoF6unFF4hs0fofpSXtVQ
	YQnrSx9C5EQhzpIneI9bU9TcZQ==
X-Google-Smtp-Source: AGHT+IHbZGC6rClTVsjtebmjd2Hx0fvI4/HUfyh8eCazh84fRI5SDzoxyz0ZSivWMHEleUAUKrCNaA==
X-Received: by 2002:a05:6e02:6cf:b0:3ce:7c7d:37b3 with SMTP id e9e14a558f8ab-3ce84a62d72mr97196915ab.9.1737145842189;
        Fri, 17 Jan 2025 12:30:42 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea7566e687sm801814173.128.2025.01.17.12.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 12:30:41 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 02/10] python3-pydantic: update recipe to use the ptest-python-pytest class
Date: Fri, 17 Jan 2025 20:30:22 +0000
Message-Id: <20250117203030.3648575-2-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117203030.3648575-1-derek@asterius.io>
References: <20250117203030.3648575-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 20:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114935

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-pydantic/run-ptest    | 3 ---
 .../recipes-devtools/python/python3-pydantic_2.10.5.bb    | 8 ++------
 2 files changed, 2 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pydantic/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-pydantic/run-ptest b/meta-python/recipes-devtools/python/python3-pydantic/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-pydantic/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.10.5.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.10.5.bb
index 019781d51..cf211972d 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.10.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.10.5.bb
@@ -9,7 +9,7 @@ HOMEPAGE = "https://github.com/samuelcolvin/pydantic"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
-inherit pypi python_hatchling
+inherit pypi python_hatchling ptest-python-pytest
 
 SRC_URI[sha256sum] = "278b38dbbaec562011d659ee05f63346951b3a248a6f3642e1bc68894ea2b4ff" 
 
@@ -35,8 +35,6 @@ RDEPENDS:${PN} += "\
     python3-zoneinfo \
 "
 
-inherit ptest
-SRC_URI += "file://run-ptest"
 RDEPENDS:${PN}-ptest += "\
     python3-ansi2html \
     python3-coverage \
@@ -50,17 +48,15 @@ RDEPENDS:${PN}-ptest += "\
     python3-mypy \
     python3-packaging \
     python3-pydoc \
-    python3-pytest \
     python3-pytest-codspeed \
     python3-pytest-mock \
     python3-pytz \
     python3-rich \
     python3-sqlalchemy \
-    python3-unittest-automake-output \
     python3-unixadmin \
 "
 
-do_install_ptest() {
+do_install_ptest:append() {
     cp -rf ${S}/tests/ ${D}${PTEST_PATH}/
     # Requires 'ruff' (python3-ruff) which we cannot build
     # until we have Rust 1.71+ in oe-core
-- 
2.34.1


