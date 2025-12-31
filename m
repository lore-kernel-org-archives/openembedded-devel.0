Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13ACFEE6428
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 15:39:33 +0000 (UTC)
Received: from mx0b-000eb902.pphosted.com (mx0b-000eb902.pphosted.com [205.220.177.212])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87128.1767195379961770207
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Dec 2025 07:36:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=zEU4atUw;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=pEzoJEAV;
 spf=pass (domain: garmin.com, ip: 205.220.177.212, mailfrom: prvs=6460acd53d=colin.mcallister@garmin.com)
Received: from pps.filterd (m0220298.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BVEP2gi001668
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 09:36:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps1; bh=P+0kTWKYneIfMoAHWB2arDuhjlw
	1vc+WaKNDcPO6gPQ=; b=zEU4atUwOakTCwAkyJ5luiCV5M7terrhqu7amPwZkjA
	AEK0PpzPwh4pq/7M1OsVrvGY6ZWUMI4SpX7xquftuNXK/2+TxYkPUTjceXVdmr6C
	rB7lloVxRiYOIn4llo7NQ9z6kDWwY59ezIE2gYLkzber4OJm9Yre6MT249jhEb/B
	WkiZO79/N8o999f6HwTLEunsqmdJO9pffVcfwop0xXHnyJRC1MXo8yHIXHm/HorA
	ikk4VdEA0ORjOCjBRDamyyh7+FlbxLkTkWBHzVTaJAyWPZtYjx1zbFPc7enb68E3
	vQmacvJoz7iehbh7y1c06Vv6wwtPyHtAAy3JwkEYoYQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021130.outbound.protection.outlook.com [40.93.194.130])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 4bcyccrjbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 09:36:18 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZ0+lS2VeRtmnYT8AoOC7edQZPahsopS2skBMIqs1HOFoQTcSLxXd9g13nQUbI5rDIKz+3mQuOBwntGVahqzDi9weQrtpWZWYfWQ3cAbhoEjd9qcsp9Cyt1yJj6kUvlev6cku9OAHLZj3kbRiZB0higfNu+etBCg9MxjiP6eXiJPV046/y87qqvMq2EgFGtY++TfMqMqFtVpK91uLWIxL6QmzOCYcLzJLjvnNfwHe4sRF/dm5ZuIByyt8HHU8B/zeopDlEc0olYe0DoCqnfvl+Xm0ubvaQDyjnjWG+RsZkMpoCYH2ozpuqO0ajHN4ogUgTK5x83aSE1d2KweGS4j7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+0kTWKYneIfMoAHWB2arDuhjlw1vc+WaKNDcPO6gPQ=;
 b=qJXFE2TQIAicb2SOUfupkOnksGOnAh0bN2WwIkV2sPS5zv+OmvdGT4wEjax2HIhsyjImX7zAAfg2dV7pTtWPsp5D0abzEfBxFp+pDRIOF4zyt9vZFP3BctksCNFYg4GJxjETqeVgpFR18a+3cr5h/zXOZ6NkYDaPYSMo4p51sLo2jXB7bOnMJ1OEB+tGuz5KCHMhSBxSBTm+5ooKSwGtFW7v6pWKxWWnS1ozy/BIbBpi5RbVCk2Lc7q+7cjC9V5vP2n0voslLf70jSwVwKb1vnqgbxp/E989MD2QMEvrX61VF1pG5tXIMe4IoNcN2Guka2b+2p61iYpeik8HaXaamQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=garmin.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+0kTWKYneIfMoAHWB2arDuhjlw1vc+WaKNDcPO6gPQ=;
 b=pEzoJEAVBv3uoGNdBwF2EzQl6EZoKIIvHv9LxJ5AdGGg2aFZkGy1i0lFPheP7UppZ9/ywbRbVXkzz3WALPngB97q2VWBblC5glMa09TMiGB0pXx7yb30mU5fGZKEyu45lEyd7/8HCRFzsfqbOjN95YZdi7w6WVfLZItcsEGJkLH0DiA5hS011Wc6c5Mmkc63yNGEsx/jzUQlKWbv1EiLbAHntPCbfdXgdsuLni11d4TX1EXxkY2B+NNMuxu7OVo1lzuYpqLC+aS6kE7BFdryuTzvi8Dpc5BD4IyYy6C+DW5aC7bWLDlwcXOZqwf83TnihIEuy/BFUK4aQe366oJSdg==
