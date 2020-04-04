Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web12.3062.1586024478745058564
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 11:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id y71so9292179oia.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 11:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2HEX0t7BvmSz1KitB/sqBe5jx9e/6/yQ389ytvhbXJk=;
        b=U1ZL22L/MBH6pYUZW/nKyqoOWNsCgaUEMNnzZjcGTK2BKf4h3IQMXGL51EQ5jCQx+7
         BFYKyoDaCHFbubxeRtiSaIv61q0CqxaKGBeazwTe6Wj9hmrWyAJX02kA8cZ9xMNMSgGx
         yFI2wkUaqIK+DZRm9nq9xhul0bZ5ZHinYTFarBecJECNWmGUb9lwPvdXHRy/RBUYNwMV
         mElhI6TGp+gsY2q8dKGQB7nDTIqadsQXZx6d7D3GbiE2hyzD8uuZU6Ihs0OTRwHnFyV9
         s0qL/52ialaSnlTG8OIepRjvGqB2LLTOuVg6x1l/yKUh9dk8dlIWQ4nkAqjHHflFDD6E
         vvFA==
X-Gm-Message-State: AGi0Puaf4FR+AOaFVEMJ1xKWUHisVk0+lGtXFCa7HT+udDB7ghtVMw18
	mSQQO7L9z8+qtaOPGFSOadghsyyXiAo=
X-Google-Smtp-Source: APiQypJWBPUJPcOQD03uAcqxMg/OgJwYKRlBfRlC/SgzKpjEllGfglGxG/hZ7uSHFpJo822i/InFSA==
X-Received: by 2002:aca:4991:: with SMTP id w139mr7541817oia.145.1586024477796;
        Sat, 04 Apr 2020 11:21:17 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id j23sm3162059oib.32.2020.04.04.11.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 11:21:17 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 01/12] python-redis: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 14:20:53 -0400
Message-Id: <20200404182104.21027-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-redis.inc       | 12 ------------
 .../python/python3-redis_2.10.6.bb                 | 14 +++++++++++++-
 2 files changed, 13 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-redis.inc

diff --git a/meta-python/recipes-devtools/python/python-redis.inc b/meta-python/recipes-devtools/python/python-redis.inc
deleted file mode 100644
index 1a65d73144..0000000000
--- a/meta-python/recipes-devtools/python/python-redis.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "Python client for Redis key-value store"
-DESCRIPTION = "The Python interface to the Redis key-value store."
-HOMEPAGE = "http://github.com/andymccurdy/redis-py"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=51d9ad56299ab60ba7be65a621004f27"
-
-SRC_URI[md5sum] = "048348d8cfe0b5d0bba2f4d835005c3b"
-SRC_URI[sha256sum] = "a22ca993cea2962dbb588f9f30d0015ac4afcc45bee27d3978c0dbe9e97c6c0f"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-datetime \
-"
diff --git a/meta-python/recipes-devtools/python/python3-redis_2.10.6.bb b/meta-python/recipes-devtools/python/python3-redis_2.10.6.bb
index b192ed8725..3acc2fdaea 100644
--- a/meta-python/recipes-devtools/python/python3-redis_2.10.6.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_2.10.6.bb
@@ -1,2 +1,14 @@
+SUMMARY = "Python client for Redis key-value store"
+DESCRIPTION = "The Python interface to the Redis key-value store."
+HOMEPAGE = "http://github.com/andymccurdy/redis-py"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=51d9ad56299ab60ba7be65a621004f27"
+
+SRC_URI[md5sum] = "048348d8cfe0b5d0bba2f4d835005c3b"
+SRC_URI[sha256sum] = "a22ca993cea2962dbb588f9f30d0015ac4afcc45bee27d3978c0dbe9e97c6c0f"
+
 inherit pypi setuptools3
-require python-redis.inc
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+"
-- 
2.17.1

