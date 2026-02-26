Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A2BFC5905
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 07:03:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65199.1772089418746976828
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 23:03:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fqm0w7fV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6517627b85=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q6UQkr1633580
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 07:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=isS6eNZ77wgIDi+a6/oQ
	+s8wCvZIeGJwhXaaDSEzvzc=; b=fqm0w7fV77p41fhnDz05PxssRTIaoxDtbvFt
	dLeb0NYT8pjqAfAw7nSSY6HaicemQu1+ZytWGCBtTjwkm7XjJqWcomP5j8I344z/
	Q4N6kKRCRv3pfGqYtVM4pRGOIsuXEtC0WP9v7GWObWoJsLL3XTeq7klMQcLMqoH/
	d73Ig+rZN3DwyZfaXl8gW3NHbMXEmkISZoK/R4HA34VhSpld+x2ZGEk+X89lqhOw
	6okmgIQEBLbPJ2kM+wg44gQkb6WX7fLAx1iu5a3wdJRTKbLFS2ZTPTnzGn4H3Wcq
	FUVjpLEsOtnHRtQLj51pm/Bup8OGsrAyk6FV1KeQZ76k7vbNsA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010034.outbound.protection.outlook.com [52.101.85.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cjdvdr4uq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 07:03:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8t58Dxytzw1WWO2gACbVNoKkJNsGrG1j6ChpJ5TS8xvSygTwsCXqTcETyH0+mcfsQDHSiyElLsDUF+vXCNcGCjITxUY5ZA4e2USOcGuJGrqpHlh34hxUmJ/Q/VhJa8AKxIZpRob/vrHjDEW/QJHKaTfqryGIBbuCtaO/eyYmYnkkCYQOeKl3qTjEYIHoD8Jq739twJhk5aV5R0zQy64tPwkPESVjJlJ6MukN/YnA3JlNvMbCx2CMca5R3tWKL3KMv4qi2IpJq9UsYezgNdcNFcLqdl2EhCCDEOtSWZOOdDvHX4Oda9LZId/ZrUwjYZlGnIxC3Mqudad6anY2upv3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isS6eNZ77wgIDi+a6/oQ+s8wCvZIeGJwhXaaDSEzvzc=;
 b=HNJxEfG7LITKDrcMZ67J4fadYtnjsDhgMoYHwrOuyXnASWNj4BBKmCiRG3Cow3O3b7rLDWhB7iyDgug1UBxus5QalAr0iCUZvpAtCTOL00LcbdLtggjMoDbJK6iRN9ByqoAQoGXEaWjVSxRdftAS+q0GAWn9mjdjZbYSUOP7ooSIBFDrlA1RGelhlNk+TFfsFZfGgUb+HQpTl4JyjX/jdMrRg4W1vOygCNttQWmmWEDpf7/vZWQfFEZZWxRNi48XxlQHqxfUX9t/N81/T//m5VAw/ZUB7cpXvWi6KfFGi2LTjKZ6WeHrrR8HdvOp2u37d/ODX9o2mMRg+PXJPlsDtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DM4PR11MB8092.namprd11.prod.outlook.com (2603:10b6:8:184::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 07:03:34 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 07:03:34 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][master][PATCH] tumbler: fix segfault on startup when built without any plugins
Date: Thu, 26 Feb 2026 15:03:22 +0800
Message-ID: <20260226070323.909339-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::11) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DM4PR11MB8092:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d85eddc-7db0-4602-288d-08de7505283f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	HdBqaFMxmaBBI8zQJQapYLKH5n9aOafsHxOfzBct+GHrdEoRY1hlHmSB0BBweI2noKsbBNIQs82FUY2VVNOE12byUfOUlkwlFliBAwQwL8r5Q3te5Fe7JQTOKKLe/q04ohrYqpvmKxkD6m7lgaTPRRQO8eJJIEujACfFyxcgIHtcU/FlDvpJDnnPo3NZ9gW+SFV8Ga7ImSXuwm/aDUGBviJiLiw9U8sRJl5uxx64GrtlRYgqE7AaIgjFFkMZReuFsREKVri7CuuCgNNGfvsBeT/+T2Li7QtulSixhWVKQezKf8xKgZwOOuN+7G0ij3GS9QgE/emab3Rw/mpU3wSS6lVz2KrxO4I4iXEgYvKo73Ab1+zbNxXcmPkEBR61i89M6z4gdyCeODRaVIi8NHj6OE/D8LSmc49G5v1Gs5vRohpT/CMjTB+BCI11ian/3VsHrN6JnOpgV+HtQIBdpnGXJnToz9P7+uDX8lnL0eZh3yxDuO37SWWRq7fcWhhCHJtuLphY/kkAseQm+fNVLAE2JLnbomENwEp5tHbhzvBQfN6OpppWOzt/62BBVxpuBhNqbD7rFkywRzmGMFBiI+4eo160SJRpu3ie+cCdjE2EY1Izp+psg7c1NVDHlDPfJ0X4fynyHO6IONvNjtA5fRYhfFC9qEQfUMK0rMe7P+Ydqn5etJSiPC4m+kZbFOz/p6exVEOVoBzTBD0eTlEdHVuYoemTtgMHLCHWIvtXJofmmSQaLXejXDxa79/MPWfreN0MxPLinrd2hhYGvxCorzlpWdtCEF1/vux7CVbGnkC1KRo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8ZcED5KoyfRSY49DngjCmpuIlzwPtF58izqKbCm4Wi8izjRAnFiDMGw/z72r?=
 =?us-ascii?Q?/zkHg3dJ8i3pbQui3oUl5MqDuQG62297/qfn7zOdoX17tjes1g1+4UxBOjK5?=
 =?us-ascii?Q?EveVCa8vxf7fkaOBQEk6Hm87S9mCSzw4brE1tQQO5pYO+rEUiLiK6rFLyDZv?=
 =?us-ascii?Q?Ur3fzdny1pTqyAxD8ZQxvWMX+WrXm+RJh7e/gg3dmYdXzj4jxjlVJWJPkjra?=
 =?us-ascii?Q?XnnF2zh/pRM7Ju3kpJt5cfy/RcdSlyBTxap8TOgrT1sJPPJoch4hZIlnvtPz?=
 =?us-ascii?Q?7aZPS+mGaNZluVjeIyAjFOOmaLBcspbgt5wwSfOZdbLKYNGxk+aHNcN4ZRwB?=
 =?us-ascii?Q?iKkb4P3DaQpLe2M/PSRmlroSYV/POlWw98DOPteuV1X8FBgJ1g7CxJM5/IcY?=
 =?us-ascii?Q?uD5jWO4Eva1Q2fO8FXtYXIaSBW4DOXSpLrjrBPChfEPr8/7hfQIoCBw7hbtV?=
 =?us-ascii?Q?xVym1RFo9ekNeYjchI/cM2zUVWPrE3c7JaFa6tsjg+ziYK7PyVo1//qyMkbc?=
 =?us-ascii?Q?bXAisQ+MXxa/kvI6tONRrDTHqKxLvV4tpCqG43PKkLAC+KmCToNGNCj9R2dE?=
 =?us-ascii?Q?bW78wkfdX+Ip3Ru6Aj3oQkfPYGU8ecVnLcktSjtjgohMOtLdPbgxe/iO70lb?=
 =?us-ascii?Q?ZxVIT6gRhukdZPjextbKCMAPmGP7GzO2HoUWItpBP9miecJhvoQMksKgE3Bb?=
 =?us-ascii?Q?HI10GaafhHizKy+82C/bX2GrO6zRRa4VsGUx9zahpHU0eSpCs7kpZk56TX2i?=
 =?us-ascii?Q?E90L8hW46PDDJlQpiswTEXyptB8iYX5hVcz9lG802zo9beuTb00qFszu5Dt+?=
 =?us-ascii?Q?wkHS/SnD67dENtxFOkrPgQG28vKxG01+tfuSatZanv86V0NeNvPoAvG7aP6H?=
 =?us-ascii?Q?L0F8/yPjtzHrrnwxrbRyRYI5qFSnsQ3cIWMEJTUnYRcn7CDoupSsWX/oVsfp?=
 =?us-ascii?Q?LrnfB/P2W3wDl9GwkbXBUXUIseT/p3yvNz1NzG8kEJ8Svj8sh858XbfpRR4j?=
 =?us-ascii?Q?eLUjqPz0Zxf8knSH+IHWpLHdmbCDGTfTOJDJILuWtb5RWzz1oAlVAdRcvgzJ?=
 =?us-ascii?Q?c9J8HBXfPqOZwh6vBC307L28i9sv+eaBMfGFMrEbnA8/BxTBQs5ZNaflZHmU?=
 =?us-ascii?Q?aOKA37j7s1PXN0w8zw/Q92ccnqlI9RhBSp5a+Xr0QDt3DxftAx5sllGN6YVa?=
 =?us-ascii?Q?Bgf3a7jaDZcQPLa/TFarEpgdzPLRs8UY3N6moX1tIgsVIDEizgmK0m85k/4g?=
 =?us-ascii?Q?gw2vf5KxFpyRsD++a7BmgZouK7LMb4jotmLv75jAqmYPDqlhaYSvRgHbuJub?=
 =?us-ascii?Q?ovF0mttzVDHAHat7JB/29PhMLhgIeOISsBRsi9JzkDLxLAbJpyk6LtmzKBlA?=
 =?us-ascii?Q?Gequcn89ohqQOHLeFgnph/istQFkgboc2PID6Jpb+ilrJDs/rUOmlcg4zgtr?=
 =?us-ascii?Q?LMp8JsJgbuqCW1wmmMqplNak8StU+/ik80UVIvq+rjXvsgX2TGvOQElo/EsX?=
 =?us-ascii?Q?+tepMU14Htg0FPf/W3+0yCWBqMMiqKBV1kqgYoVkOh7H/txrQhFhnCgDm+3o?=
 =?us-ascii?Q?LrD98FaOrgAq52zo1S/myBXwEPxoN0mr2ChgP3Frz1KAFXVkkdh8uwXKa40y?=
 =?us-ascii?Q?OXLIkK7HeO2IhiKhNPy+CzCzLMNwN8iTQ6uakAnS2DGRaYs7eQ5btkfq4u6l?=
 =?us-ascii?Q?1ksGAVZs3FwaADcC9w3eoC1LEn0b44F/VmyIshTPhaRIyDi//rdpdenDo7MI?=
 =?us-ascii?Q?Alec8M+tzaAJjvSg1dHxJ6UPXDC+HhQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d85eddc-7db0-4602-288d-08de7505283f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 07:03:34.5479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XcT7T/s9dx3BpJ/jhEsGluLETexSoO+RquxbK4GAH1ttGEpBjm35hqI+/hHy8EVpb/jvX5I45PQKdG1xBWXnSwLbvGeb9OKSfDPOp3LNuhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8092
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA2MCBTYWx0ZWRfXzDVMUTuL+8FH
 PFZDQHE0fmUd7aP1Fkm2VN7Lkyuru/GV6ZYzh08K4vdbiLLJ3ggadLtGoUbPKXm7GWqvu2egyjY
 HDYzqo65THunOyYHkQpDzPLd9a2uVEXFPPVfUg+SUqI+1+hojDEinkbpBvtGYDXrUNK2tOS57/G
 yOeJnQ7Sbk9UPYQqCZBSLzR/cmCSu5ieWWGsTcZRNzSS+LmTVr1Iv1Do98LLW19JDVUPntFbaNp
 MpSceQkrP37gCvKjpvSgkWq9FAp753zodnD9mq5jtZjbV+w6fjUUTd9KZuBcnWQdJvjC5vL2Fa0
 uMhxS9WjDCX5477Wr+RwUFSMhz3tYve4rKGBHI6RUoEAv3NFydwnsE6MvR/TXg0qfUV2zaFL4lE
 O66s6wLrvXNdYd0PXmh3pBbnjGnyDLv1xZCEHi5rzQlpjgm/47SCHPdq58IRG29Sdwj2whOnyKK
 TrftNcgVUd7n/J7YUUw==
