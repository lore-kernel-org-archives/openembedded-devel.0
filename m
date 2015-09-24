Return-Path: <reinette.chatre@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2EFE7734DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2015 22:00:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 24 Sep 2015 15:00:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,583,1437462000"; d="scan'208";a="796759184"
Received: from rchatre-builder.jf.intel.com ([10.54.39.14])
	by fmsmga001.fm.intel.com with ESMTP; 24 Sep 2015 15:00:33 -0700
From: Reinette Chatre <reinette.chatre@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Sep 2015 15:03:01 -0700
Message-Id: <afe681777baf3d8d15de8c4540617a03e2fa9f50.1443131652.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.4.3
Subject: [meta-oe][PATCH] polkit: fix relocation of polkit binaries
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
X-List-Received-Date: Thu, 24 Sep 2015 22:00:37 -0000

Polkit is currently broken in images built with multilib and systemd.
This is because the patch, 0001-do-not-hardcoded-libdir.patch, applied on
top of the polkit source code modifies where the polkitd binary is
installed, but it does not modify the polkit.service file to start the
binary from its new location.

At first it seemed reasonable to modify the systemd service file to
search for the binary in the correct place. This change, as well as what
the patch (0001-do-not-hardcoded-libdir.patch) already does was proposed to
the polkit maintainers at https://bugs.freedesktop.org/show_bug.cgi?id=92094

During the discussion with the polkit maintainers it became apparent that the
change to support multilib polkit should not be done with a patch to
the polkit source code, but instead a change to the polkit recipe.

Polkit correctly installs libraries when multilib is in use without any
changes to its source code. What is being changed by
0001-do-not-hardcoded-libdir.patch is not where the polkit libraries are
installed but where the binaries are installed.

Installing binaries in /usr/lib when baselib is lib64 is acceptable (see
http://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch04s06.html ).

So, instead of patching polkit to install its binaries under the same
library directory as its libraries we maintain the design of the polkit
installer to install the binaries in /usr/lib. This is the same as what is
done in distros like Fedora that supports multilib.

With this patch the polkit package, when built with multilib, installs
files into /usr/lib* as follows:
polkit/usr/lib64/libpolkit-agent-1.so.0
polkit/usr/lib64/libpolkit-gobject-1.so.0
polkit/usr/lib64/libpolkit-gobject-1.so.0.0.0
polkit/usr/lib64/libpolkit-agent-1.so.0.0.0
polkit/usr/lib
polkit/usr/lib/polkit-1
polkit/usr/lib/polkit-1/polkitd
polkit/usr/lib/polkit-1/polkit-agent-helper-1

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---
 .../polkit/0001-do-not-hardcoded-libdir.patch      | 44 ----------------------
 meta-oe/recipes-extended/polkit/polkit_0.113.bb    |  5 ++-
 2 files changed, 3 insertions(+), 46 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-libdir.patch

diff --git a/meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-libdir.patch b/meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-libdir.patch
deleted file mode 100644
index e605e30..0000000
--- a/meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-libdir.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From c9e09d9b101109832b1dcb050f0c8b588e276686 Mon Sep 17 00:00:00 2001
-From: Zhenhua Luo <zhenhua.luo@freescale.com>
-Date: Mon, 4 May 2015 04:11:27 -0500
-Subject: [PATCH] do not hardcoded libdir
-
-Upstream-Status: Pending
-
-libdir is hardcoded to ${prefix}/lib, but we want it to support multilib
-
-Signed-off-by: Chunrong Guo <B40290@freescale.com>
----
- polkitagent/Makefile.am   | 2 +-
- polkitbackend/Makefile.am | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/polkitagent/Makefile.am b/src/polkitagent/Makefile.am
-index 3bc364e..7d1ac0e 100644
---- a/src/polkitagent/Makefile.am
-+++ b/src/polkitagent/Makefile.am
-@@ -78,7 +78,7 @@ libpolkit_agent_1_la_LIBADD =                               		\
- 
- libpolkit_agent_1_la_LDFLAGS = -export-symbols-regex '(^polkit_.*)'
- 
--libprivdir = $(prefix)/lib/polkit-1
-+libprivdir = $(libdir)/polkit-1
- libpriv_PROGRAMS = polkit-agent-helper-1
- 
- polkit_agent_helper_1_SOURCES = 					\
-diff --git a/src/polkitbackend/Makefile.am b/src/polkitbackend/Makefile.am
-index 9f430d0..1f7610b 100644
---- a/src/polkitbackend/Makefile.am
-+++ b/src/polkitbackend/Makefile.am
-@@ -67,7 +67,7 @@ rules_DATA = 50-default.rules
- 
- # ----------------------------------------------------------------------------------------------------
- 
--libprivdir = $(prefix)/lib/polkit-1
-+libprivdir = $(libdir)/polkit-1
- libpriv_PROGRAMS = polkitd
- 
- polkitd_SOURCES = 							\
--- 
-2.3.3
-
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.113.bb b/meta-oe/recipes-extended/polkit/polkit_0.113.bb
index 29e8896..b85122e 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.113.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.113.bb
@@ -20,7 +20,6 @@ PACKAGECONFIG[consolekit] = ",,,consolekit"
 PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
-           file://0001-do-not-hardcoded-libdir.patch \
 "
 SRC_URI[md5sum] = "4b77776c9e4f897dcfe03b2c34198edf"
 SRC_URI[sha256sum] = "e1c095093c654951f78f8618d427faf91cf62abdefed98de40ff65eca6413c81"
@@ -31,10 +30,12 @@ PACKAGES =+ "${PN}-examples"
 
 FILES_${PN} += " \
     ${libdir}/${BPN}-1 \
+    ${nonarch_libdir}/${BPN}-1 \
     ${datadir}/dbus-1 \
     ${datadir}/${BPN}-1 \
 "
-FILES_${PN}-dbg += "${libdir}/${BPN}-1/.debug"
+FILES_${PN}-dbg += "${libdir}/${BPN}-1/.debug \
+                    ${nonarch_libdir}/${BPN}-1/.debug"
 
 FILES_${PN}-examples = "${bindir}/*example*"
 
-- 
2.4.3


