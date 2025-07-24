Return-Path: <Bo.Sun.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 158EAC83F1A
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 07:55:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7203.1753343719511296769
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Jul 2025 00:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9300fbe988=bo.sun.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56O7nfPM660557
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jul 2025 00:55:18 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2088.outbound.protection.outlook.com [40.107.101.88])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4838wx0b5c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jul 2025 00:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=awg9bdwMEAo3F94fOh/AMcbar8WnbaP+KOTVJcPlJrTPNSAx2wIGA/yZCVV3vJ+EIR+aP+HlG9edjcbIgm56BJjKu/rf01Imq4zVsARz18NuPbeL6tNUJ0s6OIjftibtI8LJaKuFXZR6nOBRTEq7Qlot569Yr/UR/ObEK8lnMRcVjNVcLkedfb1AfasUZ9tyKft5DiRj/mw2eiBqwM7wOTF0TpRlQzDERHvgCbjzCPF2GLKqTlVPGFBXp8UC3vIZlJVXfiQ/Io1TuN+TkhAT7dQTlFz1Tb1FVYzXSZlOyoIinsyuos7s/0vM2V+EaiQhp1kKrU2n2QAwBDGrPBUDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5BtGownMlFY8QxDht4QqB6IvKQ1EVwuJQ80bXXG3us=;
 b=QpeYIorAoiDAcZTRzo1eWAdNuMfatNLgoPaW1HjgA89LIoDlNOojfumx+J5H4tQ9TiN7WAR9/UgPSFWLq50+qex6K9cpkI/k+kf5xlu9fg2txHzfCKIqh9R7nr0IGpj5SCX3xyqdzD2o3GvtYGWBK4rZrQ7GG0nzlD0BSVHoEnxLSplgGGiHShjeJu1/5jkz6QnDYK6Xn42/IG82sNNTTtp3v/3njKwF8U+ny4j/tekcytytptbe3rJwTdIHsXLqVWwp2GXl3Tseqm6NGqi7xNEDGytLeJhL8Lzbt2KfTcbOKMJIkEDXlap0MEhLrETyKZauIaUSuD/e7lxqxFHxtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB6214.namprd11.prod.outlook.com (2603:10b6:8:ac::7) by
 CY8PR11MB7362.namprd11.prod.outlook.com (2603:10b6:930:85::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.22; Thu, 24 Jul 2025 07:55:15 +0000
Received: from DM4PR11MB6214.namprd11.prod.outlook.com
 ([fe80::31e7:4eb1:db78:8446]) by DM4PR11MB6214.namprd11.prod.outlook.com
 ([fe80::31e7:4eb1:db78:8446%6]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 07:55:15 +0000
From: Bo Sun <bo.sun.cn@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH] thin-provisioning-tools: fix bindgen build error with clang on octeontx2
Date: Thu, 24 Jul 2025 15:55:00 +0800
Message-ID: <20250724075500.2915548-1-bo.sun.cn@windriver.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0122.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::9) To DM4PR11MB6214.namprd11.prod.outlook.com
 (2603:10b6:8:ac::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6214:EE_|CY8PR11MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aeb0b47-2853-4596-d2cf-08ddca876cc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ESOTrxOGgBdSoI6zlgoxu1Ap39xobYDeWSl01hEvC+5SDfv10uRXy4Vfoh0L?=
 =?us-ascii?Q?5ivJn6zdhDlcblhAAutlstsgT8XJuNyWUO2S2UNQmnczTR5tJFJia9tiu/q9?=
 =?us-ascii?Q?EsLiiwhM8amQiuM6+H811eNp91dSGFNFK9IQUVcqxd8B8R/crpnufWDSIyXC?=
 =?us-ascii?Q?MEp3jSWHTGpWNKa4v2ny99l1xCkj5LVW2ELoSad8RmCgN1u+H3q3saTpVMr8?=
 =?us-ascii?Q?nSqRGGn6LgFPh6WiNTVLA6IJ791TQY56Sc3BGeX0VlhYS1T852HgmwXjQn0B?=
 =?us-ascii?Q?6hW9dCqWJs5+skgqW6bc4871v7LurGo9/XUwhXWTk30We+nlqjyxMO0KKf6J?=
 =?us-ascii?Q?4vSr319pXDZfuBGlaHBfpoYOzLHbU8U6KZFk2qInUULlLa60Hq+MwmdoCZv5?=
 =?us-ascii?Q?pEfNqtMG4Wb/TbV47BL5/tRBxp3vNdkdmHlpoJsGmDvIE52DyBeckLyEB/gf?=
 =?us-ascii?Q?8N+Eks1uqT3kiAn3ZhH2I4V/DVOSt+XUyAPgd3cPT2Ju+c7SCjW6FE20oM0R?=
 =?us-ascii?Q?L+/qjvDd56ek2lSmTrSzx4iD8HibXMUbji1ZS0n6YA0QEsORdu2h6LrTgU/f?=
 =?us-ascii?Q?GVK6GGk7o6Zmb+kAfvpcN9Kc0PERYlQrAse63hBKrUZ1TR6bxIrEJs+NhhR3?=
 =?us-ascii?Q?GUttNQxBCZSG7jPOdMKEwxB4OEUzhf2c/S7AGWmGE2KN8YvFGaFr9AtDrWWg?=
 =?us-ascii?Q?+LKqwAuaiz2BLIsACLv7JiZPAA7zsuyGaHIMfVUFgAD7g6s1P2+lZxux7n8I?=
 =?us-ascii?Q?uUQIKsVaKNB6waEsz4eqlDcIf4U2s5WwEiO4j6pfMgLAONKmM+ahxSr8hDn9?=
 =?us-ascii?Q?yyo3gWbIVO7cejFZ5l4x7XFUfJStK0/NaCRQuAg+/rTFEKkfJucpzEcI9J2V?=
 =?us-ascii?Q?26owmYBm+6ZKGpZZjB3z/kY+Dy/Z7Tm+bIT+QoBpAo/F5CoYTSYW4aKBRmX3?=
 =?us-ascii?Q?eYcajgFHXXboImJHH/G+j0VOG1UibRscYfyeSWhI/jQns+BHlfn3yVH/9mSm?=
 =?us-ascii?Q?WToJ2y3EhWPVu4ledCaOzdUtxHXZ3Ks7pcc0uhSui3W+371f/v8ZqstpLyH/?=
 =?us-ascii?Q?fK0dn5zuDAxqEda0w2dlrERkdbHJaS7eVDQbfiN6Y3bF/5mgpcBZuKLeIVzU?=
 =?us-ascii?Q?Rjh2EHb4auTa1Yw2wZR5THempgrecl6XYJ6iofnqYLbgDB5yHy1nagMnCGqJ?=
 =?us-ascii?Q?uEMFeEZue1sPhy8P5lNi4BYdd1gGrEAUP+dVFJ/jHCI2KB40Y5pGfUhHt3+H?=
 =?us-ascii?Q?kINqRVXl/kPqPMImdKAZCIZm165U/vtgLbrGXBiuI2YnhtK7tZdBEKcwKwHC?=
 =?us-ascii?Q?Ot6GAVaq/BKQWaVjYBRWrnbSnw6pBBphiw29M9YFiKbAx6gUYzCFYYMDaujA?=
 =?us-ascii?Q?mYcRWQNsE/XVel5Lw5OJySA4yUllxFd06tCh4uPuj6WpPGLWif8QZkV0KrDt?=
 =?us-ascii?Q?cvfBVxhiY7zM3kEGmlieYb5HKg3onrLtN5bj+kO5jRlWf9F9ZWQFPQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gO3AnbTplDY/R5Fnw9YlSkMMqEBhGZUjnsa0Q8cGGXidl5l8tcvJFYRndoEe?=
 =?us-ascii?Q?TzjpAB2Y8HkAp6BbDDCv/H9wSYwHeSMF++FRUeGPY0TMhYPnfZ507PK2wATa?=
 =?us-ascii?Q?5guLfcfpAa3TUVkEPS5NvCU+ePifdSBAPlNizqMPKUZ5szmeeXQmCcjwtCVo?=
 =?us-ascii?Q?BEA8C2ejBLHRruWsCvyyXf53rGXXXQ7S5mEGGLnKkJXx2NBt7tRbWZKmH/Qz?=
 =?us-ascii?Q?NTdHeJ6FGYMrp1d4gyaPx2rgwBTN/km2e0X0/JHo88IJ3ksy7qVgoN8nR7Jt?=
 =?us-ascii?Q?t8dXQSESMC8H+dPO0Y1Q0YqH4QyTowPiCYtyj348H40kfl4sr075KKo4qCDe?=
 =?us-ascii?Q?YWqpWm3a+sLgHNvZGSlxqC1SZYiNt35uX0ABejVfdeQlo01Z8AiNcS6FvUMv?=
 =?us-ascii?Q?vnVCyMB6KJc8JrFvvHSZV717AK0gCCZN+vJW3kJFQZYJiK4tnyWCYCC8bV8g?=
 =?us-ascii?Q?e2j56AHS+22FN9Mc17N67KINuItuJNbyRd34XjoJ66p7DtsF8JHES97hSSLw?=
 =?us-ascii?Q?yJ711F/sTAMdtyy8XVjktZQAib/ueVMOUfNg79GOO8FXgFWj+93t9fbV1wSh?=
 =?us-ascii?Q?iRYRR4yW21ll6jjrxJ9iY4GHXtBux7BSrYoJyXBuzb0ddjT2dhVBbgOHSQuZ?=
 =?us-ascii?Q?fliREaq+V7EVmCZMTU4KWgah7wES3CK9hqkJgsPee+as6CDx3ZqprJxmYcZO?=
 =?us-ascii?Q?TO+G8FkMrb7IZRn1fRf2EZ5mKZCSjGOhKqk3zpMPFdRD6QVlVH1aMe/DNobX?=
 =?us-ascii?Q?Jk0LTM0swQLhuxWMzQix4g2Qhc+6vCvZx0qLGf16tnRrSC0teqLx7kfUcXRu?=
 =?us-ascii?Q?Ir3jZ9jnkaKtmJAvx9DtM781s++9zIdq4eXszdiqetl6PQ/vjhAF9aRBK0BL?=
 =?us-ascii?Q?FPUYE2DPqRlwGGofscY/omT5osZWuLuL/lW695wWXi8hXxm8un3FG0t3jD91?=
 =?us-ascii?Q?QJdrWiJdepR0/Mr/Zthih6Y/b9cxaFWhQf817bv1EQHSesFL3iU13aWSpIkP?=
 =?us-ascii?Q?esOOKqD+Uu28FG81eMprCmYSOT3CC4F+l4Wc1itsMjV0XIoHCfsDiGL2NBVX?=
 =?us-ascii?Q?HtR3SdUcQsiZZrkGHChaQ0Yt7N6N5j7lDiHNnhih49T7ggIjz3usQ/Yn5Sbv?=
 =?us-ascii?Q?B+MqMjlBFnyb3GNxYdVZLjT18e0TG40m/YelOjwc+Kqay2GeBFRxvrk7fj0L?=
 =?us-ascii?Q?9BoexBke+QrsA1qRXruG5aDOKxhzzxtBpwBQWe5dB4fNzJPwROoXhso4EPLE?=
 =?us-ascii?Q?rTtGeSfo7A0SxXiZeV5qBisNLmbP2KO9f0V9vsJo74z1AdngwOa7qqIko+9D?=
 =?us-ascii?Q?nqg4qtffUyKipWSh7OCfLJTPi3zt/x7Rgm3G8QWypzU8y5IaxmKwcWP/qVZX?=
 =?us-ascii?Q?OpuzoiiTZqPRXnE4Z8cOsq6HCadk1PZm8GscFX/5MM4MpdZsYXd34zxZ4dDO?=
 =?us-ascii?Q?y8mWs/xkc0CWrY43RayJ0H9tLpp6Fiep9BdfoPBBa8Ywix9L1Fz2ZzI92JAm?=
 =?us-ascii?Q?NY7w64PB8HSAwyXe6StOlSdoh2UahHLiKYhqZc844xrHQAoZoj7bLbwTNYIc?=
 =?us-ascii?Q?dHNz3wqM/s4hjqdafx75iy9/nr3PiRTcFxT+ns3zco5mzqU570HCjGQyiH7A?=
 =?us-ascii?Q?vg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aeb0b47-2853-4596-d2cf-08ddca876cc8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 07:55:15.3574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bTlPmfL8dPimvSWo58/qXS4VoMqs8vRNWAuCdVD+/7L99H7KkIk4KHBhGdTwJPWW6/KvVfS6aTS49wpP8tZlrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7362
X-Proofpoint-ORIG-GUID: oLoxp6tl4qCRMthqUqQgcNwsZHOvYbyz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA1NCBTYWx0ZWRfX3pB8LThVtFN7
 Rt1D3Hz4k+g7EFHWQ4VdG0DPfDbCi/UGRUUD8JVyNzOivzsjrHmEXxRHjmvEv5fj9rF0ib24NWn
 kL/eJZKezkbZjijha5VGbXTdu45YOcXW1NC8IsYaRFUgJmTo7n43NAItUdfjFOJiYrZq7iMZ6n2
 ie67otBq9ydYU9w5kP7ElMvfZlxez1EFnOs5G2T+7Qh9HziC+NkNKXW/6JS8VhtM1D/InLGZExI
 Re4ZJItWr0SwtkIS26yhUyfj2Lat4BLm6MlACb7pfE/jfOcnOZn9e+/8Vsu4nALDpvPcJbIb3xr
 7uuMjBfGV0GxnzWF9sePX8VYfTGsAhH/a3DQuCGLWxajxL9IjjJjXmbK1SBGQrFq+9PdMitiuQu
 U2DRBi/q
X-Authority-Analysis: v=2.4 cv=Gq5C+l1C c=1 sm=1 tr=0 ts=6881e6e6 cx=c_pps
 a=OyfTtbFOK66Ige3WC/58dQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=bNap1YoWMQwtF1uxaBcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: oLoxp6tl4qCRMthqUqQgcNwsZHOvYbyz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507230196
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Jul 2025 07:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118720

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


