Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D2D27E90C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 01:44:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5S1iH2m007179
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 18:44:27 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 27 Jun 2019 18:44:06 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Jun 2019 09:44:05 +0800
Message-ID: <1561686245-458053-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] dlm: upgrade 4.0.7 -> 4.0.9
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
X-List-Received-Date: Fri, 28 Jun 2019 01:44:36 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...pile-error-since-xml2-config-should-not-b.patch | 28 ++++++-------
 .../respect-ldflags-also-from-bin_ldflags.patch    | 49 ----------------------
 .../dlm/{dlm_4.0.7.bb => dlm_4.0.9.bb}             | 10 ++---
 3 files changed, 19 insertions(+), 68 deletions(-)
 delete mode 100644 meta-networking/recipes-extended/dlm/dlm/respect-ldflags-also-from-bin_ldflags.patch
 rename meta-networking/recipes-extended/dlm/{dlm_4.0.7.bb => dlm_4.0.9.bb} (83%)

diff --git a/meta-networking/recipes-extended/dlm/dlm/0001-dlm-fix-compile-error-since-xml2-config-should-not-b.patch b/meta-networking/recipes-extended/dlm/dlm/0001-dlm-fix-compile-error-since-xml2-config-should-not-b.patch
index 0a2f31d..f56359a 100644
--- a/meta-networking/recipes-extended/dlm/dlm/0001-dlm-fix-compile-error-since-xml2-config-should-not-b.patch
+++ b/meta-networking/recipes-extended/dlm/dlm/0001-dlm-fix-compile-error-since-xml2-config-should-not-b.patch
@@ -1,12 +1,12 @@
-From 9107f3bd68aef6ae456a3cad664223b4f3d00131 Mon Sep 17 00:00:00 2001
+From ad207a6f83dac390b2d95e3a8262d27292921863 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 24 Jul 2018 17:04:39 +0800
+Date: Wed, 26 Jun 2019 11:49:33 +0800
 Subject: [PATCH] dlm: fix compile error since xml2-config should not be used
 
 xml2-config is disabled, so change Makefile to use pkgconfig
 to find libxml2.
 
-Upstream-Status: Inappropriate
+Upstream-Status: Inappropriate [oe-specific]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
@@ -14,21 +14,21 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/fence/Makefile b/fence/Makefile
-index 77bf0fd..cca0b2c 100644
+index b927879..6e16078 100644
 --- a/fence/Makefile
 +++ b/fence/Makefile
-@@ -30,11 +30,11 @@ BIN_CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
- 	-fdiagnostics-show-option \
+@@ -18,11 +18,11 @@ CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
+ 	-fstack-clash-protection -Wl,-z,now
  
- BIN_CFLAGS += -fPIE -DPIE
--BIN_CFLAGS += `xml2-config --cflags`
-+BIN_CFLAGS += `pkg-config libxml-2.0 --cflags`
- BIN_CFLAGS += -I../include
+ CFLAGS += -fPIE -DPIE
+-CFLAGS += `xml2-config --cflags`
++CFLAGS += `pkg-config libxml-2.0 --cflags`
+ CFLAGS += -I../include
  
- BIN_LDFLAGS += -Wl,-z,now -Wl,-z,relro -pie
--BIN_LDFLAGS += `xml2-config --libs`
-+BIN_LDFLAGS += `pkg-config libxml-2.0 --libs`
- BIN_LDFLAGS += -ldl
+ LDFLAGS += -Wl,-z,relro -pie
+-LDFLAGS += `xml2-config --libs`
++LDFLAGS += `pkg-config libxml-2.0 --libs`
+ LDFLAGS += -ldl
  
  all: $(BIN_TARGET)
 -- 
