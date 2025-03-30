Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD9B9C36018
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 09:28:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.27414.1743326898919140443
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Mar 2025 02:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61843d4d18=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52U90UHP024691
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:28:18 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45p7u8ryn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:28:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brmBJSxyqVVBM/O/KuEaymGHeR3nf0iJtNPtu4BfbFnSZHyr1AKGRB73qPAVT/9yTId375WFFrn/2pvEMPinWVX+BgZS/hzmY2gq0kWZWQe0ZzwnaDv96u+Fr5VgDchKXaf1mPwjLfueTtIpvqa0rd/7xmW/fhipZ2bxaPgZ5/xZCVcDvI9Cw9VIpm1aQ+xpm/StpZN45br7N1VjV4aa1+4bW8vP3rspXaVQcsGCTGAZH4wrVSZpRehKaHKvIAxZxnkMyVRuZ48uheRQYF0dEOgZy+/JZeaz3Uc/9btJcimBJBn+2DlT0fYlM71Ik9gT/F3SZTHlGD1M3SYRhOgOdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4h2zXnH5r/Tvs9suOpraP7dlVgll42ZeK4YDiqj888=;
 b=pAK6pGu0hctGtiCm0Nk3WJhsdcRE10bftnDyleZPA/i1vkHMsv5K0p5Hiy4vkKIOawpjbgswKo3a3mKID5IPhfwOctXmlKC62yVEZrmXdcPJnozVJsGSPDiOm5zE9A3fBzouqg3sV1Dx8dzgdHu1Nf5GZ02VdOI5oHuom7XmFDScksQzSk5PVLNmvXZjqM2Mj8N0T4xYqquAAYUCHRyxbOJmwBg5TLD1nKc+TvoEKCz0x25LYaEX9b26SZRS5M1pfIm3R4f1doAQ3ECUzgxoMhrmRuaTT9iFg6o9Wpi1wid+6K5sxqvMxArj13nJhgXCnkWPj2t+QhHBzc40BnkE1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 LV8PR11MB8769.namprd11.prod.outlook.com (2603:10b6:408:204::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Sun, 30 Mar 2025 09:28:16 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8534.043; Sun, 30 Mar 2025
 09:28:16 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/7] nss: upgrade 3.109 -> 3.110
