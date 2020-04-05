Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web12.23515.1586111987250000411
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 11:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id u20so11150500oic.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 11:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yYNNBt44yIEHVw7bkRizsNd9PBAd2pj+Xu9MMrJuXW4=;
        b=UqfBoXISXg54uD9rJyHvT1mpzLblUSHGHro08zewq0WRBoiV66s04G1FhR20uSTeFV
         lLDska4yjbAy4vHgDlKVD1dIqm6sART1e2M49/40BtP5uO5nCWwLwwX+SUt5aKXZCEXb
         ptkAQidBGp+m/g7b0aUBs+8OLqS/BYwwlWvIKtMvgDeP3YOxsJoxT9vxxQS7t4L84+xm
         4qGKIzEHKXYZuxWeBEgJBCU0Y+DcJjHWapOEl/kaFBX6QCiPvm0xyPa0xuh7NWM8clz8
         1A8uCp1mLfzsv+1OQwVtUfkJi+6L0SgT63jfskOf2qT7ywU+jNDPtqQoUNBQpu4F6X9C
         9zJg==
X-Gm-Message-State: AGi0Pua+hZ1lxE61nT4ijDaUQyRtyLnnktXkj0L+t5Mz7x3IYI7ZBBRS
	Z0oGlbCV/VKE4p7wlNovtOJY6wrBFsg=
X-Google-Smtp-Source: APiQypKI3R8Qoo9FLBx6TI1fN12PX2qP3S2KzHn9dG8x0QZ28Bxpr7fuqjCkDEWaadnywvhXhfmicg==
X-Received: by 2002:aca:b5c3:: with SMTP id e186mr9925763oif.114.1586111986189;
        Sun, 05 Apr 2020 11:39:46 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q22sm3833927oic.22.2020.04.05.11.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 11:39:45 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 04/15] python-pymisp: consolidate inc and bb files into a single bb file
Date: Sun,  5 Apr 2020 14:39:18 -0400
Message-Id: <20200405183929.28266-4-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200405183929.28266-1-derek@asterius.io>
References: <20200405183929.28266-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pymisp.inc | 19 -----------------
 .../python/python3-pymisp_2.4.122.bb          | 21 ++++++++++++++++++-
 2 files changed, 20 insertions(+), 20 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pymisp.inc

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
deleted file mode 100644
index d2485ffbde..0000000000
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Python API for MISP"
-HOMEPAGE = "https://github.com/MISP/PyMISP"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
-
-SRC_URI[md5sum] = "ef41185d4c2753dc2c1a9ab937e3614a"
-SRC_URI[sha256sum] = "ecdc362b4bb5dd500a5f0b9e795b35ed75037de64f8dcf39c24d029e7657ad7f"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-dateutil \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-jsonschema \
-    ${PYTHON_PN}-requests \
-    ${PYTHON_PN}-six \
-"
-
-# Fixes: python3-pymisp requires /bin/bash, but no
-# providers found in RDEPENDS_python3-pymisp? [file-rdep
-RDEPENDS_${PN} += "bash"
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.122.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.122.bb
index 4523d9e30a..bf2da00662 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.122.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.122.bb
@@ -1,2 +1,21 @@
+DESCRIPTION = "Python API for MISP"
+HOMEPAGE = "https://github.com/MISP/PyMISP"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
+
+SRC_URI[md5sum] = "ef41185d4c2753dc2c1a9ab937e3614a"
+SRC_URI[sha256sum] = "ecdc362b4bb5dd500a5f0b9e795b35ed75037de64f8dcf39c24d029e7657ad7f"
+
 inherit pypi setuptools3
-require python-pymisp.inc
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-dateutil \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-jsonschema \
+    ${PYTHON_PN}-requests \
+    ${PYTHON_PN}-six \
+"
+
+# Fixes: python3-pymisp requires /bin/bash, but no
+# providers found in RDEPENDS_python3-pymisp? [file-rdep
+RDEPENDS_${PN} += "bash"
-- 
2.17.1

