Return-Path: <stanley.cheong.kwan.phoong@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 507C277DB6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 02:48:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jul 2017 19:48:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,372,1496127600"; d="scan'208";a="879545995"
Received: from phoongst-mobl2.png.intel.com ([10.221.22.197])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Jul 2017 19:48:28 -0700
From: Stanley Phoong <stanley.cheong.kwan.phoong@intel.com>
To: OpenEmbedded Devel Mailing List <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Jul 2017 10:48:10 +0800
Message-Id: <1500259691-9782-9-git-send-email-stanley.cheong.kwan.phoong@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500259691-9782-1-git-send-email-stanley.cheong.kwan.phoong@intel.com>
References: <1500259691-9782-1-git-send-email-stanley.cheong.kwan.phoong@intel.com>
MIME-Version: 1.0
Subject: [meta-openwrt][PATCH 8/9] Juci: update Juci git to latest
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
X-List-Received-Date: Mon, 17 Jul 2017 02:48:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: "Stanley Cheong Kwan, Phoong" <stanley.cheong.kwan.phoong@intel.com>

Updated the Juci to the latest SRCREV, and updated the Makefile
configuration.

Signed-off-by: Stanley Cheong Kwan, Phoong <stanley.cheong.kwan.phoong@intel.com>
---
 recipes-core/juci/juci/0005-makefile-local.patch | 47 ++++++++++++++++++++++++
 recipes-core/juci/juci_git.bb                    |  5 +--
 2 files changed, 49 insertions(+), 3 deletions(-)
 create mode 100644 recipes-core/juci/juci/0005-makefile-local.patch

diff --git a/recipes-core/juci/juci/0005-makefile-local.patch b/recipes-core/juci/juci/0005-makefile-local.patch
new file mode 100644
index 0000000..a99eeb2
--- /dev/null
+++ b/recipes-core/juci/juci/0005-makefile-local.patch
@@ -0,0 +1,47 @@
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile
++++ git/Makefile
+@@ -2,6 +2,42 @@
+ # Main Makefile
+ # Copyright (c) 2015-2016 Martin K. Schröder <mkschreder.uk@gmail.com>
+ 
++## This is a file for building local copy for use with the juci-local-server
++
++CONFIG_PACKAGE_juci=y
++CONFIG_PACKAGE_juci-ddns=y
++CONFIG_PACKAGE_juci-diagnostics=y
++CONFIG_PACKAGE_juci-dnsmasq-dhcp=y
++CONFIG_PACKAGE_juci-dropbear=y
++CONFIG_PACKAGE_juci-dynamic-translator=y
++CONFIG_PACKAGE_juci-ethernet=y
++CONFIG_PACKAGE_juci-event=y
++CONFIG_PACKAGE_juci-firewall-fw3=y
++CONFIG_PACKAGE_juci-freecwmp=y
++CONFIG_PACKAGE_juci-iconnect=y
++CONFIG_PACKAGE_juci-icwmp=y
++CONFIG_PACKAGE_juci-igmpinfo=y
++CONFIG_PACKAGE_juci-macdb=y
++CONFIG_PACKAGE_juci-minidlna=y
++CONFIG_PACKAGE_juci-minisnmpd=y
++CONFIG_PACKAGE_juci-mod-status=y
++CONFIG_PACKAGE_juci-mod-system=y
++CONFIG_PACKAGE_juci-netmode=y
++CONFIG_PACKAGE_juci-network-netifd=y
++CONFIG_PACKAGE_juci-openwrt-wireless=y
++CONFIG_PACKAGE_juci-samba=y
++CONFIG_PACKAGE_juci-simple-gui=y
++CONFIG_PACKAGE_juci-snmpd=y
++CONFIG_PACKAGE_juci-sysupgrade=y
++CONFIG_PACKAGE_juci-uhttpd=y
++CONFIG_PACKAGE_juci-upnp=y
++CONFIG_PACKAGE_juci-usb=y
++CONFIG_PACKAGE_juci-utils=y
++
++####THEMES####
++CONFIG_PACKAGE_juci-theme-openwrt=y
++
++
+ DIRS-y:=juci 
+ PLUGINS-y:=
+ 
diff --git a/recipes-core/juci/juci_git.bb b/recipes-core/juci/juci_git.bb
index cd71a72..c79c064 100644
--- a/recipes-core/juci/juci_git.bb
+++ b/recipes-core/juci/juci_git.bb
@@ -7,12 +7,11 @@ LICENSE = "GPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87212b5f1ae096371049a12f80034f32"
 SECTION = "apps"
 
-SRCREV = "b173dba22fbd9891bc5e3a55f8b40ba562f38e31"
+SRCREV = "${AUTOREV}"
 SRC_URI = "git://github.com/mkschreder/juci"
-SRC_URI += "file://0001-juci-pin-grunt-to-0.4.1-for-grunt-angular-gettext.patch"
 SRC_URI += "file://0002-fix-bootstrap.patch"
 SRC_URI += "file://0003-fix-juci-compile.patch"
-SRC_URI += "file://0004-makefile-local.patch"
+SRC_URI += "file://0005-makefile-local.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


