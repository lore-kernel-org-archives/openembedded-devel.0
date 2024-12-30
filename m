Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F3AE77188
	for <webhook@archiver.kernel.org>; Tue, 31 Dec 2024 13:32:18 +0000 (UTC)
Received: from mx0b-000eb902.pphosted.com (mx0b-000eb902.pphosted.com [205.220.177.212])
 by mx.groups.io with SMTP id smtpd.web10.71373.1735595320645254289
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Dec 2024 13:48:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=I1vNSwe8;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=BwtcvhM8;
 spf=pass (domain: garmin.com, ip: 205.220.177.212, mailfrom: prvs=4094ffb500=colin.mcallister@garmin.com)
Received: from pps.filterd (m0220299.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BULChIS008374
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 15:48:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps1; bh=4S/GEpx09O3fWhvpcy+lMBNzQrH
	sEQIIOay+2RtfrqA=; b=I1vNSwe8LRlYHPC/C96IHJdSd21RcxgOlxvWw3XWofG
	nsEtWKW0u7+ZN4PORu+Se+0WfssINtGxe/GUuvckK+cfhysQeiBozr9JDoKMTF99
	cExFnViAr1lEPZdPEDqgneOijIH9ERVnVFr+lCQnT1UK6JYzklTsegYHVOVLcKFc
	hhTmYNOfgfBLWEHGJ/f/NaGMZX7aR5ZJo5DMh8YJjTbHBA9qYZt1c0FoKZdFKMO2
	Rxp42L+b0yDutWSKyg2Cp76QKSRH+K0/ogsRv58YWpz95tIfO5FtwZA0otdqh9da
	Y1/QDkBmrg0cNh6zQFWfSI3w1u8mTJYq8GXjtKJhm6g==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2046.outbound.protection.outlook.com [104.47.74.46])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 43v37cg1de-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 15:48:39 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6eFcJ4CC86OJWYXyvq3oZnaHULIGND/VlQjkhIkbkt8OiWgwaDME4xcnioRQGiDPsdii4PWBASPmgb8U2fOfatLe6PQXnHs8htH34vgNf6YV8PCwAUiJJicLZ0od2IDunxCG20mxVbTOoIn7dcOTJFwAgP3/sIXkSMu3BcGOnaTJy6NDd1NLGCDWb2hBnNpdLbEQFxZ1qSH5jLraqyxT522Ttrr7qzyk51aFjWmGHE0djCHysNjCOHSkPtuX8U8oNNnX5THC9w/3oNH8OpANHeuubE7eOJ1BPUZON2O0r/g6w3SgRES6mJm5XJn/bv4eZU8y49xqR4ZOedqz/AcxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4S/GEpx09O3fWhvpcy+lMBNzQrHsEQIIOay+2RtfrqA=;
 b=MVCzaLpiGxXfBsKqJPers7ZghkH6rcot77nigLL/7ywarYJA1N+5pUM7YS/mUNgUneH6YTZg2fsmSgEWEBZUq0wXMKCHrjbvMS7iX7ADPx9rvAua1uKZ3uczHgQsEFYfxO7hWwwnUTMWAJ6nLAtgxra9nncw3aEbvaCPpZWFZs0x9/95A9kfgBqwHkrCmlrAPtxwqsUCyWIq+ikad8KgVhPE3h3OheMN0ZqZIqqWT/zrzr2dJW3bw8x3y1tCny3X9cr7ymydin8txEywdzEkHMBpxbTO1O6hSHP/br/WHzF1cz39r9w8VssT200E3IbvsE1xakFz+5HSOvG6r2nqJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 5.145.180.36) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4S/GEpx09O3fWhvpcy+lMBNzQrHsEQIIOay+2RtfrqA=;
 b=BwtcvhM8UxaS1y8g3VEnVh1RYEEOyD25HMRIDZzYlJEBRvCX3wyGM5Lis/DrMG97ZIa24y8fjSGwge4vwyb7rZg3NKksd5xWDzLLmKeXTvOSjLn23eu2JJq5LzAmYgWdKBQ+m7KPoRBuYTgrfmZaYv7Vkd3dprusspnqzznvFoxv1hiN0+jC5N0s764ZBkCf5zFBE+cjfRvN+EcE1xGgixVXZ2GlUPLqtGAaRHRiTqpRwyh17Y4CD339Z6uU7xnavwF+HjYqZ1zLVscRq+FPx2aT7KN8lws1Yb91N82CIdVqk5K16d+30CK63ADv81chtRjVcuRowpzUsvFLUemm4g==
Received: from MN2PR04CA0024.namprd04.prod.outlook.com (2603:10b6:208:d4::37)
 by CH2PR04MB6711.namprd04.prod.outlook.com (2603:10b6:610:94::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.20; Mon, 30 Dec
 2024 21:48:33 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:208:d4:cafe::3e) by MN2PR04CA0024.outlook.office365.com
 (2603:10b6:208:d4::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.19 via Frontend Transport; Mon,
 30 Dec 2024 21:48:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 5.145.180.36)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 5.145.180.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=5.145.180.36; helo=tw1wpa-edge4.garmin.com; pr=C
