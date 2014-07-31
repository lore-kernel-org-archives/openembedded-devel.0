Return-Path: <yao.zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B7F78705D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 19:15:23 +0000 (UTC)
Received: from yzhao2-OptiPlex-990.corp.ad.wrs.com
	(yzhao2-optiplex-990.corp.ad.wrs.com [128.224.140.163])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s6VJFOXb009659
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 12:15:24 -0700 (PDT)
From: Yao Zhao <yao.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Jul 2014 15:15:00 -0400
Message-Id: <1406834100-20328-1-git-send-email-yao.zhao@windriver.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] add support for opendataplane
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
X-List-Received-Date: Thu, 31 Jul 2014 19:15:30 -0000

support build opendataplane from linaro.

The OpenDataPlane (ODP) project provides a data plane application
programming environment that is easy to use, high performance,
and portable between networking SoCs.

Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
---
 ...inux-dpdk-remove-unnecessary-include-path.patch | 29 ++++++++++++++++++++++
 .../opendataplane/opendataplane.inc                | 21 ++++++++++++++++
 .../opendataplane/opendataplane_0.2.bb             | 25 +++++++++++++++++++
 .../opendataplane/opendataplane_git.bb             | 14 +++++++++++
 4 files changed, 89 insertions(+)
 create mode 100644 meta-networking/recipes-support/opendataplane/files/0001-linux-dpdk-remove-unnecessary-include-path.patch
 create mode 100644 meta-networking/recipes-support/opendataplane/opendataplane.inc
 create mode 100644 meta-networking/recipes-support/opendataplane/opendataplane_0.2.bb
 create mode 100644 meta-networking/recipes-support/opendataplane/opendataplane_git.bb

diff --git a/meta-networking/recipes-support/opendataplane/files/0001-linux-dpdk-remove-unnecessary-include-path.patch b/meta-networking/recipes-support/opendataplane/files/0001-linux-dpdk-remove-unnecessary-include-path.patch
new file mode 100644
index 0000000..a0ef7ce
--- /dev/null
+++ b/meta-networking/recipes-support/opendataplane/files/0001-linux-dpdk-remove-unnecessary-include-path.patch
@@ -0,0 +1,29 @@
+From 72b8eacc2985f054cadc5d0b48351a658998b8d6 Mon Sep 17 00:00:00 2001
+From: Yao Zhao <yao.zhao@windriver.com>
+Date: Wed, 30 Jul 2014 16:02:14 -0400
+Subject: [PATCH] linux-dpdk: remove unnecessary include path
+
+for dpdk include/arch and include/exec-env is only included
+by generic rte_xxx.h header, can't be included directly.
+
+Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
+---
+ platform/linux-dpdk/Makefile.am | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/platform/linux-dpdk/Makefile.am b/platform/linux-dpdk/Makefile.am
+index 4aa568f..dfcaadb 100644
+--- a/platform/linux-dpdk/Makefile.am
++++ b/platform/linux-dpdk/Makefile.am
+@@ -12,8 +12,6 @@ PLAT_CFLAGS  = -msse4.2
+ if SDK_INSTALL_PATH_
+ PLAT_CFLAGS += -include $(SDK_INSTALL_PATH)/include/rte_config.h
+ PLAT_CFLAGS += -I$(SDK_INSTALL_PATH)/include
+-PLAT_CFLAGS += -I$(SDK_INSTALL_PATH)/include/arch
+-PLAT_CFLAGS += -I$(SDK_INSTALL_PATH)/include/exec-env
+ 
+ AM_LDFLAGS  += -L$(SDK_INSTALL_PATH)/lib
+ endif
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-support/opendataplane/opendataplane.inc b/meta-networking/recipes-support/opendataplane/opendataplane.inc
new file mode 100644
index 0000000..c4b184e
--- /dev/null
+++ b/meta-networking/recipes-support/opendataplane/opendataplane.inc
@@ -0,0 +1,21 @@
+SUMMARY = "Cross platform OpenDataPlane application APIs"
+
+DESCRIPTION = "The OpenDataPlane project has been established to \
+produce an open-source, cross-platform set of application \
+programming interfaces (APIs) for the networking data plane."
+
+HOMEPAGE = "http://www.opendataplane.org"
+SECTION = "networking"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4ccfa994aa96974cfcd39a59faee20a2"
+                 
+SRC_URI = "git://git.linaro.org/lng/odp.git"
+
+COMPATIBLE_HOST = "^((?!mips).*)$"
+
+PACKAGECONFIG ??= "platform_linux_generic"
+PACKAGECONFIG[netmap] = "--enable-netmap,,,"
+PACKAGECONFIG[platform_linux_generic] = "--with-platform=linux-generic,,,"
+
+S = "${WORKDIR}/git"
+
diff --git a/meta-networking/recipes-support/opendataplane/opendataplane_0.2.bb b/meta-networking/recipes-support/opendataplane/opendataplane_0.2.bb
new file mode 100644
index 0000000..74b6c2f
--- /dev/null
+++ b/meta-networking/recipes-support/opendataplane/opendataplane_0.2.bb
@@ -0,0 +1,25 @@
+require ${BPN}.inc
+
+#odp-0.2 tag
+SRCREV  = "6007d8833a6880abedf98f792586c0cfb9f10de0"
+PV = "0.2"
+
+#0.2 still using pure Makefile
+
+#override the Makefile DESTDIR
+export DESTDIR="${D}${exec_prefix}"
+
+do_install () {
+    oe_runmake install
+    
+    #move DESTDIR/share/odp/odp_x usr/bin
+    install -d ${D}${bindir}
+    for i in ${DESTDIR}/share/odp/*; do
+        filename=`basename $i`
+        mv ${DESTDIR}/share/odp/${filename} ${D}${bindir}/${filename}
+    done
+    rm -rf ${DESTDIR}/share
+}
+
+#non standard doc install location
+FILES_${PN}-doc += "/usr/doc/*"
diff --git a/meta-networking/recipes-support/opendataplane/opendataplane_git.bb b/meta-networking/recipes-support/opendataplane/opendataplane_git.bb
new file mode 100644
index 0000000..7415993
--- /dev/null
+++ b/meta-networking/recipes-support/opendataplane/opendataplane_git.bb
@@ -0,0 +1,14 @@
+require ${BPN}.inc
+
+SRC_URI += "file://0001-linux-dpdk-remove-unnecessary-include-path.patch"
+
+SRCREV  = "${AUTOREV}"
+#8f4f080625e2db810da3f13770ba418c72b08ede will support --with-sdk-install-path
+PV = "0.2+git${SRCPV}"
+
+PACKAGECONFIG[platform_linux_generic] = "--with-platform=linux-generic,,openssl,libcrypto"
+#need meta-intel layer's common/recipes-extended/dpdk/dpdk recipe
+PACKAGECONFIG[platform_linux_dpdk] = '--with-platform=linux-dpdk --with-sdk-install-path="${STAGING_EXECPREFIXDIR}",,dpdk,'
+PACKAGECONFIG[platform_linux_keystone2] = "--with-platform=linux-keystone2,,,"
+
+inherit autotools
-- 
1.9.1


