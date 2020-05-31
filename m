Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.18132.1590941805425476865
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fuQfKBwe;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id fs4so3938655pjb.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/O+3LCd29+Sj3R8ck7EZQpN23i11jzW1m6C3N9WabjE=;
        b=fuQfKBweSS2IODurfrhRWR/8gHRL55YXijmuq9MigIPnHSrgc0Sjkf7DktA175iyoQ
         9sTIL2lHrfgvSdxBeVHF7rkKRr3JYMl7F8/bc94Hf51QvhYuJJZmia3zKCLUN8+JpIR1
         ApEumFZG4yrpsxPsE3PrwOt5Brz2wRFI+lPPZqnAbu3Hot2WWqEhJ6Rpi+NkKq0ZBK7Z
         Jpc1vleKd+gxg9wvCPMU1oS5fFPYBc2qN1eFTOhF9vKcFcmtE78dFR0vnpQjE6Bp2n6X
         K7BnSW16Tvc2U23Na4vOnMVgI3zgHt7dnFl/oBiK1ifF/nZfiKAMHVRQhncn3sHRznlC
         E+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/O+3LCd29+Sj3R8ck7EZQpN23i11jzW1m6C3N9WabjE=;
        b=K6aOdVboaGcx/D/ctEmlUNSnZYz9eKVp564nHc4S9WhEd9hhPHjqsfamn1L1nKhuhs
         TaRvxbnxsZITisv+L0DioAhMkgDR5VO5H+o9k5/Wz4vBRrKkel86S98sSCP1X95cgnVE
         /645IpWj7e2aZd0NygcO67JYZ9DdkJ4A0FLbiUN0av1+uzYIzclxRnyEt9mbAaabOvye
         6Qacr3ZEgv7P6EGzyuHG/KrzaMdVVtoazaNxDiM4XP+huNpqPnmaBAFNpHLS/yEJ4TSH
         8WAd5oQZ6OOdmaCiXM543w1oX2z8q+mo0VXeIqvFc6QoawyfMqbAWVzxpuBK+brKiYSZ
         AbHg==
X-Gm-Message-State: AOAM533j7lZat2RZEKzlpH9QdSRrP0HKZ3Hg23DsawM93r6zkTvf56xN
	Y0IHaG+jCqgv2mx2eu0FbWXySQEH
X-Google-Smtp-Source: ABdhPJwYkD09kMdRutqp5cRL8nEwfBlbYXSIaAlki0Wv1jurhWFIjVErAo51I6NHAyUUyzUm4MKSZA==
X-Received: by 2002:a17:902:d34a:: with SMTP id l10mr4185451plk.69.1590941804794;
        Sun, 31 May 2020 09:16:44 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:44 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 16/35] python3-jinja2: Update 2.11.1 -> 2.11.2
Date: Sun, 31 May 2020 09:16:03 -0700
Message-Id: <31b5e4109ab7af37f6c31164b6acb5b1e6649d2a.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Domarys Correa <domarys.correa@ossystems.com.br>

Add .inc file to .bb, as updated to python3

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0a7a998120c930e427b02de73bc48b78a0022dd2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python3-jinja2_2.11.1.bb           |  4 --
 ...on-jinja2.inc => python3-jinja2_2.11.2.bb} | 40 ++++++++++++-------
 2 files changed, 25 insertions(+), 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-jinja2_2.11.1.bb
 rename meta-python/recipes-devtools/python/{python-jinja2.inc => python3-jinja2_2.11.2.bb} (44%)

diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.11.1.bb b/meta-python/recipes-devtools/python/python3-jinja2_2.11.1.bb
deleted file mode 100644
index 284f5f588c..0000000000
--- a/meta-python/recipes-devtools/python/python3-jinja2_2.11.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit pypi setuptools3
-require python-jinja2.inc
-
-RDEPENDS_${PN} += "${PYTHON_PN}-asyncio"
diff --git a/meta-python/recipes-devtools/python/python-jinja2.inc b/meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb
similarity index 44%
rename from meta-python/recipes-devtools/python/python-jinja2.inc
rename to meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb
index 9272305156..681acf8f1c 100644
--- a/meta-python/recipes-devtools/python/python-jinja2.inc
+++ b/meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb
@@ -1,33 +1,43 @@
 DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone template engine written in pure python."
+
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
-PYPI_PACKAGE = "Jinja2"
-
-SRC_URI[md5sum] = "5d88c7e77aa63fc852a04f65dbfe5594"
-SRC_URI[sha256sum] = "93187ffbc7808079673ef52771baa950426fd664d3aad1d0fa3e95644360e250"
+SRC_URI[sha256sum] = "89aab215427ef59c34ad58735269eb58b1a5808103067f7bb9d5836c651b3bb0"
 
-RDEPENDS_${PN} += "${PYTHON_PN}-io ${PYTHON_PN}-pickle ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-math ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-markupsafe \
-    ${PYTHON_PN}-json ${PYTHON_PN}-threading ${PYTHON_PN}-numbers"
+PYPI_PACKAGE = "Jinja2"
 
 CLEANBROKEN = "1"
 
-BBCLASSEXTEND = "native nativesdk"
-
-inherit ptest
+inherit pypi setuptools3 ptest
 
 SRC_URI += " \
 	file://run-ptest \
 "
 
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
 RDEPENDS_${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
 	${PYTHON_PN}-unixadmin \
 "
 
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-asyncio \
+    ${PYTHON_PN}-crypt \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-markupsafe \
+    ${PYTHON_PN}-math \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers\
+    ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-threading \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

