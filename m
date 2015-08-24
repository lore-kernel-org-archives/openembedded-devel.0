Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5825676A81
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 10:07:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99953298"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Aug 2015 18:10:17 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7OA70Kn007312
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 18:07:00 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 24 Aug 2015 18:07:05 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Aug 2015 18:07:21 +0800
Message-ID: <1440410841-15017-7-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1440410841-15017-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1440410841-15017-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-oe][PATCH v6 6/6] openlmi: add openlmi
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
X-List-Received-Date: Mon, 24 Aug 2015 10:07:07 -0000
Content-Type: text/plain

OpenLMI  = Open Linux Management Infrastructure.
OpenLMI is open-source project aiming to improve management of Linux systems using WBEM standards.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 ...x-lib64-can-not-be-shiped-in-64bit-target.patch | 31 +++++++++++++
 .../openlmi/openlmi-networking_0.3.1.bb            | 30 ++++++++++++
 .../openlmi/openlmi-providers/0001-fix-error.patch | 26 +++++++++++
 ...x-lib64-can-not-be-shiped-in-64bit-target.patch | 31 +++++++++++++
 .../openlmi/openlmi-providers_0.6.0.bb             | 54 ++++++++++++++++++++++
 .../openlmi/openlmi-storage_0.8.1.bb               | 32 +++++++++++++
 .../openlmi/openlmi-tools_0.10.5.bb                | 23 +++++++++
 7 files changed, 227 insertions(+)
 create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-networking/0001-fix-lib64-can-not-be-shiped-in-64bit-target.patch
 create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb
 create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-providers/0001-fix-error.patch
 create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-providers/0001-fix-lib64-can-not-be-shiped-in-64bit-target.patch
 create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb
 create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb
 create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb

