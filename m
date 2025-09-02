Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA1CCA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 07:44:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.71871.1756799093317904150
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 00:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZEuNkXcO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=134031fe91=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5826N1YF2421652
	for <openembedded-devel@lists.openembedded.org>; Tue, 2 Sep 2025 00:44:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=snaceVLeZ9wg7XjH2uPi+B7G17cw53DnzARIyABh9tE=; b=ZEuNkXcO+ss/
	a/BPFlHTgHl20FSp2G23wIiHgrO/z5hMK6yGJCeWQEHrks2gk7dKK0HtnQrOnaSm
	yfIRz4i5HvZYbimzBrrLg2b/bb0ZLJTA5HcoN4zgp2fUOrIKhHwQIq3XOUHPLbRK
	sVatCJ75KtlyFKfPMWdbVhZjj8FWKTr2o91Mu3JUbmQ2m3r8MALdU8Kdy13wrpbH
	C1a3PQ5gucnIwAz9eugQmEvIy9+AEbWBuV/H/T4FrWGB52nBook4UfwbVc5ewpRW
	s1FrN/YvJ6CykNhonVM908dHYnqAVzEKGT5ShHv3PnPH7bSoZcluTCnOq0WisLR1
	Lt2bJSQMSQ==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2063.outbound.protection.outlook.com [40.107.212.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48uvjyt92e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 00:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=veZ21JGrAOkvk+mo9wU4Ytk7X1xag9tc0W1Ldd7MhLqmjc9yHigMqdm1PGFFRR0iTyo2T5Pqhk2yaf1PB1FtfEzOXPag2/ZeBtJwdhVAgGR3Uwmns1/gAgWM77YrsHvUa5l5SKP/wdknk5dJ2WCk/QvqJ2yy/W2EUK3usyoiuM6868FJ6A4QbCduSDKNB9prJT5QQ2njBnBBIXAwnqy7udlDZNocuae6xGFnP5mcBq6jVFLmdVGSbIBEiTiDPdYZJiYkfxtFHkFc9JjLdjQAhXS/iDDS8VwrV+kTpTAVMLXcfgd2fXr5UYfwh6d+XJlmpeCWZutidHwb2oeeKjXnRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snaceVLeZ9wg7XjH2uPi+B7G17cw53DnzARIyABh9tE=;
 b=GzaDVQHU23zy58z+5gFvE7LhNtY7/7J1U74gjQOjmMtCFf12DIwLRbs77qF8xVsyqp9OP9hQe573JdLRb/l+IH6fa2DrvSXgJ/Q+zrweuuuyxkpkGPEUV9ajOYDE8WQlu1klKMEOsaf0c5yJHUNguqA3XuL5EPXazi9xMGHA6K6peoK4Q5N0LoE3IBlpjADkmlsU+BGtolhZEUkbSWu2h+ssxH928C+wMWq8MHkF8ISTKse1w7l9cBND2p5Z23BSLpNxKhOsiz62dNgR5e4h/Uc4OTVey3BTDSN/SI2G6aLgAiat9JPfY7XDWLf42ew1vAgAmY7eidiFLXceheLFTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 07:44:51 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 07:44:51 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 5/7] gnuplot: fix CVE-2025-31179
