Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15775EE642B
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 02:46:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.38557.1726109176853138058
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Sep 2024 19:46:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=998582a7bf=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C1eBJr027428
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 19:46:16 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gj44da23-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 19:46:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWyE/oChGeFUQ3o/sqBLPf8y9EHrfJWqg805k6slCReCBGN3wfDQsZpPrk8oaOTaQ3vZ65EZu3tY1/LdguSOhMowdwZ+xx8jl5siQuSjSDHp5Qi1lZk+ITpFvlKUwEYC9ESi5bKTFgzrH5jUHT0GiU39zngW2XlLKbXs4hnRQZllwFYb/+wnOFoiH45vbI6RCfKGpuoJgdPisW8I3F79rKl3qXhbx/68MLuA2aLf5BX6+Rra5Yd8r5fc7KhRsETzKW1P9FDHsonxe4cB0cckgUWNAYi274u3/I0nhJuK2JX5rluGh5scZbDMAj5BXUBqmxW2MWNWV/x20dmsceel4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQhqF4mOtpDzgjWgc3S9eXv5+kXCGXt6aMNX8YI6vko=;
 b=BmDWbDcEHKkXZFz42a3PTghm9cT2OlRQnfyombZ3PMEtZiN7AyNgud4KLBSNlkpjJgSt4hGZSRh9SU0NOvHseaMbD4nJd3+yqKVyXzFFQ3n8EyCwhzfrdmdzpfS/s9FgEjIYPS2md/Rl0xsTr5s29COP6l3tqmrEUY7KyvM6OJSsLsJj2IzmqIf3rzJMGV13DjqG2n4R5r0sCshWXL2R/h/bufw1IQQW2YrvzKPu/XSskrMkZ4xx6ZzSJN8THEzTZAS5/sSrpIc9L1BqrP6rur+gupOPu0RU/bZM+SyI2lCTolDrzAoG13rDiOhrhrm8XbD7BvZ/mt0Tsp77jJDtug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.25; Thu, 12 Sep 2024 02:46:14 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7962.017; Thu, 12 Sep 2024
 02:46:14 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 7/7] mce-test: update to latest git rev
