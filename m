Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E38B2C79FB3
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 18:14:02 +0000 (UTC)
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70668.1767636386637828245
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 10:06:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=0TLJjiRF;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=Xh5Wo0BT;
 spf=pass (domain: garmin.com, ip: 205.220.165.212, mailfrom: prvs=6465f1319b=colin.mcallister@garmin.com)
Received: from pps.filterd (m0220296.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 605H2Bf6022921
	for <openembedded-devel@lists.openembedded.org>; Mon, 5 Jan 2026 12:06:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps1; bh=r6PBl
	mSFiyMJHVesh0UGw9BbYjXuQIWFhqqv4Xs0BJg=; b=0TLJjiRFqXNmIvYNpqV7v
	0+hjg7hZFtvL3fuxfphP1iRtt5aZBokhHHn8le8WTnkKtZfCMc+3DpBGafJu1hjf
	O72uhuZ3W9TvKYtI4nWHBy7c+N2Q0W6XwNJT47AAYxUFOuUs2MRncFyAy0BMesoN
	NGbWhubGNr0YcEy9jvv6AlOKu3Gjla97f7sJjewE3zknTkDd7/G1vQobQBuu5rX2
	+a9ifOZQcGFw4SQQSA2YFeaczI/mN7eIHabJ3mX/M3lbN8oG9ZJn0YaJWylg7kgL
	NzF7nqo/IQgf1hrTCQWFBNHZZwc7COVFs2/yayhXR3ZMrM64gk9gE1SetGj+Bg3u
	A==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022134.outbound.protection.outlook.com [40.107.209.134])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 4bgcbrrtk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 12:06:25 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XomispF7EnOgYKlvd41KR3H6KrUaZ/6Vyf3fdqlYLCQce9aH+elYY6GIwUzDelGrBgrOguklXKAys4W436MXDEjtEfANN8trzzL/729e8tLQoZ3TFQelCMLSm0x5gR9JJ3M7f+WcDWgCM3eQiGnYhXYuxtnEaa9HD+xxPF4Wz3kkJl91tOeEfAbEgWvui+CPG5FsrlmQ844rOJ00T2MjHn3tOUsaoRCLFqXiCliBt2phPespKer1xzlIZ8y0UoJmkTL8uHApzaLoQyTcGediSQShbUzZrhNGS1eebC1KRowDPPt+ddOsVxLnYB/ja/AaWXiBqjDXSFtOpt6lSods1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6PBlmSFiyMJHVesh0UGw9BbYjXuQIWFhqqv4Xs0BJg=;
 b=xg8f8PxeQmed7UrOMCUhJRUwYcfaouH1cx85C6PeYlkbTvvIYs/YroxS5a4MbkXWTZ2NAwvYO0ryjGiHbGmxR6WlsTJgx0kd1f0V5hLJdCnPNlrVs5C+iAyB2Xhlnlqdgo3z/R86MT/eKSPoqA9L7RHr3l+hcFGqG8fkHN+w9UTeP1qADqb5BHLJ72Z56tSMhHMjpfPmqBC4YYmWAnsc0oC2CV1OQpvXgyya+Ds3+xfBjaeuK/pqke6KYjawkOhMBJNZg/FS5bnzba6d1EUexaRth6KDMkBPDgCg9+muMtb+iNL8WbUgayc1f5GeeANkkyCioWsudDXGAdWwWyqYCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=garmin.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6PBlmSFiyMJHVesh0UGw9BbYjXuQIWFhqqv4Xs0BJg=;
 b=Xh5Wo0BTYUQpc9JGUMzM/JGWVk96uIA3SdXV7d0OqyMu21Q6AcRHBFRchd8JOCAQeAKz351qMHMGvtVXJvMYC6gwPylTShhzWxfQcUQuNZWtTiz3bk+FC3Qi2is21jbNbRIWAbmukn8a2M45z3gIr/jhSUWtOIy1+RsW528NNFwZ29Kh/vkwNTk9+MTLzM+MRZoPSX0wKkmdyx0w4DJRl1f+8WXxlXnwVHrHeQg1nV5chgqnyoE7EVW32rDSo/0L1E5APZ9qS2IDRClWoSSkNeMLWlv6lj43rYM3BOt9+d6oiSPF7WR+aqsHSjjnlideoWVSFyCL3Ms1hSlWvCVMJQ==
