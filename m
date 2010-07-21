Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1ObZxO-0006V8-9K
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 16:07:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 9F2644018C539;
	Wed, 21 Jul 2010 16:07:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 969EA40064C01;
	Wed, 21 Jul 2010 16:07:22 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LecVEgLpcAp6; Wed, 21 Jul 2010 16:07:22 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id 6A67440148CA4;
	Wed, 21 Jul 2010 16:07:22 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1ObZxA-0006TR-Cu; Wed, 21 Jul 2010 16:07:20 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 16:06:53 +0200
Message-Id: <1279721232-24744-3-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: henning@tarent.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Henning Heinold <h.heinold@tarent.de>
Subject: [PATCH 02/21] bcel: backport from openembedded-dev
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
X-List-Received-Date: Wed, 21 Jul 2010 14:07:56 -0000

From: Henning Heinold <h.heinold@tarent.de>

* checksum already in conf/checksums.ini
---
 recipes/bcel/bcel-native_5.2.bb |    6 ++++++
 recipes/bcel/bcel_5.2.bb        |   19 +++++++++++++++++++
 2 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 recipes/bcel/bcel-native_5.2.bb
 create mode 100644 recipes/bcel/bcel_5.2.bb

diff --git a/recipes/bcel/bcel-native_5.2.bb b/recipes/bcel/bcel-native_5.2.bb
new file mode 100644
index 0000000..478b770
--- /dev/null
+++ b/recipes/bcel/bcel-native_5.2.bb
@@ -0,0 +1,6 @@
+require bcel_${PV}.bb
+
+inherit java-native
+
+DEPENDS = "fastjar-native xerces-j-native regexp-native"
+
diff --git a/recipes/bcel/bcel_5.2.bb b/recipes/bcel/bcel_5.2.bb
new file mode 100644
index 0000000..faf6043
--- /dev/null
+++ b/recipes/bcel/bcel_5.2.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Java Bytecode manipulation library"
+LICENSE = "AL2.0"
+AUTHOR = "Apache Software Foundation"
+
+SRC_URI = "http://archive.apache.org/dist/jakarta/bcel/source/${BP}-src.tar.gz"
+
+inherit java-library
+
+DEPENDS = "fastjar-native xerces-j regexp"
+
+do_compile() {
+  mkdir -p build
+
+  oe_makeclasspath cp -s xercesImpl regexp
+
+  javac -sourcepath src/java -d build -cp $cp `find src/java -name \*.java`
+
+  fastjar -C build -c -f ${JARFILENAME} .
+}
-- 
1.7.0.4



