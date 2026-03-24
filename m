Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6023BFEC10B
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 20:00:28 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6449.1774382425348417086
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 13:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Yp9oAsrj;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso1205465e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 13:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774382424; x=1774987224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=X7Y7Q9Q3V4ifSgLgIcoHhFNGbkUxqC5xRxbTkIi2s/k=;
        b=Yp9oAsrjzW+aAciaDOwKmV1WExS9pb29Yj5YLv3DPg9JZ405bAMp3mPeo8swAvr+Wh
         Cj+5oE/Xlf7m3VCYp4l3GWG1LYBRgvFzRWAev3I3xszp3+lGRz2xBu7OjTasUePU8gG7
         IXCZ1bgGbkAhZQ8ukwf5s8zvmKYkd8dJqBf6LNI9q4P1ObMEXF+sJk63+IaLrFZE0z+j
         qoiRtBQruWi3nDK1OPmPszGQJtYBDwq9n57hmebxUIN2fcvkGS2X/oKFGJ7ITNigAjfr
         dJ3K3oLX17Ipf9+5Le3roUGCyQWsZqHQ8SqtyYkUb4f894DFAPguHA1ktvB3s6GZ4FH5
         VlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774382424; x=1774987224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X7Y7Q9Q3V4ifSgLgIcoHhFNGbkUxqC5xRxbTkIi2s/k=;
        b=KV+EcWahROtuj9DUnpOY6/FWCsHwNug838S43P2LpP3ZnxeyCUQNe9jgSga1H8J3hv
         YA/LWrX+y5rswTIaMN9KJx+bivLqbmQkrI4qOH894O19j0OhYJ3FUo4DF77oLfs6qdad
         Iu+Fw/Pj/Y8rxE1/3y8FYsvgryztMFEgQ3VLRXKLeY7RjS1sKA7FR86xw4GY6dwfixsJ
         VZtNSuJbyFJgLUYHFuKJJrUEGAaD6P0uSnGQGjtKW5uajt3SxIClJhe0cD27ZxSpyvKs
         8yPjdKbql6TRFOfGU8xbgPwCL904peuj2x+msD+5zdfmP82o1bWBTzU6INed45PE164/
         YqxQ==
X-Gm-Message-State: AOJu0YxkxigcH9um/2OqtUnwB7pnQLyFQn/RIdhIWIWe8rjWfgcQv/DK
	BsGpQd9YK/A68VmMkITSDIECtO9Qn/HV0DhbT+Eo4f7Ayc/8OAYrSiiWLEfwTA==
X-Gm-Gg: ATEYQzxyXUgJh1Mz1uSQdgC93obL9869BLEhHfNDMxr1OH45mLg3mJ1AuhIi5DcNlwy
	0polXsK6FoMrHPpW7PYMbQ3MBQNRWgEUbqo8s2gvrp5S99drV4/p5wZlKC7WgPIFFbueVeY4aCg
	6aoA3uwwBb2ZDDS5xGcmH9eMgypwARwvWY9nFmqukj6DPNOR9DbJyu9+sCoGKlwZHzuj2/UCDO8
	YrEqKn/X4O0ujs11Koou2EJtaMGy12ogVHy+P3E15CvblgyXRIVVpvZ/u9E5FzCWqELt3JmS5pe
	YlbgEakruJEXitQ0XPeO5j+IQzvHUvM3Wl0JRfBsSsKc9tm4NmOCRxojQVSY2LTuYSjKP/vg4V2
	h6Z5aIEuTbUQQLN6jEKc1390cElcM9J/ygKVNN8cN2KgpXRb8gwI7DlJ/XBELPNIG00E2GpkypV
	EnsxmXs2rXoSNleRoKUBQm/nDGKv5xYuE=
X-Received: by 2002:a05:600c:3b12:b0:485:50ac:b8cf with SMTP id 5b1f17b1804b1-48715f03afemr15484505e9.0.1774382423414;
        Tue, 24 Mar 2026 13:00:23 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871728f5a7sm4116625e9.2.2026.03.24.13.00.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:00:23 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python3-zopeinterface: upgrade 7.1.1 -> 8.2
Date: Tue, 24 Mar 2026 21:00:21 +0100
Message-ID: <20260324200022.3831228-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 20:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125589

Drop obsolete patch.

An important change is that this version supports Python 3.14.

License-Update: switch to license file instead of PKG-INFO file. The license
itself hasn't changed.

Changelog:
https://github.com/zopefoundation/zope.interface/blob/master/CHANGES.rst

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-Allow-using-setuptools-74.patch      | 24 -------------------
 ..._7.1.1.bb => python3-zopeinterface_8.2.bb} |  7 +++---
 2 files changed, 3 insertions(+), 28 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-zopeinterface/0001-Allow-using-setuptools-74.patch
 rename meta-python/recipes-devtools/python/{python3-zopeinterface_7.1.1.bb => python3-zopeinterface_8.2.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface/0001-Allow-using-setuptools-74.patch b/meta-python/recipes-devtools/python/python3-zopeinterface/0001-Allow-using-setuptools-74.patch
deleted file mode 100644
index a01247fe5a..0000000000
--- a/meta-python/recipes-devtools/python/python3-zopeinterface/0001-Allow-using-setuptools-74.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 5060ecfe6cff5110cbfbc781fc7342ad08fc6f90 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 23 Nov 2024 18:30:40 -0800
-Subject: [PATCH] Allow using setuptools > 74
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index 17da486..7906a37 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -3,7 +3,7 @@
- # https://github.com/zopefoundation/meta/tree/master/config/c-code
- 
- [build-system]
--requires = ["setuptools<74"]
-+requires = ["setuptools"]
- build-backend = "setuptools.build_meta"
- 
- [tool.coverage.run]
diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_7.1.1.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_8.2.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-zopeinterface_7.1.1.bb
rename to meta-python/recipes-devtools/python/python3-zopeinterface_8.2.bb
index 79e00ce23e..1446d15935 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_7.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_8.2.bb
@@ -1,13 +1,12 @@
 SUMMARY = "Interface definitions for Zope products"
 LICENSE = "ZPL-2.1"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423ec128974bd9d46"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
 
-PYPI_PACKAGE = "zope.interface"
+PYPI_PACKAGE = "zope_interface"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI += "file://0001-Allow-using-setuptools-74.patch"
-SRC_URI[sha256sum] = "4284d664ef0ff7b709836d4de7b13d80873dc5faeffc073abdb280058bfac5e3"
+SRC_URI[sha256sum] = "afb20c371a601d261b4f6edb53c3c418c249db1a9717b0baafc9a9bb39ba1224"
 PACKAGES =. "${PN}-test "
 
 RPROVIDES:${PN} += "zope-interfaces"

