Return-Path: <chris.laplante@agilent.com>
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr720048.outbound.protection.outlook.com [40.107.72.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5E9CC7F815
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 18:42:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=E15TeB/R8g1vqMnVqSAXd5vwWWsJIhE1hEckXvowEVkZ9PNtLCsxHxsQe34u+77RaK/tQDuLLzsMeUCZMndnLf8Vw2Cw5Kj//P8AvHMhgM6alN9LvaZ8Va3+8jN5ChnaN0/D2wJbhg8sGF0451JONO0jyfSlv6T1a/nEHmx2ENQlfVOjrkxp+xYdIOpVLNQqzC4L/w3oOj4d5m6YjtywyNNa5D3pRDT+CrN+ES0bMdnx+dU4HQkPplRzSgCF9bmZS5A9Oi6TYb4sXS59E/b63y06oitjFQspEfKGS71aL9AkfAZSlbVIRKAK1o744g3aYj9Wsa5Ql8iIFeKOoqm1NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=IcQwdqBtq1/PWL2Oh+MwKeohyV4rstrKDXMJc8pNulw=;
	b=KdgRDCDfCLydjaZceTbF0XMahTCRZQMQlbuDsKBvK8vW4tW4g+ZDg93vUBYPiGPqJDp5gN8WtQRqRwKgFWAyfs4Jgj9NWWovuzBmapCjbhIy21X4IDelli3lYQWVkRvrCNib7etnj6kEYqI8GV2o9zk/zBH+9KI1eLgeyC/PE6cHtSgazZ3GSFc2JUadXGZSK/5TA6I8DXZU24seC8cOlgocw5STqDrHiR2zY/mcpN6P8NVgpKx47tgJwNcK7m4+sFwExAUu1Fg3lrtMvgx5dKhw09jeQ4eoj+hWqX9EvsFI2yFzL6pR0D66kobP+7fySj1KHAfneBZCzZZrE3QyIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=agilent.com;
	dmarc=pass (p=reject sp=none pct=100) action=none
	header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=IcQwdqBtq1/PWL2Oh+MwKeohyV4rstrKDXMJc8pNulw=;
	b=PLxUQvXzfESKbV1elFk644datTO3j9+I3artqoDYgEoo/xfc3qEu8b/cuJaAiqiQYmQT2uYQTjMRPIHT06sR3er9g1WMaJpiZMUlAPkekll7ZD4dizs1b792yVEya7UENcmejpbHnEqzRnRAi5eHs7IlTEWxXM0nrIiqRxDGeDs=
Received: from DM5PR12CA0009.namprd12.prod.outlook.com (2603:10b6:4:1::19) by
	MN2PR12MB4286.namprd12.prod.outlook.com (2603:10b6:208:199::22) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22;
	Wed, 6 Nov 2019 18:42:30 +0000
Received: from CO1NAM05FT032.eop-nam05.prod.protection.outlook.com
	(2a01:111:f400:7e50::203) by DM5PR12CA0009.outlook.office365.com
	(2603:10b6:4:1::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.20 via
	Frontend Transport; Wed, 6 Nov 2019 18:42:30 +0000
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
	15.20.2430.10 via Frontend Transport; Wed, 6 Nov 2019 18:42:30 +0000
Received: from localhost.localdomain (130.30.246.172) by
	edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server id
	15.1.1713.5; Wed, 6 Nov 2019 11:42:19 -0700
From: Chris Laplante <chris.laplante@agilent.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Nov 2019 13:41:35 -0500
Message-ID: <1573065695-91730-3-git-send-email-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573065695-91730-1-git-send-email-chris.laplante@agilent.com>
References: <1573065695-91730-1-git-send-email-chris.laplante@agilent.com>
MIME-Version: 1.0
Received-SPF: None (wpcosapexchedg3.windmz.agilent.com:
	chris.laplante@agilent.com does not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.25.218.34; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(199004)(189003)(29502001)(36756003)(19627235002)(956004)(476003)(2616005)(11346002)(446003)(2351001)(126002)(51416003)(44832011)(486006)(426003)(76176011)(54906003)(106002)(16586007)(86362001)(36906005)(70206006)(186003)(26005)(6666004)(356004)(4326008)(48376002)(336012)(2906002)(14444005)(50466002)(8676002)(8936002)(6916009)(305945005)(47776003)(7636002)(50226002)(6306002)(498600001)(107886003)(246002)(5660300002)(966005)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4286;
	H:edgeappmail.agilent.com; FPR:; SPF:Pass; LANG:en;
	PTR:wpcosapexchedg3.windmz.agilent.com,cos.smtp.agilent.com; A:1;
	MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61b9e8e8-a103-43d0-e6e3-08d762e9142b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4286:
X-MS-Exchange-PUrlCount: 1
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4286242C4B1EA086A10D6DB18B790@MN2PR12MB4286.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-Forefront-PRVS: 02135EB356
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U/1VTouTP29KlaCyKpGlj0H6V6p2+hfueXFPr8sFlF1eSUjXVWYB4g1Cq0UehWvg1emiW0qEI0TV9Vss0I9knT+QmO4N8ml/Pl0uR6/a3xdV4kkftx4PfRMvSvrcpi3zAld8Jb00FJtz0/4SXt2yVTREtbrfzRiJxML2EQpDycPFXKpEsrFxtpOjk7Fu5//fy5WRqEzYK9h8E8blFGPan4QEGO12vqhoNlFAJSac7GzOzlyj3oAzCtruqaKj3vRyTk7V6l9jx9c9hpCLbF7axl30Mm5vBAyJWaq2oMp6+xK4rNTTJ/FlE7cK8NpARx4S2c9fxy3LbwBUE8Huhxg7D3bsoktTl2JzTxcd/Et1CZGRHAvx3sdtJ8bC2xHUZTS1fPs7mSJTU3jjiLn8gJ++JTDKGN4W6xS1WaWkBaGvoDgDLZSBmYNu84Oik5HMBaxkMgtGjrRactY5B+8YUvNqFw+k09ZaaAgHWtzUfs72z12mEL19DwFMOE5d0uUUkWm8
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2019 18:42:30.0146 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b9e8e8-a103-43d0-e6e3-08d762e9142b
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
	Ip=[192.25.218.34]; Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4286
Subject: [meta-java] [PATCH v2 2/2] classpath: add patch to fix BigDecimal.stripTrailingZeros()'s handling of 0.
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
X-List-Received-Date: Wed, 06 Nov 2019 18:42:32 -0000
Content-Type: text/plain

Previously, 'new BigDecimal("0").stripTrailingZeros()' would blow up:

Caused by: java.lang.StringIndexOutOfBoundsException: String index out of range: -1
   at java.lang.String.charAt
   at java.math.BigDecimal.stripTrailingZeros

Fixes https://sourceforge.net/p/saxon/mailman/message/27204592/

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 ...ecimal.stripTrailingZeros-s-handling-of-0.patch | 51 ++++++++++++++++++++++
 recipes-core/classpath/classpath-native_0.99.bb    |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 recipes-core/classpath/classpath-0.99/0002-Fix-BigDecimal.stripTrailingZeros-s-handling-of-0.patch

diff --git a/recipes-core/classpath/classpath-0.99/0002-Fix-BigDecimal.stripTrailingZeros-s-handling-of-0.patch b/recipes-core/classpath/classpath-0.99/0002-Fix-BigDecimal.stripTrailingZeros-s-handling-of-0.patch
new file mode 100644
index 0000000..645b010
--- /dev/null
+++ b/recipes-core/classpath/classpath-0.99/0002-Fix-BigDecimal.stripTrailingZeros-s-handling-of-0.patch
@@ -0,0 +1,51 @@
+From 14fa6fc320eb84d0adb9ae00dd66ddb1caaae2a6 Mon Sep 17 00:00:00 2001
+From: Chris Laplante <chris.laplante@agilent.com>
+Date: Wed, 2 Oct 2019 21:46:01 -0400
+Subject: [PATCH 2/2] Fix BigDecimal.stripTrailingZeros()'s handling of 0.
+
+Previously, 'new BigDecimal("0").stripTrailingZeros()' would blow up:
+
+Caused by: java.lang.StringIndexOutOfBoundsException: String index out of range: -1
+   at java.lang.String.charAt
+   at java.math.BigDecimal.stripTrailingZeros
+
+Fixes https://sourceforge.net/p/saxon/mailman/message/27204592/
+
+Upstream-Status: Inappropriate [dead project]
+
+Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
+---
+ java/math/BigDecimal.java | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/java/math/BigDecimal.java b/java/math/BigDecimal.java
+index e14d894..5e30f1c 100644
+--- a/java/math/BigDecimal.java
++++ b/java/math/BigDecimal.java
+@@ -1335,17 +1335,22 @@ public class BigDecimal extends Number implements Comparable<BigDecimal>
+    */
+   public BigDecimal stripTrailingZeros()
+   {
++    if (intVal.intValue() == 0)
++      return ZERO;
++
+     String intValStr = intVal.toString();
+     int newScale = scale;
+     int pointer = intValStr.length() - 1;
++
+     // This loop adjusts pointer which will be used to give us the substring
+     // of intValStr to use in our new BigDecimal, and also accordingly
+     // adjusts the scale of our new BigDecimal.
+-    while (intValStr.charAt(pointer) == '0')
++    while (pointer >= 0 && intValStr.charAt(pointer) == '0')
+       {
+         pointer --;
+         newScale --;
+       }
++
+     // Create a new BigDecimal with the appropriate substring and then
+     // set its scale.
+     BigDecimal result = new BigDecimal(intValStr.substring(0, pointer + 1));
+-- 
+2.7.4
+
diff --git a/recipes-core/classpath/classpath-native_0.99.bb b/recipes-core/classpath/classpath-native_0.99.bb
index 93d67b2..daf7611 100644
--- a/recipes-core/classpath/classpath-native_0.99.bb
+++ b/recipes-core/classpath/classpath-native_0.99.bb
@@ -11,6 +11,7 @@ SRC_URI += " \
            file://miscompilation.patch \
            file://toolwrapper-exithook.patch \
            file://0001-Fix-bad-implementation-of-compareTo-in-BigDecimal.patch \
+           file://0002-Fix-BigDecimal.stripTrailingZeros-s-handling-of-0.patch \
            "
 SRC_URI[md5sum] = "0ae1571249172acd82488724a3b8acb4"
 SRC_URI[sha256sum] = "f929297f8ae9b613a1a167e231566861893260651d913ad9b6c11933895fecc8"
-- 
2.7.4


