Return-Path: <chris.laplante@agilent.com>
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr690070.outbound.protection.outlook.com [40.107.69.70])
	by mail.openembedded.org (Postfix) with ESMTP id D9C957F815
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 18:42:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=J9Ksb2X/6gl3MRPOzcquGhR5EhDuWy0ehXejUMMdkwg7Fu4C4aK0Bilzp1w6CItdVJ0HKbAuKWi+oirHp184wsLu68ENAOK55g+vJz7oIiJ3U7tJvmohyf+J+UihJHY2VFme+t2nadmMQttFunKmxVTukyCKNPZCQmjccXIsq4LTz0Iik3n/be5WmwOQAaEhQLxxwWNGnYHynVKNBKhMwf8OZH3qbctRbfI4SpQ02UGp6GA0SxNIoMAdW7W0dVk4A1H/Od6i2G3XWh4F3NM4qCjmfj2YzgqmAqy/sCVCQIJPMAAwZUbYdXg/9F+KdLdo+in5vCrPfIHZstyBxZjqTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9esueJulezvJ38DtiYK+BEBUynEJJkkoWNGegBOlhpg=;
	b=oTbLT9Jibd6RjBHKFNNWC9JZkj3ynimfXPymOnh2fNFsf9nMT1vRjX5Hdshx55GXxPHhdLMjzPV07bxhHGpYCQn2Jmc0epzxR+mkG1XSm4tjGSBmB4xG6khvwkUIUWhoMio0nRousFXLdLtlruruzjoI98C+h26urwh22zIg++tiHu6lBtO7LodAqZwL5ecOMa+jri5TxlDhNu7kHMaqxdhh0kcc4n4zr6m1GPTLHnKSJcMBAN+vMjbpPL8RTg4xsyf80WGLMBQ1daAa3wea4xdLed6TwPa8Jccgs/F4Y6HdYH+XqiERK+SJPkrcY2j+cH68toCmaY8u8zZEvLe6uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=agilent.com;
	dmarc=pass (p=reject sp=none pct=100) action=none
	header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9esueJulezvJ38DtiYK+BEBUynEJJkkoWNGegBOlhpg=;
	b=qZ/gHXeJcFe0wbn1eXTFWxdGy3heY3wHaDNu2Gq5sSu/0Ztqzjpl490G3gUKqj7wzAC0qbB4y7to277AWIms5/pfi1BZ5/21auFDFQ2Lh2l4ugHh1REEUv9z6noroic6HByCaYtMhFDDv6kDIo0ZlLWO35KCgvHXduvJKDQ2zx8=
Received: from DM5PR12CA0018.namprd12.prod.outlook.com (2603:10b6:4:1::28) by
	CY4PR12MB1430.namprd12.prod.outlook.com (2603:10b6:903:3e::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.24; Wed, 6 Nov 2019 18:42:29 +0000
Received: from CO1NAM05FT032.eop-nam05.prod.protection.outlook.com
	(2a01:111:f400:7e50::207) by DM5PR12CA0018.outlook.office365.com
	(2603:10b6:4:1::28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.20 via
	Frontend Transport; Wed, 6 Nov 2019 18:42:29 +0000
Authentication-Results: spf=pass (sender IP is 192.25.218.34)
	smtp.mailfrom=agilent.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
	192.25.218.34 as permitted sender) receiver=protection.outlook.com;
	client-ip=192.25.218.34; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.34) by
	CO1NAM05FT032.mail.protection.outlook.com (10.152.96.144) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.2430.10 via Frontend Transport; Wed, 6 Nov 2019 18:42:29 +0000
Received: from localhost.localdomain (130.30.246.172) by
	edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server id
	15.1.1713.5; Wed, 6 Nov 2019 11:42:17 -0700
