Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F751C87FCA
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 10:21:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.48265.1754562101391861790
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Aug 2025 03:21:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0314e3eb41=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5778wlap1267130
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 Aug 2025 03:21:41 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48bpy7hu84-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 07 Aug 2025 03:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sheWNWXlZQTQCpwSGWqdregpJdAu5lvFju8g1KMrmuBNuM53ooCfjuRsciQjdJV7cb/orhoZ44MngDuOSuXYlf1xaviW2glR1FUs0TO7uugZeSpibULEUtZxxD2qpfU8a7mjMUjP0wpRFLzvaAMZrsymM2dalftdXkue8rpMJiu09XMhIyRDT9VLgEO4SwSNFu8HP9+qxasGSPnJ3Au89e8X4P/wHohxXItbWSEUtvCrFC9KgtAeGl0PDJMkUSqNjoHZEenCU41F/F0eQG2YjE5/JemMoSIpCDBXL1YXpNz7hKnv/6r5TBxkR5z/QoZpgSr/jTwAfsjfXH7bz8vfGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCrgS5j+djBdCE4xqFI32JKt/rNcPSDbr5jahHvPrZ4=;
 b=u2QkmwvCXtUs31mdalN/AlhkxeZzfwquJLFY+ortGlPeIhhXFowEL2hnDp2mSCHNKX/WO+pYVDPxROZLmoICSSS35wkKNk9THAXNK6gf5AGhxSmvDbsznSS3ybxRqpjWQNHHzElZ/RHElj89DQbikLBBr9mR25jOid8bAci5bUGCNoboGocCvqaY6L2XxO/rSr74eq/b/EJaP+zrtL5+9d3rz9fZzvTvslEWx2AhuL2odUex+/cbkKGrbH+YHN/bT8pIzgsh8z/TBsUSMlmuv49g9d/jiKYNCno85A+9ctEh6EadBq8TFYEW1p31QeI6tzlJU8oN6ZdsF/sbWbVZpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SJ5PPF56FDAD370.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::82a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 10:21:38 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 10:21:37 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][PATCH 1/1] python3-posix-ipc: fix runtime error
