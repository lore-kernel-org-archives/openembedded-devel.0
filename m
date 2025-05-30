Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C821C5B552
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 04:43:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3858.1748580177244432172
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 May 2025 21:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82456d971c=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U3vqFg006910
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 04:42:56 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u53964vs-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 04:42:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MDP0O+7zo9reCSgU4Q8w6yim/mhFz49YZ4tS3RiWFFGNVTLe2j6G0qAwbcXhW3YwExgfd/OXIj5QM/EDNKF7LtOvFrPW7SmuR2tVQRsyp7qtAqTN+dAJ2rH2jYfVip2XWAW+dX7GeFffS02j9T2zyVJhVAa73JPQTZaOw/fkib6gcmRM3UiYX85+x4ETicmG0rlU+2n2LhOq0XrWGfiuDeraPhYYmXE8ZpOAr5S6s+UUCl+56hepmwspw/Fr6lMqlVgqTcGhGSnUqIA49ll7j6AKAGJPdpsM5NZj+oW4yIYQIv0ljQltnbnWq4mwGdfilEVdImQm3s+uWgDKEIlQ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9sF/ElaWuY1xKB2hmhC1oUvXByHgQ6A1ZzJQ1xwrC0=;
 b=Wd+7om8JFkI9lifVLI8lZazLad3yMFddeR5BAPT2teyXJ6OBZjcagCW3un8navkzMIuX5Xakaho3QmWs1Bgvsr5T2yvCPLfAUi+psG2lJp9Rz4C64Y86xcMrMjHhoYPOatsVeaFNgM8YUn61nkbXeSk7aGRWG/RBsg/JrSESOIRj7rgjAwt3C8gjKx3ThASNEyj2hzOcqKtlCQZzNAH9cFmdSsgmIamQP02NpuN/VYlhbRQIfDJ2gBvH66IJ4A9oG6wkZf7tt4WDcz4YGE8lYCP5xCqjhX5pP3UeCW3UwaZfi3ehO/H3q1h756cCv1uWyR69gdiQqijDAfwBdoJ2hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW3PR11MB4762.namprd11.prod.outlook.com (2603:10b6:303:5d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Fri, 30 May
 2025 04:42:53 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8769.031; Fri, 30 May 2025
 04:42:53 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 3/3] check-version-mismatch.bbclass: use oe.qemu and add QEMU_OPTIONS settings
