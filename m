Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 12BC7731AC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 15:48:59 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1ayhzv-0004xD-QS from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2016 08:48:59 -0700
Received: from gemini.alm.mentorg.com (147.34.91.1) by
	SVR-ORW-FEM-06.mgc.mentorg.com (147.34.97.120) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Fri, 6 May 2016 08:49:00 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com (svr-pkl-eng-06.pkl.mentorg.com
	[137.202.156.65])	by gemini.alm.mentorg.com (8.14.4/8.14.4) with
	ESMTP id u46Fmus4012737;	Fri, 6 May 2016 10:48:58 -0500
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 6 May 2016 20:48:54 +0500
Message-ID: <1462549734-36838-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH V3] libnice, farsight2: unblacklist as libnice's nice.pc issue fixed.
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
X-List-Received-Date: Fri, 06 May 2016 15:49:02 -0000
Content-Type: text/plain

From: Noor Ahsan <noor_ahsan@mentor.com>

* Update do_compile_append where it was updating *.pc from ${S} and
  removing staging dir folder. Now we have seperate build folder
  where packages get build. We have to search pc in ${B} not in ${S}.
  After updating the tmp dir path is removed from nice.pc file.
* Remove PNBLACKLIST for libnice and farsight2 recipes.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 meta-oe/recipes-support/farsight/farsight2_0.0.22.bb | 2 --
 meta-oe/recipes-support/farsight/libnice_0.0.13.bb   | 4 +---
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
index ffb222b..2989850 100644
--- a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
+++ b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
@@ -28,5 +28,3 @@ FILES_${PN}-dbg += "${libdir}/*/.debug"
 
 SRC_URI[md5sum] = "e1f540cf3ebab06c3d7db1f46b44ac88"
 SRC_URI[sha256sum] = "3ae59aa61a8071c9fad111e5fd606aabc27961eb4192f8729987a27dae6b3974"
-
-PNBLACKLIST[farsight2] ?= "Depends on broken libnice"
diff --git a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
index a9081dc..620ee1f 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
+++ b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
@@ -28,7 +28,7 @@ do_configure_prepend() {
 }
 
 do_compile_append() {
-    for i in $(find ${S} -name "*.pc") ; do
+    for i in $(find ${B} -name "*.pc") ; do
         sed -i -e s:${STAGING_DIR_TARGET}::g \
                -e s:/${TARGET_SYS}::g \
                   $i
@@ -38,5 +38,3 @@ do_compile_append() {
 
 SRC_URI[md5sum] = "e5b9f799a57cb939ea2658ec35253ab9"
 SRC_URI[sha256sum] = "d8dd260c486a470a6052a5323920878a084e44a19df09b15728b85c9e3d6edf0"
-
-PNBLACKLIST[libnice] ?= "BROKEN: QA Issue: nice.pc failed sanity test (tmpdir)"
-- 
2.8.1


