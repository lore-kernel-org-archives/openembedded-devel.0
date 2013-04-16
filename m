Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1US3oh-0006d2-Hi
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 13:12:54 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Apr 2013 03:54:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,485,1363158000"; d="scan'208";a="319811897"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.4])
	by fmsmga001.fm.intel.com with ESMTP; 16 Apr 2013 03:54:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Apr 2013 11:54:00 +0100
Message-Id: <c3f3efb4077c89fb95aedf17fc4a4b32f536ef7e.1366109533.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366109533.git.paul.eggleton@linux.intel.com>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1366109533.git.paul.eggleton@linux.intel.com>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking, meta-oe][PATCH 6/9] dnsmasq: move to meta-networking and tweak
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
X-List-Received-Date: Tue, 16 Apr 2013 11:13:10 -0000

* Make dbus a PACKAGECONFIG option and remove dnsmasq-dbus recipe
* Set LICENSE to correctly indicate choice of licenses
* Set SUMMARY instead of DESCRIPTION

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-support}/dnsmasq/dnsmasq.inc                  |   13 +++++++++++--
 .../recipes-support}/dnsmasq/dnsmasq_2.55.bb              |    0
 .../recipes-support}/dnsmasq/files/dnsmasq.conf           |    0
 .../recipes-support}/dnsmasq/files/dnsmasq.service        |    0
 .../recipes-support}/dnsmasq/files/init                   |    0
 meta-oe/recipes-connectivity/dnsmasq/dnsmasq-dbus_2.55.bb |   13 -------------
 6 files changed, 11 insertions(+), 15 deletions(-)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-support}/dnsmasq/dnsmasq.inc (76%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-support}/dnsmasq/dnsmasq_2.55.bb (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-support}/dnsmasq/files/dnsmasq.conf (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-support}/dnsmasq/files/dnsmasq.service (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-support}/dnsmasq/files/init (100%)
 delete mode 100644 meta-oe/recipes-connectivity/dnsmasq/dnsmasq-dbus_2.55.bb

diff --git a/meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
similarity index 76%
rename from meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc
rename to meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index 46188a4..0f5b273 100644
--- a/meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -1,8 +1,8 @@
-DESCRIPTION = "Dnsmasq is a lightweight, easy to configure DNS forwarder and DHCP server."
+SUMMARY = "Lightweight, easy to configure DNS forwarder and DHCP server"
 HOMEPAGE = "http://www.thekelleys.org.uk/dnsmasq/doc.html"
 SECTION = "console/network"
 # GPLv3 was added in version 2.41 as license option
-LICENSE = "GPLv2 GPLv3"
+LICENSE = "GPLv2 | GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://COPYING-v3;md5=d32239bcb673463ab874e80d47fae504"
 
@@ -18,6 +18,10 @@ inherit update-rc.d systemd
 INITSCRIPT_NAME = "dnsmasq"
 INITSCRIPT_PARAMS = "defaults"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[dbus] = "COPTS=-DHAVE_DBUS,,dbus"
+EXTRA_OEMAKE = "${EXTRA_OECONF}"
+
 do_install () {
     oe_runmake "PREFIX=${D}${prefix}" \
                "BINDIR=${D}${bindir}" \
@@ -29,6 +33,11 @@ do_install () {
 
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir}/system
+
+    if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" != "" ]; then
+        install -d ${D}${sysconfdir}/dbus-1/system.d
+        install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d/
+    fi
 }
 
 CONFFILES_${PN} = "${sysconfdir}/dnsmasq.conf"
diff --git a/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.55.bb
similarity index 100%
rename from meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bb
rename to meta-networking/recipes-support/dnsmasq/dnsmasq_2.55.bb
diff --git a/meta-oe/recipes-connectivity/dnsmasq/files/dnsmasq.conf b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.conf
similarity index 100%
rename from meta-oe/recipes-connectivity/dnsmasq/files/dnsmasq.conf
rename to meta-networking/recipes-support/dnsmasq/files/dnsmasq.conf
diff --git a/meta-oe/recipes-connectivity/dnsmasq/files/dnsmasq.service b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
similarity index 100%
rename from meta-oe/recipes-connectivity/dnsmasq/files/dnsmasq.service
rename to meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
diff --git a/meta-oe/recipes-connectivity/dnsmasq/files/init b/meta-networking/recipes-support/dnsmasq/files/init
similarity index 100%
rename from meta-oe/recipes-connectivity/dnsmasq/files/init
rename to meta-networking/recipes-support/dnsmasq/files/init
diff --git a/meta-oe/recipes-connectivity/dnsmasq/dnsmasq-dbus_2.55.bb b/meta-oe/recipes-connectivity/dnsmasq/dnsmasq-dbus_2.55.bb
deleted file mode 100644
index 7d698c6..0000000
--- a/meta-oe/recipes-connectivity/dnsmasq/dnsmasq-dbus_2.55.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-# dnsmasq with support for DBus interface
-
-require dnsmasq_${PV}.bb
-
-S = "${WORKDIR}/dnsmasq-${PV}"
-
-DEPENDS = "dbus"
-EXTRA_OEMAKE = "COPTS=-DHAVE_DBUS"
-
-do_install_append () {
-    install -d ${D}${sysconfdir}/dbus-1/system.d
-    install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d/
-}
-- 
1.7.10.4



