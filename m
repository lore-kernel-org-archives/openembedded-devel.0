Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 68B0F731CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 07:49:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBM7nSsU003967
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2015 23:49:28 -0800
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 21 Dec 2015 23:49:27 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Dec 2015 15:49:38 +0800
Message-ID: <1450770579-6929-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-java][1/2 v2] openjdk-8/openjre-8: fix host-user-contaminated QA issue
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
X-List-Received-Date: Tue, 22 Dec 2015 07:49:28 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Fixed:
WARNING: QA Issue: openjdk-8:
/openjdk-8-doc/usr/lib/jvm/openjdk-8/jre/THIRD_PARTY_README is owned by
uid 1786, which is the same as the user running bitbake. This may be due
to host contamination [host-user-contaminated]

The use of cp results in files in the recipe being owned by the user
running bitbake, so fix the owner to root:root

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-core/openjdk/openjdk-8_72b05.bb | 1 +
 recipes-core/openjdk/openjre-8_72b05.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-8_72b05.bb b/recipes-core/openjdk/openjdk-8_72b05.bb
index 96473f5..d962b1f 100644
--- a/recipes-core/openjdk/openjdk-8_72b05.bb
+++ b/recipes-core/openjdk/openjdk-8_72b05.bb
@@ -20,6 +20,7 @@ do_install() {
     rm -rf ${D}${JDK_HOME}
         mkdir -p ${D}${JDK_HOME}
     cp -rp ${B}/images/j2sdk-image/* ${D}${JDK_HOME}
+    chown -R root:root ${D}${JDK_HOME}
     install -m644 ${WORKDIR}/jvm.cfg  ${D}${JDK_HOME}/jre/lib/${JDK_ARCH}/
     find ${D}${JDK_HOME} -name "*.debuginfo" -print0 | xargs -0 rm
 }
diff --git a/recipes-core/openjdk/openjre-8_72b05.bb b/recipes-core/openjdk/openjre-8_72b05.bb
index 1543652..f99d25b 100644
--- a/recipes-core/openjdk/openjre-8_72b05.bb
+++ b/recipes-core/openjdk/openjre-8_72b05.bb
@@ -20,6 +20,7 @@ do_install() {
     rm -rf ${D}${JRE_HOME}
         mkdir -p ${D}${JRE_HOME}
     cp -rp ${B}/images/j2re-image/* ${D}${JRE_HOME}
+    chown -R root:root ${D}${JRE_HOME}
     install -m644 ${WORKDIR}/jvm.cfg  ${D}${JRE_HOME}/lib/${JDK_ARCH}/
     find ${D}${JRE_HOME} -name "*.debuginfo" -print0 | xargs -0 rm
 }
-- 
2.3.5


