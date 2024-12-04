Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 690D8E7716F
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 07:52:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8885.1733298729964584739
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Dec 2024 23:52:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=20682f46d1=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B46D323023644
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Dec 2024 23:52:09 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437xv7v920-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 23:52:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9EZ7+TTyUMkAD7sd+1DpNK+qYjZNRzl9TGPIUHCIs+PVDRQpWtA9qBaHlnyhwWtVL6dfX7wOl4l17BUiLD3T4cmyTizoJb76xJdDjHg+xH0MmpdQNnP9V50Q1FyR6VpR6suTwyetXA8Mk4GuIIrgDxyRZaVWuVrHYxRKpK+vp+0JE0+zsXFb8mOKWcwERrQgApYcjaXU0M/BTgaBnd5RILMijoM2r7FhckPwtk5xIrTakgMSsUAM4DR3ZqqkQjH1khvnBYvoWHD+H1EZTegNZkOBcJ06l2PWdmgo1pwFcga9gkLoZ3ohqMG+Zq3msEHObnsd+GNvC21w4kRAmAzVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEwuKuNCuLZWyHr0uhuIRwjq5bhahcw2dm4ChV39oYU=;
 b=dSguk/g2LU335znFMH48yYHtuMfnAgjvqYi7IXKbjTvmOGPD7DWyilCIGnSpTi3aG8ukndZvunq6LJIBHffu5g5erHDhptiv+O9AUxKSSELRa/Uif6L+frd9rZrjizb4Wk87VokA8c5lQvQSi4pXzw64DpkfXs0tsfuxgpvZCBy7xV5sLZkyLp4F1GzhXi4L38SPSVxv22dQA7+nq32b9s7Q5mcB/IvZGR09ZQo5dbf/rS0F7L6qnA2B+ULqBexBPjfXcsBl/cFA1ixWWLGtjqzpdKl0ieSo0XzwvVf2BCH6MTfuRwopCqSErfjN0bnCmX5DixoT3AaSxVbjUymiwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ0PR11MB6573.namprd11.prod.outlook.com (2603:10b6:a03:44d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Wed, 4 Dec
 2024 07:52:06 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 07:52:06 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] lastlog2: remove leftover patch
