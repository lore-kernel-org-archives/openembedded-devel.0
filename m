Return-Path: <chris.laplante@agilent.com>
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr720044.outbound.protection.outlook.com [40.107.72.44])
	by mail.openembedded.org (Postfix) with ESMTP id A66276D7C1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Oct 2019 02:29:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=KPqL7fSj0oItAvpf7lfM2OKnwExn0RI6ef0gjMCwKye8JQCa4BzddNJK+K0gY/Qz7Y7PikbEJ3uwrGQFWQeOS6+4VPMrFJKjdVEvLAt8pOOEJd6j5E5GzlLqIaaJwUK+8ektd0CcRfe3BkF9Vrfkkk5YkjKwlNEmbYzvpZ7S2mypTsxhYUwZjUoJNyTJCxqpxutlNyAVwNjNB/IvHog1TPFeF5gF7wJoTy7k0Lfkl0Z8NLhhaiXxlJvExO7IP+wOKPJwwoshou4gJ+llTiLqKISG5MQY5YaCKkJGwt4KvKRTzyHuxu1yO5s6OX/p6oFdIufHqNvKIzeyvnNAScuDNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kdOqmCIW3y61XBQveD/QD4vJ1f5XOveriU81dNyqaHg=;
	b=HYiigET3ZGX2zUPMfD2uRUZ1m+CTIYId4//lJegAHd2D1t6XegpOda13o5s6MnmEQST3Zi+5B+3syLTjOQZqTOY0wqibgSYP0xrg7bAwrfRQrNmcuNGJgLndVhZeBeARYM6pg5WJ20Pent0Usf8ha6jtelw2zhgu5vs+9P9iADb5/TRzSgIPaECVYi4vnkSn7gIO23HAOWOodWlxyBNrr9m6Z3he3AuORDYHbf8XHrqXypAqTxKa0niDgYjlM6Lh6HRuqDVAh94PlmBe5LekH3NT660I38CV/XOxEs8KIoA18KW/g/EB6EQwo3iBckDNbZS3abFK7CQLhC5VIII9Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=agilent.com;
	dmarc=pass (p=reject sp=none pct=100) action=none
	header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kdOqmCIW3y61XBQveD/QD4vJ1f5XOveriU81dNyqaHg=;
	b=dNlbMtv1cP8UwHE6wUDxggftD4RLzMxUPhjv2q6fRqB2byx1prdyfeYwv3M39JcG5a6yxvcHgM/6HuuI9JdudxGZX0RGsG2BWOvCsCTpqN47FDgN7xmoJuebavQIokGptaaxseBo/z0I9cUEAz5ai0s8u3Tcmvqyk/StjftqoUU=
Received: from BN6PR1201CA0019.namprd12.prod.outlook.com
	(2603:10b6:405:4c::29) by MN2PR12MB4190.namprd12.prod.outlook.com
	(2603:10b6:208:1dd::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20;
	Thu, 3 Oct 2019 02:29:45 +0000
Received: from CO1NAM05FT005.eop-nam05.prod.protection.outlook.com
	(2a01:111:f400:7e50::201) by BN6PR1201CA0019.outlook.office365.com
	(2603:10b6:405:4c::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15 via
	Frontend Transport; Thu, 3 Oct 2019 02:29:45 +0000
Authentication-Results: spf=pass (sender IP is 192.25.218.34)
	smtp.mailfrom=agilent.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
	192.25.218.34 as permitted sender) receiver=protection.outlook.com;
	client-ip=192.25.218.34; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.34) by
	CO1NAM05FT005.mail.protection.outlook.com (10.152.96.110) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2327.7 via Frontend Transport; Thu, 3 Oct 2019 02:29:45 +0000
Received: from localhost.localdomain (10.46.20.212) by edgeappmail.agilent.com
	(192.25.218.34) with Microsoft SMTP Server id 15.1.1713.5;
	Wed, 2 Oct 2019 20:29:43 -0600
