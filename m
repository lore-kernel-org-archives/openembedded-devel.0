Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 046D9786D4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 13:19:22 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 64so3371051wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jan 2018 05:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9LTHdhmK/guHQdbzLRYn6mbZm8AA/JPhnu7qHuovXb4=;
	b=AlUDNgSCcdihnGYKRE64J1jsyLem1UHXg8Fw929ZCfwydrj8uKihKnqisaKGLPDXkE
	RL65OztJN79UgAxNtd9FECIWYtl16zRg4RtaU0EbG0HXUxkCrlWkv+QLhCOzo5VFNTI/
	h72cfh0L5RtmIwJA8ZrByR3lGumddGHoyqhHbyVjQszSnf2BpA4y2W1FF2DFJkv9L9Ah
	CfykWnk/P83YPqIZkXXapWK+cy0XYMafKVq02QfGDCn2IFKPi38JKjkDsSrWzS3KlAyb
	Jd1i5W/j4Zk9kbjPRTuiqZ5vHR0Z1YP9cv6MLL1MzZaGH6WrNtCo814tParp/19OmBnm
	ilYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9LTHdhmK/guHQdbzLRYn6mbZm8AA/JPhnu7qHuovXb4=;
	b=hcXvfmjuvOUvlVlKBtKAzfGKzLgSBfrCSVUYdD2WKClh9mzLPlk6yvf2zpcBmOGzaS
	9PGVHTuSeBCGZjvE5oXH2ZwFcP/VbpiSR8aX/yW0HqRfl7bYpwdVUDJVCtOmvc8ZdYsF
	NngN0Qshy2xYMwRBhZCI57mrm09UoycwYL9pra8Lm1kTlXRy/8uwAbX5SnY2ybP9+Ruf
	P+gJFY/yz/IbWFbi2C4SaD5bJynHQsfi1iRfCUhCQXKYVBLVlEFNUEju6+nSm7ma2M4J
	H9HujdV3a4DlpALdldD5AlygFKboZJ/BLI+j3yztpGOKtORcXj/TgwC3EOEUADyd0dPn
	MHuw==
X-Gm-Message-State: AKGB3mIfcn+7kYCD0vBIaNzcqOcd7l2ViD6pIk22dgtkf69KdUczj6I/
	MevdtMUtcaaqlRmXfT+Kw3ONeQ==
X-Google-Smtp-Source: ACJfBouptwQ6/rou6VIsUY/FXsTk6eqeXa9fFLeZC373C9LyqS6bKvY3MHfxLdfB/rx3fDLG4AAQLw==
X-Received: by 10.80.158.196 with SMTP id a62mr7318810edf.307.1515071963535;
	Thu, 04 Jan 2018 05:19:23 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58]) by smtp.gmail.com with ESMTPSA id
	m23sm2107083edc.27.2018.01.04.05.19.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jan 2018 05:19:23 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jan 2018 14:19:04 +0100
Message-Id: <1515071950-15401-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515071950-15401-1-git-send-email-liu.ming50@gmail.com>
References: <1515071950-15401-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-java][PATCH 1/7] meta: drop redundant DEPENDS_virtcalss-native definitions
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
X-List-Received-Date: Thu, 04 Jan 2018 13:19:23 -0000

From: Ming Liu <liu.ming50@gmail.com>

The DEPENDS would be handled in native.bbclass, it's not necessary to
set them explicitly in recipes.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-core/bcel/bcel_5.2.bb                           | 2 --
 recipes-core/jakarta-commons/commons-logging_1.1.1.bb   | 1 -
 recipes-core/jakarta-commons/commons-net_1.4.1.bb       | 1 -
 recipes-core/jakarta-libs/bsf_2.4.0.bb                  | 1 -
 recipes-core/jakarta-libs/log4j1.2_1.2.17.bb            | 1 -
 recipes-core/jakarta-libs/logkit_1.2.2.bb               | 1 -
 recipes-core/jcraft/jsch_0.1.40.bb                      | 1 -
 recipes-core/xalan-j/xalan-j_2.7.1.bb                   | 3 ---
 recipes-core/xerces-j/xerces-j_2.11.0.bb                | 1 -
 recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb | 1 -
 10 files changed, 13 deletions(-)

