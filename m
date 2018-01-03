Return-Path: <liu.ming50@gmail.com>
Received: from mail-yb0-f196.google.com (mail-yb0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9A2D677E88
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 01:47:48 +0000 (UTC)
Received: by mail-yb0-f196.google.com with SMTP id 5so95185ybp.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Jan 2018 17:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9LTHdhmK/guHQdbzLRYn6mbZm8AA/JPhnu7qHuovXb4=;
	b=jKkg1QJDKWvr35nn2TB+PSyb7kuzVD/fTwd4D6CRpTG67JiE8HEH+h4rcpfJw4t1sS
	1tl08ja2SLVrIU410OFmuLEMzIQlOm85u0vZl7+9uOY3kNMc1csf2XyTg7MSuETSGfSi
	+EnqQ6FeaklVHjCENo+HPkCni1oVCFJbq7bkMxw3+CEc3WwhCSnxftacDv8vzIixqOhX
	28GvbV9fDJlJ1HS8z2JtGYxVs5zZSAdq/LRzqkvXefRbQVfg/dwVuenMytKnvIeDVnDh
	lAUcuDWoTHpy6Bu2LdhTKVX3nVHquwI9u8JsKoqr8xiwstBCPqt2yTTAenS4DmCIT9UC
	LHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9LTHdhmK/guHQdbzLRYn6mbZm8AA/JPhnu7qHuovXb4=;
	b=Q4CK32YIYWCocF0PFSA3aLV/ChTEvLxObSaQNAP98HMIE50fu+3bKthPK2cpCWq7XX
	JLTLl6ST3z0ZXZa9+jPX6nL2CuY7rJO4ObP9BINuQ/QopW+HbRzOXhVvKwa9I22lnmmE
	44+r4WyQNsWg/hRuWICfolGgBIEHluYTuGD2EZ7i7VxOFukfIUNdqzgEYhHqL0n05dYE
	w5JIABnKCl61nl2iXR52P/AgKCVz9h2RAI3Jq87xvxE8ZCBbq3dzM5u4UE8v5GJRuI6X
	UH6uDyJh2F7zC+c/RxuuQdwcFjRvVXMXEta5j8O/yphAML8sHw9uIq5ELzUX/y95BoWU
	3RSw==
X-Gm-Message-State: AKGB3mIuRTHJ71qweAbGg8wCNYdp44n+cU4PUPzl0IT1auVd+f25i3H+
	b9CgDxoLOpeyephn5gK3VHDvuK7u
X-Google-Smtp-Source: ACJfBouHHEQVCOqb9SFXVkysu6EnydJ5tYVMi20Wuv75AoybkvXSA9xkisNMAW/NUVyT1UYPkE/16A==
X-Received: by 10.37.85.133 with SMTP id j127mr19889958ybb.361.1514944069391; 
	Tue, 02 Jan 2018 17:47:49 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([45.77.34.21]) by smtp.gmail.com with ESMTPSA id
	h133sm20457657ywb.52.2018.01.02.17.47.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Jan 2018 17:47:48 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jan 2018 02:47:24 +0100
Message-Id: <1514944050-12039-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1514944050-12039-1-git-send-email-liu.ming50@gmail.com>
References: <1514944050-12039-1-git-send-email-liu.ming50@gmail.com>
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
X-List-Received-Date: Wed, 03 Jan 2018 01:47:48 -0000

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


