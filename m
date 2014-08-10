Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2BF767025E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 16:14:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Aug 2014 09:09:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,837,1400050800"; d="scan'208";a="586134157"
Received: from mrdissan-mobl.gar.corp.intel.com (HELO peggleto-mobl5.lan)
	([10.252.122.124])
	by orsmga002.jf.intel.com with ESMTP; 10 Aug 2014 09:14:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Aug 2014 17:14:41 +0100
Message-Id: <bb067bfaf2abe9c57680ad7dbbe3ca173285012f.1407687153.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1407687153.git.paul.eggleton@linux.intel.com>
References: <cover.1407687153.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1407687153.git.paul.eggleton@linux.intel.com>
References: <cover.1407687153.git.paul.eggleton@linux.intel.com>
Subject: [meta-systemd][PATCH 1/5] dropbear: systemd support now in OE-Core
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
 .../recipes-core/dropbear/dropbear/dropbear.socket      | 10 ----------
 .../recipes-core/dropbear/dropbear/dropbear@.service    | 11 -----------
 .../recipes-core/dropbear/dropbear/dropbearkey.service  | 10 ----------
 .../oe-core/recipes-core/dropbear/dropbear_%.bbappend   | 17 -----------------
 4 files changed, 48 deletions(-)
 delete mode 100644 meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbear.socket
 delete mode 100644 meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbear@.service
 delete mode 100644 meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbearkey.service

diff --git a/meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbear.socket b/meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbear.socket
deleted file mode 100644
index e5c61b7..0000000
--- a/meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbear.socket
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Conflicts=dropbear.service
-
-[Socket]
-ListenStream=22
-Accept=yes
-
-[Install]
-WantedBy=sockets.target
-Also=dropbearkey.service
diff --git a/meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbear@.service b/meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbear@.service
deleted file mode 100644
index 59ed07b..0000000
--- a/meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbear@.service
+++ /dev/null
@@ -1,11 +0,0 @@
-[Unit]
-Description=SSH Per-Connection Server
-Requires=dropbearkey.service
-After=syslog.target dropbearkey.service
-
-[Service]
-EnvironmentFile=-/etc/default/dropbear
-ExecStart=-/usr/sbin/dropbear -i -r /etc/dropbear/dropbear_rsa_host_key -p 22 $DROPBEAR_EXTRA_ARGS
-ExecReload=/bin/kill -HUP $MAINPID
-StandardInput=socket
-KillMode=process
diff --git a/meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbearkey.service b/meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbearkey.service
deleted file mode 100644
index 7f03000..0000000
--- a/meta-systemd/oe-core/recipes-core/dropbear/dropbear/dropbearkey.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=SSH Key Generation
-ConditionPathExists=|!/etc/dropbear/dropbear_rsa_host_key
-
-[Service]
-ExecStart=/usr/sbin/dropbearkey -t rsa -f /etc/dropbear/dropbear_rsa_host_key
-RemainAfterExit=yes
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-systemd/oe-core/recipes-core/dropbear/dropbear_%.bbappend b/meta-systemd/oe-core/recipes-core/dropbear/dropbear_%.bbappend
index fc18ea8..181b878 100644
--- a/meta-systemd/oe-core/recipes-core/dropbear/dropbear_%.bbappend
+++ b/meta-systemd/oe-core/recipes-core/dropbear/dropbear_%.bbappend
@@ -1,21 +1,4 @@
-inherit systemd
-
-# look for files in the layer first
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://dropbearkey.service \
-            file://dropbear@.service \
-            file://dropbear.socket"
-
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "dropbear.socket"
 
-do_install_append() {
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/dropbearkey.service ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/dropbear@.service ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/dropbear.socket ${D}${systemd_unitdir}/system
-    ln -sf /dev/null ${D}${systemd_unitdir}/system/dropbear.service
-}
-- 
1.9.3


