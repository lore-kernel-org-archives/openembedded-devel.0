Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A67EC01D2
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 11:42:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15354.1774266134427820766
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 04:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sEHDL6yM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7542b98c32=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N5798L3664152
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=FHxyyuu8kr0G4eqzpkMIASJP03tr79cxqH5tMKhdoJA=; b=sEHDL6yMMSBB
	iWRRDiB/p/spXsVlWt351UAzdzbNO+N047ueLnMKeAVJ9IGw9pzrL4mL4W8S2/RB
	XWvcxk2FQcpsF8jpy6fXCcpJJ4FKwUWiResSAvzXSW7DhS1o/I5Y8sTBqPSnT0AU
	FfPx/X5LTvYYt0fh6Aw3d8PJl9YGNtctK1ghCRK7eyOehpt9XPpQCZtO7XEPhoMi
	gontaKDCAokBuy8uQkhCvNevOwdyVVlBahLz7Lq1hpVlXX6pQv15ESiwGZye5Quw
	AmjeeDcMsH2MseZoY4Qyp5BX4CvtxV+d6yYFIK1dDSDmk3sv5g+NmaxEtXoMIa3m
	4tU+KZ8cKg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012054.outbound.protection.outlook.com [52.101.43.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pky9k2n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L+QB6KpVhcLK3iK30pvtyfWDhYlbcoAg3FtuthdyW4BKOphIzOo2lY9SpncGe+EhD8np+2wSClv4Yd2gv5uVmgMSpRnuNa+AQQRJC0PtBhxRxwiB+4Lo4aOIB2E0RLnZO1xtXB8I3wznnHSlD/PHRL6cb2Naco75BCJWECyoPgMlTVXS0xnlPpOUnO6q5/H3qwBZzV+CVeYjkHoB+zmQOpPrt1N4qvTrRsMZvtmmV3xVZXEANPsdWzBy0t9UhzKR6OMO8uMw5w4Fz5RhSgXIL4ZFfd1866fERtI25HYQgN3jjSwV+hUYcyz+/FRxVoycqGO7RjD49JgPDsrfYnalQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHxyyuu8kr0G4eqzpkMIASJP03tr79cxqH5tMKhdoJA=;
 b=WkCXLQUJzDSdfjEYHJo9fafW0Wl6W85sDZRK08gcmHjOSUkY2vliz7lEgJUU0+93GGZwEbWNWeQfg2lBVX6jwypcBSCDs3YjCaMrRH+2wvWtpbH8OFuwkPORlTFrhklYtkKIjWneMyopXGMaP07oO7BjCq7+7lfxBjK0pejYTsY8tC9NfyuZLbOof0GyQVhyjFFR96kwHxp5s5Iy986LzI5P1Kykgp5hR5JDzPaflUMO96AFGY9L4sZWbQi7x09rzG6erkUztW96Ko4pQkLyWggkjqlMlbfYNAHIYabZ/0cAup30cg+9gyPewINZHuYM3TICrp3Fo1Il0qfJJa/vjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB7763.namprd11.prod.outlook.com (2603:10b6:610:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.10; Mon, 23 Mar
 2026 11:42:12 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 11:42:12 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 07/15] xfce4-settings: upgrade 4.20.1 -> 4.21.1
Date: Mon, 23 Mar 2026 19:41:44 +0800
Message-Id: <20260323114152.4178269-8-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
References: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::14) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CH3PR11MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cd0ccd6-1b54-49a8-662a-08de88d13927
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	sjkaG0xfIgnItZoNYLdb6C3oqiIYL8VEE5ybCInNNLfi5w8NrgEn6XhlhU50Ytc2hW+lPgi8IEbxdeOGyLuuBC3X6tYKgjVq3pjs9NOf3wtkP3ocNrx1Yln0euhIGYK4w1i2FztQT+iVrm1vJC2pdEGozdN1PqS1fnjc4xE2omIs+AGGO/VpEyB3LqOBG4BfWd9HbV1ByUyxfXv9DX04x5G9lCl3TGMz37i7wBvlAG1GHT+wGl6hum6sDf2xuBaBexX+gscb0ZFOCFjY1s9Ip1VXsbMGeHSJGIYmWV66cNhFdAcQ5xbFci9yxYTFcMqea/gm5JxALR8h/vLEaBT6jd0jlp9u6JZWO8w1hDqyL98Ep/DRsy+pFlP0/vDR81/dhyDPOEqWByGJeKBgZ03KqIcIXoNskb79NB6oFjrbcbFdbtjGfrZfRWSeZZm0Sw+TFAnS5JA2Iix95E3WSUt3SzpLE+z3Jm7M66b605uYoQ/W81TivdpWNiZDs+cAjTKOPg6IWkprx8Nyvzy10XJDIJj4FyQ2iK9ZbyvBD6sDdqkCBxck05pQUWgIkZDQpGY1ML8uFYTG5XWWqS2hcV9Ex4xOn1KWrym1VDnmofzcjYnnm3dJb54/cCoFSlr/AssmZ7+t0VQQSApiBc+M9iS3Svz+emqFGiQu6aemccuQ8lwuV3oQ1/wD+wio/Qrv35QOz+Nh0p/dpA9xAAcc/iMQRIDvDy33tVY0Tja0t/8XsTjlRwtaDp5FEMh7x7X9e7ei
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oc5y+eYGB/z2rO2Re4UIBTuDhJ8asyxz38kG6dy3uAVyPYUeMRWR+Cen/Hfu?=
 =?us-ascii?Q?jFYCyJPMPoMla+mTMujRmIZvSqIiDGlMfsxPno87E9pj/goezsRk9R2RQI5g?=
 =?us-ascii?Q?9vnBp2CxekQ85LvCrbFy7wtwLoz5cgflnJr81piccozZfi05RthnVtn+H2vC?=
 =?us-ascii?Q?eSqt3w/HUqK6aOPVZh3mQn9MG3lHjyIiIO32P5GzZlgAY22EqeRFGemYsMYI?=
 =?us-ascii?Q?7zgqjMMRlOH37ovJikOfladlL3Am7W5Ve9IJVJEOqoh7jOaImTJA7FE9FAxE?=
 =?us-ascii?Q?B+CpaBRhvMGwOpQFkr44BxqW4iU6wHX4GRzZIONQ0sjMf/Ux/dMzwOcIxdse?=
 =?us-ascii?Q?bGYfn43e9T4j/hX7IVEkEh3dJeKAPH8inmQqDSN4bA8wGmEC1vygChpI7fiE?=
 =?us-ascii?Q?4EVUUj8U43AHDfdfOv1PzJn2AcbACc7glFx0GgyizF+dYkxsTQSSbzIi8DHy?=
 =?us-ascii?Q?E6ChRZXa8jPiNYgDcsDqqKdfit0Zf9NBakISr98OAEx/bk8MrnEGxbHwrbU7?=
 =?us-ascii?Q?fp/F5y3qoK0NQhXL3qWMMUWiR2j7XTOA/8vYAbeC+6jsLt5OVNyPAjz/mFae?=
 =?us-ascii?Q?OzbNCj5hgHKlhSbJVz8jIQokjRWZZIFw0cPEqjrYNC+zTyfgWx40LBPacTjH?=
 =?us-ascii?Q?6MX1u+FJZ08+aLFfKbbztx4A6equOs7aW47YHa9r8HQggcqpwisZyXn1IOU+?=
 =?us-ascii?Q?eabqLB+pz55i/2YQLWid48CfUQYqmBuYG4ijrest/3Kl+WYdTPnxQmZ+G+jP?=
 =?us-ascii?Q?Q2euf7KnSJ9U1bDa4gf5wADUfRy/2JfGwuBJX1khJqAaA0LGBk49qdOxS13Y?=
 =?us-ascii?Q?q21sSGgfeFYo5G20F/jZHZD2HPLB4bqmJfaA30IwZR7f3Vfm9t7VxRz0WFAu?=
 =?us-ascii?Q?UFEmnPBDV+4Rwd/8so5uPQ4jTu1H5Zt8EGvN4jFvn8g2NamLU+NUtyLtwVFv?=
 =?us-ascii?Q?luCPUjZ0jx8PGY0oQJXYMuwKwflLwuTJ9fZEJxOI3U277XAciwKCTQTpz7b+?=
 =?us-ascii?Q?H1sA1YWQWShTorZBqXwNb42k4nk+4Ly2qHWMfDuqmxLdkii1Kkda3KL5i5i0?=
 =?us-ascii?Q?NLi6EcKARhqdUGQHXeFxdXhKYP5LIpu0ktTy74sehNWO1LxfiJcMmOvIzDWg?=
 =?us-ascii?Q?ZK6qNF+UelCKJNQUQFKbQyRM85PlQ5WDrea2TR6s9k2xr8wFrBsZue8d6Sbu?=
 =?us-ascii?Q?aXNV+WaVO1OM0whCXfnV/GamSJ1lfy81FpoP6KX13UqFzKCGTvSYLg6eRzK6?=
 =?us-ascii?Q?nU4wRPIfOb+JXTHGbYwAo48HDJ7gdXJZohpCqLVaKNxluFxxaXyunf2kaDAQ?=
 =?us-ascii?Q?UMRr1yvf/0ueTjTY1eQFqBkECCA4q4ZsGa7TsPIchmqdBQJgOSisiswReoWr?=
 =?us-ascii?Q?ShZ9JXxkfTJigHhOUld1SHIHRmrMQ+JmTYNtFpoTvkotBjDHxkHPjnx13qTH?=
 =?us-ascii?Q?u/1+by/S08BY0yDhOWSTmliYYy1+1SAzj0tLgqo2FwcohRQifm70Rdk7zoKz?=
 =?us-ascii?Q?hDSfwPmFi7vL4wLl9T/wQ9wJ/H8qq0IwkYCf1oFy9U4rjwJgI5AWWVCiNbkw?=
 =?us-ascii?Q?J3wl8KzkBAWDvmFI7Yk6pimUh+bdEIVkIXws5JMr9hNB9n0o9rLuM8zr0TEx?=
 =?us-ascii?Q?wIw0QrDgMUD5a0yU5OYW4ulYVhcpICb87s7cQnNeqoI2jsTuTx2ppTm0uxN7?=
 =?us-ascii?Q?mHObD2feQltdgmNUnRXO9aQuPhWka1r5eDSnxxdIoBDvLIXnSGvKLfIK3ZFp?=
 =?us-ascii?Q?BoShLxWMKx5Uw5ZUo3pBm6iHPD+TWOo=3D?=
