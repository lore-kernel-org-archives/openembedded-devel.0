Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF24C27C53
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 02:08:28 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.10472.1717985302542303538
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Jun 2024 19:08:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P9nsNHmx;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3c9d70d93dbso2340680b6e.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Jun 2024 19:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717985301; x=1718590101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JjyIU84k4hb2dabe5PUrHi4qQdtG+dlfILjlO2KzUKY=;
        b=P9nsNHmxQjks3krGGGYwIPj6Ya67ydkuD72u/uUq4pIKNhM25/bj4+SfytUpdiznJg
         Evsc/ngxFlrZchAJ4/M8ZhSGoV5CPWBthFCV53uVVxBbbEBimCFheferlBMK+BjDXxOb
         2wt12xx+GNPmMxRz49FUTNrT25yja9ZC9QU/QG7aWkoEv3jIpZYLKpSeKYlu2e+/Fmbr
         pTmuHqRQMDcT2etDtHiVNmLBhKeiL5CLUmnIaRK+uoPO1zl8GsLeBSbW6npk1mqpcVoq
         HljuMpb4rnd29A4gYhclZW3k4dN6mdK6gSIjEF0zmOKJj+ax1J9eSvpUQgrW373ZQK+F
         nr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717985301; x=1718590101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JjyIU84k4hb2dabe5PUrHi4qQdtG+dlfILjlO2KzUKY=;
        b=sTRFY9np/1uZqMB4L6s7lFFE9AU6lQap4unVHyBubeJtoXTg0QpkB5itR//SreX5c3
         n7FHe6yN+/PSlz8+3EHUnK0lmUwGvSDLIZTpLPV/aaLOHjO/QswCgQkIiZmvVcMQqk9Z
         Eifcc0QoEIhMyV9HTCYVFFaWi02RBdQ5elBmLI9FcCU341ORPy2sDOQfj0LcK/j2hDxz
         dNT3rXC4sR1v4Y4+H7NMXTqJHHzSFREmo+lYh8ZfEJuKHFXLRO4RCjFviPmWuQ2K7WUu
         6hi0NmrEkFHznF1tsL3e9B4Qv/KfQK7eAwF85bBrgpy+kKLglaayf5frd2wwDM5mudyO
         Gerg==
X-Gm-Message-State: AOJu0YyMg4ey8XNE7syP9iI6k5IFOSHIu2P6o9OdxcSvl8g7M6R0a6yd
	DItK4Gvla+tC9poyc569YAdrwopR7ZOya0uP1vsyItTqA50llc7e/XA+aA==
X-Google-Smtp-Source: AGHT+IFwSLw4QCyt64QGoryyveMnarBeWm+fDQsb6+wCxzVEDoomCruIpiB+fbBdWoux07mlwRDqYA==
X-Received: by 2002:a05:6871:e015:b0:250:7353:c8f2 with SMTP id 586e51a60fabf-254647efd11mr9180046fac.43.1717985301373;
        Sun, 09 Jun 2024 19:08:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7042571df69sm2862803b3a.52.2024.06.09.19.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 19:08:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][meta-python][PATCH] python3-pefile: Move from meta-python to meta-oe
Date: Sun,  9 Jun 2024 19:08:17 -0700
Message-ID: <20240610020817.3077559-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 02:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110791

- This recipe is needed by newer versions of fwupd from meta-oe
- Add ptest support for python3-pefile
- Add python3-pefile to PTESTS_FAST_META_OE since tests take < 30s

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 .../python/python3-pefile/run-ptest           |  3 ++
 .../python/python3-pefile_2023.2.7.bb         | 30 +++++++++++++++++++
 .../python/python3-pefile_2023.2.7.bb         | 16 ----------
 4 files changed, 34 insertions(+), 16 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/python/python3-pefile/run-ptest
 create mode 100644 meta-oe/recipes-devtools/python/python3-pefile_2023.2.7.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index a29408a822..eaa86c411b 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -36,6 +36,7 @@ PTESTS_FAST_META_OE = "\
     oprofile \
     protobuf \
     pv \
+    python3-pefile \
     sdbus-c++ \
     uthash \
     xmlsec1 \
diff --git a/meta-oe/recipes-devtools/python/python3-pefile/run-ptest b/meta-oe/recipes-devtools/python/python3-pefile/run-ptest
new file mode 100644
index 0000000000..95ae72306f
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python3-pefile/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake --ignore=./tests/pefile_test.py
diff --git a/meta-oe/recipes-devtools/python/python3-pefile_2023.2.7.bb b/meta-oe/recipes-devtools/python/python3-pefile_2023.2.7.bb
new file mode 100644
index 0000000000..76837434df
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python3-pefile_2023.2.7.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Python PE parsing module"
+DESCRIPTION = "A multi-platform Python module to parse and work with Portable Executable (PE) files."
+HOMEPAGE = "https://github.com/erocarrera/pefile"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=38066667888b01d8118ff9cc23da1873"
+
+inherit setuptools3 ptest
+SRCREV = "1ab2807c4eec16041e791d7a6acc68cc23fd5266"
+SRC_URI = "git://github.com/erocarrera/pefile;branch=master;protocol=https \
+           file://run-ptest"
+S = "${WORKDIR}/git"
+
+BBCLASSEXTEND = "native nativesdk"
+
+do_install_ptest() {
+   install -d ${D}${PTEST_PATH}/tests
+   cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS:${PN} += " \
+    python3-mmap \
+    python3-netclient \
+    python3-stringold \
+"
+RDEPENDS:${PN}-ptest += "\
+    python3-coverage \
+    python3-pytest \
+    python3-tox \
+    python3-unittest-automake-output \
+"
diff --git a/meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb b/meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb
deleted file mode 100644
index 50dae7b407..0000000000
--- a/meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Python PE parsing module"
-DESCRIPTION = "A multi-platform Python module to parse and work with Portable Executable (PE) files."
-HOMEPAGE = "https://github.com/erocarrera/pefile"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=38066667888b01d8118ff9cc23da1873"
-
-inherit setuptools3 pypi ptest
-SRC_URI[sha256sum] = "82e6114004b3d6911c77c3953e3838654b04511b8b66e8583db70c65998017dc"
-
-BBCLASSEXTEND = "native nativesdk"
-
-RDEPENDS:${PN} += " \
-    python3-mmap \
-    python3-netclient \
-    python3-stringold \
-"

