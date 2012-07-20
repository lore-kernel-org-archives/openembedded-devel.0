Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ss5nK-0005i3-7A
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jul 2012 07:30:30 +0200
Received: by pbbrq2 with SMTP id rq2so4953833pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 22:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=inX1bZH0txY+mRfTQg0LCeVQKucL0g8OSBkd3nw7Q00=;
	b=tTbALvMHqENLaAzSoHFFNcqZQnMe1mYRhqX51IB5EhkUz/LIhfyNwuFjfghm5e3ger
	ez/XinIuKffLNwSJDodAgwlS6i8+31PxjDKEJrI87DDcTkAwYibLjIALRy80d3m/3Kbz
	1ssRUqZO1iEJb/5BVIZp4LR5Jg8kIAKn9olKuWBkfoxTLznTU2RvyjyW8d1zk34z08Xq
	XSD6c7PI6PrJp46uzunB4Ho1M3f9Q0purAepwnrHsa5Dizu9LuIFT9MlpD0AfwmZ2biV
	u1BPLkGa2SlcNlP7FgbEw8stPpgQDu7NcQaNEiPiurhfwfBsMRRFIxNyj2NDbsmggq8m
	R69w==
Received: by 10.68.222.163 with SMTP id qn3mr10673519pbc.135.1342761546828;
	Thu, 19 Jul 2012 22:19:06 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ng8sm3217474pbc.13.2012.07.19.22.19.05
	(version=SSLv3 cipher=OTHER); Thu, 19 Jul 2012 22:19:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 22:18:58 -0700
Message-Id: <1342761538-19890-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1342761538-19890-1-git-send-email-raj.khem@gmail.com>
References: <1342761538-19890-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-java][PATCH 5/5] log4j1.2: Upgrade recipe to 1.2.17 release
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
X-List-Received-Date: Fri, 20 Jul 2012 05:30:30 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-core/jakarta-libs/log4j1.2_1.2.15.bb |   36 --------------------------
 recipes-core/jakarta-libs/log4j1.2_1.2.17.bb |   35 +++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 36 deletions(-)
 delete mode 100644 recipes-core/jakarta-libs/log4j1.2_1.2.15.bb
 create mode 100644 recipes-core/jakarta-libs/log4j1.2_1.2.17.bb

diff --git a/recipes-core/jakarta-libs/log4j1.2_1.2.15.bb b/recipes-core/jakarta-libs/log4j1.2_1.2.15.bb
deleted file mode 100644
index 6a88ab0..0000000
--- a/recipes-core/jakarta-libs/log4j1.2_1.2.15.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-DESCRIPTION = "Java library to help the programmer output log statements to a variety of output targets"
-AUTHOR = "Apache Software Foundation"
-LICENSE = "AL2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f4ce41a6d1028498fcacde12f589bce7"
-
-SRC_URI = "http://archive.apache.org/dist/logging/log4j/${PV}/apache-log4j-${PV}.tar.gz"
-
-inherit java-library
-
-S = "${WORKDIR}/apache-log4j-${PV}"
-
-DEPENDS = "gnumail gnujaf"
-DEPENDS_virtclass-native = "gnumail-native gnujaf-native"
-
-
-JARFILENAME = "log4j-${PV}.jar"
-ALTJARFILENAMES = "log4j-1.2.jar log4j1.2.jar"
-
-do_compile() {
-  mkdir -p build
-
-  oe_makeclasspath cp -s activation gnumail
-
-  # Built everything but the JMS and JMX classes (like in Debian)
-	javac -sourcepath src/main/java -cp $cp -d build `find src/main/java -name "*.java" -and -not \( -iwholename "*jms*" -or -iwholename "*jmx*" \)`
-
-  cp -R src/main/resources/* build/
-
-  fastjar -C build -c -f ${JARFILENAME} .
-}
-
-SRC_URI[md5sum] = "10f04abe4d68d5a89e8eb167e4e45e1a"
-SRC_URI[sha256sum] = "f5d9f6aa78b9156ae2de2a32d0f26507d2e73db4993d501db2e79f0bd803ab31"
-
-BBCLASSEXTEND = "native"
-
diff --git a/recipes-core/jakarta-libs/log4j1.2_1.2.17.bb b/recipes-core/jakarta-libs/log4j1.2_1.2.17.bb
new file mode 100644
index 0000000..b37eb05
--- /dev/null
+++ b/recipes-core/jakarta-libs/log4j1.2_1.2.17.bb
@@ -0,0 +1,35 @@
+DESCRIPTION = "Java library to help the programmer output log statements to a variety of output targets"
+AUTHOR = "Apache Software Foundation"
+LICENSE = "AL2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f4ce41a6d1028498fcacde12f589bce7"
+
+SRC_URI = "http://archive.apache.org/dist/logging/log4j/${PV}/log4j-${PV}.tar.gz"
+
+inherit java-library
+
+DEPENDS = "gnumail gnujaf"
+DEPENDS_virtclass-native = "gnumail-native gnujaf-native"
+
+S = "${WORKDIR}/apache-log4j-${PV}"
+
+JARFILENAME = "log4j-${PV}.jar"
+ALTJARFILENAMES = "log4j-1.2.jar log4j1.2.jar"
+
+do_compile() {
+  mkdir -p build
+
+  oe_makeclasspath cp -s activation gnumail
+
+  # Built everything but the JMS and JMX classes (like in Debian)
+	javac -sourcepath src/main/java -cp $cp -d build `find src/main/java -name "*.java" -and -not \( -iwholename "*jms*" -or -iwholename "*jmx*" \)`
+
+  cp -R src/main/resources/* build/
+
+  fastjar -C build -c -f ${JARFILENAME} .
+}
+
+SRC_URI[md5sum] = "8218714e41ee0c6509dcfeafa2e1f53f"
+SRC_URI[sha256sum] = "a528e3771ee6234661b5eb0fa02e14faee89dfec38de94088c163ddf2a0a8663"
+
+BBCLASSEXTEND = "native"
+
-- 
1.7.9.5



