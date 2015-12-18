Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0EF45731B0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 07:31:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBI7Vlue018073
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 23:31:47 -0800
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 17 Dec 2015 23:31:46 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Dec 2015 15:31:55 +0800
Message-ID: <1450423916-4811-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-java][PATCH 1/2] openjdk: fix host-user-contaminated QA issue
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
X-List-Received-Date: Fri, 18 Dec 2015 07:31:48 -0000
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
 1 file changed, 1 insertion(+)

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
-- 
2.3.5