X-Exchange-RoutingPolicyChecked: 
	rT0wuLOKuP6SPbSXU1CsH2V8OIPHnSppOSJ/Lre6FtP6v/HCfmHg78pAVuCboma33qZYGQZFhXMDT0m+amhtniO7w4BE09B/wmJ4ffUqeA0hcYBn8q5175mZrfPp8u90gUe3Hgr0sk4U/ogLfNa6Xh1j5udxHaC98LTdiOZ1bbUIvxGEBi7AE1/BfatZRGTkLLI1isK6eH0SY+Qx8Fbviy70cTOEb6lE3ILOC8UfWqhu8VgDr0/ev7sLNVPZJshCRNKvT4L4ZJAmbqrk6HLRy0x4dPXRSuGIHDk2UEKTMEeBSbd1nK5Jy5G0gz2PvnuMlmKWw7E+t3LZxQhh46W8Dg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd0ccd6-1b54-49a8-662a-08de88d13927
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:42:12.3846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDXpU0LShjPMkhw9fdJumvE5E/ZJeE7U3VK8jzf6olmqSV+/9sEZMZmmosF3Fh9FPVSGmKWPxAJScIZ9ok07EloJUJUK1A0tdwS8N81bOx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7763
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5MSBTYWx0ZWRfX7vTUUoDOlsWb
 jZySUXl1L52wl0CDh14hJ/0x7szF2Z3qVDJjXvysJ7gNL4E6sxt7sJFGhfCeKayEKoJK8+tWAZj
 LJOEiCHYW4pAYfoTiBgnyk/fDfk+51iBluC+vw2uiAJD1EZJdpVRFO3gvg+Hz/nMFsO1izY6DFt
 H+/KWHDoXhDnqAu0x6tUoHsu7SCnAZIYGpjsstFLlsvwUUf8W6TlZRR2K1KvYOOyggw6o5cEuaG
 twdPho4ujQ5AcwLh1gfJexek81Pe+5SMa9yAPW7J2fMbXxiOM9sJEArU8otVicqPldqJfWIsv+3
 JPmn5WHmreAoxaJkSEVXl9/mruN/zmGN6Y1z7+ucdSf6Rcm4fppnji127/IRf40/XjMSpfe91G+
 UADv25xDSd8lq7DeE+H18TqyDhsfxS0nnAke5SObX4CU7Q9U6xo49Wvq3vkw25TYeR9u7wV4p4e
 U9fowAeLD8vgN4SswwQ==
