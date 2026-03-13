Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D20105F79F
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 12:11:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14339.1773403880846004617
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Mar 2026 05:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QrWJtHP6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75329b8642=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8rlpg2883101
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 12:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=94WEVVYNl+bEEm6c+r6s
	6iRXBPMj4Sd0r2a1yVOPf0Q=; b=QrWJtHP6cBsM85xgX8ztyb0Q31OKIMLl+5jv
	wNrfVpQpcvn5v+JDKyZMXzX3nLjt5d7RTRnM8dFhwy/jByMiWGy4J8OTtjBFLHe8
	D6MEBzjKrUjBJ/E7oKNh0VYtJ3p9iNeb02aWorM+N9bunV3w+Gv5MDL8qsSCzH6O
	sTDLQoYre5xhpQ3EpG0YcGELlumlcbLOw9J/4qcxK3pZPkzUg8kKDgyvEYUKd+Xw
	wb9GyC70B/D14ZaPHsNKPUwgJyj4i7udOrePixX7ydUPhBSVkkUk4lezM6XI2d0m
	qOGrOvzF1rJFdTzAbvzCY41PaCZi5QSpkWwUr4C8vudTE1s2wg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010000.outbound.protection.outlook.com [52.101.46.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cutxqshvr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 12:11:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GNmBYB2FOlbu0ngSqK+VHJS2jyQTFUtB1jSlgkeLxn2F3/9a0CnXi6j4GnYug4UbZ5vaPcAbKK3TZIX5tHhX+td9JVZClgffm7LWlwXgasHiOizEaF4ZiImkiYoJHdsF2jtm9XxvQ/N3A2uKva0ppkekE0F434QwAYwq8plVr68DxwVurvKNC8rE7UJ7j5Qo8+iCTzzy/CNcqpdKYc7Vw0sflBT7qWRrTvskNitvXO22nDG0t+zxXynVqlrNm3KSLwngwp9hB7JiwX5VPHqbLrGkZkq/b2E/E2v53QgQOLQopvM79pykXn40inw2m+pirZCvYwTQuljZ2vtxecZhog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94WEVVYNl+bEEm6c+r6s6iRXBPMj4Sd0r2a1yVOPf0Q=;
 b=aU0YQ1mBv52nzUHpMoHIpSYVXRCsLOiiMyYxRmazZ5LOcsIPeSViM+1NOFWPD2Zshv4kyAtamCaKUqZgYSR1jhuyglUG9aV09mg4m80eA1FGwgRDdnFI1++US/piCoDGt9aAkhGwgISfgroOzgco9swiMurNFO0rEYDKR9BgvZ0zS0FF6HueR1j1aZU1AinCRiVaYH4jY8R86F8pGw4AUtJBuMDeQgeVNWDu9NdFiQ05X3MxSh/6buE13cWgHQxHgJ2i9OrxD1TRzjyx6KKDmkT/nmIHZamwn4HWmx1hE8Xno5lLuPpGVpKgdbBLh/8xLGTEtNtpYotQ6q4ELUV2pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY5PR11MB6307.namprd11.prod.outlook.com (2603:10b6:930:21::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.8; Fri, 13 Mar 2026 12:11:16 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9723.004; Fri, 13 Mar 2026
 12:11:15 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/5] gnulib: upgrade 202401 -> 202601
Date: Fri, 13 Mar 2026 20:11:01 +0800
Message-ID: <20260313121105.2180430-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0105.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bb::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY5PR11MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: 6021c675-5ad9-4179-7e3e-08de80f9a01a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	khtFIVaqOvm17sT+aahMRkbJpNpxq4SuGGn5ZaXLOfjvGQObUTrakrqBK4L6UfJOxt2msJt9t8JYDuUQykL/VHBFCChAX5bptDiIFZPlcINUP8256a6T2W2m4EpuzTjD3BmoBQMd7bzMukwPMADAiiKLysQ5V1wgm0drIIM+QNwv7NjubSi2wkJqHIJ2VKFYElccZSwbIgs/bkofpuJ7CgKHQRAi0yOBWnaoh9OtSJnNQQalFnh4GEHfyFexwDMA0mdODmo3deRqCqZSsnPFtySal5IRqN+vdYlrkCg5hSSSgMI1uvmtXQrdIp6LTAYXQHcaEx4rutTZvXgBgD9+6ZsFgf3w77FMnW+SklW0FYm0f3n5/1yZ61gzvrPrdmBWvXCkygpBKjAw3maulnqVH2h/ZYiGCa4/dszTqyW/jXv7iz9+iaRIdPYtsWR89xzDy+q8EKWLYLJHpc7UygJU3KEn9kuUPadhgN4U7WQEkzn/Et32qddyCkRtJDy1B2l5fZu8ws0GKgvgqqCwVUazDysLBnT8J8L4Y/2lSCxugR59HaEfCSevJ3W83hfKVeKJb5FqRdJ7wr0SSdo/4InEb9UH6TaKeuGZITptIQARiKFGxGmMo5mU3e2X6bXpbiG0YCaPf3ZmglV9YNJPNkINxzUMtMGS2RUMGv0lcoEiqBruyTtRV8YwRo6Es9EcDp5FYFGlOjvoAtEXxa3dtEP/B/QnaZwCzdQeBRhXVDgrDanPrnvpFBxm9iXLIGV/pnSvmx1O1Eb3jzMEPSfoxXcAAZIFYhm0Vje7+vOG76WS+XE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Il/ixydaiNuYAIIsH6YALcJIlYNFqDd3zUMEvv4lE3agoez52UbO3HK9PhWH?=
 =?us-ascii?Q?CgsS9bldIw4nCArsx5WWgljjTHlUUxUfpZFlfKjjXox/aEWAYIv7HAosKJxQ?=
 =?us-ascii?Q?ngij7Ii3cg5mgvOvQkjE8D6ViUE/n+3G6nJjLmlEUyT1Isdk/gyg/HSKPXpN?=
 =?us-ascii?Q?X38zh4kJiOacEeYP5t6UmJoFE3QoP3KRU62pwn9Rtk3LspEpoUJg8f5ZFgtS?=
 =?us-ascii?Q?D52Cco+Gue9e5loe9xLsjn8w+218qXW9DWlA4v4zln3OQqMGHHPStA9eU9zx?=
 =?us-ascii?Q?zIxV/VuNZEZ+VZvCQ+GCe/txTIq2CO5N94NMmR+9jUoo9ULbmuP3l5tljOv2?=
 =?us-ascii?Q?O8xbbCLZmgCIMwjR958WNC5QBmRN3/iFqZgNrGvTkr1cbaatMvz3VCFqHsdn?=
 =?us-ascii?Q?c5v5OcswyijMKwNJxxJYYTndmQ4ofA/S4y3mdKNfxXDLvAIfVOtASRPUXluz?=
 =?us-ascii?Q?tXuz8qPr99giOzpa0d0uAMab9+28sxjn7ReBqWN/YWqz7nP/dir/6AyAySGP?=
 =?us-ascii?Q?P4M6a09XUpuQu0QIReo+JjdL9TuSeztClPevpE2O9wf0715yQE0nuMD39XZx?=
 =?us-ascii?Q?T25kbjOWrZ2m7Duedghv9D+/MF2KmLt2lqW1Pij7k2bWOz8YsnViJGeCF8jn?=
 =?us-ascii?Q?jQqonDX8GpJ8I9O35UyoMt9fmwWfGo+qrD4vFNeoB8EJXpHgb9pZB3z2g5m9?=
 =?us-ascii?Q?Gw6ekPZ8LSqGTLejzh7N1ruzECTmjqpe9PSychWN+UYFmNF1uxf8V65IBmg0?=
 =?us-ascii?Q?RERhG8ont2c9M43TWr36t5qStwwGTLGT/HOV0pXgqRwWsbLD+IXJ8IeUpoTD?=
 =?us-ascii?Q?0zLMoB6bjokAbFVAqBritdTeNOXcu0RfJdNYN70wROA9GZGJbBK0rV1sysNJ?=
 =?us-ascii?Q?fG2o2UnSpaVE1eON3fQ3IRpVduBCHygfSgTuKV6rN6ooDAdcclz2TOjV6hN2?=
 =?us-ascii?Q?rDHYdkJMSmIYnQfR2CO4sutsceiiDl/GDjbKAo5UP/pwqF1M/QeeWfsFtoCk?=
 =?us-ascii?Q?FG3hBPH/tzmL0PZsYchAWvEcJxjQtieErSf0pHEwphMpWAAzzD3U0rmOZyZC?=
 =?us-ascii?Q?n5IFKPFD5mlQ9SNG7D4Uax0459ArK43HXIN1zI5nhyYtfU5RUdF8jHy9rMIJ?=
 =?us-ascii?Q?hWiIHUP+JcyVRWYHUGnzIlGBeHRa4sKTnisw5z9Hhi8J0TZ70MSIq92KdDNy?=
 =?us-ascii?Q?3KAn7dq90NqSeqzEZjOUbcv/lzzpr0Cn3AuHpWcx6g2Gci5cfVhUIU4j7xmC?=
 =?us-ascii?Q?YvqcaROA6gsy+H7ZrpXCJTZ85vVQGOi+JjCfCrmY2UY++9rxFggfloIfyGBM?=
 =?us-ascii?Q?cSkAoAUUMvhHJ3uvkBF1I1F0D/BhrpFdd9V+OQRa7kky1Rn22HqHSTqoWpGE?=
 =?us-ascii?Q?SIAq8l6z5IzAW9SX5hsjmhBm32HqKieDq677bdFWvl415K5cABcjQPY3nkVe?=
 =?us-ascii?Q?XrgMV/KlZcjeOveJ/8iXSIThVPsgxftXumnrdOGbKa496MfFOZexrZDiClbi?=
 =?us-ascii?Q?G2yJpYUi47whkrAdi+KLoo/iJOXhELBrjXW76sLyDO4N9L+rRL8YIsmhY+LD?=
 =?us-ascii?Q?VmL8H/+nD+xL05G+BooU8f4i2o2XLyeEVC4dRh7v/tmF4rm2CnFmhvf2oR4s?=
 =?us-ascii?Q?NuHKQCWOA/NMwCJ22hzkDK0kkrSelLxQbGa9eikBWLeAt8aJaKPLmTcxWMG1?=
 =?us-ascii?Q?zXPGoVbjOj10aE+TIFYbZzcyhTMLwHbvf62+g40n9GiIAloMh+d6e029iJ3e?=
 =?us-ascii?Q?0HVO1vnHQA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	JcXeIQ5CslO4yx5avT2P5/w5z1axmLmeUbMvCiHua6Dn2hnK8Qp2JhZcMaK+mLBqlYXSxJvAmlNU2ngbONXyV9CXhiqG7QoUid4aRClnftsZgbBNOH7tQ9fZSbJRJ3Txk0BUAbBDs78EQfVONNfi0sIHqsYo2fnwnCZERmnZ54zjia/ejj6JRTq46GoUx4h38JOfswQQi+n2vStmx5ubqWMKudhRUAlsJoQqUI+9okNPI6nYy2oz3nC7FBVBecazLudSOd/80sQP8TMKCEfzP0w/kDxeMXC9cRgpPH+zfmM7jojuAFfPoBTpX2FekPd3m2jbj1F7MFkJ1UsCTmmWfQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6021c675-5ad9-4179-7e3e-08de80f9a01a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 12:11:15.8914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U74sHwHTJNRU8a9Q5UWINC+w51it/aWHBdBuXOklEHEThKT88G2MQZ8mJHx7GtkYGqS1gcc8Faske9a6LRTQdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6307
X-Proofpoint-ORIG-GUID: 1vcK5YAP5NlbTCqvkG4SxPdtnChp9v2E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5NiBTYWx0ZWRfX5YALeS5bqCTU
 vA2hSYTI+5ocntSkV51OZXYj6ey+QW/ZT1Nh0WDnt03P42bSpYE78GzKatXcG0CxExQGw1dapmC
 7S4dUarygWpPanw7rf4FJhkEeyCDNocUDlPAD3IyCwn8YxJ5xiD1xmtN+ZHMqkeUbBmnz0WP+Yt
 2TG4ZX2mIWAO4/hE+esdS7BxTpRjueurxQW5FUv6UsV0gJO8NUwb42EFB8ObD/dG6HaK4TVQIs3
 8RwYSG4tNJ9WfQz8q87Ats1r9Mracl5mkiOqMswGDnSittG1Y7Yn7Svf6FPzyMfwxvB+1ix1+UC
 ZoWB6Pj/YVvmN0q+f3EMkDW/JkI+CNqffAa1QZMNZCj65q7wzsAifC4wQC0VNiAmzQKJoD4p25j
 m+FelJ0akwlvkpyEH/FNH2Y+dzg8e4OEpnE2VURaueHRv1SIho4LFrr0U63IGl1OKudEfu2VY/3
 LO/uK43npKtlQj6WKGQ==
X-Proofpoint-GUID: 1vcK5YAP5NlbTCqvkG4SxPdtnChp9v2E
X-Authority-Analysis: v=2.4 cv=feegCkQF c=1 sm=1 tr=0 ts=69b3fee7 cx=c_pps
 a=fUX3CcU6CI0WA5Nw0mDYKQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=CMEv7c_xbzY19E10vnQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130096
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 12:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125187

License-Update: Remove statements that are not true any more since
                2021-06-04[1].

[1] https://gitweb.git.savannah.gnu.org/gitweb/?p=gnulib.git;a=commit;h=5e1283bb13d74c6619afb71c6a322c648a8cc91e

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../gnulib/{gnulib_202401.bb => gnulib_202601.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/gnulib/{gnulib_202401.bb => gnulib_202601.bb} (89%)

diff --git a/meta-oe/recipes-support/gnulib/gnulib_202401.bb b/meta-oe/recipes-support/gnulib/gnulib_202601.bb
similarity index 89%
rename from meta-oe/recipes-support/gnulib/gnulib_202401.bb
rename to meta-oe/recipes-support/gnulib/gnulib_202601.bb
index f3fbb94ae8..d3ebdca8dd 100644
--- a/meta-oe/recipes-support/gnulib/gnulib_202401.bb
+++ b/meta-oe/recipes-support/gnulib/gnulib_202601.bb
@@ -10,8 +10,8 @@ HOMEPAGE = "http://www.gnu.org/software/gnulib/"
 SECTION = "devel"
 LICENSE = "LGPL-2.0-or-later"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=56a22a6e5bcce45e2c8ac184f81412b5"
-SRCREV = "c99c8d491850dc3a6e0b8604a2729d8bc5c0eff1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ef5bccbf6e492f82800e68bdeab302eb"
+SRCREV = "4a3650d88725e8fda6387fbdbaa0ed98cdca76ce"
 
 SRC_URI = "git://git.savannah.gnu.org/git/gnulib.git;branch=stable-${PV};protocol=https \
 "
-- 
2.43.0