Date: Thu, 12 Sep 2024 10:45:58 +0800
Message-Id: <20240912024558.3998529-7-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240912024558.3998529-1-yi.zhao@windriver.com>
References: <20240912024558.3998529-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0304.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::12) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM4PR11MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: e93c649f-4cfb-4466-0e62-08dcd2d511b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sTU9l9Go0IQMIWEoruRmmqSYvDECBp895zUFs2ARzHcAWWpdXJRmZHYFzW2D?=
 =?us-ascii?Q?0Eq/wovNHZdAcmmqYsG06o6xrNtno/NGczPAbQl1fhMPlla/DqMfWdq9KPH8?=
 =?us-ascii?Q?JeKInASjg1qACZD5Q1RLjonaGgKmrghtfqo59RsrovtVU5x017UHuho5COK1?=
 =?us-ascii?Q?MDWC4KdW2wnXjbMqDTEy0J/5iE1rs1GHeQdcul5vSaAmuoMFkrnN43jfgX8w?=
 =?us-ascii?Q?dTGCoC4hWKt2Chs85JNnfpXerDs2Kx8Fqfynz7Zoulvxxv6P7Tq+YeC6BT91?=
 =?us-ascii?Q?foLbdgaxKIiRyW363+JsQn2VKCz7bb8/oL4tgEmePLu4CfnQ6RiBZCkYRo22?=
 =?us-ascii?Q?DKBpf7Ho6qel0Wc5mWIDGoZ7/QxUSeuvy/LZsMqyBuj9aWTLH08SP9pT2Pkn?=
 =?us-ascii?Q?Rva2IyUBAR/tHV0NSQ5cLDhins4PE4Wd91SUaM58nFRIkk5gmiE9WQIGnwVt?=
 =?us-ascii?Q?uG5Lb5C2CdPJbTNtTZ1s3wSxqqU3wKw46hNKPeX3G20jPTFWRP88s/WWvjFi?=
 =?us-ascii?Q?KUvUXcjKZCv41a+tqKE8Oq5s7Fs1ANdj5Hf6ZTTR+wwrubMCBPEaTSMYMN6i?=
 =?us-ascii?Q?HRIQgMHPhl/AuopJ8GfcUuBnB/1iqDDJ0Qu4Oz6kgXnoa2/Ze1sKT8p3oNuM?=
 =?us-ascii?Q?LccUeiJXlJEvq2zM1qs0xMG+dun/KuCXghXuLjigDYzhe8ebCWdvd+Uf8PLO?=
 =?us-ascii?Q?tKGUGtWnLF1cQbqXnsO/KmnW56zKusxMbIslQowXgd9Iuw8IswCKTGfANezU?=
 =?us-ascii?Q?Bf7zC/xUwgFQ4moC45OAYDIF+FAdljumMeWkEIpoSRqlmNdTpT4hj+aG6p7M?=
 =?us-ascii?Q?4T1ErubFOEQRIUGG7G5dIoRTjKoByMyN9Qlm225Un/EwAUT4D3fJcpaf7Sr1?=
 =?us-ascii?Q?MSEzOnlasueiZhh/roTmp/HU7JXfqewJxTTyf60OiSkvT4o+YAX2gjRIVajG?=
 =?us-ascii?Q?jWsfFyksHmxHmPrgn91GeJ334RONUHyt4vkKcyHn1Z9HU8LQVWcZ7HgJRkxW?=
 =?us-ascii?Q?iau8aELuCJvSUTYUgjtWI+PM6ud8RO/lvAv6Q8YUNJtRH0AOmiyf1M2dWxEn?=
 =?us-ascii?Q?qA2Z7z4ZXT255oIAVKCbLp9U31j3KmB8sZEY3+UYUkZwshBEr1MBGzF8rYxT?=
 =?us-ascii?Q?wBcTWGaZBJvF5iqZ1UhJpp5XjQzUvPuo230xROsy7ZN2elsPndfNsoboQTLx?=
 =?us-ascii?Q?FWGrW5c0HhDKuu9SbGXcYRki64bWK7L0DUx53oV2dA9ncJptxp/8P78IRX8G?=
 =?us-ascii?Q?SWB6I22LCdI3zI0/j1YDBUHbpn0sBS5Efj/tl+am5j9hBAOB5P2RL6k5qAof?=
 =?us-ascii?Q?ZyZehbAoAsIlSl67XrNWqmBZCmfsQRe/m62OgBuGZoCVDg2frAMcjDPI9tHS?=
 =?us-ascii?Q?PFWpgAjPaIYCiSYMkcVO1i1pEUGIY7J2mM9cg+fmSQaFWRhirQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w1J8VCyqU40y/r3nsymEUNyGQtTCHoDbF5PZL0kOsC8g9tr+p1aGJFVAhY4P?=
 =?us-ascii?Q?cNCSnorgkLz+jUyZxWF836AYlIIBYMZeEkhnKth94ygoIzrTMyDK+PaTVe0q?=
 =?us-ascii?Q?FJIPi20yDhV8KI6yLMo//cbNNzR5vwEmpuDcuCPqLR8U5H2sC3ysBCau1SM5?=
 =?us-ascii?Q?t8ZBisj3PSM023XiDevE8ib+XypolyEmchL/ANojIlriEcMPI2hDpIQIetzi?=
 =?us-ascii?Q?DG07+563m9k5rIvluaWcS4EY1MoSwJHaJJRP9NSPOMgypRdpLbv/WPKBPTJw?=
 =?us-ascii?Q?YeYGk/wblU3cbNA2dM8Oi4dTv78gY3/eaWpWaNec3+zS6ftIXEhEImb7dJdW?=
 =?us-ascii?Q?Rs+POCjCUJ280rNjSoS7SF4FwWi3cZdRM73xzivIh2dfcyzowXJkg/fM04m/?=
 =?us-ascii?Q?M8RJaTKSf30ZBDcU3Wo1RTIo6o0/jO4YHtU4ItVJQJiT0gL4Nei4PZbetKTv?=
 =?us-ascii?Q?QMiwzhUlyYiiyEq1DRc96MQyyZwPVWTHu2JSVFkm+FgJ9n2SrNRFAXxKK04B?=
 =?us-ascii?Q?puW65ts4TGEVIDGysdW8rTA6EWHXiafaq2f7vkPyTSHHGuJRh6qU2Q8GVCLu?=
 =?us-ascii?Q?iHeQxbuOg+A5Y9syvCxUBTi18d9q4I6pqZe4I/RUh2sWAzciXPUFh7tQm77P?=
 =?us-ascii?Q?fEzriLmsSUm3rGDyZ+7vzuHkrcjw3sdPGgORb1BHJCOhAg2xQHi6WM25ZM+5?=
 =?us-ascii?Q?jpEyze37ZQfQSDRBQDPVl2cToAjV+Fl9/g2w7TtQ1gXcz+9OzuKzVhI3mCg3?=
 =?us-ascii?Q?kbNYshTu/yHguhQaaHdFq8LW66fPPKOexc6k+hf0e8vuZ0rgNWaRVjp0li05?=
 =?us-ascii?Q?Gbn4PZIwGSd+WrHbQ486yz5c+ockLuzo2Mi9xZk1RnS8svDLaxino9vQKxJe?=
 =?us-ascii?Q?yw+KGP6qEbHI31g2EqPJ1pfXD9vGMp5bh2e6rGpxTiFtTOI3mzHYMFCcYB4O?=
 =?us-ascii?Q?k148/nSKgNAp8kzeW9Xa80zwvuoF+zJA2SHANqXnoi5/7QsAttP8w3NGi3T1?=
 =?us-ascii?Q?erAmVWKloUL8LSCOEYXnszYsgOtXY1Z8PnA9poc1XW9hal9hnlUs6YskFT5b?=
 =?us-ascii?Q?7jco1AU3kmpQHaUpwJS5KXtx2rr3Gq8spHwl33HXBvltZeqG5vZzrgcGwUGJ?=
 =?us-ascii?Q?7+NngOPgcie+5k+GodarV1o7w/crGDPB8KHEtYJatXd5shGYSgdmZ8IO1ikw?=
 =?us-ascii?Q?OuGfha+VATXL0lZx8/YZ2HE/GIhjSTpJ3OxGMQPu64PWsClgywhvnEqb9HJI?=
 =?us-ascii?Q?OHMXpGTMeJ6ITF/cNppsiOCwTAf4MgN/TpbbNhvoJ3eCebiFG5+kG9RHJlz/?=
 =?us-ascii?Q?CiaLTmkk1AlaSl51tddE35689qeBjLjt2wN/xgSywB5JPJRYcWVQLdD3gp26?=
 =?us-ascii?Q?XYLYAdPNuRkwJHq3Estr/jzUcjeMKh9bUigNBbVUqAB8n/7Hyx4qi3VCOz6v?=
 =?us-ascii?Q?g9mz0E7Qp0/RB1gEWh+JThE+2Wakq1gN1xAKXP0uL2qvNZ0WDNlPnZ1EDwQH?=
 =?us-ascii?Q?dihEDENe48kwCunvn6BN13iGPsktTHQRjr7iu8tFoyVndXxEXXF9kYIbwZDO?=
 =?us-ascii?Q?fM2juiOf3LUP+KMftgA499vG0xVJpPtwWnaEGZa9?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e93c649f-4cfb-4466-0e62-08dcd2d511b5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 02:46:14.9216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 70arlvuc8CK1ZHOPQQi/HBSD+cHZ+5Za5133Lf8JCVM51QFad5FL4HpFsV4lHccSyLlb+89VWb54tbVSE463gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
