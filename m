Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E7EA77012
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 06:28:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8U6SBKt022697
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Sep 2015 23:28:11 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 29 Sep 2015 23:28:10 -0700
From: <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
Date: Wed, 30 Sep 2015 14:21:12 +0800
Message-ID: <1443594073-23679-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.0.rc2.10.gf4d9753
In-Reply-To: <1443594073-23679-1-git-send-email-kai.kang@windriver.com>
References: <1443594073-23679-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] efivar: 0.7 -> 0.21
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
X-List-Received-Date: Wed, 30 Sep 2015 06:28:13 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade efivar from 0.7 to 0.21.

* update HOMEPAGE and git repo.
* add -native recipe to provide command makeguids
  and add patch for target package to use this native makeguids command
* update license file checksum. It made FSF addresses in COPYING be URLs.
  Ref: https://github.com/rhinstaller/efivar/commit/ca88012

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../efivar/0001-efivar-fix-for-cross-compile.patch | 31 ++++++++++++++++++++++
 .../efivar/{efivar_git.bb => efivar_0.21.bb}       | 22 ++++++++++-----
 2 files changed, 47 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
 rename meta-oe/recipes-extended/efivar/{efivar_git.bb => efivar_0.21.bb} (31%)

diff --git a/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch b/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
new file mode 100644
index 0000000..4bd7d95
--- /dev/null
+++ b/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
@@ -0,0 +1,31 @@
+From 7036e8b0dca61432970789e5397b6fb02b362c2b Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Fri, 25 Sep 2015 18:14:31 +0800
+Subject: [PATCH] efivar: fix for cross compile
+
+It builds and calls elf file makeguids to generate a header file which
+doesn't work for cross compile. Fix it.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ src/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 6eac858..ef4eb1d 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -65,8 +65,8 @@ makeguids.o : makeguids.c
+ makeguids : makeguids.o fakeguid.o
+ 	$(CC) $(cflags) -o $@ $^ -ldl
+ 
+-include/efivar/efivar-guids.h : makeguids guids.txt
+-	./makeguids guids.txt guids.bin names.bin guid-symbols.S $@
++include/efivar/efivar-guids.h : guids.txt
++	makeguids guids.txt guids.bin names.bin guid-symbols.S $@
+ 
+ guidlist.o : guids.S include/efivar/efivar-guids.h
+ 	$(CC) $(cflags) -c -o guidlist.o guids.S
+-- 
+2.6.0.rc2.10.gf4d9753
+
diff --git a/meta-oe/recipes-extended/efivar/efivar_git.bb b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
similarity index 31%
rename from meta-oe/recipes-extended/efivar/efivar_git.bb
rename to meta-oe/recipes-extended/efivar/efivar_0.21.bb
index 18446a0..2e3b643 100644
--- a/meta-oe/recipes-extended/efivar/efivar_git.bb
+++ b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
@@ -1,18 +1,28 @@
 SUMMARY = "Tools to manipulate UEFI variables"
 DESCRIPTION = "efivar provides a simple command line interface to the UEFI variable facility"
-HOMEPAGE = "https://github.com/vathpela/efivar"
+HOMEPAGE = "https://github.com/rhinstaller/efivar"
 
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
 
-DEPENDS = "popt"
+DEPENDS_class-target = "popt efivar-native"
 
-SRCREV = "c9e1f24a81b5374408bca5616402276e47171cf7"
-PV = "0.7+git${SRCPV}"
-SRC_URI = "git://github.com/vathpela/efivar.git"
+SRCREV = "aab6c2a64d90b6e5a63661fb5bd6be8d878b0784"
+SRC_URI = "git://github.com/rhinstaller/efivar.git"
+SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch"
 
 S = "${WORKDIR}/git"
 
 do_install() {
     oe_runmake install DESTDIR=${D}
 }
+
+do_compile_class-native() {
+    oe_runmake -C src makeguids
+}
+
+do_install_class-native() {
+    install -D ${B}/src/makeguids ${D}${bindir}/makeguids
+}
+
+BBCLASSEXTEND = "native"
-- 
2.6.0.rc2.10.gf4d9753


