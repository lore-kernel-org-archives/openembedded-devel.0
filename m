Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE94C7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 08:48:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15189.1750668530401565714
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 01:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82698d78b6=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N5SFb3002170
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 08:48:49 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2075.outbound.protection.outlook.com [40.107.96.75])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dkqahfp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 08:48:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShbZXbUGYFW6QFK1AwV33VjDhisokrh6ppjl1LoJ+285wcdEmcluuQml2jm5V7ub/5X6g9QR/F6t8/DuhdWHGsr75Ig/DpDGhNyEGEfJesNZaxn1TR4IPSezTT6Xdz1O17Sv+UJaUJQ/CgZxwa/qp/HOHxNTOwq8TKcGjDzh/o+bL+6gbQP+4jnYd/GPqPC2w91qoJav+B1R3woBu+8launIDvlDCgCBtSgM8PK9QgGFtgrapzpvQjDFkgzpnpKDXgpVDBAdeGnEKukhd1Z0Nu/Lq6ZiMb+jo53jb6UJg4cHuHA39E8Y074dGYyBj6yzWDpGuwKCv0tSRTFbJUD2Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oqgiq7L50nq3dNszdJKaqvwatJBdijyC3iTWMv4Q9G8=;
 b=w637bkTuVh+ufoOidvd5yhT12c3nBs5Q+F0C6jZ8G1huCrtYzuYwtoVIgZpJD3hDWXMNKiKN+Qa8+H68S2XqYnXexlKkb5iUtrCqBwHAdvTtxOaI8W5uQCQY1UzvToowW+2x0we/j1nV0q86Rr/4RORTpUBv/Wvl/SacCJtl1IIeCVaMaAaliYS0T/67YlXsJqjQpxaU1EQP+qLmCkuQF+hmyvgNqiW6bemg3oKBgHwmTiLVtyWOV0+B5lrWcQqBB4761sbZIXGXmaCxPYz3Q69RyHzMyGZkqaiczhqFvE9rHPTHe7Zznkgf0T8mXrtDw61Fvu2W9x6Lxj8fTtputA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SJ5PPF1170C8165.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::810) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 08:48:45 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%3]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 08:48:45 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 1/2] protobuf: upgrade from 5.29.4 to 5.29.5
