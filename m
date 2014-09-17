Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8BFEF714A6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Sep 2014 14:41:55 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 17 Sep 2014 07:32:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="387425244"
Received: from cfitzsim-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.123])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Sep 2014 07:36:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Sep 2014 15:41:24 +0100
Message-Id: <b670f5b2000ab1a7b31f124deff0cdf31be0572d.1410964797.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1410964797.git.paul.eggleton@linux.intel.com>
References: <cover.1410964797.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1410964797.git.paul.eggleton@linux.intel.com>
References: <cover.1410964797.git.paul.eggleton@linux.intel.com>
Subject: [meta-systemd][PATCH 2/4] dhcp: remove parts now merged into OE-Core recipe
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
X-List-Received-Date: Wed, 17 Sep 2014 14:41:55 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-connectivity/dhcp/dhcp/dhcpd.service   | 12 -----------
 .../dhcp/dhcp/dhcrelay.service                     | 10 ----------
 .../recipes-connectivity/dhcp/dhcp_%.bbappend      | 23 +++-------------------
 3 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhcpd.service
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhcrelay.service

diff --git a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhcpd.service b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhcpd.service
deleted file mode 100644
index 70beee9..0000000
--- a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhcpd.service
+++ /dev/null
@@ -1,12 +0,0 @@
-[Unit]
-Description=Dynamic Host Configuration Protocol (DHCP)
-After=syslog.target network.target
-
-[Service]
-Type=forking
-PIDFile=/var/run/dhcpd.pid
-EnvironmentFile=-/etc/default/dhcp-server
-ExecStart=/usr/sbin/dhcpd -cf /etc/dhcp/dhcpd.conf -q $INTERFACES
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhcrelay.service b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhcrelay.service
deleted file mode 100644
index f68f468..0000000
--- a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhcrelay.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=DHCP Relay Agent Daemon
-After=syslog.target network.target
-
-[Service]
-EnvironmentFile=/etc/default/dhcp-relay
-ExecStart=/usr/sbin/dhcrelay -d $DHCRELAYARGS
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
index 1dd6d58..d2a577e 100644
--- a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
@@ -1,35 +1,18 @@
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-inherit systemd
-
-SYSTEMD_PACKAGES = "dhcp-server dhcp-relay dhcp-client"
-SYSTEMD_SERVICE_dhcp-server = "dhcpd.service"
-SYSTEMD_SERVICE_dhcp-relay = "dhcrelay.service"
+SYSTEMD_PACKAGES += "dhcp-client"
 SYSTEMD_SERVICE_dhcp-client = "dhclient.service"
 SYSTEMD_AUTO_ENABLE_dhcp-client = "disable"
 
-FILES_dhcp-server += "${systemd_unitdir}/system/dhcpd.service"
-FILES_dhcp-relay += "${systemd_unitdir}/system/dhrelay.service"
 FILES_dhcp-client += "${systemd_unitdir}/system/dhclient.service"
-RPROVIDES_dhcp-server += "dhcp-server-systemd"
-RREPLACES_dhcp-server += "dhcp-server-systemd"
-RCONFLICTS_dhcp-server += "dhcp-server-systemd"
-RPROVIDES_dhcp-relay += "dhcp-relay-systemd"
-RREPLACES_dhcp-relay += "dhcp-relay-systemd"
-RCONFLICTS_dhcp-relay += "dhcp-relay-systemd"
 RPROVIDES_dhcp-client += "dhcp-client-systemd"
 RREPLACES_dhcp-client += "dhcp-client-systemd"
 RCONFLICTS_dhcp-client += "dhcp-client-systemd"
 
-SRC_URI += "file://dhcpd.service \
-            file://dhclient.service \
-            file://dhcrelay.service \
-"
+SRC_URI += "file://dhclient.service"
+
 do_install_append() {
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/dhcpd.service ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/dhclient.service ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/dhcrelay.service ${D}${systemd_unitdir}/system
 }
 
-- 
1.9.3


