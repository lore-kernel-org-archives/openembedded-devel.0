Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4115C5475B
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 06:49:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16920.1709275790251744768
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Feb 2024 22:49:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bTN4ab3p;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3790b160fd=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4215t28l012076
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Feb 2024 22:49:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=Su2cDQSczu2YTwW00O
	n79lAskOBbjcJ3GVdMZJoNLVo=; b=bTN4ab3pBo+U9vWGjYbwcdf3lcCHoqCLUJ
	gE9jWhhi2ikbBuPUfNPBWchvuv4CnaZId6YAIUTI+0+WJzed6w5uj3eCvvfpJY36
	7lifADAiKKcxbRRs+4KS7vpxqV20AiCBFwCpTv57b1U2HjP+haGIFdrgVRnODcxh
	Cs5zT+7k6mlaqotEBhJLxdeeE6D49VzroUpqWJIFdSaxxLyBb1bR9hHKxAiu1dbd
	LnR6r68ad4SheqU4hXwA1bBa4HpnVPwxxsrvxduK+ZSQhy3DNinBV6pTCN9Ko3Se
	KbtbGGLQO7cEKLrfAugHTIMxFTyZUHnJXbz8CsrG6MFTrkiI6W3Q==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wk755g3vp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Feb 2024 22:49:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYTelavST0SgPHep6K5fQ9leFvuOB7i+0pVBf9sZ/KpGZyDWrTeqYICNQYWpxz6XQXnk62mMD45TsgTO77ZD9HKB3CRxFe7d5okgEMXbsamCopPG50Vc7Fq+YbUAYVdl8pXTdX8mIXVGwFpRA1LzTMXWfe0dUT89fLix5KI0/6hWroiIf3trEIrwnDPeelkaqyqJxXxjkYdTTb3ATPACBvh0Xeqju3kggMy7hS1Udve73i0tFq42UOFmyY4+lirK7XBcqFzi+bPJ+26aUwLTEplTEFunXNZNpFfpp6wP8XN8g3EVZPT1cqjyKkO5jrr/DAUrMtUWkoEFOPcTwEJkMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Su2cDQSczu2YTwW00On79lAskOBbjcJ3GVdMZJoNLVo=;
 b=ROWUlnxel5WYyT1j8kk2M003OQWwqhj7v4HlHHWz67BaILSpE/vEyibC+ZFwSaqy41fh4c2F2O+cyaefvum83qvWQJdwlj130PCvvIS5NYbQ8Y7EM+eYDON2zcWm3KNwiZKwpp11YHFRah2zmgWNUrvxxaE9KmxKckvfqkKdmnanA3dzQDgX4zj6zcjct7mfXYdwEHAbO3qncEioibHelMWi/cNdfS9V+Ep76vi1Mo0Ad1zUNpb7pS7yQSXlGLzG8ObJQJ137REsHLI6X6f4EXNGMYsGkF/E0uu2da8dFNtxarbfcA7hmyYGFKGrvCnrPdPYYKQw26NKI7xqsZ4cqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by CH3PR11MB7793.namprd11.prod.outlook.com (2603:10b6:610:129::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.16; Fri, 1 Mar
 2024 06:49:48 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%5]) with mapi id 15.20.7339.024; Fri, 1 Mar 2024
 06:49:48 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] cryptsetup: upgrade 2.6.1 -> 2.7.0
