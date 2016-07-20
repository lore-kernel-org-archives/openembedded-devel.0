Return-Path: <patrick.ohly@intel.com>
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
	[209.85.161.181])
	by mail.openembedded.org (Postfix) with ESMTP id E86DC6080F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 09:48:40 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id z8so18597034ywa.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 02:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=znC4wwPGSY3ar0c26rPz0QH3t5GFzOU6vD33RKixeXI=;
	b=x7DSECKm0nByzk0bftZUQ11LHqcl46X4BvuGbNC1oQdpY6R9eCmbb4b54Yl5Z0+CXZ
	xwklb/h3bl60QSL31HS7ArAGuaTCRflquxjP4GOOq5dvDWjeC6PAERbhA+9KulUDR605
	ZmQkuNEEeIpC02VRTAYHW/WEBxCRUBtQd/xA1HocUnX4Mu2BjLcKpu/BXUBIX8BHmEpJ
	PkkU8TPqXRKH1a0kW0HRF8XD2Qavnx5JzTE/ic2Ilc/QaLGnvDgR7A8yKXFLfmLWVIUQ
	mo7ck8av29r1a53jQ3ZChgXEDUdZ/JZhwOUFBtYA8Wk9fyh1IUUnZCFbgqj8grmB8Z8o
	GyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=znC4wwPGSY3ar0c26rPz0QH3t5GFzOU6vD33RKixeXI=;
	b=BGoL73kHAkNQV9DSAg0mVy9RyTeCegx4Kh/DRgJZ7D4HSeeSfZhYOB5gu1JIvzRbhI
	eRr5D6Skj6ttTjo3Os3yRthPxltWHr1jPf48ZDq+FOFjXSLoBeywprZSCd1O99kX79ZK
	V46KZ9NnVuV7TMh6Un+HEELic1hC7ixvnItTkrUdKKRrIiVjCvuxOjly4RW2X8IlXD8E
	eXqX58DWXJ1UUN9qxFHF7aTQPZUmldg5k9q1lAotO+uP+a88K8IygXNP2fM7QOuPjjJh
	fT/q2ptuvfxzbENvY0rvJAIm+ojKWRo1l4gS8Cf8MWlwpxqKB2x/KmZH2Tg9aZUwF1II
	hdPw==
X-Gm-Message-State: ALyK8tJo5XxjV9G9VyprVqtDhd3Jk5BUrrJM+ERr9cah6ZdC6rxn7eiYB06olNDBvvp7ky3x
X-Received: by 10.37.116.71 with SMTP id p68mr9291898ybc.0.1469008121180;
	Wed, 20 Jul 2016 02:48:41 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A57E84.dip0.t-ipconnect.de.
	[87.165.126.132])
	by smtp.gmail.com with ESMTPSA id g73sm731384ywe.1.2016.07.20.02.48.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jul 2016 02:48:40 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2016 11:48:36 +0200
Message-Id: <1469008116-20609-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Patrick Ohly <patrick.ohly@intel.com>
Subject: [meta-java][PATCH] do_unpackpost: explicitly set working directory
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
X-List-Received-Date: Wed, 20 Jul 2016 09:48:41 -0000

bitbake rev 67a7b8b02 "build: don't use $B as the default cwd for
functions" (included in current bitbake master) breaks the assumption
that do_unpackpost runs inside the build directory. Now that has to be
set explicitly, which is also okay for older bitbake versions.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 recipes-core/ecj/libecj-bootstrap.inc                   | 1 +
 recipes-core/jakarta-commons/jakarta-commons.inc        | 1 +
 recipes-core/junit/junit_3.8.2.bb                       | 1 +
 recipes-core/servlet-api/jsp2.0_5.5.26.bb               | 1 +
 recipes-core/servlet-api/servlet2.3_4.1.37.bb           | 1 +
 recipes-core/servlet-api/servlet2.4_5.5.26.bb           | 1 +
 recipes-core/xerces-j/xerces-j_2.11.0.bb                | 1 +
 recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb | 1 +
 8 files changed, 8 insertions(+)

diff --git a/recipes-core/ecj/libecj-bootstrap.inc b/recipes-core/ecj/libecj-bootstrap.inc
index 020b8d3..dde09c6 100644
--- a/recipes-core/ecj/libecj-bootstrap.inc
+++ b/recipes-core/ecj/libecj-bootstrap.inc
@@ -15,6 +15,7 @@ S = "${WORKDIR}"
 
 JAR = "ecj-bootstrap-${PV}.jar"
 