Date: Thu,  7 Aug 2025 18:21:04 +0800
Message-Id: <20250807102104.263783-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SJ5PPF56FDAD370:EE_
X-MS-Office365-Filtering-Correlation-Id: 48e895d7-abe4-4124-1fe3-08ddd59c312e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0jKQK3GEia9xWqY5sOmgAFD7/s89SyywIs5oUV/m1tbyY69OPpjoEX8Y5HyA?=
 =?us-ascii?Q?U44eAyzlMURCCn0NOmCx2bnK31Mel0cfc+JUe8NQRbQIy0OKo+W5POQiyBzW?=
 =?us-ascii?Q?ApEXBO4VsA5Td8PsUV1thN6kCH7IGaPJFh2iX2lm2n2rj1JdRVlYC7DWIMCV?=
 =?us-ascii?Q?2tZ4TVZR88ca9iYKbD/MtVKjO7uSLLco16tQlXydRQL6unvsrFrIDWw8RgIG?=
 =?us-ascii?Q?0gECt1xJD/wWvvNst+q1pkaXBnC8bNCA0OHLFcgQTcl28p1uWBzvjHx2jNK0?=
 =?us-ascii?Q?9KEZOlJpewmJseWYaDylSsfOaIJbgpWzePVfc9I2TmuL84E7EoaMWX4O1F5R?=
 =?us-ascii?Q?RgBnOHew2b8/pZOW4GM3uLYK6rVgg0/Qe4tdbItVCmYvhseldrcctzOiBipl?=
 =?us-ascii?Q?qG7gdtwGFnFvZIWRcMSAOtwtDoYVuZ822Tp0oXtukMjaQqHpBbdrfljZo0Wg?=
 =?us-ascii?Q?KpvyGeOG61WtzdL+wqnMb6OINeQlkHIRRlE0Liz4Jjv1mbBYdFIYq77YPR6m?=
 =?us-ascii?Q?sh1QPMOhpmMegDPz1R3flavIPCbwpv+HqiB6HwBrX+wKOyBGKMvUmnyNLMmr?=
 =?us-ascii?Q?fQ1J/b7HD3S4B8dvbB9eeW4M+1HFJJZ+E0n4ls/WO8/1w62BXNcEzGgEqPzh?=
 =?us-ascii?Q?17Jwvfb00GjlOc6Zx4hBxZHmUvCdi/ZAlWucdJK/6VGJMK9NHZAxa2f5IrgM?=
 =?us-ascii?Q?y739tgPwOYwAFpiJ1lt1HCUygj6dfnb0VhaW5MAP44SDW5FrbzKPBKPy5faR?=
 =?us-ascii?Q?122yw6mXTnpNz3Vzrrw/Db+pznWiiBaZ6b58HI1tw5wIExgLDBFOudbqYMUH?=
 =?us-ascii?Q?Kbv3SyD8c3BwSN4lSzE/rhBhsSq8mc2J/fWsRdCcjVzMwn4EPBveTVPliljr?=
 =?us-ascii?Q?2FMqufon/0j8bxwoJqeljCIX+U2I0PbDg5yIaIROZDRMuzLPVD3Kw+klI7YZ?=
 =?us-ascii?Q?tl9n+ZjSB1CjPzmOqv0gr7LWYz6gJsP+7Rp2e476OU4g7R8kYToHNKDMNNyZ?=
 =?us-ascii?Q?5lKqHOebmHov8WlPrMAKp6pMt1xSIpARHJz696Ys1dKmkKA2cwiexNWqO/z8?=
 =?us-ascii?Q?W7e2cXXlMceaEGhEf7zXKnCCFeyJSRSKToOuz/e1IhcCT02t5qNRJhaa3VyZ?=
 =?us-ascii?Q?QtCrYhbfvZzVgMRTgvVjwNe1K6pkSIlK5kQr0WcqNBej9h7/wI3VXo3fZBps?=
 =?us-ascii?Q?whcWiFci3pxVDuWADdWaEB0vSYJJeuN9RDL9NI8CSTQaUBXBSxFOnSNwyVwJ?=
 =?us-ascii?Q?ooFJ7xOdRHylS8zgdQpRs5C07sxmNj+mbh+sWz5iiXiliPxnzXSmWjI788+A?=
 =?us-ascii?Q?xoRUKkNfm5mqkqvox1zRfyU56tCgzTErRlWgQNIWidoOCX5T/d/xzcWfsw/r?=
 =?us-ascii?Q?HQ25i1yw8CsKJFNzOh5UFwdYU3/K90qFh7/CAzAjyt8FD3x/WNEJ64DhrSDj?=
 =?us-ascii?Q?Mv6GIJDRWXcRoPSXjTALO5Ytycf+1/Gi/6l7901IfRc++tLgA1tvtg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7lGjLbKGMEBgdIZZdZ6cqazBBs9+ilwN1WhsNaq6E0T7STmDIfXowZEALGeD?=
 =?us-ascii?Q?6eZ4uL/LCd6Vx18j7CKqR2qOnbsn6kKLE3F4IcOaTK4jm5V2TPWSuL77YWxu?=
 =?us-ascii?Q?kGVBM+VbiaJp8u2WcJi6AAhWmqdLFqX10BOY4y0otT6Do78EB2dMN2b+1oSU?=
 =?us-ascii?Q?rJksIScr5wpKgVPv814+vhRuLMIibqRiYkVQ5RhHkvbOZm83KAssHw0InTCy?=
 =?us-ascii?Q?6+ZqMxQLpEX+Keelm2KyMtXD/A4XU600HOv9oGTOzhP/+eY3LJzqpJX70VM7?=
 =?us-ascii?Q?27J8fc+Mjts84ocK7Ba+wByfJ++KifwFmajJzuUjMokzdARQJGDtoWo52D6V?=
 =?us-ascii?Q?wmMWdjKTLV1H3P3ahmiM4bkvA1cuYU+WTdfEmwwKbz8RKg5JjfHdVtVEtROS?=
 =?us-ascii?Q?PKMy5RivMhpZG5npanBNQKqwkDb3vvKdFd3TEpYxqKFtvOMcbcEMXRzm2sOK?=
 =?us-ascii?Q?GURKAV+x0wNAjYaj/sDw9S7bzD7TIl97EsbSxjhAU7ztZ2nV5RzwLCJO8GVJ?=
 =?us-ascii?Q?zzOpns+ohUZZM9hxUJhSiioiMJWs5lYm3fi+kapFsUvNLaFLPUQUDmYOTMv4?=
 =?us-ascii?Q?aGuUSotEt11+jyp+QQhuJnTp676MA1bQpzxDoi9NeCBQLu+XroyRi3YwhArp?=
 =?us-ascii?Q?YYf8qGKLZVpG5t3zReLDvCykAJNaD6aULEwWyW7hJQVset62YIJCJAkPBzwG?=
 =?us-ascii?Q?VHXem6qbqxsrJTFfdXdkrW/9u4PMC2x0AaGffdP8YZLA17LlNRzKP8uXEqKc?=
 =?us-ascii?Q?Gfi8lQWf6qnWmCFWHS3JR/pn4p0Lc0G3oYRhFstiz970ive4DAlfiBOnc2vy?=
 =?us-ascii?Q?TRaFiiX71OB3hzOOI8VZv/3TmFfqVHgMQJT3mgS9GBgUG6U85IPkI2S35DcV?=
 =?us-ascii?Q?js/xjfse9Iyd4pbRpKlq80cp7ynM0/KBv3cg5C7x7uHwgGAen7n07zn8SgUp?=
 =?us-ascii?Q?gVyxsII5AbncHGfmaHqJ6tF77OdewPW0K1h0vxTSu/HNMRjwclpofxQVtaod?=
 =?us-ascii?Q?UI5AvjqD6tqG0PL27TwL1x0Tel1fCJEieKT3LXB5vcOgteoQJQwE2FqeCTkR?=
 =?us-ascii?Q?EPkMfzPs6aEWRc75eKadjZIav7kn9Zn8fenR+PqOUkfIILOUYca31iByU//5?=
 =?us-ascii?Q?U9ogrQvDTxMFbV1ZddBuNXAJb3tNieMunnWW5BUrhDo30pxpDT9u2H+vTI28?=
 =?us-ascii?Q?mrOiEN5lN93aEn5D7UwXANv5yHpEUODhCsZrJXxtw6g6fENcVRWxGwv9nteH?=
 =?us-ascii?Q?BeaWJ1ypGA9jvB6w1OcXzz7dspf9H3mMYh1I2EnoH+Qjvo0B3PQJie70CvyR?=
 =?us-ascii?Q?tARRnpT2H3CS58obuH4SPugvNL2PODNl4r1kEGQuelcxgFFTf4xrHBIDiOxT?=
 =?us-ascii?Q?z4x1xiUOwMoGYk98Wwtzx0CRwjFQQ3KbE7Z9llAWNJv3gRkGjsExgB1MgAJO?=
 =?us-ascii?Q?LcHHJy4L8r4iITR8J1j9sx66egC2s51/0T4Kyo76CK1rqIh10dKUNpuHOK2b?=
 =?us-ascii?Q?26YWzG8S+CyeiXGCiIMGRY6z0Zb5629pS7Qc6MLaOrVAppgtOFXd8mTQQ3Nj?=
 =?us-ascii?Q?zX9TCB2Ww5ASUhHzb6xjBNElWYeElOODQM4GfcVBBaay7gRlu227L5od/4JJ?=
 =?us-ascii?Q?Qg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e895d7-abe4-4124-1fe3-08ddd59c312e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 10:21:37.5525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RlPO8XvZz6ZeX/2elSIyuTcsSfRSqhfFref2rpiYpvy24Py6UulDzFVMLxdG63pT5i8rCoc1Ait+4fz6UlYLZbzSmO75s/TyyEZ0UQQS/FU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF56FDAD370
