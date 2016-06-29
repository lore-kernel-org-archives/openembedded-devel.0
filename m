Return-Path: <bernhard@bdick.de>
Received: from mail.bdick.de (mail.bdick.de [151.80.246.202])
	by mail.openembedded.org (Postfix) with ESMTP id 8DCDC60043
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 13:21:00 +0000 (UTC)
Received: from [129.217.187.180] (helo=debian.ie3.e-technik.tu-dortmund.de)
	by mail.bdick.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <bernhard@bdick.de>) id 1bIFQL-0007MF-3s
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jun 2016 15:21:01 +0200
From: Bernhard Dick <bernhard@bdick.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Jun 2016 15:20:40 +0200
Message-Id: <1467206440-4906-1-git-send-email-bernhard@bdick.de>
X-Mailer: git-send-email 2.8.1
Subject: [meta-java][PATCH] openjdk-8: Add update version and build number to the java binaries
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
X-List-Received-Date: Wed, 29 Jun 2016 13:21:02 -0000

The OpenJDK builds did not include the update version and build number
leading to problems when applications check for the minimum needed version.
This commit fixes it by adding the update version and build number to the
configure parameters.

Signed-off-by: Bernhard Dick <bernhard@bdick.de>
---
 recipes-core/openjdk/openjdk-8-common.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index 3206ec4..70bd40c 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -229,3 +229,10 @@ JDK_ARCH = "${@get_jdk_arch(d)}"
 export DEBUG_BINARIES = "true"
 
 ALTERNATIVE_PRIORITY = "50"
+
+OPENJDK_UPDATE_VERSION = "${@bb.data.getVar('PV', d, 1).split('b')[0]}"
+OPENJDK_BUILD_NUMBER = "b${@bb.data.getVar('PV', d, 1).split('b')[1]}"
+EXTRA_OECONF_append = "\
+        --with-build-number=${OPENJDK_BUILD_NUMBER} \
+        --with-update-version=${OPENJDK_UPDATE_VERSION} \
+"
-- 
2.8.1


