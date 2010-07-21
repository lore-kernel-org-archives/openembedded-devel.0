Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1ObZxO-0006VA-9k
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 16:07:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id D637740148CAA;
	Wed, 21 Jul 2010 16:07:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id CEB5940148CA4;
	Wed, 21 Jul 2010 16:07:22 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qzsRkbhyH32A; Wed, 21 Jul 2010 16:07:22 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id A6AA340148CAA;
	Wed, 21 Jul 2010 16:07:22 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1ObZxA-0006Tk-LN; Wed, 21 Jul 2010 16:07:20 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 16:06:55 +0200
Message-Id: <1279721232-24744-5-git-send-email-heinold@inf.fu-berlin.de>
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
Subject: [PATCH 04/21] jacl: backport from openembedded-dev
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
X-List-Received-Date: Wed, 21 Jul 2010 14:07:49 -0000

From: Henning Heinold <h.heinold@tarent.de>

* checksum is already in conf/checksums.ini
---
 recipes/jacl/jacl-native_1.4.1.bb |    4 ++++
 recipes/jacl/jacl_1.4.1.bb        |   20 ++++++++++++++++++++
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 recipes/jacl/jacl-native_1.4.1.bb
 create mode 100644 recipes/jacl/jacl_1.4.1.bb

diff --git a/recipes/jacl/jacl-native_1.4.1.bb b/recipes/jacl/jacl-native_1.4.1.bb
new file mode 100644
index 0000000..b0a0638
--- /dev/null
+++ b/recipes/jacl/jacl-native_1.4.1.bb
@@ -0,0 +1,4 @@
+require jacl_${PV}.bb
+
+inherit java-native
+
diff --git a/recipes/jacl/jacl_1.4.1.bb b/recipes/jacl/jacl_1.4.1.bb
new file mode 100644
index 0000000..7c66c3e
--- /dev/null
+++ b/recipes/jacl/jacl_1.4.1.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Tcl interpreter for Java"
+LICENSES = "BSD"
+
+HOMEPAGE = "http://sourceforge.net/projects/tcljava"
+
+SRC_URI = "http://downloads.sourceforge.net/tcljava/jacl${PV}.tar.gz"
+
+inherit java-library
+
+S = "${WORKDIR}/jacl${PV}"
+
+DEPENDS = "fastjar-native"
+
+do_compile() {
+  mkdir -p build
+
+  javac -sourcepath src/tcljava:src/jacl -d build `find src/tcljava src/jacl -name "*.java"`
+
+  fastjar -C build -c -f ${JARFILENAME} .
+}
-- 
1.7.0.4