Received: from MW4PR04CA0139.namprd04.prod.outlook.com (2603:10b6:303:84::24)
 by CO1PR04MB8266.namprd04.prod.outlook.com (2603:10b6:303:151::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 15:36:16 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:303:84:cafe::67) by MW4PR04CA0139.outlook.office365.com
 (2603:10b6:303:84::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 15:36:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.0 via Frontend Transport; Wed, 31 Dec 2025 15:36:15 +0000
Received: from cv1wpa-exmb6.ad.garmin.com (10.5.144.76) by cv1wpa-edge1
 (10.60.4.255) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 31 Dec
 2025 09:36:13 -0600
Received: from cv1wpa-exmb2.ad.garmin.com (10.5.144.72) by
 cv1wpa-exmb6.ad.garmin.com (10.5.144.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.26; Wed, 31 Dec 2025 09:36:14 -0600
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
Subject: [meta-webserver][scarthgap][PATCH 0/2] Fix CVE-2025-23419 for 1.25.x
Date: Wed, 31 Dec 2025 09:36:05 -0600
Message-ID: <20251231153607.3978985-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|CO1PR04MB8266:EE_
X-MS-Office365-Filtering-Correlation-Id: a6e52ef2-2d55-49f9-99b5-08de48825601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4VzNZaQ10JP/Fpx51a33//wEqcGqZFaap0Qyrd6G+vA8RNMBq6sgzQmY7iKL?=
 =?us-ascii?Q?4nn47zr8Ot7mUWieEFfyxYNH1IDt2Z9VSNTy6s84yYs+xYw8H7av+yzZq8oc?=
 =?us-ascii?Q?vYVV3DH895cD8wHYQEcXNGI71HutHfotOvjNMRCnal2dEz6jjDUXvYiFffPW?=
 =?us-ascii?Q?DTFcFeesnAoIL+krEylZVS3gSlcqOVoPnWWHQtRHl2Rrmx9nZN3htFbhiGKE?=
 =?us-ascii?Q?9UUmiXacNu12uoDQjZCGjgK2fO5DZmSv0OtP/Yo9A0E4mFlRCRKI4vHTeGV7?=
 =?us-ascii?Q?wXetmuvHuaiSfzpS4JzJIsu+V2IKMlLboqcZ+2uHMPCryokaQse6z5r/i9+d?=
 =?us-ascii?Q?a+WAjFwblffuK+rObMTB6HLYARZALy5nrRlgV9RyEV5rZvZCBKrqMIL+ki4X?=
 =?us-ascii?Q?GReRdE4l+j5JB/3CNSqPTMnqHeTGeqtjQ1IVv6F6JmJOaoWBL7dnAngTxJuE?=
 =?us-ascii?Q?Nymwq19rLTjoMAc6I1c7hfYY1+vVjnJ54M446YR2sfh4NqwIGNqJBF0t3gpG?=
 =?us-ascii?Q?N/4DldVvsBWye82B+GMPejN2P+QaxQAb8RhS8uKgRQebzQa81JSm3utTA7NJ?=
 =?us-ascii?Q?knGThIgPxgWKfXZj+xSrUPjc5Abq2wY6eD2sS422I+jXCX+/77QRUzf2Sy12?=
 =?us-ascii?Q?EMgHNPyAdGMzcVnOFSUyI/eY2HVt8eCeEMIPPRxsdkUAH6K79FEXriJlVUA1?=
 =?us-ascii?Q?OFcV68gpv4Z7iellSSPdJL15PWcBX6Er7p1eExlDzPJCxasuuA+5l4ehCp7Y?=
 =?us-ascii?Q?oCnp94/zC8R14eXTJYJGDSmSXP1hlKdSQ2qLXqIsBmpCErLzC/GicvGRI5kE?=
 =?us-ascii?Q?zP7GAWUqnMtMdcxDOoKd3CnSsYQ+3lTC3aLQxVMOevnXmuhspXm4utqNXmdt?=
 =?us-ascii?Q?/sWkOMgOQ1+IZ4i95ouZ46hcDuFk0te4h2bWwkVVdBNJSwH+axihesSH0DIM?=
 =?us-ascii?Q?rV0SW3Q2S6bEoEJmabVCWgxRhgIEbaenuOhmYM1orW8w7y2cl1GAP6QqZNZ/?=
 =?us-ascii?Q?wtkHn1CT7+0r3c+rH0dm6p5rZz7EiWJZl26Ugsmn71VwtZoJkbI5W6o+EVpK?=
 =?us-ascii?Q?KgmS9gMB7bgZ8/uY2txf7U5dBK3d3A8bnTVQNgt+SIaIYDlyvthaxrnDxy1h?=
 =?us-ascii?Q?D1iq5p+Mz52j5J03UF/q5Nd4AARoOVHsvYX17INCOf8Nn9Enacj8aKJBG3Ir?=
 =?us-ascii?Q?AQyqU2FahVwzXjb4Nfguqhk82jKV4aldPvaR3/Pz8zzTJH1aWr7xSHo0+DX5?=
 =?us-ascii?Q?1eMS+tY9G6k5PdxtsTOzUcGx6VWWKMaxQ8o4bES04GSMQmbWzyUH9FkGKZzF?=
 =?us-ascii?Q?Exig9XAZO3mn7Chid7CMYsrCwQBq/jCz2ZQBgA6Jaj3nHtY9DENjzqihy5Vy?=
 =?us-ascii?Q?FeMY3Wmna/P70Zltlo7dptOrcxmrvK4J33yxxxD3NSyC5NL7Qb6YFaP+A1Ed?=
 =?us-ascii?Q?SsgM2etF9zWbGUwFWE9KHEAayqW/0K+1iwyJEk6x017qM3RoePgsN+fGFpH6?=
 =?us-ascii?Q?IpwxvO5f3WCxAsM7u1MSrmprMQ0p/YLssoL2wJbTP8m5nYeFO2k3Q1GluNrn?=
 =?us-ascii?Q?ZznadiCUcYw8EhtfxRE=3D?=
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 15:36:15.7552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e52ef2-2d55-49f9-99b5-08de48825601
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8266
X-Proofpoint-ORIG-GUID: ax6o4g5MmRkLuKTJtmPyXBqXitqZIeAT
X-Proofpoint-GUID: ax6o4g5MmRkLuKTJtmPyXBqXitqZIeAT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEzNiBTYWx0ZWRfX3xQVvP5vDksg d22XCM+L8vnI/vo0ECLRM95dTnQDhT/+Y3Sa8jxpLDxu4HQlmHjkGt66tMUD2gM/DHY2DKdoDDE puBDtRCLH3evEc8ryM0GVhuL1YusqzkbwQrEX0ym0AWXiiM42CgfOv07EKlkyUAk6mY6hlvcCo5
 ubLWUWckB43B73qqRts+Yln8qc7uvM11XTne4b7Iej9GiW5xrZ55fCw1lBb85ZEikpsFVKX8tG3 EZmlAd3s/e3jrPfC4UB7ZP8kwcPGKMrUzGZxHYCVEtLh/EBTpGUdfj8ML/19FwvBQoP7GhaRbBn knOKOOWjPijd5tHjWNivL9N6YVpHlzmmxCVosuyFHtpE8JEDwloB7rmWDxxqdavcv3sR4ov8l3v
 IWjxXp7hbGCYNP3cVOAMrVO1mhqj+YtSfkfKi0cmVOYKxyg+qeD9li0ntFNU6TDVQ2+/bAqshiv KAu6uf3quGxK+VXlY9FI9Iy0WtXHaGaJZl2HchyU=
X-Authority-Analysis: v=2.4 cv=VvMuwu2n c=1 sm=1 tr=0 ts=695542f2 cx=c_pps a=Pb7wY1jdxbaV20HAOOqOTg==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wP3pNCr1ah4A:10 a=qm69fr9Wx_0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=f7mX8exDah0BDslT-HQA:9
 cc=ntf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1011 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc=notification
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2512120000
 definitions=main-2512310136
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 15:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123078

Fix CVE-2025-23419 by upgrading nginx from 1.25.4 to 1.25.5, which allows the upstream fix to be applied cleanly.
It appears that the CVE-2025-23419.patch for 1.24.0 can be applied to 1.25.4, however this patch is a modified
version of the upstream patch. By upgrading 1.25.4 to 1.25.5, we are able cleanly apply the upstream fix.
Since 1.25.x is not the default preference, I assume upgrading one patch version is acceptable.

Colin Pinnell McAllister (2):
  nginx: upgrade 1.25.4 -> 1.25.5
  nginx: Fix CVE-2025-23419 for 1.25.5

 .../nginx/nginx-1.25.5/CVE-2025-23419.patch   | 119 ++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx.inc  |   1 +
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |   3 +-
 .../{nginx_1.25.4.bb => nginx_1.25.5.bb}      |   2 +-
 4 files changed, 122 insertions(+), 3 deletions(-)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2025-23419.patch
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.25.4.bb => nginx_1.25.5.bb} (74%)

-- 
2.52.0


