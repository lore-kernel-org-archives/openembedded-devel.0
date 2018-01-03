Return-Path: <liu.ming50@gmail.com>
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id DFFA777EA6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 01:47:51 +0000 (UTC)
Received: by mail-yb0-f194.google.com with SMTP id f201so93300ybg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Jan 2018 17:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7QRxq7KPsUoh08MAkZD+uVdBI2+XMT/JZ8Kh7RvVpGc=;
	b=BGtuHd/+jCIr1Uro8k0GU11w5j3WB68yQ/Il1IFIOecTCyQZPFRW+HzBT97UU8JIdG
	gEWSGW/A5+6g+ZjSiTg7F4nOP66qNNW40m1aiBifQdApSzsqTP73SW8jEz/wYjR0DuYd
	3CuwWTnNYcegHPF5thlptvGkZgzva/5nKzPZX8bUjkUwljRnUW/N4z8kSRpNFqh0m4IW
	+vu7RZBqYoKBrvspxKUTHbbiQ5X4dP0VPDXmSd0l+97gbZvt3GvrFGIKybPaY7tF+THA
	k5NdWtS991WThYY0qjXoL7VxJvInmq2/JdEUphdAjTMAARNbU32JFvq8zMJDJuAfitaW
	4tqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7QRxq7KPsUoh08MAkZD+uVdBI2+XMT/JZ8Kh7RvVpGc=;
	b=J1E7TFtwBAK0p+lOMKfErgfq+jriQ2uVH1oL31Ld/fAW0jcVHYb606MyO/N0Ykr50g
	khTKIAQI7uJQXthPX5t9x13aw5YnixAfMnQSHVWw8JYDdm/qjsUhYjD/WFxPTk/zpHrU
	h9a/POXEa4CN8jr296iPQIp2HVzcCGgwrRbBkMw4dTWkxrD5xSA5LnUDCb0gcdt7P0HP
	sWvDGKpN+XdRzQf5FRDubuPiPD9MnPSvc+SLnZp2s+pQUo2VAG2HD1rKNzwKyeaWWE95
	aK9p9+wrN+Eo5taP8gBONxpuy77I6FHNy/BgnlgTKGRAP5YKJLhb4WKXJHR3WCMnPnyn
	gw3g==
X-Gm-Message-State: AKGB3mKw/mZh38dreNDE3IwFTjyBGrF54dg3HFVvbpPAaW8qph7e9TKw
	AOt2Dl/xattToTUyZypPpVyqO/X/
X-Google-Smtp-Source: ACJfBos5f7QmeitePnguR2zL9XGEoimskPZQgPzw+XmHHv4Y/Z3f5BaWFXYqLhRenEo2dhQamN1NIg==
X-Received: by 10.37.108.10 with SMTP id h10mr33117494ybc.80.1514944073205;
	Tue, 02 Jan 2018 17:47:53 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([45.77.34.21]) by smtp.gmail.com with ESMTPSA id
	h133sm20457657ywb.52.2018.01.02.17.47.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Jan 2018 17:47:52 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jan 2018 02:47:25 +0100
Message-Id: <1514944050-12039-3-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1514944050-12039-1-git-send-email-liu.ming50@gmail.com>
References: <1514944050-12039-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-java][PATCH 2/7] meta: drop deprecated virtclass-native
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
X-List-Received-Date: Wed, 03 Jan 2018 01:47:52 -0000

From: Ming Liu <liu.ming50@gmail.com>

Replaces them with class-native.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-core/cup/cup_0.10k.bb                     |  2 +-
 recipes-core/jakarta-commons/commons-net_1.4.1.bb |  2 +-
 recipes-core/jamvm/jamvm.inc                      | 14 +++++++-------
 recipes-core/jcraft/jsch_0.1.40.bb                |  2 +-
 recipes-core/jikes/jikes_1.22.bb                  |  4 ++--
 recipes-core/jlex/jlex_1.2.6.bb                   |  2 +-
 recipes-core/rhino/rhino_1.7r4.bb                 |  2 +-
 recipes-core/xerces-j/xerces-j_2.11.0.bb          |  2 +-
 8 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/recipes-core/cup/cup_0.10k.bb b/recipes-core/cup/cup_0.10k.bb
index 2a957f9..afe5c38 100644
--- a/recipes-core/cup/cup_0.10k.bb
+++ b/recipes-core/cup/cup_0.10k.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=2c9db91c00f38e52cfc8e67bafaa7c
 
 
 RDEPENDS_${PN} = "java2-runtime"
-RDEPENDS_${PN}_virtclass-native = ""
+RDEPENDS_${PN}_class-native = ""
 
 inherit java-library
 
diff --git a/recipes-core/jakarta-commons/commons-net_1.4.1.bb b/recipes-core/jakarta-commons/commons-net_1.4.1.bb
index 239907e..ec8a3df 100644
--- a/recipes-core/jakarta-commons/commons-net_1.4.1.bb
+++ b/recipes-core/jakarta-commons/commons-net_1.4.1.bb
@@ -12,7 +12,7 @@ S = "${WORKDIR}/${BP}"
 DEPENDS += "oro"
 
 RDEPENDS_${PN} = "liboro-java"
-RDEPENDS_${PN}_virtclass-native = ""
+RDEPENDS_${PN}_class-native = ""
 
 CP = "oro"
 
diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index cad91a2..da1ca29 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -4,14 +4,14 @@ LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 DEPENDS = "zlib classpath virtual/javac-native libffi virtual/java-initial-native"
-DEPENDS_virtclass-native = "virtual/java-initial-native classpath-initial-native zlib-native classpath-native ecj-initial-native libffi-native"
+DEPENDS_class-native = "virtual/java-initial-native classpath-initial-native zlib-native classpath-native ecj-initial-native libffi-native"
 
 RDEPENDS_${PN} = "classpath"
