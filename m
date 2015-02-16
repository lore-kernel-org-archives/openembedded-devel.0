Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3D318606E8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 21:55:46 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id bs8so28838602wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 13:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+qmOd27cqNS3J01ULd/PUZAV5BwTO6N3mMqEPTse0qM=;
	b=rpPOtpSjPxxRJxf4kTqIe3YOdf5w34drUkOiv+FWyMDegSOnf2Wpuf+DZWi3rQxf9I
	dSMW8lFNqqNVqSaghZpRew1HS8ur7jgOPQV+MVe4UV0FcbikgAy8tok1h/xDUZVrcwdy
	WkwNR8a520u9QQhYVp0gOtOOx7kHtf4aUH8GmvNilmad1h9gJI6fbjYj0rldSjAaMFZ3
	07c1NLXVukCKwcTEa2mRALuorrW829xboUTiywGhrmYbTjPR/sr3GDFsJ/0X2B1se26e
	ORlzGIxpFqSn4HDDNwgn5jLq8SooJcKsRASQ10xVQ2FHg6gMAqRF05u3LBLycvQSQ/xn
	Isrw==
X-Received: by 10.180.82.129 with SMTP id i1mr46493108wiy.77.1424123747646;
	Mon, 16 Feb 2015 13:55:47 -0800 (PST)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by mx.google.com with ESMTPSA id p1sm365956wib.23.2015.02.16.13.55.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Feb 2015 13:55:46 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Feb 2015 22:55:28 +0100
Message-Id: <1424123733-16696-2-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1424123733-16696-1-git-send-email-max.oss.09@gmail.com>
References: <1424123733-16696-1-git-send-email-max.oss.09@gmail.com>
Subject: [meta-java][PATCH 1/7] cleanup whitespace in tasks
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Feb 2015 21:55:49 -0000

Indent with 4 spaces in task definitions.

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 recipes-core/jakarta-commons/jakarta-commons.inc | 66 ++++++++++++------------
 recipes-core/xml-commons/jaxme_0.5.2.bb          | 39 +++++++-------
 recipes-core/xml-commons/xom_1.1.bb              | 26 +++++-----
 recipes-core/xml-commons/xpp2_2.1.10.bb          | 22 ++++----
 recipes-core/xml-commons/xpp3_1.1.3.4.O.bb       | 38 +++++++-------
 recipes-extended/hsqldb/hsqldb_1.8.0.10.bb       | 26 +++++-----
 6 files changed, 108 insertions(+), 109 deletions(-)

