Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E59ECAAD5
	for <webhook@archiver.kernel.org>; Sun, 28 Aug 2022 15:07:30 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.45])
 by mx.groups.io with SMTP id smtpd.web11.59738.1661699243604881044
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 08:07:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=GbOHJNe0;
 spf=pass (domain: kpit.com, ip: 40.107.222.45,
 mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWFeBqWuxR/4DVmWuKosI5GzUAwL+OkW8yD74MZl3Nz1GrPO94RE+rT9swzkXABvORCHzqlfspYEL1IfW2lsINShRmn8c5ZL6ov78ThhvazHf9I8m4UU4GC2boalqhhAEYghagilFvN+whbpooO4OSSmEQ3t97nM0sfMILKQGzEjXi9/cdxg0t1CBfPa6kCAr3fgvK6VuZOxGSRLXt8Zk0eZ87UNt3uWZU4EF/8tjum4ecTe/UbUQM994BFzY1sOQq6fBUqxrP/XYE7GRl3oKXnENhKBGJfGOeQQP24p02TkBLyG6fgDIDT7xiZA9oe1gDBcJ+teHcC6akTHI4u39A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBylIK3SFNIIkhmIzdW5uMTpROgJ9twrJPmU0v8g/PY=;
 b=OIPwHI3yrQ3ClwDyiHgWg3tAa359S5A84TtI+zFaxooR6v9T70WvptRYxEFNLOThjgazdsSsLp1fmMM9t3F714nzAiYD+JtwUBeg3NkNNUD5Lh3leDS4C2nBfi+ytXaQmIoLm6SFIgrueD1sGJfMetkHw5uza86Ml6Jf9aB2TyfSFjMwvUAiSsu+9ksLokx9I7ReZfsmRdlRyqdEzW/OmqG/V8/amJ7lI9EqHwrgfHNkbZ1u4uads7WXrS0TauHSsNvqfW2cRla96B7PvaBHt+dJxXk2SdZGaTYzz0Nl3dsBMDpoieARZCRVmk7HLJyBqmNacYnmF3mm1AdkRifqhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBylIK3SFNIIkhmIzdW5uMTpROgJ9twrJPmU0v8g/PY=;
 b=GbOHJNe0HDdIlaw38C7TT2yfuzwF/DhqdDSZiCNsT7eNmKnE+yEGqbz6CDzZWPTKTRv8UnWDFr2ALXgsPX0OKIbhnPLerAA8P39be46cnw4N1oMA8anrDZpZNNx/+DDeQ065OT2rmhAFZUPyQeCV31iLSoxiSZHkcmgrfkqAhfE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3::12)
 by MAZPR01MB6269.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:4c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Sun, 28 Aug
 2022 15:07:12 +0000
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5875:d757:2635:3674]) by MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5875:d757:2635:3674%6]) with mapi id 15.20.5566.021; Sun, 28 Aug 2022
 15:07:12 +0000
From: Virendra Thakur <virendra.thakur@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: Virendra Thakur <virendrak@kpit.com>
Subject: [oe][meta-java][dunfell][PATCH] openjdk: Fix CVE-2022-34169 for
 openjdk
