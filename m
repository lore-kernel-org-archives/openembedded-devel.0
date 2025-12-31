Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18FEAEE6457
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 15:39:33 +0000 (UTC)
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87151.1767195379038499848
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Dec 2025 07:36:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=B++zASIN;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=Uuh9XF1n;
 spf=pass (domain: garmin.com, ip: 205.220.165.212, mailfrom: prvs=6460acd53d=colin.mcallister@garmin.com)
Received: from pps.filterd (m0220294.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BVDiDGl019659
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 09:36:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps1; bh=Hk1ot
	VlVGCFJsSFx+HKHRzLfbPqas/b5ayXiXqkgfSQ=; b=B++zASIN1aeTtPEN9wIGO
	0FtyBC5/2wL5d0e9LX3Obi5GOk2zo4ffR8Wq0TSwbGZvGTlXZLUQBwQBjSqpHAIa
	AJE9qeYqkVKdRiT3gAuxSCcBqSMLx4/Bn5AczDbnl3DPZ2EG/bs7/Jxztv9bQgkn
	QVSpa/wDmM2aN9Y8zxjrOTICUeYe7briw9wxjTo6KaWmJUwTIeWxed8fp/5Z9Ayb
	JRX7QLrnhzLLNaePlNxBDWjWvPlVJYy2oiR9M3CnttOho1Zxn6vk6crAABzVuzTi
	pv9nURXkgn/VheGtOMY5+vJpoE8XQTmfyY5ttpMPvGaelY1eKI7fIgyBHmdIiWwd
	g==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022141.outbound.protection.outlook.com [52.101.43.141])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 4bd19jrd9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 09:36:18 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4z10Y8zVYAA1nraYvxOK2Orgzk9nHhSMac+kE9ZwR98t2/QQmPBQfSoiwdSYd+Qx31QIMQXWPoF/+bDlS+YdKpMRIB7WbXyzJqX/YdHfOQ1lc7oumWpFZqyD+y/ZgP/vlYLRu2mnSUjs15SDgnL+3pYJcnHGf8ELW4081qFn4vO6+B3RpVx4Dh7WZ0ojaL1WXRvtCxLezZ8HCQUPFIEE4MS7CaJLTy8euMCcUJElFKOmMpUfIC4JD4IpZTn3f+ociSj+3NohPYyP5ui5iuv7IEDZEyIP97b16z6CDOabgOMHy1mMFsK7YmR1K7FEbuRYu2NKXUuDl4T4n9y+PpYMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hk1otVlVGCFJsSFx+HKHRzLfbPqas/b5ayXiXqkgfSQ=;
 b=YcHFjdoTppU1n1NWzmLT1ZiRFhruMqm9wcaBcPihvi4D+PPtu1RRl7NQlNLGvS6UTxYHemmT7CW70MWVqkzVEJozDdZQVcwSt4vkMkoznDwAXvdkqwDs6+kRQe9v1g6v4KFB9I82TtIblvalck6Wg9jlm5q0btyoLGAydmJHjzmywhMGoaN82PvJxFfShmfyONz+IO0g1E6BA8ene/8iXmAhojUSwhg36CsWIAnDFa832+C78iHSkIVrOyNOX9us2n1yPpFC1+ziLzyHYpyYpVgbiJwWjLVokSrSVL2m9xYefkj2t41jtRcqMElq7Tri427vCT8uY9aSJA0kDlvhUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=garmin.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk1otVlVGCFJsSFx+HKHRzLfbPqas/b5ayXiXqkgfSQ=;
 b=Uuh9XF1nj6zpO+swbXb+X089wNcSWkFNcZ8ZhXLJV9zD7ihLSYBjZT1KAV39ZG2vCI/uSuwUZM1/WhfCnq4ve9STSq3czi7apKsdZrFPAz/2aYotxAWaJdFUl6x1FkHObPiC2/YwUkS1mfXbEFjUmqhQDCkPF7IbL6TaGLRP5xfx+r0KRKgSdw63zQt4lMGSFxUpqb+rtRqtwi30IsXN6TUgc4MuDPDyuNG+gzAcx18iopwcKEdB1nHKahk3yS138oyRua/pAen59eDVgrgHmsfXpyBvAHhfhPpQP3Fl8IhOA5d+7fE7B6uJL5taA/WYViSRiGQmiX6Eg3CogAuuCA==
