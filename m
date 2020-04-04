Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web12.1536.1586020406913276212
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id m14so9228709oic.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nhbkN9+E487QjpvhnPwH7uFNZrZ87Uvi67lXgSxA4YU=;
        b=PdDNMJgWTJHU3M/6UFEaaQyRNdvS1Zgbi+xpCTVMSgEAbSKDJwHSPaoV1eDnOuvNY/
         02qkWcIJLr3m9W4b0KP092kufoQV1lYwb5KHyjtBfn+PjpUenpHxx0cR66X0G4vwUp6y
         L7roeDjA9nMj6G7opEHX+qL8qRse2TbEc/K2pesOQsl70ZjpCY6LipUxQPoHj/zkXvhA
         6S67fFxf4AM4lrcFtNzqrvwsPIes4dqjx076llkfMuSI184uJCZzjz5QrrRx4U10O3vS
         6gdlESx0e5RcUpAzsfX9aZL4d+CXtyMr1fbZefrjqVbBBXFPj0uHevYu9cHMmJBWlWdX
         n3xA==
X-Gm-Message-State: AGi0PuYL32U0JKrWJVEVB1BfbFz0VVAk54IC3J8RGza182iQYp3Aokq2
	I20y6wDt8dt3jwxOs5QX/xCUuMQXxA4=
X-Google-Smtp-Source: APiQypJFr2bEy6lpJTFagGNwOUsIgfaECNd2UHgQQPCKguPm76b8Dib12Awam3BFePgRZZX+ciUzUA==
X-Received: by 2002:aca:646:: with SMTP id 67mr7105280oig.4.1586020405968;
        Sat, 04 Apr 2020 10:13:25 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:25 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 21/27] python-sh: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:45 -0400
Message-Id: <20200404171251.19823-21-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-sh.inc     | 32 -------------------
 .../python/python3-sh_1.12.14.bb              | 23 +++++++++++--
 2 files changed, 21 insertions(+), 34 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-sh.inc

diff --git a/meta-python/recipes-devtools/python/python-sh.inc b/meta-python/recipes-devtools/python/python-sh.inc
deleted file mode 100644
index f2fd562bb5..0000000000
--- a/meta-python/recipes-devtools/python/python-sh.inc
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "Python subprocess replacement"
-HOMEPAGE = "https://github.com/amoffat/sh"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6"
-
-SRC_URI[md5sum] = "a8351aef25d25f707c17e0a7a6280251"
-SRC_URI[sha256sum] = "b52bf5833ed01c7b5c5fb73a7f71b3d98d48e9b9b8764236237bdc7ecae850fc"
-
-PYPI_PACKAGE = "sh"
-
-inherit pypi
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-codecs \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-resource \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-terminal \
-    ${PYTHON_PN}-tests \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-unixadmin \
-"
-
-# WARNING: We were unable to map the following python package/module
-# dependencies to the bitbake packages which include them:
-#    coverage - only used in test and there is a check to see if it is
-#               available before importing.
-#    queue - part of threading
-#    signal - part of core in python3. not sure how it is imported in python2.
-#             No complants in compiling.
diff --git a/meta-python/recipes-devtools/python/python3-sh_1.12.14.bb b/meta-python/recipes-devtools/python/python3-sh_1.12.14.bb
index 812bd4b1ac..b7858734b2 100644
--- a/meta-python/recipes-devtools/python/python3-sh_1.12.14.bb
+++ b/meta-python/recipes-devtools/python/python3-sh_1.12.14.bb
@@ -1,5 +1,24 @@
-require python-sh.inc
-inherit setuptools3
+SUMMARY = "Python subprocess replacement"
+HOMEPAGE = "https://github.com/amoffat/sh"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6"
+
+SRC_URI[md5sum] = "a8351aef25d25f707c17e0a7a6280251"
+SRC_URI[sha256sum] = "b52bf5833ed01c7b5c5fb73a7f71b3d98d48e9b9b8764236237bdc7ecae850fc"
+
+PYPI_PACKAGE = "sh"
+
+inherit pypi setuptools3
 
 RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-codecs \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-resource \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-terminal \
+    ${PYTHON_PN}-tests \
+    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-unixadmin \
 "
-- 
2.17.1

