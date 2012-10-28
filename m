Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TSV97-0005gn-Kh
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Oct 2012 16:51:29 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Oct 2012 08:37:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,667,1344236400"; d="scan'208";a="239506787"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.101])
	by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2012 08:37:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Oct 2012 15:37:23 +0000
Message-Id: <f50202f2b4ce57a8d2bd59e9ec49fbf77fe6d037.1351438401.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1351438401.git.paul.eggleton@linux.intel.com>
References: <cover.1351438401.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1351438401.git.paul.eggleton@linux.intel.com>
References: <cover.1351438401.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 2/4] Remove NATIVE_INSTALL_WORKS
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
X-List-Received-Date: Sun, 28 Oct 2012 15:51:30 -0000

This variable is no longer used with OE-Core.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../fakeroot/fakeroot-native_1.12.4.bb             |    2 --
 meta-oe/recipes-devtools/lemon/lemon.inc           |    1 -
 .../mercurial/mercurial-native_1.9.bb              |    1 -
 .../python/python-cheetah_2.4.4.bb                 |    1 -
 .../recipes-devtools/python/python-docutils_0.5.bb |    1 -
 .../recipes-support/mysql/mysql5-native_5.1.40.bb  |    2 --
 .../samsung-soc-utils/sjf2410-linux-native_svn.bb  |    2 --
 7 files changed, 10 deletions(-)

diff --git a/meta-oe/recipes-core/fakeroot/fakeroot-native_1.12.4.bb b/meta-oe/recipes-core/fakeroot/fakeroot-native_1.12.4.bb
index e6add2b..3bcebab 100644
--- a/meta-oe/recipes-core/fakeroot/fakeroot-native_1.12.4.bb
+++ b/meta-oe/recipes-core/fakeroot/fakeroot-native_1.12.4.bb
@@ -13,8 +13,6 @@ python () {
         bb.data.setVar('EXTRA_OECONF', ' --with-ipc=tcp --program-prefix= ', d)
 }
 
-NATIVE_INSTALL_WORKS = "1"
-
 RDEPENDS_${PN} = "util-linux-native"
 
 SRC_URI[md5sum] = "aaefede2405a40c87438e7e833d69b70"
diff --git a/meta-oe/recipes-devtools/lemon/lemon.inc b/meta-oe/recipes-devtools/lemon/lemon.inc
index 48d93ee..9a8d3ab 100644
--- a/meta-oe/recipes-devtools/lemon/lemon.inc
+++ b/meta-oe/recipes-devtools/lemon/lemon.inc
@@ -23,4 +23,3 @@ do_install() {
 
 BBCLASSEXTEND = "native"
 
-NATIVE_INSTALL_WORKS = "1"
diff --git a/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb b/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb
index b4438a3..facf554 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb
@@ -21,4 +21,3 @@ do_install () {
         oe_runmake -e install-bin DESTDIR=${D} PREFIX=${prefix}
 }
 
-NATIVE_INSTALL_WORKS = "1"
diff --git a/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb b/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
index b6f0d2c..967be31 100644
--- a/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
+++ b/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
@@ -14,7 +14,6 @@ inherit setuptools
 
 RDEPENDS_${PN} = "python-pickle python-pprint"
 
-NATIVE_INSTALL_WORKS = "1"
 BBCLASSEXTEND = "native"
 
 SRC_URI[md5sum] = "853917116e731afbc8c8a43c37e6ddba"
diff --git a/meta-oe/recipes-devtools/python/python-docutils_0.5.bb b/meta-oe/recipes-devtools/python/python-docutils_0.5.bb
index cdc488a..e4c8a7d 100644
--- a/meta-oe/recipes-devtools/python/python-docutils_0.5.bb
+++ b/meta-oe/recipes-devtools/python/python-docutils_0.5.bb
@@ -15,6 +15,5 @@ S = "${WORKDIR}/docutils-${PV}"
 
 inherit distutils
 
-NATIVE_INSTALL_WORKS = "1"
 BBCLASSEXTEND = "native"
 
diff --git a/meta-oe/recipes-support/mysql/mysql5-native_5.1.40.bb b/meta-oe/recipes-support/mysql/mysql5-native_5.1.40.bb
index 13a3489..e4be1fb 100644
--- a/meta-oe/recipes-support/mysql/mysql5-native_5.1.40.bb
+++ b/meta-oe/recipes-support/mysql/mysql5-native_5.1.40.bb
@@ -20,8 +20,6 @@ do_install() {
         install -m 0755 sql/gen_lex_hash ${D}${bindir}/
 }
 
-NATIVE_INSTALL_WORKS = "1"
-
 PSTAGING_DISABLED = "1"
 
 SRC_URI[md5sum] = "32e7373c16271606007374396e6742ad"
diff --git a/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb b/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb
index 15e11ac..9e0c087 100644
--- a/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb
+++ b/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb
@@ -15,8 +15,6 @@ do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_TOOLS}"
 
 CFLAGS += "-DLINUX_PPDEV"
 
-NATIVE_INSTALL_WORKS = "1"
-
 do_compile() {
 	oe_runmake
 }
-- 
1.7.9.5



