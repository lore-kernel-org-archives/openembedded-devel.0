Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23AA2C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 07:12:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.45373.1739171567114149393
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Feb 2025 23:12:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=41361ae72a=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A6q2v7012787
	for <openembedded-devel@lists.openembedded.org>; Sun, 9 Feb 2025 23:12:46 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44p3e7sdb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 09 Feb 2025 23:12:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2IgMCAvgXRIPBSp6v/2SJ6vgnFWDjGLYyDOTwx7byOAH5LcBUp+kzptBbbW4b0x+Uydq9vkMAKIouPzCcZb/54hR5nf3zXAtfue7ffp6A8ln2QOCAtOUAjaJ27ovYEfCZePNhPQBXjsJaJtQMjmzRy90MElQLXhRM1ANdDhvHNDdn9mGiVuMUCncehlK/dTsDsMs0vwzvF99HJX9mJF+JvB2SAPyZr1jEb70hIdplHa15vb4xTlbm/KiF9P/S128pJrTZIQBTG0mYLU9QT1EJAEHU4PbEeC7SEBP0p4BqfM2v2u7AqrMJoybmdVVVZAW+hVlMwQWeQtIEJvf/zG8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHAz3an+qoWtu92ThBcUGcYxD/muziPeSMgf183/w2w=;
 b=OHJLHTq/WSarBro1fJf2aP7wvDPBc0tiZUM9+0+ga8WXSMgskXFBBofRS2R6GwIy55xOSlD0SjINiXmmmrI4PgtmP/yAmmZClRr10JhZgVQkmRUL2vo+aDzq7FZe73tT7RhOkPrevtbOZQdMiDU16J9LFcKpWDMn5y2hfbU/k4WM0+VgmeUdOoA5rlwoqTW7lt9HMv0EvZV3xOj9wDYvXUG+c97hOUN/xrAMUTm6OL1c5+UnqBI53lzWO5qzHGuL1Fw05CHmz9ysep+VoWSw1MBuyv0ZKCU0anEwDrvyJtMZ0IyLjOGhn3zLjJFtroFhgozre2rnfIIqmhGCJSTTGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 BY1PR11MB8032.namprd11.prod.outlook.com (2603:10b6:a03:524::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.16; Mon, 10 Feb 2025 07:12:42 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 07:12:41 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] opencv: fix build for ppc64
