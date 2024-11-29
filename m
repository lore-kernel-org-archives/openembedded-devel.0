Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 902B9D70E05
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 02:17:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.107719.1732846630441148189
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Nov 2024 18:17:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2063e108b4=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AT2Dq4p016740
	for <openembedded-devel@lists.openembedded.org>; Thu, 28 Nov 2024 18:17:10 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 436719sk65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 28 Nov 2024 18:17:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=spUmw2KAbB4tfEJ75Y2KHaKloSOl9kk3Uf44ykeR57UDM1vIGikAWNFrpd4QnErqPS0Hf63fOUshFeoWwPPGKwF6/RYHZpZ7aUrEvx5kcLt5kP4zDDCzG/Elb1DorysARLuaHLN2LjFZUvk5L/DQXFUToPe5bpeNbdF6xzE+M+PLxGK+3HjytLreOvDdI3ghikVuD976+geZ7u9BJWzXBCS5+G06g5r+RYXYgjcpcnILrzav0Baulb5QG+Drm8hh89R7B5Xt7kq7ZL66g+DMbxqcIrrlSEJC56dgIAKGP8tR7gnb2KIJFnDNlCkAe4ucg0u1f+SqoCxUsZUN5M//VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJnOekoeMta2H+Jvjl9ArMKyeoIuQ2ZmKGTrV0fS9ds=;
 b=UiYnx9TF9kcxPkcgxBbMitB5l9BHIfk7s3GOV+3tUf9AcVF9kif4BNR2QDubhXZpwM9mUDBMhMDxH7BnZuu+qQzZBbD4g75vZjYN7Ml/pVbGDHs8GH3TCG+eok+wkr616e19PyCheGZC+kITr+3ANCM8zMovUkcCIKA2jCA7hndLb3bUjg09v06Qqo0P1eRYjg0NNbBBRgwP4VuVA0iFUsbTFtG2soKopDU8yHHh5pf6XgVZlNwkP13QIbYW7mtgd57Ujp0e+F3LctAIoC0dzN9bEcoMIN2mw83k+WzX6BdcG33RKd1EHDnrp+GgnJDV1uyBDQx+EtqoE/rs5i4APg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB5901.namprd11.prod.outlook.com (2603:10b6:510:143::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Fri, 29 Nov
 2024 02:17:04 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8207.014; Fri, 29 Nov 2024
 02:17:04 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][scarthgap][PATCH] protobuf: fix CVE-2024-7254
