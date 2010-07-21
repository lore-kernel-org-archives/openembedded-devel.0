Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1ObZxs-0006mK-1l
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 16:08:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id BBFF340148CA4;
	Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id B27CF4036DE6D;
	Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mDuZeMaKVbxz; Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id 79C8C4036DE68;
	Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1ObZxB-0006U6-AV; Wed, 21 Jul 2010 16:07:21 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 16:07:02 +0200
Message-Id: <1279721232-24744-12-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: henning@tarent.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Henning Heinold <h.heinold@tarent.de>
Subject: [PATCH 11/21] jcraft: backport from openembedded-dev
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
X-List-Received-Date: Wed, 21 Jul 2010 14:08:36 -0000

From: Henning Heinold <h.heinold@tarent.de>

* checksums already in conf/checksums.ini
---
 recipes/jcraft/jsch-native_0.1.40.bb |    8 ++++++++
 recipes/jcraft/jsch_0.1.40.bb        |   21 +++++++++++++++++++++
 recipes/jcraft/jzlib-native_1.0.7.bb |    6 ++++++
 recipes/jcraft/jzlib_1.0.7.bb        |   18 ++++++++++++++++++
 4 files changed, 53 insertions(+), 0 deletions(-)
 create mode 100644 recipes/jcraft/jsch-native_0.1.40.bb
 create mode 100644 recipes/jcraft/jsch_0.1.40.bb
 create mode 100644 recipes/jcraft/jzlib-native_1.0.7.bb
 create mode 100644 recipes/jcraft/jzlib_1.0.7.bb

diff --git a/recipes/jcraft/jsch-native_0.1.40.bb b/recipes/jcraft/jsch-native_0.1.40.bb
new file mode 100644
index 0000000..a93fa76
--- /dev/null
+++ b/recipes/jcraft/jsch-native_0.1.40.bb
@@ -0,0 +1,8 @@
+require jsch_${PV}.bb
+
+S = "${WORKDIR}/jsch-${PV}"
+
+inherit java-native
+
+DEPENDS = "fastjar-native jzlib-native"
+RDEPENDS = ""
diff --git a/recipes/jcraft/jsch_0.1.40.bb b/recipes/jcraft/jsch_0.1.40.bb
new file mode 100644
index 0000000..a61888f
--- /dev/null
+++ b/recipes/jcraft/jsch_0.1.40.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "SSH implementation in Java"
+LICENSES = "BSD"
+
+HOMEPAGE = "http://www.jcraft.com/jsch"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/jsch/jsch-${PV}.zip"
+
+inherit java-library
+
+DEPENDS = "fastjar-native jzlib"
+RDEPENDS = "libjzlib-java"
+
+do_compile() {
+  mkdir -p build
+
+	oe_makeclasspath cp -s jzlib
+
+  javac -sourcepath src -cp $cp -d build `find src -name "*.java"`
+
+  fastjar -C build -c -f ${JARFILENAME} .
+}
diff --git a/recipes/jcraft/jzlib-native_1.0.7.bb b/recipes/jcraft/jzlib-native_1.0.7.bb
new file mode 100644
index 0000000..e430a15
--- /dev/null
+++ b/recipes/jcraft/jzlib-native_1.0.7.bb
@@ -0,0 +1,6 @@
+require jzlib_${PV}.bb
+
+S = "${WORKDIR}/jzlib-${PV}"
+
+inherit java-native
+
diff --git a/recipes/jcraft/jzlib_1.0.7.bb b/recipes/jcraft/jzlib_1.0.7.bb
new file mode 100644
index 0000000..4759e90
--- /dev/null
+++ b/recipes/jcraft/jzlib_1.0.7.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "zlib implementation in Java"
+LICENSES = "BSD"
+
+HOMEPAGE = "http://www.jcraft.com/jzlib"
+
+SRC_URI = "http://www.jcraft.com/jzlib/jzlib-${PV}.tar.gz"
+
+inherit java-library
+
+DEPENDS = "fastjar-native"
+
+do_compile() {
+  mkdir -p build
+
+  javac -sourcepath . -d build `find com -name "*.java"`
+
+  fastjar -C build -c -f ${JARFILENAME} .
+}
-- 
1.7.0.4