Date: Mon, 23 Jun 2025 16:47:15 +0800
Message-Id: <20250623084716.2318977-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KUZPR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:d10:33::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|SJ5PPF1170C8165:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a76a633-4387-4843-6908-08ddb232b97a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OyobrshoXdzLdCPt2NAEBbPDMlw9hPFBm0+iU6JSk5G/skvtcyVn6RHT4DTq?=
 =?us-ascii?Q?eFiHzwDbZLP2REfcDRVVFFbs1gqghW7+KxQwEfu4943vGPXwtUv2JMdq/bph?=
 =?us-ascii?Q?S6pWFOBE1kKHo7FKapei+k/PKO2Aw/JmXxtS4APBJyD63UCEPQI4GLI1jcW3?=
 =?us-ascii?Q?7gybXR4sTmbsJiV8DaIAj71ke89h0hgo+FbrXwmMpHXeKcH7uPVDHT8SDFOI?=
 =?us-ascii?Q?BYl3XTQoIfHz21TV8Q3eIbvUVtfgH3tWyXk8MeX/AyBK0BQ2YU5DoNN+kmZm?=
 =?us-ascii?Q?S+SAlDIKNvtCBeTV/Hwr4cu9/Cxxp1TupACYfW/uN6rEBNvxtP4gIwPWflp/?=
 =?us-ascii?Q?AppBwEc0fMPII22cFEhl+ezwiMSFqkobjyrGnUQZ6cywRbZPVUXJx3vF8VQh?=
 =?us-ascii?Q?kXcWET5qPZe6R033rmqou+wn3bYRynMx7DbedV+/YcqAm2P7pT3LlvLRLGEE?=
 =?us-ascii?Q?vTB/yaFiFVbDTTA7tqYzcnd/oIvcOdxhkXmYDDYXVFfY+cs+IjDOfJhQUp9p?=
 =?us-ascii?Q?VkkStG9F7R+3Aq/K+q4qtLYflih0Zi6y9peSy4SQbh5YhlaHnta6geQGMPr8?=
 =?us-ascii?Q?hTLxHD8D//Q1jYUXsGWoC9ez6R7Rd2hyrLdEGHIt7slx5+RbN8gHFT8MlxHD?=
 =?us-ascii?Q?Oexv31UtFfNLOtUpJdtihKr9v+DJcExDuFGq23hwcLB5ceYqE+SgKDuPjtvh?=
 =?us-ascii?Q?7MR9oFSJXzohHNtwwGsCfiz6dhyBzTh/fAM4JX4qk3vkO0d8BOYiE8ij8z2b?=
 =?us-ascii?Q?j9C2CqUIDdgj9NEYD+N0oK1oQMu0Mwxy/PUvVbwPgbCqewJrzbSlvp4PscvQ?=
 =?us-ascii?Q?lBJ7ylsN7L0TmiZN/QTuOmK+/ovC/1E3FPx/h63YoHVpcqfhb8qd3zs1R4SM?=
 =?us-ascii?Q?0zWvaBd6Y+MN/kYh7qGlWSsshcpqa8O1q5ZMFDDtaCqkgyKTJL0WgkUKN0vx?=
 =?us-ascii?Q?XQQDlxQPb+PCcuyMyES6O/u3IXh9/QKj9wUr90IJWtNO2YC3cxe/SMcyJhtj?=
 =?us-ascii?Q?hw26lo1K0Mw2QqGpl2vosvOnTbunnhNjMBP8fGRHzOV3+y7AgruyQNLCULWg?=
 =?us-ascii?Q?DZevM6TJi0iFKVvEgLaon3sht7dITALCcUBYxyQVmyMb9R6cWPDygtR7upSj?=
 =?us-ascii?Q?qjdVhV/O78odZJna0CA0AjZz9xKzb00y9MMkqacBMOJh+zqS44YUMqheLHES?=
 =?us-ascii?Q?6jymuEgB8UA7g5cWofRp7Gzttfc+cNvW0kuyUAW+DBdWrQ346FfHzA0EyVhZ?=
 =?us-ascii?Q?5iEq8SAiZQ3ppPqSNwpwEQMEX2AA/Vjr123tlfmuLYJumvXpxIVFgBqfPcEP?=
 =?us-ascii?Q?kM++iqRyTKrFYllLigNVE2T9ikEb0PcBxPNsiqJEAVXtSNisng3/vhB4nRTp?=
 =?us-ascii?Q?WRsm7yxHd+GSZUJTfOXEe4xkPWLF02IuwniXjCL9uhuqWWPf9/7jG38J3a3M?=
 =?us-ascii?Q?J/S2QWaeTWV1Q2wsaUNbRZXdWtcKe2dHS8TQlscVTDqRGzRxym7BSQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QUqUNWU9n/1h+oePngSrtoiW7IR/Mc60kLW5L2627iw8o7xzsGWSBfrzHR/i?=
 =?us-ascii?Q?nrHfwp2FeqxS8HGIz5p7Hadxk8Ni3ExupNNzyjsM5e9/kMKY4LjVuFWwsorM?=
 =?us-ascii?Q?rWoU1LnnY5mTNIiEKaqHWct+Gn30kcsD7QE5JZ01nns20awXncKw8aVaI8Wa?=
 =?us-ascii?Q?v6yZloifdctmZQ1/wO9mR/v0pjAOcq6C9vzUu2yWMIJ3XYRTrNohiJn6MBlV?=
 =?us-ascii?Q?dmeiT8ZDk0Q8sw9x+w/iDmyW7PKvy4ZU4lCMTvrclZ2NWHd+zOaACxFPy6LZ?=
 =?us-ascii?Q?aaDR3WSUDUZu/pXE4/xmgChB9f04/btyRbnv3XIZ7g3EAMHCY/c+PrEoBJWm?=
 =?us-ascii?Q?0FTyFRd8DHY0bl+TnapWjQUg8GA50UoY22Uo++8uUPeUXGLmyCyt2OxjIyXl?=
 =?us-ascii?Q?bF+RgsCcamJ7wzd/gUkx5XSB16Rlr1vvX/bHR/kJGsRf32gaj1ATMwXUAmpO?=
 =?us-ascii?Q?8v+kJmcZsihL6CvDDplaEtIhW8y0jcCj/Tyd+z0E1bySZ6l5XY4uKfVKpsUc?=
 =?us-ascii?Q?Lj3TR/AAPx6iLDGrMVMK4AZliaSPqr2IAKt4V6sGTc/w2u82CDEXFGOi5abT?=
 =?us-ascii?Q?hMlbHDRFuYuDUpoJVjhALegvzcWATDjFMx5TD9n9g65l8QTDCDCIM1jwT0h4?=
 =?us-ascii?Q?ul2h7OesEvjwGta/RC5cNGL1bkVWrYmEMSy6ObDwboQ+3toHhis3ukgSR7dN?=
 =?us-ascii?Q?85Wm2j+diSucLe1IHfI+Uch4N2819Bh60KZ9geL5R87iD3kzwYX9Sl+PsStt?=
 =?us-ascii?Q?CtRIjtezyogT7eGBi69En0mfRWeDovkhRm1zGTbN0MOMt9cdFFCVClZtNtaB?=
 =?us-ascii?Q?NIuAtlB9m2grn0fqX7eWdX1GBhed36kh7P9+q9iNp4oSIU0DpEv54UyvwlKu?=
 =?us-ascii?Q?qX2b+/WsmMUYX9nLxq5RSRG8sJ8aihWByxbhuxg4THhb1YGGjqeE1JlgPKVx?=
 =?us-ascii?Q?HLURRz8azjA8aZr/zHGJMPnCWJ5plRGIC5rdC300Suik+mHwq0EFGcJf3tcv?=
 =?us-ascii?Q?gxHl4kyUoVslH5YUvcakIPqqJtulwlWqyjJoqQm6CQH6n2rrRKbUX+21DK10?=
 =?us-ascii?Q?dVcX5mzS9enfOPk/zURaNyL19/uv+OF4IuRQyksZtt8I+ZIlICIFs3UMhB0K?=
 =?us-ascii?Q?NbODT9A+HjshhVOZmB30YsSfLmOKuhj7XHpjnDSHnSdcGP1xhdwq1RO6SXv+?=
 =?us-ascii?Q?pKoy3q3CAH5hTIGH5CjcsNHMfzDgnvzqcDgKtIs8gcfxSnTJTfNaNcUvmMlj?=
 =?us-ascii?Q?qM7Ypr/ivHto+sXZhShbPXwd5Whv9YMhU+amPbn2JiaoflEB5HM2yUIpGeXy?=
 =?us-ascii?Q?KiisTUKPBwpDaBSaZ4aJhZ6jlLsbM/bd0SdMElFYt9ziTE27HimVtD2O62XG?=
 =?us-ascii?Q?8crtN71FHFvjH3cudC6i1wfYzOfmxJy9JJ87NYX4Bum9oMFD8mjxfT/kQTFx?=
 =?us-ascii?Q?9qqFSIOTtVUyiS25TayVPw0SsWHkIU/LSykGBrFHksE+gVHjfj7P0oFbEoFJ?=
 =?us-ascii?Q?Ok8GNxxPUKulSyGBuoXa8HAXOfmpBSAZJXjHBNcqwXaEJKsAJfZrgEfzmsn3?=
 =?us-ascii?Q?8GidadrzD/8dPMtp+PmdBSrTdM/34s+xZADxmzKQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a76a633-4387-4843-6908-08ddb232b97a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 08:48:45.0949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rupafGUN+B8iZiZYmGr3/aGJEGCsvzRb+QQc+D0zCRKl5zzO34A8OGITObOOqZlCKkdEVq9lfQLqAODBm8NyzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1170C8165
