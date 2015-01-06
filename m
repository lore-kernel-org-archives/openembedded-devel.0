Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4FD7172849
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2015 05:50:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="55593844"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jan 2015 13:46:33 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t065nP0u032033
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 6 Jan 2015 13:49:25 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 6 Jan 2015 13:49:59 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 6 Jan 2015 13:45:47 +0800
Message-ID: <1420523147-3740-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-networking][PATCH v2] openwsman: add recipe
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
X-List-Received-Date: Tue, 06 Jan 2015 05:50:20 -0000
Content-Type: text/plain

Opensource Implementation of WS-Management

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../libssl-is-required-if-eventint-supported.patch | 17 +++++++
 .../openwsman/openwsman/openwsmand.service         | 12 +++++
 .../openwsman/openwsman_2.4.12.bb                  | 59 ++++++++++++++++++++++
 3 files changed, 88 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/openwsman/openwsman/libssl-is-required-if-eventint-supported.patch
 create mode 100644 meta-networking/recipes-protocols/openwsman/openwsman/openwsmand.service
 create mode 100644 meta-networking/recipes-protocols/openwsman/openwsman_2.4.12.bb

diff --git a/meta-networking/recipes-protocols/openwsman/openwsman/libssl-is-required-if-eventint-supported.patch b/meta-networking/recipes-protocols/openwsman/openwsman/libssl-is-required-if-eventint-supported.patch
new file mode 100644
index 0000000..bd540e3
--- /dev/null
+++ b/meta-networking/recipes-protocols/openwsman/openwsman/libssl-is-required-if-eventint-supported.patch
@@ -0,0 +1,17 @@
+libssl is required by wsman_client_transport if ENABLE_EVENTING_SUPPORT enabled.
+
+Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
+
+diff -Nurp openwsman-2.4.12.orig/src/lib/CMakeLists.txt openwsman-2.4.12/src/lib/CMakeLists.txt
+--- openwsman-2.4.12.orig/src/lib/CMakeLists.txt	2014-10-28 23:04:47.000000000 +0800
++++ openwsman-2.4.12/src/lib/CMakeLists.txt	2014-12-31 11:09:20.340428523 +0800
+@@ -56,6 +56,9 @@ TARGET_LINK_LIBRARIES( ${WSMAN_CLIENT_TR
+ SET_TARGET_PROPERTIES( ${WSMAN_CLIENT_TRANSPORT_PKG} PROPERTIES VERSION 1.0.0 SOVERSION 1)
+ INSTALL(TARGETS ${WSMAN_CLIENT_TRANSPORT_PKG} DESTINATION ${LIB_INSTALL_DIR})
+ 
++IF( ENABLE_EVENTING_SUPPORT )
++TARGET_LINK_LIBRARIES( ${WSMAN_CLIENT_TRANSPORT_PKG} ${OPENSSL_LIBRARIES} )
++ENDIF( ENABLE_EVENTING_SUPPORT )
+ 
+ ############### wsman_client ###############
+ 
diff --git a/meta-networking/recipes-protocols/openwsman/openwsman/openwsmand.service b/meta-networking/recipes-protocols/openwsman/openwsman/openwsmand.service
new file mode 100644
index 0000000..154f3cd
--- /dev/null
+++ b/meta-networking/recipes-protocols/openwsman/openwsman/openwsmand.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Openwsman WS-Management Service
+After=syslog.target
+
+[Service]
+Type=forking
+ExecStart=@SBINDIR@/openwsmand
+ExecStartPre=@SYSCONFDIR@/openwsman/owsmangencert.sh
+PIDFile=@LOCALSTATEDIR@/run/wsmand.pid
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-protocols/openwsman/openwsman_2.4.12.bb b/meta-networking/recipes-protocols/openwsman/openwsman_2.4.12.bb
new file mode 100644
index 0000000..f188b1d
--- /dev/null
+++ b/meta-networking/recipes-protocols/openwsman/openwsman_2.4.12.bb
@@ -0,0 +1,59 @@
+SUMMARY = "Opensource Implementation of WS-Management"
+DESCRIPTION = "Openwsman is a project intended to provide an open-source \
+implementation of the Web Services Management specipication \
+(WS-Management) and to expose system management information on the \
+Linux operating system using the WS-Management protocol. WS-Management \
+is based on a suite of web services specifications and usage \
+requirements that exposes a set of operations focused on and covers \
+all system management aspects. \
+Openwsman Server and service libraries"
+HOMEPAGE = "http://www.openwsman.org/"
+SECTION = "Applications/System"
+
+DEPENDS = "curl libxml2 openssl libpam"
+
+SRC_URI = "https://github.com/Openwsman/openwsman/archive/v2.4.12.tar.gz \
+           file://libssl-is-required-if-eventint-supported.patch \
+           file://openwsmand.service"
+
+SRC_URI[md5sum] = "4893a41c6fd89b33095c315c79638a75"
+SRC_URI[sha256sum] = "6a4b75dfff1a51c7bc09fd1d44abbde55ae74906f3828797ce391883358120f4"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d4f53d4c6cf73b9d43186ce3be6dd0ba"
+
+inherit systemd cmake pkgconfig pythonnative perlnative
+
+SYSTEMD_SERVICE_${PN} = "openwsmand.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+EXTRA_OECMAKE = "-DBUILD_BINDINGS=NO -DBUILD_LIBCIM=NO -DBUILD_PERL=YES \
+                 -DCMAKE_INSTALL_PREFIX=${prefix} -DLIB=lib"
+
+do_configure_prepend() {
+    export HOST_SYS=${HOST_SYS}
+    export BUILD_SYS=${BUILD_SYS}
+    export STAGING_INCDIR=${STAGING_INCDIR}
+    export STAGING_LIBDIR=${STAGING_LIBDIR}
+}
+
+do_install_append() {
+    install -d ${D}/${sysconfdir}/init.d
+    install -m 755 ${B}/etc/init/openwsmand.sh ${D}/${sysconfdir}/init.d/openwsmand
+    ln -sf ${sysconfdir}/init.d/openwsmand ${D}/${sbindir}/rcopenwsmand
+
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}/${systemd_unitdir}/system
+        install -m 644 ${WORKDIR}/openwsmand.service ${D}/${systemd_unitdir}/system
+
+        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/openwsmand.service
+        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/openwsmand.service
+        sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${systemd_unitdir}/system/openwsmand.service
+    fi
+}
+
+FILES_${PN}-dbg += "${libdir}/openwsman/plugins/.debug/ \
+                    ${libdir}/openwsman/authenticators/.debug/ \
+                   "
+
+INSANE_SKIP_${PN} = "dev-so"
-- 
1.9.1