From: Chris Laplante <chris.laplante@agilent.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Oct 2019 22:27:49 -0400
Message-ID: <1570069669-31226-1-git-send-email-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Received-SPF: None (wpcosapexchedg3.windmz.agilent.com:
	chris.laplante@agilent.com does not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.25.218.34; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(346002)(376002)(39850400004)(396003)(199004)(189003)(29502001)(70206006)(6306002)(51416003)(36756003)(47776003)(305945005)(7636002)(107886003)(36906005)(86362001)(316002)(106002)(336012)(50466002)(186003)(966005)(8676002)(478600001)(26005)(5660300002)(4326008)(19627235002)(48376002)(50226002)(2616005)(476003)(486006)(44832011)(126002)(426003)(8936002)(16586007)(2906002)(6916009)(14444005)(2351001)(356004)(246002)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4190;
	H:edgeappmail.agilent.com; FPR:; SPF:Pass; LANG:en;
	PTR:cos.smtp.agilent.com,wpcosapexchedg3.windmz.agilent.com; A:1;
	MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62b92682-929e-4594-21ec-08d747a98df3
X-MS-TrafficTypeDiagnostic: MN2PR12MB4190:
X-MS-Exchange-PUrlCount: 2
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41904934EFA96A52AB10A6E48B9F0@MN2PR12MB4190.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-Forefront-PRVS: 01792087B6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: skWo4rf41d1KEqZtjo+GyQmkkF6Gb0/3NLl5DR+TXICORyh3Di8Fm71cOIV7rsdgDlRPwvVNv9EvBvmcyXN+5o9/p9qwvfRkKjx6AlmaZ5/B4mAxclopBTlIuFjOyeQdSQsTlpQ6u1dU7J5b7jK8aQYCYWqMjC8DBS4B/J5C2yvWQMSTgN88xFXTWZitVtY5rCOy4mpGlUFnIif/SOAblyeNzBusUG9Cc7GFobxZbSKgZrUJmbh++JBPtGmve3qva/OCFvlYHfWlZUkwb612VciTnd0ZDwMAFiv6CzsSp6xSh3xzsNiFBJvwdvnGc5wu2uAEt3cCiQpgdkpK6MA5cMJdStpJZGwhOKYQ96lUKVfxTN57bxxaSnj6sdvTwoNclXzN/JSuXSXL07HfxWFv96d83sSblWfsr0z9rbfJzifJirjeeVw0LYLaG3GBzzQjhyf4TXyACZU/P73jS0V6qg==
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2019 02:29:45.1459 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b92682-929e-4594-21ec-08d747a98df3
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
	Ip=[192.25.218.34]; Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4190
Subject: [meta-java][PATCH] classpath-native: add patches to fix BigDecimal.compareTo() and BigDecimal.stripTrailingZeros()
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
X-List-Received-Date: Thu, 03 Oct 2019 02:29:46 -0000
Content-Type: text/plain

---
 ...implementation-of-compareTo-in-BigDecimal.patch | 68 ++++++++++++++++++++++
 ...ecimal.stripTrailingZeros-s-handling-of-0.patch | 51 ++++++++++++++++
 recipes-core/classpath/classpath-native_0.99.bb    | 12 ++--
 3 files changed, 126 insertions(+), 5 deletions(-)
 create mode 100644 recipes-core/classpath/classpath-0.99/0001-Fix-bad-implementation-of-compareTo-in-BigDecimal.patch
 create mode 100644 recipes-core/classpath/classpath-0.99/0002-Fix-BigDecimal.stripTrailingZeros-s-handling-of-0.patch

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
index a1e1e0f..daf7611 100644
--- a/recipes-core/classpath/classpath-native_0.99.bb
+++ b/recipes-core/classpath/classpath-native_0.99.bb
@@ -5,11 +5,13 @@ DEPENDS += "classpath-initial-native ecj-initial-native virtual/java-initial-nat
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
+           file://0002-Fix-BigDecimal.stripTrailingZeros-s-handling-of-0.patch \
            "
 SRC_URI[md5sum] = "0ae1571249172acd82488724a3b8acb4"
 SRC_URI[sha256sum] = "f929297f8ae9b613a1a167e231566861893260651d913ad9b6c11933895fecc8"
-- 
2.7.4


