Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B206CD343F
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 06:12:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7150.1778307163807300488
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2026 23:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hgx61Qbj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95896de4fb=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6495O89g422207
	for <openembedded-devel@lists.openembedded.org>; Fri, 8 May 2026 23:12:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=vSxVT/DDWwsy0+HIZbr6
	GjCfZK9cwOlJkEKSiQ5cTQw=; b=hgx61QbjQS19zEj9AyPUBpUzNXsqnP9Tb+rF
	+3IS/WVa5M7XZi7vASJAQI08VyGO+3jAO+0ffO5BxYylNpjcnSlQcdTvErkdhGJY
	Bzv2TLmvROkiY5fZ9oCmim5zXvmu1TbNt/XPgvtOrBUuob0wnq3N3pofeJTgS8w8
	qyg37kcpS6+srzuGJKYxfG/diDMYISEHKW8+4KUh4YtHtXlPBXaGSMe83qpXv1Jp
	nYQoYRBBc5THOKIKLCqBY70gAiiT2hctSYsvx2cKshHFqk6vi2Vh/QwGfNBY+plN
	nIqQqSCpS2aQMmXhe4TOAjburKHtANM0MY7gJfFhDzSMc1V0Og==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012017.outbound.protection.outlook.com [40.93.195.17])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e1hkmguap-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2026 23:12:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2DX8lyPyQ+mLUtnOfkXlhFKjara6FYiH2Z4Ls/PT7NP7ac7T97w2lZaCmjAfBLH+d6KAtgq2YMdBO1DRUB1qeOhXzSUVpbtYo3Sv6IcV0ZvEKi2dUeGGml61/L7zlp/yT4h7jhVrVLtzNsxT8Iikrvb2EefXfd5ibeGUyGJZdin7fhyMrjFBb38X24wLPnjcZhtNrMtnoxuJ52bBYntVAAyNUXy4u7OvJvvfc6DVYLdbu1ih+X0tfyT/m6kYIay9JmTZtWuuECbeXVyVWrcTUlTEOrGaBkKN467s7PJp7l7S3AJTIE692RcwUIk3vcHV+nEP1EFNJt29RlQQlWHRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSxVT/DDWwsy0+HIZbr6GjCfZK9cwOlJkEKSiQ5cTQw=;
 b=ZmvACZEfAR1wpFVnGuzLQuH0BdKr5y8pDZnri6Pnt9aQFeAUZbCHmJHTxepuUt7EyhCiYKb8iQ/MLub4p8IXKQlFVcqX+nWwtG3m5Q0wjoVEkzYdFt0IwJHSTCin0MIYRyEyVwuKFzkvCiCvWllDmg/+IKolRzeQP1cc0wPUI/JUBaSU4+epGk8zJJyTMMUFex7fY1zCf0QWGuLEWukz2IYZ9SFWJoUv+iHa2vdcdh22vaSPCn5aw3teit3nrzK4bIZfIFfprTozn69EAVV1wAQGeFtPzHxVM0OUvM43LKP2bXBSVJ9bgAN7XjkIS68+MNip3CQeiL364jMRE4kaGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Sat, 9 May
 2026 06:12:40 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%4]) with mapi id 15.20.9891.017; Sat, 9 May 2026
 06:12:40 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] postfix: upgrade 3.10.8 -> 3.10.9