X-Authority-Analysis: v=2.4 cv=G5McE8k5 c=1 sm=1 tr=0 ts=68947e34 cx=c_pps
 a=d1No8PtT6ZCK1EqvqO3Ujw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=D6SFkrhS3TBEam5PKoIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: i5X97G7gWdesGfFYZDl50mHdhHKtaKDE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA4MSBTYWx0ZWRfX60M6oPe5B6Ce
 HnKYcefNfkNw4ymlNEt2zOso3SJz1mbgU/yRSPv3FQ0BEfPNe/YVtya9C2VKuk3bXTaauEFgZG+
 9FOkw40Ss7wqK4rXYUZIin01c97Ee2LLveOrJ+LmQMipRcbC/qWLTvITj/BU5tPPJH4bdK/aQ6N
 ISgKd8TpitzDJ+senbstkGH2x2VixwvfQ8J5wu1Yk3Loki9hxDaTZHlT8gP1z3gOBOSbrcekjUe
 vz95rVS9c2OFrmjynTYRJw7IADlk0LwyPc2zY/rj1EfJUqOHaexeDFG8pZA7F7twUHKlNWI85fW
 TMzNQuqU+g+MFJo0x2BgjRUhmkDh6SsdvDGXLOXvxlmX1t//1dh8IsilkMzfWM=
