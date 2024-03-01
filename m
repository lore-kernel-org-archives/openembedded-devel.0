Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD3CC54798
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 02:13:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13406.1709259226819365752
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Feb 2024 18:13:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3790e67170=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4211DEZF011472
	for <openembedded-devel@lists.openembedded.org>; Fri, 1 Mar 2024 02:13:46 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wf7e6e54b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 02:13:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=km8YMFDyWfeTQRejOI5zUaOKijegV/AFxxZYqL7MytQzvKebaI1gyzQ6zLrbDpFdaVoXlKRjam8a3ftZ7iKEa56n5cSI4lKhBxUXBBNuEZ5E0Kvmr28x2Pi8mZ8ahi5q7htxwoC5ywX2NqacLO+jDRncgXP4OjgGlf5sNiw3kfcC5lpL3djeJcKkQwcyZG8glbqcTB5FHqWwEENZAk2t5x2gxVBkVyMO4Ka1O3Eb5+oo+RKC2XZuX1XNe91+SQDPqDKHInYz8HI2OltofZkC1i2h6Yd00S89Rg785hYX3id6LZGmJMBk4mtRfeOEcJ+KQ3mN43GrFqXG+8A3jAiR+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIPRZjXFTU8TvbsxGQUApbPb9RPVmQ7BDbvtQg9sRG4=;
 b=HlE1cqSgTVfKFxPzOni1lEMK/ggpjR8GKD0+Knu94HtdfjmiG2Kw+Qj66ashQZbmwotXPqDKPfbHK6K2xplu8LRAcU/+eqf2ehCr2g3UswuGuz2Eh7+NW+w4+hDKanhYUdtZMyzhJu7PRToQo6ENtDy9Lf20EkPIu1GO8InFyyLnCDtLwblu8zgDHoOTuNujUXNXMMaRCgpUPJFMTkgt7bN8Rom8Qsc+cdG2MeOwQKmZaR3ZplyB2sU3Ld4hk1p3LlII0T75UjSsrUH5QSWGMSaCE9KXhjvKd4VIYNA5LAynQo+zProc6Isjs//5wB+Sx9by9LWroQ6xfeOUsMPZNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by IA1PR11MB7918.namprd11.prod.outlook.com (2603:10b6:208:3ff::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Fri, 1 Mar
 2024 02:13:41 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673%4]) with mapi id 15.20.7339.023; Fri, 1 Mar 2024
 02:13:41 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] grpc: upgrade 1.60.0 -> 1.60.1
