Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8056173D64
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2015 10:58:00 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so146549288wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2015 03:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=eDVVQlxfX+dwwaZdMuSrwFQP5Jy+r+9GW79qlCuG+Zw=;
	b=ZwH6FVX8ufDzgntbATCA/1jXKc3y7lgoFzI6eUXXa7PQswSEF72M4EajW6y7BqCXst
	0U1b+UiKw31tffnQdRg5jQDOTfVbxwq4ZpNrUx3ssUtDHhYX0wrypTw2mvXoQUc4yrcB
	R8C5ec7NESAvM0tlr2gZv301moHqGHvIFWeNJbEwRAifmlAfF0/90fjrCwFu1ctspq67
	AbUSjHN4Vlg0NzBE2F81PmvmWhTqST1mHSRWEf2LAmj7Tn6woVxjKsQb20888gUFRkcI
	jIwmiExLCO2WDJdIyaA90Rv9DF2RJMWV5p9kBdndQZIFkRgIDwAUjj9t8DmDZqID0d7M
	pLDA==
X-Gm-Message-State: ALoCoQnMGGzUHgx89SW6okImHtr5U4CcVHZNWb88oNuSe68CNKU3O1FOku0KZ2TbSsPtngE00ik3
X-Received: by 10.180.210.200 with SMTP id mw8mr55059938wic.26.1439463480125; 
	Thu, 13 Aug 2015 03:58:00 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	pe1sm2780516wic.20.2015.08.13.03.57.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Aug 2015 03:57:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Aug 2015 11:51:49 +0100
Message-Id: <1439463109-7369-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] recipes: use class-native instead of deprecated virtclass-native.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Aug 2015 10:58:02 -0000

virtclass overrides are deprecated, so use class overrides instead.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-efl/recipes-efl/efl/azy_svn.bb                          |  2 +-
 meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb            |  8 ++++----
 meta-networking/recipes-daemons/postfix/postfix.inc          | 12 ++++++------
 .../recipes-devtools/autoconf-archive/autoconf-archive.inc   |  8 ++++----
 meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb            |  2 +-
 meta-oe/recipes-extended/nana/nana_2.5.bb                    |  2 +-
 meta-oe/recipes-support/daemontools/daemontools_0.76.bb      |  2 +-
 meta-oe/recipes-support/usbpath/usbpath_svn.bb               |  2 +-
 meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb   |  2 +-
 meta-python/recipes-devtools/python/python-lxml_3.2.5.bb     |  2 +-
 10 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/azy_svn.bb b/meta-efl/recipes-efl/efl/azy_svn.bb
index cb180fb..0c3c9d7 100644
--- a/meta-efl/recipes-efl/efl/azy_svn.bb
+++ b/meta-efl/recipes-efl/efl/azy_svn.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Azy is a library meant for implementing rpc clients and servers in a simple manner."
 DEPENDS = "pkgconfig zlib openssl eina gnutls ecore libxml2 re2c-native mysql5 azy-native glib-2.0"
-DEPENDS_virtclass-native = "pkgconfig-native zlib-native openssl-native eina-native gnutls-native ecore-native libxml2-native re2c-native mysql5-native glib-2.0-native"
+DEPENDS_class-native = "pkgconfig-native zlib-native openssl-native eina-native gnutls-native ecore-native libxml2-native re2c-native mysql5-native glib-2.0-native"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
index 88f164f..1afcd49 100644
--- a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
+++ b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
@@ -17,12 +17,12 @@ SRC_URI[sha256sum] = "55c900a905482992730f575f3eef34d50bda717c197c97c08fa5a6eafd
 BBCLASSEXTEND = "native"
 
 IDL_COMPILER_DEPENDS = "orbit2-native"
-IDL_COMPILER_DEPENDS_virtclass-native = " "
+IDL_COMPILER_DEPENDS_class-native = " "
 DEPENDS = "libidl popt ${IDL_COMPILER_DEPENDS}"
 
