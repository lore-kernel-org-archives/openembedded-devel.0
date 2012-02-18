Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Ryrq6-0006H9-ER
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Feb 2012 22:29:06 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id D8D7322325AA;
	Sat, 18 Feb 2012 22:20:52 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 2D68622325A8;
	Sat, 18 Feb 2012 22:20:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g229046026.adsl.alicedsl.de
	[92.229.46.26]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Sat, 18 Feb 2012 22:20:50 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 28B6F3C4C2; Sat, 18 Feb 2012 22:20:45 +0100 (CET)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Feb 2012 22:20:19 +0100
Message-Id: <1329600022-8027-10-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.9
In-Reply-To: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH 09/12][oe-classic] ecj-bootstrap-native: update ecj script
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
X-List-Received-Date: Sat, 18 Feb 2012 21:29:06 -0000

* merge with script from java-initial
* bailout after 50 tries

Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 recipes/ecj/ecj-bootstrap-native.bb |    2 +-
 recipes/ecj/files/ecj.in            |   23 ++++++++++-------------
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/recipes/ecj/ecj-bootstrap-native.bb b/recipes/ecj/ecj-bootstrap-native.bb
index a11ba74..72571bf 100644
--- a/recipes/ecj/ecj-bootstrap-native.bb
+++ b/recipes/ecj/ecj-bootstrap-native.bb
@@ -17,7 +17,7 @@ SRC_URI = "file://ecj.in"
 
 S = "${WORKDIR}"
 
-PR = "r4"
+PR = "r5"
 
 JAR = "ecj-bootstrap.jar"
 
diff --git a/recipes/ecj/files/ecj.in b/recipes/ecj/files/ecj.in
index f8d97ac..a75c610 100755
--- a/recipes/ecj/files/ecj.in
+++ b/recipes/ecj/files/ecj.in
@@ -1,16 +1,13 @@
-COUNT=5
-END=0
-RETURNCODE=0
+COUNT=50
 
-while test "${COUNT}" -gt "${END}"
-do
- ${RUNTIME} -Xmx1024m -cp ${ECJ_JAR} org.eclipse.jdt.internal.compiler.batch.Main ${1+"$@"}
- RETURNCODE=${?}
- if test "${?}" -eq "${END}"
- then
-    break
- fi
- COUNT=$(($COUNT-1))
+redo_from_start=1;
+while [ ${redo_from_start} -eq 1 -a ${COUNT} -gt 0 ]; do
+    redo_from_start=0;
+    ${RUNTIME} -Xmx1024m -cp ${ECJ_JAR} org.eclipse.jdt.internal.compiler.batch.Main ${1+"$@"}
+    if [ ${?} -ne 0 ]; then
+        echo "underlying JVM crashed - silently trying again"
+        redo_from_start=1;
+	COUNT=$((${COUNT}-1))
+    fi
 done
 
-exit ${RETURNCODE}
-- 
1.7.9