Date: Wed,  4 Dec 2024 15:51:55 +0800
Message-Id: <20241204075156.3811134-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0085.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ0PR11MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d20dbef-b20d-4626-bf4f-08dd14388c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0QpF+qF9TpZtGa8MqgJldiUhN593lEY/AgGmRWkTwemflbW1oph40c5mNtiA?=
 =?us-ascii?Q?vOWEfbLgJghKuPP9t8i6heJYYJMOqb6rZ9tE67EyrB01Gr4uqgMvSL2xO5hp?=
 =?us-ascii?Q?CRWVgqPoPMNkFvGdDN0dRC7lcdwom01GFdQVRMELfmj/qUGf98DmahWlzJ8t?=
 =?us-ascii?Q?cZoG3PFxeEBvGPn8vMR1covSdXljbrhtQc2b4uIzgHSTtyxh0c1QhBWzIWQl?=
 =?us-ascii?Q?1Z9lre1XLZ0guUzBIa+SKsqHd515Fz5si+Kl+j9sm1es3172bISKP7zv21X8?=
 =?us-ascii?Q?KokutEd908SfY1Y4M4vVZvMVSA3kxe/mVvJ/rihkAsqUljaQna55RgCsjJtD?=
 =?us-ascii?Q?kABtOhqRKj5Op8CWivbRvsH245Agph0bN7UFsFKA4Z6jjrdoPwXpTUSF2V+s?=
 =?us-ascii?Q?xkL5SmXzi22dnQL/m6GSMGA49kn2EAD7of/OvBBOu6+Vjb+y2ysogptQ3cFY?=
 =?us-ascii?Q?VHWIKF818eCwGzPbhmHpIs3yxlKwDNwYDPGRfxPPgRScayDICzrpOTB4EbhZ?=
 =?us-ascii?Q?pF63+1e/SnkuoIWqtJlUqEk8sx7Kk5F/J1/vPTa6oT4WhBHmvXupihZxDAG1?=
 =?us-ascii?Q?xxRl5YZxQHw5cPkyCSZn0bj+AoF5q7sC/YvQLb/+l5CGu2BLdwtoYEggIVNB?=
 =?us-ascii?Q?xKVXHbFEtS3XsQ+/XxRNdERy7l7RtMEImXKFXvek94Wdp7xlhS1a7kyp0oLN?=
 =?us-ascii?Q?+KQq4pjMA0AaDq1mu55SsGUoIZ2XWErFUD1zHDXDNThBU4ehYWlV2OsUWqjv?=
 =?us-ascii?Q?swdfezdrIVdCPSX6A5kv9xUQux39zuytY/9ywvScM1s1szTuN20akYODO/Sv?=
 =?us-ascii?Q?SZTkAE1PfMvUUt6Z0lFWhXPJ7hfqiDl9WGl3bMczVUoHI4i0RkXVXoVazPcP?=
 =?us-ascii?Q?9ZH+YWcZAuU4QvbJpL+hZv19Eaulp7AETv5NDc2jvtKrRhYY+QgeYMx9obGN?=
 =?us-ascii?Q?FV0EwM8N0PR6L5VxVwNOfumFTHWRbndQmt0I/Hc3bhL/ifqTyNpKs1Q/4Zj5?=
 =?us-ascii?Q?g8jxdbdQMsS4WBFVL6GLT3KTrypFJKMnlQ4uOtjziME7u+l1lDocNvq8NapU?=
 =?us-ascii?Q?wyrwuj9E1lRKJ37q808TejpWU7TanZ75dLDacyaWvioFbvyRu+3iq9OKsncv?=
 =?us-ascii?Q?EYLd3ZMOzqmJA1oqcdVGRrQDizMy2lsdGf9ZiFIaR/TrLe/aaFoR1nCDQEvK?=
 =?us-ascii?Q?044Strck5lQHHEGyNA9rKr1B0kKyNIe0VKkAHGYMJV343Jf/P6Pz17v1W1l+?=
 =?us-ascii?Q?YJlMXQG77nGhKexQjv7+vqKaFJ8BwrsXKHkIz+fh1fmU3M1Cczq5ojl2xjSq?=
 =?us-ascii?Q?vs5fh8N5yHrW8CFV1cnEj6HA47TNwDFb4qGomn8WDFsO9mWFWqGTu87RHmS7?=
 =?us-ascii?Q?/c6yI6rCLux1TUojixOyPW/qZZCTosoRJGOp7KiKs7rMsFvH0Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1k4IdJF9Q+on7v4AnaDQTFcmiMw6TTgjWyX1hqQJFuveU82fL4FHpgrTs1ax?=
 =?us-ascii?Q?GILPMXI1bCLIFtgvSUXUEwJUvydvydNL910Fh1kLnvPMQCFIjfvHAkuXhGxN?=
 =?us-ascii?Q?iNFbLTkszUYkTtaOegAKKzdX6+luvMVwLHCe8jxSxSc1KdDROiFfEH4KOrdF?=
 =?us-ascii?Q?FIIyL/GFc7z1rx74m+YDukf0+kzef7K4Klp+m0eYtcEcWFUtugtIjVaoUVeo?=
 =?us-ascii?Q?ogXYb1MEj/xzGj87h3yv/UZV7BZwkKY/vrJxSo7ZgBn0LxoC0riU9Bkd/7Vb?=
 =?us-ascii?Q?+YVomQ6vh6a0nvn9jaLBmjqTcjlcy3QteAKMXUWYA+Ugc004ijixPRzf4IZr?=
 =?us-ascii?Q?Tgdu+2wiuEBckbhAhWMtrRKedCdtMpLhExRDbrfkyi8E3QeSVuTLi0+qZMLr?=
 =?us-ascii?Q?+kWkjbg5/6TSebK1t5GK9Gza1M8/j+D6JV5kFID10D/B7zk2AyC9u4qYMN1S?=
 =?us-ascii?Q?pwzxVyrmTgKZbN+n58NKxXcjluqv28RclT0lJvA8wck3fHM+7/UwtB/6Kq+q?=
 =?us-ascii?Q?pv46GHomvmwhJV7dubUGGwbGY7DLubudM3uVLLAiEzs0UBLmRBGyQyEsbIYJ?=
 =?us-ascii?Q?fsr57KU4AqMuTS1Zni0neNcArnSgJBW5icmbN+FUNlBzAGRZmYQ4cK3j0Zot?=
 =?us-ascii?Q?ZpKX6kTWzu62w7vpq+wUo4+MO7xq3SX0w0cY8yoZtH1F6iiKVaaDeIG7PAtW?=
 =?us-ascii?Q?2dPgAnXpzxG5v4kvlvhqlUCMkdg+v6Apk7h1XIkniN+FHV23dYLFsPPDemC/?=
 =?us-ascii?Q?8E+u60UTeNzvOO4lxfeuEf5fFmjMPS1eIb0sgSZHShwEbuiHhjSNilw9W8Nn?=
 =?us-ascii?Q?duB3PsnvAdFu28XdTggdg49wtU0Gdnsb2oYhZhottZac+2nvLKf26PsAK4sz?=
 =?us-ascii?Q?IKbWynBDlrw+iWn6YYc03NP1jo4Lux9xn5OC0oiqLROzEQwD8qzoe0cmQvoz?=
 =?us-ascii?Q?SV45gI4MnAg8e+661aEJY9mQvX2wYAuYyK4uJgs384TwmyjssCHeUwTSB3es?=
 =?us-ascii?Q?3YBEsU78sD1rQt1zwE3jLsfSi71ebDQTxc5A0RCqz5C2qmsOsMw8WG10HSVy?=
 =?us-ascii?Q?GSATKD67P3kfPmDpTaOe3AGbGeX+r6LOaZgXT03F53Sf70I+vns4k4iaiN9f?=
 =?us-ascii?Q?0B/U80sDUdRoYlpmdbDHS7OEwMndTyCleeSDEUzVg65dU4Yiwg5qAWWzU/2N?=
 =?us-ascii?Q?Iu8GVukwGTs66bjFwQ8/cdZat06yVp2Kicpj+ypX4CJoDjqNBbMYj0jmyllQ?=
 =?us-ascii?Q?bBtr0bZklAvh9Q9AjzuaiVeOaRJDesNZ/DGhA0kLe2zY77SxiL/q0YUKlc3L?=
 =?us-ascii?Q?l46W8u94C+nYdlWFHJHxq38YxPC4RvE153013f8wE4OU2esE7ircosnfBdu1?=
 =?us-ascii?Q?LFk3cDj59Ynz3o3+Ex4rYn+lB3RmL8BwspC64NBK93BWBVXmqrN1bvYFAeKj?=
 =?us-ascii?Q?xRtXDyee3kMuDmfh8Uq6roPGDCo+7vQxncWek4t5rsJVFzJAUWBPIrnyKSGy?=
 =?us-ascii?Q?CqE/4JgnKAkOKf9OS0x8xyo94L1TYTK3NOgOOCpIDHd6z0UG2rIB5CRtDVaS?=
 =?us-ascii?Q?i3YCCc2doPgSfdRAIbY13KcEcHn/kBYRyWTaqLJN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d20dbef-b20d-4626-bf4f-08dd14388c20
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 07:52:06.0349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kvu8uz53tS10m02h9iFwyWYuGrEcYC943FuuPOHRLvwGdIJbn1G9B2JXL1gMLQIOtgA38v9Iisd9qQLegUeNRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6573
X-Proofpoint-GUID: HFhpmBOWfXeHm7CIwjsowfuG0-0Eb2gX
X-Authority-Analysis: v=2.4 cv=RpA/LDmK c=1 sm=1 tr=0 ts=67500a29 cx=c_pps a=b6GhQBMDPEYsGtK7UrBDFg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=omOdbC7AAAAA:8 a=j53JfvzYLTSlhgR7efEA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: HFhpmBOWfXeHm7CIwjsowfuG0-0Eb2gX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_05,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=825 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412040060
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Dec 2024 07:52:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114194

