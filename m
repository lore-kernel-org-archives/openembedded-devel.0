Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1ObZxs-0006mL-2o
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 16:08:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id D36C94036DE69;
	Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id CB7C74036DE6A;
	Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 09z1g0xa6hhS; Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id 9B0EC4036DE69;
	Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1ObZxB-0006UA-Dc; Wed, 21 Jul 2010 16:07:21 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 16:07:03 +0200
Message-Id: <1279721232-24744-13-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: henning@tarent.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Henning Heinold <h.heinold@tarent.de>
Subject: [PATCH 12/21] xerces-j: backport from openembedded-dev
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
X-List-Received-Date: Wed, 21 Jul 2010 14:08:38 -0000

From: Henning Heinold <h.heinold@tarent.de>

* checksum already in conf/checksums.ini
---
 recipes/xerces-j/xerces-j-native_2.9.1.bb |    8 +++++
 recipes/xerces-j/xerces-j_2.9.1.bb        |   45 +++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 0 deletions(-)
 create mode 100644 recipes/xerces-j/xerces-j-native_2.9.1.bb
 create mode 100644 recipes/xerces-j/xerces-j_2.9.1.bb

diff --git a/recipes/xerces-j/xerces-j-native_2.9.1.bb b/recipes/xerces-j/xerces-j-native_2.9.1.bb
new file mode 100644
index 0000000..9238ad9
--- /dev/null
+++ b/recipes/xerces-j/xerces-j-native_2.9.1.bb
@@ -0,0 +1,8 @@
+require xerces-j_${PV}.bb
+
+S = "${WORKDIR}/xerces-2_9_1"
+
+inherit java-native
+
+DEPENDS = "fastjar-native jaxp1.3-native xml-commons-resolver1.1-native"
+RDEPENDS = ""
diff --git a/recipes/xerces-j/xerces-j_2.9.1.bb b/recipes/xerces-j/xerces-j_2.9.1.bb
new file mode 100644
index 0000000..9a1b4c7
--- /dev/null
+++ b/recipes/xerces-j/xerces-j_2.9.1.bb
@@ -0,0 +1,45 @@
+DESCRIPTION = "Reference implementation of XNI, the Xerces Native Interface, and also a fully conforming XML Schema processor."
+LICENSES = "AL2.0"
+AUTHOR = "Apache Software Foundation"
+
+SRC_URI = "http://www.apache.org/dist/xerces/j/Xerces-J-src.${PV}.tar.gz"
+
+S = "${WORKDIR}/xerces-2_9_1"
+
+inherit java-library
+
+JPN = "libxerces2-java"
+
+DEPENDS = "fastjar-native jaxp1.3 xml-commons-resolver1.1"
+RDEPENDS = "libjaxp1.3-java libxml-commons-resolver1.1-java"
+
+do_unpackpost() {
+  find src -exec \
+    sed -i -e "s|@impl.name@|Xerces-J ${PV}|" \
+           -e "s|@impl.version@|${PV}|" {} \;
+}
+
+addtask unpackpost after do_unpack before do_patch
+
+JARFILENAME = "xercesImpl.jar"
+ALTJARFILENAMES = ""
+
+do_compile() {
+  mkdir -p build
+
+  # Prepend the bootclasspath with the earlier XML API to make
+  # compilation succeed.
+  oe_makeclasspath bcp -s jaxp-1.3 resolver
+	bcp=$bcp:${STAGING_DATADIR_NATIVE}/classpath/glibj.zip
+
+  javac -sourcepath src -d build -bootclasspath $bcp `find src -name "*.java"`
+
+  (cd src && find org ! -name "*.java" -exec cp {} ../build/{} \;)
+
+  fastjar -C build -c -m src/manifest.xerces -f ${JARFILENAME} .
+
+  # Like Debian we provide a symlink called xmlParserAPIs.jar pointing to the JAXP
+  # classes.
+  ln -sf ${D}${datadir_java}/xmlParserAPIs.jar jaxp-1.3.jar
+
+}
-- 
1.7.0.4



