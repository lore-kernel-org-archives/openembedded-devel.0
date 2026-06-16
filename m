Return-Path: <li.zhou@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55236CD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 06:32:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.148461.1781591543372622171
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 23:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dRpR+XVZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0627e9f081=li.zhou@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G69Yjs2262437
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 06:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=LgjWnt9br
	mNi9jEoX7++SNueVFBdZYBKtQ/xN3DVbl8=; b=dRpR+XVZMQ8BZZ4OfT5RJjxqP
	0UOO+2DrvpipXo7RjPE3dqFmp3Io2efDwfHcsPv3q/u9TPVBd1h+wAVvGaN3/t2Q
	K7kgaeQNwAjeUgJCy7Vt9PHFJIdsf2Xyo0JQBuWoFEp68TuYkDIGqs/UbCQS1ztQ
	dtqepmtPjlu8dHILaP1gyJu3CBgTqkj0DuGlgO6Uvstje8iZajTmihJYbbHeackx
	KJM/F9otILdeFNT8SI2G/s57lgnZLKQWB+dX8CY4qV4dxDSYLzZELBwAQ0656Xg5
	fOGK/pDX2lqlwgh53vzUyZ2b+F2Nw720+nYntyAPHXUWN/cj6tan/Pso9ZiBA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010006.outbound.protection.outlook.com [52.101.85.6])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4erx63vba7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 06:32:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXEBqeuhcwH7n2O+SEERhZrbuMd47YqnSnRHaMPKZS32mqKep4UnGqg/xtHVsh57kAmwyfdef55DLXo+ieGbElv3fzLHPiG7G2HcVRH48y/rkeyFbYF12tQJ4qw0oZ5F6uB9BWAK9LfXYNUhjTqarIoyZo4h6+RnsYidQMpDAIZy/LVaKm7AIFvcejdpKLZg3iTozRjEoRVW4LlQQN/6qql8VGzZZmwlD8r9npXgTF/wrPC01eQdtnNCXQwVdQ8V/aiESIUwnRckILWJSGiTh2Ca8pe5UwEBBmk9RR77ZpnbP2v/wTj7dESil3clVegzc/5EzDdgUtQC4S1a+DmV/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgjWnt9brmNi9jEoX7++SNueVFBdZYBKtQ/xN3DVbl8=;
 b=WO1IZyzZORWG4uJJZTKjxTef8mJLzMTu8lORTYYBpLgbOzcVTYRig139YBvsZ8hg0alXDo1lVTxreDiG59qK2V58SRKI/8dTV7yuMtEnmyk4ZuPJKjTTpyhCXwndm9OKhPESBRhRdhuagCF4OmUv7ysCXg2WtSZDfYmbjkYICZvymeHv1mk5Cl73+oD0sWnP+gkhnNm3azrW+GJ/Sh1X/EhMMYpayER66KDs810/Jd5RO2gNgMUkY7uuyV59GpF61nzRVXFCh3ckcoQYatXCtAyfMNI30ZSbxuFSZu3fjzDUktN3lutSwl11+/d3xYiG9U0YWnCjiTYY7MlKQuMIgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB7453.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19)
 by DSWPR11MB9763.namprd11.prod.outlook.com (2603:10b6:8:355::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 06:32:19 +0000
Received: from SJ2PR11MB7453.namprd11.prod.outlook.com
 ([fe80::3198:3bc6:ec3e:b2ae]) by SJ2PR11MB7453.namprd11.prod.outlook.com
 ([fe80::3198:3bc6:ec3e:b2ae%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 06:32:19 +0000
From: Li Zhou <li.zhou@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Li Zhou <li.zhou@windriver.com>
Subject: [oe][meta-oe][PATCH V2] minifi-cpp: upgrade libsodium 1.0.19 -> 1.0.20
Date: Tue, 16 Jun 2026 14:32:03 +0800
Message-Id: <20260616063203.2887648-1-li.zhou@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P301CA0016.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3bf::12) To SJ2PR11MB7453.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7453:EE_|DSWPR11MB9763:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf2d50e-67d2-4d46-dc96-08decb7103cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|23010399003|376014|12006099003|25016099003|18002099003|38350700014|29003799003|56012099006|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: 
	9KldwsdX5SufsVXQFIazJAT6w6QUKKBgLpV6K3itYPCRAw/h39hirgm1/kKYU1wmoJA4PlfATGP+7P0WStVXamJM1QGyqzUGPP1dQKSagDtWWlYQk+DFtDix3szQByprPKmJXwVs3RL+h9VDpFNiABToPymXaeafxe4k3nSn86FesqoARd/CCZXYWyg+2SkxL6IdMjZWMDldw0x2lJIrRPYGmmEJMxGjeBOGC3aL3DkT1IACkfY8zdRz1+Q8yNy9A5a34/lh7lJzDyi2XBWPzcAUqidbqOjl1YS728zcgVWSpZezy0+rG6KLp7L6bxCzGnuPmAMRbAi9yiI+hmJwAn7bwZrdegoRpm0sXyOPA9O8RDs7eBEztzrw4DTusJmle5krbEzABn408Gu9xDzg7GVL2z/wCBCeYd0hhrt9phLakRZ26OHnppvbXQLUMxA0eZoJEQbvwpi7IFU6/yyRdTt+riMeD7OeB/jQ8k3oRue6qHiKFNNzNv8u5KOkfkH1Fvu5RhJ8kVWD++j4ZI1b9aylJA0MD8GkMhJbctlrOPNkQgkg4nnPMLV4MEwO9aGGsAH5LYu6j1+BL6Z61ACD8c+PzMAhxPeSnnfAV+56XtK/Bcnd9MbydDZbdsYOETagSPOYIJGcphOAYgZuzAkWxqQJLIYPHE8z/nL5W5T4V1zE9t9DFaA+O4fiDdIHFBd9wFGAuuCJq3Rp8W8EADTzcA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7453.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(23010399003)(376014)(12006099003)(25016099003)(18002099003)(38350700014)(29003799003)(56012099006)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bzf5fjHArjz4IWjzUKjpYvRUQwLizzOVTh+3t5XUm+toR+MoPYQkm9TqAmbS?=
 =?us-ascii?Q?vqI30zcwXuqKaucWumL3Y5vZ9rjdumyIMiUq8FFQgqXyoKZYvzGqkpy6H6pO?=
 =?us-ascii?Q?8F+Z1pISou+SjTSTvbW6StRySR1ZsjCDFBJ0S3UtsX4gLap4S36UcOZ53yKd?=
 =?us-ascii?Q?gokUmlddUo1Hkv8CvJxMR0oPQeeA9DlOHRyUAvlONvqh7MLpiND7mfWObqMt?=
 =?us-ascii?Q?o30nMcetgX/WUn9Mf6W58YlMpnw+49TR8vlEay1Ap/KFMTzukU7Lrg5fKIKr?=
 =?us-ascii?Q?B9y4RYqOkSKvQXXkhdIohwkqKk3p/2MyN+WR5Ez69V4EAubz60m+tAfOfGDQ?=
 =?us-ascii?Q?oQaGr4YssKk3kkOENPL6o2LymOII1EIiAAAGjnpPzNYJ8vqeOwsjasQeYA73?=
 =?us-ascii?Q?eT8yxLm6rkeNoJiLsLpboPON3hwEn2388m/BodQ5nyEPBymxjZEXWWQeE4h0?=
 =?us-ascii?Q?YL77fx4mbHrrLF34x3cLAnvBiG6Q9EaElvTBAKpLZvM556pAcyBcN69CBNCl?=
 =?us-ascii?Q?6CG7G3Skt7dQrwt1/sKqix1qKkyzdGJKi0W1SiRwAokYb3CymQl4oR++fHrY?=
 =?us-ascii?Q?qt0WDen749vfcqde1xsLkyDhI9+/ucSRIoYJ1+PjU+MaWoz017rAbVH1T/6l?=
 =?us-ascii?Q?qpEice/5qs89dHH/9GPCoQER/qvyHOux2tyJupYdtaIa6hH0P8WlqIKfuf5F?=
 =?us-ascii?Q?L7CT20u433O7PATlnjUF289dJenNA0KN/AGcYiNapeNISHduAcN652QwyYcu?=
 =?us-ascii?Q?PrSth2ppSbR8sD+ybDUUfmNICdaVIA5MSozEILTfiRCGCqhO3f+vuCaFR8wh?=
 =?us-ascii?Q?T2WESUN6OpbgdBQqaNKBEY8gsn3Ux0uCmTUvwgBy/oK4YNaTPH705sAKpTfG?=
 =?us-ascii?Q?cPvg1xf6PVc8rpBCWEy6H8ExaiGSEOTRjRj0HjzpMTu+bYg9UegEEqhLWUDN?=
 =?us-ascii?Q?H8J3uiQK2XqcwwMi+NS+q4GALcxQrgE0fVSQoTOxK/N3qSjWvY7PvX3MXK77?=
 =?us-ascii?Q?DaVRJXKwU/eq7lGYFjYZa4x9yVTukyHD76R/gHJDc80zAbL12/q15YEdwHyU?=
 =?us-ascii?Q?fvDZxUzfY6aCY8bl+rq+mxlZHnsGBYK0kYEcBEen0KJgCE+RJh6EwPq5xOKF?=
 =?us-ascii?Q?9Jn7Kue0YxTfF0M7yQpfLJcffiNYl5Tbl4LEQjym6UgmyYm6VGdsvtt06liN?=
 =?us-ascii?Q?GZet2gi7YrX9RtJlQU6WC6hzJlmvWamC39Undt7gwYUIGRlkkA4bGJMBB5Ir?=
 =?us-ascii?Q?FwMG7tp1IyDRPlqRJJUM4LFIT/gfoFiv8rzfNfK96CgA9Q5Lfm9zNFCYCyFk?=
 =?us-ascii?Q?CfgNHAaIYIOCp5jAZwr2Q5U7Hzrb/ZuwDrGd7lA77TAtF2NViuJdlq+zMYiF?=
 =?us-ascii?Q?lgynVU0TPsnaRM4XJLLYr0s6T+e8YoO8eHj3hFQgpGsO2oGP/Z/4igwbOm9e?=
 =?us-ascii?Q?rDMr2mxjJf1uSgaUsbAIU1X1Qd0vW79YJflWrNZ+o8gAzh76JRK0MaUSYqR5?=
 =?us-ascii?Q?RQe/uUchturT43jn06a2aRtsT/7mdgsETCLj3SYWV6yWGBu1la+Ss2VU2vMn?=
 =?us-ascii?Q?hMENAY2Ip9QHWoKNhQNv19o/1DE5LPylmXf/EVulTOvK84DhFeEwrEYxjPxg?=
 =?us-ascii?Q?DnFf7mI7pD33Bv2h3sdY9lqBpmUGZGSpM1S/E0j6jcQtm7s3e+hX4S3vRDop?=
 =?us-ascii?Q?ZNOXfwh3tMv9hXA3Xbp01VsDc7FW5XUcRWZUp+8qd7YrVK78kIuezNaaSJ3T?=
 =?us-ascii?Q?aXbmZRf0jw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	Eg/HfTtmpnsvLWqz1zCt35Vjw0Xc4WZU6dE4wDAORlFKy2kGb3u0G9UZy0fj8zUztUrS7CKxXhHF4rUCPcaHRG1CJO04uoRO1i2vcA/pAetWKVennNAgVfDAQsEpc3JAV+KDV3TQ+NC5QC5Vzyu4JmJWow7UXtuOV9R3bvNS18+liPO9RYcx+Q+iIQLGHadp/BHhFhYeknFMow5m9IvdfQwHVnaGXcfQTfeyPlbgC76Qka1Mxr1MwlamIQHGmTkhVhASkWfw8TBMxVewSEvDT2KIvYECikaJkFQODah4MQ2043gE/uG1W7PH+8+JybSdxOYqrrt6sDDACovQAwybfw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf2d50e-67d2-4d46-dc96-08decb7103cb
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7453.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 06:32:19.0856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qN3XOvklEEWfRgXRjiVWBaDBUF7ghOykZc7Kdoc4/MSQEglLALCu1GBZ0ZOLHg0E9HAe6VSApTBsqrmGYNjldA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9763
X-Authority-Analysis: v=2.4 cv=SvmgLvO0 c=1 sm=1 tr=0 ts=6a30edf6 cx=c_pps
 a=gOINuM4uNKhgYw9Qn2OeKg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=3ngDpdnhAAAA:8 a=t7CeM3EgAAAA:8 a=95DwTBdXAAAA:8 a=21Ma_v2ZMOPBwCmYb_wA:9
 a=aupxLwd5jg1hj7vrjLfh:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Z7Plre_t_Rr_WjS3YmDd:22
X-Proofpoint-GUID: Jp6enT0oVIJRNR3dPr7dho7qW0rrzJ3x
X-Proofpoint-ORIG-GUID: Jp6enT0oVIJRNR3dPr7dho7qW0rrzJ3x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA2MiBTYWx0ZWRfX1BdjsZi4wIFi
 U2PJWxDj4/WpnEaTRwkrKvcovcEz8ekUVvuF0DifhuJk3nBRBJ0GFLz2Eq4/Kine5M36X4ixkt5
 PeeLrCKZH8Ra68QKwy6qY4iq9KcqEAtm3JdlxjCDlxruPTwnfVV/3yYy4kqCEtvjSmDoLI8zGJO
 vPMobEFq5GJN54Scsliw9x29VV1OKvOJ66qb0LED75V0DZ8y/qhGaoYQfJMlnlDkvSOoO9T0CcM
 hKGsgD9lLy2TZ+KcvQNocE3zOEUmmT8aUCLBxBJNIJS5Hx+TKkVWXFqKmbYyv0KQS7WHi1lVjTi
 65SHkaiM8DSj5Zd1P7ptcDL7q7CgxIKnIlwx68dXBs6Hh0Psm1W6EnWPyBX3hHZ3WezWGmZec1s
 82U2w4YBftlWnuLHBsHt491KrwIq/vzUCeU5fLoUYHnnZpGwD5Gc3aFjnp8ogMVHU/DZMb23YiW
 6Qkq3RfgtoRDs3TOOwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA2MiBTYWx0ZWRfX92Qo5BK1LNUq
 yAdAIHTVXfskdrkKaLkCNE467mYBSITuSmGzDh0a5roDygJ9uNtqUWzPR7qHuPNGx0ZosDOdgAt
 ONlj52od4V+CjC+m4aITGMb/L6SS8bG9o3bDpt699eQxQaQQO8jZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 06:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127603

Upgrade libsodium from 1.0.19 to 1.0.20 for minifi-cpp third party
dependency.

Updated below patch for upgrading:
0003-Fix-libsodium-build.patch

Removed below patch because it is in the new version:
0007-libsodium-aarch64-set-compiler-attributes-after-including-arm_.patcha

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../files/0003-Fix-libsodium-build.patch      |   8 +-
 ...iler-attributes-after-including-arm_.patch | 141 ------------------
 .../minifi-cpp/minifi-cpp_0.99.2.bb           |   7 +-
 3 files changed, 8 insertions(+), 148 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0007-libsodium-aarch64-set-compiler-attributes-after-including-arm_.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.patch b/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.patch
index db2434723b..9ce5600327 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.patch
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.patch
@@ -9,8 +9,10 @@ Subject: [PATCH] Fix libsodium build
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-[lz: Adapted the patch for context changes when upgrading
-from 0.99.1 to 0.99.2.]
+[lz: Adapted the patch for context changes when upgrading minifi-cpp
+from 0.99.1 to 0.99.2; adapted the patch when upgrading libsodium
+from 1.0.19 to 1.0.20 because the top-level directory name inside the
+tarball changed from libsodium-stable to libsodium-1.0.20.]
 Signed-off-by: Li Zhou <li.zhou@windriver.com>
 ---
  cmake/BundledLibSodium.cmake | 6 ++----
@@ -33,7 +35,7 @@ index 001a90dad..87a3244fd 100644
 -                URL_HASH ${LIBSODIUM_URL_HASH}
                  BUILD_IN_SOURCE true
 -                SOURCE_DIR "${BINARY_DIR}/thirdparty/libsodium-src"
-+                SOURCE_DIR "${SOURCE_DIR}/thirdparty/libsodium-stable"
++                SOURCE_DIR "${SOURCE_DIR}/thirdparty/libsodium-1.0.20"
                  BUILD_COMMAND make
                  CMAKE_COMMAND ""
                  UPDATE_COMMAND ""
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0007-libsodium-aarch64-set-compiler-attributes-after-including-arm_.patch b/meta-oe/recipes-extended/minifi-cpp/files/0007-libsodium-aarch64-set-compiler-attributes-after-including-arm_.patch
deleted file mode 100644
index 792a7888e3..0000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/0007-libsodium-aarch64-set-compiler-attributes-after-including-arm_.patch
+++ /dev/null
@@ -1,141 +0,0 @@
-From 3a59f8e5331bb6be5d298bc5c136a79102196c1d Mon Sep 17 00:00:00 2001
-From: Frank Denis <github@pureftpd.org>
-Date: Fri, 20 Oct 2023 13:47:57 +0200
-Subject: [PATCH] aarch64: set compiler attributes *after* including
- <arm_neon.h>
-
-Fixes #1321
-
-Upstream-Status: Backport
-[https://github.com/jedisct1/libsodium/commit/8f453f41f8834e0fe47610f2a3e03e696ddb3450]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- thirdparty/libsodium-stable/configure.ac             | 11 ++++++-----
- .../crypto_aead/aegis128l/aegis128l_armcrypto.c      | 12 ++++++------
- .../crypto_aead/aegis256/aegis256_armcrypto.c        | 12 ++++++------
- .../aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c   | 12 ++++++------
- 4 files changed, 24 insertions(+), 23 deletions(-)
-
-diff --git a/thirdparty/libsodium-stable/configure.ac b/thirdparty/libsodium-stable/configure.ac
-index df83ef512..be67d3417 100644
---- a/thirdparty/libsodium-stable/configure.ac
-+++ b/thirdparty/libsodium-stable/configure.ac
-@@ -398,11 +398,6 @@ AS_IF([test "x$EMSCRIPTEN" = "x"], [
-     have_armcrypto=no
-     AC_MSG_CHECKING(for ARM crypto instructions set)
-     AC_LINK_IFELSE([AC_LANG_PROGRAM([[
--      #ifdef __clang__
--      #  pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
--      #elif defined(__GNUC__)
--      #  pragma GCC target("+simd+crypto")
--      #endif
-       #ifndef __ARM_FEATURE_CRYPTO
-       #  define __ARM_FEATURE_CRYPTO 1
-       #endif
-@@ -411,6 +406,12 @@ AS_IF([test "x$EMSCRIPTEN" = "x"], [
-       #endif
- 
-       #include <arm_neon.h>
-+
-+      #ifdef __clang__
-+      #  pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
-+      #elif defined(__GNUC__)
-+      #  pragma GCC target("+simd+crypto")
-+      #endif
-     ]], [[
-       vaeseq_u8(vmovq_n_u8(0), vmovq_n_u8(0));
- 
-diff --git a/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aegis128l/aegis128l_armcrypto.c b/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aegis128l/aegis128l_armcrypto.c
-index 825de8a1c..a01f60cbe 100644
---- a/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aegis128l/aegis128l_armcrypto.c
-+++ b/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aegis128l/aegis128l_armcrypto.c
-@@ -17,12 +17,6 @@
- 
- #include "aegis128l_armcrypto.h"
- 
--#ifdef __clang__
--#pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
--#elif defined(__GNUC__)
--#pragma GCC target("+simd+crypto")
--#endif
--
- #ifndef __ARM_FEATURE_CRYPTO
- #define __ARM_FEATURE_CRYPTO 1
- #endif
-@@ -32,6 +26,12 @@
- 
- #include <arm_neon.h>
- 
-+#ifdef __clang__
-+#pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
-+#elif defined(__GNUC__)
-+#pragma GCC target("+simd+crypto")
-+#endif
-+
- #define AES_BLOCK_LENGTH 16
- 
- typedef uint8x16_t aes_block_t;
-diff --git a/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aegis256/aegis256_armcrypto.c b/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aegis256/aegis256_armcrypto.c
-index e1ebd577a..058e2072b 100644
---- a/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aegis256/aegis256_armcrypto.c
-+++ b/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aegis256/aegis256_armcrypto.c
-@@ -17,12 +17,6 @@
- 
- #include "aegis256_armcrypto.h"
- 
--#ifdef __clang__
--#pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
--#elif defined(__GNUC__)
--#pragma GCC target("+simd+crypto")
--#endif
--
- #ifndef __ARM_FEATURE_CRYPTO
- #define __ARM_FEATURE_CRYPTO 1
- #endif
-@@ -32,6 +26,12 @@
- 
- #include <arm_neon.h>
- 
-+#ifdef __clang__
-+#pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
-+#elif defined(__GNUC__)
-+#pragma GCC target("+simd+crypto")
-+#endif
-+
- #define AES_BLOCK_LENGTH 16
- 
- typedef uint8x16_t aes_block_t;
-diff --git a/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c b/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c
-index 0a5a12811..aa76f5cd1 100644
---- a/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c
-+++ b/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c
-@@ -19,12 +19,6 @@
- #define __vectorcall
- #endif
- 
--#ifdef __clang__
--#pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
--#elif defined(__GNUC__)
--#pragma GCC target("+simd+crypto")
--#endif
--
- #ifndef __ARM_FEATURE_CRYPTO
- #define __ARM_FEATURE_CRYPTO 1
- #endif
-@@ -34,6 +28,12 @@
- 
- #include <arm_neon.h>
- 
-+#ifdef __clang__
-+#pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
-+#elif defined(__GNUC__)
-+#pragma GCC target("+simd+crypto")
-+#endif
-+
- #define ABYTES    crypto_aead_aes256gcm_ABYTES
- #define NPUBBYTES crypto_aead_aes256gcm_NPUBBYTES
- #define KEYBYTES  crypto_aead_aes256gcm_KEYBYTES
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
index 6c64046161..384b453688 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
@@ -19,14 +19,13 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;protocol=https;branch=mai
            git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x;tag=v1.15.3;name=spdlog;destsuffix=${S}/thirdparty/spdlog-src \
            git://github.com/danielaparker/jsoncons.git;protocol=https;branch=master;name=jsoncons;destsuffix=${S}/thirdparty/jsoncons-src \
            ${DEBIAN_MIRROR}/main/o/ossp-uuid/ossp-uuid_1.6.2.orig.tar.gz;name=ossp-uuid;subdir=${S}/thirdparty \
-           https://download.libsodium.org/libsodium/releases/libsodium-1.0.19.tar.gz;name=libsodium;subdir=${S}/thirdparty \
+           https://download.libsodium.org/libsodium/releases/libsodium-1.0.20.tar.gz;name=libsodium;subdir=${S}/thirdparty \
            file://0001-Do-not-use-bundled-packages.patch \
            file://0002-Fix-osspuuid-build.patch \
            file://0003-Fix-libsodium-build.patch \
            file://0004-Pass-noline-flag-to-flex.patch \
            file://0005-generateVersion.sh-set-correct-buildrev.patch \
            file://0006-CMakeLists.txt-do-not-use-ccache.patch \
-           file://0007-libsodium-aarch64-set-compiler-attributes-after-including-arm_.patch \
            file://0001-Add-missing-include-for-malloc-free.patch;patchdir=thirdparty/fmt-src \
            file://0001-generateVersion.sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patch \
            file://0001-Fix-build-with-gcc-16.patch \
@@ -61,8 +60,8 @@ SRCREV_FORMAT .= "_expected-lite_range-v3_magic-enum_argparse_gsl-lite_date_asio
 
 # ossp-uuid: 1.6.2
 SRC_URI[ossp-uuid.sha256sum] = "11a615225baa5f8bb686824423f50e4427acd3f70d394765bdff32801f0fd5b0"
-# libsodium: 1.0.19
-SRC_URI[libsodium.sha256sum] = "018d79fe0a045cca07331d37bd0cb57b2e838c51bc48fd837a1472e50068bbea"
+# libsodium: 1.0.20
+SRC_URI[libsodium.sha256sum] = "ebb65ef6ca439333c2bb41a0c1990587288da07f6c7fd07cb3a18cc18d30ce19"
 
 
 inherit pkgconfig cmake systemd
-- 
2.34.1


