Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.8630.1586006956628773223
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 06:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id l23so10383749otf.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 06:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=toT+igN4asepTpJGqgLZskHZEfNSprxGwmKl9cLOqbU=;
        b=ivOiy2hWnT+92ADjGoepBhnarFuFxnaKGrs1DKawUNV02w8eD4ytuv2Bly9LCY+0A2
         6UJL8HfYh4G3T3ZCz5cTGIss4mX+m1vvnYY6AGg/ExEYmycL5ri9DDTeaQrsOb03uWBA
         0lUh1uNqyKfqUiU0IL/j8S7udU3H3AO6wG8L0+lK6qtldxhcGNbkQ7xJbeYk0S1RG7kb
         oMnMYVwLnjUysODqkkUG41HVfISRZoSYhTJ61fMdPLyz5PQA8Lzg/yLpcSnKjd0c+2n2
         n1dRxVdwad0/6mzwsqNCOn6/h1wK3txYjubwbl9f8NuyUUZdWRc9mLUlpyzzj1q5Vi00
         MLTA==
X-Gm-Message-State: AGi0PuYoHJNv109b7UowP41MZLKPpSVKHWoT41o0ClEXC1CRPhU47Ggc
	1HYZapD7iN2MVXjAGTzzKIFY1vySyWo=
X-Google-Smtp-Source: APiQypJ7SWZ0bCl2rXHmq10Q3y6bGmnYHXrId9S3wC+4oHKHEr4+U0mZ5EhEASZzpuww32OqC3+b6Q==
X-Received: by 2002:a05:6830:2421:: with SMTP id k1mr10581146ots.192.1586006955583;
        Sat, 04 Apr 2020 06:29:15 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id t17sm2813013oof.43.2020.04.04.06.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 06:29:14 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 07/11] python-ujson: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 09:28:42 -0400
Message-Id: <20200404132846.16832-7-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404132846.16832-1-derek@asterius.io>
References: <20200404132846.16832-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-ujson.inc  | 30 -----------------
 .../python/python3-ujson_1.35.bb              | 32 +++++++++++++++++--
 2 files changed, 30 insertions(+), 32 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-ujson.inc

diff --git a/meta-python/recipes-devtools/python/python-ujson.inc b/meta-python/recipes-devtools/python/python-ujson.inc
deleted file mode 100644
index 3196b02f3f..0000000000
--- a/meta-python/recipes-devtools/python/python-ujson.inc
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY  = "Ultra fast JSON encoder and decoder for Python"
-DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pure C with bindings for Python 2.5+ and 3."
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=88df8e78b9edfd744953862179f2d14e"
-
-SRC_URI[md5sum] = "42f77b0cce686dfa4da2e68480b1dd24"
-SRC_URI[sha256sum] = "f66073e5506e91d204ab0c614a148d5aa938bdbf104751be66f8ad7a222f5f86"
-
-inherit pypi ptest
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS_${PN}-ptest += " \
-	${PYTHON_PN}-pytz \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-numbers \
-    "
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-ujson_1.35.bb b/meta-python/recipes-devtools/python/python3-ujson_1.35.bb
index ae4cc0a812..36abb7ea9d 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_1.35.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_1.35.bb
@@ -1,2 +1,30 @@
-inherit setuptools3
-require python-ujson.inc
+SUMMARY  = "Ultra fast JSON encoder and decoder for Python"
+DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pure C with bindings for Python 2.5+ and 3."
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=88df8e78b9edfd744953862179f2d14e"
+
+SRC_URI[md5sum] = "42f77b0cce686dfa4da2e68480b1dd24"
+SRC_URI[sha256sum] = "f66073e5506e91d204ab0c614a148d5aa938bdbf104751be66f8ad7a222f5f86"
+
+inherit pypi ptest setuptools3
+
+SRC_URI += " \
+    file://run-ptest \
+"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-numbers \
+"
+
+RDEPENDS_${PN}-ptest += " \
+    ${PYTHON_PN}-pytz \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

