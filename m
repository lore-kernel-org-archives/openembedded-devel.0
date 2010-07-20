Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <zlo@zlo.nu>)
	id 1Ob7ej-0002Ad-64 for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 09:54:29 +0200
Received: from localhost.localdomain (seven.iphion.nl [80.255.245.169])
	by mzh.zlo.nu (Postfix) with ESMTP id 46F861414B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 09:54:13 +0200 (CEST)
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Jul 2010 09:54:09 +0200
Message-Id: <1279612450-16776-2-git-send-email-zlo@zlo.nu>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <20100720073237.GA10185@zlo.nu>
References: <20100720073237.GA10185@zlo.nu>
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: zlo@zlo.nu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] libpng: Clean up separate -native recipes, making use of BBCLASSEXTEND.
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
X-List-Received-Date: Tue, 20 Jul 2010 07:54:30 -0000

From: Marc Olzheim <marc@iphion.nl>

---
 recipes/libpng/libpng-native.inc       |    5 -----
 recipes/libpng/libpng-native_1.2.37.bb |    6 ------
 recipes/libpng/libpng-native_1.2.40.bb |    9 ---------
 recipes/libpng/libpng-native_1.2.41.bb |    6 ------
 recipes/libpng/libpng-native_1.2.42.bb |    6 ------
 recipes/libpng/libpng.inc              |    5 ++++-
 6 files changed, 4 insertions(+), 33 deletions(-)
 delete mode 100644 recipes/libpng/libpng-native.inc
 delete mode 100644 recipes/libpng/libpng-native_1.2.37.bb
 delete mode 100644 recipes/libpng/libpng-native_1.2.40.bb
 delete mode 100644 recipes/libpng/libpng-native_1.2.41.bb
 delete mode 100644 recipes/libpng/libpng-native_1.2.42.bb

diff --git a/recipes/libpng/libpng-native.inc b/recipes/libpng/libpng-native.inc
deleted file mode 100644
index a515346..0000000
--- a/recipes/libpng/libpng-native.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-inherit native
-
-DEPENDS = "zlib-native"
-
-INHIBIT_NATIVE_STAGE_INSTALL = "1"
diff --git a/recipes/libpng/libpng-native_1.2.37.bb b/recipes/libpng/libpng-native_1.2.37.bb
deleted file mode 100644
index 3c36b52..0000000
--- a/recipes/libpng/libpng-native_1.2.37.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require libpng_${PV}.bb
-require libpng-native.inc
-
-PR = "r1"
-
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libpng-${PV}"
diff --git a/recipes/libpng/libpng-native_1.2.40.bb b/recipes/libpng/libpng-native_1.2.40.bb
deleted file mode 100644
index 6f0222d..0000000
--- a/recipes/libpng/libpng-native_1.2.40.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require libpng_${PV}.bb
-require libpng-native.inc
-
-PR = "r1"
-
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libpng-${PV}"
-
-SRC_URI[tarball.md5sum] = "29bbd1c3cbe54b04bfc2bda43067ccb5"
-SRC_URI[tarball.sha256sum] = "a6197352ad5b79a9a1ce0dd59f5e737cfbf909e0f3c5f64631cf0d93549e4e40"
diff --git a/recipes/libpng/libpng-native_1.2.41.bb b/recipes/libpng/libpng-native_1.2.41.bb
deleted file mode 100644
index 3c36b52..0000000
--- a/recipes/libpng/libpng-native_1.2.41.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require libpng_${PV}.bb
-require libpng-native.inc
-
-PR = "r1"
-
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libpng-${PV}"
diff --git a/recipes/libpng/libpng-native_1.2.42.bb b/recipes/libpng/libpng-native_1.2.42.bb
deleted file mode 100644
index 3c36b52..0000000
--- a/recipes/libpng/libpng-native_1.2.42.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require libpng_${PV}.bb
-require libpng-native.inc
-
-PR = "r1"
-
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libpng-${PV}"
diff --git a/recipes/libpng/libpng.inc b/recipes/libpng/libpng.inc
index fc1feb8..052e7bf 100644
--- a/recipes/libpng/libpng.inc
+++ b/recipes/libpng/libpng.inc
@@ -5,13 +5,16 @@ SECTION = "libs"
 PRIORITY = "required"
 DEPENDS = "zlib"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/libpng-${PV}.tar.bz2;name=tarball"
 S = "${WORKDIR}/libpng-${PV}"
 
 inherit autotools pkgconfig binconfig
 
+BBCLASSEXTEND = "native"
+INHIBIT_NATIVE_STAGE_INSTALL = "1"
+
 PACKAGES =+ "libpng3 libpng12"
 
 FILES_libpng3 = "${libdir}/libpng.so.*"
-- 
1.7.0.4



