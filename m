Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17864E7718B
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 23:35:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.24875.1735774529784452748
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jan 2025 15:35:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=30963dfe0d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 501NVCHR020192
	for <openembedded-devel@lists.openembedded.org>; Wed, 1 Jan 2025 23:35:29 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43t8a83kvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 01 Jan 2025 23:35:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7u7QsnxLV/ubNRlQ2V9yw7vzl0Oyc4mntw+6BuxrAOiSi+eMEJw6QVTYNO857r8XOOlMJ02UbGe0DhCTXF1eg9jnvUgfAwRvTyhACAVOaE02d3oZk5HbElvIQ8wec9/g8v4DEu3exbHl11vccLZLfbXPaww8qZSVOLaX3JGsGjqheZ9yCy+KYtz/flXWXeq3KEZhAagrpCQn+CKcxICXDrR95uN+FfGGY4EGp3Pr5f9apuDgwBYPvC9vxPfDlok/W+z8Z6pwJfKrmjD2wBQpBYRlAwu5Wh0WpiIp2UmK4UAwyEwNmET6U6zPalWN0tTfcL94J+LXemRfOzJiVKooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tkc9+wu9S7E9BnHjhUzlU6FuL4sYdNBYC8jhziyEJYY=;
 b=NZPOXgKd3wdmSzB7059Uzu6N50dEzZkiF+5qmz0J3m2uF74mgKHi2DKTFvTidzE/wxIIoNYAwARwu0CC5efl4Y/UYR/1EL5RFwl4Hxp8z+b3j3PNaghE2vqTVhHFKHbLD8UtRFXqJeWP5dnU6G5CgYI+Vpn7Gpr/25F8hQo1ZF682fBT59XMY58yMiC5GWOGdhYRFqhOku0xS1tMIfJqRsnRjLrVLRhK0nm6kwWC4Cyt+SaeDFsOqYQmrdhsXx83vqsKSzPDYkribNeIXbM19JK0D7+OlJ9g5oiTyId0YubyXhSoQulpvKh+l/4j8Kay3+cAZOMF8jNsuVUEWZaRIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY8PR11MB7899.namprd11.prod.outlook.com (2603:10b6:930:7e::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.13; Wed, 1 Jan 2025 23:35:21 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8314.011; Wed, 1 Jan 2025
 23:35:21 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] pahole: upgrade 1.27 -> 1.28
