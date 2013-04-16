Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1US3oX-0006d2-0v
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 13:12:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Apr 2013 03:54:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,485,1363158000"; d="scan'208";a="319811887"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.4])
	by fmsmga001.fm.intel.com with ESMTP; 16 Apr 2013 03:54:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Apr 2013 11:53:57 +0100
Message-Id: <f2ef961d7b4e3bf58116e1599a8902d2d6528123.1366109533.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366109533.git.paul.eggleton@linux.intel.com>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1366109533.git.paul.eggleton@linux.intel.com>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking, meta-oe][PATCH 3/9] openvpn: move to meta-networking and tweak
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Apr 2013 11:12:51 -0000

* Move SRC_URI checksums next to SRC_URI
* Move packaging definitions to the end
* Set SUMMARY instead of DESCRIPTION
* Drop unused inc file

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-support}/openvpn/openvpn/openvpn       |    0
 .../recipes-support}/openvpn/openvpn_2.1.3.bb      |    9 ++++----
 meta-oe/recipes-connectivity/openvpn/openvpn.inc   |   22 --------------------
 3 files changed, 5 insertions(+), 26 deletions(-)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-support}/openvpn/openvpn/openvpn (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-support}/openvpn/openvpn_2.1.3.bb (92%)
 delete mode 100644 meta-oe/recipes-connectivity/openvpn/openvpn.inc

diff --git a/meta-oe/recipes-connectivity/openvpn/openvpn/openvpn b/meta-networking/recipes-support/openvpn/openvpn/openvpn
similarity index 100%
rename from meta-oe/recipes-connectivity/openvpn/openvpn/openvpn
rename to meta-networking/recipes-support/openvpn/openvpn/openvpn
diff --git a/meta-oe/recipes-connectivity/openvpn/openvpn_2.1.3.bb b/meta-networking/recipes-support/openvpn/openvpn_2.1.3.bb
similarity index 92%
rename from meta-oe/recipes-connectivity/openvpn/openvpn_2.1.3.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.1.3.bb
index 594b266..f58756e 100644
--- a/meta-oe/recipes-connectivity/openvpn/openvpn_2.1.3.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.1.3.bb
@@ -1,16 +1,18 @@
-DESCRIPTION = "A full-featured SSL VPN solution via tun device."
+SUMMARY = "A full-featured SSL VPN solution via tun device."
 HOMEPAGE = "http://openvpn.sourceforge.net"
 SECTION = "console/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5aac200199fde47501876cba7263cb0c"
 DEPENDS = "lzo openssl"
-RRECOMMENDS_${PN} = "kernel-module-tun"
 
 inherit autotools
 
 SRC_URI = "http://openvpn.net/release/openvpn-${PV}.tar.gz \
            file://openvpn"
 
+SRC_URI[md5sum] = "7486d3e270ba4b033e311d3e022a0ad7"
+SRC_URI[sha256sum] = "5185181df2e6043bd667377bc92e36ea5a5bd7600af209654f109b6403ca5b36"
+
 CFLAGS += "-fno-inline"
 
 # I want openvpn to be able to read password from file (hrw)
@@ -22,5 +24,4 @@ do_install_append() {
     install -m 755 ${WORKDIR}/openvpn ${D}/${sysconfdir}/init.d
 }
 
-SRC_URI[md5sum] = "7486d3e270ba4b033e311d3e022a0ad7"
-SRC_URI[sha256sum] = "5185181df2e6043bd667377bc92e36ea5a5bd7600af209654f109b6403ca5b36"
+RRECOMMENDS_${PN} = "kernel-module-tun"
diff --git a/meta-oe/recipes-connectivity/openvpn/openvpn.inc b/meta-oe/recipes-connectivity/openvpn/openvpn.inc
deleted file mode 100644
index 61f91a3..0000000
--- a/meta-oe/recipes-connectivity/openvpn/openvpn.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "A full-featured SSL VPN solution via tun device."
-HOMEPAGE = "http://openvpn.sourceforge.net"
-SECTION = "console/network"
-LICENSE = "GPLv2"
-DEPENDS = "lzo openssl"
-RRECOMMENDS_${PN} = "kernel-module-tun"
-
-INC_PR = "r2"
-
-SRC_URI = "http://openvpn.net/release/openvpn-${PV}.tar.gz \
-    file://openvpn"
-S = "${WORKDIR}/openvpn-${PV}"
-
-CFLAGS += "-fno-inline"
-
-inherit autotools
-
-do_install_append() {
-    install -d ${D}/${sysconfdir}/init.d
-    install -d ${D}/${sysconfdir}/openvpn
-    install -m 755 ${WORKDIR}/openvpn ${D}/${sysconfdir}/init.d
-}
-- 
1.7.10.4



