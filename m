Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 498CF776AF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Mar 2017 15:49:08 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u48so20639084wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Mar 2017 08:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=jwC6jv8sWcrH1KBYXWW5IKNTkSrhohFdcpqynYeZ6qg=;
	b=UYvnB1nCa/uOLPPjRBMIEp7on5Sx+7BQgYD4g9HQ/iV8K9p0wg6Z0qYskjaTugA0XP
	Iu6niNyhEgGY4JEDZjh8Jxr2p+kp5uxGiGkO5nwKAyU2SRV+ZhO3NDaXH86dg2zM4iji
	b27fLTFhO8dpbrxXgybf36QrKMi3nG/Kg8jB3l0sDGlH5Lha49WhNWQdpkkY97I77Mse
	gUoOl2PKmbnSBPXD1+Fxt4TYjRCW/RmFL6QSV1iRVWhgyn29mbX8saBOCUPOOd3bQFEy
	u48+pVo02dnQ1oMxTbH078OyCq1Nx1cfxOEGeQcJf0OeqCH0XLIu0EKiPkV18/cXbN14
	QgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jwC6jv8sWcrH1KBYXWW5IKNTkSrhohFdcpqynYeZ6qg=;
	b=QWOXUWAmpEwvBjX6bfTQfakAvnHagEVDoYKzJVcqJUuXZxXjiqBa4mP3QqLdK7KYuR
	7aCKQhujf238ISTCAbCTZVoOonIihm2B4KhIHQee37/9YuvrU0dhS5mzg1T4enH3H5N4
	Sbsfb7nJEA5i9sur9/Nzwj7kip6XeztWONAtdw29q9SMwcr4unlf/khiaY1joR/1lTwo
	pdwVAqQ+K8Rt71bFuG9bSGEftZTdGSkWNGM8H/zdhwf9dGuhO+LHsPCIrElNgrLc+MRi
	DLaqkOxUwEIHOzDjIJW1TvmkzuwW/52EyOouiHQKoQrVPtyVk4VpisELS+57Ycsnyi9J
	TIvg==
X-Gm-Message-State: AMke39mdBnshIB9Z9MEjGr1kolUJPxK9Q0IUWZ09T8KGdueuLVRjxnyCrEGMK/ir6Had7g==
X-Received: by 10.223.176.7 with SMTP id f7mr29447055wra.124.1489420149787;
	Mon, 13 Mar 2017 08:49:09 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.217.31])
	by smtp.gmail.com with ESMTPSA id 63sm11785294wmp.9.2017.03.13.08.49.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Mar 2017 08:49:08 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Mar 2017 16:48:58 +0100
Message-Id: <1489420138-3440-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe] [PATCH] meta: do not prepend/append to BBCLASSEXTEND
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Mar 2017 15:49:09 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Replace some "+=/=+" with "=" when setting BBCLASSEXTEND, they are
redundant and inconsistent with the same setting in other recipes.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb                  | 2 +-
 meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb      | 2 +-
 meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb               | 2 +-
 meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb                      | 2 +-
 meta-oe/recipes-devtools/log4cplus/log4cplus_1.2.0.bb                  | 2 +-
 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb                          | 2 +-
 meta-oe/recipes-support/libssh2/libssh2_1.7.0.bb                       | 2 +-
 meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb                 | 2 +-
 meta-oe/recipes-support/lzip/lzip_1.16.bb                              | 2 +-
 meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb    | 2 +-
 meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb
index 8fe6a6f..288c586 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb
@@ -12,4 +12,4 @@ SRC_URI[sha256sum] = "fdee1e69903cf409bdc6f32403a566cbc6006aa9e2a4d6f8f12b90dfd5
 
 inherit autotools pkgconfig
 
-BBCLASSEXTEND += "native nativesdk"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index f39a82c..34fddcb 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -165,4 +165,4 @@ FILES_${PN}-fstools = "\
     ${bindir}/mkuserimg \
 "
 
