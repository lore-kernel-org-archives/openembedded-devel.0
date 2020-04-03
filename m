Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.9059.1585955010390483811
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 16:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id t28so9088907ott.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2020 16:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dn0ch19gRzoWISM5+DTWjzBQKiHrJCcodnz476dO2TM=;
        b=QdW9EG1zfk47OpXJAPcKweme4n+6j3TAp8qin4ZtvuLXwLZG/y4MZb2m1EZ0M1KfU3
         UHsSj1ktZiw4rLzn4UemJEMPyghojiOyo6WP1K1ECgCcdUSttPmwSwvzProyVUk1OpEn
         OCDOB0Pxkh+cZqDcROKWdUBhAOlew8RyRFeEf5Kob4+DSJKp9sszu4YnjCrCqUQ0NZQO
         1+B8+yRWFXK1F2GhWAJT1uJsIE/+hEmOMqaZ8PP1jmvfTOF9pzr1jPWTZk4aHf4O6JC+
         y9Sel2KJGDLvHJ/kBgoLcWl575DxKQR/lVaj5cQIZQ1Af5rzb/2LBJoZjrHJZj9aBKm9
         aHPQ==
X-Gm-Message-State: AGi0PuaaLVJbuHDi0xEbi071AmksL8b37SibIhc7Zf3YkPLf7eP4EL1q
	JIC05lj5Pgtk/XQg/fgAhEAH0jMWTEU=
X-Google-Smtp-Source: APiQypI9iDNxI8XZigQwV1CVv2iNqajErmdt5/yM8h9D+0l1rJbpUoRvFzSTFAeaNCtqbOU8JGrptw==
X-Received: by 2002:a9d:12a6:: with SMTP id g35mr8305972otg.333.1585955009316;
        Fri, 03 Apr 2020 16:03:29 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id 68sm2464665oon.14.2020.04.03.16.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 16:03:28 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 5/5] python-webcolors: consolidate inc and bb files into a single bb file
Date: Fri,  3 Apr 2020 19:03:11 -0400
Message-Id: <20200403230311.29817-5-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403230311.29817-1-derek@asterius.io>
References: <20200403230311.29817-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-webcolors.inc               | 26 -----------------
 .../python/python3-webcolors_1.8.1.bb         | 29 +++++++++++++++++--
 2 files changed, 27 insertions(+), 28 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-webcolors.inc

diff --git a/meta-python/recipes-devtools/python/python-webcolors.inc b/meta-python/recipes-devtools/python/python-webcolors.inc
deleted file mode 100644
index ad012c9795..0000000000
--- a/meta-python/recipes-devtools/python/python-webcolors.inc
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "Simple Python module for working with HTML/CSS color definitions."
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=197add016087e6884a012b0f185d44ad"
-
-SRC_URI[md5sum] = "40890db38b2a856e526a568864025fe6"
-SRC_URI[sha256sum] = "030562f624467a9901f0b455fef05486a88cfb5daa1e356bd4aacea043850b59"
-
-RDEPENDS_${PN}_class-target = "\
-    ${PYTHON_PN}-stringold \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI += " \
-	file://run-ptest \
-"
-inherit ptest
-
-RDEPENDS_${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
diff --git a/meta-python/recipes-devtools/python/python3-webcolors_1.8.1.bb b/meta-python/recipes-devtools/python/python3-webcolors_1.8.1.bb
index fcd9f70726..65eed9e785 100644
--- a/meta-python/recipes-devtools/python/python3-webcolors_1.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-webcolors_1.8.1.bb
@@ -1,2 +1,27 @@
-inherit pypi setuptools3
-require python-webcolors.inc
+SUMMARY = "Simple Python module for working with HTML/CSS color definitions."
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=197add016087e6884a012b0f185d44ad"
+
+SRC_URI[md5sum] = "40890db38b2a856e526a568864025fe6"
+SRC_URI[sha256sum] = "030562f624467a9901f0b455fef05486a88cfb5daa1e356bd4aacea043850b59"
+
+inherit pypi setuptools3 ptest
+
+RDEPENDS_${PN}_class-target = "\
+    ${PYTHON_PN}-stringold \
+"
+
+SRC_URI += " \
+    file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+    ${PYTHON_PN}-pytest \
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