X-Proofpoint-ORIG-GUID: i5X97G7gWdesGfFYZDl50mHdhHKtaKDE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Aug 2025 10:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118898

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Fix follow runtime error: ./build_support/src/sniff_mq_prio_max:
/lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found (required by
./build_support/src/sniff_mq_prio_max)

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 ...ndle-runtime-errors-and-return-None-.patch | 57 +++++++++++++++++++
 .../python/python3-posix-ipc_1.2.0.bb         |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-posix-ipc/0004-build_support-handle-runtime-errors-and-return-None-.patch

diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc/0004-build_support-handle-runtime-errors-and-return-None-.patch b/meta-python/recipes-devtools/python/python3-posix-ipc/0004-build_support-handle-runtime-errors-and-return-None-.patch
new file mode 100644
index 000000000000..f4608e6443b5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc/0004-build_support-handle-runtime-errors-and-return-None-.patch
@@ -0,0 +1,57 @@
+From aea0522262cc7e2374131f25116a59303fdca8e5 Mon Sep 17 00:00:00 2001
+From: Haixiao Yan <haixiao.yan.cn@windriver.com>
+Date: Thu, 7 Aug 2025 08:13:06 +0000
+Subject: [PATCH] build_support: handle runtime errors and return None for
+ invalid max_priority
+
+When cross-compiling, test binaries may fail to execute on the host system if
+the target toolchain was built against a newer glibc version than what is
+available on the host.
+
+For example, on Ubuntu 20.04 the following error occurs:
+
+./build_support/src/sniff_mq_prio_max: /lib/x86_64-linux-gnu/libc.so.6: version
+`GLIBC_2.34' not found (required by ./build_support/src/sniff_mq_prio_max)
+
+This change ensures that such runtime errors are gracefully handled, and
+max_priority is set to None when the test binary cannot be executed.
+
+Upstream-Status: Pending
+
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ build_support/discover_system_info.py | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/build_support/discover_system_info.py b/build_support/discover_system_info.py
+index f6e6c8cbe6ba..a0be60e51e24 100644
+--- a/build_support/discover_system_info.py
++++ b/build_support/discover_system_info.py
+@@ -73,12 +73,21 @@ def compile_and_run(filename, linker_options=""):
+     # Utility function that returns the stdout output from running the
+     # compiled source file; None if the compile fails.
+     if does_build_succeed(filename, linker_options=""):
++        debug = False
+         try:
+             s = subprocess.Popen(["./build_support/src/%s" % filename[:-2]],
+-                                 stdout=subprocess.PIPE).communicate()[0]
+-            return s.strip().decode()
+-        except Exception:
++                                 stdout=subprocess.PIPE, stderr=subprocess.PIPE)
++            stdout, stderr = s.communicate()
++            if s.returncode != 0:
++                # runtime error
++                if debug:
++                    print("Execution error:", stderr.decode().strip())
++                return None
++            return stdout.strip().decode()
++        except Exception as e:
+             # execution resulted in an error
++            if debug:
++                print("Exception during execution:", str(e))
+             return None
+     else:
+         # uh-oh, compile failed
+-- 
+2.44.3
+
diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
index 8147e4108b72..cad140381344 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
@@ -12,5 +12,6 @@ SRC_URI += " \
     file://0001-build_support-use-source-filename-instead-of-foo-for.patch \
     file://0002-build_support-handle-empty-max_priority-value-as-Non.patch \
     file://0003-build_support-use-does_build_succeed-in-compile_and_.patch \
+    file://0004-build_support-handle-runtime-errors-and-return-None-.patch \
 "
 inherit pypi python_setuptools_build_meta
-- 
2.25.1