Date: Mon, 10 Feb 2025 15:12:26 +0800
Message-Id: <20250210071226.1880278-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|BY1PR11MB8032:EE_
X-MS-Office365-Filtering-Correlation-Id: a430c7d4-9488-4dfc-a346-08dd49a24ed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?syBcJzNqcoTRfaF3SGS7xxLFQSlPlABuTpaSmdYe6ay4MKmPL4/uOVr5mhLn?=
 =?us-ascii?Q?krW8BdgtPbJthH3Xp+u36ByEeZRwffK9ovS+OLpbpgGaeeTi8I6r0bURV49G?=
 =?us-ascii?Q?7Hnw+T+Z592Bkh/cQajYTfxgzNIHMsvwXbV/LSUjI59/RxMqNQu8U7yGnf+k?=
 =?us-ascii?Q?E7+oMrlSooKdblUawEPrTtbiMZEOFbsKcFJJI5zXJhnQXs0KJiYyl85qOmvV?=
 =?us-ascii?Q?NnCaubmsHvUMasYz7FDZlJwI3tbcLV51645ycXGb4li+qWhNTJS9ntr1+9Dm?=
 =?us-ascii?Q?lVXQTY8suVsyZxFAxofSa7uc1hVcSUdoqFFjmNjJXmi4SPwqRnK2M84GjDQo?=
 =?us-ascii?Q?Dsfx8eRWKizXmzigSrrAwcwzdIdC/2761Rczlz5Uf+MdiRihcE1jB7FaJuIJ?=
 =?us-ascii?Q?GzLftYbZ4XadjFu7uYwUB6UpgsqtV2Mu4tBTOqkgZmPXiX/XTUzpMpHCrBf7?=
 =?us-ascii?Q?uuS+0RFCtfiI77XsknTEyTvqxuraiFaXlSCM/lNWMmOq3fSxTkLXqTP+tsx9?=
 =?us-ascii?Q?38m3FccgWQ8NR82aF22sMfUw9M6yBkSbEW6EGNJAde7oXA/DVrK3QZFYH3S2?=
 =?us-ascii?Q?tXInnNANWKU00DExagL9mLxk6UmJQJkQeUjkUe3QZm0yNX6EiDA4RX4JdGsC?=
 =?us-ascii?Q?YoEQqmUiwumILzI2VpIzeNGoga7myCcxz8zPw0q0RFCuDMfBzDV8n8xYE+qj?=
 =?us-ascii?Q?CjYyjc6xMDSgCjNtoJMwKK4gX2isqRCl6t04ikHDCe3m4JfU1G+brTogJcio?=
 =?us-ascii?Q?hFyrZmn9GLEPjc5aKUmx8i+zgd0BtZ8+Da3SEZ+VAfcds3RpI+awKkagQdfL?=
 =?us-ascii?Q?IYXj9VCWkuQr6L0xyEiWy1RyJw6MM/awB1BQOGh3obXpT5mtWbec7ubv+uJO?=
 =?us-ascii?Q?Q59sRtIlbMLQAH8VZzL0itAkNEzoyFQMtNlXxOWi1a5IbOq/CJFXy0xVjj5V?=
 =?us-ascii?Q?hnzYKNOVmPKn5R0LUNXGGfroJDDfn9iRQZIo5Jx3e9AMuuTemEOUW7JSCvgF?=
 =?us-ascii?Q?vaisa3PvYwK5vWHxi7eVG0dBBvLgOLULMSZb32AuyQJJ5KC0MMjC/Tk7MI8D?=
 =?us-ascii?Q?HQVY2rg+SV7/30aO9xruhkYuiZqXyih7VS1SyfEoBZYdu0HpYO0ZiJBJmtH2?=
 =?us-ascii?Q?eQMr6Jp7wfIxR6t/15macunxkHw6QyAbbvUzxkwRfhKlDEr01IsaN76Nq7rJ?=
 =?us-ascii?Q?+kAstvlhLVlwd1CWtvyOcstwC/amYNMHcQv0UrCVbx/r2/0HWSRHWQ84T972?=
 =?us-ascii?Q?nrOpTUwyVGfABS180vIh1helMoDaU/HryiYcYpNihh7WDXHAxNSZ7TA1AyO9?=
 =?us-ascii?Q?FLvHgMcuuJb838nzJP/8kf6M8cd1VngwKwEKUq2NfJbefKxiuG3E70C7qvsA?=
 =?us-ascii?Q?cJBpm29BMVVZ4Gpj3cC+e9P3VZouyxFERQ69Pfu+8EQ7agJ2nA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7dGfqqLpDGRMFBReH9v8gEPMwrLppAqwUJX1GVlQCQHs0BEC4dC8gfpP26MZ?=
 =?us-ascii?Q?D2VTd6wd7HSPVbbkKZM4pLZnAxP8BqNJOP0fbttb+DunPsrodyYpycZ1ICVb?=
 =?us-ascii?Q?K17PWGP1SgVT9Z1JqTnewlRsIcgTX6LM5Aw0RnmO5tIGADMV1hBqtGTplR7q?=
 =?us-ascii?Q?Hx+IS/sx1+m+O5A3QMF/jsHkP7XYDdKepBgpk6oXra3Zt84BoCPUz3ONeBVR?=
 =?us-ascii?Q?pVT6Kvbb5UeHxGK+iiUoO3l1llgwGTQXp4fLxqGD/VXyvyY1xfFyWLRAd7fP?=
 =?us-ascii?Q?kln34QeLKBn5llguPRQePQL0Z2VJETPHl6boCatH4LIuDuVcUR/TT9wlAZed?=
 =?us-ascii?Q?bvZFT/HV7a1fANNmxCmAiDWzMR931i8ZojX1W7gMCSHToG62/wtxs7mGLPG0?=
 =?us-ascii?Q?n96EyFZpt/yJK0BvaWVvhujeT4iXjAGxRP6LptZDXm+Jbalj5nSVIEb+vS/t?=
 =?us-ascii?Q?FWMALz6Ya4NvDuAyVdQMzy/PASIabwTw6SOhsiEkRyYD6zYzBTy7iWZwuiC6?=
 =?us-ascii?Q?DaDb+7EYRMMdigDk0OivOMxXOBYUM8U8qFNK1D/czcODWMU9pyKjujp/1IcV?=
 =?us-ascii?Q?HCQii6beWF1rFe/Chfott/36Ni48o1i1hbSvElsZgC6PndwGP+QyDqr4ypAe?=
 =?us-ascii?Q?mwnFYBo7/GiWgC5tmgtsNx+oVcadh/xMvHUHeRVPShz1CYJlXeRLzXs/+4Fz?=
 =?us-ascii?Q?Qn13oKyH9CdLnj/vxFxd7vQDOnZrLWyrVipnzpnyi17hlsGanGHWfuxPciN8?=
 =?us-ascii?Q?NaBltdWfVMtaIfcdwwmImvulXPuz1aWx9HL6OrxNiT+KUqviBJxyv2lDQ56m?=
 =?us-ascii?Q?T8mdaMse0dgJxrQoxY6XiEmsrrmCLLhcX2DxYF0ylUbGitIrXi9MALqJgQl6?=
 =?us-ascii?Q?eSedKX+xdMPfpwOlitlzmAvF0iK9Ru5xZOho5OP8Jx6nkDOxbIeFUHHQPPqd?=
 =?us-ascii?Q?I99MoNWZis1mWtJAOUkbLGVSdqYxM5i/co7PsripQdhnLzdbI+o3Aos9GBb2?=
 =?us-ascii?Q?GaMtKZ+EwqNcM+W5iFZ/ntm4SFAL3hP129ekQc6BtOFA5lxi/nWZ33/TqE57?=
 =?us-ascii?Q?KOAYhpmDyL1td3T/qjFXeeNz1DMFlOuW8ZcFWbr+sjbCTGjrjsNVMCK2/K9f?=
 =?us-ascii?Q?nxGjbN3NbB+k0cjQkOY+WYYBJo0EQ7n1Sat6dPQdqQCMpJWSzNtcsPmOjfDn?=
 =?us-ascii?Q?ECF6lWYqPkGRMbOam7U+FffWjhmt+Z2xaQ004FzHdn/o3NxBTuXxrwUBHfU2?=
 =?us-ascii?Q?vg9G7ntZEaiypIxfKSnxIjkZ81ZCpZyXjiFzf+oGBEdmcOePez8pV47rHFcE?=
 =?us-ascii?Q?cohOt9Cr3pri3ESBXCDYcrczyzc6AAbPfKSXsbOR2+GZE94NRbrmwKdniAh7?=
 =?us-ascii?Q?3uzYJ7Jmvp/U0F8EgHK4c3dFandvkVd/gfyDBKVzhiHUmQNDnBnpca83DVGY?=
 =?us-ascii?Q?w6oYhKXPwuqwl2J7iGThsd5mAYcvZvNqU6MsOgLSe2+yZfxGPlGy0yVJZOdc?=
 =?us-ascii?Q?6/j7duJlpe2bg9BjMFTwT/I76h+RJonFWVzjGYwi5LO+u26/U0kxkO8BUtKF?=
 =?us-ascii?Q?gbgUbxse3fTYCvsNLwZo1o2fe+cZH8oA5wDZ00l6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a430c7d4-9488-4dfc-a346-08dd49a24ed4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 07:12:41.4132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0waDx7gH3jxJ2QwExcMRW97tE0jlRbCY1eFDnFx2waeZlZXVa3Gpi2ZZKdYITMhOGgcselkLYWm+W7t9rl4u0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8032
