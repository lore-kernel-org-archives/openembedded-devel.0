Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM58S-00039F-5f
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:06:24 +0200
Received: (qmail 30284 invoked by uid 813007); 1 Jul 2009 18:54:28 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 18:54:28 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 20:54:10 +0200
Message-Id: <1246474461-16671-4-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <200907011817.02564.marcin@juszkiewicz.com.pl>
References: <200907011817.02564.marcin@juszkiewicz.com.pl>
Subject: [STABLE][PATCH 009/125] qemu: add version 0.10.3, initial
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
X-List-Received-Date: Wed, 01 Jul 2009 19:06:24 -0000

From: Roman I Khimov <khimov@altell.ru>

Finally not requiring GCC3. Added with masked preference, need to carefully
sort out and apply OE's patches.

Acked-by: Tom Rini <trini@embeddedalley.com>
Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/qemu/qemu-native.inc         |    5 +----
 recipes/qemu/qemu-native_0.10.3.bb   |    2 ++
 recipes/qemu/qemu-native_0.9.1.bb    |    3 +++
 recipes/qemu/qemu-native_20070613.bb |    3 ++-
 recipes/qemu/qemu-native_cvs.bb      |    3 +++
 recipes/qemu/qemu-native_svn.bb      |    3 +++
 recipes/qemu/qemu_0.10.3.bb          |   22 ++++++++++++++++++++++
 7 files changed, 36 insertions(+), 5 deletions(-)
 create mode 100644 recipes/qemu/qemu-native_0.10.3.bb
 create mode 100644 recipes/qemu/qemu_0.10.3.bb

diff --git a/recipes/qemu/qemu-native.inc b/recipes/qemu/qemu-native.inc
index 3e6433c..e4064a2 100644
--- a/recipes/qemu/qemu-native.inc
+++ b/recipes/qemu/qemu-native.inc
@@ -1,6 +1,3 @@
 inherit native
 
-DEPENDS = "libsdl-native zlib-native gcc3-native"
-
-require qemu-gcc3-check.inc
-
+DEPENDS = "libsdl-native zlib-native"
diff --git a/recipes/qemu/qemu-native_0.10.3.bb b/recipes/qemu/qemu-native_0.10.3.bb
new file mode 100644
index 0000000..16984a3
--- /dev/null
+++ b/recipes/qemu/qemu-native_0.10.3.bb
@@ -0,0 +1,2 @@
+require qemu_${PV}.bb
+require qemu-native.inc
diff --git a/recipes/qemu/qemu-native_0.9.1.bb b/recipes/qemu/qemu-native_0.9.1.bb
index 16984a3..4c418f6 100644
--- a/recipes/qemu/qemu-native_0.9.1.bb
+++ b/recipes/qemu/qemu-native_0.9.1.bb
@@ -1,2 +1,5 @@
 require qemu_${PV}.bb
 require qemu-native.inc
+require qemu-gcc3-check.inc
+
+DEPENDS += "gcc3-native"
diff --git a/recipes/qemu/qemu-native_20070613.bb b/recipes/qemu/qemu-native_20070613.bb
index dc9852b..4c418f6 100644
--- a/recipes/qemu/qemu-native_20070613.bb
+++ b/recipes/qemu/qemu-native_20070613.bb
@@ -1,4 +1,5 @@
 require qemu_${PV}.bb
 require qemu-native.inc
+require qemu-gcc3-check.inc
 
-
+DEPENDS += "gcc3-native"
diff --git a/recipes/qemu/qemu-native_cvs.bb b/recipes/qemu/qemu-native_cvs.bb
index c9db5e3..51e6028 100644
--- a/recipes/qemu/qemu-native_cvs.bb
+++ b/recipes/qemu/qemu-native_cvs.bb
@@ -1,2 +1,5 @@
 require qemu_cvs.bb
 require qemu-native.inc
+require qemu-gcc3-check.inc
+
+DEPENDS += "gcc3-native"
diff --git a/recipes/qemu/qemu-native_svn.bb b/recipes/qemu/qemu-native_svn.bb
index 1e3a4db..b530bbd 100644
--- a/recipes/qemu/qemu-native_svn.bb
+++ b/recipes/qemu/qemu-native_svn.bb
@@ -1,2 +1,5 @@
 require qemu_svn.bb
 require qemu-native.inc
+require qemu-gcc3-check.inc
+
+DEPENDS += "gcc3-native"
diff --git a/recipes/qemu/qemu_0.10.3.bb b/recipes/qemu/qemu_0.10.3.bb
new file mode 100644
index 0000000..d6ad1d7
--- /dev/null
+++ b/recipes/qemu/qemu_0.10.3.bb
@@ -0,0 +1,22 @@
+LICENSE = "GPL"
+DEPENDS = "zlib"
+
+# Need to port OE patches there
+DEFAULT_PREFERENCE = "-1"
+
+FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
+FILESDIR = "${WORKDIR}"
+
+SRC_URI = "\
+    http://download.savannah.gnu.org/releases/qemu/qemu-${PV}.tar.gz \
+    "
+
+S = "${WORKDIR}/qemu-${PV}"
+
+EXTRA_OECONF += "--disable-gfx-check"
+
+inherit autotools
+
+do_configure() {
+	${S}/configure --prefix=${prefix} ${EXTRA_OECONF}
+}
-- 
1.6.3.1





