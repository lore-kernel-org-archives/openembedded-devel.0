Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.11618.1590149622913573405
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 05:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=0MniyrGJ;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.178, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qk1-f178.google.com with SMTP id n11so4942767qkn.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2020 05:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=Pmp1iZffcFp4Ex2dUSQ7QzB+F+oEKPinRIqUdPX6NTY=;
        b=0MniyrGJm2M6+hA6Zp/FNskYPfkXcKRkKw9rD/DBTq1oUgUCNE9BH8NZrO5WpVILlS
         RyaTolCS8KFZ56KIzYMGpxiLqsqQkKZpcpoVjpNEcurlXCL6vaw+5JhHwd08gASnR0R+
         VvlEiMJJ6cHRLp+e4XQcJWoMyZsSBNWeAhJWdyO2lm77dvDc1vEnlMlyyxRJBZ2+3GRG
         ylshx+0PkTkwlG3Uo2RuVoBNq8JYYVrmOLp94TnoSn0NpJMXFxfqQmutRGd2355tJSd5
         AhIdiiYMtEYckmbTM1tzrhTPKgEnVgQSuCpY4JT5MuW8RgkCgwLlDyRCGSvsuORQkhcU
         G5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Pmp1iZffcFp4Ex2dUSQ7QzB+F+oEKPinRIqUdPX6NTY=;
        b=h8Ej0wpZ0F0jlaG0eYBK2/xcmge1ZSwZ0wcT9iv8SEyp5jZYS4Yoap6F/0lYy0Tspx
         LR5JarH/dWgD0UVAk/ldaeSTaCyUamh6Yo1M9ClN9gF7pA3idqclfCTKcuD9gOGw2ydi
         h+w/Fkoi+wExF5G+ps4ZGh7SSJ8dPo/589oZrPLYDQ7DrCK/YjqorncUyk5t/Jv8Rr/v
         /wVIMXhYxBin15+tWjkLy+Aif5dhlRRYkXJ0t8YQ0SDtwp+zC8yE9K5+eKK3Vex4Qn6c
         5j/WB7znfJsqmAHsJeZAThrGcLGp0+MuFVRZ0b7AqG3DRd99ucQfho8yiN8mLjTAnZOv
         +0kA==
X-Gm-Message-State: AOAM5322dyPh7aw7Ih4XkxIu/iHgF7HaBHqpOyHqlOd16kaU2e/Yv9xP
	582gcL4ifLKOQbvmFz/JX8d62AaqgIk=
X-Google-Smtp-Source: ABdhPJw6V6qrjqPq8pke4mOga0YcNMO1SQ0aPcAJCvUHVeDaNtqV/bESSY1BOJtJM4mLAY/V/tjxhw==
X-Received: by 2002:a37:9dc5:: with SMTP id g188mr14041799qke.193.1590149621910;
        Fri, 22 May 2020 05:13:41 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:24d8:1ecb:250c:14de])
        by smtp.gmail.com with ESMTPSA id g7sm6309813qkk.44.2020.05.22.05.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 05:13:41 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [PATCH 1/3] python3-jinja2: Update 2.11.1 -> 2.11.2
Date: Fri, 22 May 2020 09:13:31 -0300
Message-Id: <20200522121333.25045-1-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1

Add .inc file to .bb, as updated to python3

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../recipes-devtools/python/python-jinja2.inc | 33 --------------
 .../python/python3-jinja2_2.11.1.bb           |  4 --
 .../python/python3-jinja2_2.11.2.bb           | 43 +++++++++++++++++++
 3 files changed, 43 insertions(+), 37 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-jinja2.inc
 delete mode 100644 meta-python/recipes-devtools/python/python3-jinja2_2.11.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb

diff --git a/meta-python/recipes-devtools/python/python-jinja2.inc b/meta-python/recipes-devtools/python/python-jinja2.inc
deleted file mode 100644
index 927230515..000000000
--- a/meta-python/recipes-devtools/python/python-jinja2.inc
+++ /dev/null
@@ -1,33 +0,0 @@
-DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone template engine written in pure python."
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
-
-PYPI_PACKAGE = "Jinja2"
-
-SRC_URI[md5sum] = "5d88c7e77aa63fc852a04f65dbfe5594"
-SRC_URI[sha256sum] = "93187ffbc7808079673ef52771baa950426fd664d3aad1d0fa3e95644360e250"
-
-RDEPENDS_${PN} += "${PYTHON_PN}-io ${PYTHON_PN}-pickle ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-math ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-markupsafe \
-    ${PYTHON_PN}-json ${PYTHON_PN}-threading ${PYTHON_PN}-numbers"
-
-CLEANBROKEN = "1"
-
-BBCLASSEXTEND = "native nativesdk"
-
-inherit ptest
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS_${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-unixadmin \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.11.1.bb b/meta-python/recipes-devtools/python/python3-jinja2_2.11.1.bb
deleted file mode 100644
index 284f5f588..000000000
--- a/meta-python/recipes-devtools/python/python3-jinja2_2.11.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit pypi setuptools3
-require python-jinja2.inc
-
-RDEPENDS_${PN} += "${PYTHON_PN}-asyncio"
diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb b/meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb
new file mode 100644
index 000000000..681acf8f1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb
@@ -0,0 +1,43 @@
+DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone template engine written in pure python."
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
+
+SRC_URI[sha256sum] = "89aab215427ef59c34ad58735269eb58b1a5808103067f7bb9d5836c651b3bb0"
+
+PYPI_PACKAGE = "Jinja2"
+
+CLEANBROKEN = "1"
+
+inherit pypi setuptools3 ptest
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-unixadmin \
+"
+
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