diff --git a/recipes-core/jakarta-commons/jakarta-commons.inc b/recipes-core/jakarta-commons/jakarta-commons.inc
index 4f7b700..bd85610 100644
--- a/recipes-core/jakarta-commons/jakarta-commons.inc
+++ b/recipes-core/jakarta-commons/jakarta-commons.inc
@@ -21,42 +21,42 @@ CLEAN_PATH = ""
 
 # Some projects have a replaceable version number in their manifest template.
 do_unpackpost() {
-  if [ -d src/conf ]
-  then
-    find src/conf -exec \
-      sed -i -e "s|@version@|${PV}|" {} \;
-  fi
+    if [ -d src/conf ]
+    then
+        find src/conf -exec \
+        sed -i -e "s|@version@|${PV}|" {} \;
+    fi
 }
 
 addtask unpackpost after do_unpack before do_patch
 # Compile step is very similar for Jakarta commons packages
 do_compile() {
-  mkdir -p build
-
-  if [ "${CP}" ]
-  then
-     oe_makeclasspath cp -s ${CP}
-  else
-     cp=.
-  fi
-
-  echo "javac -sourcepath ${COMPILE_SOURCEPATH} -cp $cp -d build \`find ${MAINSOURCES} ${COMPILE_FINDARGS}\`"
-  javac -sourcepath ${COMPILE_SOURCEPATH} -cp $cp -d build `find ${MAINSOURCES} ${COMPILE_FINDARGS}`
-
-  # Copy extraneous files
-  echo "(cd ${MAINSOURCES} && find . ${FINDARGS} -exec cp {} ../../build/{} \;)"
-  (cd ${MAINSOURCES} && find . ${FINDARGS} -exec cp {} ../../build/{} \;)
-
-	# Optionally remove stuff after compilation (needed for sourcepath hacks).
-	if [ ${CLEAN_PATH} ]; then
-		rm -rf ${CLEAN_PATH}
-	fi
-
-  # Some projects have manifest, some have not. This works for both.
-  if [ -f src/conf/MANIFEST.MF ]
-  then
-    fastjar cfm ${JARFILENAME} src/conf/MANIFEST.MF -C build .
-  else
-    fastjar cf ${JARFILENAME} -C build .
-  fi
+    mkdir -p build
+
+    if [ "${CP}" ]
+    then
+       oe_makeclasspath cp -s ${CP}
+    else
+       cp=.
+    fi
+
+    echo "javac -sourcepath ${COMPILE_SOURCEPATH} -cp $cp -d build \`find ${MAINSOURCES} ${COMPILE_FINDARGS}\`"
+    javac -sourcepath ${COMPILE_SOURCEPATH} -cp $cp -d build `find ${MAINSOURCES} ${COMPILE_FINDARGS}`
+
+    # Copy extraneous files
+    echo "(cd ${MAINSOURCES} && find . ${FINDARGS} -exec cp {} ../../build/{} \;)"
+    (cd ${MAINSOURCES} && find . ${FINDARGS} -exec cp {} ../../build/{} \;)
+
+    # Optionally remove stuff after compilation (needed for sourcepath hacks).
+    if [ ${CLEAN_PATH} ]; then
+        rm -rf ${CLEAN_PATH}
+    fi
+
+    # Some projects have manifest, some have not. This works for both.
+    if [ -f src/conf/MANIFEST.MF ]
+    then
+        fastjar cfm ${JARFILENAME} src/conf/MANIFEST.MF -C build .
+    else
+        fastjar cf ${JARFILENAME} -C build .
+    fi
 }
diff --git a/recipes-core/xml-commons/jaxme_0.5.2.bb b/recipes-core/xml-commons/jaxme_0.5.2.bb
index 304c06d..65b406e 100644
--- a/recipes-core/xml-commons/jaxme_0.5.2.bb
+++ b/recipes-core/xml-commons/jaxme_0.5.2.bb
@@ -16,27 +16,26 @@ inherit java-library
 DEPENDS = "fastjar-native log4j1.2 xerces-j xalan-j commons-codec hsqldb antlr antlr-native"
 
 do_compile() {
-	oe_makeclasspath cp -s log4j-1.2 xercesImpl xalan2 commons-codec hsqldb antlr
-  cp=build-api:build-jaxme:build-js:build-xs:build-pm:$cp
+    oe_makeclasspath cp -s log4j-1.2 xercesImpl xalan2 commons-codec hsqldb antlr
+    cp=build-api:build-jaxme:build-js:build-xs:build-pm:$cp
 
+    jaxme_build src/api build-api $cp jaxmeapi-${PV}.jar
 
-	jaxme_build src/api build-api $cp jaxmeapi-${PV}.jar
+    runantlr -o src/js/org/apache/ws/jaxme/js/jparser src/js/org/apache/ws/jaxme/js/jparser/java15.g
+    jaxme_build src/js build-js $cp jaxmejs-${PV}.jar
 
-	runantlr -o src/js/org/apache/ws/jaxme/js/jparser src/js/org/apache/ws/jaxme/js/jparser/java15.g
-	jaxme_build src/js build-js $cp jaxmejs-${PV}.jar
+    jaxme_build src/xs build-xs $cp jaxmexs-${PV}.jar
 
-	jaxme_build src/xs build-xs $cp jaxmexs-${PV}.jar
+    jaxme_build src/jaxme build-jaxme $cp ${JARFILENAME}
 
-	jaxme_build src/jaxme build-jaxme $cp ${JARFILENAME}
-
-#	jaxme_build src/pm build-pm $cp jaxmepm-${PV}.jar
+#    jaxme_build src/pm build-pm $cp jaxmepm-${PV}.jar
 }
 
 do_install_append() {
-	oe_jarinstall jaxmeapi-${PV}.jar jaxmeapi.jar
-	oe_jarinstall jaxmejs-${PV}.jar jaxmejs.jar
-	oe_jarinstall jaxmexs-${PV}.jar jaxmexs.jar
-	oe_jarinstall jaxmepm-${PV}.jar jaxmepm.jar
+    oe_jarinstall jaxmeapi-${PV}.jar jaxmeapi.jar
+    oe_jarinstall jaxmejs-${PV}.jar jaxmejs.jar
+    oe_jarinstall jaxmexs-${PV}.jar jaxmexs.jar
+    oe_jarinstall jaxmepm-${PV}.jar jaxmepm.jar
 }
 
 # Compile helper