-BBCLASSEXTEND += "native"
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
index dff6cc1..53bbf7e 100644
--- a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
+++ b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
@@ -21,4 +21,4 @@ inherit cmake
 
 FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibJsonSpirit.cmake"
 
-BBCLASSEXTEND += "nativesdk"
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
index 3105f65..b8d1583 100644
--- a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
+++ b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
@@ -45,4 +45,4 @@ PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'demos', '${PN}-demos', '', d
 FILES_${PN}-demos = "${bindir}/*"
 FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibRcf.cmake"
 
-BBCLASSEXTEND += "nativesdk"
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus_1.2.0.bb b/meta-oe/recipes-devtools/log4cplus/log4cplus_1.2.0.bb
index c2f5ec0..31ab9a6 100644
--- a/meta-oe/recipes-devtools/log4cplus/log4cplus_1.2.0.bb
+++ b/meta-oe/recipes-devtools/log4cplus/log4cplus_1.2.0.bb
@@ -12,4 +12,4 @@ SRC_URI[sha256sum] = "ad5ec3b62f2f0bdc7f06fa398bde61091fd2493e91059e17315b519742
 
 inherit autotools pkgconfig
 
-BBCLASSEXTEND += "native"
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
index fdd51db..67ffbc6 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
+++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
@@ -36,4 +36,4 @@ EOF
     chmod 0755 ${D}${bindir}/7z
 }
 
-BBCLASSEXTEND += "native"
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.7.0.bb b/meta-oe/recipes-support/libssh2/libssh2_1.7.0.bb
index 155d3d4..c62dab1 100644
--- a/meta-oe/recipes-support/libssh2/libssh2_1.7.0.bb
+++ b/meta-oe/recipes-support/libssh2/libssh2_1.7.0.bb
@@ -23,4 +23,4 @@ PACKAGECONFIG ??= "openssl"
 PACKAGECONFIG[openssl] = "--with-openssl --with-libssl-prefix=${STAGING_LIBDIR},--without-openssl,openssl"
 PACKAGECONFIG[gcrypt] = "--with-libgcrypt --with-libgcrypt-prefix=${STAGING_EXECPREFIXDIR},--without-libgcrypt,libgcrypt"
 
-BBCLASSEXTEND += "native"
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
index 4460be2..138df9f 100644
--- a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
@@ -42,4 +42,4 @@ do_install() {
     install -m 0644 ${S}/tinyxml.h ${D}${includedir}
 }
 
-BBCLASSEXTEND += "native"
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/lzip/lzip_1.16.bb b/meta-oe/recipes-support/lzip/lzip_1.16.bb
index af0b6ae..a5d9962 100644
--- a/meta-oe/recipes-support/lzip/lzip_1.16.bb
+++ b/meta-oe/recipes-support/lzip/lzip_1.16.bb
@@ -38,4 +38,4 @@ do_install () {
     fi
 }
 
-BBCLASSEXTEND += "native nativesdk"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb b/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb
index afbc83e..08008ce 100644
--- a/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb
+++ b/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb
@@ -10,6 +10,6 @@ PYPI_PACKAGE = "setuptools_scm"
 RDEPENDS_${PN}_class-target = "python-py python-setuptools python-argparse python-debugger python-json"
 RDEPENDS_${PN}_class-native = "python-setuptools-native"
 
-BBCLASSEXTEND =+ "native"
+BBCLASSEXTEND = "native"
 
 inherit pypi setuptools
diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb
index 712c4b9..8335d08 100644
--- a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb
+++ b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb
@@ -24,4 +24,4 @@ inherit distutils
 RDEPENDS_${PN} += "python-stringold python-codecs python-math parted (>= 2.3)"
 RDEPENDS_${PN}_class-native = ""
 
-BBCLASSEXTEND += "native"
+BBCLASSEXTEND = "native"
-- 
2.7.4