X-Authority-Analysis: v=2.4 cv=IYN9WXqa c=1 sm=1 tr=0 ts=67a9a6ee cx=c_pps a=G+3U1htxrnhIFlrbIuZW0A==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=UVX2MwVSb_QFMipKZ9UA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 8622OjQrZHx-cisHP9_swx5MjnHT2QaO
X-Proofpoint-GUID: 8622OjQrZHx-cisHP9_swx5MjnHT2QaO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502100059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 07:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115326

Backport a patch to fix build for ppc64:
modules/core/include/opencv2/core/hal/intrin_vsx.hpp:265:75: error: expected primary-expression before 'v'
  265 | template <> inline _Tpvec v_setall_(_Tp v) { return v_setall_##suffix(_Tp v); }       \
      |

Also fix QA issue:
ERROR: QA Issue: File /usr/src/debug/opencv/4.11.0/modules/core/arithm.vsx3.cpp in package opencv-src contains reference to TMPDIR [buildpaths]
ERROR: QA Issue: File /usr/src/debug/opencv/4.11.0/modules/core/convert.vsx3.cpp in package opencv-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-fixed-VSX-intrinsics-implementation.patch | 61 +++++++++++++++++++
 .../recipes-support/opencv/opencv_4.11.0.bb   |  7 +++
 2 files changed, 68 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-core-fixed-VSX-intrinsics-implementation.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-core-fixed-VSX-intrinsics-implementation.patch b/meta-oe/recipes-support/opencv/opencv/0001-core-fixed-VSX-intrinsics-implementation.patch
new file mode 100644
index 0000000000..9fc89e4244
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-core-fixed-VSX-intrinsics-implementation.patch
@@ -0,0 +1,61 @@
+From 97f3f390661f2fd1168336820b89eb4383ce8528 Mon Sep 17 00:00:00 2001
+From: Maksim Shabunin <maksim.shabunin@gmail.com>
+Date: Fri, 10 Jan 2025 18:34:11 +0300
+Subject: [PATCH] core: fixed VSX intrinsics implementation
+
+Upstream-Status: Backport
+[https://github.com/opencv/opencv/commit/97f3f390661f2fd1168336820b89eb4383ce8528]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ modules/core/include/opencv2/core/hal/intrin_vsx.hpp | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/modules/core/include/opencv2/core/hal/intrin_vsx.hpp b/modules/core/include/opencv2/core/hal/intrin_vsx.hpp
+index 2157e1e870..0a0915a22f 100644
+--- a/modules/core/include/opencv2/core/hal/intrin_vsx.hpp
++++ b/modules/core/include/opencv2/core/hal/intrin_vsx.hpp
+@@ -262,7 +262,7 @@ OPENCV_HAL_IMPL_VSX_EXTRACT_N(v_float64x2, double)
+ inline _Tpvec v_setzero_##suffix() { return _Tpvec(vec_splats((_Tp)0)); }             \
+ inline _Tpvec v_setall_##suffix(_Tp v) { return _Tpvec(vec_splats((_Tp)v));}          \
+ template <> inline _Tpvec v_setzero_() { return v_setzero_##suffix(); }               \
+-template <> inline _Tpvec v_setall_(_Tp v) { return v_setall_##suffix(_Tp v); }       \
++template <> inline _Tpvec v_setall_(_Tp v) { return v_setall_##suffix(v); }       \
+ template<typename _Tpvec0> inline _Tpvec v_reinterpret_as_##suffix(const _Tpvec0 &a)  \
+ { return _Tpvec((cast)a.val); }
+ 
+@@ -650,11 +650,11 @@ OPENCV_HAL_IMPL_VSX_SELECT(v_float64x2, vec_bdword2_c)
+ #define OPENCV_HAL_IMPL_VSX_INT_CMP_OP(_Tpvec)                 \
+ inline _Tpvec v_eq(const _Tpvec& a, const _Tpvec& b)           \
+ { return _Tpvec(vec_cmpeq(a.val, b.val)); }                    \
+-inline _Tpvec V_ne(const _Tpvec& a, const _Tpvec& b)           \
++inline _Tpvec v_ne(const _Tpvec& a, const _Tpvec& b)           \
+ { return _Tpvec(vec_cmpne(a.val, b.val)); }                    \
+ inline _Tpvec v_lt(const _Tpvec& a, const _Tpvec& b)           \
+ { return _Tpvec(vec_cmplt(a.val, b.val)); }                    \
+-inline _Tpvec V_gt(const _Tpvec& a, const _Tpvec& b)           \
++inline _Tpvec v_gt(const _Tpvec& a, const _Tpvec& b)           \
+ { return _Tpvec(vec_cmpgt(a.val, b.val)); }                    \
+ inline _Tpvec v_le(const _Tpvec& a, const _Tpvec& b)           \
+ { return _Tpvec(vec_cmple(a.val, b.val)); }                    \
+@@ -1507,7 +1507,7 @@ inline v_float64x2 v_dotprod_expand(const v_int32x4& a, const v_int32x4& b, cons
+ inline v_int32x4 v_dotprod_fast(const v_int16x8& a, const v_int16x8& b)
+ { return v_dotprod(a, b); }
+ inline v_int32x4 v_dotprod_fast(const v_int16x8& a, const v_int16x8& b, const v_int32x4& c)
+-{ return v_int32x4(vec_msum(a.val, b.val, vec_int4_z)) + c; }
++{ return v_add(v_int32x4(vec_msum(a.val, b.val, vec_int4_z)), c); }
+ // 32 >> 64
+ inline v_int64x2 v_dotprod_fast(const v_int32x4& a, const v_int32x4& b)
+ { return v_dotprod(a, b); }
+@@ -1518,7 +1518,7 @@ inline v_int64x2 v_dotprod_fast(const v_int32x4& a, const v_int32x4& b, const v_
+ inline v_uint32x4 v_dotprod_expand_fast(const v_uint8x16& a, const v_uint8x16& b)
+ { return v_dotprod_expand(a, b); }
+ inline v_uint32x4 v_dotprod_expand_fast(const v_uint8x16& a, const v_uint8x16& b, const v_uint32x4& c)
+-{ return v_uint32x4(vec_msum(a.val, b.val, vec_uint4_z)) + c; }
++{ return v_add(v_uint32x4(vec_msum(a.val, b.val, vec_uint4_z)), c); }
+ 
+ inline v_int32x4 v_dotprod_expand_fast(const v_int8x16& a, const v_int8x16& b)
+ {
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
index 07b3a9d9e6..1613b6a3ed 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
@@ -31,6 +31,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=4.x;protocol=ht
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
            file://0008-Do-not-embed-build-directory-in-binaries.patch \
+           file://0001-core-fixed-VSX-intrinsics-implementation.patch \
            "
 SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib"
 
@@ -208,4 +209,10 @@ do_install:append() {
     if [ -f ${D}${bindir}/setup_vars_opencv4.sh ]; then
         rm -rf ${D}${bindir}/setup_vars_opencv4.sh
     fi
+
+    for fn in arithm.vsx3.cpp convert.vsx3.cpp; do
+        if [ -f ${B}/modules/core/$fn ]; then
+            sed -i -e 's,${S},/usr/src/debug/${PN}/${PV},g' ${B}/modules/core/$fn
+        fi
+    done
 }
-- 
2.25.1


