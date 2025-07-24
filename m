Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72613C83F1A
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 11:44:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7116.1753343066827766879
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Jul 2025 00:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9300fbe988=bo.sun.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56O5gpMu452648
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jul 2025 07:44:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4838y18agy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jul 2025 07:44:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JcV6gzC/MCXCI2n0SaPrQT3d+LJjNBdCEvdmkpuaaM0YWUwiVUwSdB2DcoZ/wftBpkJIY7IOlvr0C6Q/HKsg8T/6CJgKXIsQ6Fve4IPqS0e31+GC/Yp9GB3DzhEm/51aHDkU1jgdHqdIF9X8opL8Tw9Ab8YtU63V72R2X8cF2tIU5sYkJAnIU0Ko5ruXUJV1Gyx48yhadQNbv/3zmo/saIIQ3gkGXhx9IKo96eW7kJXvan0Z2wVLjyQk8AmtEdIsbvQlbNvRGVGsMbFYL/XO5eiEVFaIRI2us1ejK4dvsCbF4Sj5XEExW3Tlhgtj74afbidosVd05D4+zKPAWOTSAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5BtGownMlFY8QxDht4QqB6IvKQ1EVwuJQ80bXXG3us=;
 b=FwAEAxET5UJButihIcRGZ4+YsbQsv60wIeFPhb/ctnckbZ4M0m6x1TtetNGQFvq6b6bq2dGdLK/SLoeBGUwE4MzgCu6A0D7NGEcJmzyOSfbDUWg20Ri31uoxjcQdQUIyfiq2yvAjdxUeipKsHua3QvT/XZEIjoVYwXZ8kG3yafXPwNvDKDICLKAsqYUeO8TYJJYrtHIgkZ6nVkDWaOKj5mKYABZDacVL08mcztw6vZ5RKzmUGpt5mjjEeQsq5zaNtEH9SbH6sY6OA5uCGywv2v2qoG41qah7fR/3RrbyL2JuJMu50irJlMPx9eb+rRWC6bh8sLC82oiryK8bK80Aaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB6214.namprd11.prod.outlook.com (2603:10b6:8:ac::7) by
 MW4PR11MB5911.namprd11.prod.outlook.com (2603:10b6:303:16b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 07:44:22 +0000
Received: from DM4PR11MB6214.namprd11.prod.outlook.com
 ([fe80::31e7:4eb1:db78:8446]) by DM4PR11MB6214.namprd11.prod.outlook.com
 ([fe80::31e7:4eb1:db78:8446%6]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 07:44:22 +0000
From: "Bo Sun" <Bo.Sun.CN@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH] thin-provisioning-tools: fix bindgen build error with clang on octeontx2
Date: Thu, 24 Jul 2025 15:44:11 +0800
Message-ID: <20250724074411.2903317-1-bo.sun.cn@windriver.com>
X-Mailer: git-send-email 2.50.1
X-ClientProxiedBy: SG2PR01CA0116.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::20) To DM4PR11MB6214.namprd11.prod.outlook.com
 (2603:10b6:8:ac::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6214:EE_|MW4PR11MB5911:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c0a2efa-701f-4ec0-ce4e-08ddca85e7b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Sm+eXVWQ4lH4SGXT3X56wesDMcvaDR5zO6vKYrtgkfiqul1xZhgyoYmeOGLg?=
 =?us-ascii?Q?woSGnTDsPUE519m6rWbex89qlXxWzU4aTetcFxFC3ZWKV5o+GaIX5QwjcUXm?=
 =?us-ascii?Q?N3x+dnU7Es2sZUDGwFuDAOCTwpEGyBZ+ZJFMwMavKH/rAoqb5GtCShFnKYT7?=
 =?us-ascii?Q?rwZQ5AHKByONp/dJWB4Jf47nDWOWNbvPJ2NtCyN4rKRZh6BuOCgMLOxl7l7I?=
 =?us-ascii?Q?YKHsXfKkE9EbNd+k94IgmdFEMfXHQiAoioGmHhZhYyqw4d5MXl+VqX58iyFC?=
 =?us-ascii?Q?AYHfm7fVflbfE5eYUuM9FHzhLdF/gMLhajamxTuYbhXtkyD3ERxmTkXOW04E?=
 =?us-ascii?Q?BatWiBuvlt5oE8eN94/Q0y9g8ATNpsERHJu7O1i665n4Rgt97iWO4n8c2Wuw?=
 =?us-ascii?Q?ragcVztJakC6eAh6//e3yJrsUQpGT3VPvTpG5GgvuAHaOYLyqyLB+ESVMVEP?=
 =?us-ascii?Q?tsvoBMIlrkFqKEBbOdgUmVVCa3R+1fR+HUO5j/4ufsEWOOa4li0NWnhA4ini?=
 =?us-ascii?Q?/spWwzU1dxhxy5W9B1xq6Yl7dWjw8HrNtBWWPQJ92uSgzSVdurW/GPcJ5AUV?=
 =?us-ascii?Q?DN8MU45YHWtfGjVPwOo3yKC6ZLwJqR0ky+pH2ubej+gt8bIJqu1spNi5yhLN?=
 =?us-ascii?Q?tIh5RDxMez3cp81pGZ1fmYnfSK/G8YDL+fVzpAsWk6gvsRksACrRmGfBus3N?=
 =?us-ascii?Q?70l8fuXaGV7DZOgECVQWcvfJeB3muw5hWnRFxg0anDJvXmWzjF0xZPtfwPwJ?=
 =?us-ascii?Q?+GxnrscOxcARlWU+y27G6MfmCb4nNRzQNlZryhYMwLG/AFdCEMvjTzg4bSfj?=
 =?us-ascii?Q?fbj1vB9RB0hgYBuLEi9VgGvL8IGhcyk0mo0Vfs35N7vgWv5KDtcfWqBICC3v?=
 =?us-ascii?Q?ZTgn6ksEmVg5z00lVc37LkpMdStlr9clB7LFWNq0L86Jt3QUeAO3tJE36BGk?=
 =?us-ascii?Q?ENJy2Rx786Codg03verXpoMZxk4Cn0h7FnNjlJ1FFzkONHIEUXtduh6PT4ro?=
 =?us-ascii?Q?Kd1ybxaVi2V/CpGu1yq38Ay3CfNO41c0XtIa1noyo5JyyMdIbmmGOOkbp8WR?=
 =?us-ascii?Q?adYtkCw2RW+Lz390v7BD8uCbdU6CCFziBFS/UIq93/1MZGSAWtvyXStlU7Pd?=
 =?us-ascii?Q?A+WIwC8B2zokF1hACLFrQ0NTVXIS9pACf6gHBylGgbkldxCLQD/WC66ircHB?=
 =?us-ascii?Q?oa4fMGhqSmQr4sPrOi543gseGTunPm8ZBbxdG4zDx7diIzeCAWC0t/W3BSXN?=
 =?us-ascii?Q?q1Sj6xNix7wYPyo3I29HkUSquXQo1cfw+KtxZdPV9aAQHKvbLbzi5XCo7VoX?=
 =?us-ascii?Q?zHuuGjmNBbv48KgKUqGwTCqB40xH/YBeUDuqaAD4i0a9NyCX9wIjJ0IJml0I?=
 =?us-ascii?Q?XSBg1mVoctUsIPK9EztII6SbzeHfxaRgoEJQqMubGqAFFMfJErOJz6y46n2K?=
 =?us-ascii?Q?QvzOATNGIVzekDJvv2oRgG7DNqQTfusDPFX8SRp1TCJ4I55jvJsIIg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yVEMqBd+dl8ZX/yyEG0ixTqTw9TGEM7HsZGUX3zNpAmB2oTvfPnfg14+7Hhn?=
 =?us-ascii?Q?3oTslweKVBjTK5khwClJNZ4GHYrHBfYeNrlfUrbZGAcZkWyq0HXACfw4LPOq?=
 =?us-ascii?Q?n3Z5LlymJ6xuFqaXKoZ5UGYrmxsee/zfr/F4KedsVXC5Bmb6WRu6pwlRfu0P?=
 =?us-ascii?Q?DjOSYMj2x2ixS2t11qIORlezG2NgCsk2NzSo7DPlQCuhvOvkdtINohuE7rbC?=
 =?us-ascii?Q?rgg3Ac7ZY8AstaH4feVbacdYPBHGX1jXiT2lWlL8H84EW9J/tFmGkfKMVdcB?=
 =?us-ascii?Q?OVKEwi2I0Ev4Oa9NrW0lz3jiJ3MFRUp90fTh7ubayeBMVC/0Vfu0MXvgQ9gX?=
 =?us-ascii?Q?vfKP6+9+2s8/Tdea9BynDYn+myI/u6wXTF9S62pcuEQ0NA9055xVO64pUZtp?=
 =?us-ascii?Q?XjItAAraYAFy1UBepoxkND1MfRjudEtFOFeAJ63KgTFTvE3wiQT5e7wRheTT?=
 =?us-ascii?Q?gDQgY0GSflthI0TmimPe+nzotwCJwt7Us24Oh1Ohiy4SRcCQgqHNmhmFGBqR?=
 =?us-ascii?Q?YjGhDPUsRhDd5xF1/bnbuL876b18NO4V+YjPxse1qpiWLkrUhiw76nskjaq7?=
 =?us-ascii?Q?XM1ly/bHY04Hjlgi0jHDBCXzwhKV17QvBkn/wiTjONCaYRsYyF/q9PKtwG2Q?=
 =?us-ascii?Q?lGbHOMi//yJTAUAqklAxCERe+wUmpv58nqN8XfaB+42bbUHFn8ls5NPh8lu2?=
 =?us-ascii?Q?pQGNzXrUr6Kv3rae9qctD972y6oVRPRRdR+qgq3GZ5ojqEqR0RHHjk91vH5r?=
 =?us-ascii?Q?NrVgL98BoYOmWbHd+sSM5kIYIIDdEPJoy4pagXk6I9fyPaxYPk8b1tnaSSCZ?=
 =?us-ascii?Q?q0ZRMYCGocwfAte+F8MfxP0k34/9PdxBD6Go3sjsmJZ4571a424xB6NRsUlb?=
 =?us-ascii?Q?eZ8zRtYKlhydbWOuAjscPQEDDUQ5eAaA6LYrhvJ105MUKJjU2oy3QAurcsia?=
 =?us-ascii?Q?HV7xH10xiDAT5XKGjkonF/V8/r1gn69TMxWssn6LGwScOJ9IBHoFyUr7XGdG?=
 =?us-ascii?Q?G1HbgkmMr5vIJ00hwpoFRUNag5XpKlRegsimijf2nRidtIlERkrOesekswGE?=
 =?us-ascii?Q?7yC+oewAp/9erWM+SNBOiNDdELD1/NCeu/zqUohuwAIFGnycaCw2UNNCX6Wz?=
 =?us-ascii?Q?aWj3sVfuuofTWxlfdrmOP4gLVSwivnqDYkp3t51sF/yQ/uwF5GFNtxXX/i0h?=
 =?us-ascii?Q?tNi+Z3xiygLrkQgjtn/hs+R4m87MMP44cKFUijTTLyd7Y2X7WUoDGB76xSNa?=
 =?us-ascii?Q?oT+Dfc8Dqmajq+k7PesltqmLbeIVDBJF1+BXAdrQFp9wvIAqz07vr/ej1HHN?=
 =?us-ascii?Q?tFL/YrWa+tmL0kEU+gwfcWFruRZwpkhDoj31J2HhRJ+946WhUwGiSSuJmrS0?=
 =?us-ascii?Q?ME7T/9XoRZ9tcZGnU6l7sOtfFT6DVbjmvprjL8HEDLXTJjDtZOIStiqOBJp8?=
 =?us-ascii?Q?E3M3LTcDfM1+mcRhwOFxSPoqcCHL/VhnhGH8pFhOFLPlJFRzwiM3HMAP/fua?=
 =?us-ascii?Q?uSEzNvbuktAlkrxBdPdiLqj0HOdhyjH2xNddn9K0UPI+Ui1b1k0fq1x+FpoX?=
 =?us-ascii?Q?b04IBpWby1xJ5XeVru3bu0o3gMljFwCnxurvAahD73rI8Xvko9DFIveo2fRz?=
 =?us-ascii?Q?Sw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0a2efa-701f-4ec0-ce4e-08ddca85e7b9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 07:44:22.5773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GW23hraY6QsecNsmrrr1cCLMy60wfkZUf7il9sY7AUt+mr8H5dZDP1V2g9t4bVsFb/JF84Re3ZAfea6Dq+/j+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5911
X-Authority-Analysis: v=2.4 cv=ZIfXmW7b c=1 sm=1 tr=0 ts=6881e459 cx=c_pps
 a=SqOJu+fA6qNg895n5GWYNQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=bNap1YoWMQwtF1uxaBcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Q89TKvBFsw45_jVak_EaGblL5Iuj5YRf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA1NCBTYWx0ZWRfX3Xj3BPrDfERg
 KR4Eztr0BG+XcURI1z3F++8QCMZgiXsfsDMXXtWe1o6dcDP7f7y5nDvQ8hpudcEBGicrr2l1EbJ
 vKCovqXGTHMZU2RwcKW765KlewRQFVkrMpdmFiOotya1e8FQs7GMkPLnZsHNYk8DEHtYLGn8mki
 gTYvX2jujRp8JjUFN0xpv/dA3jh1M9YctSdjxcjkXNdmg65JVIElY3IykmBJHHfZ6lrHNDLqUgf
 JlAlPZIeeBz+Ekul04u+9xOo6DaSRUqBc9zl0/F6LpT9Ue0HXlbhvuvsFgOjou99+SEm75OzNbU
 NDmfgOK9HoR/L4AQfW2GF4u7edODsykiKW+HR4HwY8JRb4jO6Nzrqdx7bhotsuY/kwjDPzayyci
 gkzq4Qe0
X-Proofpoint-GUID: Q89TKvBFsw45_jVak_EaGblL5Iuj5YRf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507230196
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Jul 2025 11:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118723

Remove unsupported '-mcpu=octeontx2+crypto' from BINDGEN_EXTRA_CLANG_ARGS
as clang does not recognize 'octeontx2' as a valid target CPU, causing
bindgen to fail when generating Rust bindings.

Since bindgen only parses headers using Clang, CPU-specific options
like -mcpu are generally unnecessary.

Fixes build failure:
|   error: unsupported argument 'octeontx2+crypto' to option '-mcpu='
|   error: unknown target CPU 'octeontx2'

Signed-off-by: Bo Sun <bo.sun.cn@windriver.com>
---
 .../thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
index a60ca11244..4ed885f8b3 100644
--- a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
+++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
@@ -23,7 +23,10 @@ inherit pkgconfig
 DEPENDS += "udev libdevmapper libdevmapper-native clang-native"
 
 export LIBCLANG_PATH = "${STAGING_LIBDIR_NATIVE}"
-export BINDGEN_EXTRA_CLANG_ARGS = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --target=${TARGET_SYS}"
+# Remove octeontx2 specific CPU flags that may cause issues with bindgen
+BINDGEN_EXTRA_CLANG_ARGS = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --target=${TARGET_SYS}"
+BINDGEN_EXTRA_CLANG_ARGS:remove = "-mcpu=octeontx2+crypto"
+export BINDGEN_EXTRA_CLANG_ARGS
 
 require ${BPN}-crates.inc
 require ${BPN}-git-crates.inc
-- 
2.50.1


