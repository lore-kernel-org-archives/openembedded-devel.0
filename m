Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web12.8716.1586006960260259404
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 06:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id t28so10362081ott.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 06:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7xSj4ceyd/ftmOZUrHAxJlTXNe1TSry/tO89j0B7j8Y=;
        b=scZOugVxjj+rVSY1zq5S3H7h60x656nVE5Cfswp6/V8vGSy3WVCSp0/SmQJ/WUUieU
         oYBWt4uYk9Uz7OC3pFUwfVlsU+fhBlGHP+VHhn9LkIoyTNv9uwRIGmmbojLm2DHgOms4
         7eHGAsEp7n+3m5zKW5FlntrWUPshOnpn1NS94pbgFnkHPEkAZ4MH3WzlJb4PrC7kXpIl
         4DmsMq5x/RsZ34DRXE+Upwb6aOSm8GhUne7odvoPhIp1Va6cawLAB2R9Sr/Jv5Jnw5PO
         z1nREE8ZOMmG2qBzIfPt66gp82A7cSe02EckAl5R6bC7qRvTmMsoWPP1Sg0soaRW4kPZ
         rcOA==
X-Gm-Message-State: AGi0Pua7tfBGWYgSyQZFSZvhwafr1CeDhCwSFJjlpbp8HXCCbwDIfsWM
	klcirVDOZ2UVH6VjQYSQClT/ZoIMH/c=
X-Google-Smtp-Source: APiQypKJv1JKrGqLy+9Qgc8X88YVcMqNP/CP7k5/KVmCGwp2U13EecewFZiqfg35SBILmQtINFtgBA==
X-Received: by 2002:a9d:178a:: with SMTP id j10mr10204706otj.182.1586006959348;
        Sat, 04 Apr 2020 06:29:19 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id t17sm2813013oof.43.2020.04.04.06.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 06:29:18 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 11/11] python-twitter: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 09:28:46 -0400
Message-Id: <20200404132846.16832-11-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404132846.16832-1-derek@asterius.io>
References: <20200404132846.16832-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-twitter.inc | 17 -----------------
 .../python/python3-twitter_3.8.0.bb            | 18 +++++++++++++++++-
 2 files changed, 17 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-twitter.inc

diff --git a/meta-python/recipes-devtools/python/python-twitter.inc b/meta-python/recipes-devtools/python/python-twitter.inc
deleted file mode 100644
index ac3f65279a..0000000000
--- a/meta-python/recipes-devtools/python/python-twitter.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Twitter for Python"
-DESCRIPTION = "Python module to support twitter API"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=8f702b489acb6863cec8b261a55931d8"
-
-SRC_URI[md5sum] = "8aeff278b7cefcd384c65929bc921e2c"
-SRC_URI[sha256sum] = "8abd828ba51a85a2b5bb7373715d6d3bb32d18ac624e3a4db02e4ef8ab48316b"
-
-PYPI_PACKAGE = "tweepy"
-
-RDEPENDS_${PN} += "\
-        ${PYTHON_PN}-pip \
-        ${PYTHON_PN}-pysocks \
-        ${PYTHON_PN}-requests \
-        ${PYTHON_PN}-six \
-        "
diff --git a/meta-python/recipes-devtools/python/python3-twitter_3.8.0.bb b/meta-python/recipes-devtools/python/python3-twitter_3.8.0.bb
index c2e4d2ebd3..78f66a4435 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_3.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_3.8.0.bb
@@ -1,3 +1,19 @@
-require python-twitter.inc
+SUMMARY = "Twitter for Python"
+DESCRIPTION = "Python module to support twitter API"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=8f702b489acb6863cec8b261a55931d8"
+
+SRC_URI[md5sum] = "8aeff278b7cefcd384c65929bc921e2c"
+SRC_URI[sha256sum] = "8abd828ba51a85a2b5bb7373715d6d3bb32d18ac624e3a4db02e4ef8ab48316b"
+
+PYPI_PACKAGE = "tweepy"
+
 inherit pypi setuptools3
 
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-pip \
+    ${PYTHON_PN}-pysocks \
+    ${PYTHON_PN}-requests \
+    ${PYTHON_PN}-six \
+"
-- 
2.17.1

