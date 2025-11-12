Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6B7CCFA1A
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 13:44:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13516.1762955064174116384
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 05:44:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LhC9HDkf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC47kqS3400671
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Tj/4Rypuajmsv96gZ5ec
	h1jjbR7JgMGpUhlh+o9G8bs=; b=LhC9HDkfzKGi5gUE9d1gLu+dMXkrKCnWgHtN
	kqElyrpTUREi+5sJ/RUEFCiu8q0fxq59SAMu/leyIGqaCCO2HhhJVhHHYVByQEZy
	bx1I/3DEJcAoGGhWFsWYTpOsUQy4Vz/0D6ptJng7GSHR4HZXtU9LPoDGRhW0TEiC
	4JKJRynamOiMvq+t2Zvx6+5Dq67Z8O01n5Bf0eNBDFHGtA022us2ga0w7o2GamA5
	A/lAezeDGkWt4W+CF7DC7vPpzoLGBiF6JxDzUDsfFEsYWIynZeu28u9Nv+IKrOcx
	TMOsMADL1OpvQy1P/Lbw+1A1fFOjIJW4GExTO65aV4735UXqdA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012025.outbound.protection.outlook.com [40.93.195.25])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x5bms-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnESJ41TAJJ4YisfE/4s2oIGNO25xOGJZ8FDfnC8crK7zlIMdM82e7W6+gYZRz2K7xpkUc4mizLViKNrhqdICgzy7XcYHKqBzkFuDM3of4T/zEe5R+VT+PJexjBlikqEMKXKhQDEM8/jVxLGe7U7TrOFrX4tem5LmTa1bJAaIsNFUkJnXjhb92tiktlzBazlQLq+aaDv2w32dojfFRvWNGG9OtFq5OXTVSgmHy8hBBekxLcgokwCimp3TCs64Dk9dUkFlen2XnGnuHkTwaEXSMi9VvuhgsFKjiCgISOhdSs2j6R4Il8dToCfV8Y8mL8ZxUeHRUBi8vvkOFFwzTLDjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tj/4Rypuajmsv96gZ5ech1jjbR7JgMGpUhlh+o9G8bs=;
 b=F+f4lxOsgyzadzbW+UbWIjc5hhV1ZYI6ehf591uw/DydwTPaco3Tt72aaLZet1WsDz3HZaSJTMW0T2pkXA9unkPj0jiZMvB4pDTUPcEfUurouvwCArDxV3k3xs4JHvY+xQgNOhdLcv7VVHr+EVGDhyBsU7Oo5N0vho5H6nzxsgyspyx2W4KMOmo/OMeuv5/mOwRVf2IqEzM69Q8yZVtIHhkjH5cB1wr+G3Gp0g4TVGHjtypLfJzPOmy3lmz2WuUln+MevAAphNkoKb9Zk/jq8NkiJdZGvK4PIr9EpXvHQij5GtLycriYeMnn3NODCbofx++v1J+8GIfkWln9Ge+6wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS4PPFABF58482A.namprd11.prod.outlook.com (2603:10b6:f:fc02::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 13:44:21 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:44:21 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 01/19] abseil-cpp: add UPSTREAM_CHECK_URI
Date: Wed, 12 Nov 2025 21:43:47 +0800
Message-Id: <20251112134405.3706508-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0125.apcprd03.prod.outlook.com
 (2603:1096:4:91::29) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS4PPFABF58482A:EE_