-RDEPENDS_${PN}_virtclass-native = ""
+RDEPENDS_${PN}_class-native = ""
 
-PROVIDES_virtclass-native = "virtual/java-native"
+PROVIDES_class-native = "virtual/java-native"
 RPROVIDES_${PN} = "java2-runtime"
-RPROVIDES_${PN}_virtclass-native = ""
+RPROVIDES_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native"
 
@@ -21,7 +21,7 @@ inherit java autotools update-alternatives pkgconfig relative_symlinks
 # This uses 32 bit arm, so force the instruction set to arm, not thumb
 ARM_INSTRUCTION_SET = "arm"
 
-do_configure_append_virtclass-native() {
+do_configure_append_class-native() {
 	sed -i -e"s|STAGING_LIBDIR_NATIVE|${STAGING_LIBDIR_NATIVE}|g" \
 		-e "s|STAGING_DATADIR_NATIVE|${STAGING_DATADIR_NATIVE}|g" \
 	${WORKDIR}/java
@@ -31,14 +31,14 @@ do_configure_append_virtclass-native() {
 EXTRA_OECONF = "--with-classpath-install-dir=${prefix} --libdir=${libdir}/jamvm --enable-ffi"
 
 # Needed for big compilation targets like OpenJDK
-CFLAGS_append_virtclass-native = " -DDEFAULT_MAX_HEAP=1024*MB"
+CFLAGS_append_class-native = " -DDEFAULT_MAX_HEAP=1024*MB"
 
 # Enforce usage of ecj-initial.
 EXTRA_OEMAKE = "JAVAC=${STAGING_BINDIR_NATIVE}/ecj-initial \
                 GLIBJ_ZIP=${STAGING_DATADIR_NATIVE}/classpath/glibj.zip \
                "
 
-do_install_append_virtclass-native() {
+do_install_append_class-native() {
 	install -d ${D}${bindir}
 	install -m 0755 ${WORKDIR}/java ${D}${bindir}/java
 
diff --git a/recipes-core/jcraft/jsch_0.1.40.bb b/recipes-core/jcraft/jsch_0.1.40.bb
index 0be0883..6450540 100644
--- a/recipes-core/jcraft/jsch_0.1.40.bb
+++ b/recipes-core/jcraft/jsch_0.1.40.bb
@@ -10,7 +10,7 @@ inherit java-library
 DEPENDS = "jzlib"
 
 RDEPENDS_${PN} = "libjzlib-java"
-RDEPENDS_${PN}_virtclass-native = ""
+RDEPENDS_${PN}_class-native = ""
 
 do_compile() {
   mkdir -p build
diff --git a/recipes-core/jikes/jikes_1.22.bb b/recipes-core/jikes/jikes_1.22.bb
index a35cfcf..8f97a1c 100644
--- a/recipes-core/jikes/jikes_1.22.bb
+++ b/recipes-core/jikes/jikes_1.22.bb
@@ -14,8 +14,8 @@ inherit autotools update-alternatives relative_symlinks
 BBCLASSEXTEND = "native"
 
 RDEPENDS_${PN} = "classpath"
-PROVIDES_virtclass-native = ""
-RDEPENDS_${PN}_virtclass-native = ""
+PROVIDES_class-native = ""
+RDEPENDS_${PN}_class-native = ""
 
 EXTRA_OECONF = "--disable-fp-emulation --enable-source15"
 
diff --git a/recipes-core/jlex/jlex_1.2.6.bb b/recipes-core/jlex/jlex_1.2.6.bb
index bb67a46..8cb0316 100644
--- a/recipes-core/jlex/jlex_1.2.6.bb
+++ b/recipes-core/jlex/jlex_1.2.6.bb
@@ -4,7 +4,7 @@ LICENSE = "JLEX"
 LIC_FILES_CHKSUM = "file://Main.java;beginline=148;endline=166;md5=9bf4a6a951053991db64f9d7330d648a"
 
 RDEPENDS_${PN} = "java2-runtime"
-RDEPENDS_${PN}_virtclass-native = ""
+RDEPENDS_${PN}_class-native = ""
 
 inherit java-library
 
diff --git a/recipes-core/rhino/rhino_1.7r4.bb b/recipes-core/rhino/rhino_1.7r4.bb
index 30d5a62..df6a0f7 100644
--- a/recipes-core/rhino/rhino_1.7r4.bb
+++ b/recipes-core/rhino/rhino_1.7r4.bb
@@ -20,7 +20,7 @@ PACKAGES = "${JPN} rhino"
 
 FILES_${PN} = "${bindir}/rhino ${bindir}/rhino-jsc"
 RDEPENDS_${PN} = "java2-runtime ${JPN}"
-RDEPENDS_${PN}_virtclass-native = ""
+RDEPENDS_${PN}_class-native = ""
 
 do_compile() {
 	mkdir -p build
diff --git a/recipes-core/xerces-j/xerces-j_2.11.0.bb b/recipes-core/xerces-j/xerces-j_2.11.0.bb
index 1b96f00..98ef32f 100644
--- a/recipes-core/xerces-j/xerces-j_2.11.0.bb
+++ b/recipes-core/xerces-j/xerces-j_2.11.0.bb
@@ -23,7 +23,7 @@ JPN = "libxerces2-java"
 DEPENDS = "fastjar-native jaxp1.3 xml-commons-resolver1.1"
 
 RDEPENDS_${PN} = "libjaxp1.3-java libxml-commons-resolver1.1-java"
-RDEPENDS_${PN}_virtclass-native = ""
+RDEPENDS_${PN}_class-native = ""
 
 do_unpackpost[dirs] = "${B}"
 do_unpackpost() {
-- 
2.7.4