Date: Thu,  2 Jan 2025 07:35:05 +0800
Message-Id: <20250101233506.2222120-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0099.jpnprd01.prod.outlook.com
 (2603:1096:405:4::15) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY8PR11MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: 80130897-8197-4a24-3052-08dd2abcf504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oNXi8WV3Fl8KdkQyDIqiNWE8gU6xAKs8n/j58nzh8VHTylTqt20SqS9kjD1J?=
 =?us-ascii?Q?n7S43yJdCMUM3rj7pBZcZlaniGhj+wLKND7DqAVctMWUEZkof1S/VyCQ2DWi?=
 =?us-ascii?Q?m0Lj6K9sOiiEgkP4yYpNlZUQukIHWVTgB92Vj+emikckGDeBMWPmikBQp/CQ?=
 =?us-ascii?Q?Nvm6aEdgrAsRn4F+VZFp/E2OxmdLrd7amENc4PHRh73B8usnLUaMSxTCjzUZ?=
 =?us-ascii?Q?s+c+ojZyQAcTytG6g1r73Mpy5rS9WP1IgDIDwTFaNN8B42Q0qRqLFY3+NXSL?=
 =?us-ascii?Q?XCO7HEHCpB9+PeK4j3V15mTzNyFV2zSemtmnciAIApBAjyGX294aeMwIYyGh?=
 =?us-ascii?Q?pNmtOW4UqyxF887N/YZbOy3vjppIKzXkqNr9xDdSLMKvzJed8uEL6WvCodbW?=
 =?us-ascii?Q?zKAxSOyYgYAxKCZdsQHNlsYj6EB65dh4o0WA4KLCXC9barMcXaxjhbR0JsqL?=
 =?us-ascii?Q?i+1YWSB5DYdgR0qicqY9AGlzMG5gJhhPVNrirNaTPHWdwq+FhOTXrPEmmWEX?=
 =?us-ascii?Q?KfL/zNqr3CJY7sc9Jd9s77Gb0u8fpG708nDZDc6NQ3YnRwghQ89uaVvBHvaj?=
 =?us-ascii?Q?8P/p+w6yLeXKI1KiU5gbFravJeDxr7Fygfd6GVJZVM/Cj7HYuPokle65WW1h?=
 =?us-ascii?Q?IA4zGlfdGYm71NLrkqqYDxyQtKjxMTMSjf1qER4CN/hDOvSfuiaJbRevwhjl?=
 =?us-ascii?Q?ybrAUAhrUqlk/trlCmx+b38ZgQuZdR8Tm8atAgszmXLOm9dz2P6u2OLf4Pdj?=
 =?us-ascii?Q?EIFbRUOqX+gRfKpfNARbdgxdRc8wcIKn0Ua2P3o2tO1IQ89r3iI0WYGKDe5n?=
 =?us-ascii?Q?aqZXGkhm2kQetHuCZjyzFLPcd4D90fdyLIjhs91DKmyxITFS8AiLyIX9dSIH?=
 =?us-ascii?Q?+cYoiOafKrazE0hyqhhiEs07CR93XDpb50b0zfh1ALKY111GaqHzAZoGW4F8?=
 =?us-ascii?Q?CKqm+uT7dXUPC3zifYkmplqSbc5D2UtpULxToVOBofvh4s/hl4PedIi4H5Wb?=
 =?us-ascii?Q?7prw6tZpZIz/Y9vLq7CO/HlDPOvQZOwMOV7DRu/Nq/wVPCl/vzZB4ynr7epu?=
 =?us-ascii?Q?fYQGXqaadwAeOtVPM2P/gnPzNG7makL3MlNxyEIsBISIUdMaY0XEJ2oaTyoK?=
 =?us-ascii?Q?qrdaqO4JH7mY4eMkrcLGaIadRBSPUw/3j6q5N7f9rBiOLOWxY8Kd0T2ROh3s?=
 =?us-ascii?Q?T2SUPbznPFWk8V4244nSVasrKCajHz1ESpCG2N/Toucg2xQvmy2lP5zlSP7j?=
 =?us-ascii?Q?mPsREiRKMBIGwRhlxVkzFsSsmu3q05dKtDS2V9Ny1ODOrq7s/Jnkr76nhDsD?=
 =?us-ascii?Q?nQ6vxBRkHcEESW53ZD0P9CVkgRF4Fy67PiWcFL7cjnmNlJcSn5ANKuGGinte?=
 =?us-ascii?Q?DYfhhn5lLajI4MIoNmxOAefO7yiy2w+d8p047Y6UJaJFkPOQWziL7LNmIFLI?=
 =?us-ascii?Q?tkJ9vXyRmfwDPDfu54T8N6FVBXFevLJ/?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kDeLf54NVz+FDhxVgb6d8PSjx09UokQ1e8Nekss+8Mn/l1ZXndEbK1ocTuV0?=
 =?us-ascii?Q?rlSWZkqHOPEzYvn2Ae268CGMIyX9PD3tEpa+WqC9syD/l7TIRTs2zAhDPMam?=
 =?us-ascii?Q?oFJ2e/WaP1/BIwRllnoIt+IQhbgvjEmvY2rHr8jzAriv1MVeqTfA8XasdJsL?=
 =?us-ascii?Q?mFioAM95SFdgMi4hq+dzP+NdKD92YtfCey20KRQxU+/Mjr8Mgmv9yNVSDYzX?=
 =?us-ascii?Q?SYR4h6XAOGvZBF6sWH8RMY3CAS4V/3EU1JfVM59do7xvhPMoE0w3ORnQqFfu?=
 =?us-ascii?Q?S5GKCHDXCf2pk2lt4Ze15CVyk1Mwh8Ax1A++mCSwQbfCO7j2MSkXZIp35Ti6?=
 =?us-ascii?Q?Jk8PqfI2fV+h9FrTVI+OA+tMMumnymAac4g7pZsVAYg/1zUGmjo77qoYzNFT?=
 =?us-ascii?Q?d08HOR4M6T/dxB1uRlM6qjlWpnN+8VUFEnMGk1sYnzNGAT6sPUWLFBwe20dD?=
 =?us-ascii?Q?s1OntHbbZggaT1tAN7MeEZXAb9qZr+BriCsv/xqQfjrTjUsPZ8WKfzsGyBGc?=
 =?us-ascii?Q?iGvlXrzvPMvIN/iw1sxET/kxwQ1f/4VZqwLmDed8vqC/vtWtJN1h1vHcL777?=
 =?us-ascii?Q?j0icckrdXVVGlMqpq2afIN6eRaYgVviTvlf424LX1VCKbUj9cr+8rfn2iSzQ?=
 =?us-ascii?Q?ZOX5oCJba5JqI7BcuAP+v8Gcm22sPrDkwl3ZD+9AB/KmR1mNBHW+u0rwn6mp?=
 =?us-ascii?Q?cbHes6qVd3g8F4rowPCVCzPBF2XRG2SdGpxHkrAhqzIQ7O6zY9yPTULDYPzj?=
 =?us-ascii?Q?4lwVFBRIjYVlZiHoX2V1Vd9sM5A2SwDpCFE1M/HncL+JXMOttb+RhqJ/rLpM?=
 =?us-ascii?Q?hILRtGKVeZsr61cyokghuUA0/zzoxozRfy9/xxChQTi3IDqanfXA68hUOvvo?=
 =?us-ascii?Q?Itxc7ciPAdGQQ3XXcCEY/PWdteHcjUo82tkHMKRG236Bi9ScW1lMXKu1aucJ?=
 =?us-ascii?Q?dwLlnomFwYWdDoiBKI0SIPu3+R8CT3fMNklnqvko8e54rj+RabWvdv4tyMu/?=
 =?us-ascii?Q?LSh3ndKbVAuRE6AGmGw6PkAvwdj0A9Nz3+VvuG742aVFPKZq/f+lYkRSsaKE?=
 =?us-ascii?Q?lBCP0Bf09SjIA4oWLGhTCjiSYRPV36zo1IhG3S2oT1O/AElysh3r9pRQg78Z?=
 =?us-ascii?Q?nbnIWTO/EHgU1cV3vNZ038XHRHkjMep+xqSDgv1uo2avTdCW5tPkmB+1C+6K?=
 =?us-ascii?Q?Ukr1jbEj3l8q4LS/hCWH4CYa4R9ijZTBoqsXypZETs5be3hkiE1Nx85RqRS+?=
 =?us-ascii?Q?RVJ3ctggF3yVWtQWj+qku9ZeTRowuMhPAkMTgde3Ps2Yi85y/jMv318BkjX/?=
 =?us-ascii?Q?wWUhYBpRZz3uzX4hf+6qL4vhUz8sQXJJHWWBb3JswAyyPu+2THxhuedXRpdG?=
 =?us-ascii?Q?UWyVL4ASrz2hnUfarsSZnadR/V+rOWl56iOsKVXeS04cSB4zWyRSj8y+R2M4?=
 =?us-ascii?Q?TSj6PmgLOJFGY/+cOph60bZuSiyz/6Mo65OM6ByuQMrKPcYO0EjDnTYvhOCI?=
 =?us-ascii?Q?Qpfk82IdSASFnbR41IiAs3iGwMoD9MCsK/exr1OYOE6nZkMZs5nvpqHSTvGo?=
 =?us-ascii?Q?VgchAAvRVEchiM3W54G3EPagC/+IJZQU/M4wA6tg?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80130897-8197-4a24-3052-08dd2abcf504
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2025 23:35:21.1873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYrmETpsg3VPSDKLY9ld6TNcCk/wEqZ9QarpXx3lpaQYw1DuJV/zfMpPLRH+zUeZMCXj+TW/WybiO/wowfao3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7899
X-Proofpoint-GUID: feJ1L-IYDMaATManJuyskKBxD2b4x00R
X-Proofpoint-ORIG-GUID: feJ1L-IYDMaATManJuyskKBxD2b4x00R
X-Authority-Analysis: v=2.4 cv=f8qyBPyM c=1 sm=1 tr=0 ts=6775d140 cx=c_pps a=ZuQraZtzrhlqXEa35WAx3g==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=E5nPb1PLflDVQeCMBboA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-01_10,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501010210
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jan 2025 23:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114612

ChangeLog:
https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/changes-v1.28

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-devtools/pahole/{pahole_1.27.bb => pahole_1.28.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/pahole/{pahole_1.27.bb => pahole_1.28.bb} (95%)

diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.27.bb b/meta-oe/recipes-devtools/pahole/pahole_1.28.bb
similarity index 95%
rename from meta-oe/recipes-devtools/pahole/pahole_1.27.bb
rename to meta-oe/recipes-devtools/pahole/pahole_1.28.bb
index 902b0e61b5..ea2d0bab0d 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.27.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.28.bb
@@ -9,7 +9,7 @@ DEPENDS = "elfutils zlib libbpf"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"
 
-SRCREV = "3e265dac5ec85b956c664464072196c37d2af4f3"
+SRCREV = "1cb4202ed2cbd591734f6b7fb1d2b8aa8eb5a1c3"
 SRC_URI = "git://git.kernel.org/pub/scm/devel/pahole/pahole.git;branch=master \
            file://0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch"
 
-- 
2.25.1