-# IDL_COMPILER_DEPENDS_virtclass-native for some reason didn't work and orbit2-native
+# IDL_COMPILER_DEPENDS_class-native for some reason didn't work and orbit2-native
 # was still in orbit2-native DEPENDS causing circular dependency
-DEPENDS_virtclass-native = "libidl-native popt-native"
+DEPENDS_class-native = "libidl-native popt-native"
 PARALLEL_MAKE = ""
 
 
@@ -38,4 +38,4 @@ LEAD_SONAME = "libORBit-2.so"
 inherit autotools pkgconfig gtk-doc
 
 EXTRA_OEMAKE = "IDL_COMPILER='${STAGING_BINDIR_NATIVE}/orbit-idl-2'"
-EXTRA_OEMAKE_virtclass-native = " "
+EXTRA_OEMAKE_class-native = " "
diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 0740f0f..3e7f918 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -10,7 +10,7 @@ DEPENDS = "virtual/db libpcre openssl postfix-native \
     ${@base_contains('DISTRO_FEATURES', 'ldap', 'openldap', '', d)} \
     ${@base_contains('DISTRO_FEATURES', 'sasl', 'cyrus-sasl', '', d)} \
 "
-DEPENDS_virtclass-native = "virtual/db-native openssl-native libpcre-native"
+DEPENDS_class-native = "virtual/db-native openssl-native libpcre-native"
 
 LICENSE = "IPL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64375f37431336ea1b1b3005fe3fa354"
@@ -54,8 +54,8 @@ export AUXLIBS-ldap = "\
     ${@base_contains('DISTRO_FEATURES', 'ldap', '-lldap -llber', '', d)}"
 
 # no native openldap
-export CCARGS-ldap_virtclass-native = ""
-export AUXLIBS-ldap_virtclass-native = ""
+export CCARGS-ldap_class-native = ""
+export AUXLIBS-ldap_class-native = ""
 
 # SASL support -DUSE_LDAP_SASL -DUSE_SASL_AUTH
 # current openldap didn't enable SASL
@@ -63,8 +63,8 @@ export CCARGS-sasl  = "\
     ${@base_contains('DISTRO_FEATURES', 'sasl', '-DUSE_SASL_AUTH -DUSE_CYRUS_SASL -I=/usr/include/sasl', '', d)}"
 export AUXLIBS-sasl = "\
     ${@base_contains('DISTRO_FEATURES', 'sasl', '-lsasl2', '', d)}"
-export CCARGS-sasl_virtclass-native = ""
-export AUXLIBS-sasl_virtclass-native = ""
+export CCARGS-sasl_class-native = ""
+export AUXLIBS-sasl_class-native = ""
 
 # PCRE, TLS support default
 export CCARGS  = "${CFLAGS} -DHAS_PCRE -DUSE_TLS ${CCARGS-ldap} ${CCARGS-sasl}"
@@ -119,7 +119,7 @@ do_compile () {
     oe_runmake
 }
 
