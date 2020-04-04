Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web12.8711.1586006954447651318
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 06:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id x11so10363568otp.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 06:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dOPY1IxyeaRhnr3fGNKVTg5bFt7dT5hQ5msvPboCivA=;
        b=WDIFTcTMbJT58DuvtZo6KC0rJ3kwc9+rb1J9VBF+xwCfn3OhwUEt7cGM78ceqy5bje
         lnMuDI04aDHGQmaLWfN+3T9CWIzHg7lANrQdCxLSMyLw3bAFVRwWe+HJRqQby5vr2s4r
         TlmE8XH/gJ5VhfqHHeZ0Q1uwBzOE9P3FmI92neu77FsjoM076O/67F0BMFPUDdcNhPuP
         VVvAM/d+K1pxDuoHVQFi0dISEEc5iLgpzCHXTp9IltjTnWVUC3GsD1hP+Rw7BKG6hHRa
         qVlTgoufyWZ/hUiXRzsvPhPWfGJRQfz5ZOOA/BXrX0LRPVCIgLKNJH9ETfGUFgXf1eEM
         7Ndw==
X-Gm-Message-State: AGi0PubCpfFI8WB0DYGpCg4z8cxJBLNi/Q7nw2FX8UZWMlfK+T2nuXTf
	WFSZoa0oqK7216lncVoK0Kj0J2k0j50=
X-Google-Smtp-Source: APiQypI0ccUfX0Mg/bToL/KqEMpP3Y7yv1oDYYk150J+AwcnKlkcXt2KXARcNf95BLxSqy4TCFNMmQ==
X-Received: by 2002:a05:6830:1aca:: with SMTP id r10mr9302952otc.330.1586006953487;
        Sat, 04 Apr 2020 06:29:13 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id t17sm2813013oof.43.2020.04.04.06.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 06:29:12 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 05/11] python-urllib3: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 09:28:40 -0400
Message-Id: <20200404132846.16832-5-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404132846.16832-1-derek@asterius.io>
References: <20200404132846.16832-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-urllib3.inc                 | 21 -----------------
 .../python/python3-urllib3_1.25.7.bb          | 23 ++++++++++++++++++-
 2 files changed, 22 insertions(+), 22 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-urllib3.inc

diff --git a/meta-python/recipes-devtools/python/python-urllib3.inc b/meta-python/recipes-devtools/python/python-urllib3.inc
deleted file mode 100644
index b7edc03f0c..0000000000
--- a/meta-python/recipes-devtools/python/python-urllib3.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Python HTTP library with thread-safe connection pooling, file post support, sanity friendly, and more"
-HOMEPAGE = "https://github.com/shazow/urllib3"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=65715c2eb961313d71b297dd5a04f85e"
-
-SRC_URI[md5sum] = "85e1e3925f8c1095172bff343f3312ed"
-SRC_URI[sha256sum] = "f3c5fd51747d450d4dcf6f923c81f78f811aab8205fda64b0aba34a4e48b0745"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-certifi \
-    ${PYTHON_PN}-cryptography \
-    ${PYTHON_PN}-email \
-    ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-pyopenssl \
-    ${PYTHON_PN}-threading \
-"
-
-CVE_PRODUCT = "urllib3"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
index 19eb7025b2..34c15b6c24 100644
--- a/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
+++ b/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
@@ -1,2 +1,23 @@
+SUMMARY = "Python HTTP library with thread-safe connection pooling, file post support, sanity friendly, and more"
+HOMEPAGE = "https://github.com/shazow/urllib3"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=65715c2eb961313d71b297dd5a04f85e"
+
+SRC_URI[md5sum] = "85e1e3925f8c1095172bff343f3312ed"
+SRC_URI[sha256sum] = "f3c5fd51747d450d4dcf6f923c81f78f811aab8205fda64b0aba34a4e48b0745"
+
 inherit pypi setuptools3
-require python-urllib3.inc
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-certifi \
+    ${PYTHON_PN}-cryptography \
+    ${PYTHON_PN}-email \
+    ${PYTHON_PN}-idna \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-pyopenssl \
+    ${PYTHON_PN}-threading \
+"
+
+CVE_PRODUCT = "urllib3"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

