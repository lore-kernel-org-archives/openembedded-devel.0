Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.12685.1611774455341304784
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 11:07:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ls86LGbx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id j12so1805538pfj.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Jan 2021 11:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=948HrVAs5o3uk8PBioKEaosQ5/LcHFAyvPaGOF+yYbc=;
        b=ls86LGbxXwk7EwSc6i7W+WDIagZF3FhPS17PI0P0+TQXfNSeD4n5L7fbMVcUma0NZ2
         6Yqs8akoj9/tU8tO5k6qsVOr4onl7wxof3su5eRfK4EJ0Cubn801UMZFH/iga0jDly0V
         Lho1JuXoHQltGuK+fSEtalO2XZH128iBFypkQiPTPOQ7C9uHin/o9JANnqX73NboqUc2
         GyXqwhzDwDnmjP2UKM38Ei2Sg3670yGUFEUeB4BB9EElZWYF86xUPfWmdtC6VTcmtooC
         gIOYtB4FqrejARW7S2EQHr2HeVpAgEQAVQgq0cm9+wwYboBu4f6oo60iygEZZN+nMG4L
         08+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=948HrVAs5o3uk8PBioKEaosQ5/LcHFAyvPaGOF+yYbc=;
        b=ksS3Q9b+tdX/qOlZabtpGAX7o0aOYNOGn4cQOzpOhZDUM1ZV2C2UGvjMOta92HU66u
         Gfj8fciCReXmNV7PlxcFWb+QNCZUvjO0hLUU2RrBevqBIBCuwzBpe3Pegu2vPdvo4OzF
         TTddL5Z8Hou+qtTJ6Wg+jpeAujlzH3WxVf7GR3gRwnjwMfiUtAvOpBnngwg2TGaYQq5y
         ifi05bQqAlUfuo24eiLrYdGDFh/USZow9Z066xe3uvlZ5LxS6qE8eWkgj2Ck1n0cSEmj
         rXnR5KOTWS51SFcXzTRB/p2nUpqVbsy7b8VU15wMBOBXnfpzhCxCkBFIxd6990/sHvWQ
         6KPQ==
X-Gm-Message-State: AOAM530H4+RHnDF+P1PoCD73LjHCNwS0cEJi3/FLywK1h6R+deLSHA8F
	jDoPqASLoD7phdjI97pNG6FLWZkCobqsYvFuNH8=
X-Google-Smtp-Source: ABdhPJwvKBVxhb6IMsdS6qmEan/q174IVA+j6JsR4bOIXc+szJStx8r2aG1W+9jrIYnqfQQCwusSLA==
X-Received: by 2002:a63:1a44:: with SMTP id a4mr12549425pgm.41.1611774454065;
        Wed, 27 Jan 2021 11:07:34 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id gg6sm6095055pjb.2.2021.01.27.11.07.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 11:07:33 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/3] sip3: Consolidate in a single file
Date: Wed, 27 Jan 2021 09:07:10 -1000
Message-Id: <20210127190712.818807-2-steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leon Anavi <leon.anavi@konsulko.com>

Consolidate inc and bb files into a single bb file.
Fix the broken link for HOMEPAGE.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2bc281393aa6c6b83218f2996c32b793ac79a42a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta-oe/recipes-devtools/sip/sip.inc         | 36 -----------------
 meta-oe/recipes-devtools/sip/sip3_4.19.19.bb | 42 ++++++++++++++++++--
 2 files changed, 39 insertions(+), 39 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/sip/sip.inc

diff --git a/meta-oe/recipes-devtools/sip/sip.inc b/meta-oe/recipes-devtools/sip/sip.inc
deleted file mode 100644
index d8e32a7687..0000000000
--- a/meta-oe/recipes-devtools/sip/sip.inc
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "SIP is a C++/Python Wrapper Generator"
-HOMEPAGE = "http://www.riverbankcomputing.co.uk/sip"
-SECTION = "devel"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
-
-SRC_URI = "https://www.riverbankcomputing.com/static/Downloads/sip/${PV}/sip-${PV}.tar.gz \
-"
-SRC_URI[md5sum] = "98111479309dc472410f26080d6d4a88"
-SRC_URI[sha256sum] = "5436b61a78f48c7e8078e93a6b59453ad33780f80c644e5f3af39f94be1ede44"
-
-S = "${WORKDIR}/sip-${PV}"
-
-BBCLASSEXTEND = "native"
-
-do_configure_prepend_class-target() {
-    echo "py_platform = linux" > sip.cfg
-    echo "py_inc_dir = %(sysroot)/${includedir}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
-    echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
-    echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
-    echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
-    echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
-    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot ${STAGING_DIR_HOST} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
-}
-do_configure_prepend_class-native() {
-    echo "py_platform = linux" > sip.cfg
-    echo "py_inc_dir = ${includedir}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
-    echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
-    echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
-    echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
-    echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
-    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot=${STAGING_DIR_NATIVE}
-}
-do_install() {
-    oe_runmake install
-}
diff --git a/meta-oe/recipes-devtools/sip/sip3_4.19.19.bb b/meta-oe/recipes-devtools/sip/sip3_4.19.19.bb
index 010fa30fe3..e6a4653b59 100644
--- a/meta-oe/recipes-devtools/sip/sip3_4.19.19.bb
+++ b/meta-oe/recipes-devtools/sip/sip3_4.19.19.bb
@@ -1,11 +1,47 @@
-require sip.inc
+SUMMARY = "SIP is a C++/Python Wrapper Generator"
+HOMEPAGE = "https://riverbankcomputing.com/software/sip/"
+SECTION = "devel"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
 
-DEPENDS = "python3"
+SRC_URI = "https://www.riverbankcomputing.com/static/Downloads/sip/${PV}/sip-${PV}.tar.gz \
+"
+SRC_URI[md5sum] = "98111479309dc472410f26080d6d4a88"
+SRC_URI[sha256sum] = "5436b61a78f48c7e8078e93a6b59453ad33780f80c644e5f3af39f94be1ede44"
 
 inherit python3-dir python3native
 
+S = "${WORKDIR}/sip-${PV}"
+
+DEPENDS = "python3"
+
 PACKAGES += "python3-sip3"
 
+BBCLASSEXTEND = "native"
+
+do_configure_prepend_class-target() {
+    echo "py_platform = linux" > sip.cfg
+    echo "py_inc_dir = %(sysroot)/${includedir}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
+    echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
+    echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
+    echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
+    echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
+    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot ${STAGING_DIR_HOST} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
+}
+
+do_configure_prepend_class-native() {
+    echo "py_platform = linux" > sip.cfg
+    echo "py_inc_dir = ${includedir}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
+    echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
+    echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
+    echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
+    echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
+    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot=${STAGING_DIR_NATIVE}
+}
+
+do_install() {
+    oe_runmake install
+}
+
 FILES_python3-sip3 = "${libdir}/${PYTHON_DIR}/site-packages/"
 FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/.debug"
-
-- 
2.25.1

