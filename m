Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 37D8F77D67
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:29:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v86JTiTY027108
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2017 12:29:44 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 12:29:44 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Sep 2017 14:23:13 -0500
Message-ID: <1504725809-12825-16-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 15/31] dlm: requires corosync, from meta-networking
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
X-List-Received-Date: Wed, 06 Sep 2017 19:29:43 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../respect-ldflags-also-from-bin_ldflags.patch    | 36 +++++++++++++++
 meta-networking/recipes-extended/dlm/dlm_4.0.2.bb  | 51 ++++++++++++++++++++++
 .../respect-ldflags-also-from-bin_ldflags.patch    | 36 ---------------
 meta-oe/recipes-extended/dlm/dlm_4.0.2.bb          | 51 ----------------------
 4 files changed, 87 insertions(+), 87 deletions(-)
 create mode 100644 meta-networking/recipes-extended/dlm/dlm/respect-ldflags-also-from-bin_ldflags.patch
 create mode 100644 meta-networking/recipes-extended/dlm/dlm_4.0.2.bb
 delete mode 100644 meta-oe/recipes-extended/dlm/dlm/respect-ldflags-also-from-bin_ldflags.patch
 delete mode 100644 meta-oe/recipes-extended/dlm/dlm_4.0.2.bb

diff --git a/meta-networking/recipes-extended/dlm/dlm/respect-ldflags-also-from-bin_ldflags.patch b/meta-networking/recipes-extended/dlm/dlm/respect-ldflags-also-from-bin_ldflags.patch
new file mode 100644
index 0000000..69b2f90
--- /dev/null
+++ b/meta-networking/recipes-extended/dlm/dlm/respect-ldflags-also-from-bin_ldflags.patch
@@ -0,0 +1,36 @@
+diff -uNr dlm-4.0.2.orig/dlm_controld/Makefile dlm-4.0.2/dlm_controld/Makefile
+--- dlm-4.0.2.orig/dlm_controld/Makefile	2017-04-04 10:49:23.661320260 +0200
++++ dlm-4.0.2/dlm_controld/Makefile	2017-04-04 10:50:36.121326429 +0200
+@@ -55,7 +55,7 @@
+ BIN_CFLAGS += -fPIE -DPIE
+ BIN_CFLAGS += -I../include -I../libdlm
+ 
+-BIN_LDFLAGS += -Wl,-z,now -Wl,-z,relro -pie
++BIN_LDFLAGS += $(LDFLAGS) -Wl,-z,now -Wl,-z,relro -pie
+ BIN_LDFLAGS += -lpthread -lrt -lcpg -lcmap -lcfg -lquorum
+ 
+ LIB_CFLAGS += $(BIN_CFLAGS)
+diff -uNr dlm-4.0.2.orig/dlm_tool/Makefile dlm-4.0.2/dlm_tool/Makefile
+--- dlm-4.0.2.orig/dlm_tool/Makefile	2013-07-31 17:50:26.000000000 +0200
++++ dlm-4.0.2/dlm_tool/Makefile	2017-04-04 10:50:44.617327153 +0200
+@@ -32,7 +32,7 @@
+ BIN_CFLAGS += -fPIE -DPIE
+ BIN_CFLAGS += -I../include -I../libdlm -I../dlm_controld
+ 
+-BIN_LDFLAGS += -Wl,-z,now -Wl,-z,relro -pie
++BIN_LDFLAGS += $(LDFLAGS) -Wl,-z,now -Wl,-z,relro -pie
+ BIN_LDFLAGS += -L../libdlm -L../dlm_controld
+ BIN_LDFLAGS += -lpthread -ldlm -ldlmcontrol
+ 
+diff -uNr dlm-4.0.2.orig/dlm_controld/Makefile dlm-4.0.2/dlm_controld/Makefile
+--- dlm-4.0.2.orig/dlm_controld/Makefile	2017-04-04 11:02:58.578389641 +0200
++++ dlm-4.0.2/dlm_controld/Makefile	2017-04-04 11:07:55.672414935 +0200
+@@ -59,7 +59,7 @@
+ BIN_LDFLAGS += -lpthread -lrt -lcpg -lcmap -lcfg -lquorum
+ 
+ LIB_CFLAGS += $(BIN_CFLAGS)
+-LIB_LDFLAGS += -Wl,-z,relro -pie
++LIB_LDFLAGS += $(LDFLAGS) -Wl,-z,relro -pie
+ 
+ ifeq ($(USE_SD_NOTIFY),yes)
+ 	BIN_CFLAGS += $(shell pkg-config --cflags libsystemd-daemon) \
diff --git a/meta-networking/recipes-extended/dlm/dlm_4.0.2.bb b/meta-networking/recipes-extended/dlm/dlm_4.0.2.bb
new file mode 100644
index 0000000..31e411e
--- /dev/null
+++ b/meta-networking/recipes-extended/dlm/dlm_4.0.2.bb
@@ -0,0 +1,51 @@
+DESCRIPTION = "dlm control daemon and tool"
+
+SECTION = "utils"
+HOMEPAGE = "https://fedorahosted.org/cluster/wiki/HomePage"
+
+REQUIRED_DISTRO_FEATURES = "systemd"
+
+SRC_URI = "https://git.fedorahosted.org/cgit/dlm.git/snapshot/${BP}.tar.xz \
+    file://respect-ldflags-also-from-bin_ldflags.patch \
+"
+
+SRC_URI[md5sum] = "efc2ee6093aa6aa0a88aaad83e998a3f"
+SRC_URI[sha256sum] = "b89bc557aaffbab0ac005398025f247718a5589cff6574d902eaffe2b20e683e"
+
+LICENSE = "LGPLv2+ & GPLv2 & GPLv2+"
+LIC_FILES_CHKSUM = "file://README.license;md5=8f0bbcdd678df1bce9863492b6c8832d"
+
+DEPENDS = "corosync systemd"
+
+inherit pkgconfig systemd distro_features_check
+
+SYSTEMD_SERVICE_${PN} = "dlm.service"
+SYSTEMD_AUTO_ENABLE = "enable"
+
+export EXTRA_OEMAKE = ""
+
+do_compile_prepend() {
+    sed -i "s/libsystemd-daemon/libsystemd/g" ${S}/dlm_controld/Makefile
+}
+
+do_compile () {
+    oe_runmake 'CC=${CC}'
+}
+
+do_install_append (){
+    install -d ${D}${sysconfdir}/sysconfig/
+    install -d ${D}${sysconfdir}/init.d/
+    install -m 0644 ${S}/init/dlm.sysconfig ${D}${sysconfdir}/sysconfig/dlm
+    install -m 0644 ${S}/init/dlm.init ${D}${sysconfdir}/init.d/dlm
+
+    # install systemd unit files
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${S}/init/dlm.service ${D}${systemd_unitdir}/system
+    fi
+}
+
+do_install() {
+    oe_runmake install DESTDIR=${D} LIBDIR=${libdir}
+}
+
diff --git a/meta-oe/recipes-extended/dlm/dlm/respect-ldflags-also-from-bin_ldflags.patch b/meta-oe/recipes-extended/dlm/dlm/respect-ldflags-also-from-bin_ldflags.patch
deleted file mode 100644
index 69b2f90..0000000
--- a/meta-oe/recipes-extended/dlm/dlm/respect-ldflags-also-from-bin_ldflags.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-diff -uNr dlm-4.0.2.orig/dlm_controld/Makefile dlm-4.0.2/dlm_controld/Makefile
---- dlm-4.0.2.orig/dlm_controld/Makefile	2017-04-04 10:49:23.661320260 +0200
-+++ dlm-4.0.2/dlm_controld/Makefile	2017-04-04 10:50:36.121326429 +0200
-@@ -55,7 +55,7 @@
- BIN_CFLAGS += -fPIE -DPIE
- BIN_CFLAGS += -I../include -I../libdlm
- 
--BIN_LDFLAGS += -Wl,-z,now -Wl,-z,relro -pie
-+BIN_LDFLAGS += $(LDFLAGS) -Wl,-z,now -Wl,-z,relro -pie
- BIN_LDFLAGS += -lpthread -lrt -lcpg -lcmap -lcfg -lquorum
- 
- LIB_CFLAGS += $(BIN_CFLAGS)
-diff -uNr dlm-4.0.2.orig/dlm_tool/Makefile dlm-4.0.2/dlm_tool/Makefile
---- dlm-4.0.2.orig/dlm_tool/Makefile	2013-07-31 17:50:26.000000000 +0200
-+++ dlm-4.0.2/dlm_tool/Makefile	2017-04-04 10:50:44.617327153 +0200
-@@ -32,7 +32,7 @@
- BIN_CFLAGS += -fPIE -DPIE
- BIN_CFLAGS += -I../include -I../libdlm -I../dlm_controld
- 
--BIN_LDFLAGS += -Wl,-z,now -Wl,-z,relro -pie
-+BIN_LDFLAGS += $(LDFLAGS) -Wl,-z,now -Wl,-z,relro -pie
- BIN_LDFLAGS += -L../libdlm -L../dlm_controld
- BIN_LDFLAGS += -lpthread -ldlm -ldlmcontrol
- 
-diff -uNr dlm-4.0.2.orig/dlm_controld/Makefile dlm-4.0.2/dlm_controld/Makefile
---- dlm-4.0.2.orig/dlm_controld/Makefile	2017-04-04 11:02:58.578389641 +0200
-+++ dlm-4.0.2/dlm_controld/Makefile	2017-04-04 11:07:55.672414935 +0200
-@@ -59,7 +59,7 @@
- BIN_LDFLAGS += -lpthread -lrt -lcpg -lcmap -lcfg -lquorum
- 
- LIB_CFLAGS += $(BIN_CFLAGS)
--LIB_LDFLAGS += -Wl,-z,relro -pie
-+LIB_LDFLAGS += $(LDFLAGS) -Wl,-z,relro -pie
- 
- ifeq ($(USE_SD_NOTIFY),yes)
- 	BIN_CFLAGS += $(shell pkg-config --cflags libsystemd-daemon) \
diff --git a/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb b/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
deleted file mode 100644
index 31e411e..0000000
--- a/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-DESCRIPTION = "dlm control daemon and tool"
-
-SECTION = "utils"
-HOMEPAGE = "https://fedorahosted.org/cluster/wiki/HomePage"
-
-REQUIRED_DISTRO_FEATURES = "systemd"
-
-SRC_URI = "https://git.fedorahosted.org/cgit/dlm.git/snapshot/${BP}.tar.xz \
-    file://respect-ldflags-also-from-bin_ldflags.patch \
-"
-
-SRC_URI[md5sum] = "efc2ee6093aa6aa0a88aaad83e998a3f"
-SRC_URI[sha256sum] = "b89bc557aaffbab0ac005398025f247718a5589cff6574d902eaffe2b20e683e"
-
-LICENSE = "LGPLv2+ & GPLv2 & GPLv2+"
-LIC_FILES_CHKSUM = "file://README.license;md5=8f0bbcdd678df1bce9863492b6c8832d"
-
-DEPENDS = "corosync systemd"
-
-inherit pkgconfig systemd distro_features_check
-
-SYSTEMD_SERVICE_${PN} = "dlm.service"
-SYSTEMD_AUTO_ENABLE = "enable"
-
-export EXTRA_OEMAKE = ""
-
-do_compile_prepend() {
-    sed -i "s/libsystemd-daemon/libsystemd/g" ${S}/dlm_controld/Makefile
-}
-
-do_compile () {
-    oe_runmake 'CC=${CC}'
-}
-
-do_install_append (){
-    install -d ${D}${sysconfdir}/sysconfig/
-    install -d ${D}${sysconfdir}/init.d/
-    install -m 0644 ${S}/init/dlm.sysconfig ${D}${sysconfdir}/sysconfig/dlm
-    install -m 0644 ${S}/init/dlm.init ${D}${sysconfdir}/init.d/dlm
-
-    # install systemd unit files
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${S}/init/dlm.service ${D}${systemd_unitdir}/system
-    fi
-}
-
-do_install() {
-    oe_runmake install DESTDIR=${D} LIBDIR=${libdir}
-}
-
-- 
1.8.3.1


