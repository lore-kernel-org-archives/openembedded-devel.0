Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1ObZxu-0006mT-CC
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 16:08:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 46FFB4036DE6E;
	Wed, 21 Jul 2010 16:07:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 3F76F4036DE6F;
	Wed, 21 Jul 2010 16:07:24 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qg8+7NRdVvQz; Wed, 21 Jul 2010 16:07:24 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id 12A0E4036DE6E;
	Wed, 21 Jul 2010 16:07:24 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1ObZxB-0006UO-On; Wed, 21 Jul 2010 16:07:21 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 16:07:06 +0200
Message-Id: <1279721232-24744-16-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: henning@tarent.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Henning Heinold <h.heinold@tarent.de>
Subject: [PATCH 15/21] junit: backport from openembedded-dev
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
X-List-Received-Date: Wed, 21 Jul 2010 14:08:41 -0000

From: Henning Heinold <h.heinold@tarent.de>

* checksums already in conf/checksums.ini
---
 recipes/junit/junit-native_3.8.2.bb  |    4 ++++
 recipes/junit/junit4-native_4.3.1.bb |    4 ++++
 recipes/junit/junit4_4.3.1.bb        |   23 +++++++++++++++++++++++
 recipes/junit/junit_3.8.2.bb         |   34 ++++++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+), 0 deletions(-)
 create mode 100644 recipes/junit/junit-native_3.8.2.bb
 create mode 100644 recipes/junit/junit4-native_4.3.1.bb
 create mode 100644 recipes/junit/junit4_4.3.1.bb
 create mode 100644 recipes/junit/junit_3.8.2.bb

diff --git a/recipes/junit/junit-native_3.8.2.bb b/recipes/junit/junit-native_3.8.2.bb
new file mode 100644
index 0000000..305351f
--- /dev/null
+++ b/recipes/junit/junit-native_3.8.2.bb
@@ -0,0 +1,4 @@
+require junit_${PV}.bb
+
+inherit java-native
+
diff --git a/recipes/junit/junit4-native_4.3.1.bb b/recipes/junit/junit4-native_4.3.1.bb
new file mode 100644
index 0000000..eb843a9
--- /dev/null
+++ b/recipes/junit/junit4-native_4.3.1.bb
@@ -0,0 +1,4 @@
+require junit4_${PV}.bb
+
+inherit java-native
+
diff --git a/recipes/junit/junit4_4.3.1.bb b/recipes/junit/junit4_4.3.1.bb
new file mode 100644
index 0000000..2733aff
--- /dev/null
+++ b/recipes/junit/junit4_4.3.1.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "JUnit is a testing framework for Java"
+LICENSES = "CPL"
+AUTHOR = "junit.org"
+HOMEPAGE = "http://www.junit.org"
+
+SRC_URI = "http://downloads.sourceforge.net/junit/junit-${PV}-src.jar"
+
+S = "${WORKDIR}"
+
+inherit java-library
+
+DEPENDS = "fastjar-native"
+
+do_compile() {
+  mkdir -p build
+
+	# Workaround for jamvm.
+	bcp=${STAGING_DATADIR_NATIVE}/classpath/glibj.zip
+
+  javac -source 5.0 -bootclasspath $bcp -sourcepath . -d build `find . -name "*.java"`
+
+  fastjar -C build -c -f ${JARFILENAME} .
+}
diff --git a/recipes/junit/junit_3.8.2.bb b/recipes/junit/junit_3.8.2.bb
new file mode 100644
index 0000000..2ba54b6
--- /dev/null
+++ b/recipes/junit/junit_3.8.2.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "JUnit is a testing framework for Java"
+LICENSES = "CPL"
+AUTHOR = "junit.org"
+HOMEPAGE = "http://www.junit.org"
+
+SRC_URI = "http://downloads.sourceforge.net/junit/junit${PV}.zip"
+
+S = "${WORKDIR}/junit${PV}"
+
+inherit java-library
+
+DEPENDS = "fastjar-native"
+
+do_unpackpost() {
+	mkdir -p src
+
+	# Prevent deletion by do_removebinaries.
+	mv src.jar src.zip
+
+	unzip src.zip -d src
+}
+
+addtask unpackpost before do_removebinaries after do_unpack
+
+do_compile() {
+  mkdir -p build
+
+	# Workaround for jamvm.
+	bcp=${STAGING_DATADIR_NATIVE}/classpath/glibj.zip
+
+  javac -bootclasspath $bcp -sourcepath src -d build `find src -name "*.java"`
+
+  fastjar -C build -c -f ${JARFILENAME} .
+}
-- 
1.7.0.4



