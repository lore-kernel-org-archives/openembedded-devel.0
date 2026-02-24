Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A98F4BB8A
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 20:26:16 +0000 (UTC)
Received: from mx0b-000eb902.pphosted.com (mx0b-000eb902.pphosted.com [205.220.177.212])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29921.1771964622935535778
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 12:23:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=IBVSVKLs;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=nudFX8rk;
 spf=pass (domain: garmin.com, ip: 205.220.177.212, mailfrom: prvs=7515d6ceb9=colin.mcallister@garmin.com)
Received: from pps.filterd (m0220298.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O9SXGD3018746;
	Tue, 24 Feb 2026 14:23:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps1; bh=jL/BruJSfI5sD4jePR9OqLR7Osh
	1fK/3/4JiFMQ2ExQ=; b=IBVSVKLs1aYeT+pDSbEie64VQ45KePXT+M9RHKai0em
	MmU62YoonfXRfpG25dLfxB9QBvyOPfl1/wEAVvoOU8hmuYAenfJfRPSWH5JkvK4Q
	U4wAHjcS2iMTW4glY0O1/jRtSYqDlSSxVdIAhsUCopcPsrXnwTi1cePfrH38VRlf
	bBlg6RDCx9w/Xw0ohSvBIT2aK94yQL50AOhmxIS+TjESbrPLTWmKPE3kiaDaidTS
	Z66C7cZjrvbKsudzaN6bFw3w0f95ylbgzti3rhH0yc17KsQ/mgHq8k0XqzQQZY6V
	PMvVEngL/E2mb7DPEUq97kLUcasZE5mvMVTdF40BClA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020123.outbound.protection.outlook.com [52.101.85.123])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 4ch9cysave-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 14:23:40 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMsrf3kxHIXtLxQ0yk6aXVTYN1AVJmV71TfHjxFXiFdlXM5NrRAwEhzdeXql2ki0vZJjB9MYZZrhcInmSvBVmECGdZfhigHbgQD9wMik/incXJR8czRW2lZyZUiQTsUtc7YTt0nd/Kdfr0tUSSfxB3YYDfFMYvdui8pJEAnadksL6M7GKAQ0Z6HlkTuhlPQd8KvPioRt6PWMBE+cp5DCYC9IQ8rOCqx/9ZBmZDNViCZzXobzQyDWbkqk2zMO4SikSj7fg6J7XK/EoPh58Ag7WhO+TKCHp6rpQ8VoEG5/XJI/SOkkf/CKusXZc3huen+bZsrseAcmqvltEZbzvjpVlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jL/BruJSfI5sD4jePR9OqLR7Osh1fK/3/4JiFMQ2ExQ=;
 b=JNFT23rGdwezdFhn62zgfok6rTB9QrTB4U8JTz3YyGCeGSTb90oW2SS7Pml0ccz8Heh6dbkXfo3bTnH1lN6zFgdHtZ+lHs4JDiEislO/QT4lO5pB88Om0X0ooq3loylcJqz1aLqGtcOtzNZS0bmXgSz42RTmvnZb6RDo7aEGa1AUtkDNGFggQslSDwv/nfnFjC3ZpNaQfOiZvHiNtQN/e3CNjaajByEuAwL+b8ttvEkueo0VpHFqJGSGys8Fv7Jc5iQEcukr43a0LRfucia3kyykzFra0xXpUbnNrpTNsB2uW2mQCrDWvI0hC3dBXEoGu89OPxCXNOErLjBkPl+deA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=garmin.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jL/BruJSfI5sD4jePR9OqLR7Osh1fK/3/4JiFMQ2ExQ=;
 b=nudFX8rkJD6vIpqinheTgzvKibLpTqJm9Dm0zLqBT5oOivEyxM3o88ZVqldGw80MLVgLUWSG/+pLBYaoAZepyqpMiDsDumkSW2pQyD/MHDFnHyBzu3EOSQ5IdzTxWNFXIiMzHIrfUImT2a/Dg2Q24MpouuBoMCMJOgmj6SJoqAH8oSo6tJcSnCd8iW3pqzYgk4YgqyaoGjqgS9+8icqdu5wjJPZPymPn6/e6p/j+mKc2XDjsNHZvoLIxPWWkI98FdwC5c4HJdXOpjInE4C2uHldBjJ8we3DhTTP3G7arp2WD6YjCkAgWQX1m5ntubJyMfc9GipX0/vBMtH09x3/tqw==
