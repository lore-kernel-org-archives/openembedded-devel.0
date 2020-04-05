Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web12.26083.1586119358703362865
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 13:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id u20so11335490oic.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 13:42:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=aDEBc1ecckxdqk5OxDklvA9kltIH8eOkwN22jpmEXTU=;
        b=IqjtEZCAxI7aq6ehpngZ8xSgtDn5LbVICTn7X92fhuk98Nk6Lx7nTVqgC7NzvY8p6z
         DBuE0kJSPJNm8AFY+uk9qoCGWq6e7bX6cV5Ks+S3NJme8iiuOCb+vVuhucLPwsygTdc8
         8OxG+qjJVkQv9T6P2RxDo4l3DhSOfLaJEwSN5qHhLHF7JnC/Rg2tN7K9R4mhSV8Zizje
         rD5REOMBCOI613rZ/cvYx7h9/fdzli8yRsvFGXPc5sd7op/NdbPw2ZDwcbcvRdanb/Mg
         xpCCwIU6mTgsGx148lYdx3Ngb7iMFLd/mOL/MBeo4KHJ2xmP76Fijl+kuBuG7hlbuWxx
         JrBQ==
X-Gm-Message-State: AGi0PuamxATQhNlu9KXXcvZooJOjb6GZvgotHDstmjyFjKisDnL6V95p
	Cy2CzZC0n3Rh9sK2SvqYDXihspxYbDc=
X-Google-Smtp-Source: APiQypL9++ry7w91tMOM9d599lmCLxKST5OobaaYhssTlADMZ4coVQbNiesZtvdiMCMvcR/kW//h9g==
X-Received: by 2002:aca:b5c3:: with SMTP id e186mr10195152oif.114.1586119357501;
        Sun, 05 Apr 2020 13:42:37 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id d6sm3905295oos.10.2020.04.05.13.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 13:42:37 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 1/4] python-pycurl: consolidate inc and bb files into a single bb file
Date: Sun,  5 Apr 2020 16:42:12 -0400
Message-Id: <20200405204215.8292-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pycurl.inc | 25 -------------------
 .../python/python3-pycurl_7.43.0.5.bb         | 24 ++++++++++++++++--
 2 files changed, 22 insertions(+), 27 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pycurl.inc

diff --git a/meta-python/recipes-devtools/python/python-pycurl.inc b/meta-python/recipes-devtools/python/python-pycurl.inc
deleted file mode 100644
index 0f661434c0..0000000000
--- a/meta-python/recipes-devtools/python/python-pycurl.inc
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "A Python Interface To The cURL library"
-DESCRIPTION = "\
-PycURL is a Python interface to libcurl, the multiprotocol file \
-transfer library. Similarly to the urllib Python module, PycURL can \
-be used to fetch objects identified by a URL from a Python program \
-"
-SECTION = "devel/python"
-HOMEPAGE = "http://pycurl.io/"
-
-LICENSE = "LGPLv2 | MIT"
-LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c \
-                    file://COPYING-MIT;md5=60872a112595004233b769b6cbfd65b6 \
-                    "
-
-SRC_URI[md5sum] = "0b387d4609ed20c88baede8579a4d425"
-SRC_URI[sha256sum] = "ec7dd291545842295b7b56c12c90ffad2976cc7070c98d7b1517b7b6cd5994b3"
-
-inherit pypi
-
-PYPI_PACKAGE = "pycurl"
-
-DEPENDS = "\
-    curl \
-    ${PYTHON_PN}\
-"
diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.43.0.5.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.43.0.5.bb
index c98b7d6f60..5a1c1797ad 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.43.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.43.0.5.bb
@@ -1,3 +1,23 @@
-inherit setuptools3
-require python-pycurl.inc
+SUMMARY = "A Python Interface To The cURL library"
+DESCRIPTION = "\
+PycURL is a Python interface to libcurl, the multiprotocol file \
+transfer library. Similarly to the urllib Python module, PycURL can \
+be used to fetch objects identified by a URL from a Python program \
+"
+SECTION = "devel/python"
+HOMEPAGE = "http://pycurl.io/"
 
+LICENSE = "LGPLv2 | MIT"
+LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c \
+                    file://COPYING-MIT;md5=60872a112595004233b769b6cbfd65b6 \
+                    "
+
+SRC_URI[md5sum] = "0b387d4609ed20c88baede8579a4d425"
+SRC_URI[sha256sum] = "ec7dd291545842295b7b56c12c90ffad2976cc7070c98d7b1517b7b6cd5994b3"
+
+inherit pypi setuptools3
+
+DEPENDS = "\
+    curl \
+    ${PYTHON_PN}\
+"
-- 
2.17.1