X-Proofpoint-ORIG-GUID: rrUTJ5kvQC0cskypPYIcO2gcm5erVToN
X-Proofpoint-GUID: rrUTJ5kvQC0cskypPYIcO2gcm5erVToN
X-Authority-Analysis: v=2.4 cv=N/IpF39B c=1 sm=1 tr=0 ts=685914f1 cx=c_pps a=k7yIQboMVeCpALoKKa/KHw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=jjZwBTYg8Yegfxom1SMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA1MSBTYWx0ZWRfX/RfLu5j527Nf c5YACKuhL7TMt2QlspozljOpIBWCEdxIZecWsug7Nkx4ndYk9ZweGK9HGIDg+O2eJh8G/d1VZDq yb1BSH21/JIGwGKTDNKe05jPmOqSZNSBIkID3s0Qr1Ykig/OPaQCoGaO3jpmx/Z6CnTrACkNVjZ
 JVlHyHN/gD515OBZmuyLYuRHYcEPtBKudDaP66v3hYZMkJxMM9VkaD2RSw3pSylNkhsCb5lW2At bnAu81vVTp8H6oqED5ToyKfDjNAj0DBrMmlP2JZ5zaq530iIVAmUuW0PC74J+Do41ojHgpadl9S SxMGR3bKgKuGYre9A6Fs04fjXjR7mCFg309wlpyN5QqAylO7CVcZa0O9EUTCgFMeM+Zck9fvYP2
 x6hqluUy8c+wYX7uuhc6B29tKEOGn+Qe2Fhrkg6XqIQNE8k6bDZL08JwoGfvNmkk7a7VHLuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506230051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 08:48:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118062

From: Chen Qi <Qi.Chen@windriver.com>

This is a small version bump. It includes to following two
commits to fix CVE-2025-4565.

  05ba1a810 Add recursion depth limits to pure python
  1ef3f01c4 Internal pure python fixes

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../protobuf/{protobuf_5.29.4.bb => protobuf_5.29.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_5.29.4.bb => protobuf_5.29.5.bb} (99%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_5.29.5.bb
similarity index 99%
rename from meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_5.29.5.bb
index 30b805e6b1..88a979d0af 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_5.29.5.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
 DEPENDS = "zlib abseil-cpp jsoncpp"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "1be1c9d0ea6efa2a25bd7b76186844d1669be78a"
+SRCREV = "f5de0a0495faa63b4186fc767324f8b9a7bf4fc4"
 
 SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=29.x;protocol=https \
            file://run-ptest \
-- 
2.34.1


