Return-Path: <prvs=7639e01b5=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 318FB78C7E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 21:15:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.53,266,1531778400"; d="scan'208";a="11913588"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Aug 2018 23:16:15 +0200
Message-ID: <20180820211615.404-3-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180820211615.404-1-richard.leitner@skidata.com>
References: <20180820211443.32757-1-richard.leitner@skidata.com>
	<20180820211615.404-1-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH 7/7] openjdk-7: merge postinst into openjdk-7-common
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2018 21:15:45 -0000
Content-Type: text/plain

As openjdk-7-common was the only consumer of openjdk-postinst.inc move
it's content and remove openjdk-postinst.inc.

Now all files in recipes-core/openjdk are named correctly according to
their versions again.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/openjdk/openjdk-7-common.inc | 100 +++++++++++++++++++++++++++++-
 recipes-core/openjdk/openjdk-postinst.inc | 100 ------------------------------
 2 files changed, 99 insertions(+), 101 deletions(-)
 delete mode 100644 recipes-core/openjdk/openjdk-postinst.inc

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index 6005394..56180e2 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -356,6 +356,104 @@ JDK_URI = "${ICEDTEA_DROP_URL}/${JDK_FILE};name=jdk;unpack=false"
 LANGTOOLS_FILE = "langtools.tar.bz2"
 LANGTOOLS_URI = "${ICEDTEA_DROP_URL}/${LANGTOOLS_FILE};name=langtools;unpack=false"
 
