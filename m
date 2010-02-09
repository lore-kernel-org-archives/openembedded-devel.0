Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Neu5R-0007d1-GE
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 18:41:24 +0100
Received: (qmail 9406 invoked by uid 813007); 9 Feb 2010 17:38:50 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 9 Feb 2010 17:38:50 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Feb 2010 18:38:17 +0100
Message-Id: <1265737098-5430-2-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1265737098-5430-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1265737098-5430-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/3] gcc csl 2007q3: import header hack from Poky to get glibc 2.5 built
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
X-List-Received-Date: Tue, 09 Feb 2010 17:41:25 -0000

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb    |    6 ++++++
 .../gcc/gcc-cross-intermediate_csl-arm-2007q3.bb   |    6 ++++++
 recipes/gcc/gcc-cross_csl-arm-2007q3.bb            |    2 +-
 recipes/gcc/gcc_csl-arm-2007q3.bb                  |    2 +-
 4 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb b/recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb
index c9f03a7..cfa64dc 100644
--- a/recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb
+++ b/recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb
@@ -4,3 +4,9 @@ require gcc-cross-initial.inc
 S = "${WORKDIR}/gcc-4.2"
 
 EXTRA_OECONF += "--disable-libssp --disable-bootstrap --disable-libgomp --disable-libmudflap "
+
+# Hack till we fix *libc properly
+do_install_append() {
+	ln -sf ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include/
+}
+
diff --git a/recipes/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb b/recipes/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb
index 5423626..3532590 100644
--- a/recipes/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb
+++ b/recipes/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb
@@ -4,3 +4,9 @@ require gcc-cross-intermediate.inc
 S = "${WORKDIR}/gcc-4.2"
 
 EXTRA_OECONF += "--disable-libssp --disable-bootstrap --disable-libgomp --disable-libmudflap "
+
+# Hack till we fix *libc properly
+do_install_append() {
+	ln -sf ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include/
+}
+
diff --git a/recipes/gcc/gcc-cross_csl-arm-2007q3.bb b/recipes/gcc/gcc-cross_csl-arm-2007q3.bb
index 34bd251..adf7f5a 100644
--- a/recipes/gcc/gcc-cross_csl-arm-2007q3.bb
+++ b/recipes/gcc/gcc-cross_csl-arm-2007q3.bb
@@ -1,4 +1,4 @@
-PR = "r5"
+PR = "r6"
 
 require gcc-csl-arm-2007q3.inc
 require gcc-cross4.inc
diff --git a/recipes/gcc/gcc_csl-arm-2007q3.bb b/recipes/gcc/gcc_csl-arm-2007q3.bb
index cc7540a..2df12ef 100644
--- a/recipes/gcc/gcc_csl-arm-2007q3.bb
+++ b/recipes/gcc/gcc_csl-arm-2007q3.bb
@@ -1,4 +1,4 @@
-PR = "r3"
+PR = "r4"
 
 require gcc-${PV}.inc
 require gcc-configure-target.inc
-- 
1.6.6.1





