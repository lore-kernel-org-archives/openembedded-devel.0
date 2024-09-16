Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DED1C3ABB2
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 10:34:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5534.1726482856187841682
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Sep 2024 03:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=998981378a=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48G6OMK5016566
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Sep 2024 03:34:15 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41n5s4hkvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Sep 2024 03:34:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ccNsPA4u1agJdWjBcbl5ASjhrh4BTrIcXZeoihif2Z6QhZWz2l7p8f/wcRKhcmzrmQ5WGGcf/MYP3J3bQ8qkC61Tm1xad/W8u3tWTbEVOOCAgI4R8sBB4ifms00ouY9DXD1aEIMAy42CyQFpmIzWixqDjiZiatxQx1dwSiHTSzzzhVBd5OA/GqJ2/k+eX3Norm7TRZbK2imqIvMXSvUlMcSxtdHE43LEdjMZ6eKQkrDgS9v8hRy8ACK3UUcrgIi5UV7dgAAJClJwLIFTJFH84nBBndRFWt44okFFnS5r+qcp9LlHRIvF+szzK6cV8ao60gMIGeFojg5t2VzLTGn/LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gARhTAEG+8s9jlQhaUCCJMEKn+dB71LDZD6pqI23ZjQ=;
 b=fS/JTqY95byTTNUrQEjSnDpo48uqsbZcY6i1WMeOt7IyKOah/Q4hK5zSx/CeAIDBqbFIssGK6z1mMFeMRdIK/bnEOf+0+p20qiZa++ONaJSuAthYxmpjcAt2y30aZiV8FAoBhHM7JcaznsREkGjrDUNEO0q5cdt3zKUmeS9Wvmpo7uYLDfCeYxpVrFbGG4KteQuA5z/2t5gyQLDhtAfpODjQ81QCoLT5eCTYAp4RSv2XMTAabIpRBcA2CKD6De9wm+zJgpRiZwOtuolZ1Jtx8BXbruxTE2ELPNbyBk0hfwm05YFhxZ1Y1gVOUAa3Lf+u/DTPMoyLsYb54SM/ZBY4Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by IA1PR11MB6242.namprd11.prod.outlook.com (2603:10b6:208:3e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Mon, 16 Sep
 2024 10:34:11 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::34f3:a7f9:47d4:b117]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::34f3:a7f9:47d4:b117%3]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 10:34:11 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [meta-oe][scarthgap][PATCH] bpftool: Add support for riscv64
