Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A79CD128A
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 11:23:26 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.15406.1712834604905816389
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Apr 2024 04:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fA+bzysi;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41551500a7eso58987265e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 04:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712834603; x=1713439403; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QHGQdFqTR3CKxI+Y6Jfy5XOUsufGHPRQENfKEd8pr/o=;
        b=fA+bzysiWFutmlF66lMCcNkFAjxxUXzMLC8yH4ZizG6mFKykaBLpiGzUyQ/Uz0mA8f
         nQm+0upIHONOn/0OSxaRTOTMYRiLphf3hYZexx0a2YIJjvhNoJ97z2Biz0/s3bg6l7Y3
         12moR2XgN90/0F/jFbVj8xlzz3L9cTGNCfwSnhvNouF1//YYNSorHIwfb8U8YTshcqK2
         mR83wtQXrPtPu2MyUpgvP1gZgTvpw0o/fA0GOrXDxGAc/VIWtaWeKvDGMFX5uLq+Lxz2
         38A6TvNIQ34K6JhGw5wVq7ZKtawPDuFPXiCrZSDdNxqKv4dWo7t6fFQsmFQ6EjK6Oi8i
         UUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712834603; x=1713439403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QHGQdFqTR3CKxI+Y6Jfy5XOUsufGHPRQENfKEd8pr/o=;
        b=fREGIaDgOMHyGl71crdiUGuyZsvM89mCEdiljz4s10xcnOjlmUbJH7uk9gh+4kjp79
         MyDsgQL/AWo089VUhLhHhVOLTxymeJcd7OC0fX6YitniQ+hZxiRuQ5ENM90jPGk8WpUW
         xbVF2a0g/eMOZMIzTYkcNw2HcaKH26ZG40kg8gPOlk9UAPJocwgctZ2kLjCj+ikx02Fu
         m68NauOLjJk65alQxM6qquMXaFkiOf8zAqAvE7YpyRbyc5IFsS+oiQITY0IcNGAzIA4s
         5ZFVMDJ2yS5s/EKbMTNmdrThFM6XIVO9YfYVzQbI60NqF5LwR2EnfPEUK50zQTJ9Et/h
         sKSg==
X-Gm-Message-State: AOJu0YxH53rbAFKj2LtWYquvqzL4SjavgIPiNZXyK1cEhGSNYpxDo+EF
	2RaMRAy7lijovvcfbFylssXOm4RQvVegzHhdlRp4OFDajJZWfVuWDTfnOg==
X-Google-Smtp-Source: AGHT+IHlQ40w/ovfXfBn7t21SHW2DpyqmeAqVsFL1lWJ/l1FgTWYwu0MuZmXNhkHUXNZfhxt7Tralg==
X-Received: by 2002:a05:600c:1911:b0:416:5d63:e651 with SMTP id j17-20020a05600c191100b004165d63e651mr3639882wmq.37.1712834602781;
        Thu, 11 Apr 2024 04:23:22 -0700 (PDT)
Received: from localhost.localdomain ([176.33.68.217])
        by smtp.gmail.com with ESMTPSA id h6-20020a5d5046000000b00346df659e7dsm175418wrt.17.2024.04.11.04.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 04:23:22 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-flexparser: enable ptest and add missing runtime dependencies
Date: Thu, 11 Apr 2024 14:23:18 +0300
Message-Id: <20240411112318.167362-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 11:23:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109919

* Ptest and library example tested on qemux86-64 and qemuarm64

* Add ptest into PTESTS_FAST_META_PYTHON

Ptest result:
=============

qemux86-64:

Testsuite summary
TOTAL: 59
PASS: 59
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 12
END: /usr/lib/python3-flexparser/ptest
2024-04-11T11:06
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemuarm64:

Testsuite summary
TOTAL: 59
PASS: 59
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 11
END: /usr/lib/python3-flexparser/ptest
2024-04-11T11:09
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-flexparser/run-ptest       |  3 +++
 .../python/python3-flexparser_0.3.bb          | 22 ++++++++++++++++++-
 3 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-flexparser/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index acb09aaca..6bd48156d 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -20,6 +20,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-dominate \
     python3-execnet \
     python3-flexcache \
+    python3-flexparser \
     python3-freezegun \
     python3-geojson \
     python3-google-auth-oauthlib \
diff --git a/meta-python/recipes-devtools/python/python3-flexparser/run-ptest b/meta-python/recipes-devtools/python/python3-flexparser/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flexparser/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-flexparser_0.3.bb b/meta-python/recipes-devtools/python/python3-flexparser_0.3.bb
index fb94235f0..e45175f5a 100644
--- a/meta-python/recipes-devtools/python/python3-flexparser_0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flexparser_0.3.bb
@@ -6,6 +6,26 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=32f547dac365c355d2cdbcd7ebea9144"
 DEPENDS += "python3-setuptools-scm-native"
 SRC_URI[sha256sum] = "692e7524d9e14b2b1231b772b091d7d6296951deb383f5a67bfbd0ecb0b9fa9a"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest
 
 PYPI_PACKAGE = "flexparser"
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+	python3-pytest \
+	python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/testsuite
+	cp -rf ${S}/flexparser/testsuite/* ${D}${PTEST_PATH}/testsuite/
+}
+
+RDEPENDS:${PN} += " \
+	python3-compression \
+	python3-email \
+	python3-logging \
+"
-- 
2.25.1