Received: from MN2PR22CA0020.namprd22.prod.outlook.com (2603:10b6:208:238::25)
 by BY5PR04MB7043.namprd04.prod.outlook.com (2603:10b6:a03:223::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 15:36:16 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:238:cafe::c6) by MN2PR22CA0020.outlook.office365.com
 (2603:10b6:208:238::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 15:36:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Wed, 31 Dec 2025 15:36:16 +0000
Received: from cv1wpa-exmb6.ad.garmin.com (10.5.144.76) by cv1wpa-edge1
 (10.60.4.252) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 31 Dec
 2025 09:36:14 -0600
Received: from cv1wpa-exmb2.ad.garmin.com (10.5.144.72) by
 cv1wpa-exmb6.ad.garmin.com (10.5.144.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.26; Wed, 31 Dec 2025 09:36:15 -0600
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 CV1WPA-EXMB2.ad.garmin.com (10.5.144.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 31 Dec 2025 09:36:14 -0600
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.71) with Microsoft SMTP Server id 15.1.2507.57 via Frontend
 Transport; Wed, 31 Dec 2025 09:36:14 -0600
From: "Colin McAllister" <colin.mcallister@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Subject: [meta-webserver][scarthgap][PATCH 2/2] nginx: Fix CVE-2025-23419 for 1.25.5
Date: Wed, 31 Dec 2025 09:36:07 -0600
Message-ID: <20251231153607.3978985-3-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231153607.3978985-1-colin.mcallister@garmin.com>
References: <20251231153607.3978985-1-colin.mcallister@garmin.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|BY5PR04MB7043:EE_
X-MS-Office365-Filtering-Correlation-Id: 85620dce-235d-4a94-a733-08de4882562d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LqLbm/Z7+sf+uanzkZC8yadK+Zh4qeAK3wiLcLAqFvP8rqjx4mhCtu2FfLFQ?=
 =?us-ascii?Q?B2LoFf1w3TtdY1sHIi2SvmBL8gBDVWP12qxQxC0B/Pk3SpDxMHm9AxddsBs7?=
 =?us-ascii?Q?j9SndmG6vIvJLbNT/eueW6GR5j40V6yArdLbs4nwtpAWPqgx19xgRCRVEdG8?=
 =?us-ascii?Q?vpKkXDQfRAjg5PzX2Af/0yaCEDYZm79/bF50jp7UuwsF6AfjWgwokRRT3inD?=
 =?us-ascii?Q?VEjnLNRky1pbwJCKFHXXoQxE8jGb17smvNcLaBBMyGDfa22ys6NJK/HUFB+X?=
 =?us-ascii?Q?Pno/G1T9Jhv9vNH5ndQ2+ie36YqoJEoCHfTOTHNnM2CbGe+BPY/criZ0XmQa?=
 =?us-ascii?Q?pmpYMdcp9bT4ziM3CM0wees2YhofZX7MHlVHKhajHkgbHPa7FD2UoqR8PIr7?=
 =?us-ascii?Q?mvNJSPsWNWAeqtPM98lASbIS/c5dL9JkJALY/iXiMpuDt7Nrv4roIYWkXiUx?=
 =?us-ascii?Q?pqiUAoEXXInKrkJDY4mr4BpXoIqQ3MS7dLQh5QhazNeZjBhJPB/0+2yKRasR?=
 =?us-ascii?Q?8+DO2tWPOOVVaVA4cNXPLnRcRNFVHLTCdn9q+T7p6FoU6LdsaDgobG+NzWDZ?=
 =?us-ascii?Q?3xna4X9mGVR3jkIRrF2fsKNTWoA+1Xpl82ALwjEE+WwJHHSgGTnpMb8fGRB5?=
 =?us-ascii?Q?DpblW3H2DRwb13ouXoXGWyJ+hh7AXZgQoMyur6Um1YDDdawdw7QmIBJgkOTQ?=
 =?us-ascii?Q?56fwNDJjL8/ps2VN0i9SfIJyUTTrLOdUD9j37awQZlizT3ApyWo4Mv/gThme?=
 =?us-ascii?Q?qX0DhIrZwjCkuNqhyc4XX4HPUr/GcYoQ8ow5rChy0QPYzN25zn1kiwftn2YG?=
 =?us-ascii?Q?H0UedLPV365jY+2SwNciLVILZVcBhXlMSyueEFBXJjl7202U8T6uFFJrrrdf?=
 =?us-ascii?Q?j3z6ulF1/kIkkfgWhaB4VAZfDOh0eZ/5ra2RRsUAlWVFgeHwlJU4wIGYhdRu?=
 =?us-ascii?Q?ayyn4Z9i+DDXazngfWMerKTKUxpfHBRl5XaEGnuKIa8p/B2RxJ4wrAXwzR1M?=
 =?us-ascii?Q?Vr/uPDcH546ZLsixDe20OssaNylSO7J+nY9gvS20U3gCfXQKRMIDMYsF3E/y?=
 =?us-ascii?Q?PgZ0EiYYK5VssqlWXYNfsLN4kptXZMZoE6L7CJZ5SDAtzKTXdOivWkyZINH0?=
 =?us-ascii?Q?ur4tP/DFtOA/Z7C6f/bGO8EUKcV8tAtg+9OgvrNRApbSgqLIhadUCYXxWjLQ?=
 =?us-ascii?Q?XNvy+zmgwzm1y0TX4eQqyU19eLT7yg13SiqtOVSk2n9T0f1aB2mowtsr4ocy?=
 =?us-ascii?Q?hIj9IdIA0jn8idx6QmycazQrjLAR+Rkx1IDOQd3F/LrPkAwQoo7A7aieVjXR?=
 =?us-ascii?Q?ZFuA9HIltLYpUgSOkXTFfCc8FLfhip3IbohdbqieCv7zdJhZhybx8Wau7e5y?=
 =?us-ascii?Q?74Vwko4biUZW6l7aCsRsPW4uDZ41RhAT8ZnFmIO8pf+E2HMmE3zZOwWmCswT?=
 =?us-ascii?Q?fhuDzHUs0PeJMJgnn9B5q2z4BUeCm9LIH7eVW5EFc1Zpkkg7bduGMDL6rnWY?=
 =?us-ascii?Q?mBSe0TVnDtLqfs3f4/r4P6cIfh6vIQO/0WEO49Fv3Jxz8ZX9NesD76uwJimu?=
 =?us-ascii?Q?LL75ci8luF90pjDC1l0=3D?=
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 15:36:16.0676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85620dce-235d-4a94-a733-08de4882562d
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7043
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEzNyBTYWx0ZWRfX3c8Pf6rm16bt 2VIcdAlXGbMy0QiG/LUyJcexsk3zEB+bMD6UGhXzKAOnEp7GnZh0sN8tLUzV3f+FpCq4aJS3tEG LzP8L7HGwDA0zUadGzSG7bYAPJ3kPBubMQAow8DrvNCdJcdHWMmYG8jlRkpzeF2ULnfAwNlZJqB
 EbBxRcv3xiHswl6b8/y2Y1P9JEeM0D9yzX4b8qPxGf1Vrnd2/Fz4IzYbDPaz3y4ZTpa09jyFO1l EP2CVQcu/JeGoLXnwT6acQEvuikxeASbNUHHGycBbJiJBHYU8GrupyTvzhW0v0JMaAtYqn3QETe uoTKm1AiZGiy7r5hEnmufQVqEb1/o+nd6+by+bWEhbi9WtNunek/DcjmQ07zBs5tAeSVlaNlQc4
 tVTQsgebhRN4M8IF2DB9Mybigw+wYlAxGqY6V8ZsUKzHGCK0MH4vZcutUKLDQ4COu592O+eX6eu F5y470QQRvta08NsV9s6jf2837w6ShzO1z7ZidSQ=
X-Proofpoint-GUID: MB2KUXLa0Cy0s0XeAQugZGVvnMEeMo35
X-Proofpoint-ORIG-GUID: MB2KUXLa0Cy0s0XeAQugZGVvnMEeMo35
X-Authority-Analysis: v=2.4 cv=J/ynLQnS c=1 sm=1 tr=0 ts=695542f2 cx=c_pps a=fy38adKFcSgT6GDlyky2Fw==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wP3pNCr1ah4A:10 a=qm69fr9Wx_0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8
 a=NbHB2C0EAAAA:8 a=L4EWI0dvAAAA:8 a=QIhr-27iAAAA:8 a=A1X0JdhQAAAA:8 a=pGYSgU9NIrG6GRB8l4gA:9 a=cgaYBWEFosGJW4rWv5Lf:22 cc=ntf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_05,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc=notification
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2512120000
 definitions=main-2512310137
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 15:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123077

Updates nginx.inc to apply CVE-2025-23419.patch to both 1.24.0 and
1.25.5. However, a unique patch is provided for 1.25.5 since the
upstream patch for CVE-2025-23419 can be cleanly applied to 1.25.5.

Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
---

I'm not 100% sure if this is the best way to handle overriding the patch for 1.25.5.
I figured this was better than having two patch files both in the files directory
with nearly identical names. Please let me know if there is a better way to do this.

 .../nginx/nginx-1.25.5/CVE-2025-23419.patch   | 119 ++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx.inc  |   1 +
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |   3 +-
 3 files changed, 121 insertions(+), 2 deletions(-)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2025-23419.patch

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2025-23419.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2025-23419.patch
new file mode 100644
index 0000000000..d1c5bd9b40
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2025-23419.patch
@@ -0,0 +1,119 @@
+From 2de0d3fd114e9d3d6a56bd7298aff8c637063509 Mon Sep 17 00:00:00 2001
+From: Sergey Kandaurov <pluknet@nginx.com>
+Date: Wed, 22 Jan 2025 18:55:44 +0400
+Subject: [PATCH] SNI: added restriction for TLSv1.3 cross-SNI session
+ resumption.
+
+In OpenSSL, session resumption always happens in the default SSL context,
+prior to invoking the SNI callback.  Further, unlike in TLSv1.2 and older
+protocols, SSL_get_servername() returns values received in the resumption
+handshake, which may be different from the value in the initial handshake.
+Notably, this makes the restriction added in b720f650b insufficient for
+sessions resumed with different SNI server name.
+
+Considering the example from b720f650b, previously, a client was able to
+request example.org by presenting a certificate for example.org, then to
+resume and request example.com.
+
+The fix is to reject handshakes resumed with a different server name, if
+verification of client certificates is enabled in a corresponding server
+configuration.
+
+CVE: CVE-2025-23419
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/13935cf9fdc3c8d8278c70716417d3b71c36140e]
+Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
+---
+ src/http/ngx_http_request.c        | 27 +++++++++++++++++++++++++--
+ src/stream/ngx_stream_ssl_module.c | 27 +++++++++++++++++++++++++--
+ 2 files changed, 50 insertions(+), 4 deletions(-)
+
+diff --git a/src/http/ngx_http_request.c b/src/http/ngx_http_request.c
+index 3cca57cf5..9593b7fb5 100644
+--- a/src/http/ngx_http_request.c
++++ b/src/http/ngx_http_request.c
+@@ -932,6 +932,31 @@ ngx_http_ssl_servername(ngx_ssl_conn_t *ssl_conn, int *ad, void *arg)
+         goto done;
+     }
+ 
++    sscf = ngx_http_get_module_srv_conf(cscf->ctx, ngx_http_ssl_module);
++
++#if (defined TLS1_3_VERSION                                                   \
++     && !defined LIBRESSL_VERSION_NUMBER && !defined OPENSSL_IS_BORINGSSL)
++
++    /*
++     * SSL_SESSION_get0_hostname() is only available in OpenSSL 1.1.1+,
++     * but servername being negotiated in every TLSv1.3 handshake
++     * is only returned in OpenSSL 1.1.1+ as well
++     */
++
++    if (sscf->verify) {
++        const char  *hostname;
++
++        hostname = SSL_SESSION_get0_hostname(SSL_get0_session(ssl_conn));
++
++        if (hostname != NULL && ngx_strcmp(hostname, servername) != 0) {
++            c->ssl->handshake_rejected = 1;
++            *ad = SSL_AD_ACCESS_DENIED;
++            return SSL_TLSEXT_ERR_ALERT_FATAL;
++        }
++    }
++
++#endif
++
+     hc->ssl_servername = ngx_palloc(c->pool, sizeof(ngx_str_t));
+     if (hc->ssl_servername == NULL) {
+         goto error;
+@@ -945,8 +970,6 @@ ngx_http_ssl_servername(ngx_ssl_conn_t *ssl_conn, int *ad, void *arg)
+ 
+     ngx_set_connection_log(c, clcf->error_log);
+ 
+-    sscf = ngx_http_get_module_srv_conf(hc->conf_ctx, ngx_http_ssl_module);
+-
+     c->ssl->buffer_size = sscf->buffer_size;
+ 
+     if (sscf->ssl.ctx) {
+diff --git a/src/stream/ngx_stream_ssl_module.c b/src/stream/ngx_stream_ssl_module.c
+index ba444776a..6dee106de 100644
+--- a/src/stream/ngx_stream_ssl_module.c
++++ b/src/stream/ngx_stream_ssl_module.c
+@@ -521,12 +521,35 @@ ngx_stream_ssl_servername(ngx_ssl_conn_t *ssl_conn, int *ad, void *arg)
+         goto done;
+     }
+ 
++    sscf = ngx_stream_get_module_srv_conf(cscf->ctx, ngx_stream_ssl_module);
++
++#if (defined TLS1_3_VERSION                                                   \
++     && !defined LIBRESSL_VERSION_NUMBER && !defined OPENSSL_IS_BORINGSSL)
++
++    /*
++     * SSL_SESSION_get0_hostname() is only available in OpenSSL 1.1.1+,
++     * but servername being negotiated in every TLSv1.3 handshake
++     * is only returned in OpenSSL 1.1.1+ as well
++     */
++
++    if (sscf->verify) {
++        const char  *hostname;
++
++        hostname = SSL_SESSION_get0_hostname(SSL_get0_session(ssl_conn));
++
++        if (hostname != NULL && ngx_strcmp(hostname, servername) != 0) {
++            c->ssl->handshake_rejected = 1;
++            *ad = SSL_AD_ACCESS_DENIED;
++            return SSL_TLSEXT_ERR_ALERT_FATAL;
++        }
++    }
++
++#endif
++
+     s->srv_conf = cscf->ctx->srv_conf;
+ 
+     ngx_set_connection_log(c, cscf->error_log);
+ 
+-    sscf = ngx_stream_get_module_srv_conf(s, ngx_stream_ssl_module);
+-
+     if (sscf->ssl.ctx) {
+         if (SSL_set_SSL_CTX(ssl_conn, sscf->ssl.ctx) == NULL) {
+             goto error;
+-- 
+2.52.0
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 945be05c6a..865d7f86ee 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -26,6 +26,7 @@ SRC_URI = " \
     file://CVE-2024-7347-1.patch \
     file://CVE-2024-7347-2.patch \
     file://CVE-2025-53859.patch \
+    file://CVE-2025-23419.patch \
 "
 
 inherit siteinfo update-rc.d useradd systemd
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
index ed18b6471d..e5666f6fe6 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -2,8 +2,7 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=175abb631c799f54573dc481454c8632"
 
-SRC_URI:append = " file://CVE-2023-44487.patch \
-                   file://CVE-2025-23419.patch"
+SRC_URI:append = " file://CVE-2023-44487.patch"
 
 SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"
 
-- 
2.52.0


