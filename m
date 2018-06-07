Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1F02782EC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2018 09:25:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w579PB34022020
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 7 Jun 2018 02:25:26 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 7 Jun 2018 02:25:01 -0700
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Jun 2018 02:24:59 -0700
Message-ID: <20180607092459.33931-2-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180607092459.33931-1-wenlin.kang@windriver.com>
References: <20180607092459.33931-1-wenlin.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 2/2] openjdk-8: combine the -dbg package
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
X-List-Received-Date: Thu, 07 Jun 2018 09:25:36 -0000
Content-Type: text/plain

One recipe should only have one -dbg package, because OE only picks
up all .debug file into the last one -dbg package listed in variable
PACKAGES.

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 recipes-core/openjdk/openjdk-8_16xbyy.bb | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8_16xbyy.bb b/recipes-core/openjdk/openjdk-8_16xbyy.bb
index dd0ed1d..1d7d794 100644
--- a/recipes-core/openjdk/openjdk-8_16xbyy.bb
+++ b/recipes-core/openjdk/openjdk-8_16xbyy.bb
@@ -14,7 +14,6 @@ do_install() {
 }
 
 PACKAGES_append = " \
-    ${PN}-demo-dbg \
     ${PN}-demo \
     ${PN}-source \
 "
@@ -47,12 +46,6 @@ FILES_${PN}-dbg_append = "\
     ${JDK_HOME}/jre/lib/${JDK_ARCH}/headless/.debug/ \
     ${JDK_HOME}/jre/lib/${JDK_ARCH}/xawt/.debug/ \
     ${JDK_HOME}/jre/lib/${JDK_ARCH}/client/.debug/ \
-"
-
-FILES_${PN}-demo = " ${JDK_HOME}/demo ${JDK_HOME}/sample "
-RDEPENDS_${PN}-demo = " ${PN} "
-
-FILES_${PN}-demo-dbg = "\
     ${JDK_HOME}/demo/jvmti/gctest/lib/.debug/ \
     ${JDK_HOME}/demo/jvmti/heapTracker/lib/.debug/ \
     ${JDK_HOME}/demo/jvmti/heapViewer/lib/.debug/ \
@@ -64,6 +57,9 @@ FILES_${PN}-demo-dbg = "\
     ${JDK_HOME}/demo/jvmti/compiledMethodLoad/lib/.debug/ \
 "
 
+FILES_${PN}-demo = " ${JDK_HOME}/demo ${JDK_HOME}/sample "
+RDEPENDS_${PN}-demo = " ${PN} "
+
 FILES_${PN}-doc_append = "\
     ${JDK_HOME}/man \
     ${JDK_HOME}/ASSEMBLY_EXCEPTION \
-- 
2.11.0