Date: Sun, 30 Mar 2025 17:27:57 +0800
Message-Id: <20250330092800.1275186-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250330092800.1275186-1-yi.zhao@windriver.com>
References: <20250330092800.1275186-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:3:18::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|LV8PR11MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fb9e5c2-6856-4c6d-0fde-08dd6f6d3326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CO8aivwlJ579vCoEoRPTPuPa1ReTKcYZjZ39720P3nRslzfwektf27L62CjA?=
 =?us-ascii?Q?yRHKpIjGZd7po0hW4bINUUK8WW41rZ0y9CgWOg4+LhVYZSk92afsveQL9/iA?=
 =?us-ascii?Q?Bgn0kxKhndH80bcBmkK3qVPpwxAxub76Yn15t+mA3yRgrQ5qqrKrv1/tIUUD?=
 =?us-ascii?Q?IBX+AzCuE/wbglzpfA2WAN/wtGFi+5NDHdrwDKnxjYQlfoLyQ5HYIgReoIJD?=
 =?us-ascii?Q?qFV/OLcq+kpP01Ktx9bqIqvqYPA8fLS8NZLW6Z0ywwwiCkEOBuRhV7NlEd6Z?=
 =?us-ascii?Q?NFsZzCOmUp5roWCDGJzYW4vDy3wn10iEsgaPEEvbaWQ6wNPty2vCRBpwtP4M?=
 =?us-ascii?Q?Rtk51fogdbXFzuh9dfXmtCRG8utbp0KQ1bsJIOU17rKJal59dmkjCVcQL+dc?=
 =?us-ascii?Q?JSoX+23WMVcc8yH51TuujhJ4r90qR5zG9RnsETJfgK5Lbhu+/5UajFOhCZFi?=
 =?us-ascii?Q?adEq1Pu7oxhNAVHufhszwHt2WVa9Zlmm8Fw6ayyuEM7d+V7ODQVtkVS2quw0?=
 =?us-ascii?Q?9ltguZFfxbH5mINwPiyG5g0DTv3ePqavTE3eF3xvMD2b/yOU2cTHrkEWTGbn?=
 =?us-ascii?Q?xRukW86UygZEQ/mJMK7iGatt2kxUA7hJJiaS9xoZsdQEk0CK9t43f/cBFAEi?=
 =?us-ascii?Q?6z2D+dNohBg0g+Ul/oTQBWNiZRolcpPCyclAsYZiwWrV8EwtS6Q6XxvFMEwj?=
 =?us-ascii?Q?SHZvXeIEg0DKTXSdPjMfi1lc+VKIbzIzHAKYkeKAv4nDgs6PVbLA2bI2igCb?=
 =?us-ascii?Q?Dpl8+5XkIFodSYTBxKnxNuCmzB8NTJVRG9V+joh8IgukuG8acdi6x539BA93?=
 =?us-ascii?Q?WZwuyznvkqTvCTXMYbom7zCxCkgM76fUkAQTBrvx41nznhwxoRG2uNtOVXzS?=
 =?us-ascii?Q?cNgIB6qupa2tZZ9YbLfwObDcbIsSzgoCIm4AXThf/JvmdopeuTmha3QfImQu?=
 =?us-ascii?Q?JYiWgTMtpo6u0BiB5e8h7FvJkh4w2/JOqDL5MMzUOZheYYAs/8NLhw2px5hD?=
 =?us-ascii?Q?raYFUJEs003enUP5U1SEgnO2eEeQs7VXKNRxD3eb4B4WxwSyP0xzW5MRLzEP?=
 =?us-ascii?Q?hz9unsmvZjHtPiqzA/yfYHMSrhcBTLBXMtFF+e0XRMclu+PjW58RfembtYZJ?=
 =?us-ascii?Q?srf3WpdysW0N8CDVTEDMavxEFwAD0+/V8fMXnoPE+0DZklp3h+lXtq4QhMIX?=
 =?us-ascii?Q?N5accehO353EIm376QZN+xX9ZjpbYUhzeVOuxnvo01CSyjyCKyeGlTQjSm75?=
 =?us-ascii?Q?47UsHJCXozuFuixFcb/obcorO0ytRd4/fWueqSp49Xc+PfWHQLyxIzyhb3oy?=
 =?us-ascii?Q?ZEKBNRFKzJ9k6cPErJNr8QyQHMcTc+ZqqXOBTrddtMsLFbdCUQm7JIfY8ARP?=
 =?us-ascii?Q?Pq1ddnL3LZkvNCTpoffFdrJP4pT3H8LWxJ9S9DhJ1nCIWGT0EmErmRpXY8X8?=
 =?us-ascii?Q?7gsImEnVZJipBI1Nohzh6CxT2lyvWmjHdA/Rr7D0ncywagz7ezEqRACX2h96?=
 =?us-ascii?Q?QZlysGfYFyIGXhs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Czl110tTklKmunOCJFBNnkb1uuM0hrf8PLz8pk9y7bxjUvPAEFo5NvU47Ixv?=
 =?us-ascii?Q?vwrA7XKmh5DaQhlKQNLb+7q0ICtMEGv7mADqgH2kayV5ffTAr00KSwDcr2Ex?=
 =?us-ascii?Q?iSg6UsYNWt6my6hn8V2zONvL8AVY/Tu2WdMN3PrKYjDzNIHSmONeEE57G/Gv?=
 =?us-ascii?Q?mhaLwPmFXpNpKSgttr4H3A68R4YDeG2s5G6XClwhk+TV9J/uhP/52Sxbrk8L?=
 =?us-ascii?Q?2DkG09Ku+iR4H9WE4Q8obG1U7bC3sUWADhIXQiF0KvH/tO8s4Hsy60Kg78uI?=
 =?us-ascii?Q?RaSudwlYoDvPsW7BL3/MvOBLoeRAb8DJz5EHes+5SMDVB2gvbHMrPASBPnvB?=
 =?us-ascii?Q?Ao94slfZ5vM+QgVGaBmhffHEwbWVlsyLBn7nHjnj4gfmFOb3TtMPZOkmI2sv?=
 =?us-ascii?Q?IgmOZtj3x5YOgxt2BCY+o5ySSHmGp5x1phPe6pPPNbLwm6ExyuTs6dJz5zd1?=
 =?us-ascii?Q?fYeG7Gt+Q6upqVbvlILENPr3+tNM5C39lSh1H8ZZmaKih9lhBLjB6YioBR8v?=
 =?us-ascii?Q?rrI5NN1LZt4hnaG06eX1GV0BnGd7eWxXDFqvJ84g81zwm39NEntMOKjaqbVs?=
 =?us-ascii?Q?tV7XlucbyTF3CHEm0gv0ysUTZ9NMAd9257+t2FcztjQLfUOnICNMl8873Jn7?=
 =?us-ascii?Q?OrY49fs2KoccwUYxAupnNsgyMhBJwEKPAXLxVOWCNya0Q2GpQL2JYJ4opAzd?=
 =?us-ascii?Q?MRWrlK8waGxzuea6HKcVdxiXXSFPp0fss+FHBJCGFJ5DY0n6vuT24Uv7r/00?=
 =?us-ascii?Q?9deUCdUU5M248HBEg3FMHVIgDodIi5uahPP2MnCaSjqnQ+D5S/nCxvR95X9r?=
 =?us-ascii?Q?rdzR3SQGNfIoo3mHjmrckWOxwdMHMTcQiO8L1wnhXJwiaQkNmGhC+s2hxIMY?=
 =?us-ascii?Q?IPsMw5WINoyM2O8qcs/BnM6Cs7dQK/EzxJzN9NCmrUlpFU7yBvaiBh95aXUM?=
 =?us-ascii?Q?ZExnnQXfdjfXgrCSLqDY+Nu41aKPUobDqbU2xxczsb5iAOxLd1Ev7XyIUVw8?=
 =?us-ascii?Q?U12Hfh07NiG3u89+BZMkR8cm0R4Lc+AL/kFz2kz9nAl1WT3Ii+PZg6zBk0cJ?=
 =?us-ascii?Q?zh1pbD9hj2oWQmPkKq/YmGppEVyONfrBh5vPzuQ6wKlAyoJqtwo3Fc9Dw0eB?=
 =?us-ascii?Q?VKQkaRXs5/mf7yxndK5tdO7lIr5Jpb/ihkV0S/d4k00V2Q1+8Zpw+mb62OH+?=
 =?us-ascii?Q?q7Pd7pu51fnyKowNvTJ75DRW1U3IAWQWMM8vT+vEnC9YzvJquaXSwETSbCmS?=
 =?us-ascii?Q?p4+cwa3aPE3qhs2owtK/2fwwsbpGNxkEzYNrDwVmXVxQ9MixciFpIUNBcBb1?=
 =?us-ascii?Q?PQVr+m9JDkRdDqSYT+u4j2NfLy5MlEmgI3Sm+CneONx6E5ezse9WrmLdkLSl?=
 =?us-ascii?Q?0euHojo1XYyIjytPqgwuW/5iqIxcbpFHbyWh7o4EU5Bd8ad54IcDuvwkpr2c?=
 =?us-ascii?Q?yOw5gynDLCFU4+p+8jJEp8QmrniU7EGxhSvWJU8tXE3Y4au94NXqVg4SNYfr?=
 =?us-ascii?Q?pGLhobsntdnyZ5Qls33WeAD8jyzXywAXLK8Emcv3HcVIa818yYOUQhuDRr5g?=
 =?us-ascii?Q?wZ5vF0M2539rCuH+OxypNIkEgDr2Jpzls/iBI94+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb9e5c2-6856-4c6d-0fde-08dd6f6d3326
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 09:28:16.0024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMZ5CmdaRxvgvY7oBCej0kL7xvuhkRZo0SzHKVqDdlmGb04pLh4dU1to31dPZLhlOQbbOjdcVYxyl3t5zrnoUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8769
X-Proofpoint-GUID: dC6WQ7Qr3TTdZWwYFXMWcri3BwSGME-y
X-Proofpoint-ORIG-GUID: dC6WQ7Qr3TTdZWwYFXMWcri3BwSGME-y
X-Authority-Analysis: v=2.4 cv=RNizH5i+ c=1 sm=1 tr=0 ts=67e90eb2 cx=c_pps a=gIIqiywzzXYl0XjYY6oQCA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=pQs5aej7AAAA:8 a=t7CeM3EgAAAA:8 a=UHxX0TtlxghoZRkbYAwA:9 a=CIhr0GZIhi0A:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503300065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116382

ChangeLog:
https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_110.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/nss/{nss_3.109.bb => nss_3.110.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.109.bb => nss_3.110.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.109.bb b/meta-oe/recipes-support/nss/nss_3.110.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.109.bb
rename to meta-oe/recipes-support/nss/nss_3.110.bb
index f14c722693..1e7894ac60 100644
--- a/meta-oe/recipes-support/nss/nss_3.109.bb
+++ b/meta-oe/recipes-support/nss/nss_3.110.bb
@@ -33,7 +33,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/$
            file://0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch \
            file://0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "bea46c256118cd8910202f05339627d75291f13b80054527df58419b9d29c18b"
+SRC_URI[sha256sum] = "9cd610c40422a07771b9b45166be2d052ea2f00b605a7928129e1f2071b3ae27"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"
-- 
2.34.1


