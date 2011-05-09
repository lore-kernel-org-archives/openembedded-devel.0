Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1QJKxc-0004nN-GD
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 09:32:56 +0200
Received: from [2001:638:602:1183:4da:ff61:f5c:b7b4] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1QJKux-0007d3-5a by authid <stefan@sostec.de> with srv_auth_cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 09:30:14 +0200
Received: from stefan by excalibur.local with local (Exim 4.75)
	(envelope-from <stefan@excalibur.local>) id 1QJKuw-000122-7r
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 09:30:10 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 May 2011 09:30:09 +0200
Message-Id: <e6b88ca55bc7c2cc6a54d2fa7befb223128e975d.1304925139.git.stefan@buglabs.net>
X-Mailer: git-send-email 1.7.5.1
In-Reply-To: <cover.1304925139.git.stefan@buglabs.net>
References: <cover.1304925139.git.stefan@buglabs.net>
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: [PATCH 2011.03-maintenance 4/7] ecj-bootstrap: try 5 times to compile the classes
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
X-List-Received-Date: Mon, 09 May 2011 07:32:56 -0000

From: Henning <h.heinold@tarent.de>

* that is an easy fix to workaround the aborts and
  segfaults of cacao and jamvm
* bump PR

Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 recipes/ecj/ecj-bootstrap-native.bb |    2 +-
 recipes/ecj/files/ecj.in            |   14 +++++++++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/recipes/ecj/ecj-bootstrap-native.bb b/recipes/ecj/ecj-bootstrap-native.bb
index bdb9797..a11ba74 100644
--- a/recipes/ecj/ecj-bootstrap-native.bb
+++ b/recipes/ecj/ecj-bootstrap-native.bb
@@ -17,7 +17,7 @@ SRC_URI = "file://ecj.in"
 
 S = "${WORKDIR}"
 
-PR = "r3"
+PR = "r4"
 
 JAR = "ecj-bootstrap.jar"
 
diff --git a/recipes/ecj/files/ecj.in b/recipes/ecj/files/ecj.in
index 2cff259..0fd4a65 100755
--- a/recipes/ecj/files/ecj.in
+++ b/recipes/ecj/files/ecj.in
@@ -1 +1,13 @@
-${RUNTIME} -Xmx1024m -cp ${ECJ_JAR} org.eclipse.jdt.internal.compiler.batch.Main ${1+"$@"}
+ARGS=${1+"$@"}
+COUNT=5
+END=0
+
+while test "${COUNT}" -gt "${END}"
+do
+ ${RUNTIME} -Xmx1024m -cp ${ECJ_JAR} org.eclipse.jdt.internal.compiler.batch.Main ${ARGS}
+ if test "${?}" -eq "${END}"
+ then
+    break
+ fi
+ COUNT=$(($COUNT-1))
+done
-- 
1.7.5.1