Received: from BLAPR05CA0003.namprd05.prod.outlook.com (2603:10b6:208:36e::10)
 by SA6PR04MB9670.namprd04.prod.outlook.com (2603:10b6:806:440::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.10; Tue, 24 Feb
 2026 20:23:36 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:208:36e:cafe::88) by BLAPR05CA0003.outlook.office365.com
 (2603:10b6:208:36e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 20:23:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Tue, 24 Feb 2026 20:23:35 +0000
Received: from cv1wpa-exmb6.ad.garmin.com (10.5.144.76) by cv1wpa-edge1
 (10.60.4.254) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 24 Feb
 2026 14:23:13 -0600
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 cv1wpa-exmb6.ad.garmin.com (10.5.144.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 24 Feb 2026 14:23:17 -0600
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 CV1WPA-EXMB1.ad.garmin.com (10.5.144.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Tue, 24 Feb 2026 14:23:16 -0600
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.71) with Microsoft SMTP Server id 15.1.2507.57 via Frontend
 Transport; Tue, 24 Feb 2026 14:23:16 -0600
From: "Colin McAllister" <colin.mcallister@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Chen Qi <Qi.Chen@windriver.com>, Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] iperf3: remove incorrect CVE_PRODUCT setting
Date: Tue, 24 Feb 2026 14:23:14 -0600
Message-ID: <20260224202314.1339383-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|SA6PR04MB9670:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d6a2b84-3d4b-4fe6-d2e7-08de73e296ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bKrL99Jsp8WxItexnWPfAmyT9xp8hSLahnkCerP3AxFEDSw+4QeSWEyjZPle?=
 =?us-ascii?Q?QEABGdPULiFzFW45Sumzl9j+E6YxYNqQ/aNaw4tc5hW3E8Ql7aT88pA2I8Lh?=
 =?us-ascii?Q?TiW9CK8EXTN6ee9+F1Z//c3mlbHFV+BHEDlawSaXwoe+NNf0V5pSumu4Wee/?=
 =?us-ascii?Q?oD3A+gVMsiraye/3M7I7uSX+oGwjjvIufRUuCU0RBw37yuRnNsABN1t/0l+8?=
 =?us-ascii?Q?gt1SgpnAiyeCDnfSXxJpQLdL//UeGKWI52L4n6RbVL/N5LRsjMGdb4jXlidj?=
 =?us-ascii?Q?nT+7Y7gWaSZEVwMj8+BMVxFo5cj+BhTDdRjrQZGHg76SaWAEGdzb1iXhRZDZ?=
 =?us-ascii?Q?r4vpsj47L2Vp2dcSzaztpsvuegexWx6fT69X/6vnCTMkeUkZZvhlRNKqzocR?=
 =?us-ascii?Q?bOAffXRu1aF4fwMOZPzNKuhUFwzKJ3EhyKBymXzbXIuMJ7l0mEbohh7s0c30?=
 =?us-ascii?Q?2yIao8qFh2B1CRPL8WlvOihSQmLGNusc6L/JCKV7Zwm62vZWzSVXsePyXET9?=
 =?us-ascii?Q?Gh7iX7aMy0hysTknhdv2l06OaKt0KRVtH1sVfx6y9P5qi/mOIvfmxijKZfjI?=
 =?us-ascii?Q?YshTUKOKDip4kTEVYXUVSG0at5dTRsRj5aRjyf4vZmr+Am32v1ZP+EwmC59R?=
 =?us-ascii?Q?L5ly28zr4Xse2QVKnAigz6RN7kw2LdEMThugfB1fjPAR6IOPKzd1dYKlkynT?=
 =?us-ascii?Q?yW/PONPJ9hW33YIPptzilI9BAuP92/OqyjSvXuGoF5MdQWEk4Xx5Yd7D3JOQ?=
 =?us-ascii?Q?B5bqxnEw8BMrCsIQtM0pwQFOpi0xKWS6+DPI2EUq2vm7nXwWbzFdnkvrlcUj?=
 =?us-ascii?Q?zzW8fyVZHc+vSn43vjXGpB6KPaRWzvjkDyj5d0YLQViYEJgqoBM76iVciXig?=
 =?us-ascii?Q?41F3pL2Jgb+j5lqrfzjzTu2PdpAb67rEOQG/+x7DjHdzpQSRLdp2JPxNn5Rt?=
 =?us-ascii?Q?FiSKko/d1UFQcTkbCyz7qz3qEUQdveNN5yU4fUtqwyTgrjfcWzSrTFNt7nGE?=
 =?us-ascii?Q?VtD6F/0DEAZAk9E9PVs/WWyNSiVvTJ1knqbwKnUwhMmuLgdPUTImd5eREhAH?=
 =?us-ascii?Q?lf/pdfZqkM/ptVoAkuDZiMMw0SAU/5kLsAnaUCQX4LTBHgcSJE9hKP9/5YqZ?=
 =?us-ascii?Q?j0/CSAArblwKx9uwibCeS/ECn3yjfUmSQMNtUBw+ChUjLNcyYlJQayEkAz/g?=
 =?us-ascii?Q?TaI4wv+H/HW5O5foltXOTtkwshk5agfBlAwEG9gE2yU3H2+ixuFibMHuxIJy?=
 =?us-ascii?Q?1DLAGkGZIAqUfUkVKGZjh97ruP73UQxebOAP3INuaRKDO5xz5z2S9uiVUQsF?=
 =?us-ascii?Q?LPPR7JXBwJda/IhJqK5RR70ybSGTNCJ3ASyuKVzghOcvHlDb4/hDjTualCQV?=
 =?us-ascii?Q?eEsq7jkqi07vwCu5Rf2EwkFScwbrlvo0TjmsaO3O9ZALJScjPJiTQ3W2DeXS?=
 =?us-ascii?Q?cI6JxA3oZdCirEThZthfgFmLfxLrazNJVWqB+43mxC6xS5ORieETLFSNuEeN?=
 =?us-ascii?Q?6JJIzfZIaf1tPQ+h406iGc2WHFWvvFHMh0R6l4087qKcB3ZOLZDy1OQrEIly?=
 =?us-ascii?Q?tXDIhJgy5aFh7HHoTg2f2tYwgiRggTZd6I8/LCnnk83uE4gmJAdRCosN63kK?=
 =?us-ascii?Q?R5papvVa3YwiGKQiBDZsBZYkKLqAodZyOikLdhIbLcFN+yaWLozr1O94s2+0?=
 =?us-ascii?Q?M4WJhA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	3Yyl4EHnZIFN4AbyArQ+V/2ms448WnLGFdJ+Szvm3ccxZq+p9jAh8wIsbYVBhgaFjQc8lIdptmYQ4xjot0lpb3GxtPRLSLsDQc01lobnTz0C/G9JLdOyDiSCNp4EF318Ehjs9z8FkFAwV8iM4uTHI1duW4o/bHSigFDt/qTimOyImP8tOqv6ms6YqHgsgW+BS1FDMezJ2YHRXPGgZjZc2koZf8Wg38bnw13Ju4Iw+HDwmC+wXpNYTyQBEsGM8NEZ+G1hBq0yCkcIR3ZKT9niP34ph+u17+fTH7nuBvXuCZ3nbN9ybC1+gtVb6FjNZx/85F+58FKKIKdEkrZGGGqNQNwFRDXuRCFZatHy0FngMRnVIp3zK6wrOX8fNwPKUreRKvV/T764aOINi7ur4W7A+YBMEJ757rONJouH2uQ+tNrB+H6VtqOffgr6CHUU5QzW
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 20:23:35.9653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6a2b84-3d4b-4fe6-d2e7-08de73e296ae
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR04MB9670
X-Authority-Analysis: v=2.4 cv=TfibdBQh c=1 sm=1 tr=0 ts=699e08cc cx=c_pps
 a=ERcN8ojmLF2LN6E1fAlUwA==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HzLeVaNsDn8A:10 a=qm69fr9Wx_0A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PYnjg3YJAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=GDsRaiUX8ag1zjqiOYgA:9
 a=FdTzh2GWekK77mhwV6Dw:22 cc=ntf
X-Proofpoint-GUID: aQUsXRn1Mi3rzA-m7CgTBkktINUNH2Aq
X-Proofpoint-ORIG-GUID: aQUsXRn1Mi3rzA-m7CgTBkktINUNH2Aq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE3NCBTYWx0ZWRfX5phPxG7QR0m9
 LepDJpAOnNT/9LiN0To7EY3Xc0YsIGUyUE0a/joqb4425k0SvEhMenXvQMqOU2hc9zSmfnKZs1t
 B2BjaZ324/BMjQY84ypiKklOrUgPrvdnER6WtX7rDDLK6mWB5Ydwv38Fs2EvbssXlcx20VFhBKm
 erKnNX2Yu0E97py/gOhj6BQtpzO95pxgdhgGvhQWblCEMgdjphxlmM4zMGluLiDVyt7xW5WT53U
 sz6Czr7WxvhG+9HJQ0yMwptdfBtuwJ3dtBE8Dgir33ZgqyxVW78saPSx4Upfp1mwQYEl9qcIEUq
 7dGaXVdPyLkVBgldh9CKmiNwq+Hs/PWwH4bLTAsf3Rf9M963xKAng6f4WIR6wgGkQS/2HXCOlDJ
 KLiTkPd6g54AAT3/ysEkdarrstadHHq1qai0p36b8lhZPPVqNpcSf2vMMk+yECl96HE+8Mktsb/
 QLd9xTa0GQ+Itfy2wR66jKD+aFOITLnbTr4VJQLM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1011 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc=notification route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602240174
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 20:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124601

From: Chen Qi <Qi.Chen@windriver.com>

This CVE_PRODUCT setting seems to be copied from the iperf2 recipe.
But the CVE_PRODUCT for iperf3 should be just iperf3. For example,
https://nvd.nist.gov/vuln/detail/CVE-2023-38403.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-benchmark/iperf3/iperf3_3.15.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.15.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.15.bb
index d708d74b38..4dae410a76 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.15.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.15.bb
@@ -34,5 +34,3 @@ PACKAGECONFIG[lksctp] = "ac_cv_header_netinet_sctp_h=yes,ac_cv_header_netinet_sc
 PACKAGECONFIG[openssl] = "--with-openssl=${RECIPE_SYSROOT}${prefix},--without-openssl,openssl"
 
 CFLAGS += "-D_GNU_SOURCE"
-
-CVE_PRODUCT = "iperf_project:iperf"
-- 
2.53.0


