Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E62AD5A6F9
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 08:12:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.41220.1732608764456802809
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Nov 2024 00:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10608bb639=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ6g94l023689
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 08:12:43 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433491b1n7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 08:12:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dl67G7kcEm9KQOLNGczmiHJJtWl4fUTrbZp0Sw3N4bTNuJjGi+1DixG4HZql0DyCffhY38RRwmKPN/bo7BoNrHtCvPMy2uBrmx2aiH2xQJSZCjDcjdbDqL14U9BvzIGEiUAjJUtb320T3dq25RCSEgF8tdSl5gOLmO4UPopZezlz6v5sYRNV1IP606Qhs6kT1PtWxH3ZkMGw53W45Z0TfcF56pfdOLuJyqz/P1ZlY9WjLQvkCD+vTtB4lJMdJmly4PK8MCqCiLZKWX3/lQdorSxxImXLrpUK6xqkD5HUt6PfG6T4E2/kiDt5nvLn3Bgb9YWc82xndfhItNQRcCgyiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BbLcuwDA2MK+dhn97zNR5m5iWrweKjf6AVEywrqhF0=;
 b=cIK7YlZN3eQMLIvVW38jBNeQO1xyh5iz2zhr4F3QkLEIeP10kc/iIsp1K3NiF9MVAR8ugwcpGwr7qxkz8REWWFRep58GRtL4Q1m2FVegeyqVfLVS1I+94Qyvt/Xz0Awj25i3dZA25sJ1MxF60uOwpPBGUAyhr+rzIPmcsyrHukcHGHgAVTnZ3ws+pFfU6afQ1V8cZY9a4lD5lvmDvRS+SYKbOrGMsSC2xOnnSuqrHEFX3WcikJK9w78QQTfUH6a9XrXvu7a/dMcP+M13DX9jdSlIop+SKgNEoVoP0tXTmh+F1Vd/PWQ0F1WCBc+2rdiEjZIWiI3ZAl/ojR/F/ZoUYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BL1PR11MB5285.namprd11.prod.outlook.com (2603:10b6:208:309::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 08:12:38 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 08:12:37 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][kirkstone][PATCH] protobuf: fix CVE-2024-7254