X-Proofpoint-GUID: VPTaUtB_nq8HjHvwFaDFd8lOFdDfCgO-
X-Authority-Analysis: v=2.4 cv=DZxFqetW c=1 sm=1 tr=0 ts=66e255f8 cx=c_pps a=fpyyTn7Kx2iM0+fj1eipXw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=VwQbUJbxAAAA:8 a=lQyNEkJmMfFgqAe3CxUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: VPTaUtB_nq8HjHvwFaDFd8lOFdDfCgO-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-11_02,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=665 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409120020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Sep 2024 02:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112253

9d11fc3e05ea tprctl: enhance sighandler to explicitly print si_code

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/mcelog/mce-test_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/mcelog/mce-test_git.bb b/meta-oe/recipes-support/mcelog/mce-test_git.bb
index 05e98e86e..0a6fd684e 100644
--- a/meta-oe/recipes-support/mcelog/mce-test_git.bb
+++ b/meta-oe/recipes-support/mcelog/mce-test_git.bb
@@ -14,8 +14,8 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mce-test.git;protocol=git;
            file://makefile-remove-ldflags.patch \
            file://0001-gcov_merge.py-scov_merge.py-switch-to-python3.patch \
           "
-SRCREV = "025014dedca39d2b8a57a82e52286e72e157d73a"
-PV = "20222810+git"
+SRCREV = "9d11fc3e05eae7b454efeb5941beded56f80445b"
+PV = "20230601+git"
 
 RDEPENDS:${PN} = "mcelog mce-inject dialog bash"
 
-- 
2.25.1


