Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B28007D3A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2019 06:13:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3H6DSPN007116
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2019 23:13:38 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 16 Apr 2019 23:13:17 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Apr 2019 02:13:11 -0400
Message-ID: <20190417061312.120376-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] drbd: fix compile errors
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
X-List-Received-Date: Wed, 17 Apr 2019 06:13:47 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to build drbd with errors:

|   LD [M] .../tmp/work/qemux86_64-poky-linux/drbd/9.0.17-1-r0/drbd-9.0.17-1/drbd/drbd.o
| x86_64-poky-linux-ld.bfd: cannot find
| .../tmp/work/qemux86_64-poky-linux/drbd/9.0.17-1-r0/drbd-9.0.17-1/drbd/drbd_bitmap.o: No such file or directory

Backport patch from upstream to fix the issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...fix-use-M-don-t-forget-addprefix-obj.patch | 79 +++++++++++++++++++
 .../recipes-support/drbd/drbd_9.0.17-1.bb     |  4 +-
 2 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/drbd/drbd/0001-drbd-kbuild-fix-use-M-don-t-forget-addprefix-obj.patch

diff --git a/meta-networking/recipes-support/drbd/drbd/0001-drbd-kbuild-fix-use-M-don-t-forget-addprefix-obj.patch b/meta-networking/recipes-support/drbd/drbd/0001-drbd-kbuild-fix-use-M-don-t-forget-addprefix-obj.patch
new file mode 100644
index 000000000..fbf94d513
--- /dev/null
+++ b/meta-networking/recipes-support/drbd/drbd/0001-drbd-kbuild-fix-use-M-don-t-forget-addprefix-obj.patch
@@ -0,0 +1,79 @@
+Upstream-Status: Backport [https://github.com/LINBIT/drbd-9.0/commit/46e8e3f]
+
+Backport patch to fix compile errors:
+
+|   LD [M]  /home/kkang/buildarea/Yocto/build/tmp/work/qemux86_64-poky-linux/drbd/9.0.17-1-r0/drbd-9.0.17-1/drbd/drbd.o
+| x86_64-poky-linux-ld.bfd: cannot find .../tmp/work/qemux86_64-poky-linux/drbd/9.0.17-1-r0/drbd-9.0.17-1/drbd/drbd_bitmap.o: No such file or directory
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 46e8e3fc31b651fb56ea38134dcf14382fc43000 Mon Sep 17 00:00:00 2001
+From: Lars Ellenberg <lars.ellenberg@linbit.com>
+Date: Wed, 3 Apr 2019 10:57:46 +0200
+Subject: [PATCH] drbd: kbuild fix: use M=; don't forget addprefix $(obj)
+
+Kernel build started to warn about using SUBDIRS instead of M,
+and we don't support "very old" kernels anymore anyways.
+
+Our list of dependencies for drbd_buildtag.c needs to depend on the
+actual files $(obj)/*.o resulting from the build,
+not on just the list of *.o names.
+
+This apparently also fixes a build failure in opensuse build service for
+tumbleweed when using make-4.2.1-7.5 against kernel 5.0.5-something.
+---
+ drbd/Kbuild   | 11 +++++------
+ drbd/Makefile |  4 +---
+ 2 files changed, 6 insertions(+), 9 deletions(-)
+
+diff --git a/drbd/Kbuild b/drbd/Kbuild
+index 285f7a81..99228029 100644
+--- a/drbd/Kbuild
++++ b/drbd/Kbuild
+@@ -1,4 +1,5 @@
+-obj-m := drbd.o drbd_transport_tcp.o
++obj-m += drbd.o drbd_transport_tcp.o
++# obj-$(CONFIG_BLK_DEV_DRBD)     += drbd.o drbd_transport_tcp.o
+ 
+ clean-files := compat.h $(wildcard .config.$(KERNELVERSION).timestamp)
+ 
+@@ -56,10 +57,8 @@ ifndef DISABLE_KREF_DEBUGGING_HERE
+       drbd-y += kref_debug.o drbd_kref_debug.o
+ endif
+ 
+-$(patsubst %,$(obj)/%,$(drbd-y)): $(obj)/compat.h
+-$(patsubst %,$(obj)/%,drbd_transport_tcp.o): $(obj)/compat.h
+-
+-obj-$(CONFIG_BLK_DEV_DRBD)     += drbd.o
++$(addprefix $(obj)/,$(drbd-y)): $(obj)/compat.h
++$(obj)/drbd_transport_tcp.o: $(obj)/compat.h
+ 
+ # ======================================================================
+ 
+@@ -124,7 +123,7 @@ endif
+ # and not in e.g. dash. I'm too lazy to fix it to be compatible.
+ SHELL=/bin/bash
+ 
+-$(obj)/drbd_buildtag.c: $(filter-out drbd_buildtag.o,$(drbd-y))
++$(obj)/drbd_buildtag.c: $(addprefix $(obj)/,$(filter-out drbd_buildtag.o,$(drbd-y)))
+ 	@$(kecho) '  GEN     $@ $(echo-why)'
+ 	@set -e; exec > $@.new;							\
+ 	echo -e "/* automatically generated. DO NOT EDIT. */";			\
+diff --git a/drbd/Makefile b/drbd/Makefile
+index 5f768fc6..f9e8792a 100644
+--- a/drbd/Makefile
++++ b/drbd/Makefile
+@@ -102,9 +102,7 @@ else
+ 
+   kbuild:
+ 	@rm -f .drbd_kernelrelease*
+-    # previous to 2.6.6 (suse: 2.6.5-dunno), this should be:
+-	$(MAKE) -C $(KDIR)  $(if $(O),O=$(O),) SUBDIRS=$(DRBDSRC) $(ARCH_UM) modules
+-# $(MAKE) -C $(KDIR) M=$(DRBDSRC) $(ARCH_UM) modules
++	$(MAKE) -C $(KDIR)  $(if $(O),O=$(O),) M=$(DRBDSRC) $(ARCH_UM) modules
+ 	-mv .drbd_kernelrelease.new .drbd_kernelrelease
+ 	@echo -n "Memorizing module configuration ... "
+ 	@config=$$( (for x in $(KDIR)/.config $(O)/.config ; do \
+-- 
+2.20.0
+
diff --git a/meta-networking/recipes-support/drbd/drbd_9.0.17-1.bb b/meta-networking/recipes-support/drbd/drbd_9.0.17-1.bb
index d6750ab2f..1eada269c 100644
--- a/meta-networking/recipes-support/drbd/drbd_9.0.17-1.bb
+++ b/meta-networking/recipes-support/drbd/drbd_9.0.17-1.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 DEPENDS = "virtual/kernel"
 
 SRC_URI = "http://www.linbit.com/downloads/drbd/9.0/drbd-${PV}.tar.gz \
-           file://check_existence_of_modules_before_installing.patch"
+           file://check_existence_of_modules_before_installing.patch \
+           file://0001-drbd-kbuild-fix-use-M-don-t-forget-addprefix-obj.patch \
+           "
 
 SRC_URI[md5sum] = "ae8d5030760b2820a4b3e250447890a0"
 SRC_URI[sha256sum] = "86dd6cc0fdc8123056a3bb67a634cd7ba62a7b05b23caab9995cce7730891da8"
-- 
2.20.0


