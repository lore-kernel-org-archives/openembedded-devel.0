Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 568B1744AE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Aug 2018 05:16:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w795GvYw009308
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Aug 2018 22:16:57 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 8 Aug 2018 22:16:50 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Aug 2018 13:16:45 +0800
Message-ID: <1533791809-371521-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] dlm: upgrade 4.0.2 -> 4.0.3
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
X-List-Received-Date: Thu, 09 Aug 2018 05:16:56 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...pile-error-since-xml2-config-should-not-b.patch | 36 +++++++++++++++
 .../dlm/dlm/0001-dlm-fix-package-qa-error.patch    | 32 +++++++++++++
 .../respect-ldflags-also-from-bin_ldflags.patch    | 53 ++++++++++++++--------
 .../dlm/{dlm_4.0.2.bb => dlm_4.0.7.bb}             | 12 +++--
 4 files changed, 108 insertions(+), 25 deletions(-)
 create mode 100644 meta-networking/recipes-extended/dlm/dlm/0001-dlm-fix-compile-error-since-xml2-config-should-not-b.patch
 create mode 100644 meta-networking/recipes-extended/dlm/dlm/0001-dlm-fix-package-qa-error.patch
 rename meta-networking/recipes-extended/dlm/{dlm_4.0.2.bb => dlm_4.0.7.bb} (73%)