From: Chris Laplante <chris.laplante@agilent.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Nov 2019 13:41:34 -0500
Message-ID: <1573065695-91730-2-git-send-email-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573065695-91730-1-git-send-email-chris.laplante@agilent.com>
References: <1573065695-91730-1-git-send-email-chris.laplante@agilent.com>
MIME-Version: 1.0
Received-SPF: None (wpcosapexchedg3.windmz.agilent.com:
	chris.laplante@agilent.com does not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.25.218.34; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(346002)(376002)(136003)(396003)(29502001)(199004)(189003)(76176011)(50466002)(107886003)(54906003)(966005)(316002)(6306002)(16586007)(336012)(36756003)(186003)(8676002)(11346002)(486006)(50226002)(47776003)(26005)(106002)(44832011)(4326008)(426003)(446003)(48376002)(36906005)(2351001)(126002)(356004)(2906002)(14444005)(956004)(70206006)(476003)(86362001)(51416003)(6666004)(6916009)(8936002)(305945005)(5660300002)(246002)(2616005)(7636002)(478600001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1430;
	H:edgeappmail.agilent.com; FPR:; SPF:Pass; LANG:en;
	PTR:wpcosapexchedg3.windmz.agilent.com,cos.smtp.agilent.com; A:1;
	MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a4d5755-19a9-45f3-463a-08d762e913c5
X-MS-TrafficTypeDiagnostic: CY4PR12MB1430:
X-MS-Exchange-PUrlCount: 1
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR12MB14306148594F31A1E889B29B8B790@CY4PR12MB1430.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 02135EB356
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NC6N+nhPMlw09E3l+YlWjvEcCh8AnLoM57Q7dIaQAmwHAv7t6Socql+lVcRw1tlOn2J1xODBAn6KHnZU2wmBYVDG2CrHENikW5b+DhWb5+IQ6mPE1IjGV0Px1htkf7eriQAxaYR3bYsx4U7tiSJN2+WOHpw+bJywRRKzjJq47DNZIRoqbgKRq0Bg9CO3FJQ7htKS0dfFE3ioA7gigb5zqRborzfP+QRD0TOgFn7ZDzdpSa9IP48Dp1nyJlEWJBOzaxxvY8FNLf2oFqFmEa/0rd9Pnp4lRI9sCIbm/vlg9xQJmyEHXAPLfCEreU2eUJFvv00qLETa2/j9X24sszBTAtvbfF6Pz2tmaJM6MLGrCP+6apn53yJek2QiB8AzCuYfOuqrCoeFwBSQwbHyBpHmZyefewvLhKxxgF3jHrvaqnYxi0/2Jy+OoJXlKeFmm1ZARLHhSbtZv+stnQ0R8+i1z+GWw7urdVzBrkvnsPi/vlGgmFXNIFExycAH9jQPmibv
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2019 18:42:29.3421 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4d5755-19a9-45f3-463a-08d762e913c5
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
	Ip=[192.25.218.34]; Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1430
Subject: [meta-java] [PATCH v2 1/2] classpath: add patch to fix BigDecimal.compareTo()
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
X-List-Received-Date: Wed, 06 Nov 2019 18:42:30 -0000
Content-Type: text/plain

Prior to this patch compareTo couldn't handle operands with negative
scales. It passes the following unit test from JDK8:
http://hg.openjdk.java.net/jdk8/jdk8/jdk/file/tip/test/java/math/BigDecimal/CompareToTests.java

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 ...implementation-of-compareTo-in-BigDecimal.patch | 68 ++++++++++++++++++++++
 recipes-core/classpath/classpath-native_0.99.bb    | 11 ++--
 2 files changed, 74 insertions(+), 5 deletions(-)
 create mode 100644 recipes-core/classpath/classpath-0.99/0001-Fix-bad-implementation-of-compareTo-in-BigDecimal.patch

diff --git a/recipes-core/classpath/classpath-0.99/0001-Fix-bad-implementation-of-compareTo-in-BigDecimal.patch b/recipes-core/classpath/classpath-0.99/0001-Fix-bad-implementation-of-compareTo-in-BigDecimal.patch
new file mode 100644
index 0000000..35fb81e
--- /dev/null
+++ b/recipes-core/classpath/classpath-0.99/0001-Fix-bad-implementation-of-compareTo-in-BigDecimal.patch
@@ -0,0 +1,68 @@
+From b561cdb6f3fef251696216775c775f84369278cc Mon Sep 17 00:00:00 2001
+From: Chris Laplante <chris.laplante@agilent.com>
+Date: Wed, 2 Oct 2019 21:38:11 -0400
+Subject: [PATCH 1/2] Fix bad implementation of compareTo in BigDecimal
+
+Prior to this patch compareTo couldn't handle operands with negative
+scales. It passes the following unit test from JDK8:
+http://hg.openjdk.java.net/jdk8/jdk8/jdk/file/tip/test/java/math/BigDecimal/CompareToTests.java
+
+Upstream-Status: Inappropriate [dead project]
+
+Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
+---
+ java/math/BigDecimal.java | 32 ++++++++++++++++++--------------
+ 1 file changed, 18 insertions(+), 14 deletions(-)
+
+diff --git a/java/math/BigDecimal.java b/java/math/BigDecimal.java
+index 7f4546c..e14d894 100644
+--- a/java/math/BigDecimal.java
++++ b/java/math/BigDecimal.java
+@@ -861,26 +861,30 @@ public class BigDecimal extends Number implements Comparable<BigDecimal>
+     if (scale == val.scale)
+       return intVal.compareTo (val.intVal);
+ 
+-    BigInteger thisParts[] =
+-      intVal.divideAndRemainder (BigInteger.TEN.pow (scale));
+-    BigInteger valParts[] =
+-      val.intVal.divideAndRemainder (BigInteger.TEN.pow (val.scale));
++    BigInteger[] thisParts = new BigInteger[2];
++    BigInteger[] valParts = new BigInteger[2];
++
++    if (scale > 0)
++      thisParts = intVal.divideAndRemainder (BigInteger.TEN.pow (scale));
++    else
++      {
++        thisParts[0] = intVal.multiply (BigInteger.TEN.pow (-scale));
++        thisParts[1] = BigInteger.ZERO;
++      }
++
++    if (val.scale > 0)
++      valParts = val.intVal.divideAndRemainder (BigInteger.TEN.pow (val.scale));
++    else
++      {
++        valParts[0] = val.intVal.multiply (BigInteger.TEN.pow (-val.scale));
++        valParts[1] = BigInteger.ZERO;
++      }
+ 
+     int compare;
+     if ((compare = thisParts[0].compareTo (valParts[0])) != 0)
+       return compare;
+ 
+     // quotients are the same, so compare remainders
+-
+-    // Add some trailing zeros to the remainder with the smallest scale
+-    if (scale < val.scale)
+-      thisParts[1] = thisParts[1].multiply
+-                        (BigInteger.valueOf (10).pow (val.scale - scale));
+-    else if (scale > val.scale)
+-      valParts[1] = valParts[1].multiply
+-                        (BigInteger.valueOf (10).pow (scale - val.scale));
+-
+-    // and compare them
+     return thisParts[1].compareTo (valParts[1]);
+   }
+ 
+-- 
+2.7.4
+
diff --git a/recipes-core/classpath/classpath-native_0.99.bb b/recipes-core/classpath/classpath-native_0.99.bb
index a1e1e0f..93d67b2 100644
--- a/recipes-core/classpath/classpath-native_0.99.bb
+++ b/recipes-core/classpath/classpath-native_0.99.bb
@@ -5,11 +5,12 @@ DEPENDS += "classpath-initial-native ecj-initial-native virtual/java-initial-nat
 PR = "${INC_PR}.0"
 
 SRC_URI += " \
-            file://sun-security-getproperty.patch;striplevel=0 \
-            file://ecj_java_dir.patch \
-            file://autotools.patch \
-            file://miscompilation.patch \
-            file://toolwrapper-exithook.patch \
+           file://sun-security-getproperty.patch;striplevel=0 \
+           file://ecj_java_dir.patch \
+           file://autotools.patch \
+           file://miscompilation.patch \
+           file://toolwrapper-exithook.patch \
+           file://0001-Fix-bad-implementation-of-compareTo-in-BigDecimal.patch \
            "
 SRC_URI[md5sum] = "0ae1571249172acd82488724a3b8acb4"
 SRC_URI[sha256sum] = "f929297f8ae9b613a1a167e231566861893260651d913ad9b6c11933895fecc8"
-- 
2.7.4


