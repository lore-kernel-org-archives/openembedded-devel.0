Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BC5C83030
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 20:58:09 +0000 (UTC)
Received: from mx0b-000eb902.pphosted.com (mx0b-000eb902.pphosted.com [205.220.177.212])
 by mx.groups.io with SMTP id smtpd.web10.3298.1751921596918770481
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 13:53:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=YB3etNf5;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=oPk0aGoN;
 spf=pass (domain: garmin.com, ip: 205.220.177.212, mailfrom: prvs=028352addd=colin.mcallister@garmin.com)
Received: from pps.filterd (m0220297.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567K253I013399
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Jul 2025 15:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps1; bh=TmHBLuFRLJ5SXQbkA164ISIutHt
	1QmOoGnR0yWZcTN4=; b=YB3etNf58BzpltXBg2nr9I9/BigioB2rKek2grj2VK7
	pw1kaGrKmtj7e/RdK4bgynhKrRrzVqLRHgEeaOxXwY31nXF5+T4MUrq0gkvXJIgr
	OdhkqrIiZ0tOfL0DqJ68AGR1GtRGXV2pZoENkSi5Lg++65QJ9RbpHLFtpABkM12C
	7CWBMydXuEnPjEBtmDBgAanao1aRhRKWx+hdPVCzUq19sxMrqOOmCkJXy3W7KFfR
	2TeVzvDgz3FPJbKA3y0y4iGOKiP/4vz9Kv/FBYbZwpUp/RetyVyggDe8CAU8FAXq
	x4BC6tKERo88lj/sZGNsRCv3RRCxTjfwL++GTNrHITg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2122.outbound.protection.outlook.com [40.107.94.122])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 47rja00dt6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 15:53:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKNFZnXueYu6wIAebpaCprABHa+e4k6f/NuTIvzn3feriF+9NKvmn8d2jMtZiLE7LNVOgAHVTDheeyxNegigZmP+FfBueeBAkmcYWaMCPmir7RqmZrXK3QBWoei3Hq9AyPeUKI3uuosFMDsOtSYznV3tI0W3O1HnbkqiPjG5GfJhd6sIIy5i0DeMhB4wnIi4eGj3RkcHcQU1W1nsazbMHocM/h/p/rwrmIxiC04WuEFVxJP8wvooNHkNEQubIvmpFNfQLKqpCungpbjUNfbwX8SPS8dGM/usFWYjo2w2FL8hRujvrVrDHtNET1g0W81Bh6rOeDAyafWPBLg9fOOAlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmHBLuFRLJ5SXQbkA164ISIutHt1QmOoGnR0yWZcTN4=;
 b=XsH44eE52nWg5wIBpTrjqX6ZFEKL8GPdS16t/yYR25wnYiX0ZVoqd0vpqGFxgE1QAwlpAhwm5/GC28+gkDVYoK0BPQxWcP/2K1mRVA01FsVnDfYuB806wtNXdzsX7zp0VPbPLVec1stv7zCW03FNxaqgIIuApXzksLQ90X+7CltyL+0gHyn9rQTtSbfX3SzOLmE0gOoPOcbOt6nBLH/tPTg8M6sfg4od1LoLFllkJLF4LL/lnncyTN44UoqGEm/OynaEzXTKBvV3DuZAjmUFneWw3DkaI1IZkOcyUK6teDhvuji7O717k6NaOi2ezytc6vq97BiP+TKtDWb0ke67mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=garmin.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmHBLuFRLJ5SXQbkA164ISIutHt1QmOoGnR0yWZcTN4=;
 b=oPk0aGoN36Y+02uj0BI8sdT0BS7DvQKVImUkLmCF57UglOm4u4vXJ5Exxrbijekc7Xd0zT7424LIadxIUENTNEB5gYnP1a2QgAHiccc+Ua+anJ4GkFoP1uIyDBlAH9bIjeKeEsCu4Ohh4xvNGWcG2ePyCQI9CJRld1h/eCo9VmTkhpIO3KtQsFQ1WL4ul6x1ck/o7VaT5JExDV5A5ElTvHZFPUUDv5ewsPVVbUMjiD6RT6qpbiS/LlovAPbwFTCNwVTMOHPZUwHaiGhrsAe3V7Q9/EYAmAduJbRwTzRp40JMIhimZBtzHnzpeQMc1hSL9J1xSvv5BZrj4RppdY3T4A==
