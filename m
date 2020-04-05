Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.23406.1586111985204149809
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 11:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id k9so11129920oia.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 11:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hYNDXKkONRvbdLu0UXW489iGgS85YHnSD8ch4GFdxEo=;
        b=OOQpjYa8mwoo+GYK4vc/ZGHbmHGocoY8IE6BYAL2PlYMq4NTeNbWyhLZZ5Ry9fHZzh
         jGY9CqO3yxPsgVrTAkHM1bIl4SQrJrRT1okbQ469l2q/pEzaNglUVYWc3yqmMmjjkfy8
         wnQG98ZNbcYmWUErpen5T6KzB7aa9LvdiS953Fzzy9bPth1xIrVBEQQKvCLapRnN+JNr
         qR4PAy7tl3LwwDFoBmXVi3fCAI7Qqt1zZ0dyZ6EEbGyOkjMTnKgLdGaACRW+C+6EuRuF
         SCHqLBxUvbKLuTYPQNTFyhK0KyUL6lLzr/zFocVeyPm29xGea3txUIuU6lm9rM5ReTPg
         ct3g==
X-Gm-Message-State: AGi0PuayaPxo4nTKlQ1QwtmNNLjHv5tn0eQ86XZZU0dpxv+cw904dafj
	cdpA1ILLBpagNOsdEn60DshGuvusAOc=
X-Google-Smtp-Source: APiQypKj5K5g7CNkY6y8jdavv6IAUdHjHTSl1X61lCrz7LTbsWDxssC3RV4lmxkw/O+pKAMxKkLWTw==
X-Received: by 2002:aca:5e0b:: with SMTP id s11mr9843313oib.111.1586111984269;
        Sun, 05 Apr 2020 11:39:44 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q22sm3833927oic.22.2020.04.05.11.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 11:39:43 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 02/15] python-pymysql: consolidate inc and bb files into a single bb file
Date: Sun,  5 Apr 2020 14:39:16 -0400
Message-Id: <20200405183929.28266-2-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200405183929.28266-1-derek@asterius.io>
References: <20200405183929.28266-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-pymysql.inc                 | 18 ------------------
 .../python/python3-pymysql_0.9.3.bb           | 19 +++++++++++++++++--
 2 files changed, 17 insertions(+), 20 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pymysql.inc

diff --git a/meta-python/recipes-devtools/python/python-pymysql.inc b/meta-python/recipes-devtools/python/python-pymysql.inc
deleted file mode 100644
index 8c7f4556cb..0000000000
--- a/meta-python/recipes-devtools/python/python-pymysql.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "A pure-Python MySQL client library"
-DESCRIPTION = " \
-  This package contains a pure-Python MySQL client library, based on PEP 249 \
-  Most public APIs are compatible with mysqlclient and MySQLdb. \
-  "
-SECTION = "devel/python"
-HOMEPAGE = "https://pymysql.readthedocs.io"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=528175c84163bb800d23ad835c7fa0fc"
-
-SRC_URI[md5sum] = "e5d9183cc0a775ac29f9e0365cca6556"
-SRC_URI[sha256sum] = "d8c059dcd81dedb85a9f034d5e22dcb4442c0b201908bede99e306d65ea7c8e7"
-
-inherit pypi
-
-PYPI_PACKAGE = "PyMySQL"
-
-RDEPENDS_${PN} += "${PYTHON_PN}-cryptography"
diff --git a/meta-python/recipes-devtools/python/python3-pymysql_0.9.3.bb b/meta-python/recipes-devtools/python/python3-pymysql_0.9.3.bb
index 13774bd632..6a64ccb161 100644
--- a/meta-python/recipes-devtools/python/python3-pymysql_0.9.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymysql_0.9.3.bb
@@ -1,2 +1,17 @@
-inherit setuptools3
-require python-pymysql.inc
+SUMMARY = "A pure-Python MySQL client library"
+DESCRIPTION = " \
+  This package contains a pure-Python MySQL client library, based on PEP 249 \
+  Most public APIs are compatible with mysqlclient and MySQLdb. \
+  "
+SECTION = "devel/python"
+HOMEPAGE = "https://pymysql.readthedocs.io"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=528175c84163bb800d23ad835c7fa0fc"
+
+SRC_URI[md5sum] = "e5d9183cc0a775ac29f9e0365cca6556"
+SRC_URI[sha256sum] = "d8c059dcd81dedb85a9f034d5e22dcb4442c0b201908bede99e306d65ea7c8e7"
+
+PYPI_PACKAGE = "PyMySQL"
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-cryptography"
-- 
2.17.1