Date: Sun, 28 Aug 2022 20:36:48 +0530
Message-Id: <20220828150648.6850-1-virendra.thakur@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0135.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::6) To MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:3::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be609d94-a998-45e5-06b4-08da8906fc01
X-MS-TrafficTypeDiagnostic: MAZPR01MB6269:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Jre5a72IO6A9Jwl3HUgN1RnIhgCVajl/SCAcJT9yqkphe3cx+Z589IHsl5o85gXdo+eYEb9YZ6U/6w41YRKx/r5i/LozjjX+rSVni6BLHjo8e9JJeIqRn05iPDMvsbYMd6HjPfGKtzWIus8GQCKMJcFVu4A2w6aloHCSYeyyamQkUzGCrg651liPv5qtKxRA+mKb9bhGFhffOD7FWKf8Aa7f9zzLVagS2i462/GDUi/Brsv/Ta13M8G8uafUD2YaZtzOITjdIiQ3BT9zS4A5jhPFiIzoR+BK2JeCXR1wVURS8eTCC60ab55o7S+w0WX3M/mOOL5WDO5JOkFXZWyBzSSh/sllIiG2HSaKh8TzT0Vi08fZJcjsiMgl3WfRTLZYChmKhCDixKrh+AVgI2t2sM3Pz6sROys+2zXsjnwbp6ZHnKvCunhiiZQFyU/8WQsp5N1Hgnp8pK2D9dT82ptd1/1xgX4kCn7peJJzaVeCXssY3myim0SocKs9S0eZ2PTXF0ugY0FFb0JtRLNeo0jhTA+24jMW0ZXyhFJFkjWZKsmyvJ7FzvzsW1Ey7f93GUTKMCKwqgsO/7aZZ9SYkd391tOKmKIRDRPVQ2OuGkMe7DR6Jha7N4oDCArcjxkn0lY41PqXERhqWhhTwtaw44o0j+alW0T0q8eY8hTfr1xsZWsUkMzF+DgHiKU9CP3QU7VFLl5MkfddZ6ZvMq+nnsC4Ba9tcIfFxYKwFBJ0qY6057oXATAr9tT2gmjYrUMhjGEp4J6LcJBLtSd95tULM+zkvqlqSoWPYF37QgVjAHI/pik=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(39850400004)(396003)(366004)(52116002)(86362001)(6512007)(26005)(6486002)(966005)(478600001)(107886003)(6666004)(6506007)(41300700001)(186003)(38350700002)(38100700002)(83380400001)(1076003)(2616005)(66574015)(6916009)(66476007)(8936002)(66946007)(5660300002)(66556008)(4326008)(8676002)(36756003)(316002)(2906002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iuR6cNHsgDM1D6TMeKVpoYkY8TCfDGDflo96zUMO5MFNfdJdHMWIgJgnsPop?=
 =?us-ascii?Q?I23Tq7XD8e58/vujWu5dNQb5I7e/O3Q8pFoQ7Ql5q1KpHJAnptEcpPMnfLAz?=
 =?us-ascii?Q?jgHGTT13U4MysQDQb6ir2Ar3ykVFNrXM8h1ALb6GqBYtnG0HBngs7XWooMm+?=
 =?us-ascii?Q?3/cQ89dSx5r0ej4Gb9lZaMIwBIWIj8DZdeF+YPHaw8Rhqro3SjJxMY0kpM5J?=
 =?us-ascii?Q?Klgb8ykhu7UvRYjmWsbfbFCqc22XC9eFjyaU6xgdyYB8LsIx3oHjZMQ/ZOZb?=
 =?us-ascii?Q?KoX1YSrKXCCr1mA7pnfvazlSsdz+jerPJYFWIcIuIDY3lEcFL7p0rlMFzpQN?=
 =?us-ascii?Q?thvFirJm1M57Ne9la+cRXNYmADP7T/V6jyEfl2Q/LdN23+YA4DW48RrxawGF?=
 =?us-ascii?Q?N8AAEoqgNdI11QCCg/0uHXu9C4P7E0QQc84KYl/EzJHH/NhdrN8Xl2Pzgnu0?=
 =?us-ascii?Q?U+gld906AAJiuAGev1aGBGMNpK0fMHjfK2bDqA3PKSGXHDuBfDjsmJj9Lg7O?=
 =?us-ascii?Q?V3wimUhQOMVlB/UVeQmBQX8NhdjoBqR+CV+KTEXK3xJl6fgta2zvrOUx8wuI?=
 =?us-ascii?Q?iSOkuLg+8m9uyRloIrLX4htp8NELLUHx6qaXqporHwDOiUA0HhxMKlj0Oc36?=
 =?us-ascii?Q?7CyZbqwRxJXOmFm5Ktuzx583H2dcufPu8dVUIadXj6/6yURT0Md0IVcEPsBg?=
 =?us-ascii?Q?evlMwT/6vnz49CKQg8sPmOjw2EXTJaGzR0QNydl4XNmWlu6JXFglojcYaqw4?=
 =?us-ascii?Q?Cwv4Izmq51sPyosuBs88gx3dZwKnSeVO+j3TteKHgNyPQxupi1szuuSvqJE4?=
 =?us-ascii?Q?WZKTJZ1TelBI8gyH7CUvLbe2nRLsPpVQ1Isnv6C9Qt4SVdjsknM2V/sZ3XkE?=
 =?us-ascii?Q?osRQ2ykFBgHl5oE6TKbvvq7AocequETKzM1bvJ3K4F8YPujLYssEaJ2+WEiD?=
 =?us-ascii?Q?tNOddniNXH5E8GOTAA1Yf+JU1btgPoz4XLyGIFt9E9CaVgyoTwIvLPRAPIZe?=
 =?us-ascii?Q?0DKt1YetlSMZ0jWHvdc4tx0tkZs2zvNu5jeV20JLRBhCi1i9h08vlZs1ZuQI?=
 =?us-ascii?Q?Lwepc1tpNE04cf3pTNbSD07a/PeohH+ceQIzQ6jbC9sz//2dyGHHNSjMytUy?=
 =?us-ascii?Q?oLcEElZ3aNze4REVpRw8pQNnRubOQwWE7kVcDv1hogq7NxrxBGrFqS3oktXs?=
 =?us-ascii?Q?FZn3lyHAP2HTpcEcNFDC44v75+nd/lbXWdaXD7WRp396x1HYXRcnF/hafYP/?=
 =?us-ascii?Q?F2aTIA7pfP3Q4Zf0xlj4WcUiEHyiXsXfZDqpCvyLwN1+vtgOQl6j4mZ+cVlc?=
 =?us-ascii?Q?PtkrRHguzQ6d2AEG09jMtTyV5FFclLQkyYGcMHA2PlRC5ADunfS1ppeVjQ4z?=
 =?us-ascii?Q?fbAwsi2xtm9quwHyzZmk3CjBn10Xbl9+uU8kqp5A4M8Hgbq3cen/NQFI8Nvf?=
 =?us-ascii?Q?btoczAy+RSkUYVREQGDrPL17rJPslNbR9DjTb9ft420gMhG9jY03AtISGIgA?=
 =?us-ascii?Q?0EVpKxXGCizAvc51x4bmPfkOGVtm3l44NZJFZIXExXpisccI6MktK1Quday1?=
 =?us-ascii?Q?FJQQmYZe+/hRiinNOtGUnidWBiKgyyIpVI22z5s2?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 be609d94-a998-45e5-06b4-08da8906fc01
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2022 15:07:11.9736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ms1486lm0IR9QG2l16u3V1m00Z0E5BZeu6fLcOpmT5bTMOmD3FLxGB+ekSdSfP9+RLlAuwFuR3COf+XpgMMj4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB6269
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Aug 2022 15:07:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98497

From: Virendra Thakur <virendrak@kpit.com>

Add patch to fix CVE-2022-34169

Reference:
https://github.com/openjdk/jdk/commit/41ef2b249073450172e11163a4d05762364b1=
297

https://launchpadlibrarian.net/614309983/openjdk-8_8u342~b06-1_8u342-b07-1.=
diff.gz

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 .../openjdk/openjdk-8-release-common.inc      |   1 +
 .../patches-openjdk-8/CVE-2022-34169.patch    | 111 ++++++++++++++++++
 2 files changed, 112 insertions(+)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/CVE-2022-34169.p=
atch

diff --git a/recipes-core/openjdk/openjdk-8-release-common.inc b/recipes-co=
re/openjdk/openjdk-8-release-common.inc
index ff8d96e..cebbc0b 100644
--- a/recipes-core/openjdk/openjdk-8-release-common.inc
+++ b/recipes-core/openjdk/openjdk-8-release-common.inc
@@ -21,6 +21,7 @@ PATCHES_URI =3D "\
     file://2007-jdk-no-genx11-in-headless.patch \
     file://2008-jdk-no-unused-deps.patch \
     file://2009-jdk-make-use-gcc-instead-of-ld-for-genSocketOptionRe.patch=
 \
+    file://CVE-2022-34169.patch \
 "
 HOTSPOT_UB_PATCH =3D "\
     file://1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch \
diff --git a/recipes-core/openjdk/patches-openjdk-8/CVE-2022-34169.patch b/=
recipes-core/openjdk/patches-openjdk-8/CVE-2022-34169.patch
new file mode 100644
index 0000000..db5acba
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/CVE-2022-34169.patch
@@ -0,0 +1,111 @@
+From 41ef2b249073450172e11163a4d05762364b1297 Mon Sep 17 00:00:00 2001
+From: Joe Wang <joehw@openjdk.org>
+Date: Fri, 13 May 2022 02:02:26 +0000
+Subject: [PATCH] 8285407: Improve Xalan supports
+
+Reviewed-by: naoto, lancea, ahgross, rhalade
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+CVE: CVE-2022-34169
+
+Upstream-Status: Backport [https://launchpadlibrarian.net/614309983/openjd=
k-8_8u342~b06-1_8u342-b07-1.diff.gz]
+---
+Index: openjdk/jaxp/src/com/sun/org/apache/bcel/internal/classfile/Constan=
tPool.java
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- a/jaxp/src/com/sun/org/apache/bcel/internal/classfile/ConstantPool.jav=
a
++++ b/jaxp/src/com/sun/org/apache/bcel/internal/classfile/ConstantPool.jav=
a
+@@ -1,6 +1,5 @@
+ /*
+- * reserved comment block
+- * DO NOT REMOVE OR ALTER!
++ * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
+  */
+ package com.sun.org.apache.bcel.internal.classfile;
+
+@@ -59,6 +58,7 @@ package com.sun.org.apache.bcel.internal
+  */
+
+ import  com.sun.org.apache.bcel.internal.Constants;
++import  com.sun.org.apache.bcel.internal.generic.ConstantPoolGen;
+ import  java.io.*;
+
+ /**
+@@ -72,6 +72,7 @@ import  java.io.*;
+  * @see     Constant
+  * @see     com.sun.org.apache.bcel.internal.generic.ConstantPoolGen
+  * @author <A HREF=3D"mailto:markus.dahm@berlin.de">M. Dahm</A>
++ * @LastModified: May 2022
+  */
+ public class ConstantPool implements Cloneable, Node, Serializable {
+   private int        constant_pool_count;
+@@ -226,9 +227,16 @@ public class ConstantPool implements Clo
+    */
+   public void dump(DataOutputStream file) throws IOException
+   {
+-    file.writeShort(constant_pool_count);
++    /*
++     * Constants over the size of the constant pool shall not be written =
out.
++     * This is a redundant measure as the ConstantPoolGen should have alr=
eady
++     * reported an error back in the situation.
++     */
++    int size =3D constant_pool_count < ConstantPoolGen.CONSTANT_POOL_SIZE=
 - 1 ?
++               constant_pool_count : ConstantPoolGen.CONSTANT_POOL_SIZE -=
 1;
+
+-    for(int i=3D1; i < constant_pool_count; i++)
++    file.writeShort(size);
++    for(int i=3D1; i < size; i++)
+       if(constant_pool[i] !=3D null)
+         constant_pool[i].dump(file);
+   }
+Index: openjdk/jaxp/src/com/sun/org/apache/bcel/internal/generic/ConstantP=
oolGen.java
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- a/jaxp/src/com/sun/org/apache/bcel/internal/generic/ConstantPoolGen.ja=
va
++++ b/jaxp/src/com/sun/org/apache/bcel/internal/generic/ConstantPoolGen.ja=
va
+@@ -1,6 +1,5 @@
+ /*
+- * reserved comment block
+- * DO NOT REMOVE OR ALTER!
++ * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
+  */
+ package com.sun.org.apache.bcel.internal.generic;
+
+@@ -74,8 +73,10 @@ import java.util.HashMap;
+  *
+  * @author  <A HREF=3D"mailto:markus.dahm@berlin.de">M. Dahm</A>
+  * @see Constant
++ * @LastModified: May 2022
+  */
+ public class ConstantPoolGen implements java.io.Serializable {
++  public static final int CONSTANT_POOL_SIZE =3D 65536;
+   protected int        size      =3D 1024; // Inital size, sufficient in =
most cases
+   protected Constant[] constants =3D new Constant[size];
+   protected int        index     =3D 1; // First entry (0) used by JVM
+@@ -97,7 +98,7 @@ public class ConstantPoolGen implements
+    */
+   public ConstantPoolGen(Constant[] cs) {
+     if(cs.length > size) {
+-      size      =3D cs.length;
++      size      =3D Math.min(cs.length, CONSTANT_POOL_SIZE);
+       constants =3D new Constant[size];
+     }
+
+@@ -170,10 +171,19 @@ public class ConstantPoolGen implements
+   /** Resize internal array of constants.
+    */
+   protected void adjustSize() {
++    // 3 extra spaces are needed as some entries may take 3 slots
++    if (index + 3 >=3D CONSTANT_POOL_SIZE) {
++      throw new RuntimeException("The number of constants " + (index + 3)=
 +
++                                 " is over the size of the constant pool:=
 " +
++                                 (CONSTANT_POOL_SIZE - 1));
++    }
++
+     if(index + 3 >=3D size) {
+       Constant[] cs =3D constants;
+
+       size      *=3D 2;
++      // the constant array shall not exceed the size of the constant poo=
l
++      size       =3D Math.min(size, CONSTANT_POOL_SIZE);
+       constants  =3D new Constant[size];
+       System.arraycopy(cs, 0, constants, 0, index);
+     }
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