+do_unpackpost[dirs] = "${B}"
 do_unpackpost() {
   if [ ! -d source ]; then
     mkdir source
diff --git a/recipes-core/jakarta-commons/jakarta-commons.inc b/recipes-core/jakarta-commons/jakarta-commons.inc
index 5968164..5a22f1e 100644
--- a/recipes-core/jakarta-commons/jakarta-commons.inc
+++ b/recipes-core/jakarta-commons/jakarta-commons.inc
@@ -22,6 +22,7 @@ FINDARGS = "-name '*.properties'"
 CLEAN_PATH = ""
 
 # Some projects have a replaceable version number in their manifest template.
+do_unpackpost[dirs] = "${B}"
 do_unpackpost() {
     if [ -d src/conf ]
     then
diff --git a/recipes-core/junit/junit_3.8.2.bb b/recipes-core/junit/junit_3.8.2.bb
index bae022d..90ffd66 100644
--- a/recipes-core/junit/junit_3.8.2.bb
+++ b/recipes-core/junit/junit_3.8.2.bb
@@ -13,6 +13,7 @@ DEPENDS += "unzip-native"
 
 inherit java-library
 
+do_unpackpost[dirs] = "${B}"
 do_unpackpost() {
 	mkdir -p src
 	# Prevent deletion by do_removebinaries.
diff --git a/recipes-core/servlet-api/jsp2.0_5.5.26.bb b/recipes-core/servlet-api/jsp2.0_5.5.26.bb
index e831501..98e3468 100644
--- a/recipes-core/servlet-api/jsp2.0_5.5.26.bb
+++ b/recipes-core/servlet-api/jsp2.0_5.5.26.bb
@@ -18,6 +18,7 @@ IMPL_REVISION = "public_draft"
 JARFILENAME = "jsp-api-2.0.${IMPL_REVISION}.jar"
 ALTJARFILENAMES = "jsp-api-2.0.jar jsp-api.jar"
 
+do_unpackpost[dirs] = "${B}"
 do_unpackpost() {
   sed -i -e "s|@implementation.version@|${IMPL_REVISION}|" src/etc/manifest
 }
diff --git a/recipes-core/servlet-api/servlet2.3_4.1.37.bb b/recipes-core/servlet-api/servlet2.3_4.1.37.bb
index fbda5c8..1fa12f8 100644
--- a/recipes-core/servlet-api/servlet2.3_4.1.37.bb
+++ b/recipes-core/servlet-api/servlet2.3_4.1.37.bb
@@ -18,6 +18,7 @@ IMPL_REVISION = "1"
 JARFILENAME = "servlet-2.3.${IMPL_REVISION}.jar"
 ALTJARFILENAMES = "servlet-2.3.jar servlet2.3.jar"
 
+do_unpackpost[dirs] = "${B}"
 do_unpackpost() {
   sed -i -e "s|@implementation.version@|${IMPL_REVISION}|" src/etc/manifest
 }
diff --git a/recipes-core/servlet-api/servlet2.4_5.5.26.bb b/recipes-core/servlet-api/servlet2.4_5.5.26.bb
index b34b23d..f9259aa 100644
--- a/recipes-core/servlet-api/servlet2.4_5.5.26.bb
+++ b/recipes-core/servlet-api/servlet2.4_5.5.26.bb
@@ -17,6 +17,7 @@ IMPL_REVISION = "1"
 JARFILENAME = "servlet-api-2.4.${IMPL_REVISION}.jar"
 ALTJARFILENAMES = "servlet-api-2.4.jar servlet-api.jar servlet2.4.jar"
 
+do_unpackpost[dirs] = "${B}"
 do_unpackpost() {
   sed -i -e "s|2.3.@implementation.version@|2.4.${IMPL_REVISION}|" src/etc/manifest
 }
diff --git a/recipes-core/xerces-j/xerces-j_2.11.0.bb b/recipes-core/xerces-j/xerces-j_2.11.0.bb
index f9e497e..4a0cc91 100644
--- a/recipes-core/xerces-j/xerces-j_2.11.0.bb
+++ b/recipes-core/xerces-j/xerces-j_2.11.0.bb
@@ -26,6 +26,7 @@ DEPENDS_virtclass-native = "fastjar-native jaxp1.3-native xml-commons-resolver1.
 RDEPENDS_${PN} = "libjaxp1.3-java libxml-commons-resolver1.1-java"
 RDEPENDS_${PN}_virtclass-native = ""
 
+do_unpackpost[dirs] = "${B}"
 do_unpackpost() {
   find src -exec \
     sed -i -e "s|@impl.name@|Xerces-J ${PV}|" \
diff --git a/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb b/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
index 5853895..77556fc 100644
--- a/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
+++ b/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
@@ -13,6 +13,7 @@ S = "${WORKDIR}/xml-commons-resolver-${PV}"
 DEPENDS = "fastjar-native jaxp1.3"
 DEPENDS_virtclass-native = "fastjar-native jaxp1.3-native"
 
+do_unpackpost[dirs] = "${B}"
 do_unpackpost() {
   find src -exec \
     sed -i -e "s|@impl.name@|XmlResolver|" \
-- 
2.1.4


