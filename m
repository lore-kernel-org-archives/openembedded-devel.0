Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 01A67731AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Dec 2015 07:56:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBP7uYJj005310
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 23:56:34 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 24 Dec 2015 23:56:34 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Dec 2015 15:56:28 +0800
Message-ID: <2fdcc66628e5011c03d4f40d2c6883fb8700ddaa.1451029460.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1451029460.git.jackie.huang@windriver.com>
References: <cover.1451029460.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 08/15] openjdk: add keytool link
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
X-List-Received-Date: Fri, 25 Dec 2015 07:56:34 -0000
Content-Type: text/plain

From: Amy Fong <amy.fong@windriver.com>

Add alternative link keytool

Signed-off-by: Amy Fong <amy.fong@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-core/openjdk/openjdk-postinst.inc | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-postinst.inc b/recipes-core/openjdk/openjdk-postinst.inc
index e309a27..4985d56 100644
--- a/recipes-core/openjdk/openjdk-postinst.inc
+++ b/recipes-core/openjdk/openjdk-postinst.inc
@@ -74,11 +74,13 @@ pkg_prerm_${JDKPN}-vm-zero () {
 
 inherit update-alternatives
 
-ALTERNATIVE_${JDKPN}-jre = "java"
-ALTERNATIVE_TARGET_${JDKPN}-jre = "${JDK_HOME}/jre/bin/java"
-
+ALTERNATIVE_${JDKPN}-jre = "java keytool"
 ALTERNATIVE_${JDKPN}-jdk = "javac"
-ALTERNATIVE_TARGET_${JDKPN}-jdk = "${JDK_HOME}/bin/javac"
+
+ALTERNATIVE_TARGET[java] = "${JDK_HOME}/jre/bin/java"
+ALTERNATIVE_TARGET[javac] = "${JDK_HOME}/bin/javac"
+ALTERNATIVE_TARGET[keytool] = "${JDK_HOME}/jre/bin/keytool"
 
 ALTERNATIVE_LINK_NAME[java] = "${bindir}/java"
 ALTERNATIVE_LINK_NAME[javac] = "${bindir}/javac"
+ALTERNATIVE_LINK_NAME[keytool] = "${bindir}/keytool"
-- 
1.9.1


