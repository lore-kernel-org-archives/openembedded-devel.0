Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AE53F7DF61
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Sep 2019 21:16:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8RLFXfN020292
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Sep 2019 14:15:49 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 27 Sep 2019 14:15:24 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Sep 2019 17:15:23 -0400
Message-ID: <20190927211523.28562-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] kea: upgrade 1.5.0 -> 1.7.0
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
X-List-Received-Date: Fri, 27 Sep 2019 21:16:00 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

The license checksum change is due to the date being updated.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...le.am-update-hooksdir-for-lease_cmds.patch | 31 -------------------
 .../kea/{kea_1.5.0.bb => kea_1.7.0.bb}        |  9 +++---
 2 files changed, 4 insertions(+), 36 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/kea/files/0003-Makefile.am-update-hooksdir-for-lease_cmds.patch
 rename meta-networking/recipes-connectivity/kea/{kea_1.5.0.bb => kea_1.7.0.bb} (82%)

diff --git a/meta-networking/recipes-connectivity/kea/files/0003-Makefile.am-update-hooksdir-for-lease_cmds.patch b/meta-networking/recipes-connectivity/kea/files/0003-Makefile.am-update-hooksdir-for-lease_cmds.patch
deleted file mode 100644
index 381a3a7eb..000000000
--- a/meta-networking/recipes-connectivity/kea/files/0003-Makefile.am-update-hooksdir-for-lease_cmds.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From cd902b8b588681a27d5321f1ee078a1c8f6e6935 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <Mingli.Yu@windriver.com>
-Date: Wed, 21 Mar 2018 06:01:38 +0000
-Subject: [PATCH 3/3] Makefile.am: update hooksdir for lease_cmds
-
-update hooksdir for lease_cmds
-
-Upstream-Status: Pending
-
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
-
----
- src/hooks/dhcp/lease_cmds/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/hooks/dhcp/lease_cmds/Makefile.am b/src/hooks/dhcp/lease_cmds/Makefile.am
-index cfd6779..22cc4a9 100644
---- a/src/hooks/dhcp/lease_cmds/Makefile.am
-+++ b/src/hooks/dhcp/lease_cmds/Makefile.am
-@@ -37,7 +37,7 @@ liblease_cmds_la_CXXFLAGS = $(AM_CXXFLAGS)
- liblease_cmds_la_CPPFLAGS = $(AM_CPPFLAGS)
- 
- # install the shared object into $(libdir)/hooks
--lib_hooksdir = $(libdir)/hooks
-+lib_hooksdir = $(libdir)/kea/hooks
- lib_hooks_LTLIBRARIES = libdhcp_lease_cmds.la
- 
- libdhcp_lease_cmds_la_SOURCES  =
--- 
-2.18.0
-
diff --git a/meta-networking/recipes-connectivity/kea/kea_1.5.0.bb b/meta-networking/recipes-connectivity/kea/kea_1.7.0.bb
similarity index 82%
rename from meta-networking/recipes-connectivity/kea/kea_1.5.0.bb
rename to meta-networking/recipes-connectivity/kea/kea_1.7.0.bb
index fb166df60..3123099a7 100644
--- a/meta-networking/recipes-connectivity/kea/kea_1.5.0.bb
+++ b/meta-networking/recipes-connectivity/kea/kea_1.7.0.bb
@@ -3,20 +3,19 @@ DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It
 HOMEPAGE = "http://kea.isc.org"
 SECTION = "connectivity"
 LICENSE = "MPL-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2ed44ce4e0bbfdc1abfa6bf949b7ba3a"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0e5b01c848c7736a0c9e68f9c9cd0281"
 
 DEPENDS += "kea-native"
 
 SRC_URI = "\
     http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
-    file://0003-Makefile.am-update-hooksdir-for-lease_cmds.patch \
     file://0001-remove-AC_TRY_RUN.patch \
     file://kea-dhcp4.service \
     file://kea-dhcp6.service \
     file://kea-dhcp-ddns.service \
 "
-SRC_URI[md5sum] = "591d38e5fcc0251a8812e8bb1337578a"
-SRC_URI[sha256sum] = "edce4fab68ca7af607cf7f5bc86596e04fe0ef4b8e88906e339cdefcf21daaec"
+SRC_URI[md5sum] = "c6406ac3d160161056d2fc36557ebd89"
+SRC_URI[sha256sum] = "173c8e893690a611bc1d1c6fbe54a5c20fcd54429399a8dc3a0d7d2eb01bf8cc"
 
 inherit autotools systemd
 
@@ -54,7 +53,7 @@ PACKAGECONFIG ??= "openssl log4cplus boost"
 
 PACKAGECONFIG[openssl] = "--with-openssl=${STAGING_DIR_TARGET}${prefix},,openssl,openssl"
 PACKAGECONFIG[log4cplus] = "--with-log4cplus=${STAGING_DIR_TARGET}${prefix},,log4cplus,log4cplus"
-PACKAGECONFIG[boost] = "--with-boost-include=${STAGING_INCDIR} --with-boost-lib-dir=${STAGING_LIBDIR} --with-boost-libs=-lboost_system,,boost,boost"
+PACKAGECONFIG[boost] = "--with-boost-libs=-lboost_system,,boost,boost"
 
 FILES_${PN}-staticdev += "${libdir}/kea/hooks/*.a ${libdir}/hooks/*.a"
 FILES_${PN} += "${libdir}/hooks/*.so"
-- 
2.21.0


