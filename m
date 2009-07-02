Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MMOdT-0001la-4J
	for openembedded-devel@openembedded.org; Thu, 02 Jul 2009 17:55:43 +0200
Received: (qmail 23669 invoked by uid 813007); 2 Jul 2009 15:43:41 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 2 Jul 2009 15:43:41 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jul 2009 17:43:49 +0200
Message-Id: <1246549429-13756-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.3
Cc: Marcin Juszkiewicz <marcin@buglabs.net>
Subject: [STABLE][PATCH] classpath: depend on gmp (for libjavamath) and do not use system one
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
X-List-Received-Date: Thu, 02 Jul 2009 15:55:43 -0000

From: Marcin Juszkiewicz <marcin@buglabs.net>

Signed-off-by: Marcin Juszkiewicz <marcin@buglabs.net>

---
 recipes/classpath/classpath.inc       |    2 +-
 recipes/classpath/classpath_0.98.bb   |    3 ++-
 recipes/classpath/files/fix-gmp.patch |   19 +++++++++++++++++++
 3 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 recipes/classpath/files/fix-gmp.patch

diff --git a/recipes/classpath/classpath.inc b/recipes/classpath/classpath.inc
index da3273b..bf630bf 100644
--- a/recipes/classpath/classpath.inc
+++ b/recipes/classpath/classpath.inc
@@ -5,7 +5,7 @@ PRIORITY = "optional"
 LICENSE = "Classpath"
 PBN = "classpath"
 
-DEPENDS = "virtual/javac-native fastjar-native zip-native"
+DEPENDS = "virtual/javac-native fastjar-native zip-native gmp"
 RPROVIDES = ""
 
 RDEPENDS_${PN} = "${PBN}-common (>= ${PV})"
diff --git a/recipes/classpath/classpath_0.98.bb b/recipes/classpath/classpath_0.98.bb
index 292c49f..13f7a72 100644
--- a/recipes/classpath/classpath_0.98.bb
+++ b/recipes/classpath/classpath_0.98.bb
@@ -4,9 +4,10 @@ SRC_URI += "\
   file://SimpleName.diff;patch=1;pnum=0 \
   file://ecj_java_dir.patch;patch=1 \
   file://autotools.patch;patch=1 \
+  file://fix-gmp.patch;patch=1 \
   "
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS += "gtk+ gconf libxtst"
 
diff --git a/recipes/classpath/files/fix-gmp.patch b/recipes/classpath/files/fix-gmp.patch
new file mode 100644
index 0000000..3f0dfbe
--- /dev/null
+++ b/recipes/classpath/files/fix-gmp.patch
@@ -0,0 +1,19 @@
+---
+ configure.ac |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- classpath-0.98.orig/configure.ac
++++ classpath-0.98/configure.ac
+@@ -766,11 +766,11 @@ if test "x${COMPILE_JNI}" = xyes; then
+   dnl __gmpz_mul_si for earlier versions (>= 3.1).
+   dnl IMPORTANT: if you decide to look for __gmpz_combit, don't forget to
+   dnl change the name of the corresponding ac_ variable on lines 860...
+   if test "x${COMPILE_GMP}" = xyes; then
+     AC_CHECK_LIB(gmp, __gmpz_mul_si,
+-      [GMP_CFLAGS=-I/usr/include
++      [GMP_CFLAGS=
+        GMP_LIBS=-lgmp ],
+       [GMP_CFLAGS=
+        GMP_LIBS= ])
+     AC_SUBST(GMP_CFLAGS)
+     AC_SUBST(GMP_LIBS)
-- 
1.6.3.3