Date: Fri,  1 Mar 2024 14:49:35 +0800
Message-Id: <20240301064936.1849170-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0113.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::17) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|CH3PR11MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: 5330cb1c-5ab8-4925-d4a5-08dc39bbc939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bwnlnm1EDCwGleQClzcE3MancBBhH0kXxMBZAEY8eDgLHYmkKHB5fr0F14XywrZC/8f/BzcnhkjPewRx8fZ0va8C3zukZC3ZZFAy32wr2wn+QMWg9PgLeb4z937JreK1nvXFNZFNbePA6fSGIyEXnemVWpovPdjIVJxAu38zuq/3nXbs0jA/b5VFniyLN86Cg0RyHtxHGTL8FqNzlgm1QJCoEcjjdua+tvJ+sVFl3Ls7twQyvvi+jzhTS+l1z1TB4uBFAwFDH/QWrrhqn1LLWAWbHXClYkfVuFnD/J8lRW8uXpQRH2vxe7N9ICKmMkRk5bJWDTVUaGKScn19yowlTq3HaUoSzLmr569TabYWO9tFZtH3NegQQtwcEQ+OFXqafoDOtKwR48FjjJU9lz7KA5CxXyPkIIl7G+wwQAt9n48oIb78Llj3GbgBozLu77riAUXqM7v5Sz/05Y9/6/riKokKDCEm6SAxO7quC2kWVT2v+LFp3kZAAx815VTHKuD17J9H9EIxudHfi8kEUVBa2mW5yC6E8W+geuJzpM6TVa9SFTxHfyj+yrjwT2ZkixW938baK6gXnVJWiwap0xWpX4OS1bAo3YApoBl4GvSlEFD6u1E1MlIXfkKlPyIwOoo22kriSVA71G9WnojuiJwqdtStaBzTI6PtKSJFhVS8XOE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0f9lzHnaqEhzZEbRfKQWHSakRNwikBsT976pqEc9ZbW2TVesJmZHj/HYj7CQ?=
 =?us-ascii?Q?h1Pb4LYo6C8t+f/CzQsWP20Vxr3DYFwiv1LDiGJmhi4htwDVbLvvQ6gaZh8v?=
 =?us-ascii?Q?9a47d1yqjKg/3M41eKKaomWvFRWolV7rmZ78RBSUo+TsKhPQ2PO9fvNUwvBL?=
 =?us-ascii?Q?kcVpn4e760g1CVVr9ej+NClXkIKuUuLGs7NXpFz2uJFrCVVGAaYbTUKeyMLK?=
 =?us-ascii?Q?RSCvhtisNaRKPHCwju8wR2imaKBNkfPpiXkIbdWbEuveWV/vF/wi5ckfgQce?=
 =?us-ascii?Q?UXt7zwEOXDgOg59ZEk78MpDnjEpB8i30+ZISRn4W4z6dGsJzwGslRW4+lHT8?=
 =?us-ascii?Q?R1ndtx/RgS9M/KsOTu8fN8nJ+YUaSDTzEQ6bDGb6PENa59zjGmxCfsj4Yd68?=
 =?us-ascii?Q?8hAVJbkIJ5h7cYvycYDMW2C/y9rW/u/OjseuAp1KoTiShI2sWvwaIhfnE7Sq?=
 =?us-ascii?Q?LR0Gxgt5I22aYsRz9M6QkE3kgzCyOGHq1VD7HYEbz5TD7SaN9WLyqHYQXyk1?=
 =?us-ascii?Q?YtaxmckMzgM4EOwfzRFpP4SOZKugtNEGFN7Ibz+SrEKS1+S7UClsMX5dS6u5?=
 =?us-ascii?Q?qXpxWSUxS/zvo+O9a8mEJ6Y2sMuTeUjwyNKRS4eWs4s6LJRJIkFqWUnCyXAt?=
 =?us-ascii?Q?ob7Es5LBmOOQGxik/XMbmZu7fHtWZuRJdp6X9RihQ5IIp241/XR2fDWGDyG6?=
 =?us-ascii?Q?h5Mv3JgHH1zyHwVSIZtlS4w0qe+GPwFG1a+8bMPbIG84HGQUbmu1EspdF8lJ?=
 =?us-ascii?Q?6vW81pXArvyH9dkdJTLPU9wXD9BsIsva4+Ql+m023d3s9t2YGQ/Bo9coO1bp?=
 =?us-ascii?Q?F7nXQSKcqS2Xw/0qLGrRT4Evj7AViOOeFlMvSqkfJ0ubq1XTAHRDXbnB2RoO?=
 =?us-ascii?Q?kqajLOzqTb66RUupBntBTpJ6Xc1T9/FiGEb595NGKlYUz3MronVgEXyNaNwN?=
 =?us-ascii?Q?j5oy9xRyEf+xdqX+p5HjqQJXDgWS2v22gZVh7Dl7y2jpA/0Sxj1+EG319BFa?=
 =?us-ascii?Q?gMzQGVQh5JbbQhtH80/Y+wA2121haSy2T30zFkFPO+1wXhfCopxycpfla6qG?=
 =?us-ascii?Q?s/WXYvJq+9K3MFXK5Ibd5huaeiTHagGZRTV4Ymc0m0IR+8e9Uh9m6rV95vVx?=
 =?us-ascii?Q?LZJw3wO10lamwYfDbhajBDfIdSpTi9V8d4j1c6F+8OSQh/PW38ohfxnsza9e?=
 =?us-ascii?Q?7NAOqWJPt6OyowXwnadw4KWmkCeUefl5JuZjFM6Orz/KkGitsJYuSNFfHXHA?=
 =?us-ascii?Q?yRuhrulyUuWf3gINQDpcSFY1v2VQgUYhtgd7thDm1cs7qAJWQGZxVl1bd8Ts?=
 =?us-ascii?Q?Hx2A1pksnpg+K91cbz8Ep1KEiyuL1mp3FBGCnhyQjY+khJ20om+l0GVVBshm?=
 =?us-ascii?Q?o1+aeTtUH9+SzOd3mKvvdix/3wrmTDjgb5L7PWpOOBsQcJcVmt8h7Qh3PnUo?=
 =?us-ascii?Q?VT6p/tUfsP49Ob3/9c5DDpg30wP+8gD13jDxbMAWGKkKCqEq8wW8GbVS7HB/?=
 =?us-ascii?Q?Be7BN67SxIGP9bwOAzYUruerSBJTV+kaNthEUKh9sPEIvlmVxmfLegZdixqs?=
 =?us-ascii?Q?hpV9zN1OGR/qY2ytsOlXZ8Qnj/YU2g8qQmadD58h?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5330cb1c-5ab8-4925-d4a5-08dc39bbc939
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 06:49:48.0610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tbaSIyUWg0P1DIui9A+QrKlV3yIJvJ4KNyB9EroQLhRE3fPC2LVdzLtKTGTw+df/R4hQuEjeZ0w4FXUmOq4DUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7793
X-Proofpoint-ORIG-GUID: TiR0HGHURLFUvmBuqOdjlAWe5WfSvme_
X-Proofpoint-GUID: TiR0HGHURLFUvmBuqOdjlAWe5WfSvme_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_03,2024-02-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403010055
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 06:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109070

Release Notes:
https://www.kernel.org/pub/linux/utils/cryptsetup/v2.7/v2.7.0-ReleaseNotes

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../cryptsetup/{cryptsetup_2.6.1.bb => cryptsetup_2.7.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.6.1.bb => cryptsetup_2.7.0.bb} (98%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.6.1.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.0.bb
similarity index 98%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.6.1.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.0.bb
index 293522140..c5e84b1f0 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.6.1.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.0.bb
@@ -20,7 +20,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "410ded65a1072ab9c8e41added37b9729c087fef4d2db02bb4ef529ad6da4693"
+SRC_URI[sha256sum] = "94003a00cd5a81944f45e8dc529e0cfd2a6ff629bd2cd21cf5e574e465daf795"
 
 inherit autotools gettext pkgconfig
 
-- 
2.25.1