Date: Fri, 30 May 2025 12:42:24 +0800
Message-Id: <20250530044224.2445187-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250530044224.2445187-1-Qi.Chen@windriver.com>
References: <20250530044224.2445187-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0024.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW3PR11MB4762:EE_
X-MS-Office365-Filtering-Correlation-Id: 965836d8-5daa-46a0-aa8e-08dd9f347051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jwd12Ce7anAU3tVMnMNbX7UmAL/yeW8LfH3ZeQGJwuSuW+UOdemm5J4m8nwN?=
 =?us-ascii?Q?Zeqgr31BGFnLmlCG1oCL3/zRiaiZwKxfPkQ9cnqecx9hzNQFkKY78nMBLqff?=
 =?us-ascii?Q?k8gsKTURNCZNOI6+4j+hUttsHGqHuvbDDdJ4/Zi0xy5Qm5YlxtLo7KPlSFa5?=
 =?us-ascii?Q?AVnrGOlm6t2gR52y4316vJiCthEwukwby3Ckxl6wLpbLTSpPrL+azCsfxWwo?=
 =?us-ascii?Q?2JOtF8P3/j145Y/lU/VE3jmei6C7+yuvNgSSyheY0oyxAbLxByHTJwgBpc6Y?=
 =?us-ascii?Q?GVxtQ4QQ04ButYmXr8/5nReMD5BrcJwfigptI8tqbB+N/aykkW++vgCRt0BP?=
 =?us-ascii?Q?4nMGv0AJlza/tCGMc6xwULavOsds6sHPqWkQgs/BKvP6aLqtiDITi4rdC5eD?=
 =?us-ascii?Q?ApKzHd76oaGk3JAizmuVytbTbq2lnf1T9/q9C67TVbvLHys3zDT25TcQ41GL?=
 =?us-ascii?Q?dQ7dEaH469V0CVayqYrpnqHDOpjqY0nHa/iKfKv/lzRjlyFvOxciET+FC4Jm?=
 =?us-ascii?Q?FljTqzWAJec4mcIuJLPZJmymFwLspJ4DxukFNBTUtTuHnq8oSRjxjcB3wuVp?=
 =?us-ascii?Q?MgnDghOQj1gw+J6BSj3rGC/E9/lJBMmZ+51VU+INxK1tmuITIZzcKtcXXwGr?=
 =?us-ascii?Q?lhF9+rx/NJetdK6SUNX6i3SLpfqrQwizcpu5KUODJUjJ4C1RxOgO1zhiP+kY?=
 =?us-ascii?Q?kmpRGm0rcsQDf2R2yyJoav9Bo3OuGwvARegauimUaQnvVePWe5lpGHzXztPM?=
 =?us-ascii?Q?Jd8J6LnSyTU3f1qfiLdlqzi85F5x8XjCsV8zy3WtOxyy+TRtArGOWjJo+H2M?=
 =?us-ascii?Q?pFS4sBJyUNXh8xe4TFouzaSyOpfuIOB8RGFTQWHDq8UhYnhY8i7LFSbPrF/z?=
 =?us-ascii?Q?0XfbapEddRDEWmXvtDqntsvnZzRHBoz4QLZiU4C+Ns1Kn9RGHre6Y9KLCtdf?=
 =?us-ascii?Q?xU4qsBU36Dy3afhV00OjMd87F/4VmGa9YQhfNPXBy0FdCpKbrSErCC1SZP29?=
 =?us-ascii?Q?2Ey7vFI2cUpL4Fg70Kjtmy+Y5N/BwQ4HUg4x6lj8MutO3Z8pCsP0wc1h4ddO?=
 =?us-ascii?Q?qMTLGIROZZzslEVGc9VVSEVpXkWOmFbi5/ni3q1ycXu3oQaodMKRZQSYBPOj?=
 =?us-ascii?Q?QInS1r7RWSErN0w6rIJj6mopJTuNI1ugZIZVSNVeH29U5U6Zw799vy9KCgya?=
 =?us-ascii?Q?gGiExgnu8+gJ6JNGRolfj4G57pzjoSdrR0/W9vbsr1zPm/EM/afZBq+OmrdR?=
 =?us-ascii?Q?s/KJ8xpUg0XgmxQdSGis+aFqZGNM9K9hwAOcGfNV2U2fipoNQ1aLzWX1Vf/a?=
 =?us-ascii?Q?Bfupvv0YuPzpifeJVPH9A8FOrsydrOeFaL+CeYXUs0Hnf4waNPPMZyTv6jeS?=
 =?us-ascii?Q?eLYh5B8TUTEHHXs7r9nKd9MYbdAspnNnLnxMBxF4IKFfgtuAYAkujg2sTO9J?=
 =?us-ascii?Q?sohk4o/jvBynFid1VHynjBBILevWsoz+Xo4LLaaziY8zr+C+P45NCQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i6ayPYGVsjUuz199vx2bBPLJKRjPjxwV7cCboyS2xI1lvPrZxtKY7U8jZ/dl?=
 =?us-ascii?Q?yW/hInFUaZkSKEJoHSlQZcsB+u2O6sAFve6mNKsLGvt0sgobYDgO84Vk3aMq?=
 =?us-ascii?Q?lBbKdpMMBElh7sJoCOH5zfA5/AG4TU3jYWyKWCodTGGWNAPxQv4ma/srIHvH?=
 =?us-ascii?Q?8kSrGwixAXm8XxML6HtCNilXMiysEAwIio6OXalr3JFJ0XNnZPI2KVH3BF+R?=
 =?us-ascii?Q?qfmB7KsTagz+hZvwwOm94ZRUWwhd5eweOLCnLxgaepfqiBo3v56b0puuCThi?=
 =?us-ascii?Q?o7MhgjikYYUFrmy2zD8AUS0sv/6YOAHj0T1Q3N5Gmk5VBOJWQToIKa4boLL+?=
 =?us-ascii?Q?/TXUsqS7QqcXV+OizfNuA1q9YZMeVFIQKUgXKwA5htBdl5Dh83rzVIOx+TTL?=
 =?us-ascii?Q?+MDbVWVnWlVXbtgbOoFxiMSKsUgA/odHjY2vlqaK4f8TVLn/t6GmKGtA5AlV?=
 =?us-ascii?Q?X/76XCrAP+R0AN7RPPmqO70qLmcAqdEvtQi/1NFYmAclJqfMn03RpQV0NtH8?=
 =?us-ascii?Q?8/bvAdzPfCfHvbwXEBY2fJFyAnQeohHTrBoukN7V1jtpaAJF6lgwdSEnJIfM?=
 =?us-ascii?Q?/dUp3+vtuavbqPS1auiwn6cecILDb8UeU5aZqcSsUSW+MMDLpq7oH/MxVK+O?=
 =?us-ascii?Q?/DJvc/L8N1bvKBh3nqwgIwY10JXqx6FThzcAmGtqNy2qV6JOTxkZq/gjXGve?=
 =?us-ascii?Q?PflFIRSclgPUzTMdPEGbgSB/zb/crMpJbdsBW5560XRhQVxT6Hx5G/k7tAVX?=
 =?us-ascii?Q?IkawDQiywkjebSICLTsUVl9RBiEuo3xkYh0RZizh+9VKQQGYd1ayVExSSjTi?=
 =?us-ascii?Q?4vXMmelzksuFbsSqXcIp1i2AaDr/Ems8mSkhEfdX7xpJ7mFX7P0t248ZVvsI?=
 =?us-ascii?Q?u4gYHU3JeubjCjakaAeE/uPZK3Nyhwf7pyPcjLyyEv4f0RQD0czYjtwAXg7C?=
 =?us-ascii?Q?7U/F7XROuIOBOpvGlYlF+g3K26DZm6tOOpu9GabKXZ3w8o0Y8MlRtyuvyRVu?=
 =?us-ascii?Q?osW7ed8XNHyxlrXAvchGOBnhg5Laey7q3ax3kCKnRqnhJ050r8ELlL7R6q6j?=
 =?us-ascii?Q?eRNTUCgBdjch7fY1Fp3w6H8+d2otMjqlUsJo+eYFcrHbQtfoGW+ikoiCaxLy?=
 =?us-ascii?Q?y7/djS7B+kDbOu0uXRm6EQ0uFUTMcQ4adxuAuT/aX6DtJexNyQMUbyLuYx9p?=
 =?us-ascii?Q?cgQpzDv4EM8Kx/MPi7qTODRKVdp+ZJ83qpFjzXZHZELEZTmJI+wL8vP1kbG5?=
 =?us-ascii?Q?3U9V17vQW5I9L1kao1r9MCw3nhEH3t+oOOKjGBN1X3BBATAdViTvrecucJSD?=
 =?us-ascii?Q?t4u/jj+7nEe/6b2GLNobTlHOro9L0jmBbhSZXc2gSlrbH6Mrb5L30jJk0F8Y?=
 =?us-ascii?Q?2OK0rY7MQPiTQoKrCWBJd22KNRH+Iafal4j9j6LJ2bkAPL4QUNR+v3Jm1KF2?=
 =?us-ascii?Q?vu+XTplUex37IQfKTG615ilWZNfPV84/rvKow8gaXIzjhITN2xmaD6rpevXv?=
 =?us-ascii?Q?sS+TzCVgZTULuo9/gYeFT6h4v4FvpqUPYkokhn1hGH3N3IPleVaLS37ekmHx?=
 =?us-ascii?Q?VQm/hBNYS6ZWkp96oE0S46bCtPt+GAr8/9nt/vEu?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 965836d8-5daa-46a0-aa8e-08dd9f347051
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 04:42:53.0877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qcby/t3Xi71t7pfe8AlRv0SNvQuc695sXPZIIw4iTL3vyfHHsIcGkL0lNBckSqZjMPTnnKL7xLTK3JxwyaJ6eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4762
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDAzNyBTYWx0ZWRfX10TPBAOw4cRi zEjG91M9oBLzBF4pAMCQGvemvKxD1THGbyYm5hzJ9a341P7EZXCOq4gG9t5j1Q1zUNJ241n8oD7 5oJmhLutU9sHSUxxVDlUFGwxNhb6tPjVspi5ei8gr3pUj1YwwrAq0ivl8gWn2Jjyx13VYFx1DPF
 3PiTDJDX+5gAdYQHwtaFgv+7giFmcnbKoTrt4e4WixrytQ+B8A+9qmJCwdzmYT9Abwf+rM87GjV jpDeyyqHWpi24RqHGxIf/oEXfSodGVSUEb+vzE50ohvq7Wsa+OgffK81X03ws36mXZOcMhR6Dnl pmbgxx3euNDz091Xz89V+M2vHSY+uMefXCpDCOSa1iZWIVjRRNXBlkbtV3n7QrNU/zlZnxFkaJa
 mSPQZ3tAoVB3Jkj7IiKFUDTbaIHL0U0ymsdjBWGQmtMU6j2quaNMVWBQghNZLdC0ZYNQgcK4
