Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A348E78DE6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 08:37:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5D8bxo9027194
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 01:37:59 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 13 Jun 2018 01:37:58 -0700
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Jun 2018 01:37:32 -0700
Message-ID: <20180613083732.15059-2-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180613083732.15059-1-wenlin.kang@windriver.com>
References: <20180613083732.15059-1-wenlin.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH V2 2/2] openjdk-8: remove redunant FILES_${PN}-dbg
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
X-List-Received-Date: Wed, 13 Jun 2018 08:37:58 -0000
Content-Type: text/plain

One recipe should only have one -dbg package, because OE only picks
up all .debug file into the last one -dbg package listed in variable
PACKAGES.

Comments(oe-core's commit a3b000643898d7402b9e57c02e8d10e677cc9722)
from Ross Burton as below:
"meta: more removals of redunant FILES_${PN}-dbg

In some recipes overly-split -dbg packages were merged into PN-dbg.  Unless
there's a very good reason, recipes should have a single -dev and -dbg package.
"

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 recipes-core/openjdk/openjdk-8_16xbyy.bb | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8_16xbyy.bb b/recipes-core/openjdk/openjdk-8_16xbyy.bb
index dd0ed1d..522d6b5 100644
--- a/recipes-core/openjdk/openjdk-8_16xbyy.bb
+++ b/recipes-core/openjdk/openjdk-8_16xbyy.bb
@@ -14,7 +14,6 @@ do_install() {
 }
 
 PACKAGES_append = " \
-    ${PN}-demo-dbg \
     ${PN}-demo \
     ${PN}-source \
 "
@@ -33,37 +32,9 @@ FILES_${PN}-dev_append = "\
     ${JDK_HOME}/include \
 "
 
-FILES_${PN}-dbg_append = "\
-    ${JDK_HOME}/bin/.debug/ \
-    ${JDK_HOME}/lib/.debug/ \
-    ${JDK_HOME}/lib/${JDK_ARCH}/.debug/ \
-    ${JDK_HOME}/lib/${JDK_ARCH}/jli/.debug/ \
-    ${JDK_HOME}/jre/bin/.debug/ \
-    ${JDK_HOME}/jre/lib/.debug/ \
-    ${JDK_HOME}/jre/lib/${JDK_ARCH}/.debug/ \
-    ${JDK_HOME}/jre/lib/${JDK_ARCH}/jli/.debug/ \
-    ${JDK_HOME}/jre/lib/${JDK_ARCH}/native_threads/.debug/ \
-    ${JDK_HOME}/jre/lib/${JDK_ARCH}/server/.debug/ \
-    ${JDK_HOME}/jre/lib/${JDK_ARCH}/headless/.debug/ \
-    ${JDK_HOME}/jre/lib/${JDK_ARCH}/xawt/.debug/ \
-    ${JDK_HOME}/jre/lib/${JDK_ARCH}/client/.debug/ \
-"
-
 FILES_${PN}-demo = " ${JDK_HOME}/demo ${JDK_HOME}/sample "
 RDEPENDS_${PN}-demo = " ${PN} "
 
-FILES_${PN}-demo-dbg = "\
-    ${JDK_HOME}/demo/jvmti/gctest/lib/.debug/ \
-    ${JDK_HOME}/demo/jvmti/heapTracker/lib/.debug/ \
-    ${JDK_HOME}/demo/jvmti/heapViewer/lib/.debug/ \
-    ${JDK_HOME}/demo/jvmti/hprof/lib/.debug/ \
-    ${JDK_HOME}/demo/jvmti/minst/lib/.debug/ \
-    ${JDK_HOME}/demo/jvmti/mtrace/lib/.debug/ \
-    ${JDK_HOME}/demo/jvmti/versionCheck/lib/.debug/ \
-    ${JDK_HOME}/demo/jvmti/waiters/lib/.debug/ \
-    ${JDK_HOME}/demo/jvmti/compiledMethodLoad/lib/.debug/ \
-"
-
 FILES_${PN}-doc_append = "\
     ${JDK_HOME}/man \
     ${JDK_HOME}/ASSEMBLY_EXCEPTION \
-- 
2.11.0