Date: Sat,  9 May 2026 14:12:25 +0800
Message-Id: <20260509061225.586661-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0059.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::10) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA3PR11MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 2df66972-595f-4fc4-e170-08dead91f964
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	L2VBpX7S/2qvYHuF+7lTC1Ic+6BBE9Ms7ChI1aK/ZuTXSPTz2npELiQDxhLAm7Tzy18BAsKAn5JW6iown3dR4/N03CJmXWRvn7ojrOJLo0KsK6WjSDymnFrVNN7dtN+yOGV5wlsVFOQr/SKHytwAPBIDlYV6Lr8fc+2Z/6z/SXGFO1gBWAiSljXmN5k/KdrKpWdD9FyPtPR60xtSOfEwqRayRPXED8JnviS702To4eNsY8r757qi33yzcN9uNdxaTHrrmH4DzQW7TXgx57rTlhCyeyHdHslCAzSVwn9dTcEf/X2lt357BDOf63HtPXSQtAg4Ms/TEDJDeIag5ASZhEfcDgOgNc7aSWHc4tdCuur0uvXl6M7uaK4ejYVMtKywfVCblaINEKt+jTfNs/hiO8u75OcKS/Rl9Gd0BqBxu6f/eww/wP/1EdyLzS2IWyJFmM6ZzhMMBJnNi6iw3v40yjo/KAWqhEpPgHf0V+kiOOwFknIaV5NZNdTFl3s+tUsy7kkWP6IoxjPuk/w5Jzrr6Dftk+l9rmhxOjL5Dg8AyLIOpV4134yj33iMG2Fe0HAj/oYwdit+EsW3r+gOTNkS8HCL61Vw4lbyyihKXIigiRm+EURDBcURLQmQaLT79VoQml5xA/T00Li2XAwJnGu6J4lLe3wdrLYbdJLNs3W5+kCsU5u+SL419MbxsHQrJt844SGpc1nGXwjDvbMGm7an1Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NTSUSeea77Pn0cVL44qmJrpTyFBNfx4T+Y0jKe7usgLCDZKFpfR6ZOMrSncI?=
 =?us-ascii?Q?AJLmdBbK1VB4tf99MLkzJuhaPlYT7Zj/weNscpZYgZIjZ+LPXr5tyD1cmt61?=
 =?us-ascii?Q?l1cm+2C/QcBzVIbcHDTKeHSnq5a+KcXOPjBzPBf0BY24XyhXjIMm9AWbqX4A?=
 =?us-ascii?Q?Jy2pjxz+DcVGdvqnyL8O40WhpcA6sL71RuFVvSBSS0FUoEHI9dTgkO9B5sTx?=
 =?us-ascii?Q?l+sZSR22almu+ybsTXteu9GzyC1L2QcOY9VRJSe2y4R4XbE6GuDL6Dec/8tj?=
 =?us-ascii?Q?8cb/gVujKKstu9VUn6NoSeMelZL06cgpFja/Rk/C1X7tKh9EPtjj1rK7SmV6?=
 =?us-ascii?Q?2Csgh9hCUKQ/I8PtOcjDN+IlIFPj5xvIEBUbw2k64GYfi/tcPFCAaPQ9yENH?=
 =?us-ascii?Q?uDoUlQj5L5HBI7NHpdLVmpt0dMXMEpTlX+mpoRr5sdfiCVvxuZX+O2quOQim?=
 =?us-ascii?Q?09u8us5LgAd/74GpjSs6qPWTd6VVoloIA6tzq2h7f052v+Xp6015bOsAVS5f?=
 =?us-ascii?Q?X2unjgzJ7NkHe8gI4GlebjepSz8uineKZFCJqPmfMXVr0+U1l44/tRyTMCjf?=
 =?us-ascii?Q?r0WajPrAPTPDC8zf9NhX+Vc+Vg+QeNqB2Mm8g8iynk9PBdg2lm85mKq7NRxG?=
 =?us-ascii?Q?/BNA/AtRYT8T/Eiaq3FWSpUrOn2mAgKEOkDJ/k346WV7slLYHdxSJ8oZyztD?=
 =?us-ascii?Q?BKlrDH92WGqM6fn25c3hVCZk4b4JZ8duyW9KWHshJpdrgZqHnOA2Qa3HhSsm?=
 =?us-ascii?Q?pLCmYkCfuUBDZpDTxN1eDjULZUjOZmk11kRVXnnD1RYBo4Pbn8au5SBWK0x7?=
 =?us-ascii?Q?wgVHh9bcPs4sVQO9REeek+tokJE4rNv06sqJ+D4ulsDqVEUg2d3A+Dz6sLFY?=
 =?us-ascii?Q?KHdmVw8sOarcCVJHrgBbEr0FcV9NkgDt6Nv4TXp4acJlUJiiCeqJT9eFkVs+?=
 =?us-ascii?Q?yRVM85Im55mTfxMalJi9p539/yVDSocIRUKhU7vkN2SL67nj2emOuwLohSQK?=
 =?us-ascii?Q?BPHwWYaD6ZbGZ9q3n+k/a88oVeW0KQ7sAXFS83B+H1Ws3wxtjrXbue/Nk+2S?=
 =?us-ascii?Q?/iFpJ54WVvOv8DniWFVlgNnnKQJYnEDsB9asOFA6/YppmxA5EM3J9jJLK7bb?=
 =?us-ascii?Q?sENzNnEhjQthv1v6f/RSySUKQGlDVjdo1vTwbKCmraLRwUXDKX7j5QlP/3//?=
 =?us-ascii?Q?SOtyMiPLDyW2Va68odsRykVyUqHGRunB/KTw6NXW7RhQGVDdGpE/y5np4DDU?=
 =?us-ascii?Q?f0PBhT7yIm0f0qNZqGmx6wUeAiijZPTJb4KDExcAehCgbM7K3KxXkSO5U3jb?=
 =?us-ascii?Q?cAg1QvYp94wOKmrvyQ5Qbl5FkuW4zi3cuuOFBcrBvzTEbAze8YsXxaq9VMFN?=
 =?us-ascii?Q?NGOOM6VOPK7F17swwEZY1QGLfsccdhwr1pvO7Z6eviKtBhWSD/hvtCZo7cOe?=
 =?us-ascii?Q?taBy+nyYjN6JTVCv3BK3hgMfLuDEQ8/cBgORENPIcrfawN6aJfNpdMD6QXlX?=
 =?us-ascii?Q?gPwqSVHU4k4EIM+d8ZTdxk8cAwNziJ6cQAPWi5IM6R0+XzzZXoPoXIeemu0/?=
 =?us-ascii?Q?KW+rGxiJDOXU1ObHnvgXUClnkvDR20gsMMCbGp3dsgNht9e7XS35/itIVvM/?=
 =?us-ascii?Q?mQGROxE+aUuNlIksCUsCOOpUjj5d++yLn4owskd+hOnv1LFi4ILkS8mV0QqS?=
 =?us-ascii?Q?/7mvfTa9sGVnr5DLDgciLRrnZP2+/6+I1az/Eib/BWiTqZxZCu5CRYlE/9n4?=
 =?us-ascii?Q?Gmu4/Gqc7Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	uUYlZMlgnEcIzTNrvAfWRlQVzH9Vj76WMosWb7bujKQTT6y744i3NbsxwH5oB/UseP+1or3TF6zalY9MTUGkMi4Bxl4S05xnSuL0xzUSsFKgi4GJQGahSvptqflqvG//mLCghUElGjanT/13TiZya1znB/qipLuVyCEt1moMsNRYjOqcqFoR4CDUaXsezdAB/UAOydwRkJQPX4dOu9hrJYLE8olm4wTD+m0uyBWElwEGSogRF6uwln3Zh7cGjufkUgBis1GmN1sDGu/LCUw7dZoh+SQn6+Vtw2HEHDoAZRaUIog4b6Qq7kf3LVtRdHD7bNY2jQAR9836xb56AexJPw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df66972-595f-4fc4-e170-08dead91f964
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 06:12:40.1166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kwQ4I6nzWdyQiMweppa7VHRy9h5bGyIRYVFWGAQPZjbQA9G7e7EbulE4A/S7VEptpmoW3OJghhd5yW2cS5ZKcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8046
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDA2MSBTYWx0ZWRfXwbuDHA1avqng
 plSwIFQZ58VA6yTnBIINvRxxtQ95MuNOdc3RJ/l70YID1yxbEXyI1l0uZmvEwC7TYR4tjcmq07U
 g/INe1U+zZM3QDWdP+iAF4YOZ1AIbKORf+cznjs3jSCjnglSyKz9aw+q8XmM7RkXbd1n4qcQEss
 0RMjeL8CHDqjojFs2PSc6awl/aY+KtmmKXltn4SVLyTc6zmGTAn7pig6+49oun0a42KwVCo3fqo
 KYWakNfcRYrXTCDzPAmUlCl1z7cO7FN2ex3NIxrchNPLN9yuak5VEaQsIES6M1NX88ahd6t1wRt
 TB2pQJr6+36Lh5wEDrGuQIok/o/ADzwhD7c77OLSovX3OMMd++E/bWy3qSPv5nXpUl0VxUQBmji
 RpK6kgKGzZINom3hWW2YFgIVgNeqVD0oF7/M4ndVcTS1xAzFTZTtjGj6GaZxVUjJBlOEvyY65ix
 dNtTPllKfIh5lMELymg==