Date: Tue, 26 Nov 2024 00:12:28 -0800
Message-Id: <20241126081228.3376388-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:a03:331::22) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|BL1PR11MB5285:EE_
X-MS-Office365-Filtering-Correlation-Id: c2f4c8fe-9a9a-4e92-e435-08dd0df2171f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dngasZVrI0A5mE1SRdZTUejCVIzQsh32tnDBej5+/zQyetjauKk4eM3kUArb?=
 =?us-ascii?Q?0YXMaaQRoRjhq6jsHpATUGCYC3NS9WfTQF0mwh++ilEpiGGJe0PgKqyVGP11?=
 =?us-ascii?Q?pOtAJoGgjsYbdHtNIK2h5x55i4LqjFVFsbCZ0Pi1wUYzn7oxB8vNC6iAowkq?=
 =?us-ascii?Q?bQGaxKFtjsBifOV4UmTwTsf8kZw+Gd+qaQiuw6T+sgbJacwuiIhgW5l+ZDXZ?=
 =?us-ascii?Q?+PFWlXg/nzUHG/lT8h3VuVD/nmiBMq/GCZe2haDwm0vGqspUwx6vCVHd7xmK?=
 =?us-ascii?Q?BNW1Kpbcb81FAgV3IKzLzsDBUcSaG3ga57Cs7vxNytBWYdlvKBke3Ix+2epX?=
 =?us-ascii?Q?iUkoHlREbIprd+Tk8ozOrwN1EOrBKa6+K/IHqhiKranLD/hWsUmx1mykcvJx?=
 =?us-ascii?Q?+nmP8Ste8I87ZI3xGoz1ixfbwqRkGQwtNyeOj1xZz28VdiwyS0UHK80WBPtE?=
 =?us-ascii?Q?YjtgZ11ZtJSLADG6x7C4CrSi9w8qe+Twfxaq3PNsIjjbMFkMEjMSmwJ1txPp?=
 =?us-ascii?Q?lh8Y3uV84ef+P4o7+BP0DZlsMLt8ExpMRqPfFu7dyyec6yFR2GRPFXCzOepf?=
 =?us-ascii?Q?dLpBsuveWPn76oFhdCa48pCuSO3yt0HMGd29U1AOsDxwhYZyScqkcg31mO/P?=
 =?us-ascii?Q?egzowy6rLEF/5Apdnrh36WzltbL60d+Aq2H6d6FQYTqkms/9PpHJO3g+DAej?=
 =?us-ascii?Q?VjmcHWIFbA7EpJ6d8Ve5NpY3XkwJglQ7jUpYB6wrNMXGpjNSKteN8wlmASr5?=
 =?us-ascii?Q?ZWRTgBRFLvuYzNpyooC1G81mMssq/v+Ja7uVYR4OwBZpBEzI6OmPs/vZzq8B?=
 =?us-ascii?Q?Cb+cgkCJAiWiohCgA5ks9Z0e60IlYIIkMmxDMvWIWq7vQ08LwwgNlXKWWdDh?=
 =?us-ascii?Q?P/KxBj5NpmTYR9ydeLUxTLWGaG6Mwr7wbVWG5Nm+GnmZsdaUg57eNLJNwnFn?=
 =?us-ascii?Q?Nil5jdN1v8WjHjzYEJbAwjKjUTr1BzaXx7JRUjTbcTf8aUHNXvwX/J9MEUMk?=
 =?us-ascii?Q?TWfW86wKRkYfi3eLYvDjNyxjaHpNi6ADFCC00xxJVoeTlXbrigSlhp+ZUeTv?=
 =?us-ascii?Q?DuuM4s/tl2ZcXPvzHWpnsRLs5sQ8a4pYdnWE2enRS5Wx0dDasxDifyTibEms?=
 =?us-ascii?Q?kg3pGQ+ddzJyIAqWR54HmJVGPplvCO1PtcVNOeo5/fwkikb4seg1nN+sMW7w?=
 =?us-ascii?Q?1pTC6doZA7QLPAGXOCXuJLcM91g1b9aHWAEZgfWHGqsjT8dVKewSJTat2Fbe?=
 =?us-ascii?Q?FClSajuyS8gcTe95Ti4S/VNdQs589DwS6TKL45oWfiHJI6FOydY9DV3xIjs2?=
 =?us-ascii?Q?sAJzG7zCHgI19pRVFzEdampNrteKZNToCD8VfacP078XLIxJUzGm67wwfzga?=
 =?us-ascii?Q?a9DgI+VBjBHIFZ1sASQapG0o3LTztgIORXRIS32ojSpmu0Y/Yw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T9lguW0gM/Rt1p4PlSMI7+1hrBIdsiD84oVgq8MuN6C6MCZvuvSsSytopsdw?=
 =?us-ascii?Q?NknwRFRD9150zVnvon162V15SXv239SlhO8Kc1hhT/YxbBsN9sqeyiftMIBk?=
 =?us-ascii?Q?VL8BFbfeJQPTU14hmsa/SDhHLa418Z9u18voySj8rk+1ddgXEqrUR+p0l4Wb?=
 =?us-ascii?Q?p/LxJ8wKUwcAJ2HtPouOdvT6PSNCWSEgofNIHrXnH6cFC1qArsaAboXeW7Gu?=
 =?us-ascii?Q?dsX5sB4PnvLwwLKGlUyS8iwgqXB3j6TY8yBMtYB/007pNK0o6XvJkNdnAhhh?=
 =?us-ascii?Q?yJwrxeqwZ3m6qkUIl9Mn8l8nOrZq6QygVqQsQArqMTLcJUtTijdPesg1QWW9?=
 =?us-ascii?Q?ZTNnT661vQnL50gvP8hzM/uEjE2NjL07bADhBpyAU4kkO1im5mGKBx9TirOi?=
 =?us-ascii?Q?AUj1NTv07QN1kEReSgWaX3Be5qoIcS1iKNB149sWh38wbm35oh7jK2s8O1Bn?=
 =?us-ascii?Q?EN0hZrWdVSGruTcDrj1e0VPSIkaFITnWcdNsTPviNRzNBTZYLFkUrpjzYv8d?=
 =?us-ascii?Q?O0hXM8kjmoD6ZWBsDVjksG+RvGuEZypyX2TCj2koaUCL1kBVQ/TvgbqVhqkE?=
 =?us-ascii?Q?f3XCDiAKogyCVlWpj8mdVRspTu0pKj93FCPBtr+JXs5yxA92GMbOjRf6vUk8?=
 =?us-ascii?Q?4K/iU005LRKoPFgol+AZBofyLONAoZlrGirs1l19GvZUQdo1h3773FHe89VU?=
 =?us-ascii?Q?MNjJjvNfmRIJSYIMWBueBceeuyZAO90tc9UXynzYDMhef/l4us819VCkBfwp?=
 =?us-ascii?Q?9hl+ClFz+WdWU62olP7IpcuPe9cNECbXWCesCsoLS45jMgQ9naUeBQbafIEh?=
 =?us-ascii?Q?2hoKuGuvaYutYi3Az0P86QC/pr8b5OsZO0ZqeYNK+Q4O7s1XGEWpx+R0M1es?=
 =?us-ascii?Q?7hSjfTRG9wG0N3uhpYGvcftlG7xt/qK9g1A+6JPaCrkXSqRnvCr3DeH+RDPh?=
 =?us-ascii?Q?WygY/0/sVBKdawTpNxHvFLVlw3atyt7cF+ZDpUr+qObvRMpzj378O8JKj7fj?=
 =?us-ascii?Q?F+9zaPKpl8twuRHGUOoTu/FPyxRONShNjHV6xoM7XiDUqp9e7vdzBYYJzJjt?=
 =?us-ascii?Q?Xuh5g1YCmOmYI44W5VgHSPNCb/Bpcv8MqJsoqfywX45UlTGvCeE9dJTFr4l1?=
 =?us-ascii?Q?cJieW0Y3FrvFFFt4Zsjdp7E3/KB4+lpEYf0t7YOruGJAyZIS2H0UWrqBz52M?=
 =?us-ascii?Q?YqoCzuFx5oiNU7gKK9Q4/YdGqR/JpXJoMurSIryJiiBYLCP8X3iP0PM+VvhL?=
 =?us-ascii?Q?g5IevjMxIXWs6TrZkLlD/MmImHYRJWqfUqC5YlpbJXRAYWXA5+DrikFATrS+?=
 =?us-ascii?Q?GHj5uf7+luNNQovTx3wGAdFUzD4mBlbT1SJ/+FgHpjRRg9iKV21Xn2TtMBVT?=
 =?us-ascii?Q?SWlcHgZCtmo6twILUKNwKWhjyOP/Rv2HMJbn8d74IR9o7cIgsf9ECpvQMqhB?=
 =?us-ascii?Q?OOBfvx9ijkCvg3BEoA07es+n6V79tZbcJOSPUi5PyVp8jHB9tEs008VeQU2K?=
 =?us-ascii?Q?Q8Y+02dtD/zhk3BmFd1nPKCoTI7AOSip3C/58DzJreJFxJ3WzeYH0JARQR9O?=
 =?us-ascii?Q?bbQHFJPAhmpWEOHMY7msSd1VIT+Auvplw5qoaSKVnqRk6a/OYXhIM/8i27r/?=
 =?us-ascii?Q?pA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f4c8fe-9a9a-4e92-e435-08dd0df2171f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 08:12:37.8931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvaZX0/yBui0icxJBLqm+ZgcKV2ORY/0k7eJOOBKWTLw8U3aB216MsRit8WXO/9rahUAq4LbJHcx4arlNUkmBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5285
