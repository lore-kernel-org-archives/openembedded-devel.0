Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1Q4TGR-0000zW-QY
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 09:22:55 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 53A79491283;
	Tue, 29 Mar 2011 09:00:34 +0200 (CEST)
Received: from mobil-400-586.intern.dresearch.de ([10.32.11.62]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 29 Mar 2011 09:00:34 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Mar 2011 09:00:28 +0200
Message-Id: <1301382028-10848-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.3.4
X-OriginalArrivalTime: 29 Mar 2011 07:00:34.0311 (UTC)
	FILETIME=[FFF74970:01CBEDDE]
Subject: [PATCH] linux-2.6.24: allow building kernel with newer GNU make
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
X-List-Received-Date: Tue, 29 Mar 2011 07:22:56 -0000

GNU make >= 3.82 does not allow mixed implicit and normal rules

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 .../linux-libc-headers-2.6.24/make-3.82.patch      |   29 ++++++++++++++++++++
 .../linux-libc-headers_2.6.24.bb                   |    3 +-
 recipes/linux/linux-2.6.24/make-3.82.patch         |   29 ++++++++++++++++++++
 recipes/linux/linux_2.6.24.bb                      |    3 +-
 4 files changed, 62 insertions(+), 2 deletions(-)
 create mode 100644 recipes/linux-libc-headers/linux-libc-headers-2.6.24/make-3.82.patch
 create mode 100644 recipes/linux/linux-2.6.24/make-3.82.patch

diff --git a/recipes/linux-libc-headers/linux-libc-headers-2.6.24/make-3.82.patch b/recipes/linux-libc-headers/linux-libc-headers-2.6.24/make-3.82.patch
new file mode 100644
index 0000000..99896d9
--- /dev/null
+++ b/recipes/linux-libc-headers/linux-libc-headers-2.6.24/make-3.82.patch
@@ -0,0 +1,29 @@
+diff -Nurd linux-2.6.24.orig//Makefile linux-2.6.24/Makefile
+--- linux-2.6.24.orig//Makefile	2011-03-29 07:56:05.122449521 +0200
++++ linux-2.6.24/Makefile	2011-03-29 07:57:48.726768621 +0200
+@@ -431,7 +431,11 @@
+ include $(srctree)/arch/$(SRCARCH)/Makefile
+ export KBUILD_DEFCONFIG
+ 
+-config %config: scripts_basic outputmakefile FORCE
++config: scripts_basic outputmakefile FORCE
++	$(Q)mkdir -p include/linux include/config
++	$(Q)$(MAKE) $(build)=scripts/kconfig $@
++
++%config: scripts_basic outputmakefile FORCE
+ 	$(Q)mkdir -p include/linux include/config
+ 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
+ 
+@@ -1500,7 +1504,11 @@
+ 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
+ 
+ # Modules
+-/ %/: prepare scripts FORCE
++/: prepare scripts FORCE
++	$(cmd_crmodverdir)
++	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
++	$(build)=$(build-dir)
++%/: prepare scripts FORCE
+ 	$(cmd_crmodverdir)
+ 	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
+ 	$(build)=$(build-dir)
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
index e95299b..9c683a7 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
@@ -2,11 +2,12 @@ require linux-libc-headers.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
            file://procinfo.h \
            file://export_falloc_h.patch \
+           file://make-3.82.patch \
            file://unifdef.patch"
 
 S = "${WORKDIR}/linux-${PV}"
diff --git a/recipes/linux/linux-2.6.24/make-3.82.patch b/recipes/linux/linux-2.6.24/make-3.82.patch
new file mode 100644
index 0000000..99896d9
--- /dev/null
+++ b/recipes/linux/linux-2.6.24/make-3.82.patch
@@ -0,0 +1,29 @@
+diff -Nurd linux-2.6.24.orig//Makefile linux-2.6.24/Makefile
+--- linux-2.6.24.orig//Makefile	2011-03-29 07:56:05.122449521 +0200
++++ linux-2.6.24/Makefile	2011-03-29 07:57:48.726768621 +0200
+@@ -431,7 +431,11 @@
+ include $(srctree)/arch/$(SRCARCH)/Makefile
+ export KBUILD_DEFCONFIG
+ 
+-config %config: scripts_basic outputmakefile FORCE
++config: scripts_basic outputmakefile FORCE
++	$(Q)mkdir -p include/linux include/config
++	$(Q)$(MAKE) $(build)=scripts/kconfig $@
++
++%config: scripts_basic outputmakefile FORCE
+ 	$(Q)mkdir -p include/linux include/config
+ 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
+ 
+@@ -1500,7 +1504,11 @@
+ 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
+ 
+ # Modules
+-/ %/: prepare scripts FORCE
++/: prepare scripts FORCE
++	$(cmd_crmodverdir)
++	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
++	$(build)=$(build-dir)
++%/: prepare scripts FORCE
+ 	$(cmd_crmodverdir)
+ 	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
+ 	$(build)=$(build-dir)
diff --git a/recipes/linux/linux_2.6.24.bb b/recipes/linux/linux_2.6.24.bb
index 5c05593..5cc686a 100644
--- a/recipes/linux/linux_2.6.24.bb
+++ b/recipes/linux/linux_2.6.24.bb
@@ -11,7 +11,7 @@ DEFAULT_PREFERENCE_hipox = "1"
 DEFAULT_PREFERENCE_cs-e9302 = "1"
 DEFAULT_PREFERENCE_smartq5 = "1"
 
-PR = "r36"
+PR = "r37"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.24.tar.bz2;name=kernel \
            ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.7.bz2;apply=yes;name=stablepatch \
@@ -19,6 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.24.tar.bz2;name=k
            file://ubifs-v2.6.24.patch \
            file://ubifs-v2.6.24-silent-get-sb.patch \
            file://cfi-amic.patch \
+           file://make-3.82.patch \
            file://defconfig"
 
 # Moved away temporarely until committed properly (work in progress).
-- 
1.7.3.4