diff --git a/meta-oe/recipes-extended/openlmi/openlmi-networking/0001-fix-lib64-can-not-be-shiped-in-64bit-target.patch b/meta-oe/recipes-extended/openlmi/openlmi-networking/0001-fix-lib64-can-not-be-shiped-in-64bit-target.patch
new file mode 100644
index 0000000..c238200
--- /dev/null
+++ b/meta-oe/recipes-extended/openlmi/openlmi-networking/0001-fix-lib64-can-not-be-shiped-in-64bit-target.patch
@@ -0,0 +1,31 @@
+From 336bb5a031077461ec6b2e5438738bf100f0dd2f Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Mon, 3 Aug 2015 02:37:46 +0900
+Subject: [PATCH] fix lib64 can not be shiped in 64bit target
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ CMakeLists.txt | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1ba3cd3..2411745 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -35,13 +35,6 @@ if (DEBUG)
+     add_definitions("-DDEBUG_ENABLED")
+ endif (DEBUG)
+ 
+-# Set LIB_SUFFIX to 64 on 64bit architectures
+-if(CMAKE_SIZEOF_VOID_P EQUAL 4)
+-    set(LIB_SUFFIX "")
+-else(CMAKE_SIZEOF_VOID_P EQUAL 4)
+-    SET(LIB_SUFFIX 64)
+-endif(CMAKE_SIZEOF_VOID_P EQUAL 4)
+-
+ # Find OpenLMIMacros when installed in other prefix than /usr (e.g. /usr/local)
+ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_INSTALL_PREFIX})
+ include(OpenLMIMacros RESULT_VARIABLE LMIMACROS)
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb b/meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb
new file mode 100644
index 0000000..5442910
--- /dev/null
+++ b/meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb
@@ -0,0 +1,30 @@
+SUMMARY = "CIM providers for network management"
+DESCRIPTION = "\
+openlmi-networking is set of CMPI providers for network management using \
+Common Information Model (CIM)."
+HOMEPAGE = "http://www.openlmi.org/"
+LICENSE = "LGPL-2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
+SECTION = "System/Management"
+DEPENDS = "openlmi-providers konkretcmpi sblim-cmpi-devel cim-schema-exper networkmanager dbus libcheck glib-2.0"
+
+SRC_URI = "http://fedorahosted.org/released/${BPN}/${BP}.tar.gz \
+           file://0001-fix-lib64-can-not-be-shiped-in-64bit-target.patch \
+          "
+SRC_URI[md5sum] = "f20de8c76fb6a80001b14c1eb035953e"
+SRC_URI[sha256sum] = "578eaa5c65fe924b5d7aeb635509dd46443166cd6a88b019bc42646e3518a460"
+
+inherit cmake
+
+EXTRA_OECMAKE = "${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
+                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
+                "
+
+
+do_configure_prepend() {
+     export CMAKE_INSTALL_DATDIR="${STAGING_DATADIR}"
+}
+
+
+FILES_${PN} =+ "${libdir}/cmpi/libcmpiLMI_Networking.so ${prefix}/libexec*"
+FILES_${PN}-dbg =+ "${libdir}/cmpi/.debug*"
diff --git a/meta-oe/recipes-extended/openlmi/openlmi-providers/0001-fix-error.patch b/meta-oe/recipes-extended/openlmi/openlmi-providers/0001-fix-error.patch
new file mode 100644
index 0000000..4bcd1c4
--- /dev/null
+++ b/meta-oe/recipes-extended/openlmi/openlmi-providers/0001-fix-error.patch
@@ -0,0 +1,26 @@
+From 764171866b84e0198b67538f63022abde3e628ad Mon Sep 17 00:00:00 2001
+From: Qian Lei <qianl.fnst@cn.fujitsu.com>
+Date: Fri, 16 Jan 2015 14:15:25 +0800
+Subject: [PATCH] fix error
+
+Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
+---
+ cmake/modules/OpenLMIMacros.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmake/modules/OpenLMIMacros.cmake b/cmake/modules/OpenLMIMacros.cmake
+index d55f983..dbc32ec 100644
+--- a/cmake/modules/OpenLMIMacros.cmake
++++ b/cmake/modules/OpenLMIMacros.cmake
+@@ -89,7 +89,7 @@ macro(konkretcmpi_generate MOFS CIM_PROVIDERS CIM_HEADERS CIM_CLASSES)
+         endforeach(CLASS ${CIM_CLASS_NAMES})
+ 
+         # Generate headers for CIM classes
+-        set(ENV{KONKRET_SCHEMA_DIR} "/usr/share/mof/cim-current")
++        set(ENV{KONKRET_SCHEMA_DIR} "$ENV{CMAKE_INSTALL_DATDIR}/mof/cim-current")
+         execute_process(COMMAND ${KONKRETCMPI_KONKRET}
+                                 ${KONKRET_MOF_FILES}
+                                 ${GENERATE_PROVIDERS}
+-- 
+1.8.3.1
+
diff --git a/meta-oe/recipes-extended/openlmi/openlmi-providers/0001-fix-lib64-can-not-be-shiped-in-64bit-target.patch b/meta-oe/recipes-extended/openlmi/openlmi-providers/0001-fix-lib64-can-not-be-shiped-in-64bit-target.patch
new file mode 100644
index 0000000..9c8ebe4
--- /dev/null
+++ b/meta-oe/recipes-extended/openlmi/openlmi-providers/0001-fix-lib64-can-not-be-shiped-in-64bit-target.patch
@@ -0,0 +1,31 @@
+From 7cecfa95f033b33a1c3260c214b2d0e5e81b4fd3 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Mon, 3 Aug 2015 02:05:56 +0900
+Subject: [PATCH] fix lib64 can not be shiped in 64bit target
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ CMakeLists.txt | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 48ae206..3ead9c6 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -21,13 +21,6 @@ else(HAS_STACK_PROTECTOR_STRONG)
+     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fstack-protector")
+ endif()
+ 
+-# Set LIB_SUFFIX to 64 on 64bit architectures
+-if(CMAKE_SIZEOF_VOID_P EQUAL 4)
+-    set(LIB_SUFFIX "")
+-else(CMAKE_SIZEOF_VOID_P EQUAL 4)
+-    SET(LIB_SUFFIX 64)
+-endif(CMAKE_SIZEOF_VOID_P EQUAL 4)
+-
+ if(NOT SYSCONF_INSTALL_DIR)
+     set(SYSCONF_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}/etc)
+ endif(NOT SYSCONF_INSTALL_DIR)
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb b/meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb
new file mode 100644
index 0000000..f74fb77
--- /dev/null
+++ b/meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb
@@ -0,0 +1,54 @@
+SUMMARY = "Set of basic CIM providers"
+DESCRIPTION = "\
+openlmi-providers is set of (usually) small CMPI providers (agents) for \
+basic monitoring and management of host system using Common Information \
+Model (CIM)."
+HOMEPAGE = "http://www.openlmi.org/"
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
+SECTION = "System/Management"
+DEPENDS = "konkretcmpi-native konkretcmpi sblim-sfcb sblim-cmpi-devel cim-schema-exper lmsensors libuser swig swig-native dbus udev systemd-systemctl-native pciutils"
+
+SRC_URI = "http://fedorahosted.org/released/${BPN}/${BP}.tar.gz \
+           file://0001-fix-error.patch \
+           file://0001-fix-lib64-can-not-be-shiped-in-64bit-target.patch \
+          "
+SRC_URI[md5sum] = "5904f23cf494946237cfbbdbe644a3cd"
+SRC_URI[sha256sum] = "e2b2fbeaec45a83905d0da3b87da83904d9cd94c1b86312f844587b3fff11f56"
+
+inherit cmake
+LDFLAGS_append = "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
+EXTRA_OECMAKE = " \
+                 -DWITH-DEVASSISTANT=OFF \
+                 -DWITH-JOURNALD=OFF \
+                 -DWITH-SERVICE=OFF \
+                 -DWITH-SERVICE-LEGACY=ON \
+                 -DWITH-ACCOUNT=OFF \
+                 -DWITH-PCP=OFF \
+                 -DWITH-REALMD=OFF \
+                 -DWITH-FAN=OFF \
+                 -DWITH-LOCALE=OFF \
+                 -DWITH-INDSENDER=OFF \
+                 -DWITH-JOBMANAGER=OFF \
+                 -DWITH-SSSD=OFF \
+                 -DWITH-SELINUX=OFF \
+                 -DWITH-SOFTWARE-DBUS=ON \
+                 ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
+                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
+               "
+
+do_configure_prepend() {
+    export CMAKE_INSTALL_DATDIR="${STAGING_DATADIR}"
+}
+
+do_install_append() {
+    if [ -d ${D}${prefix}${sysconfidr} ]; then
+        mv ${D}${prefix}${sysconfdir} ${D}${sysconfdir}
+    fi
+}
+
+FILES_${PN} =+ "${libdir}/cmpi/libcmpiLMI* ${prefix}/libexec*"
+FILES_${PN}-dev =+ "${datadir}/cmake*"
+FILES_${PN}-dbg =+ "${libdir}/cmpi/.debug*"
+
+RDEPENDS_${PN} = "python"
diff --git a/meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb b/meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb
new file mode 100644
index 0000000..015d803
--- /dev/null
+++ b/meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb
@@ -0,0 +1,32 @@
+SUMMARY = "CIM providers for storage management"
+DESCRIPTION = "\
+The openlmi-storage package contains CMPI providers for management of storage \
+using Common Information Managemen (CIM) protocol. \
+\
+The providers can be registered in any CMPI-aware CIMOM, both OpenPegasus and \
+SFCB were tested."
+HOMEPAGE = "http://www.openlmi.org/"
+LICENSE = "LGPL-2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+SECTION = "System/Management"
+DEPENDS = "openlmi-providers pywbem cmpi-bindings"
+RDEPENDS_${PN} += "bash"
+
+SRC_URI = "http://fedorahosted.org/released/${BPN}/${BP}.tar.gz"
+SRC_URI[md5sum] = "898cf0d8c03b8ad6b45d65f335ddee0d"
+SRC_URI[sha256sum] = "4a1ba9957750f94ea58a89cea28985564f38d7cc9aa00fcae20c51e7b32bd0a8"
+
+inherit setuptools
+
+do_install_append() {
+    install -m 755 -d ${D}${datadir}/${BPN}
+    install -m 644 ${S}/mof/* ${D}${datadir}/${BPN}/
+
+    install -m 755 -d ${D}${sysconfdir}/openlmi/storage
+    install -m 644 storage.conf ${D}${sysconfdir}/openlmi/storage/storage.conf
+
+    install -m 755 -d ${D}${libexecdir}/pegasus
+    install -m 755 pycmpiLMI_Storage-cimprovagt ${D}${libexecdir}/pegasus/
+}
+
+FILES_${PN} =+ "${sysconfdir}/openlmi/storage/storage.conf ${datadir}/${BPN}/*"
diff --git a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
new file mode 100644
index 0000000..b23869d
--- /dev/null
+++ b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Set of CLI tools for Openlmi providers"
+DESCRIPTION = "openlmi-tools is a set of command line tools for Openlmi providers."
+HOMEPAGE = "http://www.openlmi.org/"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
+SECTION = "System/Management"
+
+inherit setuptools
+
+DEPENDS = "python-native pywbem-native python-m2crypto pywbem"
+
+SRC_URI = "http://fedorahosted.org/released/${BPN}/${BP}.tar.gz \
+          "
+SRC_URI[md5sum] = "e156246cb7b49753db82f4ddf7f03e50"
+SRC_URI[sha256sum] = "292b8f5f2250655a4add8183c529b73358bc980bd4f23cfa484a940953fce9e4"
+
+do_compile_prepend() {
+    cd cli
+    sed 's/@@VERSION@@/$(VERSION)/g' setup.py.skel >setup.py
+}
+do_install_prepend() {
+    cd cli
+}
-- 
1.8.4.2


