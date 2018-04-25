Return-Path: <andre.draszik@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id D001C7454C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 15:03:05 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id q22so517529pff.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 08:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=23E+YkcFobJ72zgQ0IZ951lHMlBOyM70SgknbuStox0=;
	b=VmC0vRqWFjroHrt72DIwCHWOy3JmgnrlJ7Uz+T+ag9THse/bvuWNg89ozsbrZ0aB9W
	ZRkxU8wZitB4IyT+2HkTeSbik0sZ7WXLKBGr2OlfBMiNvUtWN3KToE5OkDf/y+e0fO6B
	FNSiCg40Rc7wtSvmtkqVD9wtoCZD/3EsXfUl09HpIiB4IBaM3onFubG/GDEtXmgIx1AU
	4sV9x8SY3DQczCTI/T0c/6msk4r5dhJBmNAgJxclS81yJWSL1twM+KSHBXHW9LY99VkW
	eLDrR+kQVe0RFQEU7wPJPYx1hZCTRhR+dhoWLWxBNpSAELGKChGNkCPqf3Z6pTItzJKa
	ixpg==
X-Gm-Message-State: ALQs6tDQmnNHXx+7kpoNzDgZ4S/W9laUtrCe3ax4ADtH3y+/fMLbQTam
	fNHaFfbkzMa9ZaxhyNTrXrSX956V
X-Google-Smtp-Source: AIpwx49Wb6uQu82P6ZxHJYXsBXBY35GqOAzN8ZyFUPUjyD7FFPQ83zRyRlSEu8fqd20punoU403XTg==
X-Received: by 2002:a17:902:8e8a:: with SMTP id
	bg10-v6mr29972104plb.329.1524668585919; 
	Wed, 25 Apr 2018 08:03:05 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	y3sm25603364pgc.81.2018.04.25.08.03.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Apr 2018 08:03:05 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Apr 2018 16:02:58 +0100
Message-Id: <20180425150258.8606-1-git@andred.net>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
Subject: [meta-java][PATCH] classpath: harmonise -native and -initial-native recipes
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
X-List-Received-Date: Wed, 25 Apr 2018 15:03:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

removing lots of code-duplication

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 .../classpath/classpath-initial-native_0.93.bb     | 54 ++++++++++------------
 recipes-core/classpath/classpath-native.inc        | 25 +++++-----
 recipes-core/classpath/classpath-native_0.99.bb    | 31 ++++++-------
 3 files changed, 51 insertions(+), 59 deletions(-)

diff --git a/recipes-core/classpath/classpath-initial-native_0.93.bb b/recipes-core/classpath/classpath-initial-native_0.93.bb
index 0cfa693..51229ec 100644
--- a/recipes-core/classpath/classpath-initial-native_0.93.bb
+++ b/recipes-core/classpath/classpath-initial-native_0.93.bb
@@ -4,7 +4,6 @@
 require classpath-native.inc
 
 DESCRIPTION="Java1.4-compatible GNU Classpath variant that is used as bootclasspath for jikes-native."
-LIC_FILES_CHKSUM = "file://COPYING;md5=af0004801732bc4b20d90f351cf80510"
 DEPENDS += "jikes-native"
 
 PR = "${INC_PR}.2"
@@ -13,38 +12,35 @@ SRC_URI += " \
 	    file://autotools.patch \
 	    file://miscompilation.patch \
 	   "
+SRC_URI[md5sum] = "ffa9e9cac31c5acbf0ea9eff9efa923d"
+SRC_URI[sha256sum] = "df2d093612abd23fe67e9409d89bb2a8e79b1664fe2b2da40e1c8ed693e32945"
 
-EXTRA_OECONF = " \
-                --with-jikes=jikes \
-                --with-fastjar=fastjar \
-                --with-glibj \
-                --disable-Werror \
-                --disable-local-sockets \
-                --disable-alsa \
-                --disable-gconf-peer \
-                --disable-gtk-peer \
-                --disable-plugin \
-                --disable-dssi \
-                --disable-examples \
-                --with-glibj-dir=${STAGING_DATADIR_NATIVE}/classpath-initial \
-                --with-native-libdir=${STAGING_LIBDIR_NATIVE}/classpath-initial \
-                --includedir=${STAGING_INCDIR_NATIVE}/classpath-initial \
-                --with-vm=java \
-              "
+EXTRA_OECONF += "\
+    --with-jikes=jikes \
+    --with-fastjar=fastjar \
+    --disable-local-sockets \
+    --with-glibj-dir=${STAGING_DATADIR_NATIVE}/classpath-initial \
+    --with-native-libdir=${STAGING_LIBDIR_NATIVE}/classpath-initial \
+    --includedir=${STAGING_INCDIR_NATIVE}/classpath-initial \
+    --with-vm=java \
+"
 
 # Ensure tools.zip is not installed at same path as classpath-native
 EXTRA_OEMAKE += "pkgdatadir=${STAGING_DATADIR_NATIVE}/classpath-initial"
 