X-Authority-Analysis: v=2.4 cv=NsDRc9dJ c=1 sm=1 tr=0 ts=68393750 cx=c_pps a=39de9MFdLn04CM8BGbcX0Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=t7CeM3EgAAAA:8 a=l_ys9cf0aQn5Ayh1wdUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: dt2KC-Nj7NDPXSvgSHw3CfYS3ouXIUMD
X-Proofpoint-GUID: dt2KC-Nj7NDPXSvgSHw3CfYS3ouXIUMD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_01,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505300037
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 04:43:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117668

From: Chen Qi <Qi.Chen@windriver.com>

This bbclass is intended to be used via "INHERIT". The qemu.bbclass
is in classes-recipe. So we can't inherit qemu. We need to copy
QEMU_OPTIONS settings from qemu.bbclass and use oe.qemu to make things
work.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/classes/check-version-mismatch.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/classes/check-version-mismatch.bbclass b/meta-oe/classes/check-version-mismatch.bbclass
index 8e0b613162..f735280d7a 100644
--- a/meta-oe/classes/check-version-mismatch.bbclass
+++ b/meta-oe/classes/check-version-mismatch.bbclass
@@ -1,4 +1,5 @@
-inherit qemu
+QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS:tune-%s" % d.getVar('TUNE_PKGARCH')) or ""}"
+QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS:tune-${TUNE_PKGARCH}"
 
 ENABLE_VERSION_MISMATCH_CHECK ?= "${@'1' if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d) else '0'}"
 DEBUG_VERSION_MISMATCH_CHECK ?= "1"
@@ -6,7 +7,7 @@ CHECK_VERSION_PV ?= ""
 
 DEPENDS:append:class-target = "${@' qemu-native' if bb.utils.to_boolean(d.getVar('ENABLE_VERSION_MISMATCH_CHECK')) else ''}"
 
-QEMU_EXEC ?= "${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}${libdir}','${STAGING_DIR_HOST}${base_libdir}', '${PKGD}${libdir}', '${PKGD}${base_libdir}'])}"
+QEMU_EXEC ?= "${@oe.qemu.qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}${libdir}','${STAGING_DIR_HOST}${base_libdir}', '${PKGD}${libdir}', '${PKGD}${base_libdir}'])}"
 
 python do_package_check_version_mismatch() {
     import re
-- 
2.34.1


