Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1PcwmD-0002Dc-Vo
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 10:13:58 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Pcwlh-00012P-0T by authid <stefan@sostec.de> with cram_md5;
	Wed, 12 Jan 2011 10:13:28 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>)
	id 1Pcwlg-0000im-EY; Wed, 12 Jan 2011 10:13:24 +0100
From: Stefan Schmidt <stefan@buglabs.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jan 2011 10:13:19 +0100
Message-Id: <1294823599-2669-3-git-send-email-stefan@buglabs.net>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1294823599-2669-1-git-send-email-stefan@buglabs.net>
References: <1294823599-2669-1-git-send-email-stefan@buglabs.net>
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Cc: Stefan Schmidt <stefan@buglabs.net>
Subject: [PATCH 3/3] jni-library.bbclass: Add helper class for jni libraries
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
X-List-Received-Date: Wed, 12 Jan 2011 09:13:58 -0000


Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 classes/jni-library.bbclass |   54 +++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 54 insertions(+), 0 deletions(-)
 create mode 100644 classes/jni-library.bbclass

diff --git a/classes/jni-library.bbclass b/classes/jni-library.bbclass
new file mode 100644
index 0000000..fefbace
--- /dev/null
+++ b/classes/jni-library.bbclass
@@ -0,0 +1,54 @@
+# we need javah
+DEPENDS += "openjdk-langtools-native zip-native"
+
+JNI_LIB_DIR = "/usr/lib/jni"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+EXTRA_OEMAKE +=" \
+	JAVAH_OUT=${D}${JNI_LIB_DIR} \
+	LIB_DIR=${D}${JNI_LIB_DIR} \
+	JAVAH_CLASSPATH=${S}/build --debug \
+	COMMON_CLASSPATH=${STAGING_LIBDIR}/com.buglabs.bug.jni.common.jar \
+	STAGING_BUG_INCDIR=${STAGING_INCDIR}/bug \
+	BUG_LINUX_SRC=${STAGING_KERNEL_DIR} \
+	STAGING_INCDIR=${STAGING_INCDIR} \
+	CLASSPATH_INCDIR=${STAGING_INCDIR}/classpath \
+	ROOTFS_BUG=${STAGING_LIBDIR}/../../ \
+"
+
+addtask jni_compile after do_compile before do_install
+do_jni_compile() {
+        cd ${S}/src/c
+        oe_runmake jni
+}
+
+addtask jni_install after do_install before do_package
+do_jni_install() {
+  install -d ${D}${JNI_LIB_DIR}
+  cd ${S}/src/c
+  oe_runmake libs
+}
+
+addtask jni_update_jar after do_jni_install before do_package
+do_jni_update_jar(){
+  cd ${S}/src/c/
+  install -d lib/
+  cp *.so lib/
+  zip -u ${D}${datadir_java}/${JARFILENAME} lib/*.so
+}
+
+addtask jni_staging after do_jni_install before do_package
+do_jni_staging() {
+  if test -e ${S}/src/c/*.so; then
+	install -d ${STAGING_LIBDIR}/bug
+	cp -r ${S}/src/c/*.so ${STAGING_LIBDIR}/bug
+	cp -r ${S}/src/c/*.so ${STAGING_LIBDIR}/
+  fi
+
+  if test -e ${S}/src/c/include/*.h; then
+	  install -d ${STAGING_INCDIR}/bug
+	  cp -r ${S}/src/c/include/*.h ${STAGING_INCDIR}/bug
+	  cp -r ${S}/src/c/include/*.h ${STAGING_INCDIR}/
+  fi
+}
-- 
1.7.2.3



