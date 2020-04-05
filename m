Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.23482.1586111988301437081
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 11:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id m2so13056300otr.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 11:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LBnf+Gk2Y1fuJEF+VjGGsLeHGkD5XN5MLXzkgyMRTpc=;
        b=iH6xIIaHGl6Q3FtcseatlOe78+CX/0QO0kCdB1+EmQCWLOXwISkwcpY987i/LLLg3c
         5eHGRnTkMynggxA3t/swUtJDyPDh+vCnW0JwpvBW7sc25KgUtQ6L9V/DYR8e6ecdUZH2
         OFFGMVU4zxIrLC7+1O6VUoxXDx/W/I9za/0lntN/+Bi0ulUG/b+V6WR00lUPzRfhS0zc
         TQ9CnsraAJFEJIxUq1WxBsu2rvuqC3jFcqSEYU2RMRRF+uMk7q+nbscLPll/VNAF4mFV
         3IdNlN39VqFXun3RxQ1heDCMM5Z/Fpxr+aWdxeX8ij7dUpHgeubR0AVLunCMewnbyOaD
         zn4A==
X-Gm-Message-State: AGi0PuZQF7/q2FW4CuIPYR1Ex1OtIK/YCKRhSGPQr5MeznjTuLu/efI4
	w2yKc4PAseK6f5dW8zMzIuBVa6Va7LA=
X-Google-Smtp-Source: APiQypLpc5wvPr6AG1XZkcEDxV3r7T7Yu10v3LdHM7tiTJPats9n0LHK5lVl828bmDvqyMVYrGwKww==
X-Received: by 2002:a9d:6a12:: with SMTP id g18mr14354279otn.19.1586111987335;
        Sun, 05 Apr 2020 11:39:47 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q22sm3833927oic.22.2020.04.05.11.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 11:39:46 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 05/15] python-pylint: consolidate inc and bb files into a single bb file
Date: Sun,  5 Apr 2020 14:39:19 -0400
Message-Id: <20200405183929.28266-5-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200405183929.28266-1-derek@asterius.io>
References: <20200405183929.28266-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pylint.inc | 38 ------------------
 .../python/python3-pylint_1.8.3.bb            | 40 ++++++++++++++++++-
 2 files changed, 38 insertions(+), 40 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pylint.inc

diff --git a/meta-python/recipes-devtools/python/python-pylint.inc b/meta-python/recipes-devtools/python/python-pylint.inc
deleted file mode 100644
index ba85b98878..0000000000
--- a/meta-python/recipes-devtools/python/python-pylint.inc
+++ /dev/null
@@ -1,38 +0,0 @@
-SUMMARY="Pylint is a Python source code analyzer"
-HOMEPAGE= "http://www.pylint.org/"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
-
-SRC_URI[md5sum] = "2eb5f3cb8fe567eaf5420dd415012202"
-SRC_URI[sha256sum] = "c77311859e0c2d7932095f30d2b1bfdc4b6fe111f534450ba727a52eae330ef2"
-
-inherit pypi
-
-DEPENDS += "${PYTHON_PN}-pytest-runner-native"
-
-do_install_append(){
-    rm ${D}${bindir}/pylint
-    cat >> ${D}${bindir}/pylint <<EOF
-#!/usr/bin/env ${PYTHON_PN}
-from pylint import run_pylint
-run_pylint()
-EOF
-    chmod 755 ${D}${bindir}/pylint
-    sed -i -e 's:^#!/usr/bin/python:#!/usr/bin/env\ ${PYTHON_PN}:g' ${D}/${PYTHON_SITEPACKAGES_DIR}/pylint/test/data/ascript
-}
-
-PACKAGES =+ "${PN}-tests"
-FILES_${PN}-tests+= " \
-    ${PYTHON_SITEPACKAGES_DIR}/pylint/test/ \
-    ${PYTHON_SITEPACKAGES_DIR}/pylint/testutils.py \
-"
-
-RDEPENDS_${PN} += "${PYTHON_PN}-astroid \
-                   ${PYTHON_PN}-isort \
-                   ${PYTHON_PN}-numbers \
-                   ${PYTHON_PN}-shell \
-                   ${PYTHON_PN}-json \
-                   ${PYTHON_PN}-pkgutil \
-                   ${PYTHON_PN}-difflib \
-                   ${PYTHON_PN}-netserver \
-                  "
diff --git a/meta-python/recipes-devtools/python/python3-pylint_1.8.3.bb b/meta-python/recipes-devtools/python/python3-pylint_1.8.3.bb
index 563e8316cf..7a873a1e12 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_1.8.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_1.8.3.bb
@@ -1,2 +1,38 @@
-inherit setuptools3 python3-dir
-require python-pylint.inc
+SUMMARY="Pylint is a Python source code analyzer"
+HOMEPAGE= "http://www.pylint.org/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
+
+SRC_URI[md5sum] = "2eb5f3cb8fe567eaf5420dd415012202"
+SRC_URI[sha256sum] = "c77311859e0c2d7932095f30d2b1bfdc4b6fe111f534450ba727a52eae330ef2"
+
+inherit pypi setuptools3 python3-dir
+
+DEPENDS += "${PYTHON_PN}-pytest-runner-native"
+
+do_install_append(){
+    rm ${D}${bindir}/pylint
+    cat >> ${D}${bindir}/pylint <<EOF
+#!/usr/bin/env ${PYTHON_PN}
+from pylint import run_pylint
+run_pylint()
+EOF
+    chmod 755 ${D}${bindir}/pylint
+    sed -i -e 's:^#!/usr/bin/python:#!/usr/bin/env\ ${PYTHON_PN}:g' ${D}/${PYTHON_SITEPACKAGES_DIR}/pylint/test/data/ascript
+}
+
+PACKAGES =+ "${PN}-tests"
+FILES_${PN}-tests+= " \
+    ${PYTHON_SITEPACKAGES_DIR}/pylint/test/ \
+    ${PYTHON_SITEPACKAGES_DIR}/pylint/testutils.py \
+"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-astroid \
+                   ${PYTHON_PN}-isort \
+                   ${PYTHON_PN}-numbers \
+                   ${PYTHON_PN}-shell \
+                   ${PYTHON_PN}-json \
+                   ${PYTHON_PN}-pkgutil \
+                   ${PYTHON_PN}-difflib \
+                   ${PYTHON_PN}-netserver \
+                  "
-- 
2.17.1