Date: Fri,  1 Mar 2024 10:53:08 +0800
Message-Id: <20240301025308.2452119-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.35.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0307.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::15) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|IA1PR11MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: 951f701a-6087-4ced-99a3-08dc399536f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gsTFfXiL7jZao1NIRg2E0+j0PrsZfaPG7ZN4dVnJaEb0cw6JBHza4cCn1V8ffHyu1qNPrDrPNI4X0bvcLKI8F1hEZHxAiQ1Clwwq4sRvV6jO0v+BcZxGWsGnKTOy9yyhpP3gNbvvcJ+p94owVodBeNRImozabgM6peuTJb/rmf1NoxFpjZCh5bicD6LpEkJ31MO7+usOC4jqMU6Qj6wgWdak6b7znkALYXA06GF0E3aAGfGWw/FAK2EHzXt0bXGxnIvcs3x5emNzu8J4JJo76sIEMCoqyz1kiPj2jVxIC3ifeF2P5O7uJ+ro5tlhCP/uCiCLInCRgUBA2fVYyIDZtOOEeoyPtSVz0ySECRPB8SgAVBdKq+vhN10RAWIiVhCdqelAke2a79lilENJblEyDFB/zxC4godUhD3QCOAcIVjUANVedj5yQCuOE9C0r4u71Gh3MU25imYPIxbMadueZg19mLqBDhYyOqWjLPuqEB0TbIGmi2mr34zjCTdfXq1ztt3zCgrgiXu5Ch5u2NOXztbw/VNm9shvUpTObb3uJVZNZL3abC35sicPa+3KUIFubGVnPUJGbWn6hUMOteyot5ZecErh6jR+7bZ3twDjKcQdYKJfX1JVEue5Rp822PcXp4XCuMvXDCRVRUGFNoRXLfkQxEw0aRosLpGegovBxibuOLbPHwSez7G7IOCRhfffGKX7UehTm4ecLrNlG44amQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RKyrV5WKic5P1u3OR8S6isp2hr97XG4Rg74VqX3u08Ky+4ViMFNAXfhGSOFU?=
 =?us-ascii?Q?HjNGoxmnwUS0MYywOOHN7Fo8KYbpvrSXgpIPDRxtoYeI2PaQdoS+MVv3tB5R?=
 =?us-ascii?Q?S7Smcn8NaaxIAM+xyAyww59omOBjEokwpjDkn3tTsxqWAISB4N4H2ZEQvUV0?=
 =?us-ascii?Q?Wu4VfM2qar1/Pj22FASvgCrSQIUq38mZktupOY91c3SjjkwbJ8YxVczUH2wn?=
 =?us-ascii?Q?eQOy+DHugSJmumf+Hvb1MjIsIoiPeFiwr2cIIMDBx0HwaDZDJqwoA3CdoEU+?=
 =?us-ascii?Q?MgAcj+wtEptukaqldEVu0xCU6c00wa+uNovkz2a+z/k2SHZ+NtFdiY9GXXDk?=
 =?us-ascii?Q?yfiixB8UT7NfDmvw1iaO4XyupZUEsC6jCncOaMcxH3GkXqbJ7kTMEdzjDigx?=
 =?us-ascii?Q?qeUHoqs432gKryJVHV1Tk/jjar/bBSF3aoByL4xnkIk4HAbBUWhsng//6/wc?=
 =?us-ascii?Q?1C524+F6mYLAsFd4uXCuJJcdu0TCuWw5LozfiVzqA2mFD4gBASiMzt42TM6v?=
 =?us-ascii?Q?+KDyenBhxobxcBYYK6AJK2JP/OglPNU29pquZ3DDvaPpne9JA14np6AaJD/R?=
 =?us-ascii?Q?GjnJl4maVbdrvkBEl95OtV1Uwl5aKtI+aFmS3xcl4lo2QUQfLs9wGci0v0GW?=
 =?us-ascii?Q?QSyVPBGwURERq2J7pgAsfPfeCm9qb4h6GVeP2SxHfPItEM2bgfgeGk+t6Vk5?=
 =?us-ascii?Q?z/brQEcSCvlkmB2G1YFJ1yYxIUtSrRzhWRGWCMJCklzJrKVRQaQ9tog3CGGB?=
 =?us-ascii?Q?tmYwZYQXit9d72k4Dbm2dC1rF+Zv4ddqd26d1aOdtda1GZ5xWZypW7akDEru?=
 =?us-ascii?Q?BmJ8+7Fwco5GSn5eWxSx2Rpx5zqqcvRFQ8KTR9s5x3O+CyzLdSPV7JRBLRoi?=
 =?us-ascii?Q?Sddtuw1GT6NdsQc2yjtak1mtLlhz/ViwgeMs7EsSUiKrAfIHn38Btr9qCcE/?=
 =?us-ascii?Q?oibq0D3mMxLSSwiAcUHzVtKvGL+4HncToGSzZBOUXuIrPJqsdwb/+dBBBv6Y?=
 =?us-ascii?Q?px02ahHHvbl6YFGcSAz21QUUMouYkHkQvWahg3c4EtiyOOBR4q1ANPHXX9CR?=
 =?us-ascii?Q?CQ0qom3SAYxsimgyKFhcyag7KVhimx5I425xUZkqDHPQufUNlWhg5XC9tb0I?=
 =?us-ascii?Q?TawR4oImfG9v7JYqRahIMztbT5OagU0NS+zwVydu/X7Ieb5rGTc5QYvNHEnO?=
 =?us-ascii?Q?PGwPNaAac1PbHCg3m8Qd4XwJcD+mYY1M8TLKCbp7BIxzpLFjbVpqFHftbxr8?=
 =?us-ascii?Q?SDLcl7M/AL3G74YK2N1+Cw9YsYGTUHd/hq1SS45kBgPAic4R7z2RfWxOy4wP?=
 =?us-ascii?Q?rbFGz5pZ1IlVDXhh3CKHbYpw/IdaIrhLIXIe5UXFB3xZPzgAd7Cj5Y/caR0c?=
 =?us-ascii?Q?MUKrbmYV9ms3bdHVt6zvsT6OFoAmO2fiA/c5aDVk/E0cyQYDlgwGXyrDsk0K?=
 =?us-ascii?Q?yHFn1H+4oOqH1AcGkcH4kYS3te2f2JqQENYn4SY1QQFjNJ1+AiuJkkqeCHSo?=
 =?us-ascii?Q?B/jrMx7FMFqI9sQE3qE/DZCjeTWwkf13meSHkrpeMJBOV5eKxcJoakoh/kjF?=
 =?us-ascii?Q?N/LMSqoP7VAt/sBNVJVyhis5vXUIbu6e6EjCoKKLLjO4OX7JMd2U45QWwEa9?=
 =?us-ascii?Q?lg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 951f701a-6087-4ced-99a3-08dc399536f0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 02:13:41.6929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: deLxXdaF8GM1tRRHlnpo5qxaN+oTqXezEMfWmxiYDnb4oimWQxGhg/H5MxX6G9zzwCVmztZAWBez/R+f3Y7Su7CZHZAHxJXUHQKcLdeDvWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7918
X-Proofpoint-GUID: GfPPRxAFhsYIWf3L7-q2KtGe8BcUPPhv
X-Proofpoint-ORIG-GUID: GfPPRxAFhsYIWf3L7-q2KtGe8BcUPPhv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_08,2024-02-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 mlxscore=0 impostorscore=0 spamscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=963 clxscore=1015
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2403010017
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 02:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109065

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Changelog:
==========
[Python Misc] Revert change to print backtrace in server
[PSM Interop] Use the Kokoro shared install lib from the new repo

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../recipes-devtools/grpc/{grpc_1.60.0.bb => grpc_1.60.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.60.0.bb => grpc_1.60.1.bb} (98%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.60.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb
similarity index 98%
rename from meta-oe/recipes-devtools/grpc/grpc_1.60.0.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb
index d41a73eee4..63c696a623 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.60.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "0ef13a7555dbaadd4633399242524129eef5e231"
+SRCREV_grpc = "e5ae3b6b44bf3b64d24bfb4b4f82556239b986db"
 BRANCH = "v1.60.x"
 SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
-- 
2.35.5