X-Proofpoint-GUID: a4tSZ8k2MY1samcQCwakqL36-9YhZnFZ
X-Authority-Analysis: v=2.4 cv=UKzQ3Sfy c=1 sm=1 tr=0 ts=699ff049 cx=c_pps
 a=h6NrD5D8j3GnK3ckJnoRDA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=WKbWxAT0ov2a3oS-wuAA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: a4tSZ8k2MY1samcQCwakqL36-9YhZnFZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260060
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 07:03:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124664

From: Zhang Peng <peng.zhang1.cn@windriver.com>

tumbler default build without any plugins. In this situation, when
xfce desktop startup, tumblerd will segfault as following:

```
tumblerd[1138]: segfault at 30 ip 00007fc5dc169fb0 sp 00007ffd03ee3be8 error 4 in libglib-2.0.so.0.8600.3
[aefb0,7fc5dc0da000+a0000] likely on CPU 2 (core 4, socket 0)
```
Backport upstream fix to handle cases where there are no plugins gracefully

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...here-there-are-no-plugins-gracefully.patch | 58 +++++++++++++++++++
 .../recipes-xfce/tumbler/tumbler_4.20.1.bb    |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta-xfce/recipes-xfce/tumbler/files/0001-Handle-cases-where-there-are-no-plugins-gracefully.patch

