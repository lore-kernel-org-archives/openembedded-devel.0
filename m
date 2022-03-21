Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55AB1C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 00:51:11 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.24908.1647823870902312220
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 17:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Xp8UjMaO;
 spf=pass (domain: konsulko.com, ip: 209.85.219.53,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qv1-f53.google.com with SMTP id kd12so10524418qvb.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 17:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IVvQaoPiSKrV8YXICQPfA40i08ZA3VlqhNtWpO1U9X0=;
        b=Xp8UjMaO4G8W2GQyLLHu14SCPNGUBOG4UQoosuBqqL/b1+3J71H+jEO6vIv3KioAH8
         mXgvGW94Z4ajz4f9QU2XR3/xGYjLgIrWxR214OR9DH4tJZ4rw1fkZr4p0zvQQj7NYiBs
         wKCq5eJ043a3iqJrHM9Mpghl9C3orxM1xPp0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IVvQaoPiSKrV8YXICQPfA40i08ZA3VlqhNtWpO1U9X0=;
        b=LV+hlurgAkwy6KfGtJqGpEDgUvV5+vdAKNxXDIXxeqSKDbjufdw6aNoBl+IcUHeZNx
         vI0/Fcne3QkIcpNbpHTFK/F5Ft1C+nN7cRw9+ABDY+kknFZVt2E6asYRq03CIFRYwDo3
         yBCOGYz312HItBnoUqzpIqb2ok0YSK7PReftVpH8XugF6aYTekX07DKsOGlXoY4dHrpN
         6gi2musYnTEGFSPNZkv3/h0FgCuYx0C0JJKfxlipSMl7ZsMDWXzaldiEZFot5TC9LWym
         y83akBqWMNRWyb+8mrYcxc7FEYtctN2aliYjBEk1oGobaV3gZtURAr4XFHE4PHuvbeVp
         dNZg==
X-Gm-Message-State: AOAM530lM0jmY0Qx1PW/q8MDJVeCrTxc5W3nLTqoDl8W6tBb45h06PEC
	Qr+X+zvK63sR6dIbVW7CUGnzpfeh+74wRA==
X-Google-Smtp-Source: 
 ABdhPJyL3QDTBotBEcM/FgsP36/nok0wC5weaS6FkgOym7R4DuJrwkNv8RUh7/tACUsS8/WOsS7x8w==
X-Received: by 2002:a05:6214:dae:b0:441:1b28:567a with SMTP id
 h14-20020a0562140dae00b004411b28567amr3541520qvh.49.1647823869552;
        Sun, 20 Mar 2022 17:51:09 -0700 (PDT)
Received: from ghidorah.spiteful.org (192-0-174-222.cpe.teksavvy.com.
 [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 c20-20020a05622a025400b002e1dd71e797sm10493790qtx.15.2022.03.20.17.51.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 17:51:08 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/8] python3-pyasn1: Remove
Date: Sun, 20 Mar 2022 20:50:38 -0400
Message-Id: 
 <89a1a8f99bfc03209a6d13551df6f190504c52dd.1647823458.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647823458.git.scott.murray@konsulko.com>
References: <cover.1647823458.git.scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Mar 2022 00:51:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96095

This recipe has been moved to oe-core.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 -
 .../recipes-devtools/python/python-pyasn1.inc | 31 -------------------
 .../python/python3-pyasn1/run-ptest           |  3 --
 .../python/python3-pyasn1_0.4.8.bb            |  2 --
 4 files changed, 37 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyasn1.inc
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyasn1/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyasn1_0.4.8.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 9fe47ea89..331c6eba7 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -284,7 +284,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-py-cpuinfo \
     python3-py-ubjson \
     python3-pyalsaaudio \
-    python3-pyasn1 \
     python3-pyasn1-modules \
     python3-pyatspi \
     python3-pyaudio \
diff --git a/meta-python/recipes-devtools/python/python-pyasn1.inc b/meta-python/recipes-devtools/python/python-pyasn1.inc
deleted file mode 100644
index 6cbed0fcd..000000000
--- a/meta-python/recipes-devtools/python/python-pyasn1.inc
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "Python library implementing ASN.1 types."
-HOMEPAGE = "http://pyasn1.sourceforge.net/"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=a14482d15c2249de3b6f0e8a47e021fd"
-
-SRC_URI[md5sum] = "dffae4ff9f997a83324b3f33fe62be54"
-SRC_URI[sha256sum] = "aef77c9fb94a3ac588e87841208bdec464471d9871bd5050a287cc9a475cd0ba"
-
-RDEPENDS:${PN}:class-target += " \
-    ${PYTHON_PN}-codecs \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-math \
-    ${PYTHON_PN}-shell \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-
-inherit ptest
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1/run-ptest b/meta-python/recipes-devtools/python/python3-pyasn1/run-ptest
deleted file mode 100644
index b63c4de0d..000000000
--- a/meta-python/recipes-devtools/python/python3-pyasn1/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1_0.4.8.bb b/meta-python/recipes-devtools/python/python3-pyasn1_0.4.8.bb
deleted file mode 100644
index a5e2a7136..000000000
--- a/meta-python/recipes-devtools/python/python3-pyasn1_0.4.8.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools3
-require python-pyasn1.inc
-- 
2.35.1