diff --git a/meta-networking/recipes-extended/dlm/dlm/0001-dlm-fix-compile-error-since-xml2-config-should-not-b.patch b/meta-networking/recipes-extended/dlm/dlm/0001-dlm-fix-compile-error-since-xml2-config-should-not-b.patch
new file mode 100644
index 0000000..0a2f31d
--- /dev/null
+++ b/meta-networking/recipes-extended/dlm/dlm/0001-dlm-fix-compile-error-since-xml2-config-should-not-b.patch
@@ -0,0 +1,36 @@
+From 9107f3bd68aef6ae456a3cad664223b4f3d00131 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 24 Jul 2018 17:04:39 +0800
+Subject: [PATCH] dlm: fix compile error since xml2-config should not be used
+
+xml2-config is disabled, so change Makefile to use pkgconfig
+to find libxml2.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ fence/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/fence/Makefile b/fence/Makefile
+index 77bf0fd..cca0b2c 100644
+--- a/fence/Makefile
++++ b/fence/Makefile
+@@ -30,11 +30,11 @@ BIN_CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
+ 	-fdiagnostics-show-option \
+ 
+ BIN_CFLAGS += -fPIE -DPIE
+-BIN_CFLAGS += `xml2-config --cflags`
++BIN_CFLAGS += `pkg-config libxml-2.0 --cflags`
+ BIN_CFLAGS += -I../include
+ 
+ BIN_LDFLAGS += -Wl,-z,now -Wl,-z,relro -pie
+-BIN_LDFLAGS += `xml2-config --libs`
++BIN_LDFLAGS += `pkg-config libxml-2.0 --libs`
+ BIN_LDFLAGS += -ldl
+ 
+ all: $(BIN_TARGET)
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-extended/dlm/dlm/0001-dlm-fix-package-qa-error.patch b/meta-networking/recipes-extended/dlm/dlm/0001-dlm-fix-package-qa-error.patch
new file mode 100644
index 0000000..3e384f7
--- /dev/null
+++ b/meta-networking/recipes-extended/dlm/dlm/0001-dlm-fix-package-qa-error.patch
@@ -0,0 +1,32 @@
+From 1fb68433bde97d571fc781b52c9521b17fbb8df0 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 24 Jul 2018 17:42:43 +0800
+Subject: [PATCH] dlm: fix package qa error
+
+pass LDFLAG to makefile to fix below error:
+do_package_qa: QA Issue: No GNU_HASH in the elf binary:
+/packages-split/dlm/usr/sbin/dlm_stonith' [ldflags]
+
+Upstream-Status: Inappropriate[oe-specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ fence/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fence/Makefile b/fence/Makefile
+index cca0b2c..2b3963c 100644
+--- a/fence/Makefile
++++ b/fence/Makefile
+@@ -33,7 +33,7 @@ BIN_CFLAGS += -fPIE -DPIE
+ BIN_CFLAGS += `pkg-config libxml-2.0 --cflags`
+ BIN_CFLAGS += -I../include
+ 
+-BIN_LDFLAGS += -Wl,-z,now -Wl,-z,relro -pie
++BIN_LDFLAGS += $(LDFLAGS) -Wl,-z,now -Wl,-z,relro -pie
+ BIN_LDFLAGS += `pkg-config libxml-2.0 --libs`
+ BIN_LDFLAGS += -ldl
+ 
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-extended/dlm/dlm/respect-ldflags-also-from-bin_ldflags.patch b/meta-networking/recipes-extended/dlm/dlm/respect-ldflags-also-from-bin_ldflags.patch
index 69b2f90..6f01b21 100644
--- a/meta-networking/recipes-extended/dlm/dlm/respect-ldflags-also-from-bin_ldflags.patch
+++ b/meta-networking/recipes-extended/dlm/dlm/respect-ldflags-also-from-bin_ldflags.patch
@@ -1,7 +1,23 @@
-diff -uNr dlm-4.0.2.orig/dlm_controld/Makefile dlm-4.0.2/dlm_controld/Makefile
---- dlm-4.0.2.orig/dlm_controld/Makefile	2017-04-04 10:49:23.661320260 +0200
-+++ dlm-4.0.2/dlm_controld/Makefile	2017-04-04 10:50:36.121326429 +0200
-@@ -55,7 +55,7 @@
+From 34a9182814ae565d6f430f85cfe80c05fa9f2dda Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 24 Jul 2018 17:55:32 +0800
+Subject: [PATCH] respect-ldflags-also-from-bin_ldflags
+
+Upstream-Status: Inappropriate[oe-specific]
+
+update original patch to version 4.0.7
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ dlm_controld/Makefile | 4 ++--
+ dlm_tool/Makefile     | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/dlm_controld/Makefile b/dlm_controld/Makefile
+index cf556c9..3381730 100644
+--- a/dlm_controld/Makefile
++++ b/dlm_controld/Makefile
+@@ -55,11 +55,11 @@ BIN_CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
  BIN_CFLAGS += -fPIE -DPIE
  BIN_CFLAGS += -I../include -I../libdlm
  
@@ -10,10 +26,16 @@ diff -uNr dlm-4.0.2.orig/dlm_controld/Makefile dlm-4.0.2/dlm_controld/Makefile
  BIN_LDFLAGS += -lpthread -lrt -lcpg -lcmap -lcfg -lquorum
  
  LIB_CFLAGS += $(BIN_CFLAGS)
-diff -uNr dlm-4.0.2.orig/dlm_tool/Makefile dlm-4.0.2/dlm_tool/Makefile
---- dlm-4.0.2.orig/dlm_tool/Makefile	2013-07-31 17:50:26.000000000 +0200
-+++ dlm-4.0.2/dlm_tool/Makefile	2017-04-04 10:50:44.617327153 +0200
-@@ -32,7 +32,7 @@
+-LIB_LDFLAGS += -Wl,-z,relro -pie
++LIB_LDFLAGS += $(LDFLAGS) -Wl,-z,relro -pie
+ 
+ ifeq ($(USE_SD_NOTIFY),yes)
+ 	BIN_CFLAGS += $(shell pkg-config --cflags libsystemd) \
+diff --git a/dlm_tool/Makefile b/dlm_tool/Makefile
+index c16d8f5..a48a26f 100644
+--- a/dlm_tool/Makefile
++++ b/dlm_tool/Makefile
+@@ -32,7 +32,7 @@ BIN_CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
  BIN_CFLAGS += -fPIE -DPIE
  BIN_CFLAGS += -I../include -I../libdlm -I../dlm_controld
  
@@ -22,15 +44,6 @@ diff -uNr dlm-4.0.2.orig/dlm_tool/Makefile dlm-4.0.2/dlm_tool/Makefile
  BIN_LDFLAGS += -L../libdlm -L../dlm_controld
  BIN_LDFLAGS += -lpthread -ldlm -ldlmcontrol
  
-diff -uNr dlm-4.0.2.orig/dlm_controld/Makefile dlm-4.0.2/dlm_controld/Makefile
---- dlm-4.0.2.orig/dlm_controld/Makefile	2017-04-04 11:02:58.578389641 +0200
-+++ dlm-4.0.2/dlm_controld/Makefile	2017-04-04 11:07:55.672414935 +0200
-@@ -59,7 +59,7 @@
- BIN_LDFLAGS += -lpthread -lrt -lcpg -lcmap -lcfg -lquorum
- 
- LIB_CFLAGS += $(BIN_CFLAGS)
--LIB_LDFLAGS += -Wl,-z,relro -pie
-+LIB_LDFLAGS += $(LDFLAGS) -Wl,-z,relro -pie
- 
- ifeq ($(USE_SD_NOTIFY),yes)
- 	BIN_CFLAGS += $(shell pkg-config --cflags libsystemd-daemon) \
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-extended/dlm/dlm_4.0.2.bb b/meta-networking/recipes-extended/dlm/dlm_4.0.7.bb
similarity index 73%
rename from meta-networking/recipes-extended/dlm/dlm_4.0.2.bb
rename to meta-networking/recipes-extended/dlm/dlm_4.0.7.bb
index da7f98a..f7f7e18 100644
--- a/meta-networking/recipes-extended/dlm/dlm_4.0.2.bb
+++ b/meta-networking/recipes-extended/dlm/dlm_4.0.7.bb
@@ -5,12 +5,14 @@ HOMEPAGE = "https://fedorahosted.org/cluster/wiki/HomePage"
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 
-SRC_URI = "https://git.fedorahosted.org/cgit/dlm.git/snapshot/${BP}.tar.xz \
-    file://respect-ldflags-also-from-bin_ldflags.patch \
+SRC_URI = "https://releases.pagure.org/dlm/${BP}.tar.gz \
+           file://respect-ldflags-also-from-bin_ldflags.patch \
+           file://0001-dlm-fix-compile-error-since-xml2-config-should-not-b.patch \
+           file://0001-dlm-fix-package-qa-error.patch \
 "
 
-SRC_URI[md5sum] = "efc2ee6093aa6aa0a88aaad83e998a3f"
-SRC_URI[sha256sum] = "b89bc557aaffbab0ac005398025f247718a5589cff6574d902eaffe2b20e683e"
+SRC_URI[md5sum] = "aa604a10d5ac2d3414eb89ec6984cd12"
+SRC_URI[sha256sum] = "639ddfc82369272a68d56816689736c00b8f1b6b2869a6b66b7dbf6dad86469a"
 
 UPSTREAM_CHECK_URI = "https://pagure.io/dlm/releases"
 UPSTREAM_CHECK_REGEX = "dlm-(?P<pver>\d+(\.\d+)+)"
@@ -18,7 +20,7 @@ UPSTREAM_CHECK_REGEX = "dlm-(?P<pver>\d+(\.\d+)+)"
 LICENSE = "LGPLv2+ & GPLv2 & GPLv2+"
 LIC_FILES_CHKSUM = "file://README.license;md5=8f0bbcdd678df1bce9863492b6c8832d"
 
-DEPENDS = "corosync systemd"
+DEPENDS = "corosync systemd pacemaker"
 
 inherit pkgconfig systemd distro_features_check
 
-- 
2.7.4