diff --git a/recipes-core/bcel/bcel_5.2.bb b/recipes-core/bcel/bcel_5.2.bb
index 6ff345d..89a9a61 100644
--- a/recipes-core/bcel/bcel_5.2.bb
+++ b/recipes-core/bcel/bcel_5.2.bb
@@ -8,8 +8,6 @@ SRC_URI = "http://archive.apache.org/dist/jakarta/bcel/source/${BP}-src.tar.gz"
 inherit java-library
 
 DEPENDS = "xerces-j regexp"
-DEPENDS_virtclass-native = "xerces-j-native regexp-native"
-
 
 do_compile() {
   mkdir -p build
diff --git a/recipes-core/jakarta-commons/commons-logging_1.1.1.bb b/recipes-core/jakarta-commons/commons-logging_1.1.1.bb
index b3b508a..79f041e 100644
--- a/recipes-core/jakarta-commons/commons-logging_1.1.1.bb
+++ b/recipes-core/jakarta-commons/commons-logging_1.1.1.bb
@@ -7,7 +7,6 @@ DESCRIPTION = "Java Internet protocol suite library"
 SRC_URI = "http://archive.apache.org/dist/commons/logging/source/${BP}-src.tar.gz"
 
 DEPENDS += "log4j1.2 servlet2.3 logkit"
-DEPENDS_virtclass-native += "log4j1.2-native servlet2.3-native logkit-native"
 
 CP = "log4j-1.2 servlet-2.3 logkit"
 
diff --git a/recipes-core/jakarta-commons/commons-net_1.4.1.bb b/recipes-core/jakarta-commons/commons-net_1.4.1.bb
index 275ebb9..239907e 100644
--- a/recipes-core/jakarta-commons/commons-net_1.4.1.bb
+++ b/recipes-core/jakarta-commons/commons-net_1.4.1.bb
@@ -10,7 +10,6 @@ SRC_URI = "http://archive.apache.org/dist/commons/net/source/${BP}-src.tar.gz"
 S = "${WORKDIR}/${BP}"
 
 DEPENDS += "oro"
-DEPENDS_virtclass-native += "oro-native"
 
 RDEPENDS_${PN} = "liboro-java"
 RDEPENDS_${PN}_virtclass-native = ""
diff --git a/recipes-core/jakarta-libs/bsf_2.4.0.bb b/recipes-core/jakarta-libs/bsf_2.4.0.bb
index 0213004..b312c42 100644
--- a/recipes-core/jakarta-libs/bsf_2.4.0.bb
+++ b/recipes-core/jakarta-libs/bsf_2.4.0.bb
@@ -9,7 +9,6 @@ SRC_URI = "http://archive.apache.org/dist/jakarta/bsf/source/bsf-src-${PV}.tar.g
 inherit java-library
 
 DEPENDS = "jacl commons-logging rhino xalan-j bcel"
-DEPENDS_virtclass-native = "jacl-native commons-logging-native rhino-native xalan-j-native bcel-native"
 
 do_compile() {
   mkdir -p build
diff --git a/recipes-core/jakarta-libs/log4j1.2_1.2.17.bb b/recipes-core/jakarta-libs/log4j1.2_1.2.17.bb
index b4ccd2c..2f04e96 100644
--- a/recipes-core/jakarta-libs/log4j1.2_1.2.17.bb
+++ b/recipes-core/jakarta-libs/log4j1.2_1.2.17.bb
@@ -10,7 +10,6 @@ SRC_URI = "http://archive.apache.org/dist/logging/log4j/${PV}/log4j-${PV}.tar.gz
 inherit java-library
 
 DEPENDS = "gnumail gnujaf"
-DEPENDS_virtclass-native = "gnumail-native gnujaf-native"
 
 S = "${WORKDIR}/apache-log4j-${PV}"
 
diff --git a/recipes-core/jakarta-libs/logkit_1.2.2.bb b/recipes-core/jakarta-libs/logkit_1.2.2.bb
index c3b612b..8b4de11 100644
--- a/recipes-core/jakarta-libs/logkit_1.2.2.bb
+++ b/recipes-core/jakarta-libs/logkit_1.2.2.bb
@@ -11,7 +11,6 @@ inherit java-library
 S = "${WORKDIR}/${BP}-dev"
 
 DEPENDS = "oro servlet2.3 gnumail gnujaf log4j1.2 avalon-framework-api"
-DEPENDS_virtclass-native = "oro-native servlet2.3-native gnumail-native gnujaf-native log4j1.2-native avalon-framework-api-native"
 
 do_compile() {
   mkdir -p build
diff --git a/recipes-core/jcraft/jsch_0.1.40.bb b/recipes-core/jcraft/jsch_0.1.40.bb
index 337a8eb..0be0883 100644
--- a/recipes-core/jcraft/jsch_0.1.40.bb
+++ b/recipes-core/jcraft/jsch_0.1.40.bb
@@ -8,7 +8,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/jsch/jsch-${PV}.zip"
 inherit java-library
 
 DEPENDS = "jzlib"
-DEPENDS_virtclass-native = "jzlib-native"
 
 RDEPENDS_${PN} = "libjzlib-java"
 RDEPENDS_${PN}_virtclass-native = ""
diff --git a/recipes-core/xalan-j/xalan-j_2.7.1.bb b/recipes-core/xalan-j/xalan-j_2.7.1.bb
index 317b3c9..f7ee260 100644
--- a/recipes-core/xalan-j/xalan-j_2.7.1.bb
+++ b/recipes-core/xalan-j/xalan-j_2.7.1.bb
@@ -10,9 +10,6 @@ HOMEPAGE = "http://xml.apache.org/xalan-j"
 PR = "r1"
 
 DEPENDS = "xerces-j regexp jlex cup jaxp1.3 bcel"
-DEPENDS_virtclass-native = " \
-	xerces-j-native regexp-native jlex-native cup-native jaxp1.3-native bcel-native \
-	"
 
 SRC_URI = "\
 	http://archive.apache.org/dist/xml/${BPN}/${BPN}_2_7_1-src.tar.gz;name=archive \
diff --git a/recipes-core/xerces-j/xerces-j_2.11.0.bb b/recipes-core/xerces-j/xerces-j_2.11.0.bb
index 4a0cc91..1b96f00 100644
--- a/recipes-core/xerces-j/xerces-j_2.11.0.bb
+++ b/recipes-core/xerces-j/xerces-j_2.11.0.bb
@@ -21,7 +21,6 @@ inherit java-library
 JPN = "libxerces2-java"
 
 DEPENDS = "fastjar-native jaxp1.3 xml-commons-resolver1.1"
-DEPENDS_virtclass-native = "fastjar-native jaxp1.3-native xml-commons-resolver1.1-native"
 
 RDEPENDS_${PN} = "libjaxp1.3-java libxml-commons-resolver1.1-java"
 RDEPENDS_${PN}_virtclass-native = ""
diff --git a/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb b/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
index 77556fc..42ce703 100644
--- a/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
+++ b/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
@@ -11,7 +11,6 @@ inherit java-library
 S = "${WORKDIR}/xml-commons-resolver-${PV}"
 
 DEPENDS = "fastjar-native jaxp1.3"
-DEPENDS_virtclass-native = "fastjar-native jaxp1.3-native"
 
 do_unpackpost[dirs] = "${B}"
 do_unpackpost() {
-- 
2.7.4


