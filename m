Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79650C02193
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 21:58:26 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web11.6224.1738274297490148503
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 13:58:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3cfdf301fa4so4250685ab.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 13:58:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274296; x=1738879096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOjJRzMASl1qtfjI70mPJ7cTsgBprn3uejL5YuQAhJU=;
        b=ayAqhq/pxFZZ7xHvLZwVHHkapOUCnmtK03lCG2OWHD0UAxYkUBTulDxNaHBxOOYmvi
         fo7p8tv8Lfz91cZRzpg/asu600kJ9Q+h20tQmzJv+on9+e0I0V03VZR5ZQiZAYq8AzUP
         FRtYKSjhqEznlRxCF+kZ1zcsFpcXd93yQWdm/ghfiR1Ac+pupBea11aQWMbDSI6Qv2+E
         bLFvpQIIxQeFvAWuLTZm/hwOlqJNssj/rD9bI6sMbYZKYTL4ov9UwgUSBgESApAHqrzs
         FKeXTHrr2/yaLkF/gPh1ZDhI53DaznhrbOmd4cKlVdDLQ19Jqr1LuiUvONtJd5Ntminr
         CwKg==
X-Gm-Message-State: AOJu0YyMawxz3whF6JK0y2CdUNDX2ACzNU5acIBdgs+9Pakf9lpStRYC
	WkSxd7T/oKJb6gH8Sn0f7OtVjnznMmYDnXSAfFeGY6laYj9nWueN4/+MqChbovc=
X-Gm-Gg: ASbGncuvO3Xk6r7aCc2T7aUklPlBgzD3toBwH5Di1oQTaHA44dq4KM+fyY/uFtedp6+
	JlgqXVFeJx6xJjINj3/AN8Govp72YR+Xwf8G1PAX1sePg1TebbNSZocNGMGLx99kyuJ1WxtYX9i
	FGrc78qCxAQ5n+jxINAquoWOxVFGmctXyZX4eki7vNQQiG3aej9BlgsV6GUgvGtHhR1hbBLo7FR
	PuNOsF7W+Tvkk2vqMibPRLZVpHqtGgVZCk0QgO1m/Az30PNEmb3hjy8EkrUUMoSeefRhiXFgte3
	caUKVB4RVzMUSC5UXPoQiKz8IKnvyBKVy0L6kIUQMpohLuUmuDHDK1fjp75l
X-Google-Smtp-Source: AGHT+IHkpkjCp41OqEfWf3WQCIQqE6OJAfdcheJo0NOZSiss1KonNfiE50DcCwLKh49QFyiDP0ni4g==
X-Received: by 2002:a05:6e02:1a08:b0:3d0:101e:4609 with SMTP id e9e14a558f8ab-3d0101e478amr26087225ab.15.1738274296336;
        Thu, 30 Jan 2025 13:58:16 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746e3e63sm519071173.144.2025.01.30.13.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:58:15 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 11/23] python3-ipy: update recipe to use the ptest-python-pytest class
Date: Thu, 30 Jan 2025 21:57:26 +0000
Message-Id: <20250130215738.3280576-11-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130215738.3280576-1-derek@asterius.io>
References: <20250130215738.3280576-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 21:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115165

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-ipy/run-ptest                 |  3 ---
 .../recipes-devtools/python/python3-ipy_1.01.bb  | 16 ++--------------
 2 files changed, 2 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-ipy/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-ipy/run-ptest b/meta-python/recipes-devtools/python/python3-ipy/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-ipy/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-ipy_1.01.bb b/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
index 817d04444e..6a35e12ffe 100644
--- a/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
+++ b/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
@@ -11,21 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=848d24919845901b4f48bae5f13252e6"
 
 SRC_URI[sha256sum] = "edeca741dea2d54aca568fa23740288c3fe86c0f3ea700344571e9ef14a7cc1a"
 
-inherit pypi setuptools3_legacy ptest
+inherit pypi setuptools3_legacy ptest-python-pytest
 
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-    python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/test/
-	cp -rf ${S}/test/* ${D}${PTEST_PATH}/test
-}
+PTEST_PYTEST_DIR = "test"
 
 PYPI_PACKAGE = "IPy"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.34.1


