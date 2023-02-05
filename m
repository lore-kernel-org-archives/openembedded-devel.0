Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02835C636CC
	for <webhook@archiver.kernel.org>; Sun,  5 Feb 2023 17:34:49 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.33780.1675618479365637020
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Feb 2023 09:34:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redrectangle.org header.s=gm1 header.b=HK3iD0yk;
 spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.178.230, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 85B32240002;
	Sun,  5 Feb 2023 17:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=gm1; t=1675618477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Z+So+nNDJ5CK8C3wFnW5cPlsCjxTis6GkoVUstubL+o=;
	b=HK3iD0ykTNlqXcBB7mRbbmhBajYoE5hsu/PpTDMdzJmDW779Lk8qJ08Q/3nnZXckpu2gHq
	RNNl71B4hHq9XznuYb1aK0UzYv97+whlrnaVhlTA07dwj2uOcC9+F15+r/z3rXUQooaIjP
	gc3BCJxyeEZhEXV3MSomIfJ2s9pifrAdjbiWYKjKjXdVHb/rEJZZ3dP8x2AjRnrHrLgfTt
	BqQcJAYgEPxjM6eWTrdOZhldodANeAbux3PKc5SNox7anDd0EdrJcIMCPkXGeheQcluRni
	eUNsGHUlK/g3dwPQ0p5cbVZYqdylHq0Ii5vD5A5brY4aqmyyAGiqnsBQ4mi1ew==
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [meta-java][PATCH] temurin-jdk-17-bin/temurin-jre-17-bin: Add recipes
Date: Sun,  5 Feb 2023 09:34:10 -0800
Message-Id: <20230205173410.2327109-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Feb 2023 17:34:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100934

Add recipes for the Adoptium Temurin JDK/JRE binaries. These recipes
support arm, aarch64, ppc64le, and x86-64.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../temurin/temurin-jdk-17-bin_17.0.6+10.bb   | 25 ++++++++
 .../temurin/temurin-jre-17-bin_17.0.6+10.bb   | 23 +++++++
 recipes-core/temurin/temurin.inc              | 62 +++++++++++++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 recipes-core/temurin/temurin-jdk-17-bin_17.0.6+10.bb
 create mode 100644 recipes-core/temurin/temurin-jre-17-bin_17.0.6+10.bb
 create mode 100644 recipes-core/temurin/temurin.inc