-do_install_prepend_virtclass-native() {
+do_install_prepend_class-native() {
     export POSTCONF="bin/postconf"
 }
 
diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
index e8785f4..9399363 100644
--- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
+++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
@@ -3,12 +3,12 @@ HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
 SECTION = "devel"
 
 DEPENDS += "m4-native"
-DEPENDS_virtclass-native = "m4-native gnu-config-native"
-DEPENDS_virtclass-nativesdk = "m4-nativesdk gnu-config-nativesdk"
+DEPENDS_class-native = "m4-native gnu-config-native"
+DEPENDS_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
 
 RDEPENDS_${PN} = "m4 gnu-config"
-RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native"
-RDEPENDS_${PN}_virtclass-nativesdk = "m4-nativesdk gnu-config-nativesdk"
+RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
+RDEPENDS_${PN}_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2"
 
diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
index 11e2ba1..8ad5457 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
+++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 PR = "r3"
 
-DEPENDS_virtclass-native = "freetype-native libpng-native jpeg-native"
+DEPENDS_class-native = "freetype-native libpng-native jpeg-native"
 DEPENDS = "freetype libpng jpeg expat gtk+"
 
 BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-extended/nana/nana_2.5.bb b/meta-oe/recipes-extended/nana/nana_2.5.bb
index e55cec8..19a90ff 100644
--- a/meta-oe/recipes-extended/nana/nana_2.5.bb
+++ b/meta-oe/recipes-extended/nana/nana_2.5.bb
@@ -19,7 +19,7 @@ inherit autotools-brokensep pkgconfig
 
 EXTRA_OEMAKE = "DESTDIR=${D}"
 
-do_configure_prepend_virtclass-nativesdk() {
+do_configure_prepend_class-nativesdk() {
     sed -i -e 's:@CPP@:\$\{CXX\} \$\{CXXFLAGS\} \-E:g' ${S}/src/nana.in
     sed -i -e 's:@CC@:\$\{CC\} \$\{CFLAGS\} \-E:g' ${S}/src/nana-clg.in
     sed -i -e 's:@CXX@::g' ${S}/src/nana-c++lg.in
diff --git a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
index fb87ea8..161f92f 100644
--- a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
+++ b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
@@ -26,7 +26,7 @@ SRC_URI[sha256sum] = "a55535012b2be7a52dcd9eccabb9a198b13be50d0384143bd3b32b8710
 S = "${WORKDIR}/admin/${BPN}-${PV}"
 
 DEPENDS += "daemontools-native"
-DEPENDS_virtclass-native = ""
+DEPENDS_class-native = ""
 
 do_compile() {
     ./package/compile
diff --git a/meta-oe/recipes-support/usbpath/usbpath_svn.bb b/meta-oe/recipes-support/usbpath/usbpath_svn.bb
index c6955ed..6c9cd04 100644
--- a/meta-oe/recipes-support/usbpath/usbpath_svn.bb
+++ b/meta-oe/recipes-support/usbpath/usbpath_svn.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://usbpath.c;endline=20;md5=0aa8c7d2af9110c78a99fbf9a504dc3f"
 DEPENDS = "virtual/libusb0"
-DEPENDS_virtclass-native = "virtual/libusb0-native"
+DEPENDS_class-native = "virtual/libusb0-native"
 
 BBCLASSEXTEND = "native"
 
diff --git a/meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb b/meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb
index 4ec0668..56880e5 100644
--- a/meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=011c0d78eb6054d731c879132d7313f0"
 HOMEPAGE = "http://epydoc.sourceforge.net/" 
 SRCNAME = "epydoc" 
 DEPENDS += "python"
-DEPENDS_virtclass-native += "python-native"
+DEPENDS_class-native += "python-native"
 
 SRC_URI = "http://downloads.sourceforge.net/project/${SRCNAME}/${SRCNAME}/${PV}/${SRCNAME}-${PV}.tar.gz" 
 SRC_URI[md5sum] = "cdd6f6c76dd8bab5e653a343a0544294"
diff --git a/meta-python/recipes-devtools/python/python-lxml_3.2.5.bb b/meta-python/recipes-devtools/python/python-lxml_3.2.5.bb
index 68e3677..4eb5fe7 100644
--- a/meta-python/recipes-devtools/python/python-lxml_3.2.5.bb
+++ b/meta-python/recipes-devtools/python/python-lxml_3.2.5.bb
@@ -31,5 +31,5 @@ DISTUTILS_INSTALL_ARGS += " \
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS_${PN} += "libxml2 libxslt python-compression"
-RDEPENDS_${PN}_virtclass-native = "libxml2-native libxslt-native"
+RDEPENDS_${PN}_class-native = "libxml2-native libxslt-native"
 
-- 
2.1.4