Date: Mon, 16 Sep 2024 03:33:52 -0700
Message-ID: <20240916103352.2092606-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0077.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::22) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_|IA1PR11MB6242:EE_
X-MS-Office365-Filtering-Correlation-Id: eb3958dd-e6e5-4f1c-8875-08dcd63b1a36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pmrhtjms9zXulXz0NlCeP/wRrL/TsZLz1YLLOcKRBi2wSJWH4MqwSwfXNEGw?=
 =?us-ascii?Q?WJNkuYGCISdwIjz75CXixTnq8mVKw/LvPwFhUcZPKD0C5O6eMnex6mfQBuae?=
 =?us-ascii?Q?O8bJSAM3eFnYNevUj43axqt54ooRI3nJNukfpVSPSwDGcrPxYkxQEJnyBROY?=
 =?us-ascii?Q?XeQoGP9pSAtg8BLrbvOCXyr27zqw7JokUnRP9IlqEXurXkdDADEcDw4u3EDN?=
 =?us-ascii?Q?XpkU3gbf0uwNF1SFap+V2ac1X5K62VR3WneS0na4HStqPOFaUOL61ESjazET?=
 =?us-ascii?Q?MlsUlsa554eYh9ekD5X+XU3ZwukGB+hmu1ktmADK6hSWSZjuidmKogiFCJCL?=
 =?us-ascii?Q?nlbugrY43nwUbv+BCoQuMH7q7d6+KforeUWH1tcOW0Rwdrj+WGlqfh22dw7f?=
 =?us-ascii?Q?Bk82QRNmMlmDeHXcEuTDtWpcWUElGPSJ6dnBj07wmITAZ1RIm9ZNLh5YNbSu?=
 =?us-ascii?Q?2lsZ3nX1hsx0WinaLvQLM0fNbg4bJx7DBly5XI00uvSJcE/ycR5+wrh6fQUe?=
 =?us-ascii?Q?3k/NBMKjbuN3pr9xXXCwsegD6KV6Tus6DZQHgUrWgqLcTmV+sLEF4QBLmyhU?=
 =?us-ascii?Q?pW3D23BhuFNPkuXG68SJKzh5G863MTWk6rJ3qOiSY87XqVKz2KOMNGNtZgzv?=
 =?us-ascii?Q?90UMkMMtZpNgHFAu+oUgZwzJY9THxXhaf5VdAFE+v+ocvSZOZkdwUdyi+AbG?=
 =?us-ascii?Q?+6X7ijsS4Q+R8OsEBNEQuLg9hhCUA9KJDQBG36/0RpogVVJdkXPTs9J3vWD1?=
 =?us-ascii?Q?rGfWFfRyCZaznLLTlJOZBtLpUIHK1GHsNas7anwbkYiwfvnDvNPN/XIyMTqv?=
 =?us-ascii?Q?EdDD7Q78IAt8AsZwgJyhGGnYYhOaW8Hre21pP1lcIFYqh0alzXaVdCuFwAaU?=
 =?us-ascii?Q?EQYZX+s9Qb/raf0C+T4r7WU3DaM+Abjvx+mx+qeHUe05K8jEWY2W7oJ+BK1g?=
 =?us-ascii?Q?0X7yQXTQOx9tkXnMyPXbvy0FrDwBcbu3uj0keQFpWZWleWiSUvg+JMDVI7VI?=
 =?us-ascii?Q?FzUyfybZQeF0bUPRAgQJ/aUht1bvCJCqwG0GnJ97ps8UY+uufooU7F0/8FV/?=
 =?us-ascii?Q?dF94ESQn61HP2IGla7JOl9euSLmcFEH99W1Nn/cwJc/OqRl8OkBG4U68z025?=
 =?us-ascii?Q?4T2onzadEsM1KqoEX2e90EMfSg0UIs6VMYNSQr0z8PBYB9gwhxpMRjAbVxP5?=
 =?us-ascii?Q?6LxZgjWF76dnKH/l4NYtaKCrXm7kZj+2NhESoJmq6nYcBJPq/OtfyOhOmDR1?=
 =?us-ascii?Q?vrXcJPLEGYAglFW4Vq0LUCYC1Rph6U6X8BuPvQVuEK85dREyMk9OIXIexcSe?=
 =?us-ascii?Q?8xjZvMJW+nZTTqZN5Bsg81kTDIsNmWM7h+3cOsLL7BGMEOd/7ZGXkmnzSwZj?=
 =?us-ascii?Q?ym5D0+r7rzqAsI9G7FDum+oN+g6TGlnM7/Yy4jGHPdHGtm7Urw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LIAWu6+Hh9j+8Hm5lZtlX2BvPgAVCLloqrGtYMlGDbmmGoIWVUjAJwDho1Ec?=
 =?us-ascii?Q?NLQbqCCtVERuY+jsZdfMQiQOH2biPlhOTQzpyS4+crh2+Yj9xhCvhMa1YF70?=
 =?us-ascii?Q?SZ09Nnsei+BE1yqU6s9si+vOfNFlakxitbfnyMge39wGtUsAfrz5NXQ6o+tH?=
 =?us-ascii?Q?Lg6T5rgJfUlka2EB7aAXYHxSF+J38JO7MS21YPFfpg4B3CgCDjzgt896EMAd?=
 =?us-ascii?Q?AqvZP2Yt4vyWX59sNCnPXpwtkV7c7fU+vfJGyQb6fy9TS2aqfIKttxlXMs/i?=
 =?us-ascii?Q?bw5PzzyClKo4+IkpiQXwt3JK80KUk9OR8iR8FTSwrH/Pk74yEYlFLjTVkk7d?=
 =?us-ascii?Q?D1v8oIPkRd13xSPKBnxk9yNwtZqkvFzGEQa6cAWPQ7BAtvyCQH4Fl6zxIeCl?=
 =?us-ascii?Q?o/rBAEVRRt/rT7v61uPsOAMOk/CHDIUl3OpMacqmnj7WELKBP2CvSjTJlpq8?=
 =?us-ascii?Q?NhefUVaxi9QKEaUd9L2mc7KNbNnD5w6StGVuWt3YTe2AofzN7g10LffCtS51?=
 =?us-ascii?Q?wL/o1+rUnXtvQCzezT4/LjBI4yWNkwwnDHmdeAU0yPauiZ5+3LsKAvRonF/D?=
 =?us-ascii?Q?bUNI69oMUr7Hm836gQCG4F/ua3ENiWBZDtVjbqa1SFPsgnhwkHWCNb0vrMsw?=
 =?us-ascii?Q?KhLVHbT+XuTtCP2dsx7lfI2DF+HB0ESRwH7ZePwedp6KZadS/IJeyWu3rS3w?=
 =?us-ascii?Q?jN8VAxHC/lHKH6HniAwQYl0QIb4yGg9sJXfIBlXBBavdjJXDQMuhz7LcK0QW?=
 =?us-ascii?Q?gY3J7MxN1fJx+S3/rjU0mvX71GO07RZ16mHtvnOmQCnHXgbVZE3Q/56wj7ur?=
 =?us-ascii?Q?YsBqMisJ47Hq9SA5kdwAfXt4bui0gTgUsvQ5ScMzOCGGA95r2mz1mG2S84wu?=
 =?us-ascii?Q?YMO3uFBbRI+2TPYI+2YMABUKSP7aVSX+Hvr7Tl1k0fJx2Ddr+sBSqt4K5+l2?=
 =?us-ascii?Q?Stk9t3lZyy7e9yZgWbS6XBFMBsJ42BeZyTmbTIbpUFjnbz1iIYc0bfhGnUt3?=
 =?us-ascii?Q?dripzvyv8wDX5PXRLoYgjWh6Tyf9963noFYEnqOsow+R8FMCD/nWm8Oot1Il?=
 =?us-ascii?Q?B+N7MLhh9GqzOFQbdxeUk5bkKyXlcpo/9RvMuzotFi1nT4F8VLDkCmvmVvSQ?=
 =?us-ascii?Q?nm/SPska1VvLFk7moriFVhI+XBWKdpNn7wCWWCmoLI1Nb4rQ443rit088nyJ?=
 =?us-ascii?Q?oWSkBWCyMO/yF/bt4sKA6xvrGLFzOxgdQg8vlfCC9mrY2rDdJCXRxZdK084R?=
 =?us-ascii?Q?8t4lbCT7MQTZr7nOxucp9BhR90O2/ad8IwHMJtKSDeW9/gOKJ+J6T3494EQJ?=
 =?us-ascii?Q?lMEHFjR+JuwQ/Z6eosr7nDknFLF5RN3rWBYA2m3nQXMIOIh9mwpOI73NBsVo?=
 =?us-ascii?Q?MrwV7Ln/aa+YTGTf3PamDjGJsfr/FT5p2sK7XKsSzR3wax0rKsfRfrrN1nj6?=
 =?us-ascii?Q?/bUOX9o0WePOlpCboXXyM3Wg43tgcik4ZVwcySMSTY+N7QVBd/p3yqYMFeJX?=
 =?us-ascii?Q?Umsmi8a80JKUPSL4w1e6qy64Wb3wSRwZz6Z9/SQavgXUrpwkQE3bXgzBrQ4Y?=
 =?us-ascii?Q?bX7FNV9vOaSP+a5+vkPhrA/K1rwuFeiy7b4X6q1AYoBS0J6+Qepefb0NEQzP?=
 =?us-ascii?Q?gw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb3958dd-e6e5-4f1c-8875-08dcd63b1a36
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 10:34:11.2291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bU0P0iIX4fme8atec42wTuSA6SVxB5jzVUkObe88IKyRBYYeGghNPxw1Vji4ga+EEth0wnWQMsF/KxAFWzZL4gaa1smoNNz6uhXkSLw/Xyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6242
X-Proofpoint-ORIG-GUID: Mfac56UIaSOs2tKpzekjeOYyn8jnlc5e
X-Proofpoint-GUID: Mfac56UIaSOs2tKpzekjeOYyn8jnlc5e
X-Authority-Analysis: v=2.4 cv=C8+7yhP+ c=1 sm=1 tr=0 ts=66e809a7 cx=c_pps a=6L7f6dt9FWfToKUQdDsCmg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=UTGy41UV_SZnT839eVoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-16_07,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 mlxlogscore=911 clxscore=1015 adultscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409160066
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Sep 2024 10:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112321

From: Harish Sadineni <Harish.Sadineni@windriver.com>

bpftool is supported for riscv64 and tested on qemuriscv64.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta-oe/recipes-kernel/bpftool/bpftool.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index b22334fe9..8bddde945 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -26,7 +26,7 @@ SECURITY_CFLAGS = ""
 
 do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
-COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
+COMPATIBLE_HOST = "(x86_64|aarch64|riscv64).*-linux"
 COMPATIBLE_HOST:libc-musl = 'null'
 
 do_compile() {
-- 
2.43.0


