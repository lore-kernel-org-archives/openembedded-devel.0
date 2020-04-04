Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.1965.1586021375365816772
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id t28so10824851ott.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=l0hR8u2SP4mjQvqF8Lc3JdfM4JkgY/wIvpznHh6eOYM=;
        b=HWt4n0kZOnp+ZI0BD/uOomfeJB9eZLwp5PA/Fv02CMpsfYxpMyySxvHpRSakWSwdZn
         AIc2M5SWvZxS9UIx/VekQNLGyCXVN6aJaOrBkH4Y8ODxGEZ/lztKgmKhXUpLX6mLEPiZ
         8kwn3FOEVius1WaQF8AMuQNRvzQna7togymDeqZai3a42glTDl44gUJh7+hzMiIumZ3a
         7jS+2YgKHEYiGKaAamR3hWfOMrqpXdRZ8h7cV21lyHMJPYSlk1XrLifMbqUmPwTP3m/s
         U+VhOvFgj6P1ZnEaP7Icn8VRu/sFucacnk0naV4pUFWla7eQHx39PSKg/Am0bT2Bwsr2
         QSig==
X-Gm-Message-State: AGi0PubB44NewJi6MsvQVopcsYR82Q9Kcqu3BdhrJXmgXM6W1NiM90fu
	hu7XOqN2qlCUQBXpNAahQHirI2ZRZi8=
X-Google-Smtp-Source: APiQypK8IPP9EjHH7Zqh4Htw+ACTRL1vdHVU0VixQ79+kVpx6bhe08Kv5MsvToU01BLC2nkiD9VEkw==
X-Received: by 2002:a05:6830:1d91:: with SMTP id y17mr10991025oti.184.1586021374342;
        Sat, 04 Apr 2020 10:29:34 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id e22sm3068964ote.32.2020.04.04.10.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:29:33 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 6/7] python-requests: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:29:10 -0400
Message-Id: <20200404172911.26978-6-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404172911.26978-1-derek@asterius.io>
References: <20200404172911.26978-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-requests.inc                | 28 -----------------
 .../python/python3-requests_2.23.0.bb         | 30 +++++++++++++++++--
 2 files changed, 28 insertions(+), 30 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-requests.inc

diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/meta-python/recipes-devtools/python/python-requests.inc
deleted file mode 100644
index ddca4bc669..0000000000
--- a/meta-python/recipes-devtools/python/python-requests.inc
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "Python HTTP for Humans."
-HOMEPAGE = "http://python-requests.org"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=19b6be66ed463d93fa88c29f7860bcd7"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-requests:"
-
-SRC_URI[md5sum] = "abfdc28db1065bbd0bc32592ac9d27a6"
-SRC_URI[sha256sum] = "b3f43d496c6daba4493e7c431722aeb7dbc6288f52a6e04e7b6023b0247817e6"
-
-inherit pypi
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-email \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-ndg-httpsclient \
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-pyasn1 \
-    ${PYTHON_PN}-pyopenssl \
-    ${PYTHON_PN}-pysocks \
-    ${PYTHON_PN}-urllib3 \
-    ${PYTHON_PN}-chardet \
-    ${PYTHON_PN}-idna \
-"
-
-CVE_PRODUCT = "requests"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-requests_2.23.0.bb b/meta-python/recipes-devtools/python/python3-requests_2.23.0.bb
index 0a2410f85c..9f3fb7d2e9 100644
--- a/meta-python/recipes-devtools/python/python3-requests_2.23.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests_2.23.0.bb
@@ -1,2 +1,28 @@
-inherit setuptools3
-require python-requests.inc
+DESCRIPTION = "Python HTTP for Humans."
+HOMEPAGE = "http://python-requests.org"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=19b6be66ed463d93fa88c29f7860bcd7"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-requests:"
+
+SRC_URI[md5sum] = "abfdc28db1065bbd0bc32592ac9d27a6"
+SRC_URI[sha256sum] = "b3f43d496c6daba4493e7c431722aeb7dbc6288f52a6e04e7b6023b0247817e6"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-email \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-ndg-httpsclient \
+    ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-pyasn1 \
+    ${PYTHON_PN}-pyopenssl \
+    ${PYTHON_PN}-pysocks \
+    ${PYTHON_PN}-urllib3 \
+    ${PYTHON_PN}-chardet \
+    ${PYTHON_PN}-idna \
+"
+
+CVE_PRODUCT = "requests"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

