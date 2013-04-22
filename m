Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UUCf4-00029x-I9
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Apr 2013 11:03:49 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2013 01:46:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,525,1363158000"; d="scan'208";a="298847390"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.204])
	by orsmga001.jf.intel.com with ESMTP; 22 Apr 2013 01:46:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Apr 2013 09:45:45 +0100
Message-Id: <1366620345-6561-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe, meta-networking][PATCH] net-snmp: move to meta-networking and tweak
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
X-List-Received-Date: Mon, 22 Apr 2013 09:03:58 -0000

* Set SUMMARY instead of DESCRIPTION
* Move SRC_URI checksums under SRC_URI
* Move packaging definitions to the end

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-protocols}/net-snmp/files/ifmib.patch  |    0
 .../recipes-protocols}/net-snmp/files/init         |    0
 .../recipes-protocols}/net-snmp/files/snmpd.conf   |    0
 .../net-snmp/files/snmptrapd.conf                  |    0
 .../net-snmp/net-snmp/snmpd.service                |    0
 .../net-snmp/net-snmp/snmptrapd.service            |    0
 .../net-snmp/net-snmp/systemd-support.patch        |    0
 .../recipes-protocols}/net-snmp/net-snmp_5.7.2.bb  |   23 ++++++++++----------
 8 files changed, 12 insertions(+), 11 deletions(-)
 rename {meta-oe/recipes-extended => meta-networking/recipes-protocols}/net-snmp/files/ifmib.patch (100%)
 rename {meta-oe/recipes-extended => meta-networking/recipes-protocols}/net-snmp/files/init (100%)
 rename {meta-oe/recipes-extended => meta-networking/recipes-protocols}/net-snmp/files/snmpd.conf (100%)
 rename {meta-oe/recipes-extended => meta-networking/recipes-protocols}/net-snmp/files/snmptrapd.conf (100%)
 rename {meta-oe/recipes-extended => meta-networking/recipes-protocols}/net-snmp/net-snmp/snmpd.service (100%)
 rename {meta-oe/recipes-extended => meta-networking/recipes-protocols}/net-snmp/net-snmp/snmptrapd.service (100%)
 rename {meta-oe/recipes-extended => meta-networking/recipes-protocols}/net-snmp/net-snmp/systemd-support.patch (100%)
 rename {meta-oe/recipes-extended => meta-networking/recipes-protocols}/net-snmp/net-snmp_5.7.2.bb (98%)

diff --git a/meta-oe/recipes-extended/net-snmp/files/ifmib.patch b/meta-networking/recipes-protocols/net-snmp/files/ifmib.patch
similarity index 100%
rename from meta-oe/recipes-extended/net-snmp/files/ifmib.patch
rename to meta-networking/recipes-protocols/net-snmp/files/ifmib.patch
diff --git a/meta-oe/recipes-extended/net-snmp/files/init b/meta-networking/recipes-protocols/net-snmp/files/init
similarity index 100%
rename from meta-oe/recipes-extended/net-snmp/files/init
rename to meta-networking/recipes-protocols/net-snmp/files/init
diff --git a/meta-oe/recipes-extended/net-snmp/files/snmpd.conf b/meta-networking/recipes-protocols/net-snmp/files/snmpd.conf
similarity index 100%
rename from meta-oe/recipes-extended/net-snmp/files/snmpd.conf
rename to meta-networking/recipes-protocols/net-snmp/files/snmpd.conf
diff --git a/meta-oe/recipes-extended/net-snmp/files/snmptrapd.conf b/meta-networking/recipes-protocols/net-snmp/files/snmptrapd.conf
similarity index 100%
rename from meta-oe/recipes-extended/net-snmp/files/snmptrapd.conf
rename to meta-networking/recipes-protocols/net-snmp/files/snmptrapd.conf
diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp/snmpd.service b/meta-networking/recipes-protocols/net-snmp/net-snmp/snmpd.service
similarity index 100%
rename from meta-oe/recipes-extended/net-snmp/net-snmp/snmpd.service
rename to meta-networking/recipes-protocols/net-snmp/net-snmp/snmpd.service
diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp/snmptrapd.service b/meta-networking/recipes-protocols/net-snmp/net-snmp/snmptrapd.service
similarity index 100%
rename from meta-oe/recipes-extended/net-snmp/net-snmp/snmptrapd.service
rename to meta-networking/recipes-protocols/net-snmp/net-snmp/snmptrapd.service
diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp/systemd-support.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/systemd-support.patch
similarity index 100%
rename from meta-oe/recipes-extended/net-snmp/net-snmp/systemd-support.patch
rename to meta-networking/recipes-protocols/net-snmp/net-snmp/systemd-support.patch
diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
similarity index 98%
rename from meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb
rename to meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
index 244f0d8..4c3939a 100644
--- a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
@@ -1,12 +1,11 @@
-DESCRIPTION = "Various tools relating to the Simple Network Management Protocol"
+SUMMARY = "Various tools relating to the Simple Network Management Protocol"
 HOMEPAGE = "http://www.net-snmp.org/"
 LICENSE = "BSD"
 