X-Proofpoint-ORIG-GUID: aVEgIo-RYEV1s8uhHWg6NCjlMdpIBYdB
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c12716 cx=c_pps
 a=8Mab7lbrFfecTh0PXXvUKw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=_AMU3uBFKqmksvQhN9QA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: aVEgIo-RYEV1s8uhHWg6NCjlMdpIBYdB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 11:42:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125510

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Changelog:
https://gitlab.xfce.org/xfce/xfce4-settings/-/blob/master/NEWS

Backport patch to avoid add full path in generated headers.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...splay-full-path-in-generated-headers.patch | 36 +++++++++++++++++++
 ...ngs_4.20.1.bb => xfce4-settings_4.21.1.bb} | 17 +++++----
 2 files changed, 44 insertions(+), 9 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.20.1.bb => xfce4-settings_4.21.1.bb} (67%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/files/0001-build-Do-not-display-full-path-in-generated-headers.patch b/meta-xfce/recipes-xfce/xfce4-settings/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
new file mode 100644
index 0000000000..50006b1710
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-settings/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
@@ -0,0 +1,36 @@
+From 93fa2ed9a987c0f03c9f5aa0f31cb770d1cc5f17 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
+Date: Mon, 16 Mar 2026 16:44:43 +0100
+Subject: [PATCH] build: Do not display full path in generated headers
+
+Upstream-Status: Backport [https://gitlab.xfce.org/xfce/xfce4-settings/-/commit/93fa2ed9a987c0f03c9f5aa0f31cb770d1cc5f17]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ dialogs/mime-settings/meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/dialogs/mime-settings/meson.build b/dialogs/mime-settings/meson.build
+index b7ca8dc7..5ac9a936 100644
+--- a/dialogs/mime-settings/meson.build
++++ b/dialogs/mime-settings/meson.build
+@@ -30,7 +30,7 @@ enums += gnome.mkenums(
+   install_header: false,
+   sources: 'xfce-mime-helper.h',
+   fhead: '#ifndef __XFCE_MIME_HELPER_ENUM_TYPES_H__\n#define __XFCE_MIME_HELPER_ENUM_TYPES_H__\n#include <libxfce4ui/libxfce4ui.h>\nG_BEGIN_DECLS\n',
+-  fprod: '/* enumerations from "@filename@" */\n',
++  fprod: '/* enumerations from "@basename@" */\n',
+   vhead: 'GType @enum_name@_get_type (void) G_GNUC_CONST;\n#define XFCE_MIME_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n',
+   ftail: 'G_END_DECLS\n\n#endif /* !__XFCE_MIME_HELPER_ENUM_TYPES_H__ */',
+ )
+@@ -39,7 +39,7 @@ enums += gnome.mkenums(
+   install_header: false,
+   sources: 'xfce-mime-helper.h',
+   fhead: '#undef GTK_DISABLE_DEPRECATED\n#define GTK_ENABLE_BROKEN\n#include "xfce-mime-helper.h"\n\n#include "xfce-mime-helper-enum-types.h"',
+-  fprod: '\n/* enumerations from "@filename@" */',
++  fprod: '\n/* enumerations from "@basename@" */',
+   vhead: 'GType\n@enum_name@_get_type (void)\n{\n\tstatic GType type = 0;\n\tif (type == 0) {\n\tstatic const G@Type@Value values[] = {',
+   vprod: '\t{ @VALUENAME@, "@VALUENAME@", "@valuenick@" },',
+   vtail: '\t{ 0, NULL, NULL }\n\t};\n\ttype = g_@type@_register_static ("@EnumName@", values);\n  }\n\treturn type;\n}\n',
+--
+2.51.2
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.21.1.bb
similarity index 67%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.21.1.bb
index 1330206a8a..16b90840c7 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.21.1.bb
@@ -5,25 +5,24 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "exo garcon libxi virtual/libx11 xrandr libxcursor libxklavier upower"
 
+XFCE_COMPRESS_TYPE = "xz"
+XFCEBASEBUILDCLASS = "meson"
+
 inherit xfce features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "fd0d602853ea75d94024e5baae2d2bf5ca8f8aa4dad7bfd5d08f9ff8afee77b2"
-
-EXTRA_OECONF += " \
-    GDBUS_CODEGEN=${STAGING_BINDIR_NATIVE}/gdbus-codegen \
-    --enable-maintainer-mode --disable-debug \
-"
+SRC_URI += "file://0001-build-Do-not-display-full-path-in-generated-headers.patch"
+SRC_URI[sha256sum] = "e57a33d0bb9d63d0ef6f469c2d42cbf66e37d9127cc204de411b7385274e26d0"
 
 PACKAGECONFIG ??= " \
     notify \
     ${@bb.utils.contains('DISTRO_FEATURES','alsa','sound-setter', bb.utils.contains('DISTRO_FEATURES','pulseaudio','sound-setter','',d),d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
 "
-PACKAGECONFIG[notify] = "--enable-libnotify,--disable-libnotify,libnotify"
-PACKAGECONFIG[sound-setter] = "--enable-sound-settings, --disable-sound-settings, libcanberra, libcanberra sound-theme-freedesktop"
-PACKAGECONFIG[wayland] = "--enable-wayland, --disable-wayland, wayland-native"
+PACKAGECONFIG[notify] = "-Dlibnotify=enabled,-Dlibnotify=disabled,libnotify"
+PACKAGECONFIG[sound-setter] = "-Dsound-settings=true,-Dsound-settings=false,libcanberra,libcanberra sound-theme-freedesktop"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,wayland-native"
 
 FILES:${PN} += " \
     ${libdir}/xfce4 \
-- 
2.34.1