@@ -45,17 +44,17 @@ do_install_append() {
 # 3 - classpath
 # 4 - jar file name
 jaxme_build() {
-  mkdir -p $2
+    mkdir -p $2
 
-	ant_sourcepath=${WORKDIR}/apache-ant-1.7.1/src/main
+    ant_sourcepath=${WORKDIR}/apache-ant-1.7.1/src/main
 
-  echo "javac -sourcepath $ant_sourcepath:$1 -cp $3 -d $2 \`find $1 -name "*.java"\`"
-  javac -sourcepath $ant_sourcepath:$1 -cp $3 -d $2 `find $1 -name "*.java" -and -not \( -wholename "*junit*" -or -wholename "*examples*" \) `
-  (cd $1 && find . -name "*.properties" -exec cp {} ${S}/$2/{} \;)
+    echo "javac -sourcepath $ant_sourcepath:$1 -cp $3 -d $2 \`find $1 -name "*.java"\`"
+    javac -sourcepath $ant_sourcepath:$1 -cp $3 -d $2 `find $1 -name "*.java" -and -not \( -wholename "*junit*" -or -wholename "*examples*" \) `
+    (cd $1 && find . -name "*.properties" -exec cp {} ${S}/$2/{} \;)
 
-	rm -rf $2/org/apache/tools
+    rm -rf $2/org/apache/tools
 
-  fastjar -C $2 -c -f $4 .
+    fastjar -C $2 -c -f $4 .
 }
 
 SRC_URI[archive.md5sum] = "084ebfe4a816058f8ff6bd731fa70df4"
diff --git a/recipes-core/xml-commons/xom_1.1.bb b/recipes-core/xml-commons/xom_1.1.bb
index 697e01d..56701b2 100644
--- a/recipes-core/xml-commons/xom_1.1.bb
+++ b/recipes-core/xml-commons/xom_1.1.bb
@@ -16,24 +16,24 @@ inherit java-library
 DEPENDS = "fastjar-native xerces-j xalan-j"
 
 do_compile() {
-  mkdir -p build
+    mkdir -p build
 
-	oe_makeclasspath cp -s xercesImpl xalan2
-  cp=build:$cp
+    oe_makeclasspath cp -s xercesImpl xalan2
+    cp=build:$cp
 
-	scp="${WORKDIR}/jaxen-1.1.1/src/java/main"
-                 
-  javac -sourcepath src:$scp -cp $cp -d build `find src -name "*.java" -and -not \( -wholename "*tests*" -or -wholename "*samples*" -or -wholename "*tools*" \)`
-  javac -sourcepath fatsrc:$scp -cp $cp -d build `find fatsrc -name "*.java" -and -not \( -wholename "*tests*" -or -wholename "*samples*" -or -wholename "*tools*" \)`
-  javac -sourcepath src15:$scp -cp $cp -d build `find src15 -name "*.java" -and -not \( -wholename "*tests*" -or -wholename "*samples*" -or -wholename "*tools*" \)`
+    scp="${WORKDIR}/jaxen-1.1.1/src/java/main"
 
-  (cd src && find . -name "*.properties" -exec cp {} ../build/{} \;)
+    javac -sourcepath src:$scp -cp $cp -d build `find src -name "*.java" -and -not \( -wholename "*tests*" -or -wholename "*samples*" -or -wholename "*tools*" \)`
+    javac -sourcepath fatsrc:$scp -cp $cp -d build `find fatsrc -name "*.java" -and -not \( -wholename "*tests*" -or -wholename "*samples*" -or -wholename "*tools*" \)`
+    javac -sourcepath src15:$scp -cp $cp -d build `find src15 -name "*.java" -and -not \( -wholename "*tests*" -or -wholename "*samples*" -or -wholename "*tools*" \)`
 
-	#	Remove Jaxen classes from build
-	rm -rf build/org/jaxen
-	rm -rf build/org/w3c
+    (cd src && find . -name "*.properties" -exec cp {} ../build/{} \;)
 
-  fastjar -C build -c -f ${JARFILENAME} .
+    # Remove Jaxen classes from build
+    rm -rf build/org/jaxen
+    rm -rf build/org/w3c
+
+    fastjar -C build -c -f ${JARFILENAME} .
 }
 
 SRC_URI[archive.md5sum] = "e5ae82568d7b1faeb950140c34fbbcb1"
diff --git a/recipes-core/xml-commons/xpp2_2.1.10.bb b/recipes-core/xml-commons/xpp2_2.1.10.bb
index 2239173..54d69f4 100644
--- a/recipes-core/xml-commons/xpp2_2.1.10.bb
+++ b/recipes-core/xml-commons/xpp2_2.1.10.bb
@@ -12,22 +12,22 @@ inherit java-library
 DEPENDS = "fastjar-native virtual/javac-native"
 
 do_compile() {
-	if [ -d build-oe ]; then
-		rm -rf build-oe
-	fi
-  mkdir -p build-oe
+    if [ -d build-oe ]; then
+        rm -rf build-oe
+    fi
+    mkdir -p build-oe
 
-	sourcepath="src/java/drivers/jaxp11:src/java/drivers/sax2:src/java/impl/factory:src/java/impl/format:src/java/impl/node:src/java/impl/pullparser:src/java/impl/tag:src/java/intf"
+    sourcepath="src/java/drivers/jaxp11:src/java/drivers/sax2:src/java/impl/factory:src/java/impl/format:src/java/impl/node:src/java/impl/pullparser:src/java/impl/tag:src/java/intf"
 
-	findpath="${sourcepath//:/ }"
+    findpath="${sourcepath//:/ }"
 
-  javac -sourcepath $sourcepath -d build-oe `find $findpath -name "*.java"`
+    javac -sourcepath $sourcepath -d build-oe `find $findpath -name "*.java"`
 
-	mkdir -p build-oe/META-INF/services
-	cp src/java/drivers/jaxp11/META-INF/services/javax.xml.parsers.SAXParserFactory build-oe/META-INF/services
-	cp src/java/impl/factory/META-INF/services/org.gjt.xpp.XmlPullParserFactory build-oe/META-INF/services
+    mkdir -p build-oe/META-INF/services
+    cp src/java/drivers/jaxp11/META-INF/services/javax.xml.parsers.SAXParserFactory build-oe/META-INF/services
+    cp src/java/impl/factory/META-INF/services/org.gjt.xpp.XmlPullParserFactory build-oe/META-INF/services
 
-  fastjar -C build-oe -c -f ${JARFILENAME} .
+    fastjar -C build-oe -c -f ${JARFILENAME} .
 }
 
 SRC_URI[md5sum] = "865ca4e2496c215d301b57450137626f"
diff --git a/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb b/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
index 40f7cb2..b87cccd 100644
--- a/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
+++ b/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
@@ -12,34 +12,34 @@ DEPENDS = "fastjar-native virtual/javac-native"
 PACKAGES = "libxpp3-xpath-java ${JPN}"
 
 do_compile() {
-	if [ -d build-oe ]; then
-		rm -rf build-oe
-	fi
-  mkdir -p build-oe
+    if [ -d build-oe ]; then
+        rm -rf build-oe
+    fi
+    mkdir -p build-oe
 
-	sourcepath="src/java/api:src/java/builder:src/java/dom2_builder:src/java/mxp1_min:src/java/mxp1_standard:src/java/parser_pool:src/java/sax2_driver:src/java/serializer_impl:src/java/util:src/java/wrapper"
-	findpath="${sourcepath//:/ }"
+    sourcepath="src/java/api:src/java/builder:src/java/dom2_builder:src/java/mxp1_min:src/java/mxp1_standard:src/java/parser_pool:src/java/sax2_driver:src/java/serializer_impl:src/java/util:src/java/wrapper"
+    findpath="${sourcepath//:/ }"
 
-  javac -sourcepath $sourcepath -d build-oe `find $findpath -name "*.java"`
+    javac -sourcepath $sourcepath -d build-oe `find $findpath -name "*.java"`
 
-	mkdir -p build-oe/META-INF/services
-	cp src/java/mxp1_standard/META-INF/services/org.xml* build-oe/META-INF/services
-  fastjar -C build-oe -c -f ${JARFILENAME} .
+    mkdir -p build-oe/META-INF/services
+    cp src/java/mxp1_standard/META-INF/services/org.xml* build-oe/META-INF/services
+    fastjar -C build-oe -c -f ${JARFILENAME} .
 
-	if [ -d build-xpath ]; then
-		rm -rf build-xpath
-	fi
-  mkdir -p build-xpath
+    if [ -d build-xpath ]; then
+        rm -rf build-xpath
+    fi
+    mkdir -p build-xpath
 
-	sourcepath="src/java/xpath"
-	findpath="${sourcepath//:/ }"
-  javac -sourcepath $sourcepath -cp build-oe -d build-xpath `find $findpath -name "*.java"`
+    sourcepath="src/java/xpath"
+    findpath="${sourcepath//:/ }"
+    javac -sourcepath $sourcepath -cp build-oe -d build-xpath `find $findpath -name "*.java"`
 
-  fastjar -C build-xpath -c -f xpp3-xpath-${PV}.jar .
+    fastjar -C build-xpath -c -f xpp3-xpath-${PV}.jar .
 }
 
 do_install_append() {
-	oe_jarinstall xpp3-xpath-${PV}.jar xpp3-xpath.jar
+    oe_jarinstall xpp3-xpath-${PV}.jar xpp3-xpath.jar
 }
 
 FILES_libxpp3-xpath-java = "${datadir}/java/xpp3-xpath*"
diff --git a/recipes-extended/hsqldb/hsqldb_1.8.0.10.bb b/recipes-extended/hsqldb/hsqldb_1.8.0.10.bb
index e886ae4..ff4908a 100644
--- a/recipes-extended/hsqldb/hsqldb_1.8.0.10.bb
+++ b/recipes-extended/hsqldb/hsqldb_1.8.0.10.bb
@@ -14,25 +14,25 @@ inherit java-library
 DEPENDS = "fastjar-native servlet2.4"
 
 do_compile() {
-  # Build instructions according to build/buildJDK14.bat
-        mkdir -p classes
+    # Build instructions according to build/buildJDK14.bat
+    mkdir -p classes
 
-        oe_makeclasspath cp -s servlet-api-2.4
+    oe_makeclasspath cp -s servlet-api-2.4
 
-        javac -sourcepath src -cp $cp -d build `find src -name "*.java" -and -not -wholename "*test*"`
+    javac -sourcepath src -cp $cp -d build `find src -name "*.java" -and -not -wholename "*test*"`
 
-        mkdir -p classes/org/hsqldb/util
-        mkdir -p classes/org/hsqldb/util/sqltool
-        mkdir -p classes/org/hsqldb/resources
+    mkdir -p classes/org/hsqldb/util
+    mkdir -p classes/org/hsqldb/util/sqltool
+    mkdir -p classes/org/hsqldb/resources
 
-        cp src/org/hsqldb/util/*.gif classes/org/hsqldb/util/
-        cp src/org/hsqldb/util/*.png classes/org/hsqldb/util/
-        cp src/org/hsqldb/util/*.properties classes/org/hsqldb/util/
-        cp src/org/hsqldb/util/sqltool/*.text classes/org/hsqldb/util/sqltool/
+    cp src/org/hsqldb/util/*.gif classes/org/hsqldb/util/
+    cp src/org/hsqldb/util/*.png classes/org/hsqldb/util/
+    cp src/org/hsqldb/util/*.properties classes/org/hsqldb/util/
+    cp src/org/hsqldb/util/sqltool/*.text classes/org/hsqldb/util/sqltool/
 
-        cp src/org/hsqldb/resources/*.properties classes/org/hsqldb/resources
+    cp src/org/hsqldb/resources/*.properties classes/org/hsqldb/resources
 
-  fastjar -C classes -c -f ${JARFILENAME} .
+    fastjar -C classes -c -f ${JARFILENAME} .
 }
 
 SRC_URI[md5sum] = "17410483b5b5f267aa18b7e00b65e6e0"
-- 
1.9.3


