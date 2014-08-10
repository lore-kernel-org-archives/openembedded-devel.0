Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8011C70AA9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 16:14:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Aug 2014 09:09:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,837,1400050800"; d="scan'208";a="586134160"
Received: from mrdissan-mobl.gar.corp.intel.com (HELO peggleto-mobl5.lan)
	([10.252.122.124])
	by orsmga002.jf.intel.com with ESMTP; 10 Aug 2014 09:14:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Aug 2014 17:14:42 +0100
Message-Id: <d863c47f2ae05e03df91aaab124ea602e208fcfe.1407687153.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1407687153.git.paul.eggleton@linux.intel.com>
References: <cover.1407687153.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1407687153.git.paul.eggleton@linux.intel.com>
References: <cover.1407687153.git.paul.eggleton@linux.intel.com>
Subject: [meta-systemd][PATCH 2/5] busybox: systemd support now in OE-Core
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
X-List-Received-Date: Sun, 10 Aug 2014 16:14:58 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../busybox/busybox/busybox-klogd.service.in       |  8 --------
 .../busybox/busybox/busybox-syslog.service.in      | 13 -------------
 .../recipes-core/busybox/busybox_%.bbappend        | 22 ----------------------
 3 files changed, 43 deletions(-)
 delete mode 100644 meta-systemd/oe-core/recipes-core/busybox/busybox/busybox-klogd.service.in
 delete mode 100644 meta-systemd/oe-core/recipes-core/busybox/busybox/busybox-syslog.service.in

diff --git a/meta-systemd/oe-core/recipes-core/busybox/busybox/busybox-klogd.service.in b/meta-systemd/oe-core/recipes-core/busybox/busybox/busybox-klogd.service.in
deleted file mode 100644
index d7c7755..0000000
--- a/meta-systemd/oe-core/recipes-core/busybox/busybox/busybox-klogd.service.in
+++ /dev/null
@@ -1,8 +0,0 @@
-[Unit]
-Description=Kernel Logging Service
-
-[Service]
-ExecStart=@base_sbindir@/klogd -n
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-systemd/oe-core/recipes-core/busybox/busybox/busybox-syslog.service.in b/meta-systemd/oe-core/recipes-core/busybox/busybox/busybox-syslog.service.in
deleted file mode 100644
index 2e04321..0000000
--- a/meta-systemd/oe-core/recipes-core/busybox/busybox/busybox-syslog.service.in
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=System Logging Service
-Wants=busybox-klogd.service
-
-[Service]
-EnvironmentFile=-/etc/default/busybox-syslog
-ExecStart=@base_sbindir@/syslogd -n $OPTIONS
-Sockets=syslog.socket
-
-[Install]
-WantedBy=multi-user.target
-Also=busybox-klogd.service
-Alias=syslog.service
diff --git a/meta-systemd/oe-core/recipes-core/busybox/busybox_%.bbappend b/meta-systemd/oe-core/recipes-core/busybox/busybox_%.bbappend
index 6362bdb..642d450 100644
--- a/meta-systemd/oe-core/recipes-core/busybox/busybox_%.bbappend
+++ b/meta-systemd/oe-core/recipes-core/busybox/busybox_%.bbappend
@@ -1,25 +1,3 @@
-inherit systemd
-
-# look for files in the layer first
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://busybox-syslog.service.in \
-            file://busybox-klogd.service.in"
-
-SYSTEMD_PACKAGES = "${PN}-syslog"
-SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
-
-do_install_append() {
-    install -d ${D}${systemd_unitdir}/system
-    sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-syslog.service.in \
-         > ${D}${systemd_unitdir}/system/busybox-syslog.service
-    sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-klogd.service.in \
-         > ${D}${systemd_unitdir}/system/busybox-klogd.service
-
-    ln -sf /dev/null ${D}${systemd_unitdir}/system/syslog.service
-}
-FILES_${PN}-syslog += "${systemd_unitdir}/system/syslog.service"
-
 RPROVIDES_${PN}-syslog += "${PN}-syslog-systemd"
 RREPLACES_${PN}-syslog += "${PN}-syslog-systemd"
 RCONFLICTS_${PN}-syslog += "${PN}-syslog-systemd"
-- 
1.9.3