Received: from BN9PR03CA0875.namprd03.prod.outlook.com (2603:10b6:408:13c::10)
 by DM6PR04MB6635.namprd04.prod.outlook.com (2603:10b6:5:242::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 20:52:57 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:408:13c:cafe::97) by BN9PR03CA0875.outlook.office365.com
 (2603:10b6:408:13c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Mon,
 7 Jul 2025 20:52:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20 via Frontend Transport; Mon, 7 Jul 2025 20:52:56 +0000
Received: from kc3wpa-exmb7.ad.garmin.com (10.65.32.87) by cv1wpa-edge1
 (10.60.4.252) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 7 Jul 2025
 15:52:49 -0500
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 kc3wpa-exmb7.ad.garmin.com (10.65.32.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 7 Jul 2025 15:52:50 -0500
Received: from cv1wpa-exmb3.ad.garmin.com (10.5.144.73) by
 CV1WPA-EXMB1.ad.garmin.com (10.5.144.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Jul 2025 15:52:50 -0500
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.73) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Jul 2025 15:52:50 -0500
From: "Colin McAllister" <colin.mcallister@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Subject: [meta-oe][kirkstone][PATCH 1/1] jq: Fix CVE-2024-23337 & CVE-2025-48060
Date: Mon, 7 Jul 2025 15:52:42 -0500
Message-ID: <20250707205243.2576093-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|DM6PR04MB6635:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ca8bd4a-438c-42e4-186d-08ddbd984025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SgL6rIsU3EaEaC7qqZ9ZkR12jmArsRcEreQdM60+TNswBz818A3uBgNZPJaR?=
 =?us-ascii?Q?HWEciyc9mDIIN2qD9nAlCftnGpU24n80PuD5a2RyqA4lE0FvNSas008MDDPX?=
 =?us-ascii?Q?3tHyAM8T5Opw39dC4ehLDyvijjVESppt6Fyi5dRowUn9maccCF8bRaASAsNo?=
 =?us-ascii?Q?W4wDvx43UmPANeDxtL3cwqsTICSkgWNUDvC6VAaW2AabP1l+9Id6rMHR483n?=
 =?us-ascii?Q?Ye726ey0Kx9wgjOTGb9j/HdPditgvonr+fs82p0CCE94Pp8j/dnsMNXULiby?=
 =?us-ascii?Q?W7aiWDFCQHTT64Gcpe4lefOHhajUBUaH6XrC3vH/TBmiqhaFA/wL3qjEkMS2?=
 =?us-ascii?Q?CcZOv//6DEKWmX3Upc9HYz8/IZgaOzveljCZxz+0HMRfUFt1IaHoobQ0b/nn?=
 =?us-ascii?Q?9XnRUUdPDLtJNFhqDzh/8HJgG/Yey1xi5vnIkPP6YAeVddap31639J57M0iJ?=
 =?us-ascii?Q?C7DExHNB0bVPTsL2DjfAxwYM98sQ+m/5bg2ffCiJa4Vjcf+u+ghIYy4ncqff?=
 =?us-ascii?Q?We73C/dmECLGlTAY90Hfzz/1bE3RVAQ/Cx/GsrnxpZq/VkYAqqmCqKCKPTKQ?=
 =?us-ascii?Q?GgUoN/nXWRjhFb6iGUmzYXMp98kbMEbR21jwKpmh3eNzvG6Xkq24ZEbU0Cjn?=
 =?us-ascii?Q?Mcw9IiU4uIZdaZnIsjULpH0uMjc6jFxM3qioH5R644purwV8/o4MO7sbjAVg?=
 =?us-ascii?Q?wvOBmPjAFgQxIyHIIc7J29u07t0UoPm6rCnTY3B9SfjV1CKOsTwh1bl/Gv23?=
 =?us-ascii?Q?3JStwQEfUfaRICNzBBM2F8Ini6FcHGHlKC6HEzo/E83+08GZuZ6MHzxmJZUQ?=
 =?us-ascii?Q?U3HrPIiTcsLFB4x/j+9jwH2Wr+WfVDM/0EOqavDdnYgtA3z3GEaeNBuTGx+y?=
 =?us-ascii?Q?Lcpbv5klq+kyKbaJA6bYz3UC/Pis7dZmChyeV4VFhxTFP+/rXUx6JDrXD+Wz?=
 =?us-ascii?Q?zwWvxU4zyagGsWwGFuVURF19X6ZzEDuESMVQ9zDhQU6l7ZtKydrPffd3BtdD?=
 =?us-ascii?Q?s3rpktDp+76j3Xn2kZ9RsrCOTD/1zqlYt1irX6xS3CubHKCrXMfukRV80BQa?=
 =?us-ascii?Q?1KxSZSCSM8JQZgUggJ25oJaWX3JuIwTPJ+0KX4R9HpUG5IZnAlYSXrWB51+e?=
 =?us-ascii?Q?MsB23C3e4C1wNdA8Rmyy4mI2RLNe2gnHfmJfVrVd1cV4bTb5g24cH/K0hhg3?=
 =?us-ascii?Q?vynOwD0FUpzJEecc3p81ByCimX0Yojp15qOAROCjHqD6WMW8tvUKPJONgsyS?=
 =?us-ascii?Q?yc8QaWxT+NoZMsoleudo3jiZnCMHM++GW1c874SnXwxBd3RavM85M861Mah3?=
 =?us-ascii?Q?CVd2NXKw8TYGJFMO5zVSBFR38ljwQIGEoZLyKxRaa77r763ImfzYsZI4wcAP?=
 =?us-ascii?Q?6f3qFZNFE/zWmIeS9q7F3XvgLHp7oTv6aT6hpXOsgTda/Ay28bPmtoTXxUp7?=
 =?us-ascii?Q?VLh+AbuBtLunK08o9J+dYAXsr1GI1MCeZEXCO2r9oLdpSg4Hw0rYVdhS/2h/?=
 =?us-ascii?Q?BqhKUT87Pj87vMbsuAk4mborMIA8DjLfoQkki6k3ZX+20UYTjx/aWfjvWA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 20:52:56.3881
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca8bd4a-438c-42e4-186d-08ddbd984025
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6635
X-Authority-Analysis: v=2.4 cv=J4eq7BnS c=1 sm=1 tr=0 ts=686c33bb cx=c_pps a=hEWPytJkew9UMlV5tkGFJQ==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10 a=qm69fr9Wx_0A:10 a=NEAV23lmAAAA:8 a=NbHB2C0EAAAA:8 a=oXo0Za5T0mhIDOI--VYA:9 cc=ntf
X-Proofpoint-ORIG-GUID: kPXkvHMARnHfd7iJJwS75YMNseSTlFqZ
X-Proofpoint-GUID: kPXkvHMARnHfd7iJJwS75YMNseSTlFqZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDE0MCBTYWx0ZWRfX1MKvxeUUHRtn HO6yq40dGSa5X9puAShuIpfLAhAwQLXokOR7CSVMD3n+DotpgpsOR/xZVUV5uRRUypbhPt6kKml 1b9G8UMSYhLHGM1n1G3mQxxV/nqP+qZSQ2YvIud4wJd/ib/i+ZwR25V8pYuEHV2G2nZsn1NGW+b
 vU/vEu1MDNcMAv/D3WstLzrnUURB5xrhIkFoMJ3tspMVYmnMhnmZrW296bU70uZSuX0dHooY5LI Jdpw4UuIcQ3/tLvVqQTPgPvhxgwz5tCzOU91VO7mDVNgv1TgSGaEqDU6PvUH0ryoTtAP3VjE0ai sN6W53E9eqMS2+80BdEuQ322GZ3Gdoy92aennGPCCusALjIqO7SJO/8geDkfQhO1TL5iUYcDk7n
 84OWiLE0ZSsBgkK9cLRWRyeTSneAmIASoYzf1p6HPM8ERbLxZ1nFiQj0ZNV945utiHb6+gHX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_05,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1011
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=notification
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507070140
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 20:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118287

Adds backported patches to fix CVE-2024-23337 & CVE-2025-48060.

Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
---
 .../jq/jq/CVE-2024-23337.patch                | 219 ++++++++++++++++++
 .../jq/jq/CVE-2025-48060.patch                |  46 ++++
 meta-oe/recipes-devtools/jq/jq_git.bb         |   6 +-
 3 files changed, 270 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch
new file mode 100644
index 0000000000..87e639aad7
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch
@@ -0,0 +1,219 @@
+From 35cde320ac7ee9ad6da5ce422922fafe592c4c60 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Wed, 21 May 2025 07:45:00 +0900
+Subject: [PATCH 1/2] Fix signed integer overflow in jvp_array_write and
+ jvp_object_rehash
+
+This commit fixes signed integer overflow and SEGV issues on growing
+arrays and objects. The size of arrays and objects is now limited to
+`536870912` (`0x20000000`). This fixes CVE-2024-23337 and fixes #3262.
+
+CVE: CVE-2024-23337
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/de21386681c0df0104a99d9d09db23a9b2a78b1e]
+Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
+---
+ src/jv.c      | 45 ++++++++++++++++++++++++++++++++++++---------
+ src/jv_aux.c  |  9 +++++----
+ tests/jq.test |  4 ++++
+ 3 files changed, 45 insertions(+), 13 deletions(-)
+
+diff --git a/src/jv.c b/src/jv.c
+index 9784b22..33ccee9 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -1006,6 +1006,11 @@ jv jv_array_set(jv j, int idx, jv val) {
+     jv_free(val);
+     return jv_invalid_with_msg(jv_string("Out of bounds negative array index"));
+   }
++  if (idx > (INT_MAX >> 2) - jvp_array_offset(j)) {
++    jv_free(j);
++    jv_free(val);
++    return jv_invalid_with_msg(jv_string("Array index too large"));
++  }
+   // copy/free of val,j coalesced
+   jv* slot = jvp_array_write(&j, idx);
+   jv_free(*slot);
+@@ -1025,6 +1030,7 @@ jv jv_array_concat(jv a, jv b) {
+   // FIXME: could be faster
+   jv_array_foreach(b, i, elem) {
+     a = jv_array_append(a, elem);
++    if (!jv_is_valid(a)) break;
+   }
+   jv_free(b);
+   return a;
+@@ -1296,6 +1302,7 @@ jv jv_string_indexes(jv j, jv k) {
+     p = jstr;
+     while ((p = _jq_memmem(p, (jstr + jlen) - p, idxstr, idxlen)) != NULL) {
+       a = jv_array_append(a, jv_number(p - jstr));
++      if (!jv_is_valid(a)) break;
+       p += idxlen;
+     }
+   }
+@@ -1318,14 +1325,17 @@ jv jv_string_split(jv j, jv sep) {
+ 
+   if (seplen == 0) {
+     int c;
+-    while ((jstr = jvp_utf8_next(jstr, jend, &c)))
++    while ((jstr = jvp_utf8_next(jstr, jend, &c))) {
+       a = jv_array_append(a, jv_string_append_codepoint(jv_string(""), c));
++      if (!jv_is_valid(a)) break;
++    }
+   } else {
+     for (p = jstr; p < jend; p = s + seplen) {
+       s = _jq_memmem(p, jend - p, sepstr, seplen);
+       if (s == NULL)
+         s = jend;
+       a = jv_array_append(a, jv_string_sized(p, s - p));
++      if (!jv_is_valid(a)) break;
+       // Add an empty string to denote that j ends on a sep
+       if (s + seplen == jend && seplen != 0)
+         a = jv_array_append(a, jv_string(""));
+@@ -1343,8 +1353,10 @@ jv jv_string_explode(jv j) {
+   const char* end = i + len;
+   jv a = jv_array_sized(len);
+   int c;
+-  while ((i = jvp_utf8_next(i, end, &c)))
++  while ((i = jvp_utf8_next(i, end, &c))) {
+     a = jv_array_append(a, jv_number(c));
++    if (!jv_is_valid(a)) break;
++  }
+   jv_free(j);
+   return a;
+ }
+@@ -1617,10 +1629,13 @@ static void jvp_object_free(jv o) {
+   }
+ }
+ 
+-static jv jvp_object_rehash(jv object) {
++static int jvp_object_rehash(jv *objectp) {
++  jv object = *objectp;
+   assert(JVP_HAS_KIND(object, JV_KIND_OBJECT));
+   assert(jvp_refcnt_unshared(object.u.ptr));
+   int size = jvp_object_size(object);
++  if (size > INT_MAX >> 2)
++    return 0;
+   jv new_object = jvp_object_new(size * 2);
+   for (int i=0; i<size; i++) {
+     struct object_slot* slot = jvp_object_get_slot(object, i);
+@@ -1633,7 +1648,8 @@ static jv jvp_object_rehash(jv object) {
+   }
+   // references are transported, just drop the old table
+   jv_mem_free(jvp_object_ptr(object));
+-  return new_object;
++  *objectp = new_object;
++  return 1;
+ }
+ 
+ static jv jvp_object_unshare(jv object) {
+@@ -1662,27 +1678,32 @@ static jv jvp_object_unshare(jv object) {
+   return new_object;
+ }
+ 
+-static jv* jvp_object_write(jv* object, jv key) {
++static int jvp_object_write(jv* object, jv key, jv **valpp) {
+   *object = jvp_object_unshare(*object);
+   int* bucket = jvp_object_find_bucket(*object, key);
+   struct object_slot* slot = jvp_object_find_slot(*object, key, bucket);
+   if (slot) {
+     // already has the key
+     jvp_string_free(key);
+-    return &slot->value;
++    *valpp = &slot->value;
++    return 1;
+   }
+   slot = jvp_object_add_slot(*object, key, bucket);
+   if (slot) {
+     slot->value = jv_invalid();
+   } else {
+-    *object = jvp_object_rehash(*object);
++    if (!jvp_object_rehash(object)) {
++      *valpp = NULL;
++      return 0;
++    }
+     bucket = jvp_object_find_bucket(*object, key);
+     assert(!jvp_object_find_slot(*object, key, bucket));
+     slot = jvp_object_add_slot(*object, key, bucket);
+     assert(slot);
+     slot->value = jv_invalid();
+   }
+-  return &slot->value;
++  *valpp = &slot->value;
++  return 1;
+ }
+ 
+ static int jvp_object_delete(jv* object, jv key) {
+@@ -1783,7 +1804,11 @@ jv jv_object_set(jv object, jv key, jv value) {
+   assert(JVP_HAS_KIND(object, JV_KIND_OBJECT));
+   assert(JVP_HAS_KIND(key, JV_KIND_STRING));
+   // copy/free of object, key, value coalesced
+-  jv* slot = jvp_object_write(&object, key);
++  jv* slot;
++  if (!jvp_object_write(&object, key, &slot)) {
++    jv_free(object);
++    return jv_invalid_with_msg(jv_string("Object too big"));
++  }
+   jv_free(*slot);
+   *slot = value;
+   return object;
+@@ -1808,6 +1833,7 @@ jv jv_object_merge(jv a, jv b) {
+   assert(JVP_HAS_KIND(a, JV_KIND_OBJECT));
+   jv_object_foreach(b, k, v) {
+     a = jv_object_set(a, k, v);
++    if (!jv_is_valid(a)) break;
+   }
+   jv_free(b);
+   return a;
+@@ -1827,6 +1853,7 @@ jv jv_object_merge_recursive(jv a, jv b) {
+       jv_free(elem);
+       a = jv_object_set(a, k, v);
+     }
++    if (!jv_is_valid(a)) break;
+   }
+   jv_free(b);
+   return a;
+diff --git a/src/jv_aux.c b/src/jv_aux.c
+index 994285a..0753aef 100644
+--- a/src/jv_aux.c
++++ b/src/jv_aux.c
+@@ -162,18 +162,19 @@ jv jv_set(jv t, jv k, jv v) {
+         if (slice_len < insert_len) {
+           // array is growing
+           int shift = insert_len - slice_len;
+-          for (int i = array_len - 1; i >= end; i--) {
++          for (int i = array_len - 1; i >= end && jv_is_valid(t); i--) {
+             t = jv_array_set(t, i + shift, jv_array_get(jv_copy(t), i));
+           }
+         } else if (slice_len > insert_len) {
+           // array is shrinking
+           int shift = slice_len - insert_len;
+-          for (int i = end; i < array_len; i++) {
++          for (int i = end; i < array_len && jv_is_valid(t); i++) {
+             t = jv_array_set(t, i - shift, jv_array_get(jv_copy(t), i));
+           }
+-          t = jv_array_slice(t, 0, array_len - shift);
++          if (jv_is_valid(t))
++            t = jv_array_slice(t, 0, array_len - shift);
+         }
+-        for (int i=0; i < insert_len; i++) {
++        for (int i = 0; i < insert_len && jv_is_valid(t); i++) {
+           t = jv_array_set(t, start + i, jv_array_get(jv_copy(v), i));
+         }
+         jv_free(v);
+diff --git a/tests/jq.test b/tests/jq.test
+index 2d5c36b..c6c6ee5 100644
+--- a/tests/jq.test
++++ b/tests/jq.test
+@@ -186,6 +186,10 @@ null
+ [0,1,2]
+ [0,5,2]
+ 
++try (.[999999999] = 0) catch .
++null
++"Array index too large"
++
+ #
+ # Multiple outputs, iteration
+ #
+-- 
+2.49.0
+
diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch
new file mode 100644
index 0000000000..909a4963c9
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch
@@ -0,0 +1,46 @@
+From 9e23fd7e88bb2d76ddf3fbfc805199f848cd1b92 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Sat, 31 May 2025 11:46:40 +0900
+Subject: [PATCH 2/2] Fix heap buffer overflow when formatting an empty string
+
+The `jv_string_empty` did not properly null-terminate the string data,
+which could lead to a heap buffer overflow. The test case of
+GHSA-p7rr-28xf-3m5w (`0[""*0]`) was fixed by the commit dc849e9bb74a,
+but another case (`0[[]|implode]`) was still vulnerable. This commit
+ensures string data is properly null-terminated, and fixes CVE-2025-48060.
+
+CVE: CVE-2025-48060
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/c6e041699d8cd31b97375a2596217aff2cfca85b]
+Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
+---
+ src/jv.c      | 1 +
+ tests/jq.test | 4 ++++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/src/jv.c b/src/jv.c
+index 33ccee9..4d7bba1 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -1131,6 +1131,7 @@ static jv jvp_string_empty_new(uint32_t length) {
+   jvp_string* s = jvp_string_alloc(length);
+   s->length_hashed = 0;
+   memset(s->data, 0, length);
++  s->data[length] = 0;
+   jv r = {JVP_FLAGS_STRING, 0, 0, 0, {&s->refcnt}};
+   return r;
+ }
+diff --git a/tests/jq.test b/tests/jq.test
+index c6c6ee5..f783493 100644
+--- a/tests/jq.test
++++ b/tests/jq.test
+@@ -1720,3 +1720,7 @@ false
+ . |= try . catch .
+ 1
+ 1
++
++try 0[implode] catch .
++[]
++"Cannot index number with string \"\""
+-- 
+2.49.0
+
diff --git a/meta-oe/recipes-devtools/jq/jq_git.bb b/meta-oe/recipes-devtools/jq/jq_git.bb
index 8b0218c83e..477fe933b3 100644
--- a/meta-oe/recipes-devtools/jq/jq_git.bb
+++ b/meta-oe/recipes-devtools/jq/jq_git.bb
@@ -9,7 +9,11 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2814b59e00e7918c864fa3b6bbe049b4"
 
 PV = "1.6+git${SRCPV}"
-SRC_URI = "git://github.com/stedolan/jq;protocol=https;branch=master"
+SRC_URI = " \
+    git://github.com/stedolan/jq;protocol=https;branch=master \
+    file://CVE-2024-23337.patch \
+    file://CVE-2025-48060.patch \
+    "
 SRCREV = "a9f97e9e61a910a374a5d768244e8ad63f407d3e"
 S = "${WORKDIR}/git"
 
-- 
2.49.0


