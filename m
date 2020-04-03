Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.7106.1585948927317526521
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 14:22:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id l22so7399876oii.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2020 14:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8He66U1VoMp3YmhwvMaPrv0G0Z2lD9wOx9dMjL9EXo4=;
        b=IFPx2kqyyJwwNvt8ApdY/EMeORbC/oZ4HdyIZzaLc04y9F5euximYgH/h5yYqFjhSw
         nMSdgFFglN6ZMPY/09W5/JQDoMhCS24adhrvQvugaFqjgKmsc6UUE/hyMPxiXw4GVQIA
         Xm/b4Vzh9FiJgm5zHxmytxW+vC/IN8QMJSOAftXbogiCb3rPc5AxKSOsP9bqaAvPgtwa
         jJmRUyK51Le7q2xu0xUA1iMFfuJ4P20xpzi8jhMSqmaEsgXDVVa+wm12Lt9jcIUM5aX3
         7IN4MfurvDgxjNiCUxqCRwcuzce9AVtvP5r6euCYj3wjO9ZSdzQHdC81OC/pxAc27g4L
         1hYA==
X-Gm-Message-State: AGi0PubwAFu57NpVcPfC7PmNVECcYynXiYLDMf3CoT3aauyUObBbisE2
	JV+emYTxtA/v2dE8j2kPK6GZrBNPxno=
X-Google-Smtp-Source: APiQypIqGaPZh0FT1lwvALDJfbUEAx7YcHgMGSvfJdOj4moRQrcxYRshPGSXyvc3QIfQpJnRaNfJkQ==
X-Received: by 2002:aca:2b01:: with SMTP id i1mr4814248oik.162.1585948926046;
        Fri, 03 Apr 2020 14:22:06 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id a76sm2344771oob.5.2020.04.03.14.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 14:22:05 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 04/10] python-yarl: consolidate inc and bb files into a single bb file
Date: Fri,  3 Apr 2020 17:21:14 -0400
Message-Id: <20200403212120.23481-4-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403212120.23481-1-derek@asterius.io>
References: <20200403212120.23481-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-yarl.inc   | 27 ----------------
 .../python/python3-yarl_1.4.2.bb              | 31 +++++++++++++++++--
 2 files changed, 29 insertions(+), 29 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-yarl.inc

diff --git a/meta-python/recipes-devtools/python/python-yarl.inc b/meta-python/recipes-devtools/python/python-yarl.inc
deleted file mode 100644
index 911c79d66f..0000000000
--- a/meta-python/recipes-devtools/python/python-yarl.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "The module provides handy URL class for url parsing and changing"
-HOMEPAGE = "https://github.com/aio-libs/yarl/"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b334fc90d45983db318f54fd5bf6c90b"
-
-SRC_URI[md5sum] = "08ba0d6e18f460b44d9e5459f3d217ba"
-SRC_URI[sha256sum] = "58cd9c469eced558cd81aa3f484b2924e8897049e06889e8ff2510435b7ef74b"
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-PYPI_PACKAGE = "yarl"
-inherit pypi ptest
-RDEPENDS_${PN} = "\
-    ${PYTHON_PN}-multidict \
-    ${PYTHON_PN}-idna \
-"
-
-RDEPENDS_${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.4.2.bb b/meta-python/recipes-devtools/python/python3-yarl_1.4.2.bb
index c5df44216b..15d92065d0 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.4.2.bb
@@ -1,2 +1,29 @@
-inherit setuptools3
-require python-yarl.inc
+SUMMARY = "The module provides handy URL class for url parsing and changing"
+HOMEPAGE = "https://github.com/aio-libs/yarl/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b334fc90d45983db318f54fd5bf6c90b"
+
+SRC_URI[md5sum] = "08ba0d6e18f460b44d9e5459f3d217ba"
+SRC_URI[sha256sum] = "58cd9c469eced558cd81aa3f484b2924e8897049e06889e8ff2510435b7ef74b"
+
+SRC_URI += " \
+    file://run-ptest \
+"
+
+PYPI_PACKAGE = "yarl"
+
+inherit pypi ptest setuptools3
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-multidict \
+    ${PYTHON_PN}-idna \
+"
+
+RDEPENDS_${PN}-ptest += " \
+    ${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.17.1

