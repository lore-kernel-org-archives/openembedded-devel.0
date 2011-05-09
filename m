Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1QJKxY-0004n7-Cn
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 09:32:52 +0200
Received: from [2001:638:602:1183:4da:ff61:f5c:b7b4] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1QJKuu-0007cx-7B by authid <stefan@sostec.de> with srv_auth_cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 09:30:10 +0200
Received: from stefan by excalibur.local with local (Exim 4.75)
	(envelope-from <stefan@excalibur.local>) id 1QJKut-00011R-45
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 09:30:07 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 May 2011 09:30:06 +0200
Message-Id: <3cf29cfac4a64afbc67a3a1de7aecab64ffad9d3.1304925139.git.stefan@buglabs.net>
X-Mailer: git-send-email 1.7.5.1
In-Reply-To: <cover.1304925139.git.stefan@buglabs.net>
References: <cover.1304925139.git.stefan@buglabs.net>
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: [PATCH 2011.03-maintenance 3/7] ecj: for ecj-initial 512 mb heapsize is okay for ecj-bootstrap we need 1024
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
X-List-Received-Date: Mon, 09 May 2011 07:32:52 -0000

From: Henning Heinold <h.heinold@tarent.de>

Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 recipes/ecj/ecj-bootstrap-native.bb |    2 +-
 recipes/ecj/ecj-initial.bb          |    6 +++---
 recipes/ecj/files/ecj-initial.in    |    1 +
 recipes/ecj/files/ecj.in            |    2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)
 create mode 100755 recipes/ecj/files/ecj-initial.in

diff --git a/recipes/ecj/ecj-bootstrap-native.bb b/recipes/ecj/ecj-bootstrap-native.bb
index 594b08c..bdb9797 100644
--- a/recipes/ecj/ecj-bootstrap-native.bb
+++ b/recipes/ecj/ecj-bootstrap-native.bb
@@ -17,7 +17,7 @@ SRC_URI = "file://ecj.in"
 
 S = "${WORKDIR}"
 
-PR = "r2"
+PR = "r3"
 
 JAR = "ecj-bootstrap.jar"
 
diff --git a/recipes/ecj/ecj-initial.bb b/recipes/ecj/ecj-initial.bb
index 8ddbc7c..1809cd6 100644
--- a/recipes/ecj/ecj-initial.bb
+++ b/recipes/ecj/ecj-initial.bb
@@ -9,9 +9,9 @@ LICENSE = "EPL"
 
 DEPENDS = "libecj-bootstrap"
 
-PR = "r1"
+PR = "r2"
 
-SRC_URI = "file://ecj.in"
+SRC_URI = "file://ecj-initial.in"
 
 NATIVE_INSTALL_WORKS = "1"
 
@@ -26,7 +26,7 @@ do_compile() {
   echo "#!/bin/sh" > ecj-initial
   echo "ECJ_JAR=${STAGING_DATADIR}/java/${JAR}" >> ecj-initial
   echo "RUNTIME=java-initial" >> ecj-initial
-  cat ecj.in >> ecj-initial
+  cat ecj-initial.in >> ecj-initial
 }
 
 do_install() {
diff --git a/recipes/ecj/files/ecj-initial.in b/recipes/ecj/files/ecj-initial.in
new file mode 100755
index 0000000..2099991
--- /dev/null
+++ b/recipes/ecj/files/ecj-initial.in
@@ -0,0 +1 @@
+${RUNTIME} -Xmx512m -cp ${ECJ_JAR} org.eclipse.jdt.internal.compiler.batch.Main ${1+"$@"}
diff --git a/recipes/ecj/files/ecj.in b/recipes/ecj/files/ecj.in
index 2099991..2cff259 100755
--- a/recipes/ecj/files/ecj.in
+++ b/recipes/ecj/files/ecj.in
@@ -1 +1 @@
-${RUNTIME} -Xmx512m -cp ${ECJ_JAR} org.eclipse.jdt.internal.compiler.batch.Main ${1+"$@"}
+${RUNTIME} -Xmx1024m -cp ${ECJ_JAR} org.eclipse.jdt.internal.compiler.batch.Main ${1+"$@"}
-- 
1.7.5.1



