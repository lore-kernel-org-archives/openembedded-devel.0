Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1ObZy7-0006n9-QP
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 16:08:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id E5B654036DE77;
	Wed, 21 Jul 2010 16:07:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id DE5264036DE78;
	Wed, 21 Jul 2010 16:07:29 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lKAuhcdN3S+y; Wed, 21 Jul 2010 16:07:29 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id B84B54036DE77;
	Wed, 21 Jul 2010 16:07:29 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1ObZxC-0006Ui-7x; Wed, 21 Jul 2010 16:07:22 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 16:07:12 +0200
Message-Id: <1279721232-24744-22-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: henning@tarent.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL, BAYES_00, TVD_SPACE_RATIO
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Henning Heinold <h.heinold@tarent.de>
Subject: [PATCH 21/21] cacaoh-openjdk-native: backported from openembedded-dev
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
X-List-Received-Date: Wed, 21 Jul 2010 14:08:45 -0000

From: Henning Heinold <h.heinold@tarent.de>

---
 recipes/cacao/cacaoh-openjdk-native.inc       |   31 +++++++++++++++++++++++++
 recipes/cacao/cacaoh-openjdk-native_0.99.4.bb |    8 ++++++
 2 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 recipes/cacao/cacaoh-openjdk-native.inc
 create mode 100644 recipes/cacao/cacaoh-openjdk-native_0.99.4.bb

diff --git a/recipes/cacao/cacaoh-openjdk-native.inc b/recipes/cacao/cacaoh-openjdk-native.inc
new file mode 100644
index 0000000..7670215
--- /dev/null
+++ b/recipes/cacao/cacaoh-openjdk-native.inc
@@ -0,0 +1,31 @@
+DESCRIPTION = "Header generator for Cacao JVM - Needed for cross-compilation builds"
+HOMEPAGE = "http://www.cacaojvm.org/"
+LICENSE  = "GPL"
+
+DEPENDS = "libtool-native zlib-native virtual/javac-native classpath-native icedtea6-native"
+
+inherit java autotools
+
+S = "${WORKDIR}/cacao-${PV}"
+
+inherit autotools native
+
+EXTRA_OECONF = " \
+	--with-java-runtime-library=openjdk \
+	--with-java-runtime-library-classes=${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/jre/lib/rt.jar \
+  --with-jni_md_h=${STAGING_INCDIR}/classpath \
+  --with-jni_h=${STAGING_INCDIR}/classpath \
+	--with-hpi_md_h=${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/include/hpi \
+	--with-hpi_h=${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/include/hpi \
+  "
+
+do_compile() {
+  # Compile the header generator only (and what is needed for it).
+  oe_runmake -C src/toolbox libtoolbox.la
+  oe_runmake -C src/vmcore libvmcore.la
+  oe_runmake -C src/cacaoh cacaoh
+}
+
+do_stage() {
+	install -m 0755 src/cacaoh/.libs/cacaoh ${STAGING_BINDIR}/cacaoh-openjdk-${PV}
+}
diff --git a/recipes/cacao/cacaoh-openjdk-native_0.99.4.bb b/recipes/cacao/cacaoh-openjdk-native_0.99.4.bb
new file mode 100644
index 0000000..27ab6ab
--- /dev/null
+++ b/recipes/cacao/cacaoh-openjdk-native_0.99.4.bb
@@ -0,0 +1,8 @@
+require cacaoh-openjdk-native.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "63220327925ace13756ae334c55a3baa"
+SRC_URI[sha256sum] = "1dfc4903dc0172286df4f1740fd0f12749ac81d51c602290b47cbe83d51e1d56"
+
+SRC_URI = "http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-${PV}/cacao-${PV}.tar.bz2"
-- 
1.7.0.4



