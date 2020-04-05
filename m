Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.26067.1586119359313488550
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 13:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id v2so13253455oto.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 13:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PUZaqmty3jjps/1JRQ1Wr6JUBB2yh1PkNUl416nZvk4=;
        b=oQ9EkqorYjKJqZ2qeD6a6wI7jHiq0tjJculO4F2pyTUyLKFk2zNNc/V1NvqHjA2E9P
         w31OSLsXVYy/sZ2cDTaomNRmlYLFaPAypyozIPSgc+nei7JIPewjdE35m0EH0poMnCRi
         83ELk9mHkLhM6SzspXLMSt8Vlpl1tWbzFBLqguKajww9SW5AnEwgXi1dM1unQxjz+2aq
         YUFw5K1tqciSVtESmofAYEOEx7TNkeoko+FpYq4p8ortBqRYmGowA9FZmwic1B9htAt3
         S0YH8lhy3nhuwJLGjFvoHqXd17kZc7nujhJmpm+9+E7AuNxJlsun8B9mGv8esOV9yCiU
         4H5A==
X-Gm-Message-State: AGi0PuYtQgeoBLX/qZsyUc0+Y8ZULOuj6RV+wEHfOHzpJVnVU8bxPdbs
	Wg+uqTn8ZUCX98wwZDhmYqgc2erXwJU=
X-Google-Smtp-Source: APiQypIK6BKWUgf7lSxKL1dEqx0VNaInK49u+MqIpFG/yjCAPNYOZx+Z+1ufUGct/0qPpUoNQq0WOg==
X-Received: by 2002:a9d:220e:: with SMTP id o14mr14470033ota.88.1586119358207;
        Sun, 05 Apr 2020 13:42:38 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id d6sm3905295oos.10.2020.04.05.13.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 13:42:37 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 2/4] python-pycparser: consolidate inc and bb files into a single bb file
Date: Sun,  5 Apr 2020 16:42:13 -0400
Message-Id: <20200405204215.8292-2-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200405204215.8292-1-derek@asterius.io>
References: <20200405204215.8292-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-pycparser.inc                 | 17 -----------------
 .../python/python3-pycparser_2.19.bb            | 17 +++++++++++++++--
 2 files changed, 15 insertions(+), 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pycparser.inc

diff --git a/meta-python/recipes-devtools/python/python-pycparser.inc b/meta-python/recipes-devtools/python/python-pycparser.inc
deleted file mode 100644
index 47a0e0e973..0000000000
--- a/meta-python/recipes-devtools/python/python-pycparser.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Parser of the C language, written in pure Python"
-HOMEPAGE = "https://github.com/eliben/pycparser"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=86f1cedb4e6410a88ce8e30b91079169"
-
-SRC_URI[md5sum] = "76396762adc3fa769c83d8e202d36b6f"
-SRC_URI[sha256sum] = "a988718abfad80b6b157acce7bf130a30876d27603738ac39f140993246b25b3"
-
-
-BBCLASSEXTEND = "native nativesdk"
-
-RDEPENDS_${PN}_class-target += "\
-    ${PYTHON_PN}-ply \
-    ${PYTHON_PN}-pprint \
-    cpp \
-    cpp-symlinks \
-    "
diff --git a/meta-python/recipes-devtools/python/python3-pycparser_2.19.bb b/meta-python/recipes-devtools/python/python3-pycparser_2.19.bb
index 7cc024ea09..35ed93e09b 100644
--- a/meta-python/recipes-devtools/python/python3-pycparser_2.19.bb
+++ b/meta-python/recipes-devtools/python/python3-pycparser_2.19.bb
@@ -1,6 +1,19 @@
+SUMMARY = "Parser of the C language, written in pure Python"
+HOMEPAGE = "https://github.com/eliben/pycparser"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86f1cedb4e6410a88ce8e30b91079169"
+
+SRC_URI[md5sum] = "76396762adc3fa769c83d8e202d36b6f"
+SRC_URI[sha256sum] = "a988718abfad80b6b157acce7bf130a30876d27603738ac39f140993246b25b3"
+
 inherit pypi setuptools3
-require python-pycparser.inc
+
+BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-netclient \
-    " 
+    ${PYTHON_PN}-ply \
+    ${PYTHON_PN}-pprint \
+    cpp \
+    cpp-symlinks \
+    "
-- 
2.17.1