-# remove files clashing with classpath-native in sysroot
 do_install_append() {
-
-	for i in gappletviewer gjarsigner gkeytool gjar gnative2ascii gserialver grmiregistry gtnameserv gorbd grmid
-	do
-		rm ${D}${bindir}/${i}
-	done
-	rm ${D}${libdir}/logging.properties
-	rm ${D}${libdir}/security/classpath.security
+    # remove files clashing with classpath-native in sysroot
+    rm \
+       ${D}${bindir}/gappletviewer \
+       ${D}${bindir}/gjarsigner \
+       ${D}${bindir}/gkeytool \
+       ${D}${bindir}/gjar \
+       ${D}${bindir}/gnative2ascii \
+       ${D}${bindir}/gserialver \
+       ${D}${bindir}/grmiregistry \
+       ${D}${bindir}/gtnameserv \
+       ${D}${bindir}/gorbd \
+       ${D}${bindir}/grmid \
+       ${D}${libdir}/logging.properties \
+       ${D}${libdir}/security/classpath.security
 }
-SRC_URI[md5sum] = "ffa9e9cac31c5acbf0ea9eff9efa923d"
-SRC_URI[sha256sum] = "df2d093612abd23fe67e9409d89bb2a8e79b1664fe2b2da40e1c8ed693e32945"
-
diff --git a/recipes-core/classpath/classpath-native.inc b/recipes-core/classpath/classpath-native.inc
index 6a56337..b1de458 100644
--- a/recipes-core/classpath/classpath-native.inc
+++ b/recipes-core/classpath/classpath-native.inc
@@ -1,6 +1,7 @@
 SUMMARY = "GNU Classpath standard Java libraries - For native Java-dependent programs"
 HOMEPAGE = "http://www.gnu.org/software/classpath/"
 LICENSE = "GPL-2.0 & SAX-PD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=af0004801732bc4b20d90f351cf80510"
 
 DEPENDS = "fastjar-native zip-native"
 
@@ -14,17 +15,13 @@ export JAVA="${STAGING_BINDIR_NATIVE}/java-initial"
 export JAVAC="${STAGING_BINDIR_NATIVE}/ecj-initial"
 export JAVACFLAGS="-nowarn"
 
-EXTRA_OECONF = " \
-                --with-glibj \
-                --enable-local-sockets \
-                --disable-Werror \
-                --disable-alsa \
-                --disable-gconf-peer \
-                --disable-gtk-peer \
-                --disable-plugin \
-                --disable-dssi \
-                --disable-gjdoc \
-                --disable-examples \
-                --enable-tools \
-                --includedir=${STAGING_INCDIR}/classpath \
-               "
+EXTRA_OECONF = "\
+    --with-glibj \
+    --disable-Werror \
+    --disable-alsa \
+    --disable-gconf-peer \
+    --disable-gtk-peer \
+    --disable-plugin \
+    --disable-dssi \
+    --disable-examples \
+"
diff --git a/recipes-core/classpath/classpath-native_0.99.bb b/recipes-core/classpath/classpath-native_0.99.bb
index a97cae0..a1e1e0f 100644
--- a/recipes-core/classpath/classpath-native_0.99.bb
+++ b/recipes-core/classpath/classpath-native_0.99.bb
@@ -1,6 +1,5 @@
 require classpath-native.inc
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=af0004801732bc4b20d90f351cf80510"
 DEPENDS += "classpath-initial-native ecj-initial-native virtual/java-initial-native"
 
 PR = "${INC_PR}.0"
@@ -12,21 +11,21 @@ SRC_URI += " \
             file://miscompilation.patch \
             file://toolwrapper-exithook.patch \
            "
-
-# tools using java-initial rather than java sed it out
-do_compile_append () {
-
-	COMMANDS="gappletviewer gjarsigner gkeytool \
-                  gjar gnative2ascii gserialver grmiregistry \
-                  gtnameserv gorbd grmid grmic gjavah \
-                 "
-
-        for i in ${COMMANDS};
-        do
-                 sed -i -e "s/java-initial/java/g" tools/${i}
-        done
-}
-
 SRC_URI[md5sum] = "0ae1571249172acd82488724a3b8acb4"
 SRC_URI[sha256sum] = "f929297f8ae9b613a1a167e231566861893260651d913ad9b6c11933895fecc8"
 
+EXTRA_OECONF += "\
+    --enable-local-sockets \
+    --disable-gjdoc \
+    --enable-tools \
+    --includedir=${STAGING_INCDIR}/classpath \
+"
+
+do_compile_append () {
+    # tools using java-initial rather than java sed it out
+    cd tools
+    sed -e "s/java-initial/java/g" \
+        -i gappletviewer gjarsigner gkeytool \
+           gjar gnative2ascii gserialver grmiregistry \
+           gtnameserv gorbd grmid grmic gjavah
+}
-- 
2.16.2