Date: Thu, 28 Nov 2024 18:16:53 -0800
Message-Id: <20241129021653.1031027-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0005.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB5901:EE_
X-MS-Office365-Filtering-Correlation-Id: de07708e-2955-4a25-be4a-08dd101bea50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rPtkOM/PPiqF7+5LuRanD7ulBjuUNZMveKyTIHcYdHCJuvVEAno2kgzm34J4?=
 =?us-ascii?Q?xnpRU6H+sy4zunlt3SrA0QCavfhtJHHgnz3BPkQZMJg/atkulE5Taa2TdX2b?=
 =?us-ascii?Q?A8v+Rf/F0i+V2ExmsPIUgLJm2cVLaUcVBOz1wD9aJms6BbNQkGSoWVAqBgxi?=
 =?us-ascii?Q?cn5Gz0dK1XSvuZ0WR3mx+l/q+mj6c3gEKOS4W+/yI4v/Ocq+OZWiveRCooar?=
 =?us-ascii?Q?DZ3vupsDWOa7Rvj2ilBAER1VC9Jlb09NzvUfdX7bUuGRUyeLJ80eQcnTt3fE?=
 =?us-ascii?Q?4T52Mp/hpEu+CgnVi4dG1K//JpSgmmjQu4Adb+BgygBeIwxOEoBEmAiJM6n7?=
 =?us-ascii?Q?iFT5cgCPpjb8Ci8ivgnqtyssX/hV4oc2dtxEHJ+wzC/f8EOoJ7QHjRmgn+DT?=
 =?us-ascii?Q?hp5U2KBnXOYxQpyq5dOyLXcF2YvqGpIdUi08ORrjkxYw44//svS+Y6+Rsc+V?=
 =?us-ascii?Q?EUdEE1R4pdw5Y4N/Wj9kfRUCnFXHoCwUzuHDNolaajQ9oZPY9DxFiDa0jTPH?=
 =?us-ascii?Q?IDRsZ7gYNv+xhSlYfQGpO8ieHSafJJcNd0jMxLq+D5ROrPYtNhtqSM7Onnf1?=
 =?us-ascii?Q?X3hPXLSOJwt1A2Fd+X6tRckox/9FExb0ZUc4ye4+sLwbZkfQJWZRUOIxE57e?=
 =?us-ascii?Q?/c7MG7WZReqxmU2sf+h2/mRFfpRvwskeDqyoCCb//9fA/1B0Ugg/ry83a8Ps?=
 =?us-ascii?Q?hynsggOR8rYCxQaRxN2d7xa0JalkR4od5N5UrOCfHDWFQBw8RRk35W4NhDk2?=
 =?us-ascii?Q?q6OLWqDYeSeFC+nWBwbYw8EpruFO1fbfINmMe2MssM+N87HMdm8GFvtxRbor?=
 =?us-ascii?Q?aXCKe4f6YeI2WCPpICEZeC+l1VJdFeKQ55r0SqRBntooYnG2qTaAyAbI4Zu8?=
 =?us-ascii?Q?klzetij4Upjp+TYFwpKqTTaaSfBFgdogSEFu/8Gcy+qJp3CtKWkW7rpMalz0?=
 =?us-ascii?Q?hh+d+JnAKB9AmlXLke4S295qsdRASPo0dl7KFMaU+LNFqFHdqwbVumh84wzz?=
 =?us-ascii?Q?EG6QxaVDoMBxry3dJVo640VUSdcxflBQECJs9qDXVqXLfwmruDeDae0oIDf8?=
 =?us-ascii?Q?jBZoK42i48l7OOHMllR8HDQqVIZZhsuzdVBkE+Q9tJl1sE3tA3OQJhEBeLcq?=
 =?us-ascii?Q?T69i7AHOCEFZVClBWsSQ7Mf6OsdXUVRMukNphBbrVFKtIDvK5yvNYgRYN5FU?=
 =?us-ascii?Q?BVmtb35QhZdqpAz1uVkzo9q4YiO2HG+o1u5pUNgjw+sFExg0yJctKVUU4l6x?=
 =?us-ascii?Q?GuJ0uZhwQA0F4gZF7HYpzjCN5OXSszMrJwYF3J61SlbPiZj/1eRjzYssnuqW?=
 =?us-ascii?Q?IoaY07orGSsgIptTpDT/sGMi8c1/9lpmt8u6K+tYCuTmRBJxXSOwjEK8SO+B?=
 =?us-ascii?Q?T9sISNTE+OW0g+NpCEoFd2Mf0WybllIAfnc55b0OkwiB0ubidw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AuQlF/PT0bKKPwVdLawpBHELeIofvr44ZyOF8M07huiTgIVLAwx4YH2m5WfI?=
 =?us-ascii?Q?aEl4Rv7K3tCfYaYF/mHSzyh6NTL5FhzweDCS5wO0yAhCSNbVKWUqAl+OfXxm?=
 =?us-ascii?Q?+Fi2fJ3LTQP32MYoLX6/OH8ugMh0yRrsQJjC2wDRu0jPaEze0+NKicui2D6V?=
 =?us-ascii?Q?MM3Y7SHLzog+MyXYE7O8pANZtrUz3cEo/l95c/m2j2G3aexcqEq9/DTxVUyS?=
 =?us-ascii?Q?bTkYUU7wj4gk9GwjyBIK+s1MSYB8TuknivqlsL8TKIimD0M0lI85ZmBfzcty?=
 =?us-ascii?Q?4YdLFkfXFNfrgmYfaRGoyBiIiC6CphstbMn16+11x2XgBDfwxQgnxrz9/l8/?=
 =?us-ascii?Q?9B2S/RD3kwMG3Ji9toaLZE+2PvPaJtbZEvwbPEhQ8YbxWpJCqsc4Z65ty5Kh?=
 =?us-ascii?Q?8OkPYCbt3+5rgNP5jOKOWkjBh5ivvWeaUO90v3prlJenmqF0Gug2lo9F24tA?=
 =?us-ascii?Q?JkPXXm4L2py+jfQqa5mUAZI/WRWgsUw7slNp9eSjLGqT3LEyTicOuhGclAjU?=
 =?us-ascii?Q?OxvVsq8F7jD34On0ybg2vHfv70I13q6shtcsLF0SYPhs1HV337m4ZBY5RuMe?=
 =?us-ascii?Q?7GQWXqg57uTTL1gEoiI4gOehIwSELsnNtlBrRI5d0PEksE1XP9/Jzf4c4rDy?=
 =?us-ascii?Q?NR6MSTWb3t4Fntf6y/e/72BCulhTBJ9CsEE1bxNhcaB8x/J6SKNctOvfxeYB?=
 =?us-ascii?Q?m5dIcxrcIco+OANOitzhgTv0m6YU3jBIH4N3dPXOcjZn//U77qI49dLM1MYP?=
 =?us-ascii?Q?qT/6LCQs2P5nhfB2VcGDTVLXwOW+UdU7Xzyq9g8+jlLfWtGHEWPz5TFQYnzo?=
 =?us-ascii?Q?QrCC83EICM6ivLnt19UshhsN63UCbQztxOkCPxiZUFF41bBBg61AVNrKYJ8p?=
 =?us-ascii?Q?SxuzJF3YiaQ3m5d0tnE/t616k7f1x281AadLXWsGPCxmD+2w3lsL5O4jBDhj?=
 =?us-ascii?Q?VYm631iduVVykVtt7EOrA7kRdr0CAqIKzceBRAfp9CygO7yrJZaiqDIn2kpt?=
 =?us-ascii?Q?aKocAnQExEHo/9Ez6Ikk5XzFuOwEYrPmLuWIydwQZyapJJplPPBqspwYxe5+?=
 =?us-ascii?Q?CyMS+BkN/3NXh29rrp9zZ433lMhAisfVh3VQHpOeymaB4gm8lftDB1nSYl1c?=
 =?us-ascii?Q?+oL7kIHCN46GBMyFFWNC9tXcq6qnCrNyiak8Eu+hhx0XBVexKLWvqdayg8YD?=
 =?us-ascii?Q?8XF8afET8GUioYFj8PNGrRI9J84UtF/eVvi8MYtPlKMLn+nVtO5eCE9rGzdo?=
 =?us-ascii?Q?cu9l6YcujJMG5jwJa+mLPi/kn1SB5DacdwDyfjqZXuU75VaGqoTqMo2wUWHI?=
 =?us-ascii?Q?5tvlVIDrPgfPDbtgEUGvgvM8gs7XZP4ecs97uz6TQ7LXVp2/5Tefs30BHw37?=
 =?us-ascii?Q?qAHzP9DxuTCoDuJLjctLkP9E0aLAvTTwYY/Mpm0/b+j4SU5V9c0/gtzYkCDF?=
 =?us-ascii?Q?VQ4eps8LsSbLFCof2GBEiQCwZ0jpAVVlrx1XvMkWaGhzOaLm4FwDi2ehQ4RZ?=
 =?us-ascii?Q?KpKYYKp8dlvWwUyNKLbWCX9iHeEtn2nVApeL2KcGNgn6xIoCDId7LLoqIIf8?=
 =?us-ascii?Q?PtGFVjC6tU+PXzzyPAUmyy0SHD9HmVUDLB4zNg1rHsQm707V4jA07BYjRZCn?=
 =?us-ascii?Q?iQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de07708e-2955-4a25-be4a-08dd101bea50
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 02:17:03.9314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXtlAJr6psKjRW0v16T6PiIsC29pfct/eLPcBB7MntZgmT8oqjZwm1mMK4bd6hlxuWrgz1ZUWfCZDATAiCcBVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5901
X-Proofpoint-ORIG-GUID: UDLV7-xlZDPnfrdD5aQ0N1e6g_H7e8CK
X-Proofpoint-GUID: UDLV7-xlZDPnfrdD5aQ0N1e6g_H7e8CK
X-Authority-Analysis: v=2.4 cv=Z/8WHGRA c=1 sm=1 tr=0 ts=67492425 cx=c_pps a=IYePPuTyj3qIg1BHBNk0GA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=1XWaLZrsAAAA:8 a=NEAV23lmAAAA:8 a=iSMWkEdzpDzXCqh2uD4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-29_01,2024-11-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2411290017
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Nov 2024 02:17:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114112

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch with adjustments for the current version to fix
CVE-2024-7254.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...eck-when-parsing-unknown-fields-in-J.patch | 794 ++++++++++++++++++
 .../protobuf/protobuf_4.25.3.bb               |   1 +
 2 files changed, 795 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-Add-recursion-check-when-parsing-unknown-fields-in-J.patch

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Add-recursion-check-when-parsing-unknown-fields-in-J.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Add-recursion-check-when-parsing-unknown-fields-in-J.patch
new file mode 100644
index 000000000..2f14620b4
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Add-recursion-check-when-parsing-unknown-fields-in-J.patch
@@ -0,0 +1,794 @@
+From 9f182ae260cc60e8cc5417abbe9481821642afa0 Mon Sep 17 00:00:00 2001
+From: Protobuf Team Bot <protobuf-github-bot@google.com>
+Date: Tue, 17 Sep 2024 12:03:36 -0700
+Subject: [PATCH] Add recursion check when parsing unknown fields in Java.
+
+PiperOrigin-RevId: 675657198
+
+CVE: CVE-2024-7254
+
+Upstream-Status: Backport [ac9fb5b4c71b0dd80985b27684e265d1f03abf46]
+
+The original patch is adjusted to fit for the current version.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ .../com/google/protobuf/ArrayDecoders.java    |  28 +++
+ .../com/google/protobuf/CodedInputStream.java |  72 +++++-
+ .../com/google/protobuf/MessageSchema.java    |   9 +-
+ .../com/google/protobuf/MessageSetSchema.java |   2 +-
+ .../google/protobuf/UnknownFieldSchema.java   |  28 ++-
+ .../google/protobuf/CodedInputStreamTest.java | 159 ++++++++++++
+ .../java/com/google/protobuf/LiteTest.java    | 232 ++++++++++++++++++
+ 7 files changed, 514 insertions(+), 16 deletions(-)
+
+diff --git a/java/core/src/main/java/com/google/protobuf/ArrayDecoders.java b/java/core/src/main/java/com/google/protobuf/ArrayDecoders.java
+index f3241de50..0f3d7de0d 100644
+--- a/java/core/src/main/java/com/google/protobuf/ArrayDecoders.java
++++ b/java/core/src/main/java/com/google/protobuf/ArrayDecoders.java
+@@ -26,6 +26,10 @@ final class ArrayDecoders {
+ 
+   private ArrayDecoders() {
+   }
++  static final int DEFAULT_RECURSION_LIMIT = 100;
++
++  @SuppressWarnings("NonFinalStaticField")
++  private static volatile int recursionLimit = DEFAULT_RECURSION_LIMIT;
+ 
+   /**
+    * A helper used to return multiple values in a Java function. Java doesn't natively support
+@@ -38,6 +42,7 @@ final class ArrayDecoders {
+     public long long1;
+     public Object object1;
+     public final ExtensionRegistryLite extensionRegistry;
++    public int recursionDepth;
+ 
+     Registers() {
+       this.extensionRegistry = ExtensionRegistryLite.getEmptyRegistry();
+@@ -245,7 +250,10 @@ final class ArrayDecoders {
+     if (length < 0 || length > limit - position) {
+       throw InvalidProtocolBufferException.truncatedMessage();
+     }
++    registers.recursionDepth++;
++    checkRecursionLimit(registers.recursionDepth);
+     schema.mergeFrom(msg, data, position, position + length, registers);
++    registers.recursionDepth--;
+     registers.object1 = msg;
+     return position + length;
+   }
+@@ -263,8 +271,11 @@ final class ArrayDecoders {
+     // A group field must has a MessageSchema (the only other subclass of Schema is MessageSetSchema
+     // and it can't be used in group fields).
+     final MessageSchema messageSchema = (MessageSchema) schema;
++    registers.recursionDepth++;
++    checkRecursionLimit(registers.recursionDepth);
+     final int endPosition =
+         messageSchema.parseMessage(msg, data, position, limit, endGroup, registers);
++    registers.recursionDepth--;
+     registers.object1 = msg;
+     return endPosition;
+   }
+@@ -1025,6 +1036,8 @@ final class ArrayDecoders {
+         final UnknownFieldSetLite child = UnknownFieldSetLite.newInstance();
+         final int endGroup = (tag & ~0x7) | WireFormat.WIRETYPE_END_GROUP;
+         int lastTag = 0;
++        registers.recursionDepth++;
++        checkRecursionLimit(registers.recursionDepth);
+         while (position < limit) {
+           position = decodeVarint32(data, position, registers);
+           lastTag = registers.int1;
+@@ -1033,6 +1046,7 @@ final class ArrayDecoders {
+           }
+           position = decodeUnknownField(lastTag, data, position, limit, child, registers);
+         }
++        registers.recursionDepth--;
+         if (position > limit || lastTag != endGroup) {
+           throw InvalidProtocolBufferException.parseFailure();
+         }
+@@ -1079,4 +1093,18 @@ final class ArrayDecoders {
+         throw InvalidProtocolBufferException.invalidTag();
+     }
+   }
++
++  /**
++   * Set the maximum recursion limit that ArrayDecoders will allow. An exception will be thrown if
++   * the depth of the message exceeds this limit.
++   */
++  public static void setRecursionLimit(int limit) {
++    recursionLimit = limit;
++  }
++
++  private static void checkRecursionLimit(int depth) throws InvalidProtocolBufferException {
++    if (depth >= recursionLimit) {
++      throw InvalidProtocolBufferException.recursionLimitExceeded();
++    }
++  }
+ }
+diff --git a/java/core/src/main/java/com/google/protobuf/CodedInputStream.java b/java/core/src/main/java/com/google/protobuf/CodedInputStream.java
+index 8f1ac736d..29256b4b3 100644
+--- a/java/core/src/main/java/com/google/protobuf/CodedInputStream.java
++++ b/java/core/src/main/java/com/google/protobuf/CodedInputStream.java
+@@ -703,7 +703,14 @@ public abstract class CodedInputStream {
+     public void skipMessage() throws IOException {
+       while (true) {
+         final int tag = readTag();
+-        if (tag == 0 || !skipField(tag)) {
++	if (tag == 0) {
++	    return;
++	}
++	checkRecursionLimit();
++	++recursionDepth;
++	boolean fieldSkipped = skipField(tag);
++	--recursionDepth;
++        if (!fieldSkipped) {
+           return;
+         }
+       }
+@@ -713,7 +720,14 @@ public abstract class CodedInputStream {
+     public void skipMessage(CodedOutputStream output) throws IOException {
+       while (true) {
+         final int tag = readTag();
+-        if (tag == 0 || !skipField(tag, output)) {
++	if (tag == 0) {
++	    return;
++	}
++	checkRecursionLimit();
++	++recursionDepth;
++	boolean fieldSkipped = skipField(tag, output);
++	--recursionDepth;
++        if (!fieldSkipped) {
+           return;
+         }
+       }
+@@ -1415,7 +1429,14 @@ public abstract class CodedInputStream {
+     public void skipMessage() throws IOException {
+       while (true) {
+         final int tag = readTag();
+-        if (tag == 0 || !skipField(tag)) {
++	if (tag == 0) {
++	    return;
++	}
++	checkRecursionLimit();
++	++recursionDepth;
++	boolean fieldSkipped = skipField(tag);
++	--recursionDepth;
++        if (!fieldSkipped) {
+           return;
+         }
+       }
+@@ -1425,7 +1446,14 @@ public abstract class CodedInputStream {
+     public void skipMessage(CodedOutputStream output) throws IOException {
+       while (true) {
+         final int tag = readTag();
+-        if (tag == 0 || !skipField(tag, output)) {
++	if (tag == 0) {
++	    return;
++	}
++	checkRecursionLimit();
++	++recursionDepth;
++	boolean fieldSkipped = skipField(tag, output);
++	--recursionDepth;
++        if (!fieldSkipped) {
+           return;
+         }
+       }
+@@ -2180,7 +2208,14 @@ public abstract class CodedInputStream {
+     public void skipMessage() throws IOException {
+       while (true) {
+         final int tag = readTag();
+-        if (tag == 0 || !skipField(tag)) {
++	if (tag == 0) {
++	    return;
++	}
++	checkRecursionLimit();
++	++recursionDepth;
++	boolean fieldSkipped = skipField(tag);
++	--recursionDepth;
++        if (!fieldSkipped) {
+           return;
+         }
+       }
+@@ -2190,7 +2225,14 @@ public abstract class CodedInputStream {
+     public void skipMessage(CodedOutputStream output) throws IOException {
+       while (true) {
+         final int tag = readTag();
+-        if (tag == 0 || !skipField(tag, output)) {
++	if (tag == 0) {
++	    return;
++	}
++	checkRecursionLimit();
++	++recursionDepth;
++	boolean fieldSkipped = skipField(tag, output);
++	--recursionDepth;
++        if (!fieldSkipped) {
+           return;
+         }
+       }
+@@ -3298,7 +3340,14 @@ public abstract class CodedInputStream {
+     public void skipMessage() throws IOException {
+       while (true) {
+         final int tag = readTag();
+-        if (tag == 0 || !skipField(tag)) {
++	if (tag == 0) {
++	    return;
++	}
++	checkRecursionLimit();
++	++recursionDepth;
++	boolean fieldSkipped = skipField(tag);
++	--recursionDepth;
++        if (!fieldSkipped) {
+           return;
+         }
+       }
+@@ -3308,7 +3357,14 @@ public abstract class CodedInputStream {
+     public void skipMessage(CodedOutputStream output) throws IOException {
+       while (true) {
+         final int tag = readTag();
+-        if (tag == 0 || !skipField(tag, output)) {
++	if (tag == 0) {
++	    return;
++	}
++	checkRecursionLimit();
++	++recursionDepth;
++	boolean fieldSkipped = skipField(tag, output);
++	--recursionDepth;
++        if (!fieldSkipped) {
+           return;
+         }
+       }
+diff --git a/java/core/src/main/java/com/google/protobuf/MessageSchema.java b/java/core/src/main/java/com/google/protobuf/MessageSchema.java
+index de3890f70..5ad6762b0 100644
+--- a/java/core/src/main/java/com/google/protobuf/MessageSchema.java
++++ b/java/core/src/main/java/com/google/protobuf/MessageSchema.java
+@@ -3006,7 +3006,8 @@ final class MessageSchema<T> implements Schema<T> {
+               unknownFields = unknownFieldSchema.getBuilderFromMessage(message);
+             }
+             // Unknown field.
+-            if (unknownFieldSchema.mergeOneFieldFrom(unknownFields, reader)) {
++            if (unknownFieldSchema.mergeOneFieldFrom(
++                unknownFields, reader, /* currentDepth= */ 0)) {
+               continue;
+             }
+           }
+@@ -3381,7 +3382,8 @@ final class MessageSchema<T> implements Schema<T> {
+               if (unknownFields == null) {
+                 unknownFields = unknownFieldSchema.getBuilderFromMessage(message);
+               }
+-              if (!unknownFieldSchema.mergeOneFieldFrom(unknownFields, reader)) {
++              if (!unknownFieldSchema.mergeOneFieldFrom(
++                  unknownFields, reader, /* currentDepth= */ 0)) {
+                 return;
+               }
+               break;
+@@ -3397,7 +3399,8 @@ final class MessageSchema<T> implements Schema<T> {
+             if (unknownFields == null) {
+               unknownFields = unknownFieldSchema.getBuilderFromMessage(message);
+             }
+-            if (!unknownFieldSchema.mergeOneFieldFrom(unknownFields, reader)) {
++            if (!unknownFieldSchema.mergeOneFieldFrom(
++                unknownFields, reader, /* currentDepth= */ 0)) {
+               return;
+             }
+           }
+diff --git a/java/core/src/main/java/com/google/protobuf/MessageSetSchema.java b/java/core/src/main/java/com/google/protobuf/MessageSetSchema.java
+index eec3acd35..ec37d41f9 100644
+--- a/java/core/src/main/java/com/google/protobuf/MessageSetSchema.java
++++ b/java/core/src/main/java/com/google/protobuf/MessageSetSchema.java
+@@ -278,7 +278,7 @@ final class MessageSetSchema<T> implements Schema<T> {
+               reader, extension, extensionRegistry, extensions);
+           return true;
+         } else {
+-          return unknownFieldSchema.mergeOneFieldFrom(unknownFields, reader);
++          return unknownFieldSchema.mergeOneFieldFrom(unknownFields, reader, /* currentDepth= */ 0);
+         }
+       } else {
+         return reader.skipField();
+diff --git a/java/core/src/main/java/com/google/protobuf/UnknownFieldSchema.java b/java/core/src/main/java/com/google/protobuf/UnknownFieldSchema.java
+index c4ec645bf..0cdecd30e 100644
+--- a/java/core/src/main/java/com/google/protobuf/UnknownFieldSchema.java
++++ b/java/core/src/main/java/com/google/protobuf/UnknownFieldSchema.java
+@@ -13,6 +13,11 @@ import java.io.IOException;
+ @CheckReturnValue
+ abstract class UnknownFieldSchema<T, B> {
+ 
++  static final int DEFAULT_RECURSION_LIMIT = 100;
++
++  @SuppressWarnings("NonFinalStaticField")
++  private static volatile int recursionLimit = DEFAULT_RECURSION_LIMIT;
++
+   /** Whether unknown fields should be dropped. */
+   abstract boolean shouldDiscardUnknownFields(Reader reader);
+ 
+@@ -56,7 +61,8 @@ abstract class UnknownFieldSchema<T, B> {
+   abstract void makeImmutable(Object message);
+ 
+   /** Merges one field into the unknown fields. */
+-  final boolean mergeOneFieldFrom(B unknownFields, Reader reader) throws IOException {
++  final boolean mergeOneFieldFrom(B unknownFields, Reader reader, int currentDepth)
++      throws IOException {
+     int tag = reader.getTag();
+     int fieldNumber = WireFormat.getTagFieldNumber(tag);
+     switch (WireFormat.getTagWireType(tag)) {
+@@ -75,7 +81,12 @@ abstract class UnknownFieldSchema<T, B> {
+       case WireFormat.WIRETYPE_START_GROUP:
+         final B subFields = newBuilder();
+         int endGroupTag = WireFormat.makeTag(fieldNumber, WireFormat.WIRETYPE_END_GROUP);
+-        mergeFrom(subFields, reader);
++        currentDepth++;
++        if (currentDepth >= recursionLimit) {
++          throw InvalidProtocolBufferException.recursionLimitExceeded();
++        }
++        mergeFrom(subFields, reader, currentDepth);
++        currentDepth--;
+         if (endGroupTag != reader.getTag()) {
+           throw InvalidProtocolBufferException.invalidEndTag();
+         }
+@@ -88,10 +99,11 @@ abstract class UnknownFieldSchema<T, B> {
+     }
+   }
+ 
+-  final void mergeFrom(B unknownFields, Reader reader) throws IOException {
++  final void mergeFrom(B unknownFields, Reader reader, int currentDepth)
++      throws IOException {
+     while (true) {
+       if (reader.getFieldNumber() == Reader.READ_DONE
+-          || !mergeOneFieldFrom(unknownFields, reader)) {
++          || !mergeOneFieldFrom(unknownFields, reader, currentDepth)) {
+         break;
+       }
+     }
+@@ -108,4 +120,12 @@ abstract class UnknownFieldSchema<T, B> {
+   abstract int getSerializedSizeAsMessageSet(T message);
+ 
+   abstract int getSerializedSize(T unknowns);
++
++  /**
++   * Set the maximum recursion limit that ArrayDecoders will allow. An exception will be thrown if
++   * the depth of the message exceeds this limit.
++   */
++  public void setRecursionLimit(int limit) {
++    recursionLimit = limit;
++  }
+ }
+diff --git a/java/core/src/test/java/com/google/protobuf/CodedInputStreamTest.java b/java/core/src/test/java/com/google/protobuf/CodedInputStreamTest.java
+index 2de3273e3..19a6b669d 100644
+--- a/java/core/src/test/java/com/google/protobuf/CodedInputStreamTest.java
++++ b/java/core/src/test/java/com/google/protobuf/CodedInputStreamTest.java
+@@ -10,6 +10,10 @@ package com.google.protobuf;
+ import static com.google.common.truth.Truth.assertThat;
+ import static com.google.common.truth.Truth.assertWithMessage;
+ import static org.junit.Assert.assertArrayEquals;
++import static org.junit.Assert.assertThrows;
++
++import com.google.common.primitives.Bytes;
++import map_test.MapTestProto.MapContainer;
+ import protobuf_unittest.UnittestProto.BoolMessage;
+ import protobuf_unittest.UnittestProto.Int32Message;
+ import protobuf_unittest.UnittestProto.Int64Message;
+@@ -34,6 +38,13 @@ public class CodedInputStreamTest {
+ 
+   private static final int DEFAULT_BLOCK_SIZE = 4096;
+ 
++  private static final int GROUP_TAP = WireFormat.makeTag(3, WireFormat.WIRETYPE_START_GROUP);
++
++  private static final byte[] NESTING_SGROUP = generateSGroupTags();
++
++  private static final byte[] NESTING_SGROUP_WITH_INITIAL_BYTES = generateSGroupTagsForMapField();
++
++
+   private enum InputType {
+     ARRAY {
+       @Override
+@@ -116,6 +127,17 @@ public class CodedInputStreamTest {
+     return bytes;
+   }
+ 
++  private static byte[] generateSGroupTags() {
++    byte[] bytes = new byte[100000];
++    Arrays.fill(bytes, (byte) GROUP_TAP);
++    return bytes;
++  }
++
++  private static byte[] generateSGroupTagsForMapField() {
++    byte[] initialBytes = {18, 1, 75, 26, (byte) 198, (byte) 154, 12};
++    return Bytes.concat(initialBytes, NESTING_SGROUP);
++  }
++
+   /**
+    * An InputStream which limits the number of bytes it reads at a time. We use this to make sure
+    * that CodedInputStream doesn't screw up when reading in small blocks.
+@@ -659,6 +681,143 @@ public class CodedInputStreamTest {
+     }
+   }
+ 
++  @Test
++  public void testMaliciousRecursion_unknownFields() throws Exception {
++    Throwable thrown =
++        assertThrows(
++            InvalidProtocolBufferException.class,
++            () -> TestRecursiveMessage.parseFrom(NESTING_SGROUP));
++
++    assertThat(thrown).hasMessageThat().contains("Protocol message had too many levels of nesting");
++  }
++
++  @Test
++  public void testMaliciousRecursion_skippingUnknownField() throws Exception {
++    Throwable thrown =
++        assertThrows(
++            InvalidProtocolBufferException.class,
++            () ->
++                DiscardUnknownFieldsParser.wrap(TestRecursiveMessage.parser())
++                    .parseFrom(NESTING_SGROUP));
++
++    assertThat(thrown).hasMessageThat().contains("Protocol message had too many levels of nesting");
++  }
++
++  @Test
++  public void testMaliciousSGroupTagsWithMapField_fromInputStream() throws Exception {
++    Throwable parseFromThrown =
++        assertThrows(
++            InvalidProtocolBufferException.class,
++            () ->
++                MapContainer.parseFrom(
++                    new ByteArrayInputStream(NESTING_SGROUP_WITH_INITIAL_BYTES)));
++    Throwable mergeFromThrown =
++        assertThrows(
++            InvalidProtocolBufferException.class,
++            () ->
++                MapContainer.newBuilder()
++                    .mergeFrom(new ByteArrayInputStream(NESTING_SGROUP_WITH_INITIAL_BYTES)));
++
++    assertThat(parseFromThrown)
++        .hasMessageThat()
++        .contains("Protocol message had too many levels of nesting");
++    assertThat(mergeFromThrown)
++        .hasMessageThat()
++        .contains("Protocol message had too many levels of nesting");
++  }
++
++  @Test
++  public void testMaliciousSGroupTags_inputStream_skipMessage() throws Exception {
++    ByteArrayInputStream inputSteam = new ByteArrayInputStream(NESTING_SGROUP);
++    CodedInputStream input = CodedInputStream.newInstance(inputSteam);
++    CodedOutputStream output = CodedOutputStream.newInstance(new byte[NESTING_SGROUP.length]);
++
++    Throwable thrown = assertThrows(InvalidProtocolBufferException.class, input::skipMessage);
++    Throwable thrown2 =
++        assertThrows(InvalidProtocolBufferException.class, () -> input.skipMessage(output));
++
++    assertThat(thrown).hasMessageThat().contains("Protocol message had too many levels of nesting");
++    assertThat(thrown2)
++        .hasMessageThat()
++        .contains("Protocol message had too many levels of nesting");
++  }
++
++  @Test
++  public void testMaliciousSGroupTagsWithMapField_fromByteArray() throws Exception {
++    Throwable parseFromThrown =
++        assertThrows(
++            InvalidProtocolBufferException.class,
++            () -> MapContainer.parseFrom(NESTING_SGROUP_WITH_INITIAL_BYTES));
++    Throwable mergeFromThrown =
++        assertThrows(
++            InvalidProtocolBufferException.class,
++            () -> MapContainer.newBuilder().mergeFrom(NESTING_SGROUP_WITH_INITIAL_BYTES));
++
++    assertThat(parseFromThrown)
++        .hasMessageThat()
++        .contains("the input ended unexpectedly in the middle of a field");
++    assertThat(mergeFromThrown)
++        .hasMessageThat()
++        .contains("the input ended unexpectedly in the middle of a field");
++  }
++
++  @Test
++  public void testMaliciousSGroupTags_arrayDecoder_skipMessage() throws Exception {
++    CodedInputStream input = CodedInputStream.newInstance(NESTING_SGROUP);
++    CodedOutputStream output = CodedOutputStream.newInstance(new byte[NESTING_SGROUP.length]);
++
++    Throwable thrown = assertThrows(InvalidProtocolBufferException.class, input::skipMessage);
++    Throwable thrown2 =
++        assertThrows(InvalidProtocolBufferException.class, () -> input.skipMessage(output));
++
++    assertThat(thrown).hasMessageThat().contains("Protocol message had too many levels of nesting");
++    assertThat(thrown2)
++        .hasMessageThat()
++        .contains("Protocol message had too many levels of nesting");
++  }
++
++  @Test
++  public void testMaliciousSGroupTagsWithMapField_fromByteBuffer() throws Exception {
++    Throwable thrown =
++        assertThrows(
++            InvalidProtocolBufferException.class,
++            () -> MapContainer.parseFrom(ByteBuffer.wrap(NESTING_SGROUP_WITH_INITIAL_BYTES)));
++
++    assertThat(thrown)
++        .hasMessageThat()
++        .contains("the input ended unexpectedly in the middle of a field");
++  }
++
++  @Test
++  public void testMaliciousSGroupTags_byteBuffer_skipMessage() throws Exception {
++    CodedInputStream input = InputType.NIO_DIRECT.newDecoder(NESTING_SGROUP);
++    CodedOutputStream output = CodedOutputStream.newInstance(new byte[NESTING_SGROUP.length]);
++
++    Throwable thrown = assertThrows(InvalidProtocolBufferException.class, input::skipMessage);
++    Throwable thrown2 =
++        assertThrows(InvalidProtocolBufferException.class, () -> input.skipMessage(output));
++
++    assertThat(thrown).hasMessageThat().contains("Protocol message had too many levels of nesting");
++    assertThat(thrown2)
++        .hasMessageThat()
++        .contains("Protocol message had too many levels of nesting");
++  }
++
++  @Test
++  public void testMaliciousSGroupTags_iterableByteBuffer() throws Exception {
++    CodedInputStream input = InputType.ITER_DIRECT.newDecoder(NESTING_SGROUP);
++    CodedOutputStream output = CodedOutputStream.newInstance(new byte[NESTING_SGROUP.length]);
++
++    Throwable thrown = assertThrows(InvalidProtocolBufferException.class, input::skipMessage);
++    Throwable thrown2 =
++        assertThrows(InvalidProtocolBufferException.class, () -> input.skipMessage(output));
++
++    assertThat(thrown).hasMessageThat().contains("Protocol message had too many levels of nesting");
++    assertThat(thrown2)
++        .hasMessageThat()
++        .contains("Protocol message had too many levels of nesting");
++  }
++
+   private void checkSizeLimitExceeded(InvalidProtocolBufferException e) {
+     assertThat(e)
+         .hasMessageThat()
+diff --git a/java/lite/src/test/java/com/google/protobuf/LiteTest.java b/java/lite/src/test/java/com/google/protobuf/LiteTest.java
+index 754ed7d5f..81be90bfd 100644
+--- a/java/lite/src/test/java/com/google/protobuf/LiteTest.java
++++ b/java/lite/src/test/java/com/google/protobuf/LiteTest.java
+@@ -2459,6 +2459,211 @@ public class LiteTest {
+     }
+   }
+ 
++  @Test
++  public void testParseFromInputStream_concurrent_nestingUnknownGroups() throws Exception {
++    int numThreads = 200;
++    ArrayList<Thread> threads = new ArrayList<>();
++
++    ByteString byteString = generateNestingGroups(99);
++    AtomicBoolean thrown = new AtomicBoolean(false);
++
++    for (int i = 0; i < numThreads; i++) {
++      Thread thread =
++          new Thread(
++              () -> {
++                try {
++                  TestAllTypesLite unused = TestAllTypesLite.parseFrom(byteString);
++                } catch (IOException e) {
++                  if (e.getMessage().contains("Protocol message had too many levels of nesting")) {
++                    thrown.set(true);
++                  }
++                }
++              });
++      thread.start();
++      threads.add(thread);
++    }
++
++    for (Thread thread : threads) {
++      thread.join();
++    }
++
++    assertThat(thrown.get()).isFalse();
++  }
++
++  @Test
++  public void testParseFromInputStream_nestingUnknownGroups() throws IOException {
++    ByteString byteString = generateNestingGroups(99);
++
++    Throwable thrown =
++        assertThrows(
++            InvalidProtocolBufferException.class, () -> TestAllTypesLite.parseFrom(byteString));
++    assertThat(thrown)
++        .hasMessageThat()
++        .doesNotContain("Protocol message had too many levels of nesting");
++  }
++
++  @Test
++  public void testParseFromInputStream_nestingUnknownGroups_exception() throws IOException {
++    ByteString byteString = generateNestingGroups(100);
++
++    Throwable thrown =
++        assertThrows(
++            InvalidProtocolBufferException.class, () -> TestAllTypesLite.parseFrom(byteString));
++    assertThat(thrown).hasMessageThat().contains("Protocol message had too many levels of nesting");
++  }
++
++  @Test
++  public void testParseFromInputStream_setRecursionLimit_exception() throws IOException {
++    ByteString byteString = generateNestingGroups(199);
++    UnknownFieldSchema<?, ?> schema = SchemaUtil.unknownFieldSetLiteSchema();
++    schema.setRecursionLimit(200);
++
++    Throwable thrown =
++        assertThrows(
++            InvalidProtocolBufferException.class, () -> TestAllTypesLite.parseFrom(byteString));
++    assertThat(thrown)
++        .hasMessageThat()
++        .doesNotContain("Protocol message had too many levels of nesting");
++    schema.setRecursionLimit(UnknownFieldSchema.DEFAULT_RECURSION_LIMIT);
++  }
++
++  @Test
++  public void testParseFromBytes_concurrent_nestingUnknownGroups() throws Exception {
++    int numThreads = 200;
++    ArrayList<Thread> threads = new ArrayList<>();
++
++    ByteString byteString = generateNestingGroups(99);
++    AtomicBoolean thrown = new AtomicBoolean(false);
++
++    for (int i = 0; i < numThreads; i++) {
++      Thread thread =
++          new Thread(
++              () -> {
++                try {
++                  // Should pass in byte[] instead of ByteString to go into ArrayDecoders.
++                  TestAllTypesLite unused = TestAllTypesLite.parseFrom(byteString.toByteArray());
++                } catch (InvalidProtocolBufferException e) {
++                  if (e.getMessage().contains("Protocol message had too many levels of nesting")) {
++                    thrown.set(true);
++                  }
++                }
++              });
++      thread.start();
++      threads.add(thread);
++    }
++
++    for (Thread thread : threads) {
++      thread.join();
++    }
++
++    assertThat(thrown.get()).isFalse();
++  }
++
++  @Test
++  public void testParseFromBytes_nestingUnknownGroups() throws IOException {
++    ByteString byteString = generateNestingGroups(99);
++
++    Throwable thrown =
++        assertThrows(
++            InvalidProtocolBufferException.class,
++            () -> TestAllTypesLite.parseFrom(byteString.toByteArray()));
++    assertThat(thrown)
++        .hasMessageThat()
++        .doesNotContain("Protocol message had too many levels of nesting");
++  }
++
++  @Test
++  public void testParseFromBytes_nestingUnknownGroups_exception() throws IOException {
++    ByteString byteString = generateNestingGroups(100);
++
++    Throwable thrown =
++        assertThrows(
++            InvalidProtocolBufferException.class,
++            () -> TestAllTypesLite.parseFrom(byteString.toByteArray()));
++    assertThat(thrown).hasMessageThat().contains("Protocol message had too many levels of nesting");
++  }
++
++  @Test
++  public void testParseFromBytes_setRecursionLimit_exception() throws IOException {
++    ByteString byteString = generateNestingGroups(199);
++    ArrayDecoders.setRecursionLimit(200);
++
++    Throwable thrown =
++        assertThrows(
++            InvalidProtocolBufferException.class,
++            () -> TestAllTypesLite.parseFrom(byteString.toByteArray()));
++    assertThat(thrown)
++        .hasMessageThat()
++        .doesNotContain("Protocol message had too many levels of nesting");
++    ArrayDecoders.setRecursionLimit(ArrayDecoders.DEFAULT_RECURSION_LIMIT);
++  }
++
++  @Test
++  public void testParseFromBytes_recursiveMessages() throws Exception {
++    byte[] data99 = makeRecursiveMessage(99).toByteArray();
++    byte[] data100 = makeRecursiveMessage(100).toByteArray();
++
++    RecursiveMessage unused = RecursiveMessage.parseFrom(data99);
++    Throwable thrown =
++        assertThrows(
++            InvalidProtocolBufferException.class, () -> RecursiveMessage.parseFrom(data100));
++    assertThat(thrown).hasMessageThat().contains("Protocol message had too many levels of nesting");
++  }
++
++  @Test
++  public void testParseFromBytes_recursiveKnownGroups() throws Exception {
++    byte[] data99 = makeRecursiveGroup(99).toByteArray();
++    byte[] data100 = makeRecursiveGroup(100).toByteArray();
++
++    RecursiveGroup unused = RecursiveGroup.parseFrom(data99);
++    Throwable thrown =
++        assertThrows(InvalidProtocolBufferException.class, () -> RecursiveGroup.parseFrom(data100));
++    assertThat(thrown).hasMessageThat().contains("Protocol message had too many levels of nesting");
++  }
++
++  @Test
++  @SuppressWarnings("ProtoParseFromByteString")
++  public void testMaliciousSGroupTagsWithMapField_fromByteArray() throws Exception {
++    ByteString byteString = generateNestingGroups(102);
++
++    Throwable parseFromThrown =
++        assertThrows(
++            InvalidProtocolBufferException.class,
++            () -> MapContainer.parseFrom(byteString.toByteArray()));
++    Throwable mergeFromThrown =
++        assertThrows(
++            InvalidProtocolBufferException.class,
++            () -> MapContainer.newBuilder().mergeFrom(byteString.toByteArray()));
++
++    assertThat(parseFromThrown)
++        .hasMessageThat()
++        .contains("Protocol message had too many levels of nesting");
++    assertThat(mergeFromThrown)
++        .hasMessageThat()
++        .contains("Protocol message had too many levels of nesting");
++  }
++
++  @Test
++  public void testMaliciousSGroupTagsWithMapField_fromInputStream() throws Exception {
++    byte[] bytes = generateNestingGroups(101).toByteArray();
++
++    Throwable parseFromThrown =
++        assertThrows(
++            InvalidProtocolBufferException.class,
++            () -> MapContainer.parseFrom(new ByteArrayInputStream(bytes)));
++    Throwable mergeFromThrown =
++        assertThrows(
++            InvalidProtocolBufferException.class,
++            () -> MapContainer.newBuilder().mergeFrom(new ByteArrayInputStream(bytes)));
++
++    assertThat(parseFromThrown)
++        .hasMessageThat()
++        .contains("Protocol message had too many levels of nesting");
++    assertThat(mergeFromThrown)
++        .hasMessageThat()
++        .contains("Protocol message had too many levels of nesting");
++  }
++
+   @Test
+   public void testParseFromByteBuffer_extensions() throws Exception {
+     TestAllExtensionsLite message =
+@@ -2815,4 +3020,31 @@ public class LiteTest {
+     }
+     return false;
+   }
++
++  private static ByteString generateNestingGroups(int num) throws IOException {
++    int groupTap = WireFormat.makeTag(3, WireFormat.WIRETYPE_START_GROUP);
++    ByteString.Output byteStringOutput = ByteString.newOutput();
++    CodedOutputStream codedOutput = CodedOutputStream.newInstance(byteStringOutput);
++    for (int i = 0; i < num; i++) {
++      codedOutput.writeInt32NoTag(groupTap);
++    }
++    codedOutput.flush();
++    return byteStringOutput.toByteString();
++  }
++
++  private static RecursiveMessage makeRecursiveMessage(int num) {
++    if (num == 0) {
++      return RecursiveMessage.getDefaultInstance();
++    } else {
++      return RecursiveMessage.newBuilder().setRecurse(makeRecursiveMessage(num - 1)).build();
++    }
++  }
++
++  private static RecursiveGroup makeRecursiveGroup(int num) {
++    if (num == 0) {
++      return RecursiveGroup.getDefaultInstance();
++    } else {
++      return RecursiveGroup.newBuilder().setRecurse(makeRecursiveGroup(num - 1)).build();
++    }
++  }
+ }
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.3.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.3.bb
index 324134596..acc35db4a 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.3.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.3.bb
@@ -15,6 +15,7 @@ SRCREV = "4a2aef570deb2bfb8927426558701e8bfc26f2a4"
 SRC_URI = "gitsm://github.com/protocolbuffers/protobuf.git;branch=25.x;protocol=https \
            file://run-ptest \
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch \
+           file://0001-Add-recursion-check-when-parsing-unknown-fields-in-J.patch \
            "
 SRC_URI:append:mips:toolchain-clang = " file://0001-Fix-build-on-mips-clang.patch "
 SRC_URI:append:mipsel:toolchain-clang = " file://0001-Fix-build-on-mips-clang.patch "
-- 
2.25.1


