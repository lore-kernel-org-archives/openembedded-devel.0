Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1US3od-0006dN-Bv
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 13:12:54 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Apr 2013 03:54:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,485,1363158000"; d="scan'208";a="319811893"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.4])
	by fmsmga001.fm.intel.com with ESMTP; 16 Apr 2013 03:54:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Apr 2013 11:53:59 +0100
Message-Id: <966f8e9762c59465c07da52945b599509e8d28c3.1366109533.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366109533.git.paul.eggleton@linux.intel.com>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1366109533.git.paul.eggleton@linux.intel.com>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking, meta-oe][PATCH 5/9] rp-pppoe: move from meta-oe to meta-networking and tweak
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

* Move packaging definitions to the end
* Move SRC_URI checksums next to SRC_URI
* Set SUMMARY instead of DESCRIPTION

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch       |    0
 .../rp-pppoe-3.8/discard-use-of-dnl-in-Makefile.am.patch |    0
 .../rp-pppoe/rp-pppoe-3.8/dont-swallow-errors.patch      |    0
 .../rp-pppoe/rp-pppoe-3.8/pppoe-server.default           |    0
 .../rp-pppoe/rp-pppoe-3.8/pppoe-server.init              |    0
 .../rp-pppoe/rp-pppoe-3.8/pppoe-src-restrictions.patch   |    0
 .../rp-pppoe/rp-pppoe-3.8/top-autoconf.patch             |    0
 .../rp-pppoe/rp-pppoe-3.8/update-config.patch            |    0
 .../rp-pppoe/rp-pppoe-3.8/use-ldflags.patch              |    0
 .../recipes-protocols}/rp-pppoe/rp-pppoe_3.8.bb          |   14 ++++++++------
 10 files changed, 8 insertions(+), 6 deletions(-)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-protocols}/rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-protocols}/rp-pppoe/rp-pppoe-3.8/discard-use-of-dnl-in-Makefile.am.patch (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-protocols}/rp-pppoe/rp-pppoe-3.8/dont-swallow-errors.patch (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-protocols}/rp-pppoe/rp-pppoe-3.8/pppoe-server.default (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-protocols}/rp-pppoe/rp-pppoe-3.8/pppoe-server.init (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-protocols}/rp-pppoe/rp-pppoe-3.8/pppoe-src-restrictions.patch (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-protocols}/rp-pppoe/rp-pppoe-3.8/top-autoconf.patch (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-protocols}/rp-pppoe/rp-pppoe-3.8/update-config.patch (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-protocols}/rp-pppoe/rp-pppoe-3.8/use-ldflags.patch (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-protocols}/rp-pppoe/rp-pppoe_3.8.bb (97%)

diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch
diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/discard-use-of-dnl-in-Makefile.am.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/discard-use-of-dnl-in-Makefile.am.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/discard-use-of-dnl-in-Makefile.am.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/discard-use-of-dnl-in-Makefile.am.patch
diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/dont-swallow-errors.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/dont-swallow-errors.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/dont-swallow-errors.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/dont-swallow-errors.patch
diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-server.default b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/pppoe-server.default
similarity index 100%
rename from meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-server.default
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/pppoe-server.default
diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-server.init b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/pppoe-server.init
similarity index 100%
rename from meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-server.init
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/pppoe-server.init
diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-src-restrictions.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/pppoe-src-restrictions.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-src-restrictions.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/pppoe-src-restrictions.patch
diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/top-autoconf.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/top-autoconf.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/top-autoconf.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/top-autoconf.patch
diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/update-config.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/update-config.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/update-config.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/update-config.patch
diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/use-ldflags.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/use-ldflags.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/use-ldflags.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/use-ldflags.patch
diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
similarity index 97%
rename from meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
index cbb4721..d4cc664 100644
--- a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
@@ -1,11 +1,9 @@
-DESCRIPTION = "A user-mode PPPoE client and server suite for Linux"
+SUMMARY = "A user-mode PPPoE client and server suite for Linux"
 HOMEPAGE = "http://www.roaringpenguin.com/products/pppoe"
 SECTION = "console/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=a194eaefae2be54ee3221339b10d0581"
-RDEPENDS_${PN} = "ppp"
-RDEPENDS_${PN}-server = "${PN}"
-RRECOMMENDS_${PN} = "ppp-oe"
+
 PR = "r9"
 
 SRC_URI = "http://www.roaringpenguin.com/files/download/${P}.tar.gz \
@@ -19,6 +17,9 @@ SRC_URI = "http://www.roaringpenguin.com/files/download/${P}.tar.gz \
            file://pppoe-server.default \
            file://pppoe-server.init"
 
+SRC_URI[md5sum] = "0e32760f498f9cde44081ee6aafc823b"
+SRC_URI[sha256sum] = "d916e9cfe1e62395f63a5361936fa855f6d0f0a37dc7227b394cdb725f553479"
+
 inherit autotools update-rc.d
 
 do_install() {
@@ -57,6 +58,7 @@ INITSCRIPT_PACKAGES            = "${PN}-server"
 INITSCRIPT_NAME_${PN}-server   = "pppoe-server"
 INITSCRIPT_PARAMS_${PN}-server = "defaults 92 8"
 
+RDEPENDS_${PN} = "ppp"
+RDEPENDS_${PN}-server = "${PN}"
+RRECOMMENDS_${PN} = "ppp-oe"
 
-SRC_URI[md5sum] = "0e32760f498f9cde44081ee6aafc823b"
-SRC_URI[sha256sum] = "d916e9cfe1e62395f63a5361936fa855f6d0f0a37dc7227b394cdb725f553479"
-- 
1.7.10.4