Date: Tue,  2 Sep 2025 15:44:30 +0800
Message-ID: <20250902074432.1068537-5-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902074432.1068537-1-peng.zhang1.cn@windriver.com>
References: <20250902074432.1068537-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::9) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: 78262db6-d2e3-46fb-fef3-08dde9f4996c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?H+B/Qx3+akc/hXru6V+FYsIp4W+ga1yuGyyL9nfIB3bM2VVl3jyy8tN32JoT?=
 =?us-ascii?Q?UIp/EZUyR3U/GqtoJN2rUo0jYBo+bJZIRwi7z4h5yUN4+LcVcBjqsi7aqgjU?=
 =?us-ascii?Q?J0G8gMSjuF1xg45I9IY83unSBqnq95IHPrmfQ2vgkflKhhdf/zlM7hHiK/dg?=
 =?us-ascii?Q?8PfbbWNeXytAym6z8/XqSwOcdhmNXjFpsOj2iA63Dnf+Fcxx56rf1iQ4MXGs?=
 =?us-ascii?Q?5lnyiKefQyQGdexWHTleB3MAd0ddc/ZjwpCyyJZ2jqVxvf8/ORG0JsOdPNYj?=
 =?us-ascii?Q?2LCraEp892NUaxfiQVDhFlKsNntrFuq1FagZ5W7ltRZaCGEV59bVBizFISsJ?=
 =?us-ascii?Q?d4VQ+ZQF2/TVBqqQKd44U+Gx8caJUiGAY9wh8IfQva9hgb2Eq+gwsKJQZkMy?=
 =?us-ascii?Q?RT7kjObghEby7gbDaKbxUfvBpefYb2wNPIO91yMW5KbUQrJXS/r0As4N17GJ?=
 =?us-ascii?Q?eUrgTWDAGy3WCMlyAE+dwK5tTS3394O21orApfEeL/tMMhtDlvsI/uAsETj/?=
 =?us-ascii?Q?m1ePi46V4UWczkCd+BtAL0MgnJ7hHIO3Y4qhvxiAIzGWlP+kBUtkLkYC0Nb2?=
 =?us-ascii?Q?seVtXMUtQRHdd0j1XfVZf5fMhq9cHHvz0AsiTp9rqKsrbuPKljsYLDQfnxxf?=
 =?us-ascii?Q?W2YlI+1nNnQdijyrHrcfc/MT1HTyVBx1paE/LleWoETQv5hmnsturOXDkdQ8?=
 =?us-ascii?Q?hkyvxTfrKmU6OLRt5vLagGoXYj/XYs8TRnUSXkV0wIxUGKI0xNPPg5T0wI4k?=
 =?us-ascii?Q?qgk4wnUe9InXcWafbKWIrVjce3ooSVKOAmpaJTUGp5PEgH/ymOX+15MufykZ?=
 =?us-ascii?Q?zfGoGJ7QEvqB1uj2JmPmMh5E7n6DOCR2jqfIXW+lsajugEMsAX1QxXkwTRtJ?=
 =?us-ascii?Q?Oo7AbkWZqoT2u6ntPSlkLuNZkm7/P+d3Qo2Ozl+eiyhdWTXlUTu8lHW/wNpV?=
 =?us-ascii?Q?tjRRc6fjXEviAIYKEx6d63AV66lSGSo0GsvfSONTH5AIe5jUQvM9vM2tBjif?=
 =?us-ascii?Q?vrpWIh/sHAr0nDIaxqRGdBzFLucGWrA/+WczuGk/V1aQ7YZAAdUgyq1ZlSDL?=
 =?us-ascii?Q?g+agOQ3p35WdgBYI/xz9eQDIywpqOKoslZo3VUnphYp8f+iaOB+lF1HN048H?=
 =?us-ascii?Q?TjnG8TEL3Dcx8HUqka1NoxeNqPcwu3qbMmL0105Nf4RQgCY/GrcSMuzgLQxo?=
 =?us-ascii?Q?VmcHBm09TGLUi0UGkPAqkcFdx+7v1CCUiKN7d27FSlIko4PRKFWRlTxxplKe?=
 =?us-ascii?Q?RRLAGTKWyXnWLuahKfgoJqpIFB/z868QS1GYjnWLY6J5eqsgir6brAkXGU90?=
 =?us-ascii?Q?BkS0ODGQx/0rS1qbmD79MUnMUZXF++SkAH5NyAVvNoNFqblk8+cQjeSXfRoj?=
 =?us-ascii?Q?d+g53HGtEV/PX3M4GUSZbFSi9XL9BLHglOISUxGHHe4XTAcZ1x34kjwMgM56?=
 =?us-ascii?Q?F5pLi+/bbag=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?efxD8GK6regkvClYVtqFwjorfx2trr/tdSAjrsJRjYumWd04gISYQMe5sumB?=
 =?us-ascii?Q?IHlsOMYmjNuX6uQ1fv9Kie7/iwtm3VvuS5q6YTyhT1QkSeepj/2KDlYzVhda?=
 =?us-ascii?Q?Wh0jOg9OPItGoI/1r4at9R5xh1UyyQKnFDXvuQiz7xX51eaDaXmo9YJzXxCT?=
 =?us-ascii?Q?PIIKf3O89sBshOjuLdKQfY4iyLB4/gM9oRWbyMwRmwS5GIlbgi4qTnWX0o7I?=
 =?us-ascii?Q?XPFLhX9CQBaf1A8NcISF2/NErGm3UXUhjXfa3PsnF89PcgbKSNqdd2TZf+K6?=
 =?us-ascii?Q?WxvTCXXbecFe01f/GIGNUFBgg/B9nhtBf0daFsVrlMPJ99seVGDMg0IALjpZ?=
 =?us-ascii?Q?L2WC9LLgTdc+/wa4DlQFUcbJTZyY5a2VXYOLjj/UQdxAsGVHw3tWX6q415Yg?=
 =?us-ascii?Q?x8yVj084LruhmTIK9DlMn7m7FNLXfSXCiIo6r79UPe7sdfkgj7ZwahACw4Hv?=
 =?us-ascii?Q?3QBhnW83FIXem9OQ2/5mxhapvaiK61C+4IqaHgFd0QkIqYtjSOuiiKOVZ7Oh?=
 =?us-ascii?Q?Bn6H+Dd4CkfkJ0YtrJbrco3kgFnwvlOK1KxKco4+dqEpaBsRGl1QUlOnD9Mt?=
 =?us-ascii?Q?jrZGTAQ4WKtfk9LkAEvoAxzHAt98JomSB3HwA/f82W+7Th6PMzoKRsQR9r2E?=
 =?us-ascii?Q?VVQMR7LXAIfStAX6Z6B0RMmSmhiCS6DDoifqJJ0epKMLimQCvFk3iD/nCTbY?=
 =?us-ascii?Q?CZNOSTLj5DWT4f33dzk7M0nUae5zlbVrpKAtXKe8ix0+R17NLTje38tvjQP6?=
 =?us-ascii?Q?oyq8CQUF14pb+CrVhdEkzevEqLDkAist9Rb7ITeZoMDRVdpJoAPe405Zph4G?=
 =?us-ascii?Q?FANqdzobFZwtVZy87vsruFfay4DbDX2TSGlbbZJa/1letn+ovigcFxcB/Itc?=
 =?us-ascii?Q?ZC3K/ZIKkQCF8AvFtqdns+w9YDi7BSsVBhMueZ1Dk3LiqfBu9o+VjfhONHho?=
 =?us-ascii?Q?6tugjmU7htZ4/0P/B1TAAUkR/ei2vr5Xxb7QXvlhVVM6gLuQ2XJk3k5uATJJ?=
 =?us-ascii?Q?QplFB5EPSSV9zZfIFt82pTcfjorPweNJaTSOR8Rx2I/LIYj3efHJ/xhwBRjm?=
 =?us-ascii?Q?FyHutPu0vC631Bl1i4fMtq4Fv7IpayWjrpn3edfwMcDD4SfaqKlUEP/h9/r0?=
 =?us-ascii?Q?B1lsSeh3duZvQS2fcCVz/CzV8IN9/fPXiFLjw1fwGX8iyMOq1a3xkPrrH4jS?=
 =?us-ascii?Q?z933LgQQBxkA86wJ9VW8FiZ7foAZEKTh2Z5utt7Eh/pwIA5jSYqgzfgvzzuw?=
 =?us-ascii?Q?CtWkMdTMXcb2S9CHm/UYs7dVW2AJZTWNdYHshcFeGD3Vi6SUWl0O2HJvaRJc?=
 =?us-ascii?Q?7zJ00P1lVW9aZMjJXIrA55d6rfmcRBWrffOXyYO2Y7Rarumv75DFHlkv84ue?=
 =?us-ascii?Q?k4n0OD6aF9iLcuqDKMCeltupecsQ1DY7KkXJhigbblHVb2IxqRXPGqOZ26s+?=
 =?us-ascii?Q?+Rz+lrtCaZEWoxCPMURd7GM9ADnXVVoB2TkTluMqK3YWdvZNZpe+n4ZPTCKl?=
 =?us-ascii?Q?z6nvnaw7536Zx+SUhQMwGwoPuJDRf2MR+UY67ShGJMGXll1p0Hsj6v2gXfcF?=
 =?us-ascii?Q?AS9JiBwe5cVnOTZ7hd0Zube8A3vh3eSlsy1Y/l0gglLgiQIY5spRtZJxb1Nv?=
 =?us-ascii?Q?mg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78262db6-d2e3-46fb-fef3-08dde9f4996c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 07:44:51.4137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ce2+QmO1xbDbfmtxKeeJoMljZz2znKYwrPVep/IEj3C9viuC2zT6ANUb/bMPAdQ/XG36cmOisnoqfUpJGLufOtVEBkkoVAfc59hrJ3gYgNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8562
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=68b6a074 cx=c_pps
 a=B1juiKOSPdvfexZtvkw8XQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=FP58Ms26AAAA:8
 a=t7CeM3EgAAAA:8 a=LANpY1tpZkuJGBhTiYIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: WyGC3HRMKfTdVRa8NJmzItTZnIO59zK0