X-Authority-Analysis: v=2.4 cv=W4ZqVgWk c=1 sm=1 tr=0 ts=674582fb cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=1XWaLZrsAAAA:8 a=NEAV23lmAAAA:8 a=xShQrWrA5FWXHZWr418A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Af8f8_fRtN0DQdrYPgBK4JhZIfU4SwhR
X-Proofpoint-ORIG-GUID: Af8f8_fRtN0DQdrYPgBK4JhZIfU4SwhR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-26_06,2024-11-25_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 adultscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 phishscore=0 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411260065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 08:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114068

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch with tweaks for the current version to fix
CVE-2024-7254.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...eck-when-parsing-unknown-fields-in-J.patch | 795 ++++++++++++++++++
 .../protobuf/protobuf_3.19.6.bb               |   1 +
 2 files changed, 796 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-Add-recursion-check-when-parsing-unknown-fields-in-J.patch

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Add-recursion-check-when-parsing-unknown-fields-in-J.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Add-recursion-check-when-parsing-unknown-fields-in-J.patch
new file mode 100644
index 000000000..d5d85aac0
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Add-recursion-check-when-parsing-unknown-fields-in-J.patch
@@ -0,0 +1,795 @@
+From 23cd727717604ab5a51b88e0eff51b364e6fa008 Mon Sep 17 00:00:00 2001
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
+ .../com/google/protobuf/ArrayDecoders.java    |  29 +++
+ .../com/google/protobuf/CodedInputStream.java |  72 +++++-
+ .../com/google/protobuf/MessageSchema.java    |   9 +-
+ .../com/google/protobuf/MessageSetSchema.java |   2 +-
+ .../google/protobuf/UnknownFieldSchema.java   |  28 ++-
+ .../google/protobuf/CodedInputStreamTest.java | 159 ++++++++++++
+ .../java/com/google/protobuf/LiteTest.java    | 232 ++++++++++++++++++
+ 7 files changed, 515 insertions(+), 16 deletions(-)
+
+diff --git a/java/core/src/main/java/com/google/protobuf/ArrayDecoders.java b/java/core/src/main/java/com/google/protobuf/ArrayDecoders.java
+index 39b79278c..431739cd5 100644
+--- a/java/core/src/main/java/com/google/protobuf/ArrayDecoders.java
++++ b/java/core/src/main/java/com/google/protobuf/ArrayDecoders.java
+@@ -44,6 +44,11 @@ import java.io.IOException;
+  * crossing protobuf public API boundaries.
+  */
+ final class ArrayDecoders {
++  static final int DEFAULT_RECURSION_LIMIT = 100;
++
++  @SuppressWarnings("NonFinalStaticField")
++  private static volatile int recursionLimit = DEFAULT_RECURSION_LIMIT;
++
+   /**
+    * A helper used to return multiple values in a Java function. Java doesn't natively support
+    * returning multiple values in a function. Creating a new Object to hold the return values will
+@@ -58,6 +63,7 @@ final class ArrayDecoders {
+     public long long1;
+     public Object object1;
+     public final ExtensionRegistryLite extensionRegistry;
++    public int recursionDepth;
+ 
+     Registers() {
+       this.extensionRegistry = ExtensionRegistryLite.getEmptyRegistry();
+@@ -265,7 +271,10 @@ final class ArrayDecoders {
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
+@@ -284,8 +293,11 @@ final class ArrayDecoders {
+     // and it can't be used in group fields).
+     final MessageSchema messageSchema = (MessageSchema) schema;
+     // It's OK to directly use parseProto2Message since proto3 doesn't have group.
++    registers.recursionDepth++;
++    checkRecursionLimit(registers.recursionDepth);
+     final int endPosition =
+         messageSchema.parseProto2Message(msg, data, position, limit, endGroup, registers);
++    registers.recursionDepth--;
+     registers.object1 = msg;
+     return endPosition;
+   }
+@@ -1045,6 +1057,8 @@ final class ArrayDecoders {
+         final UnknownFieldSetLite child = UnknownFieldSetLite.newInstance();
+         final int endGroup = (tag & ~0x7) | WireFormat.WIRETYPE_END_GROUP;
+         int lastTag = 0;
++        registers.recursionDepth++;
++        checkRecursionLimit(registers.recursionDepth);
+         while (position < limit) {
+           position = decodeVarint32(data, position, registers);
+           lastTag = registers.int1;
+@@ -1053,6 +1067,7 @@ final class ArrayDecoders {
+           }
+           position = decodeUnknownField(lastTag, data, position, limit, child, registers);
+         }
++        registers.recursionDepth--;
+         if (position > limit || lastTag != endGroup) {
+           throw InvalidProtocolBufferException.parseFailure();
+         }
+@@ -1099,4 +1114,18 @@ final class ArrayDecoders {
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
+index 6e9c0f620..5c194cff6 100644
+--- a/java/core/src/main/java/com/google/protobuf/CodedInputStream.java
++++ b/java/core/src/main/java/com/google/protobuf/CodedInputStream.java
+@@ -729,7 +729,14 @@ public abstract class CodedInputStream {
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
+@@ -739,7 +746,14 @@ public abstract class CodedInputStream {
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
+@@ -1444,7 +1458,14 @@ public abstract class CodedInputStream {
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
+@@ -1454,7 +1475,14 @@ public abstract class CodedInputStream {
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
+@@ -2212,7 +2240,14 @@ public abstract class CodedInputStream {
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
+@@ -2222,7 +2257,14 @@ public abstract class CodedInputStream {
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
+@@ -3333,7 +3375,14 @@ public abstract class CodedInputStream {
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
+@@ -3343,7 +3392,14 @@ public abstract class CodedInputStream {
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
+index 76220cc47..d85899e14 100644
+--- a/java/core/src/main/java/com/google/protobuf/MessageSchema.java
++++ b/java/core/src/main/java/com/google/protobuf/MessageSchema.java
+@@ -3946,7 +3946,8 @@ final class MessageSchema<T> implements Schema<T> {
+               unknownFields = unknownFieldSchema.getBuilderFromMessage(message);
+             }
+             // Unknown field.
+-            if (unknownFieldSchema.mergeOneFieldFrom(unknownFields, reader)) {
++            if (unknownFieldSchema.mergeOneFieldFrom(
++                unknownFields, reader, /* currentDepth= */ 0)) {
+               continue;
+             }
+           }
+@@ -4321,7 +4322,8 @@ final class MessageSchema<T> implements Schema<T> {
+               if (unknownFields == null) {
+                 unknownFields = unknownFieldSchema.getBuilderFromMessage(message);
+               }
+-              if (!unknownFieldSchema.mergeOneFieldFrom(unknownFields, reader)) {
++              if (!unknownFieldSchema.mergeOneFieldFrom(
++                  unknownFields, reader, /* currentDepth= */ 0)) {
+                 return;
+               }
+               break;
+@@ -4337,7 +4339,8 @@ final class MessageSchema<T> implements Schema<T> {
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
+index eae93b912..705d74608 100644
+--- a/java/core/src/main/java/com/google/protobuf/MessageSetSchema.java
++++ b/java/core/src/main/java/com/google/protobuf/MessageSetSchema.java
+@@ -301,7 +301,7 @@ final class MessageSetSchema<T> implements Schema<T> {
+               reader, extension, extensionRegistry, extensions);
+           return true;
+         } else {
+-          return unknownFieldSchema.mergeOneFieldFrom(unknownFields, reader);
++          return unknownFieldSchema.mergeOneFieldFrom(unknownFields, reader, /* currentDepth= */ 0);
+         }
+       } else {
+         return reader.skipField();
+diff --git a/java/core/src/main/java/com/google/protobuf/UnknownFieldSchema.java b/java/core/src/main/java/com/google/protobuf/UnknownFieldSchema.java
+index e736d5ce9..c68e3107c 100644
+--- a/java/core/src/main/java/com/google/protobuf/UnknownFieldSchema.java
++++ b/java/core/src/main/java/com/google/protobuf/UnknownFieldSchema.java
+@@ -35,6 +35,11 @@ import java.io.IOException;
+ @ExperimentalApi
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
+@@ -78,7 +83,8 @@ abstract class UnknownFieldSchema<T, B> {
+   abstract void makeImmutable(Object message);
+ 
+   /** Merges one field into the unknown fields. */
+-  final boolean mergeOneFieldFrom(B unknownFields, Reader reader) throws IOException {
++  final boolean mergeOneFieldFrom(B unknownFields, Reader reader, int currentDepth)
++      throws IOException {
+     int tag = reader.getTag();
+     int fieldNumber = WireFormat.getTagFieldNumber(tag);
+     switch (WireFormat.getTagWireType(tag)) {
+@@ -97,7 +103,12 @@ abstract class UnknownFieldSchema<T, B> {
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
+@@ -110,10 +121,11 @@ abstract class UnknownFieldSchema<T, B> {
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
+@@ -130,4 +142,12 @@ abstract class UnknownFieldSchema<T, B> {
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
+index f5bb31fdf..78efd4c31 100644
+--- a/java/core/src/test/java/com/google/protobuf/CodedInputStreamTest.java
++++ b/java/core/src/test/java/com/google/protobuf/CodedInputStreamTest.java
+@@ -33,6 +33,10 @@ package com.google.protobuf;
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
+@@ -57,6 +61,13 @@ public class CodedInputStreamTest {
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
+@@ -139,6 +150,17 @@ public class CodedInputStreamTest {
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
+@@ -684,6 +706,143 @@ public class CodedInputStreamTest {
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
+index 6535a1bf6..850228467 100644
+--- a/java/lite/src/test/java/com/google/protobuf/LiteTest.java
++++ b/java/lite/src/test/java/com/google/protobuf/LiteTest.java
+@@ -2453,6 +2453,211 @@ public class LiteTest {
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
+@@ -2809,4 +3014,31 @@ public class LiteTest {
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
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb
index 8e5005471..2b19d07ff 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=3.19.x;protocol=
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch \
            file://0001-Fix-linking-error-with-ld-gold.patch \
            file://0001-Lower-init-prio-for-extension-attributes.patch \
+           file://0001-Add-recursion-check-when-parsing-unknown-fields-in-J.patch \
            "
 SRC_URI:append:mips:toolchain-clang = " file://0001-Fix-build-on-mips-clang.patch "
 SRC_URI:append:mipsel:toolchain-clang = " file://0001-Fix-build-on-mips-clang.patch "
-- 
2.25.1