diff --git a/meta-networking/recipes-extended/dlm/dlm/respect-ldflags-also-from-bin_ldflags.patch b/meta-networking/recipes-extended/dlm/dlm/respect-ldflags-also-from-bin_ldflags.patch
deleted file mode 100644
index 6f01b21..0000000
--- a/meta-networking/recipes-extended/dlm/dlm/respect-ldflags-also-from-bin_ldflags.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 34a9182814ae565d6f430f85cfe80c05fa9f2dda Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 24 Jul 2018 17:55:32 +0800
-Subject: [PATCH] respect-ldflags-also-from-bin_ldflags
-
-Upstream-Status: Inappropriate[oe-specific]
-
-update original patch to version 4.0.7
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- dlm_controld/Makefile | 4 ++--
- dlm_tool/Makefile     | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/dlm_controld/Makefile b/dlm_controld/Makefile
-index cf556c9..3381730 100644
---- a/dlm_controld/Makefile
-+++ b/dlm_controld/Makefile
-@@ -55,11 +55,11 @@ BIN_CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
- BIN_CFLAGS += -fPIE -DPIE
- BIN_CFLAGS += -I../include -I../libdlm
- 
--BIN_LDFLAGS += -Wl,-z,now -Wl,-z,relro -pie
-+BIN_LDFLAGS += $(LDFLAGS) -Wl,-z,now -Wl,-z,relro -pie
- BIN_LDFLAGS += -lpthread -lrt -lcpg -lcmap -lcfg -lquorum
- 
- LIB_CFLAGS += $(BIN_CFLAGS)
--LIB_LDFLAGS += -Wl,-z,relro -pie
-+LIB_LDFLAGS += $(LDFLAGS) -Wl,-z,relro -pie
- 
- ifeq ($(USE_SD_NOTIFY),yes)
- 	BIN_CFLAGS += $(shell pkg-config --cflags libsystemd) \
-diff --git a/dlm_tool/Makefile b/dlm_tool/Makefile
-index c16d8f5..a48a26f 100644
---- a/dlm_tool/Makefile
-+++ b/dlm_tool/Makefile
-@@ -32,7 +32,7 @@ BIN_CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
- BIN_CFLAGS += -fPIE -DPIE
- BIN_CFLAGS += -I../include -I../libdlm -I../dlm_controld
- 
--BIN_LDFLAGS += -Wl,-z,now -Wl,-z,relro -pie
-+BIN_LDFLAGS += $(LDFLAGS) -Wl,-z,now -Wl,-z,relro -pie
- BIN_LDFLAGS += -L../libdlm -L../dlm_controld
- BIN_LDFLAGS += -lpthread -ldlm -ldlmcontrol
- 
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-extended/dlm/dlm_4.0.7.bb b/meta-networking/recipes-extended/dlm/dlm_4.0.9.bb
similarity index 83%
rename from meta-networking/recipes-extended/dlm/dlm_4.0.7.bb
rename to meta-networking/recipes-extended/dlm/dlm_4.0.9.bb
index 027864a..876462d 100644
--- a/meta-networking/recipes-extended/dlm/dlm_4.0.7.bb
+++ b/meta-networking/recipes-extended/dlm/dlm_4.0.9.bb
@@ -5,15 +5,13 @@ HOMEPAGE = "https://fedorahosted.org/cluster/wiki/HomePage"
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 
-SRC_URI = "https://releases.pagure.org/dlm/${BP}.tar.gz \
-           file://respect-ldflags-also-from-bin_ldflags.patch \
+SRC_URI = "https://pagure.io/dlm/archive/dlm-${PV}/dlm-dlm-${PV}.tar.gz \
            file://0001-dlm-fix-compile-error-since-xml2-config-should-not-b.patch \
-           file://0001-dlm-fix-package-qa-error.patch \
            file://0001-Include-sys-sysmacros.h-for-major-minor-macros-in-gl.patch \
            "
 
-SRC_URI[md5sum] = "aa604a10d5ac2d3414eb89ec6984cd12"
-SRC_URI[sha256sum] = "639ddfc82369272a68d56816689736c00b8f1b6b2869a6b66b7dbf6dad86469a"
+SRC_URI[md5sum] = "4c57a941a15547859cd38fd55f66388e"
+SRC_URI[sha256sum] = "d59142e067cbd603aaf66151a04e9fa34330219680b8827c953d20821b951991"
 
 UPSTREAM_CHECK_URI = "https://pagure.io/dlm/releases"
 UPSTREAM_CHECK_REGEX = "dlm-(?P<pver>\d+(\.\d+)+)"
@@ -21,6 +19,8 @@ UPSTREAM_CHECK_REGEX = "dlm-(?P<pver>\d+(\.\d+)+)"
 LICENSE = "LGPLv2+ & GPLv2 & GPLv2+"
 LIC_FILES_CHKSUM = "file://README.license;md5=8f0bbcdd678df1bce9863492b6c8832d"
 
+S = "${WORKDIR}/dlm-dlm-${PV}"
+
 DEPENDS = "corosync systemd"
 
 inherit pkgconfig systemd distro_features_check
-- 
2.7.4