X-Proofpoint-ORIG-GUID: WyGC3HRMKfTdVRa8NJmzItTZnIO59zK0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDA3NiBTYWx0ZWRfX5XqchbExk5Zz
 0ZM13+EQzrUmdEfzSoAL4E5LAMNogxoW8UOiiuC6IG5ovOUx0fy7LdiGGCVGstdzAjDOYctyQGs
 g2QWSwL5twHNv4DicrSBaSzMb+YkkuuNFn5LyDRMjLk2RQ6u59WhHADvI5+8uabWCFQU985N5hw
 FCSuf/pQW2WXWfmVNTPYkAV+FLei1JDCyd5HVjaSJ9vNpTmKrySB0UumjGrPOShrXdx4NA7qPGE
 XBj0lzXWhWgkNSTy0Wdpd2NxnW8mwjH3OhGEfSR5PzwjrVykvHf1Lrpd/nHECA48rVjUDV9pcv/
 eHS56sVdJK69uWnARhhYuE1BCfH5vt/8KUJqktW5JWvL23kvGZdAU5m382MURI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 07:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119173

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2025-31179:
A flaw was found in gnuplot. The xstrftime() function may lead to a
segmentation fault, causing a system crash.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2025-31179]

Upstream patches:
[https://sourceforge.net/p/gnuplot/gnuplot-main/ci/ed647df512786b3c94429dd5c864715301e03ea5/]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../gnuplot/gnuplot/CVE-2025-31179.patch      | 35 +++++++++++++++++++
 .../recipes-extended/gnuplot/gnuplot_5.4.3.bb |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31179.patch

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31179.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31179.patch
new file mode 100644
index 0000000000..a7ec6e78f0
--- /dev/null
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31179.patch
@@ -0,0 +1,35 @@
+From 92c147cbcb8c28e4662963b378fc31e1d58c72f2 Mon Sep 17 00:00:00 2001
+From: Ethan A Merritt <merritt@u.washington.edu>
+Date: Tue, 11 Mar 2025 16:31:23 -0700
+Subject: [PATCH] guard against trying to format a huge number as a time
+
+The time formatting code does not handle time_in_seconds > 1.e12
+(sometime in the year 33658).
+
+Bug 2779
+CVE: CVE-2025-31179
+Upstream-Status: Backport [https://sourceforge.net/p/gnuplot/gnuplot-main/ci/ed647df512786b3c94429dd5c864715301e03ea5/]
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/mouse.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/mouse.c b/src/mouse.c
+index 1571144ce..86dee805c 100644
+--- a/src/mouse.c
++++ b/src/mouse.c
+@@ -513,6 +513,11 @@ static char *
+ xDateTimeFormat(double x, char *b, int mode)
+ {
+     struct tm tm;
++    if (fabs(x) > 1.e12) {  /* Some time in the year 33688 */
++	int_warn(NO_CARET, "time value out of range");
++	*b = '\0';
++	return b;
++    }
+ 
+     switch (mode) {
+     case MOUSE_COORDINATES_XDATE:
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
index 7dfe4b6657..c05ecd2b95 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
@@ -19,6 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz;name=a
            file://CVE-2025-31176.patch \
            file://CVE-2025-31177.patch \
            file://CVE-2025-31178.patch \
+           file://CVE-2025-31179.patch \
            "
 SRC_URI:append:class-target = " \
     file://0002-do-not-build-demos.patch \
-- 
2.50.0


