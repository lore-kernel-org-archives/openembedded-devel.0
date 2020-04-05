Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web12.23520.1586111990247963596
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 11:39:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id r21so2710038oij.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 11:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rSVxd9rqMbKXTaHb3FQvD2zcnBfjzGMewQkAAYoTRWI=;
        b=LpoVGTx2x4akM9Y04IlSwLUxrcgVjVg24CgI3lO6C7OY7V+jNtypK3zsBg+b5441NB
         tqfxiwm1oBY9PC7sy4AZ1kb77sHL6VFIGK5W2942FM7sY2OnMdyZA6W1Fohqm7vso/me
         8ShUDhp3pdeK4pTIpwksMY/T9jyIpVu7jCw9eowiCtj11Wgwtu3u79H2pQ5GYsS8FFxe
         wisYDMntiGBFamCdp6QLSGDxvtDDzFgJZ23c0lhK2ZSJ6Qmixy1g7H15tbtYHWSbryFR
         A1cr9DcOmNYpQtTp8weDxkiIwqh8ZrgRPPV2bS3I+5cf03jMomHcEC57gQcNbyqSho62
         Dtng==
X-Gm-Message-State: AGi0Pub4gVf7zjJknWMtlCYYyI3d+YLTOvUObspArZ7UwHkAJOiwZ3gr
	D85VZswDhmzR9s91f1C/SOeu0v0u4S8=
X-Google-Smtp-Source: APiQypKMtG1MAh2j/jeCsWZeOJXEgE31LRiYpWszD8vrpPHRAS3IbecW7CT8h802cWn6TTrQvnJ5AQ==
X-Received: by 2002:aca:b8c5:: with SMTP id i188mr9840419oif.2.1586111989275;
        Sun, 05 Apr 2020 11:39:49 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q22sm3833927oic.22.2020.04.05.11.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 11:39:48 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 07/15] python-pyjks: consolidate inc and bb files into a single bb file
Date: Sun,  5 Apr 2020 14:39:21 -0400
Message-Id: <20200405183929.28266-7-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200405183929.28266-1-derek@asterius.io>
References: <20200405183929.28266-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pyjks.inc  | 22 -----------------
 .../python/python3-pyjks_19.0.0.bb            | 24 +++++++++++++++++--
 2 files changed, 22 insertions(+), 24 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyjks.inc

diff --git a/meta-python/recipes-devtools/python/python-pyjks.inc b/meta-python/recipes-devtools/python/python-pyjks.inc
deleted file mode 100644
index 9a066f7f1d..0000000000
--- a/meta-python/recipes-devtools/python/python-pyjks.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Pure-Python Java Keystore (JKS) library"
-DESCRIPTION = "PyJKS enables Python projects to load and manipulate\
- Java KeyStore (JKS) data without a JVM dependency. PyJKS supports JKS,\
- JCEKS, BKS and UBER (BouncyCastle) keystores."
-HOMEPAGE = "http://github.com/kurtbrose/pyjks"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9694d6cc724caf7f7386be88a4a81958"
-
-SRC_URI[md5sum] = "b6e8f3b91be355d15e3ba99de2cccf9b"
-SRC_URI[sha256sum] = "9ce5b40289bcdffcd6a8e7118b333ba8ba2ec4c9ebc5e324885cc8a69767011a"
-
-inherit pypi
-
-RDEPENDS_${PN} = "\
-    ${PYTHON_PN}-javaobj-py3 \
-    ${PYTHON_PN}-pyasn1 \
-    ${PYTHON_PN}-pyasn1-modules \
-    ${PYTHON_PN}-pycryptodome \
-    ${PYTHON_PN}-twofish\
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pyjks_19.0.0.bb b/meta-python/recipes-devtools/python/python3-pyjks_19.0.0.bb
index 8982fcebc3..ee2f3075ca 100644
--- a/meta-python/recipes-devtools/python/python3-pyjks_19.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjks_19.0.0.bb
@@ -1,2 +1,22 @@
-require python-pyjks.inc
-inherit setuptools3
+SUMMARY = "Pure-Python Java Keystore (JKS) library"
+DESCRIPTION = "PyJKS enables Python projects to load and manipulate\
+ Java KeyStore (JKS) data without a JVM dependency. PyJKS supports JKS,\
+ JCEKS, BKS and UBER (BouncyCastle) keystores."
+HOMEPAGE = "http://github.com/kurtbrose/pyjks"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9694d6cc724caf7f7386be88a4a81958"
+
+SRC_URI[md5sum] = "b6e8f3b91be355d15e3ba99de2cccf9b"
+SRC_URI[sha256sum] = "9ce5b40289bcdffcd6a8e7118b333ba8ba2ec4c9ebc5e324885cc8a69767011a"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-javaobj-py3 \
+    ${PYTHON_PN}-pyasn1 \
+    ${PYTHON_PN}-pyasn1-modules \
+    ${PYTHON_PN}-pycryptodome \
+    ${PYTHON_PN}-twofish\
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

