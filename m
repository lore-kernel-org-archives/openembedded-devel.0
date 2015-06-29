Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5C3DE60024
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jun 2015 09:40:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="97861076"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jun 2015 17:44:33 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5T9crRn025171
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jun 2015 17:38:53 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 29 Jun 2015 17:40:33 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 29 Jun 2015 17:40:56 +0800
Message-ID: <1435570856-56318-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-oe][PATCH] openwsman: add new recipe
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
X-List-Received-Date: Mon, 29 Jun 2015 09:40:34 -0000
Content-Type: text/plain

Openwsman is an open source implementation of WS-Management;
enabling the in-band management of Linux/uni*/Windows platforms.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../libssl-is-required-if-eventint-supported.patch | 17 ++++++
 .../openwsman/openwsman/openwsmand.service         | 12 +++++
 .../recipes-extended/openwsman/openwsman_2.6.0.bb  | 63 ++++++++++++++++++++++
 3 files changed, 92 insertions(+)
 create mode 100644 meta-oe/recipes-extended/openwsman/openwsman/libssl-is-required-if-eventint-supported.patch
 create mode 100644 meta-oe/recipes-extended/openwsman/openwsman/openwsmand.service
 create mode 100644 meta-oe/recipes-extended/openwsman/openwsman_2.6.0.bb

diff --git a/meta-oe/recipes-extended/openwsman/openwsman/libssl-is-required-if-eventint-supported.patch b/meta-oe/recipes-extended/openwsman/openwsman/libssl-is-required-if-eventint-supported.patch
new file mode 100644
index 0000000..bd540e3
--- /dev/null
+++ b/meta-oe/recipes-extended/openwsman/openwsman/libssl-is-required-if-eventint-supported.patch
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
diff --git a/meta-oe/recipes-extended/openwsman/openwsman/openwsmand.service b/meta-oe/recipes-extended/openwsman/openwsman/openwsmand.service
new file mode 100644
index 0000000..154f3cd
--- /dev/null
+++ b/meta-oe/recipes-extended/openwsman/openwsman/openwsmand.service
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
diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.6.0.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.6.0.bb
new file mode 100644
index 0000000..03fbbf5
--- /dev/null
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.6.0.bb
@@ -0,0 +1,63 @@
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
+SRC_URI = "https://github.com/Openwsman/openwsman/archive/v${PV}.tar.gz \
+           file://libssl-is-required-if-eventint-supported.patch \
+           file://openwsmand.service"
+
+SRC_URI[md5sum] = "824834a86040b98b03f3fc0f7f62e853"
+SRC_URI[sha256sum] = "449b4972dc7700918f8f674047f0a1a9c19eeee3f4ce82f47890dddfa56e823f"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d4f53d4c6cf73b9d43186ce3be6dd0ba"
+
+inherit systemd cmake pkgconfig pythonnative perlnative
+
+SYSTEMD_SERVICE_${PN} = "openwsmand.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+EXTRA_OECMAKE = "-DBUILD_BINDINGS=NO \
+                 -DBUILD_LIBCIM=NO \
+                 -DBUILD_PERL=YES \
+                 -DCMAKE_INSTALL_PREFIX=${prefix} \
+                 -DLIB=lib \
+                "
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
+    chmod 755 ${D}/${sysconfdir}/openwsman/owsmangencert.sh
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
1.8.4.2