Received: from IA4P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::10)
 by BY5PR04MB6341.namprd04.prod.outlook.com (2603:10b6:a03:1e3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 18:06:23 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:558:cafe::c9) by IA4P220CA0009.outlook.office365.com
 (2603:10b6:208:558::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 18:06:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 18:06:22 +0000
Received: from KC3WPA-EXSE03.ad.garmin.com (10.65.32.86) by cv1wpa-edge3
 (10.60.4.253) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 5 Jan
 2026 12:06:08 -0600
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 KC3WPA-EXSE03.ad.garmin.com (10.65.32.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.17; Mon, 5 Jan 2026 10:06:10 -0800
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 CV1WPA-EXMB1.ad.garmin.com (10.5.144.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Mon, 5 Jan 2026 12:06:10 -0600
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.71) with Microsoft SMTP Server id 15.1.2507.57 via Frontend
 Transport; Mon, 5 Jan 2026 12:06:10 -0600
From: "Colin McAllister" <colin.mcallister@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Subject: [meta-webserver][scarthgap][PATCH v2 2/2] nginx: Fix CVE-2025-23419 for 1.25.5
Date: Mon, 5 Jan 2026 12:06:06 -0600
Message-ID: <20260105180606.2192902-3-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105180606.2192902-1-colin.mcallister@garmin.com>
References: <20251231153607.3978985-1-colin.mcallister@garmin.com>
 <20260105180606.2192902-1-colin.mcallister@garmin.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|BY5PR04MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: a5bc711c-6a58-4e56-ccc8-08de4c852273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sZ6Gsav4vTAz1YM03xOyYsz/1GiX42geMSxeGmcdLVCLbu7lN0WBrDtDg5Sk?=
 =?us-ascii?Q?5+lOs6VRG7wjUDWpRotgCbU5xLL/Bgihs6LPcTy+hCwTjyq55haa0dui6+qD?=
 =?us-ascii?Q?P4F7z0w8NlQrHvUTpA0bfzLJuUtnF00de2m+b6AoEI8dj3fVEb7wxTzWthA4?=
 =?us-ascii?Q?n+PuI7LXlNkMZb42tPQYa17y586AxNlQn2n4BZnGUnc27zahWshtWSBG990Q?=
 =?us-ascii?Q?6cZhZnIubWrkvIp3vrrXf2udMJwsi6sdkOYVSXOgqwD1w7sjpE/1AW8Tsy/2?=
 =?us-ascii?Q?oUoDCO5p06Bg/FwyR7HTnTXCqmzBMO03f4OrG0Ggekcr+diwc9BOJFi1Ytxs?=
 =?us-ascii?Q?qfU9dBB68Eg2XS80xiWk6mcxD/JXFivPlXbiaw5udO2t7QXp0v0yAZ5k59Hj?=
 =?us-ascii?Q?v9iLAU2MjP/9+OFFo5rM1ug4amz1vFxjiWjVeOKPy0OfZkn4exaIou54yvTe?=
 =?us-ascii?Q?vrQGRir6PCBagoSO1r/lsVD7L7pY6CoYMyHiLrsGShZ7r9QwfUM4PBgeknFP?=
 =?us-ascii?Q?BSPAyDoxFs7irIPX4oFQENuc6qRLO3BT8lNmiffc1Q5/BEJ7WpmGPyZ37Frv?=
 =?us-ascii?Q?cX1zDQzy+1MuuudzkCaCfr4EeoZYxeZ6PcJDH+zwAFw1cNn+vkfxEHrVISKv?=
 =?us-ascii?Q?PWbj79wqkRdYLAtuMLQe0QteobNZ0ApfPK5d4XjPkeC86i00q9LlzQdpNcwm?=
 =?us-ascii?Q?EuT/taGz2P5QRDKlEBqq/aPCUHWTIBDWcC+Icf/WQi0peC0o1DAcDyqnQM3Z?=
 =?us-ascii?Q?mm7WcfFSVf93kUuAQ5cZdH37kYQgGMahRj3MUTFRJLm+R0HCkUYL2uVycv5t?=
 =?us-ascii?Q?u8pPGsVo6Te2yXUy7pmBNL88RNzC2JwGytKar3Dx/+ceci0YM6NxWkmu7+Mh?=
 =?us-ascii?Q?wrpLNRbqa/QVcHP0qT338d6hEtcCI4R/FnETIcq5fncaIG2zpd1sizy16DS8?=
 =?us-ascii?Q?eUc2x0U4e3nQSGXdLxZWV4cMPUquxo8aUYRE6y8pQVSiRy7OGO9bWeiYyKSk?=
 =?us-ascii?Q?3rdw35wwjNFuA/KDLD5cgHnBL2f1+czUbzw2DRid5m5rfQU3ZII7cRQ6+JCM?=
 =?us-ascii?Q?ybUFRLXfvzL+VKKBTT1vSPiuh6XVILwOxnuGgDybRhFeNowXYpRxqFCQ3fHU?=
 =?us-ascii?Q?syHaXY5Qnu39ehMPQ1sa+b50ZeSMCrCKvGVbkls5Ea7Tb08nK3h98VpPi8/D?=
 =?us-ascii?Q?oiCVl2l6zfogvdh5TfxXfdOp+yfKGLVZEfTQE47Rn0jWkKrbt1dhB0a+7Wqy?=
 =?us-ascii?Q?zX1rswty24/IrFM3Ws8bmq8mm6FOCZNv/g+Pj1B1rgI1AEh5khYfRy/2wlfq?=
 =?us-ascii?Q?jelMJC+HaMZpf/vXtYmKoj9+HnDqIUcjpBTCQ0gXit8Jd44ARFM0DfQa9uAv?=
 =?us-ascii?Q?wOBTi2j5piRNtSYLR0qj8hl7Mq4EwCM7Dg5XS04aTAd+uKg4Yy4cBynKUlfe?=
 =?us-ascii?Q?JYzgYtazNeES3f2y7Aq0BHEKX/3p5COqCCtTTrWbhFEZmKBccuU1YixBgLC2?=
 =?us-ascii?Q?JWC7fjElnHfhZR33tROXXi3hUkgK7uBXeGue0h//embGKmImwMDUKtGGL04U?=
 =?us-ascii?Q?LT9o9gTFQBR0ETdVkDg=3D?=
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 18:06:22.4137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5bc711c-6a58-4e56-ccc8-08de4c852273
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6341
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=695bfda2 cx=c_pps a=RSKkSjVyZ2Ta+HBtYZh2RQ==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=vUbySO9Y5rIA:10 a=qm69fr9Wx_0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8
 a=NbHB2C0EAAAA:8 a=L4EWI0dvAAAA:8 a=QIhr-27iAAAA:8 a=A1X0JdhQAAAA:8 a=h4Fn2-qSoU_DnPKFBV8A:9 a=cgaYBWEFosGJW4rWv5Lf:22 cc=ntf
X-Proofpoint-ORIG-GUID: UrysdDmm3qJ1sM2u92DmwTRunMidToVx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE1NyBTYWx0ZWRfX+VHwFkJcV6Np bDu81q1MHJxZ4/xZYfrSIWnhXNi+QM7VykZQ2LNTBj6++2nH21BA2Y2z8bZiRbZGUYBqGvRh4fL Mp8CiN5LyA9f6unFsxZyovTnE0Wq8veA6v4Lw1aVY3LBVg3/MRToF+gQ3OXKpiLwaK2ldAe4rEk
 4qSl1uvAvPoh1iq0ajcSDRiOMpB4Wq0vhav0agp6wFAdLAVPLIlt1hWu449JC0VWZv+1cx+BQfN Y9egkNBbko2qGSZXgUMyU9vlqEXCMLUA1wcGBJ4+6K34JGGqFMpIsKAcFixcFwDEUvFe9DquNPA H6GTxOuMuj+MO9xNBxtPI++zaRGypM8pzGJp/QBm/3lFNUaiPnmKQ5Jg6i7503UYa+PFfApfyLG
 faihkrFO+kXKMqehek1n3uWXGkKHJ9aiDn+WrC6z9ThPr2K4uVurq90LDw8KWJCUmuFbIZtPw2E p76Qy6xIwg1Vn3Kwvxw1/phOnf+iRXoYD5dVtguM=
X-Proofpoint-GUID: UrysdDmm3qJ1sM2u92DmwTRunMidToVx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc=notification route=outbound adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2512120000 definitions=main-2601050157
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 18:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123158

Updates nginx.inc to apply CVE-2025-23419.patch to both 1.24.0 and
1.25.5. However, a unique patch is provided for 1.25.5 since the
upstream patch for CVE-2025-23419 can be cleanly applied to 1.25.5.

Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Change-Id: Ia7b8e16067781776cf0a39fac757f8d25ac118fa
---

Changes in v2:
* Moved existing CVE-2025-23419.patch for 1.24.0 to "nginx-1.24.0" dir.

 .../CVE-2025-23419.patch                      |   0
 .../nginx/nginx-1.25.5/CVE-2025-23419.patch   | 119 ++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx.inc  |   1 +
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |   3 +-
 4 files changed, 121 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{files => nginx-1.24.0}/CVE-2025-23419.patch (100%)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2025-23419.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2025-23419.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2025-23419.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/nginx/files/CVE-2025-23419.patch
rename to meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2025-23419.patch
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