diff --git a/meta-xfce/recipes-xfce/tumbler/files/0001-Handle-cases-where-there-are-no-plugins-gracefully.patch b/meta-xfce/recipes-xfce/tumbler/files/0001-Handle-cases-where-there-are-no-plugins-gracefully.patch
new file mode 100644
index 0000000000..a4e60f998a
--- /dev/null
+++ b/meta-xfce/recipes-xfce/tumbler/files/0001-Handle-cases-where-there-are-no-plugins-gracefully.patch
@@ -0,0 +1,58 @@
+From 95244ee0d1f3184e2c2cae9d33095dc03829b10e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
+Date: Fri, 20 Feb 2026 17:07:56 +0100
+Subject: [PATCH] Handle cases where there are no plugins gracefully
+
+Not sure it makes much sense to allow the cache plugin not to be built,
+but then again, why not? It could be replaced by a customized
+implementation, and it has always been possible not to build it, so we
+might as well leave it as it is.
+
+Fixes: #109
+(cherry picked from commit b4f4db4bfc1a45f0a405c4516e38394a44c90fcf)
+
+Upstream-Status: Backport [https://gitlab.xfce.org/xfce/tumbler/-/commit/95244ee0d1f3184e2c2cae9d33095dc03829b10e]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ tumbler/tumbler-cache-plugin.c | 5 ++++-
+ tumblerd/tumbler-registry.c    | 7 ++++++-
+ 2 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/tumbler/tumbler-cache-plugin.c b/tumbler/tumbler-cache-plugin.c
+index 50700a3..e308638 100644
+--- a/tumbler/tumbler-cache-plugin.c
++++ b/tumbler/tumbler-cache-plugin.c
+@@ -188,7 +188,10 @@ tumbler_cache_plugin_get_default (void)
+       g_object_add_weak_pointer (G_OBJECT (plugin), (gpointer) &plugin);
+ 
+       if (!g_type_module_use (G_TYPE_MODULE (plugin)))
+-        return NULL;
++        {
++          g_object_unref (plugin);
++          return NULL;
++        }
+     }
+ 
+   return G_TYPE_MODULE (plugin);
+diff --git a/tumblerd/tumbler-registry.c b/tumblerd/tumbler-registry.c
+index 705dbc9..b58e831 100644
+--- a/tumblerd/tumbler-registry.c
++++ b/tumblerd/tumbler-registry.c
+@@ -534,7 +534,12 @@ tumbler_registry_update_supported (TumblerRegistry *registry)
+ 
+   /* abort if there are no thumbnailers */
+   if (thumbnailers == NULL)
+-    return;
++    {
++      /* we need NULL-terminated arrays for the _get_supported() dbus call anyway */
++      registry->uri_schemes = g_new0 (gchar *, 1);
++      registry->mime_types = g_new0 (gchar *, 1);
++      return;
++    }
+ 
+   /* clear visited flag of all thumbnailers */
+   for (lp = thumbnailers; lp != NULL; lp = lp->next)
+-- 
+2.50.0
+
diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb
index 7a01882d57..3cbc43fc20 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb
@@ -7,6 +7,7 @@ DEPENDS = "xfce4-dev-tools-native libxfce4util"
 
 inherit xfce gtk-doc systemd
 
+SRC_URI += " file://0001-Handle-cases-where-there-are-no-plugins-gracefully.patch"
 SRC_URI[sha256sum] = "87b90df8f30144a292d70889e710c8619d8b8803f0e1db3280a4293367a42eae"
 
 INSANE_SKIP:${PN} = "dev-so"
-- 
2.50.0


