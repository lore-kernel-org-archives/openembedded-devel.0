Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
 by mx.groups.io with SMTP id smtpd.web11.9057.1585955007904921911
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 16:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.193, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f193.google.com with SMTP id y71so7652466oia.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2020 16:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UO3NEDwSx7a9miYo8xsVkzTqVQNJpjQRsCoe54mdoVA=;
        b=hj6jTAqWli6qZ5jOsjncMD+AedNFkeLspCR4RIc6uV3JgEVOJyHVPqXUglNeuzDbmS
         d0a018xf+9B/T1oPW6gs76B73GbOWJrLHYsDSn4TLAo2P1mpDZfmDypg2Olp2wjoAn1X
         D4a/ZqpNxw73v+z2NwvnXYd7EudopGvYlHDkVaEFv614eg7xAOkvpa8asL9rbiTRZiZm
         CNP5THcACjAq1OihOXqWXcG5rJSQzN7afm6Ei98TOER8yHgBYETDUYIEzF18H4xXxeLG
         YnvEoElGqzO3/jV0WA/lOIk+JiZlpjmnehnc+yujOk97niqjmR0EeYJd/rRVAQcFitMA
         8O9g==
X-Gm-Message-State: AGi0Pub2ruwRW/w46EheNTxmhRwXD6NbgZTwl7d0cNn5P7tdH5sOd61U
	uOSXE6UtnGHj57DnrMKj95P8TNGeF7U=
X-Google-Smtp-Source: APiQypKo+Cc2ZNvJBAb/r6Txn/N/zYTfVFVJxiLt9xHvIbfnhdqJqlnTXtnP6zF0cmTTXxzd3jipOQ==
X-Received: by 2002:a05:6808:12:: with SMTP id u18mr5202872oic.167.1585955006696;
        Fri, 03 Apr 2020 16:03:26 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id 68sm2464665oon.14.2020.04.03.16.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 16:03:25 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 2/5] python-werkzeug: consolidate inc and bb files into a single bb file
Date: Fri,  3 Apr 2020 19:03:08 -0400
Message-Id: <20200403230311.29817-2-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403230311.29817-1-derek@asterius.io>
References: <20200403230311.29817-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-werkzeug.inc                | 47 -----------------
 .../python/python3-werkzeug_1.0.0.bb          | 50 ++++++++++++++++++-
 2 files changed, 48 insertions(+), 49 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-werkzeug.inc

diff --git a/meta-python/recipes-devtools/python/python-werkzeug.inc b/meta-python/recipes-devtools/python/python-werkzeug.inc
deleted file mode 100644
index e4d3d38d76..0000000000
--- a/meta-python/recipes-devtools/python/python-werkzeug.inc
+++ /dev/null
@@ -1,47 +0,0 @@
-SUMMARY = "The Swiss Army knife of Python web development"
-DESCRIPTION = "\
-Werkzeug started as simple collection of various utilities for WSGI \
-applications and has become one of the most advanced WSGI utility modules. \
-It includes a powerful debugger, full featured request and response objects, \
-HTTP utilities to handle entity tags, cache control headers, HTTP dates, \
-cookie handling, file uploads, a powerful URL routing system and a bunch \
-of community contributed addon modules."
-HOMEPAGE = "http://werkzeug.pocoo.org/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
-
-SRC_URI[md5sum] = "305f75c4a88c96dcdc5654bf2d01bc05"
-SRC_URI[sha256sum] = "169ba8a33788476292d04186ab33b01d6add475033dfc07215e6d219cc077096"
-
-PYPI_PACKAGE = "Werkzeug"
-
-CLEANBROKEN = "1"
-
-PACKAGES =+ "${PN}-tests"
-FILES_${PN}-tests+= " \
-    ${PYTHON_SITEPACKAGES_DIR}/werkzeug/test* \
-    ${PYTHON_SITEPACKAGES_DIR}/werkzeug/__pycache__/test* \
-    ${PYTHON_SITEPACKAGES_DIR}/werkzeug/contrib/test* \
-    ${PYTHON_SITEPACKAGES_DIR}/werkzeug/contrib/__pycache__/test* \
-"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-difflib \
-    ${PYTHON_PN}-email \
-    ${PYTHON_PN}-html \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-pkgutil \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-unixadmin \
-"
-
-RDEPENDS_${PN}-tests = " \
-    ${PN} \
-    ${PYTHON_PN}-unittest \
-"
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_1.0.0.bb b/meta-python/recipes-devtools/python/python3-werkzeug_1.0.0.bb
index 145a1de0a1..3e4374ed4b 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_1.0.0.bb
@@ -1,4 +1,50 @@
+SUMMARY = "The Swiss Army knife of Python web development"
+DESCRIPTION = "\
+Werkzeug started as simple collection of various utilities for WSGI \
+applications and has become one of the most advanced WSGI utility modules. \
+It includes a powerful debugger, full featured request and response objects, \
+HTTP utilities to handle entity tags, cache control headers, HTTP dates, \
+cookie handling, file uploads, a powerful URL routing system and a bunch \
+of community contributed addon modules."
+HOMEPAGE = "http://werkzeug.pocoo.org/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
+
+SRC_URI[md5sum] = "305f75c4a88c96dcdc5654bf2d01bc05"
+SRC_URI[sha256sum] = "169ba8a33788476292d04186ab33b01d6add475033dfc07215e6d219cc077096"
+
+PYPI_PACKAGE = "Werkzeug"
+
 inherit pypi setuptools3
-require python-werkzeug.inc
 
-RDEPENDS_${PN} += "${PYTHON_PN}-misc"
+CLEANBROKEN = "1"
+
+PACKAGES =+ "${PN}-tests"
+FILES_${PN}-tests+= " \
+    ${PYTHON_SITEPACKAGES_DIR}/werkzeug/test* \
+    ${PYTHON_SITEPACKAGES_DIR}/werkzeug/__pycache__/test* \
+    ${PYTHON_SITEPACKAGES_DIR}/werkzeug/contrib/test* \
+    ${PYTHON_SITEPACKAGES_DIR}/werkzeug/contrib/__pycache__/test* \
+"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-difflib \
+    ${PYTHON_PN}-email \
+    ${PYTHON_PN}-html \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-misc \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-pkgutil \
+    ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-unixadmin \
+"
+
+RDEPENDS_${PN}-tests = " \
+    ${PN} \
+    ${PYTHON_PN}-unittest \
+"
-- 
2.17.1

