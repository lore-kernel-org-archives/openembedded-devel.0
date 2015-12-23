Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA837731B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 10:03:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBNA3fh6022050
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 02:03:41 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 23 Dec 2015 02:03:41 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Dec 2015 18:03:50 +0800
Message-ID: <4bda085129c56670ae779ace7a05453cf99b37de.1450864063.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450864063.git.jackie.huang@windriver.com>
References: <cover.1450864063.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 2/2] openjdk-8-native: fix improper do_install and PROVIDES
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
X-List-Received-Date: Wed, 23 Dec 2015 10:03:41 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

We had:
virtual/jar-native provided by fastjar-native
virtual/java-native provided by cacao-native and jamvm-native
virtual/javac-native provided by ecj-bootstrap-native

Then openjdk-8-native added and also provides:
virtual/java-native and virtual/javac-native
(it also installs ${STAGING_BINDIR_NATIVE}/jar but
doesn't add virtual/jar-native in the PROVIDES)

which introduces circular dependencies,
java-bootstrap-components.bbclass is to avoid the
circular dependencies but it's not a correct way
since it make two conflicted packages build into
the same sysroot:

DEPENDS_prepend_class-native = " ecj-bootstrap-native "
DEPENDS_prepend_class-target = " virtual/javac-native "

virtual/javac-native is provided by openjdk-8-native,
and it assumed that ecj-bootstrap-native, fastjar-native and
cacao-native/jamvm-native are always built before openjdk-8-native,
then in the do_install of penjdk-8-native, it removes them from
staging dirs first, then install (create symlinks for) these files
in staging dirs directly, which results with empty sstate and
builds from sstate cache or builds not in this assumption
will fail.

The fixes here includes:
- Revert "meta-java: rely on well known bootstrap-path" in
  previous commit to remove the improper
  java-bootstrap-components.bbclass

- Do not let openjdk-8-native provides jar, java and javac,
  just like what we do in icedtea7-native, which can provides
  but not to avoid circular dependencies and conflicts.

- make cacao-native back to provide virtual/java-native,
  and ecj-bootstrap-native back to provide virtual/javac-native

- Add back provider settings in README.

- Remove the update-alternatives in openjdk-8-native,
  it doesn't work for native package.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 README                                         | 12 ++++++++++--
 recipes-core/cacao/cacao_1.6.1.bb              |  2 +-
 recipes-core/ecj/ecj-bootstrap-native.bb       |  2 ++
 recipes-core/openjdk/openjdk-8-native.inc      | 13 +++++--------
 recipes-core/openjdk/openjdk-8-native_72b05.bb | 26 --------------------------
 5 files changed, 18 insertions(+), 37 deletions(-)

diff --git a/README b/README
index 7658c23..259fa75 100644
--- a/README
+++ b/README
@@ -52,8 +52,16 @@ Main layer maintainers:
 Usage instructions
 ------------------
 
-Since there is a clear bootstrap of the individual java-recipes, there is
-nothing to configure in conf/local.conf nor your individual distro/$name.conf.
+You should define at least the following variables in a distro include file or local.conf
+
+# Possible provider: cacao-initial-native and jamvm-initial-native
+PREFERRED_PROVIDER_virtual/java-initial-native = "cacao-initial-native"
+
+# Possible provider: cacao-native and jamvm-native
+PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
+
+# Optional since there is only one provider for now
+PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
 
 Simply rely on openjdk-7-jre, openjdk-7, openjdk-8 or openjre-8.
 
diff --git a/recipes-core/cacao/cacao_1.6.1.bb b/recipes-core/cacao/cacao_1.6.1.bb
index ce1ffc2..8e212af 100644
--- a/recipes-core/cacao/cacao_1.6.1.bb
+++ b/recipes-core/cacao/cacao_1.6.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SECTION  = "interpreters"
 
 DEPENDS_class-native = "zlib-native libtool-native ecj-initial-native fastjar-native classpath-native bdwgc-native"
-#PROVIDES_class-native = "virtual/java-native"
+PROVIDES_class-native = "virtual/java-native"
 
 DEPENDS = "zlib libtool classpath virtual/javac-native bdwgc"
 RPROVIDES_${PN} = "java2-runtime"
diff --git a/recipes-core/ecj/ecj-bootstrap-native.bb b/recipes-core/ecj/ecj-bootstrap-native.bb
index 94ce6aa..e159c9d 100644
--- a/recipes-core/ecj/ecj-bootstrap-native.bb
+++ b/recipes-core/ecj/ecj-bootstrap-native.bb
@@ -14,6 +14,8 @@ PR = "r1"
 
 DEPENDS = "libecj-bootstrap-native virtual/java-native"
 
+PROVIDES = "virtual/javac-native"
+
 SRC_URI = "file://ecj.in"
 
 S = "${WORKDIR}"
diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/openjdk/openjdk-8-native.inc
index 7813ec2..7a37d1a 100644
--- a/recipes-core/openjdk/openjdk-8-native.inc
+++ b/recipes-core/openjdk/openjdk-8-native.inc
@@ -68,15 +68,12 @@ do_compile_append() {
 }
 
 do_install() {
-    rm -rf ${STAGING_LIBDIR_NATIVE}/jvm/${JDK_DIR}
-    mkdir -p ${STAGING_LIBDIR_NATIVE}/jvm/${JDK_DIR}
-    cp -rp ${B}/images/j2sdk-image/* ${STAGING_LIBDIR_NATIVE}/jvm/${JDK_DIR}
+    mkdir -p ${D}${libdir_jvm}/${JDK_DIR}
+    cp -rp ${B}/images/j2sdk-image/* ${D}${libdir_jvm}/${JDK_DIR}
 
-# clean up the mess from bootstrap
-    for tool in jar java javac keytool pack200 unpack200
+    mkdir -p ${D}${bindir}
+    for tool in keytool pack200 unpack200
     do
-        rm -f ${STAGING_BINDIR_NATIVE}/$tool
-
-        ln -sf "../lib/jvm/${JDK_DIR}/bin/$tool" ${STAGING_BINDIR_NATIVE}/$tool
+        ln -sf "../lib/jvm/${JDK_DIR}/bin/$tool" ${D}${bindir}/$tool
     done
 }
diff --git a/recipes-core/openjdk/openjdk-8-native_72b05.bb b/recipes-core/openjdk/openjdk-8-native_72b05.bb
index 6eb40eb..7b20248 100644
--- a/recipes-core/openjdk/openjdk-8-native_72b05.bb
+++ b/recipes-core/openjdk/openjdk-8-native_72b05.bb
@@ -1,28 +1,2 @@
 require openjdk-8-release-72b05.inc
 require openjdk-8-native.inc
-
-PROVIDES = "virtual/java-native virtual/javac-native"
-
-inherit update-alternatives
-
-ALTERNATIVE_${PN} = "java javac jar pack200 unpack200 keytool"
-ALTERNATIVE_LINK[java] = "${bindir}/java"
-ALTERNATIVE_TARGET[java] = "${JDK_HOME}/bin/java"
-ALTERNATIVE_PRIORITY[java] = "100"
-ALTERNATIVE_LINK[javac] = "${bindir}/javac"
-ALTERNATIVE_TARGET[javac] = "${JDK_HOME}/bin/javac"
-ALTERNATIVE_PRIORITY[javac] = "100"
-ALTERNATIVE_LINK[jar] = "${bindir}/jar"
-ALTERNATIVE_TARGET[jar] = "${JDK_HOME}/bin/jar"
-ALTERNATIVE_PRIORITY[jar] = "100"
-ALTERNATIVE_LINK[pack200] = "${bindir}/pack200"
-ALTERNATIVE_TARGET[pack200] = "${JDK_HOME}/bin/pack200"
-ALTERNATIVE_PRIORITY[pack200] = "100"
-ALTERNATIVE_LINK[unpack200] = "${bindir}/unpack200"
-ALTERNATIVE_TARGET[unpack200] = "${JDK_HOME}/bin/unpack200"
-ALTERNATIVE_PRIORITY[unpack200] = "100"
-ALTERNATIVE_LINK[keytool] = "${bindir}/keytool"
-ALTERNATIVE_TARGET[keytool] = "${JDK_HOME}/bin/keytool"
-ALTERNATIVE_PRIORITY[keytool] = "100"
-
-# PR = "${INC_PR}.1"
-- 
1.9.1


