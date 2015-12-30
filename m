Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 426BB60112
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 07:13:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBU7DtJv018737
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Dec 2015 23:13:55 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 29 Dec 2015 23:13:54 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 Dec 2015 15:14:11 +0800
Message-ID: <1451459651-18288-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-java][PATCH] openjdk-8: fix the alternative for javac
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
X-List-Received-Date: Wed, 30 Dec 2015 07:13:57 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* ${PN}-jdk doesn't exist at all so the alternative
  for javac is invalid.
* remove the useless commented lines as well.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-core/openjdk/openjdk-8_72b05.bb | 6 +-----
 recipes-core/openjdk/openjre-8_72b05.bb | 2 --
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8_72b05.bb b/recipes-core/openjdk/openjdk-8_72b05.bb
index d962b1f..e0a786a 100644
--- a/recipes-core/openjdk/openjdk-8_72b05.bb
+++ b/recipes-core/openjdk/openjdk-8_72b05.bb
@@ -96,13 +96,9 @@ inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
 
-ALTERNATIVE_${PN} = "java"
+ALTERNATIVE_${PN} = "java javac"
 ALTERNATIVE_LINK_NAME[java] = "${bindir}/java"
 ALTERNATIVE_TARGET[java] = "${JDK_HOME}/bin/java"
 
-ALTERNATIVE_${PN}-jdk = "javac"
 ALTERNATIVE_LINK_NAME[javac] = "${bindir}/javac"
 ALTERNATIVE_TARGET[javac] = "${JDK_HOME}/bin/javac"
-
-
-# PR = "${INC_PR}.1"
diff --git a/recipes-core/openjdk/openjre-8_72b05.bb b/recipes-core/openjdk/openjre-8_72b05.bb
index f99d25b..6202498 100644
--- a/recipes-core/openjdk/openjre-8_72b05.bb
+++ b/recipes-core/openjdk/openjre-8_72b05.bb
@@ -57,5 +57,3 @@ ALTERNATIVE_${PN} = "java"
 ALTERNATIVE_LINK_NAME[java] = "${bindir}/java"
 ALTERNATIVE_TARGET[java] = "${JRE_HOME}/bin/java"
 ALTERNATIVE_PRIORITY[java] = "100"
-
-# PR = "${INC_PR}.1"
-- 
2.3.5


