Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.7960.1590073577786977915
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2020 08:06:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=BmWZhwUM;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.195, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qk1-f195.google.com with SMTP id g185so7494974qke.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2020 08:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=Pmp1iZffcFp4Ex2dUSQ7QzB+F+oEKPinRIqUdPX6NTY=;
        b=BmWZhwUM758C73txHrl6quu1k0F8NKDv2uROSdtUSlsyLmFzTcCGdxDAQh+sHwa6zi
         Ek5COngrrWagtJJ4+Owm/osID71+rUgzGBA3AzGILiME1JfNkuk2HYxBbt1S4uqlhCgl
         EUnENM/zcFdgvUq1p5Z3zRmPtGw/uhGxGeKRKiWptrCY07qFR+BX9YNN3hyz7XXOGW9X
         NBzEf/SidgrWuRVrdOoQ6F8Lx0wb7wcamjX/4GbxR+rASQUsD0K48mLvYWMjMDBC/Ff0
         9ip40IrKncvK6NK2fZLmjZODkvF5IiXwt99KuqMzzMIrAuXGXQOdx76MjMpFVdIaAhVW
         pvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Pmp1iZffcFp4Ex2dUSQ7QzB+F+oEKPinRIqUdPX6NTY=;
        b=XID8m7NjwPi6ElLHsaAY+bvZIwGOa0oTGNuP/ZeidHFc1H5/oGIY0SscguRy7j2oMy
         E4gyGFzIceAP5uqueXQ+aJY9RnukVRUxOqFQnGDIymjmp/vSoP89cW6JxcbGihXTLiYd
         /ONZ9XSyQPo/J4UZcM44t3dRg0WV2Zp/V4Nzb2wD+OerASj5lGE+ZmA68+1bBKf1hXF2
         2CYTGra9bHpAF4PouMasxuXh3s8t54XBgQP1LhUESRAiktrzSqPXz0Z6Yo8Qggg9GXut
         3fiEpwHZJOiLj4pPtZlpNe4WGHZseQVsGXpPWnKsoQjyez4mndIHWMN3/Ih6ukeTNtzm
         etmA==
X-Gm-Message-State: AOAM531Wlgt2k7H3BmFihqySKnOOiDN4m7DvYXCRE8zsoLZmygzbfSbw
	BW100mNsP1akyiZ8ArvU+0zsef+Xadw=
X-Google-Smtp-Source: ABdhPJyekzQFz5CmylC4zr6XTOTlNF3gvS1g+1Dci96T8BincoG3SWb2IMoLqzbwZxXr1vDDW2Di3g==
X-Received: by 2002:a37:c8b:: with SMTP id 133mr10125936qkm.418.1590073576477;
        Thu, 21 May 2020 08:06:16 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:48f3:4609:c8f3:958c])
        by smtp.gmail.com with ESMTPSA id o13sm411625qtk.73.2020.05.21.08.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 08:06:15 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [PATCH] python3-jinja2: Update 2.11.1 -> 2.11.2
Date: Thu, 21 May 2020 12:06:03 -0300
Message-Id: <20200521150603.6360-1-domarys.correa@ossystems.com.br>
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

