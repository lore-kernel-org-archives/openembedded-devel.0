Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062C7C02194
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 01:39:57 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web10.10521.1738287593220081024
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 17:39:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-71e173ed85bso771691a34.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 17:39:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738287592; x=1738892392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDFFCT9IJbhNlBDI5yVMO4wQeWdX5gI7mPt+hK/VAvM=;
        b=Qq9+z3Qrd7ZiginjFHqQFaloNHdbQ4JxDeSbhgMl0GcIxKwoCvyS4Eij2YjJh9mDu6
         vocpuySjPFDNy521udSHlW7WJ8uHHeItqVQA5PRX6XRhXTTAy1k+S7vvSICBoAPa56+H
         HmvnFk7Jh05vlngp2YnkMatWHckKrJEFAcJeTTEGWFl6sLQgOvfhz5skT1yxU11N27um
         lZ6JjmjwKqf+Ra7lgGPMMofNi4tbGE5YyMhSAtoj8qr4pbig5E2qJXlIf+jbzESH6buJ
         UlSd5t/JDHee0GcflGuW1eaw3cPSR0aa1yomrkyLkzB0xmvWaGcLt9U0fU9Da9V3A3FS
         7eLA==
X-Gm-Message-State: AOJu0Yw9++WIopYsQSqKn3JesCLfKdebvsEIZJmvei+sTKtMPsHPSTYe
	qAr2vL9LIu9u34J/ilNJX8lnDCHv1XAncHchoGGjVYVefgr9erq1UOQR9P4U
X-Gm-Gg: ASbGncvDctNmScErqOc8YqBe9iv0zBoEPE5hCcFLJJswG1rdE2rUZbodRqcxcH7PYDM
	XuetBzk1HIOqYb+T9N+b3ekjEkFAkEY53TVQmInIw1Q3jTJbEXWXZ/6hd/DnOr0hZgc8zW83Sk0
	LlWvfvaIInbGdY//brklWJ47AuHasNuMPafFbRmb9DOfJBA0N3fNY0RR+H6sMVO2/D3+Ib0Km4B
	88WNFrgUiA5yqUFGZd9IvL4Yk+5fdmxikLUcblR5KHiuYVmRq92KdZceL/iTA3dIjeuRy+2bhdw
	Cp2F+h8n/TjTM3iK+x3RoclsiIRrYFvcTAUua22w+RFaquLLec/PhEqsu0Lk
X-Google-Smtp-Source: AGHT+IFkxqhhra1uj/WBS3moNZ+9dnU9HL4S7IQslxnzfOkmTWdWT633A4hoyWyMlzEQ93VxphjhYg==
X-Received: by 2002:a05:6830:2aa0:b0:71d:4086:6072 with SMTP id 46e09a7af769-7265675ff05mr6168985a34.7.1738287591481;
        Thu, 30 Jan 2025 17:39:51 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726618b9f49sm659875a34.54.2025.01.30.17.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 17:39:50 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 01/11] python3-dasbus: update recipe to use the ptest-python-pytest class
Date: Fri, 31 Jan 2025 01:39:25 +0000
Message-Id: <20250131013935.3714521-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 01:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115178

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-dasbus/run-ptest                 |  3 ---
 .../recipes-devtools/python/python3-dasbus_1.7.bb   | 13 ++-----------
 2 files changed, 2 insertions(+), 14 deletions(-)
 delete mode 100755 meta-python/recipes-devtools/python/python3-dasbus/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-dasbus/run-ptest b/meta-python/recipes-devtools/python/python3-dasbus/run-ptest
deleted file mode 100755
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-dasbus/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb b/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
index d1d294a284..141e6bfbaf 100644
--- a/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
@@ -5,18 +5,14 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
 
 SRC_URI = "git://github.com/dasbus-project/dasbus.git;protocol=https;branch=master \
-           file://run-ptest \
 "
 SRCREV = "413cf9a0b7c231468f1d28d9a29dd8dd8bda15c5"
 
 S = "${WORKDIR}/git"
 
-inherit setuptools3 ptest
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+inherit setuptools3 ptest-python-pytest
 
+do_install_ptest:append () {
     # Remove the problematic cases
     # https://github.com/dasbus-project/dasbus/issues/128
     rm -rf ${D}${PTEST_PATH}/tests/lib_dbus.py
@@ -25,8 +21,3 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN} = "python3-pygobject"
-
-RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-    python3-unittest-automake-output \
-"
-- 
2.34.1


