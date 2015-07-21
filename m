Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 87CA375669
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 03:13:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6L3Dnb4012366
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jul 2015 20:13:49 -0700 (PDT)
Received: from pek-zchi-d1.corp.ad.wrs.com (128.224.162.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Mon, 20 Jul 2015 20:13:49 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Jul 2015 11:13:55 +0800
Message-ID: <1437448435-6618-1-git-send-email-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] lvm2: fix shared object file dlopen failed
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
X-List-Received-Date: Tue, 21 Jul 2015 03:13:50 -0000
Content-Type: text/plain

Add the variable snapshot_library into config file(lvm.conf), so it
can link the correct shared object files with correct path.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc      |  1 +
 meta-oe/recipes-support/lvm2/lvm2/lvm.conf | 34 ++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 34fec99..7b21a35 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -41,6 +41,7 @@ inherit autotools pkgconfig systemd
 do_install_append() {
     # Install machine specific configuration file
     install -m 0644 ${WORKDIR}/lvm.conf ${D}${sysconfdir}/lvm/lvm.conf
+    sed -i -e 's:@libdir@:${libdir}:g' ${D}${sysconfdir}/lvm/lvm.conf
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${B}/scripts/lvm2_monitoring_systemd_red_hat.service ${D}${systemd_unitdir}/system/lvm2-monitor.service
     install -m 0644 ${B}/scripts/dm_event_systemd_red_hat.socket ${D}${systemd_unitdir}/system/dm-event.socket
diff --git a/meta-oe/recipes-support/lvm2/lvm2/lvm.conf b/meta-oe/recipes-support/lvm2/lvm2/lvm.conf
index c44c6a7..9e3b5fe 100644
--- a/meta-oe/recipes-support/lvm2/lvm2/lvm.conf
+++ b/meta-oe/recipes-support/lvm2/lvm2/lvm.conf
@@ -289,4 +289,38 @@ activation {
     # dirs = [ "/etc/lvm/metadata", "/mnt/disk2/lvm/metadata2" ]
 #}
 
+# Event daemon
+#
+dmeventd {
+    # mirror_library is the library used when monitoring a mirror device.
+    #
+    # "libdevmapper-event-lvm2mirror.so" attempts to recover from
+    # failures.  It removes failed devices from a volume group and
+    # reconfigures a mirror as necessary. If no mirror library is
+    # provided, mirrors are not monitored through dmeventd.
+
+    mirror_library = "@libdir@/device-mapper/libdevmapper-event-lvm2mirror.so"
+
+    # snapshot_library is the library used when monitoring a snapshot device.
+    #
+    # "libdevmapper-event-lvm2snapshot.so" monitors the filling of
+    # snapshots and emits a warning through syslog when the use of
+    # the snapshot exceeds 80%. The warning is repeated when 85%, 90% and
+    # 95% of the snapshot is filled.
+
+    snapshot_library = "@libdir@/device-mapper/libdevmapper-event-lvm2snapshot.so"
+
+    # thin_library is the library used when monitoring a thin device.
+    #
+    # "libdevmapper-event-lvm2thin.so" monitors the filling of
+    # pool and emits a warning through syslog when the use of
+    # the pool exceeds 80%. The warning is repeated when 85%, 90% and
+    # 95% of the pool is filled.
+
+    thin_library = "@libdir@/device-mapper/libdevmapper-event-lvm2thin.so"
+
+    # Full path of the dmeventd binary.
+    #
+    # executable = "@DMEVENTD_PATH@"
+}
 
-- 
1.9.1


