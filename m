Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.23480.1586111986287249976
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 11:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id c9so12968400otl.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 11:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wkz/EQHYYNl8Z0xfl2yObU0zHX+Q2jG6SGbm04+6GGc=;
        b=ArDOgynTbwYTQ6kK27TXZ3Efb7nquOHCxUeqot1SpkvIKM4FDlI39VRc2Ca27bW1FT
         Ethk5WEHufY9g0zNAA+JJ4EJ4A3lSqjEAaNgOhntoXq99JG4ABZLIRrA35QlfUWYZMo6
         FL0Ya3mS3iGztsf9/v4QY0jptGY6emCN5xzLD4A1tsjigp4D5lW3rPfFRqCySH6yqswi
         Fxhb+ipQ/iFIHZmmRuZY6RahdeUXHPXS9ITo6AkjR0T7zCZxReJgSW6D8ufATO26KzCO
         UWWEZMLLbZ1eqWhAK/EWZNefFnnecp7wvmAnZ+ZmORuGhMf1C/7+q5VMaiKm97uPswhr
         xllQ==
X-Gm-Message-State: AGi0PuZllE0d6aZJtuEEU1F0E6gQScePrNi9UhIoeHrThdUvr2m35kJa
	SpyikM8opztHVwQE+r5k1Mgtoj3w6PY=
X-Google-Smtp-Source: APiQypLE3CsCNGOGsJhQZ/2uWShEPreEcFNtWnK7ibYCcDOmTKPZH1KOu30RaL9//8U6IZ5o+6rzsw==
X-Received: by 2002:a9d:6944:: with SMTP id p4mr10936372oto.220.1586111985236;
        Sun, 05 Apr 2020 11:39:45 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q22sm3833927oic.22.2020.04.05.11.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 11:39:44 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 03/15] python-pymongo: consolidate inc and bb files into a single bb file
Date: Sun,  5 Apr 2020 14:39:17 -0400
Message-Id: <20200405183929.28266-3-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200405183929.28266-1-derek@asterius.io>
References: <20200405183929.28266-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-pymongo.inc                 | 29 -----------------
 .../python/python3-pymongo_3.10.1.bb          | 31 ++++++++++++++++++-
 2 files changed, 30 insertions(+), 30 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pymongo.inc

diff --git a/meta-python/recipes-devtools/python/python-pymongo.inc b/meta-python/recipes-devtools/python/python-pymongo.inc
deleted file mode 100644
index 2b9794f9c4..0000000000
--- a/meta-python/recipes-devtools/python/python-pymongo.inc
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "Python driver for MongoDB <http://www.mongodb.org>"
-DESCRIPTION = "\
-The PyMongo distribution contains tools for interacting with MongoDB \
-database from Python. The bson package is an implementation of the BSON \
-format for Python. The pymongo package is a native Python driver for \
-MongoDB. The gridfs package is a gridfs implementation on top of pymongo."
-HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
-
-SRC_URI[md5sum] = "e31b9c0190c9eaf1f792d0277b2a8ebe"
-SRC_URI[sha256sum] = "993257f6ca3cde55332af1f62af3e04ca89ce63c08b56a387cdd46136c72f2fa"
-
-PACKAGES =+ "${PYTHON_PN}-bson"
-
-FILES_${PYTHON_PN}-bson = "${PYTHON_SITEPACKAGES_DIR}/bson/*"
-
-RDEPENDS_${PYTHON_PN}-bson += " \
-     ${PYTHON_PN}-datetime \
-     ${PYTHON_PN}-json \
-     ${PYTHON_PN}-netclient \
-     ${PYTHON_PN}-numbers \
-     ${PYTHON_PN}-threading \
-"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-bson \
-    ${PYTHON_PN}-pprint \
-"
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.10.1.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.10.1.bb
index 5164b186bf..f69ca53cf5 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_3.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_3.10.1.bb
@@ -1,2 +1,31 @@
+SUMMARY = "Python driver for MongoDB <http://www.mongodb.org>"
+DESCRIPTION = "\
+The PyMongo distribution contains tools for interacting with MongoDB \
+database from Python. The bson package is an implementation of the BSON \
+format for Python. The pymongo package is a native Python driver for \
+MongoDB. The gridfs package is a gridfs implementation on top of pymongo."
+HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRC_URI[md5sum] = "e31b9c0190c9eaf1f792d0277b2a8ebe"
+SRC_URI[sha256sum] = "993257f6ca3cde55332af1f62af3e04ca89ce63c08b56a387cdd46136c72f2fa"
+
 inherit pypi setuptools3
-require python-pymongo.inc
+
+PACKAGES =+ "${PYTHON_PN}-bson"
+
+FILES_${PYTHON_PN}-bson = "${PYTHON_SITEPACKAGES_DIR}/bson/*"
+
+RDEPENDS_${PYTHON_PN}-bson += " \
+     ${PYTHON_PN}-datetime \
+     ${PYTHON_PN}-json \
+     ${PYTHON_PN}-netclient \
+     ${PYTHON_PN}-numbers \
+     ${PYTHON_PN}-threading \
+"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-bson \
+    ${PYTHON_PN}-pprint \
+"
-- 
2.17.1

