Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@mobil-400-586.intern.dresearch.de>)
	id 1R49eP-0001uo-MT for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 12:58:37 +0200
X-Envelope-From: sledz@mobil-400-586.intern.dresearch.de
Received: from mobil-400-586.intern.dresearch.de
	(pd95cbf07.dip0.t-ipconnect.de [217.92.191.7]) (authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p8FArQog005828
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 15 Sep 2011 12:53:26 +0200
Received: by mobil-400-586.intern.dresearch.de (Postfix, from userid 1000)
	id 1E7FBC3948; Thu, 15 Sep 2011 12:53:26 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Sep 2011 12:53:22 +0200
Message-Id: <1316084002-24149-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.3.4
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
Cc: paulepanter@users.sourceforge.net
Subject: [PATCH] linux-2.6.28: allow building with GNU make >= 3.82
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
X-List-Received-Date: Thu, 15 Sep 2011 10:58:37 -0000

GNU make >= 3.82 does not allow mixed implicit and normal rules

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/linux/linux-2.6.28/make-3.82.patch |   40 ++++++++++++++++++++++++++++
 recipes/linux/linux_2.6.28.bb              |    3 +-
 2 files changed, 42 insertions(+), 1 deletions(-)
 create mode 100644 recipes/linux/linux-2.6.28/make-3.82.patch

diff --git a/recipes/linux/linux-2.6.28/make-3.82.patch b/recipes/linux/linux-2.6.28/make-3.82.patch
new file mode 100644
index 0000000..c22717e
--- /dev/null
+++ b/recipes/linux/linux-2.6.28/make-3.82.patch
@@ -0,0 +1,40 @@
+linux-2.6.28: allow building with GNU make >= 3.82
+    
+GNU make >= 3.82 does not allow mixed implicit and normal rules
+
+Because linux-2.6.28 is superseded by newer versions it makes no sense
+to submit this patch upstream.
+
+Upstream-Status: Inappropriate [other]
+
+Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
+
+diff -Nurd linux-2.6.28.orig//Makefile linux-2.6.28/Makefile
+--- linux-2.6.28.orig//Makefile	2011-09-14 16:15:53.782945380 +0200
++++ linux-2.6.28/Makefile	2011-09-14 16:16:50.887123688 +0200
+@@ -439,7 +439,11 @@
+ include $(srctree)/arch/$(SRCARCH)/Makefile
+ export KBUILD_DEFCONFIG KBUILD_KCONFIG
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
+@@ -1607,7 +1611,11 @@
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
diff --git a/recipes/linux/linux_2.6.28.bb b/recipes/linux/linux_2.6.28.bb
index 9cbb15e..1356378 100644
--- a/recipes/linux/linux_2.6.28.bb
+++ b/recipes/linux/linux_2.6.28.bb
@@ -1,6 +1,6 @@
 require linux.inc
 
-PR = "r15"
+PR = "r16"
 
 # Mark archs/machines that this kernel supports
 DEFAULT_PREFERENCE = "-1"
@@ -18,6 +18,7 @@ DEFAULT_PREFERENCE_mini6410 = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.28.tar.bz2;name=kernel \
            ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.10.bz2;apply=yes;name=stablepatch \
+           file://make-3.82.patch \
            file://defconfig"
 
 SRC_URI_append_at91sam9263ek = " \
-- 
1.7.3.4