X-Authority-Analysis: v=2.4 cv=X+li7mTe c=1 sm=1 tr=0 ts=69fed05b cx=c_pps
 a=mbkJAKHg+hX/fqCzz7NXWQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=e1GkridNAAAA:8
 a=gmDo1nssAAAA:8 a=t7CeM3EgAAAA:8 a=vMPsV_Qpw6bpd4AMeWoA:9
 a=6ft9yNkZjdd813gQxDxM:22 a=DmCNEmdWNTAeIjfGWauO:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: HpYAPN5ShfjCd7GukFTzUTqVlORirEtt
X-Proofpoint-ORIG-GUID: HpYAPN5ShfjCd7GukFTzUTqVlORirEtt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 May 2026 06:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126829

Security fix: CVE-2026-43964

Add a patch to fix build with musl.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../files/0001-Fix-build-with-musl.patch      | 50 +++++++++++++++++++
 .../{postfix_3.10.8.bb => postfix_3.10.9.bb}  |  3 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/postfix/files/0001-Fix-build-with-musl.patch
 rename meta-networking/recipes-daemons/postfix/{postfix_3.10.8.bb => postfix_3.10.9.bb} (98%)

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Fix-build-with-musl.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fix-build-with-musl.patch
new file mode 100644
index 0000000000..d09418eaac
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/files/0001-Fix-build-with-musl.patch
@@ -0,0 +1,50 @@
+From cbe5ba0deeba6329eed63eade06bb8c062d0d445 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Fri, 8 May 2026 22:39:54 +0800
+Subject: [PATCH] Fix build with musl
+
+Guard glibc-specific version check with __GLIBC__ macro. When building
+with musl, __GLIBC__ is not defined, so the preprocessor previously fell
+through to the #else branch and defined NO_SNPRINTF, causing a build
+error:
+
+vbuf_print.c: In function 'vbuf_print':
+vbuf_print.c:208:46: error: macro 'VBUF_SNPRINTF' passed 5 arguments, but takes just 4
+  208 |                     VSTRING_ADDNUM(fmt, width);
+      |                                              ^
+vbuf_print.c:126:9: note: macro 'VBUF_SNPRINTF' defined here
+  126 | #define VBUF_SNPRINTF(bp, sz, fmt, arg) do { \
+      |         ^~~~~~~~~~~~~
+
+Wrap the entire block in #ifdef __GLIBC__ so that neither branch
+is entered on musl.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/util/sys_defs.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/util/sys_defs.h b/src/util/sys_defs.h
+index 74319f2..6d3c7d2 100644
+--- a/src/util/sys_defs.h
++++ b/src/util/sys_defs.h
+@@ -794,12 +794,14 @@ extern int initgroups(const char *, int);
+ #define NATIVE_NEWALIAS_PATH "/usr/bin/newaliases"
+ #define NATIVE_COMMAND_DIR "/usr/sbin"
+ #define NATIVE_DAEMON_DIR "/usr/libexec/postfix"
++#ifdef __GLIBC__
+ #if HAVE_GLIBC_API_VERSION_SUPPORT(2, 1)
+ #define SOCKADDR_SIZE	socklen_t
+ #define SOCKOPT_SIZE	socklen_t
+ #else
+ #define NO_SNPRINTF
+ #endif
++#endif
+ #ifndef NO_IPV6
+ #define HAS_IPV6
+ #if HAVE_GLIBC_API_VERSION_SUPPORT(2, 4)
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb b/meta-networking/recipes-daemons/postfix/postfix_3.10.9.bb
similarity index 98%
rename from meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.10.9.bb
index 6b82c04fbe..633e4a7a0d 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.10.9.bb
@@ -27,9 +27,10 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0004-Fix-icu-config.patch \
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
            file://0001-makedefs-Account-for-linux-7.x-version.patch \
+           file://0001-Fix-build-with-musl.patch \
            "
 
-SRC_URI[sha256sum] = "31d4b3eb8093d823b5a151f571719ff7c0462571bc95e6440d87ca525bfb096c"
+SRC_URI[sha256sum] = "d4b4daab0af2e0c16c0d2d5ac3c7680d5ebd2001ea054f7f2a601c759801bc13"
 
 UPSTREAM_CHECK_URI = "https://www.postfix.org/announcements.html"
 UPSTREAM_CHECK_REGEX = "postfix-(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