Received: from tw1wpa-edge4.garmin.com (5.145.180.36) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.11 via Frontend Transport; Mon, 30 Dec 2024 21:48:32 +0000
Received: from LINWPA-EXMB1.ad.garmin.com (10.124.0.216) by
 tw1wpa-edge4.garmin.com (10.176.28.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1118.37; Tue, 31 Dec 2024 05:48:15 +0800
Received: from cv1wpa-exmb2.ad.garmin.com (10.5.144.72) by
 LINWPA-EXMB1.ad.garmin.com (10.124.0.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 31 Dec 2024 05:48:14 +0800
Received: from cv1wpa-exmb3.ad.garmin.com (10.5.144.73) by
 CV1WPA-EXMB2.ad.garmin.com (10.5.144.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Dec 2024 15:48:11 -0600
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.73) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 30 Dec 2024 15:48:11 -0600
From: "Colin McAllister" <colin.mcallister@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Colin McAllister <colin.mcallister@garmin.com>
Subject: [meta-oe][kirkstone][PATCH] lldpd: Fix CVE-2023-41910
Date: Mon, 30 Dec 2024 15:47:33 -0600
Message-ID: <20241230214802.1332322-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|CH2PR04MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: 72e6ac0d-6fce-44b7-f68b-08dd291bb48c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?e9vHMErNviUynht7rXX0kbC7RCoQqnGwxANX/o1y4W1WPag/PKT4cyCfb+8v?=
 =?us-ascii?Q?Qpd4HSXv1PHuFUcg16uA/6JI+eHA89A1gCkPeMjhK/y6qP7/GFGb7SZCExJs?=
 =?us-ascii?Q?UJq0ZQPr6Em2BoOB9SwTWNqT7L1CXLcZoCkMzuiCgDWtU8UGbTZKYNIX4JjB?=
 =?us-ascii?Q?iay0LizyXoa4Mbl2JDbiJsdph9pZX4La0PFzMw2Bk/QfdBxVcYdXuUzzj209?=
 =?us-ascii?Q?PYxemB8f9PcfFs942WS4OzlafG1LT6HCH4JONx85ecximi57LDq835W3AMXA?=
 =?us-ascii?Q?iLrWZ4icG4i70f9e03pPCqFl8i9CxeIUN7G19vlC2l1DniA3jiPS3WawEYcX?=
 =?us-ascii?Q?GCff1oMwo3jQK5T/cD8kguqsrw703d+o3YYmRF9cqtv40A2PTI7GBni0ya+4?=
 =?us-ascii?Q?t9JGpgyu/kNfjzMyQvN5zrw95zoZh9qr61Utw7bFv8zmxWy3x+UIdS3zu3qy?=
 =?us-ascii?Q?0vwuiOS/JZxfUFnlSc1zyevp1GUNwaFeys73PUF/IDgt/XcutcAg+zFiVV20?=
 =?us-ascii?Q?9Tp7TNpi437KhAgfd4/h2U4uy/ZowhtVgNxfMHOXDpVvSos3MQXfETuFlH4r?=
 =?us-ascii?Q?AxLS21OzwT9StQ6dojCKYWT/eblTRxFRQbQFSPBKe4ffpYXrhKWjUab3iB/h?=
 =?us-ascii?Q?3qGII0m0iAeDVzTilmDY7B4ZUZR9fWN+vV5ow4ER3QtBAx//JxURBz3HzFPY?=
 =?us-ascii?Q?QEx2flgGKjVahDOAa/fwCTWwN/aEW730eNu0nqQUZYor1nZCpf/Rs2A9sec2?=
 =?us-ascii?Q?WV3R5HdBWyYKvhqtKNNfRj3UOvhYdiz/kCvZkmSvWyMuDIGkrlZddUoCcLcs?=
 =?us-ascii?Q?z14mwAoQmu5UK9XpkB6IQyuBb6ZxyvjvmHpiyXFM6sYQAej9JD85HxDMuCLV?=
 =?us-ascii?Q?o7Wuy1Q4o28riJ9Qx/Cxgtf/NDXun6Snq/je8Rk9/j2frCrS1k1bn5q97nDG?=
 =?us-ascii?Q?JqFVY71nk8I9hn4ROTS2pCaeOk5D0BHbEnEGDqfWqBnTlC0hLl34mMxB9xuD?=
 =?us-ascii?Q?tBNwzfHZPGi9Dm3yeEZ85JqCx5/f0Xgejl8f3WbfD+LM+JeiXcQjc4PBMaz+?=
 =?us-ascii?Q?n6S87viVLFC85uPmMX0GCtKR1jmUxfiGPCn/YPJ2eOmOC+CSKzL/3nHm+5bz?=
 =?us-ascii?Q?9X1vSsJ2cvhss44yXe0hWfx2enNs+bHzAgnhqoEQux7ZSx7lUzIDcsSxZEMJ?=
 =?us-ascii?Q?z6Ocbb0ug/GCgNVFd6PbWBXj17FZ5GvtDqM4C7e/ZCAoVH0QUUXuVGoFOK7o?=
 =?us-ascii?Q?a9FqS81/CaUNTC/WGUtQb6GQbieMu2NfySh6czLGFkg1EbxYPn1Z/ZUB3Bic?=
 =?us-ascii?Q?ILDkwZDPsku7XEXp4XlgbD9mj3EsoRN/7sDcBop4FtXNob/Z3TAReCpRnt8r?=
 =?us-ascii?Q?0MrcIil5Tpp053HtKdQBb06+3AfWDRfhCxbt2tO13qo/VDYpaqw5vVlphrCw?=
 =?us-ascii?Q?xL2S7Lu75Ms=3D?=
X-Forefront-Antispam-Report: 
	CIP:5.145.180.36;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:tw1wpa-edge4.garmin.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 21:48:32.2252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e6ac0d-6fce-44b7-f68b-08dd291bb48c
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[5.145.180.36];Helo=[tw1wpa-edge4.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6711
X-Authority-Analysis: v=2.4 cv=YtH1R5YX c=1 sm=1 tr=0 ts=67731537 cx=c_pps a=G0EMd8eUBd5ElxF49Cdl+w==:117 a=x6SFi5dyMiEqRNQ9E5Nh/w==:17 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=RZcAm9yDv7YA:10
 a=FS7-D2N0u7gA:10 a=s63m1ICgrNkA:10 a=z79Jr5QO9ZoA:10 a=qm69fr9Wx_0A:10 a=NEAV23lmAAAA:8 a=0E3rUpu_AAAA:8 a=NbHB2C0EAAAA:8 a=ygfj4mVdMupMjk9-_ScA:9 a=gSyOOUxZfIhboqwmd29B:22
X-Proofpoint-GUID: jS41lb6ee8eynN3kzfnYxcAEff75B97G
X-Proofpoint-ORIG-GUID: jS41lb6ee8eynN3kzfnYxcAEff75B97G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 suspectscore=0
 adultscore=0 impostorscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412300187
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Dec 2024 13:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114606

Adds patch to backport fix for CVE-2023-41910.

Signed-off-by: Colin McAllister <colin.mcallister@garmin.com>
Change-Id: Iab619f1f5ba26b1141dffea065c90ef0b180b46e
---
 .../lldpd/files/CVE-2023-41910.patch          | 26 +++++++++++++++++++
 .../recipes-daemons/lldpd/lldpd_1.0.8.bb      |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/lldpd/files/CVE-2023-41910.patch

diff --git a/meta-networking/recipes-daemons/lldpd/files/CVE-2023-41910.patch b/meta-networking/recipes-daemons/lldpd/files/CVE-2023-41910.patch
new file mode 100644
index 000000000..11f6fffd7
--- /dev/null
+++ b/meta-networking/recipes-daemons/lldpd/files/CVE-2023-41910.patch
@@ -0,0 +1,26 @@
+From ce7c3f84d80435a1bfad77ab8cb0e9ba401f1eea Mon Sep 17 00:00:00 2001
+From: Vincent Bernat <vincent@bernat.ch>
+Date: Wed, 12 Apr 2023 07:38:31 +0200
+Subject: [PATCH] daemon: fix read overflow when parsing CDP addresses
+
+Upstream-status: Backport [https://github.com/lldpd/lldpd/commit/a9aeabdf879c25c584852a0bb5523837632f099b]
+CVE: CVE-2023-41910
+---
+ src/daemon/protocols/cdp.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/daemon/protocols/cdp.c b/src/daemon/protocols/cdp.c
+index 4a14ff0..c3a7c22 100644
+--- a/src/daemon/protocols/cdp.c
++++ b/src/daemon/protocols/cdp.c
+@@ -483,6 +483,7 @@ cdp_decode(struct lldpd *cfg, char *frame, int s,
+ 					goto malformed;
+ 				}
+ 				PEEK_DISCARD(address_len);
++				addresses_len -= address_len;
+ 				(void)PEEK_SAVE(pos_next_address);
+ 				/* Next, we go back and try to extract
+ 				   IPv4 address */
+-- 
+2.47.1
+
diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb
index cf2b156fe..022bb62dd 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb
@@ -9,6 +9,7 @@ SRC_URI = "\
     http://media.luffy.cx/files/${BPN}/${BPN}-${PV}.tar.gz \
     file://lldpd.init.d \
     file://lldpd.default \
+    file://CVE-2023-41910.patch \
     "
 
 SRC_URI[md5sum] = "000042dbf5b445f750b5ba01ab25c8ba"
-- 
2.47.1


