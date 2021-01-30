Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.8738.1612035475304878272
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jan 2021 11:37:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OPHfHFEh;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id y142so821006pfb.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Jan 2021 11:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=YMn4bk3Vk1FMJZuh/mHmULApeipC4I171YglsazkG7M=;
        b=OPHfHFEhd3XGJu7iK9ai+vOP/prrFbd7nnMhIzJSBVtnlpnOksMEVcSvrjTsQHXoNE
         Hm7GsIIyD5vMvKyK3akXLoD8aymQadhs7YXJYb8tt7gKZZKEBeKxySFB5jwapl7RQK5U
         /ZIh3Dam/JO/oCYeTWKSxcNbfrXgr6LNb9mj1KKn0zaHUgkvoK6EsZLScouu/2fe2Akm
         /Q+SRTymQuLKEktGLKrxGwcW06L2+m7kKss1EBxS0qDGK6TDlmZwIWj0xlLvACWvplml
         qvC0Re6HhH5vQkOUZW3P72eDnTu2Vb4vIdKIHAcH5To0PBPlR9D4yDCbcpMsZ/gxJlBC
         NCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=YMn4bk3Vk1FMJZuh/mHmULApeipC4I171YglsazkG7M=;
        b=UjGPAaepNa6imRVJTVkIALMUFefXxzcu2DQJ44e1WCEI28nsd2yIsnKtDdYL5wjxxg
         iSdSG3mJWthR1BDchOmPRizmp7we/jsjv31p45uRmDq1dcAnNFbcxX+xSwO54BPIUw3u
         cC19ERRikfGW30x4K1Sffk4C6Z4/sHDhEQhsD+vSL6OpWanyRdEm4ZNwZSPWVhiqmxCG
         2p1zWpfQ8COJH0XIZZ8u77wTjiLD3hDHfWqHHGsxAKxZI0SexbULRGYolMfIAgxKXVSJ
         xajSOksf4iZY03Duf/Ppyj/jstETzwevX+8lnrT5d7lH9M4FYMVXCNnioZaXVjMzL7+7
         CwjA==
X-Gm-Message-State: AOAM532pI0hzfAbAGHnDDw3OQO+ntUMMV4srf32tpv06VPTeiBF/lzt8
	vHsogYTNQDmHnS8Q7++vOwTU0GNnr0JI1g==
X-Google-Smtp-Source: ABdhPJyJq5w0Gs3pdV4mv4KX+lR9RTuRCCzTwlLK2qMoVaH7yD6h+eEgPejY81+amLhoOd+TBkkSSg==
X-Received: by 2002:a63:700c:: with SMTP id l12mr9876190pgc.137.1612035474697;
        Sat, 30 Jan 2021 11:37:54 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:315d:c5e7:1295:54a9])
        by smtp.gmail.com with ESMTPSA id q197sm12518096pfc.155.2021.01.30.11.37.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 11:37:54 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 09/13] sip3: Consolidate in a single file
Date: Sat, 30 Jan 2021 11:37:34 -0800
Message-Id: <112b03d7a40c6bfb6c70d4cb555e9ece48f198d7.1612035229.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612035229.git.akuster808@gmail.com>
References: <cover.1612035229.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Consolidate inc and bb files into a single bb file.
Fix the broken link for HOMEPAGE.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2bc281393aa6c6b83218f2996c32b793ac79a42a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.17.1

