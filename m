Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Ryrq2-0006GE-EG
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Feb 2012 22:29:03 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id A4B1422325AC;
	Sat, 18 Feb 2012 22:20:48 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 1B06922325A7;
	Sat, 18 Feb 2012 22:20:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g229046026.adsl.alicedsl.de
	[92.229.46.26]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Sat, 18 Feb 2012 22:20:46 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 84B3F3C4B8; Sat, 18 Feb 2012 22:20:44 +0100 (CET)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Feb 2012 22:20:11 +0100
Message-Id: <1329600022-8027-2-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.9
In-Reply-To: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH 01/12][oe-classic] libbecj-bootstrap: use sort for build order of the javafiles and introduce INC_PR, backported from meta-java
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
X-List-Received-Date: Sat, 18 Feb 2012 21:29:03 -0000

* on some filesystems find orders the files to build not the
  right way, using sort seems to fix it, thanks Stefan Ring
  for the patch

* use INC_PR for better revision handling

Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 recipes/ecj/libecj-bootstrap.inc      |    4 +++-
 recipes/ecj/libecj-bootstrap_3.6.1.bb |    2 +-
 recipes/ecj/libecj-bootstrap_3.6.bb   |    2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes/ecj/libecj-bootstrap.inc b/recipes/ecj/libecj-bootstrap.inc
index 1adce62..bece3f0 100644
--- a/recipes/ecj/libecj-bootstrap.inc
+++ b/recipes/ecj/libecj-bootstrap.inc
@@ -6,6 +6,8 @@ LICENSE = "EPL"
 
 DEPENDS = "fastjar-native jikes-initial virtual/java-initial"
 
+INC_PR = "r1"
+
 inherit native java
 
 S = "${WORKDIR}"
@@ -48,7 +50,7 @@ do_unpackpost() {
 addtask unpackpost after do_unpack before do_patch
 
 do_compile() {
-  find source -name '*.java' > sourcefiles
+  find source -name '*.java' | LC_ALL=C sort > sourcefiles
   split -l 25 sourcefiles ecj-sources.
 
   # Compiling in place is done because the sources contain
diff --git a/recipes/ecj/libecj-bootstrap_3.6.1.bb b/recipes/ecj/libecj-bootstrap_3.6.1.bb
index 66e3fc1..d5da24e 100644
--- a/recipes/ecj/libecj-bootstrap_3.6.1.bb
+++ b/recipes/ecj/libecj-bootstrap_3.6.1.bb
@@ -1,6 +1,6 @@
 require libecj-bootstrap.inc
 
-PR = "r0"
+PR = "${INC_PR}.0"
 
 SRC_URI = " \
 	   http://mirrors.ibiblio.org/pub/mirrors/eclipse/eclipse/downloads/drops/R-3.6.1-201009090800/ecjsrc-${PV}.zip \
diff --git a/recipes/ecj/libecj-bootstrap_3.6.bb b/recipes/ecj/libecj-bootstrap_3.6.bb
index faece53..a4a8b70 100644
--- a/recipes/ecj/libecj-bootstrap_3.6.bb
+++ b/recipes/ecj/libecj-bootstrap_3.6.bb
@@ -1,6 +1,6 @@
 require libecj-bootstrap.inc
 
-PR = "r0"
+PR = "${INC_PR}.0"
 
 SRC_URI = " \
 	   http://mirrors.ibiblio.org/pub/mirrors/eclipse/eclipse/downloads/drops/R-3.6-201006080911/ecjsrc-${PV}.zip \
-- 
1.7.9


