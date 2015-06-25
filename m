Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id BDABB6AC15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 03:23:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="97727962"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Jun 2015 11:27:48 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5P3M7MR031106
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 11:22:07 +0800
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 25 Jun 2015 11:23:44 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 25 Jun 2015 11:23:38 +0800
Message-ID: <1435202618-1610-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
Subject: [meta-networking][PATCH] opensaf: Fix warning and add systemd service files.
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
X-List-Received-Date: Thu, 25 Jun 2015 03:23:47 -0000
Content-Type: text/plain

1) WARNING: The recipe opensaf is trying to install files into a
shared area when those files already exist,so set
--libdir=${libdir}/opensaf

2) Add systemd service file plmcboot.service and plmcd.service.

3) opensaf depends on openhpi,so add it.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../opensaf/opensaf/0001-plmcd-error-fix.patch     | 43 ++++++++++++++++++++++
 .../opensaf/opensaf/plmcboot.service               | 13 +++++++
 .../recipes-daemons/opensaf/opensaf/plmcd.service  | 15 ++++++++
 .../recipes-daemons/opensaf/opensaf_4.5.0.bb       | 29 +++++++++++++--
 4 files changed, 97 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-plmcd-error-fix.patch
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/plmcboot.service
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/plmcd.service

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-plmcd-error-fix.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-plmcd-error-fix.patch
new file mode 100644
index 0000000..624cd2d
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-plmcd-error-fix.patch
@@ -0,0 +1,43 @@
+From f1813af4c154fb1d3950abbdf678c3a5a67222fc Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Thu, 25 Jun 2015 11:44:27 +0900
+Subject: [PATCH] plmcd: error fix
+
+ld: cannot find -lsystemd-daemon
+collect2: error: ld returned 1 exit status
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ contrib/plmc/plmcd/Makefile.am | 2 +-
+ contrib/plmc/plmcd/Makefile.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/contrib/plmc/plmcd/Makefile.am b/contrib/plmc/plmcd/Makefile.am
+index 8d847f2..dd7913a 100644
+--- a/contrib/plmc/plmcd/Makefile.am
++++ b/contrib/plmc/plmcd/Makefile.am
+@@ -32,7 +32,7 @@ plmcd_SOURCES = \
+ plmcd_LDFLAGS = -lpthread
+ 
+ if ENABLE_SYSTEMD
+-plmcd_LDFLAGS += -lsystemd-daemon
++plmcd_LDFLAGS += -lsystemd
+ endif
+ 
+ plmcd_LDADD = \
+diff --git a/contrib/plmc/plmcd/Makefile.in b/contrib/plmc/plmcd/Makefile.in
+index 0185dc4..e40513a 100644
+--- a/contrib/plmc/plmcd/Makefile.in
++++ b/contrib/plmc/plmcd/Makefile.in
+@@ -106,7 +106,7 @@ build_triplet = @build@
+ host_triplet = @host@
+ target_triplet = @target@
+ sbin_PROGRAMS = plmcd$(EXEEXT)
+-@ENABLE_SYSTEMD_TRUE@am__append_1 = -lsystemd-daemon
++@ENABLE_SYSTEMD_TRUE@am__append_1 = -lsystemd
+ subdir = plmcd
+ ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
+ am__aclocal_m4_deps = $(top_srcdir)/configure.ac
+-- 
+1.8.4.2
+
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/plmcboot.service b/meta-networking/recipes-daemons/opensaf/opensaf/plmcboot.service
new file mode 100644
index 0000000..76ec73a
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/plmcboot.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=PLMCBOOT Program
+After=network.target
+ConditionPathExists=@SYSCONFDIR@/plmcd.conf
+
+[Service]
+Type=oneshot
+ExecStart=@SBINDIR@/plmcd -c @SYSCONFDIR@/plmcd.conf -s
+ExecStop=@SBINDIR@/plmcd -c @SYSCONFDIR@/plmcd.conf -x
+RemainAfterExit=yes
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/plmcd.service b/meta-networking/recipes-daemons/opensaf/opensaf/plmcd.service
new file mode 100644
index 0000000..1d48e77
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/plmcd.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=Plmcd Daemon
+Requires=plmcboot.service
+After=network.target plmcboot.service
+ConditionPathExists=@SYSCONFDIR@/plmcd.conf
+
+[Service]
+Type=forking
+ExecStart=@SBINDIR@/plmcd -c @SYSCONFDIR@/plmcd.conf
+ExecStartPost=/bin/touch /var/lock/subsys/plmcd
+ExecStopPost=/bin/rm -rf /var/lock/subsys/plmcd
+PIDFile=/var/run/plmcd.pid
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
index 5895b46..0c236f0 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
@@ -14,7 +14,11 @@ HOMEPAGE = "http://www.opensaf.org"
 inherit autotools useradd systemd pkgconfig
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
-           file://install-samples-from-srcdir.patch"
+           file://install-samples-from-srcdir.patch \
+           file://plmcd.service \
+           file://plmcboot.service \
+           file://0001-plmcd-error-fix.patch \
+           "
 
 SRC_URI[md5sum] = "534c0a99438a62c4c8dda56cfa67300c"
 SRC_URI[sha256sum] = "2f5ba57fe67e94099c0df82d0a0dd207b5c583c93030035ba354c97b5471b590"
@@ -23,17 +27,32 @@ SECTION = "admin"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a916467b91076e631dd8edb7424769c7"
 
-DEPENDS = "libxml2 python"
+DEPENDS = "libxml2 python openhpi"
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-f -r opensaf"
 USERADD_PARAM_${PN} =  "-r -g opensaf -d ${datadir}/opensaf/ -s ${sbindir}/nologin -c \"OpenSAF\" opensaf"
 
-SYSTEMD_SERVICE_${PN} += "opensafd.service"
+SYSTEMD_SERVICE_${PN} += "opensafd.service plmcboot.service plmcd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
+PACKAGECONFIG[systemd] = "--enable-systemd-daemon"
+
+do_configure_prepend () {
+        ( cd ${S}; autoreconf -f -i -s )
+}
+
+EXTRA_OECONF += ' --with-hpi-interface=B03 \
+                  --libdir=${libdir}/opensaf \
+                  --enable-ais-plm '
+EXTRA_OEMAKE += " -Wl,-rpath,${libdir}/opensaf "
+
+PKGLIBDIR="${libdir}/opensaf/opensaf"
+
 FILES_${PN} += "${localstatedir}/run"
 
+FILES_${PN}-staticdev += "${PKGLIBDIR}/*.a"
+
 RDEPENDS_${PN} += "bash python"
 
 INSANE_SKIP_${PN} = "dev-so"
@@ -45,4 +64,8 @@ do_install_append() {
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${B}/osaf/services/infrastructure/nid/config/opensafd.service \
         ${D}${systemd_unitdir}/system
+    install -m 644 ${WORKDIR}/plmc*.service ${D}/${systemd_unitdir}/system
+    sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir}/system/plmc*.service
+    sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/plmc*.service
+
 }
-- 
1.8.4.2


