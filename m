Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A0B5A60762
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 03:39:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBI3deuP018170
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 19:39:40 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 17 Dec 2015 19:39:39 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Dec 2015 11:39:49 +0800
Message-ID: <1450409989-3032-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-java][PATCH] openjdk-8-native: fix incorrect do_install
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
X-List-Received-Date: Fri, 18 Dec 2015 03:39:42 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

do_install should not install files directly into
staging dirs, or the ${D} and sstate is empty and
builds from sstate cache will fail.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-core/openjdk/openjdk-8-native.inc | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/openjdk/openjdk-8-native.inc
index 7813ec2..a75f9e0 100644
--- a/recipes-core/openjdk/openjdk-8-native.inc
+++ b/recipes-core/openjdk/openjdk-8-native.inc
@@ -68,15 +68,13 @@ do_compile_append() {
 }
 
 do_install() {
-    rm -rf ${STAGING_LIBDIR_NATIVE}/jvm/${JDK_DIR}
-    mkdir -p ${STAGING_LIBDIR_NATIVE}/jvm/${JDK_DIR}
-    cp -rp ${B}/images/j2sdk-image/* ${STAGING_LIBDIR_NATIVE}/jvm/${JDK_DIR}
+    mkdir -p ${D}/${libdir_jvm}/${JDK_DIR}
+    cp -rp ${B}/images/j2sdk-image/* ${D}/${libdir_jvm}/${JDK_DIR}
 
-# clean up the mess from bootstrap
+    # clean up the mess from bootstrap
+    mkdir -p ${D}/${bindir}
     for tool in jar java javac keytool pack200 unpack200
     do
-        rm -f ${STAGING_BINDIR_NATIVE}/$tool
-
-        ln -sf "../lib/jvm/${JDK_DIR}/bin/$tool" ${STAGING_BINDIR_NATIVE}/$tool
+        ln -sf "../lib/jvm/${JDK_DIR}/bin/$tool" ${D}/${bindir}/$tool
     done
 }
-- 
2.3.5