The lastlog2 recipe has been removed in commit[1]. Clean up leftover
patch.

[1] https://git.openembedded.org/meta-openembedded/commit/?id=9f818a060516b6d0f0b437f5891affc1ab01a3b4

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...emove-lto-to-fix-link-error-of-clang.patch | 31 -------------------
 1 file changed, 31 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/lastlog2/files/0001-remove-lto-to-fix-link-error-of-clang.patch

diff --git a/meta-oe/recipes-extended/lastlog2/files/0001-remove-lto-to-fix-link-error-of-clang.patch b/meta-oe/recipes-extended/lastlog2/files/0001-remove-lto-to-fix-link-error-of-clang.patch
deleted file mode 100644
index 71c3de974..000000000
--- a/meta-oe/recipes-extended/lastlog2/files/0001-remove-lto-to-fix-link-error-of-clang.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 692523d2f8bf0ce893a781761154db4277f0fceb Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Wed, 19 Jul 2023 07:11:15 +0000
-Subject: remove lto to fix link error of clang
-
-error message:
-| tests/tst-y2038-64bit-time_t.p/tst-y2038-64bit-time_t.c.o: file not recognized: file format not recognized
-| clang-16: error: linker command failed with exit code 1 (use -v to see invocation)
-
-Upstream-Status: Pending
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- meson.build | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index c521577..13d993b 100644
---- a/meson.build
-+++ b/meson.build
-@@ -26,7 +26,6 @@ add_project_arguments(['-D_GNU_SOURCE=1',
-                        '-DPROJECT_VERSION="@0@"'.format(meson.project_version()) ], language : 'c')
- 
- possible_cc_flags = [
--                  '-flto=auto',
-                   '-ffat-lto-objects',
- 		  '-fstack-protector-strong',
- 		  '-funwind-tables',
--- 
-2.34.1
-
-- 
2.25.1


