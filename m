Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 54C9A72EF0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 17:37:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w3IHbgSB000766
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 10:37:43 -0700 (PDT)
Received: from yow-cube2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 18 Apr 2018 10:37:42 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Apr 2018 13:37:40 -0400
Message-ID: <1524073060-9727-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-java][PATCH] Fix occasional build failures related to do_removebinaries
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
X-List-Received-Date: Wed, 18 Apr 2018 17:37:42 -0000
Content-Type: text/plain

Similar to commit a265b31ec7d0 [ant-native: Fix random build failure]
we are seeing a very occasional build failure resulting in

    "do_removebinaries) failed with exit code '1'"

This is a result of do_removebinaries() running in parallel with other
tasks scheduled between do_unpack() and do_patch(). We shouldn't be
doing anything to disrupt do_removebinaries() so we simply ensure the
tasks are more strictly ordered to prevent any interference.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-core/jakarta-commons/jakarta-commons.inc        | 2 +-
 recipes-core/servlet-api/jsp2.0_5.5.26.bb               | 2 +-
 recipes-core/servlet-api/servlet2.3_4.1.37.bb           | 2 +-
 recipes-core/servlet-api/servlet2.4_5.5.26.bb           | 2 +-
 recipes-core/xerces-j/xerces-j_2.11.0.bb                | 2 +-
 recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-core/jakarta-commons/jakarta-commons.inc b/recipes-core/jakarta-commons/jakarta-commons.inc
index 5a22f1e..b21246f 100644
--- a/recipes-core/jakarta-commons/jakarta-commons.inc
+++ b/recipes-core/jakarta-commons/jakarta-commons.inc
@@ -31,7 +31,7 @@ do_unpackpost() {
     fi
 }
 
-addtask unpackpost after do_unpack before do_patch
+addtask unpackpost after do_removebinaries before do_patch
 # Compile step is very similar for Jakarta commons packages
 do_compile() {
     mkdir -p build
diff --git a/recipes-core/servlet-api/jsp2.0_5.5.26.bb b/recipes-core/servlet-api/jsp2.0_5.5.26.bb
index 98e3468..6192322 100644
--- a/recipes-core/servlet-api/jsp2.0_5.5.26.bb
+++ b/recipes-core/servlet-api/jsp2.0_5.5.26.bb
@@ -23,7 +23,7 @@ do_unpackpost() {
   sed -i -e "s|@implementation.version@|${IMPL_REVISION}|" src/etc/manifest
 }
 
-addtask unpackpost after do_unpack before do_patch
+addtask unpackpost after do_removebinaries before do_patch
 
 do_compile() {
   mkdir -p build
diff --git a/recipes-core/servlet-api/servlet2.3_4.1.37.bb b/recipes-core/servlet-api/servlet2.3_4.1.37.bb
index 1fa12f8..890a0dc 100644
--- a/recipes-core/servlet-api/servlet2.3_4.1.37.bb
+++ b/recipes-core/servlet-api/servlet2.3_4.1.37.bb
@@ -23,7 +23,7 @@ do_unpackpost() {
   sed -i -e "s|@implementation.version@|${IMPL_REVISION}|" src/etc/manifest
 }
 
-addtask unpackpost after do_unpack before do_patch
+addtask unpackpost after do_removebinaries before do_patch
 
 do_compile() {
   mkdir -p build
diff --git a/recipes-core/servlet-api/servlet2.4_5.5.26.bb b/recipes-core/servlet-api/servlet2.4_5.5.26.bb
index f9259aa..ef09501 100644
--- a/recipes-core/servlet-api/servlet2.4_5.5.26.bb
+++ b/recipes-core/servlet-api/servlet2.4_5.5.26.bb
@@ -22,7 +22,7 @@ do_unpackpost() {
   sed -i -e "s|2.3.@implementation.version@|2.4.${IMPL_REVISION}|" src/etc/manifest
 }
 
-addtask unpackpost after do_unpack before do_patch
+addtask unpackpost after do_removebinaries before do_patch
 
 do_compile() {
   mkdir -p build
diff --git a/recipes-core/xerces-j/xerces-j_2.11.0.bb b/recipes-core/xerces-j/xerces-j_2.11.0.bb
index 98ef32f..62b3625 100644
--- a/recipes-core/xerces-j/xerces-j_2.11.0.bb
+++ b/recipes-core/xerces-j/xerces-j_2.11.0.bb
@@ -32,7 +32,7 @@ do_unpackpost() {
            -e "s|@impl.version@|${PV}|" {} \;
 }
 
-addtask unpackpost after do_unpack before do_patch
+addtask unpackpost after do_removebinaries before do_patch
 
 JARFILENAME = "xercesImpl.jar"
 ALTJARFILENAMES = ""
diff --git a/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb b/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
index 42ce703..ff684c9 100644
--- a/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
+++ b/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
@@ -19,7 +19,7 @@ do_unpackpost() {
            -e "s|@impl.version@|1.2|" {} \;
 }
 
-addtask unpackpost after do_unpack before do_patch
+addtask unpackpost after do_removebinaries before do_patch
 
 JARFILENAME = "resolver.jar"
 ALTJARFILENAMES = ""
-- 
2.7.4