-SRC_URI[md5sum] = "5bddd02e2f82b62daa79f82717737a14"
-SRC_URI[sha256sum] = "09ed31b4cc1f3c0411ef9a16eff79ef3b30d89c32ca46d5a01a41826c4ceb816"
-
 LIC_FILES_CHKSUM = "file://README;beginline=3;endline=8;md5=7f7f00ba639ac8e8deb5a622ea24634e"
 
+DEPENDS = "openssl libnl pciutils"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
         file://init \
         file://snmpd.conf \
@@ -17,13 +16,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
         file://ifmib.patch \
 "
 
-DEPENDS = "openssl libnl pciutils"
-RDEPENDS_${PN}-server-snmpd += "net-snmp-mibs"
-RDEPENDS_${PN}-server-snmptrapd += "net-snmp-server-snmpd"
-RDEPENDS_${PN}-server += "net-snmp-server-snmpd net-snmp-server-snmptrapd"
-RDEPENDS_${PN}-client += "net-snmp-mibs"
-RDEPENDS_${PN}-dev = "net-snmp-client (= ${EXTENDPKGV}) net-snmp-server (= ${EXTENDPKGV})"
-RRECOMMENDS_${PN}-dbg = "net-snmp-client (= ${EXTENDPKGV}) net-snmp-server (= ${EXTENDPKGV})"
+SRC_URI[md5sum] = "5bddd02e2f82b62daa79f82717737a14"
+SRC_URI[sha256sum] = "09ed31b4cc1f3c0411ef9a16eff79ef3b30d89c32ca46d5a01a41826c4ceb816"
 
 inherit autotools update-rc.d siteinfo systemd
 
@@ -97,6 +91,13 @@ SYSTEMD_PACKAGES = "${PN}-server-snmpd \
 SYSTEMD_SERVICE_${PN}-server-snmpd = "snmpd.service"
 SYSTEMD_SERVICE_${PN}-server-snmptrapd =  "snmptrapd.service"
 
+RDEPENDS_${PN}-server-snmpd += "net-snmp-mibs"
+RDEPENDS_${PN}-server-snmptrapd += "net-snmp-server-snmpd"
+RDEPENDS_${PN}-server += "net-snmp-server-snmpd net-snmp-server-snmptrapd"
+RDEPENDS_${PN}-client += "net-snmp-mibs"
+RDEPENDS_${PN}-dev = "net-snmp-client (= ${EXTENDPKGV}) net-snmp-server (= ${EXTENDPKGV})"
+RRECOMMENDS_${PN}-dbg = "net-snmp-client (= ${EXTENDPKGV}) net-snmp-server (= ${EXTENDPKGV})"
+
 RPROVIDES_${PN}-server-snmpd += "${PN}-server-snmpd-systemd"
 RREPLACES_${PN}-server-snmpd += "${PN}-server-snmpd-systemd"
 RCONFLICTS_${PN}-server-snmpd += "${PN}-server-snmpd-systemd"
-- 
1.7.10.4