diff --git a/recipes-core/temurin/temurin-jdk-17-bin_17.0.6+10.bb b/recipes-core/temurin/temurin-jdk-17-bin_17.0.6+10.bb
new file mode 100644
index 0000000..fe83df5
--- /dev/null
+++ b/recipes-core/temurin/temurin-jdk-17-bin_17.0.6+10.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Temurin JDK Binaries"
+
+JAVA_TYPE = "jdk"
+JAVA_SHA256:aarch64 = "9e0e88bbd9fa662567d0c1e22d469268c68ac078e9e5fe5a7244f56fec71f55f"
+JAVA_SHA256:arm = "fe4d0c6d5bb8cf7f59f7ff82c0c1fd988bbe5cccf3bc7377dc8ae50740b46c82"
+JAVA_SHA256:powerpc64le = "cb772c3fdf3f9fed56f23a37472acf2b80de20a7113fe09933891c6ef0ecde95"
+JAVA_SHA256:x86-64 = "a0b1b9dd809d51a438f5fa08918f9aca7b2135721097f0858cf29f77a35d4289"
+
+require temurin.inc
+
+S = "${WORKDIR}/jdk-${PV}"
+
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE:${PN} = "java javac keytool"
+
+ALTERNATIVE_LINK_NAME[java] = "${bindir}/java"
+ALTERNATIVE_TARGET[java] = "${JAVA_HOME}/bin/java"
+
+ALTERNATIVE_LINK_NAME[javac] = "${bindir}/javac"
+ALTERNATIVE_TARGET[javac] = "${JAVA_HOME}/bin/javac"
+
+ALTERNATIVE_LINK_NAME[keytool] = "${bindir}/keytool"
+ALTERNATIVE_TARGET[keytool] = "${JAVA_HOME}/bin/keytool"
diff --git a/recipes-core/temurin/temurin-jre-17-bin_17.0.6+10.bb b/recipes-core/temurin/temurin-jre-17-bin_17.0.6+10.bb
new file mode 100644
index 0000000..2527437
--- /dev/null
+++ b/recipes-core/temurin/temurin-jre-17-bin_17.0.6+10.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Temurin JRE Binaries"
+
+JAVA_TYPE = "jre"
+JAVA_SHA256:arm = "bf7ef7ba477dc278f913e64174e76be9ae7f014c767352eae83b3f9581494fce"
+JAVA_SHA256:aarch64 = "3797815cb853616b6415e1b8875cda4eaa004887561ea4ea2090d726b8d8582f"
+JAVA_SHA256:powerpc64le = "f11b86bfd7fa4d7a0d05040ea235102296f03eaf064253f76d7ab94baa0352e3"
+JAVA_SHA256:x86-64 = "fe669935609086e76cb0b829e92808766cbf8cb7bda57a76b47813b08584bfd2"
+
+require temurin.inc
+
+S = "${WORKDIR}/jdk-${PV}-jre"
+
+inherit update-alternatives
+
+# Lower than corresponding JDK
+ALTERNATIVE_PRIORITY = "90"
+
+ALTERNATIVE:${PN} = "java keytool"
+ALTERNATIVE_LINK_NAME[java] = "${bindir}/java"
+ALTERNATIVE_TARGET[java] = "${JAVA_HOME}/bin/java"
+
+ALTERNATIVE_LINK_NAME[keytool] = "${bindir}/keytool"
+ALTERNATIVE_TARGET[keytool] = "${JAVA_HOME}/bin/keytool"
diff --git a/recipes-core/temurin/temurin.inc b/recipes-core/temurin/temurin.inc
new file mode 100644
index 0000000..a026598
--- /dev/null
+++ b/recipes-core/temurin/temurin.inc
@@ -0,0 +1,62 @@
+HOMEPAGE = "https://adoptium.net"
+LICENSE = "GPL-2.0-with-classpath-exception"
+LIC_FILES_CHKSUM = "file://NOTICE;md5=8fa9e85281110769de025562c085b3a4"
+
+COMPATIBLE_HOST = "(aarch64|arm|powerpc64le|x86_64).*-linux"
+# Binaries are linked with glibc
+COMPATIBLE_HOST:libc-musl = "null"
+
+JAVA_ARCH:aarch64 = "aarch64"
+JAVA_ARCH:arm = "arm"
+JAVA_ARCH:powerpc64le = "ppc64le"
+JAVA_ARCH:x86-64 = "x64"
+
+# Convert PV to forms needed to download the tarball
+PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
+PV_UNDER = "${@d.getVar('PV').replace('+', '_')}"
+
+SRC_URI = "https://github.com/adoptium/temurin${PV_MAJOR}-binaries/releases/download/jdk-${PV}/OpenJDK${PV_MAJOR}U-${JAVA_TYPE}_${JAVA_ARCH}_linux_hotspot_${PV_UNDER}.tar.gz"
+SRC_URI[sha256sum] = "${JAVA_SHA256}"
+
+# Disable stuff not needed for packaging binaries
+INHIBIT_DEFAULT_DEPS = "1"
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+EXCLUDE_FROM_SHLIBS = "1"
+do_patch[noexec] = "1"
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+JAVA_HOME = "${libdir}/jvm/${BPN}"
+
+do_install() {
+    install -d ${D}${JAVA_HOME}
+    cp -r ${S}/* ${D}${JAVA_HOME}
+}
+
+# The x86-64 binaries assume libraries are in /lib64, but a typical pure 64-bit
+# Yocto image puts them in /lib. If not building a multilib image, add a
+# symlink from /lib64 to /lib.
+do_install:append:x86-64() {
+    if [ -z "${MULTILIBS}" ]; then
+        ln -s /lib ${D}/lib64
+    fi
+}
+
+FILES:${PN} = "${JAVA_HOME}"
+FILES:${PN}:append:x86-64 = " /lib64"
+
+RDEPENDS:${PN} = " \
+    alsa-lib \
+    freetype \
+    glibc \
+    libx11 \
+    libxext \
+    libxi \
+    libxrender \
+    libxtst \
+    zlib \
+"
+
+# Ignore "doesn't have GNU_HASH (didn't pass LDFLAGS?)" errors
+INSANE_SKIP:${PN} += "ldflags"
-- 
2.39.1