-require openjdk-postinst.inc
+# handles all postinst action for openjdk
+# some of the former results in a build error because "ERR" is in the first line.
+
+pkg_postinst_${JDKPN}-vm-shark () {
+    true
+    if grep -q "\-server ERROR" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && ! grep -q "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
+        sed -i -e "/\-shark.*/d" -e "s|\(^\-server*\)|\-shark KNOWN\n\1|" -e "/^$/d" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    else
+        sed -i -e "s/\-shark.*/\-shark KNOWN/" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    fi
+}
+
+pkg_prerm_${JDKPN}-vm-shark () {
+    true
+    sed -i -e "/^\-shark.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
+        FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
+        sed -i -e "/${FIRST_KNOWN}/d" -e  "s|\(^\-server*\)|${FIRST_KNOWN}\n\1|" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    fi
+
+    echo "-shark ERROR" >> ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+}
+
+pkg_postinst_${JDKPN}-vm-cacao () {
+    true
+    if grep -q "\-server ERROR" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && ! grep -q "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
+        sed -i -e "/\-cacao.*/d" -e "s|\(^\-server*\)|\-cacao KNOWN\n\1|" -e "/^$/d" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    else
+        sed -i -e "s/\-cacao.*/\-cacao KNOWN/" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    fi
+}
+
+pkg_prerm_${JDKPN}-vm-cacao () {
+    true
+    sed -i -e "/^\-cacao.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
+        FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
+        sed -i -e "/${FIRST_KNOWN}/d" -e  "s|\(^\-server*\)|${FIRST_KNOWN}\n\1|" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    fi
+
+    echo "-cacao ERROR" >> ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+}
+
+pkg_postinst_${JDKPN}-vm-jamvm () {
+    true
+    if grep -q "\-server ERROR" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && ! grep -q "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
+        sed -i -e "/\-jamvm.*/d" -e "s|\(^\-server*\)|\-jamvm KNOWN\n\1|" -e "/^$/d" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    else
+        sed -i -e "s/\-jamvm.*/\-jamvm KNOWN/" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    fi
+}
+
+pkg_prerm_${JDKPN}-vm-jamvm () {
+    true
+    sed -i -e "/^\-jamvm.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
+        FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
+        sed -i -e "/${FIRST_KNOWN}/d" -e  "s|\(^\-server*\)|${FIRST_KNOWN}\n\1|" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    fi
+
+    echo "-jamvm ERROR" >> ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+}
+
+pkg_postinst_${JDKPN}-vm-zero () {
+    true
+    if grep -q "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
+        FIRST_KNOWN=`grep "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
+        sed -i -e "/${FIRST_KNOWN}/d" -e "/^$/d" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+        echo ${FIRST_KNOWN} >> $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    fi
+
+    sed -i -e "s|^\-server.*|\-server KNOWN|" -e "/^$/d" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+}
+
+pkg_prerm_${JDKPN}-vm-zero () {
+    true
+    sed -i -e "/^\-server.*/\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
+        FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
+        sed -i -e "/${FIRST_KNOWN}/d" -e  "s|\(^\-server*\)|${FIRST_KNOWN}\n\1|" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+    fi
+}
+
+pkg_postinst_${JDKPN}-jre () {
+    ln -s ${JDK_HOME}/jre  $D/${libdir}/jvm/jre
+}
+
+inherit update-alternatives
+
+ALTERNATIVE_${JDKPN}-jre = "java keytool"
+ALTERNATIVE_${JDKPN}-jdk = "javac"
+
+ALTERNATIVE_TARGET[java] = "${JDK_HOME}/jre/bin/java"
+ALTERNATIVE_TARGET[javac] = "${JDK_HOME}/bin/javac"
+ALTERNATIVE_TARGET[keytool] = "${JDK_HOME}/jre/bin/keytool"
+
+ALTERNATIVE_LINK_NAME[java] = "${bindir}/java"
+ALTERNATIVE_LINK_NAME[javac] = "${bindir}/javac"
+ALTERNATIVE_LINK_NAME[keytool] = "${bindir}/keytool"
 
 ALTERNATIVE_PRIORITY = "50"
diff --git a/recipes-core/openjdk/openjdk-postinst.inc b/recipes-core/openjdk/openjdk-postinst.inc
deleted file mode 100644
index be88714..0000000
--- a/recipes-core/openjdk/openjdk-postinst.inc
+++ /dev/null
@@ -1,100 +0,0 @@
-# handles all postinst action for openjdk
-
-# some of the former results in a build error because "ERR" is in the first line.
-
-pkg_postinst_${JDKPN}-vm-shark () {
-    true
-    if grep -q "\-server ERROR" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && ! grep -q "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
-        sed -i -e "/\-shark.*/d" -e "s|\(^\-server*\)|\-shark KNOWN\n\1|" -e "/^$/d" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-    else
-        sed -i -e "s/\-shark.*/\-shark KNOWN/" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-    fi
-}
-
-pkg_prerm_${JDKPN}-vm-shark () {
-    true
-    sed -i -e "/^\-shark.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-    if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
-        FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
-        sed -i -e "/${FIRST_KNOWN}/d" -e  "s|\(^\-server*\)|${FIRST_KNOWN}\n\1|" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-    fi
-
-    echo "-shark ERROR" >> ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-}
-
-pkg_postinst_${JDKPN}-vm-cacao () {
-    true
-    if grep -q "\-server ERROR" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && ! grep -q "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
-        sed -i -e "/\-cacao.*/d" -e "s|\(^\-server*\)|\-cacao KNOWN\n\1|" -e "/^$/d" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-    else
-        sed -i -e "s/\-cacao.*/\-cacao KNOWN/" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-    fi
-}
-
-pkg_prerm_${JDKPN}-vm-cacao () {
-    true
-    sed -i -e "/^\-cacao.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-    if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
-        FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
-        sed -i -e "/${FIRST_KNOWN}/d" -e  "s|\(^\-server*\)|${FIRST_KNOWN}\n\1|" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-    fi
-
-    echo "-cacao ERROR" >> ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-}
-
-pkg_postinst_${JDKPN}-vm-jamvm () {
-    true
-    if grep -q "\-server ERROR" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && ! grep -q "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
-        sed -i -e "/\-jamvm.*/d" -e "s|\(^\-server*\)|\-jamvm KNOWN\n\1|" -e "/^$/d" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-    else
-        sed -i -e "s/\-jamvm.*/\-jamvm KNOWN/" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-    fi
-}
-
-pkg_prerm_${JDKPN}-vm-jamvm () {
-    true
-    sed -i -e "/^\-jamvm.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-    if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
-        FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
-        sed -i -e "/${FIRST_KNOWN}/d" -e  "s|\(^\-server*\)|${FIRST_KNOWN}\n\1|" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-    fi
-
-    echo "-jamvm ERROR" >> ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-}
-
-pkg_postinst_${JDKPN}-vm-zero () {
-    true
-    if grep -q "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
-        FIRST_KNOWN=`grep "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
-        sed -i -e "/${FIRST_KNOWN}/d" -e "/^$/d" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-        echo ${FIRST_KNOWN} >> $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-    fi
-
-    sed -i -e "s|^\-server.*|\-server KNOWN|" -e "/^$/d" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-}
-
-pkg_prerm_${JDKPN}-vm-zero () {
-    true
-    sed -i -e "/^\-server.*/\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-    if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
-        FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
-        sed -i -e "/${FIRST_KNOWN}/d" -e  "s|\(^\-server*\)|${FIRST_KNOWN}\n\1|" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
-    fi
-}
-
-pkg_postinst_${JDKPN}-jre () {
-    ln -s ${JDK_HOME}/jre  $D/${libdir}/jvm/jre
-}
-
-inherit update-alternatives
-
-ALTERNATIVE_${JDKPN}-jre = "java keytool"
-ALTERNATIVE_${JDKPN}-jdk = "javac"
-
-ALTERNATIVE_TARGET[java] = "${JDK_HOME}/jre/bin/java"
-ALTERNATIVE_TARGET[javac] = "${JDK_HOME}/bin/javac"
-ALTERNATIVE_TARGET[keytool] = "${JDK_HOME}/jre/bin/keytool"
-
-ALTERNATIVE_LINK_NAME[java] = "${bindir}/java"
-ALTERNATIVE_LINK_NAME[javac] = "${bindir}/javac"
-ALTERNATIVE_LINK_NAME[keytool] = "${bindir}/keytool"
-- 
2.11.0