X-MS-Office365-Filtering-Correlation-Id: f9511958-3b4b-4d14-9c92-08de21f1954b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xo5V9hbgDnkjJAm9evdqa4UUkDcCtyUtxQ2sKzWSIsy2TpAG6IiXKFk9t0Yw?=
 =?us-ascii?Q?rn4Yk+8e6gdSeaf75OkHyznVpudvdupYWnQXhO3GtKjNEBCUJK/KQTz4IjzT?=
 =?us-ascii?Q?3x0pH4DdLXjG4EzRrX8NgX0ZuQCBvct6XS8a0gvqHrR6SbbZAiYa7pQiCizL?=
 =?us-ascii?Q?MWzB2tgZ2XIb5wZiTcEl+6FAXKj/6mEYE8EXmY03iI2leOADLmhSY9KSEBWv?=
 =?us-ascii?Q?M+Mw+EjFTJbASHldJLblfir4UVY1gFzzAAiTYU6RoooFu5zvvYefYuA5gv50?=
 =?us-ascii?Q?u+6pzeuFboLiTd01mh28CSEZRIIqdZfmXQ0+QYn3QR5XLYfwi2SdTm8IWDRT?=
 =?us-ascii?Q?H7B9Jr90+T8/u41L9Wf/PthqYcPArD9KHsHulxb7yAl0eLrPOjySKEsoNuKO?=
 =?us-ascii?Q?TDXa+HciSe2ecGyGwhn52UNI1200JM6qVRIRq5EDenWqZU0TRmTRQXJ6PS2/?=
 =?us-ascii?Q?i2veEMwwwpIOf/LsguzBI4f1e6nadSo1JHhv4zIzBm1FKI0XhoK5y9wamb9z?=
 =?us-ascii?Q?3E94xoFAQr5KChT8Fxt4VM9A23FMv/y3gy0Uev5B0k7E79P/Q5UzgjgveG+j?=
 =?us-ascii?Q?nfP19CpxtoW6qqh1AEQc4LLHZDevPkBAfvrfNHmanCcklaI/LnXs020VxbZI?=
 =?us-ascii?Q?OX1gtIW0Wh61NK2JlsowXV7FFv9FJTlccYopP1yqlG3PQ1cOhQqPOEg/YHqd?=
 =?us-ascii?Q?aJAAJKFmB4IqhzJdmyGonOKR+Y13sqeZyTF2ivv2uXsNl75uDstBDTq3nFWg?=
 =?us-ascii?Q?bS9rc6pOmE1W0NtDw8i4o+L5TVeqynV85M2Tk1YdOKXafWR+L82pF0hxheQh?=
 =?us-ascii?Q?dyTWak3FfCdBgu9yIFl2PRNgBCi0c9Sjw4mD+ztib/1YgMGHNOT8/Xaqxrex?=
 =?us-ascii?Q?vwo3SPRERtJNYvCLHqEebpHhaRNv3iskQ+MWW2ogI65ZP9mLlcGXaig0u73V?=
 =?us-ascii?Q?zSVWzP3gDEBV0HEBxbFIvAOLdgJYwqTx+QI1yztyLbEISqGRqMc9lF/ldnik?=
 =?us-ascii?Q?/qdAL68VaaDkMpRGOX8MiTTumqn8vMmIUYPXvgbbZRoIRvELFjeWDvLMV2m7?=
 =?us-ascii?Q?PqqCvhY8lRyBLQr3zVyPCoTH/hHgkixwmjAfaCc4VOdujtpDm1SRhFm+eYNU?=
 =?us-ascii?Q?jO+b9XuL0lzdilXrUH4vfTkOFXN5qiL2Hcuvmw1n7AaltPYBlau3bRZ5P32K?=
 =?us-ascii?Q?qPtpKRcoJjr6DyvO0OW1q4zYgkW+GUdKGFpb+JSLHNetP5cgZurURhoydrtd?=
 =?us-ascii?Q?R7sSVZF4Slg6ANBRGkWTUY4NW+zBU5HR/ir8TSHSXajvnhCUEynFacanZaQF?=
 =?us-ascii?Q?DPYdjtxIuj1ktF8xppP6EsbqSPrAAK1//D5/xkyb5jY9aBpfCfhRytIpCm4C?=
 =?us-ascii?Q?zk/4Y9ZElKNrxMR1ZXc/tFFcQjYYGr+D/r+Ock9/z3XX+3L8iRGP5L4Puinq?=
 =?us-ascii?Q?iYPr26IHRVcxoPapRk12R7AxSFAXaCiuVWc1F1swymQrhPZwddHvXTlk6pR0?=
 =?us-ascii?Q?/144HaJTkS4AaX2mW8fVWwZ1uuQepfK9XcGVVIZN69HzCZzFJmIko7A1pA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UYgX1yAP4cM6lGK6ljltktt+aseOMqYXUFGlJvFUfOdoyR9+qQni2YUADmAl?=
 =?us-ascii?Q?IyX2I7HuckrRMoJz11/1789lI5cYY1LYhzyIAv9S+Qo8BMkG82bg3j6tYmGg?=
 =?us-ascii?Q?Fa4lFTX/uvkG9r+UlFRXyqfd9Nb6JRyJ47bZVr3VoF1MOJN2rcnQpsGwbmw9?=
 =?us-ascii?Q?8pfhZpJGWlumHtgM9ccJNm4u7Qdgyjb1jPBeaHNTpSGxm9OdBnvPNcVArV5q?=
 =?us-ascii?Q?nhGdk99LzwjJlsnBqp/8uCYwlOxfQ2zoTbzI4aTRYyBwqBg5RcxJi2Iwiz/G?=
 =?us-ascii?Q?3NB+mpWPy0FD9X0M0uYLzcgNGe4wpmXQjOlz73exxpM21KlnLcOo3z+jAZ5n?=
 =?us-ascii?Q?hBlO8U/SFfK4bv8bwdrYJdoF2ZE+kAZTqDUnDzZ8KcHpBe5gfXR+sPvFUBpa?=
 =?us-ascii?Q?CVlle3gQh3eKf/hEvztMoW6koKiMO/EUYO25NvC76TqoIdf38mv9Cx25UCa4?=
 =?us-ascii?Q?RorsWK7KwnSC5doMsyazoVYrQ8/DWyqKBPZCbj6BVY4DaqFM0ne7+SAaW+gu?=
 =?us-ascii?Q?XWEByXy3LkgxnzuEILyAMbASM7VZ1vWKZx1iOPynHREeAYahz6TlP+QPkv9u?=
 =?us-ascii?Q?8sE+VcAfy5/DHlrA0Mi/T5HSoGgwKsdCFnuMDxIk+KcdfL00S/Dkw4mhHdve?=
 =?us-ascii?Q?m6tDpbXdP3UXVu7KO9fXomC6h78iysjJT8Fg2JQanyAix5nGdSkUTHzkc/PI?=
 =?us-ascii?Q?xj7NwdQHraTSFixLPcuEZsq9nzavXUMi1/1iJylqbC67V0XZ3+9R8aIhiODz?=
 =?us-ascii?Q?ug4P+/KZ3AFyxkr7aWnCpNLjvogMK22wT5cvuHT6j7mgeDy/N+Q+anPMnzby?=
 =?us-ascii?Q?bsVFOsDNKmn2aVdvZd9ve/gaqF0AV69SDnHuKnr681awwdVl18K3EtEhLgIz?=
 =?us-ascii?Q?5IKaI+VVovxGKCmZNkb2F/mIM+GcmJ2gt73Fbv5lfCxOKsVkzIXY8Z4IxQnV?=
 =?us-ascii?Q?4mHQN317M/5SQiLVtt6vb8d7k3vxrbAyvryHchHoypaLYrDfho23MFsKu2sr?=
 =?us-ascii?Q?XVo7433uXyTeNLFVR4dszBsu1FlwpS9tsy5zXF3EyiBown1dOam2iFU2d9Ta?=
 =?us-ascii?Q?uxQEqT6oI8Obqtbc24hWm9A5ESF1tajJ/sKgHMLgO01QJYJAfPFUV28Y3e7B?=
 =?us-ascii?Q?bNzK5QW3EVwXLvQ4jtYX+LH/EpWbPclFOFHcdIbSMv6xfjiab0ohiOpUe13n?=
 =?us-ascii?Q?lZPPpYtesmkZYBAwUV/BtRDHl1M16Pg67nD2DTi1pJLXk5zHAKgK3q4mabog?=
 =?us-ascii?Q?4/fK0HehngVc+RazoO5fAzEHGinpVapSdmgROw/sBlc+NglBJe225ACMhH/7?=
 =?us-ascii?Q?fRYioGz/i0+A7yZabUDfAChGQlwcNErf3fTNyCDLrwApn46FKnLvkXDNi6I1?=
 =?us-ascii?Q?QZHx0VuaBOWt1jF++d6SpzOrh0MOwVsspbDTMj91kFxxTev1ASmP2TwlyxCU?=
 =?us-ascii?Q?2X89WHzw4LDr9XOndogPlGAzVgSQmkP5XQv8JolPOp+Xp6QC4QUsZvynZ+sH?=
 =?us-ascii?Q?A9pDsQAw9z8iq1Bktb4v/uaVrY8S71zUefTabO2Px3c7LbcDGR7nW8ZSykG5?=
 =?us-ascii?Q?U4JqPFYtqWui6u0iYAPmFuByJub2F3HscTLJzqSj?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9511958-3b4b-4d14-9c92-08de21f1954b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:44:21.2689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFgMkDlKagiopPayZHp8HJrlqobuvr7VU3Qd/234f/L6nJiHqtwXJxQh8JT4MXyEg/pcwNLvRDtMfwf2eJKHKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFABF58482A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExMSBTYWx0ZWRfX5VE2hJo7SvCz
 Ag7nV7z72ltzJ7M40DJWBifm+e3MzCqzT11msg7pLIa3PCuEz9hxndZNa2BjR1DL2UxcT84l5XB
 KKt+5hhS584fGbdX6WWRsy5s17+tjnxsDQGMrcJCsVgBx7o6mdgRY9PD/vtK86Ey4YuAuTxuokg
 7aoF+ww0jnlYirz5IfF4wU7uOpyHIXI642vnq491NSAS1v8ZnNvAes7PkYADblAfv9Y4r2wqvZr
 5/fyrOEaXtbDhwn1Yiq/6Ew5Ze9eMaUqwwmsOWKSL8uHAaRS2y7XbF16eijKRMuKm0JEcZCtVF0
 7Rh+4zfJWR8eyOtKcIHDLVRVxLqYvy82DeebWynUGsNN8iFFjla6axL866H1u3otcbJ+OelVT20
 R0YDyAyXurwFt6lSozkNO9RGGKUOVw==
X-Proofpoint-GUID: cdwPVWXCz4S7qvfWWpCkZXfrCYI-p2T6
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=69148f36 cx=c_pps
 a=PxHCaJupc5h57NVGAw5anA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=VukX6twli3kFl3srZ4gA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: cdwPVWXCz4S7qvfWWpCkZXfrCYI-p2T6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121531

Add UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to check the correct
latest stable verison.

Before the patch:
$ devtool latest-version abseil-cpp
INFO: Current version: 20250814.1
INFO: Latest version:

After the patch:
$ devtool latest-version abseil-cpp
INFO: Current version: 20250814.1
INFO: Latest version: 20250814.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250814.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250814.1.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250814.1.bb
index 1504dacb00..0394f36cdb 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250814.1.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250814.1.bb
@@ -13,6 +13,9 @@ SRC_URI = "https://github.com/abseil/${BPN}/releases/download/${PV}/${BP}.tar.gz
            "
 SRC_URI[sha256sum] = "1692f77d1739bacf3f94337188b78583cf09bab7e420d2dc6c5605a4f86785a1"
 
+UPSTREAM_CHECK_URI = "https://github.com/abseil/abseil-cpp/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
+
 inherit cmake
 
 EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON \
-- 
2.34.1


