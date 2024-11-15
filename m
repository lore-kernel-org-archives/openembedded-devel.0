Return-Path: <benjamin.bouvier@ekinops.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14CCFD6DDE0
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 07:22:31 +0000 (UTC)
Received: from PAUP264CU001.outbound.protection.outlook.com (PAUP264CU001.outbound.protection.outlook.com [40.107.160.133])
 by mx.groups.io with SMTP id smtpd.web10.15164.1731655346448737526
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 23:22:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ekinops.com header.s=selector2 header.b=OF87zdec;
 spf=pass (domain: ekinops.com, ip: 40.107.160.133, mailfrom: benjamin.bouvier@ekinops.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxpXeGMR/8H7IT0UAVfZ2vgu0Eads8BNj5B4jUoqtMUd/csftSdzBj7Qj/uSgAedALIgsQvH8t8mHbeWNLZJr7hqi6abzL8EDJOSIDVNQWLyabul/AEoPREhriRc0+/wk/SlW39YxP9nwRdvj4ZZ92nmbRxqRkDHNhJWwfSLv6WbDnZyFTrIUkjfMom56n9UE2X/55ZsoAMr3rZPBjAJewd4k2hxcJnhhlDhi2hh4HbYTPSUjUJcHMQyamBWQu7z4OfSIjVIEYfkkiqNFber9rs5LgpnXQh405G+WdnFBq6UzkcxNxDvvRV2Iyu2OoAQQ9EciLubAUYKzJVEBcxQ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wbrAk2cUNrPV2hFoWjGHGjhja2i26YowXnbzErSxvo=;
 b=gurcN/JDGF/bxxSuEPckZKhOJR44KVzxavsOZgkb87kFsMxnsBbrvN3lPz8RLxoazjJjurso5+Zab1KIIva/4VgSxf5uGKVyagDTRJ77MQvRAxo0swOgzA34aK9qa5jRLveVN++cNQyohpwm1B8Pf6fMnaJstmF7aP0718iL5qD3bH5Vxq0b/YrlSGgQjZU1kls8LxRAGzILUIZjlV7BJw4gmYDxT8djp3+bYbVx7aw9SOfd4HWCa48GavWecTPrNG3iQ7WIqdq9XlFWC2h75fxCtWMfWnESlBUTjv973n7brHf716zdE0GabM/LwQ0JikM6TgO3EFpZ+Y5GwG59Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ekinops.com; dmarc=pass action=none header.from=ekinops.com;
 dkim=pass header.d=ekinops.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ekinops.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wbrAk2cUNrPV2hFoWjGHGjhja2i26YowXnbzErSxvo=;
 b=OF87zdecR92UoC2WLTVNK3hqy8Tn8s7WqA3m7NGy1VtqvCaxMfx6vGAox29cyxtiGj4c5Xce+Ic2sHIUIZzisbXrh96GAsvAdjGw7D+qWR1sfE/B/oF6dbih2IjkPp+Jn2vR+DXwoHVPjK076s3LireQoAVM0VgasDQ9/Ao3BsA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ekinops.com;
Received: from PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11c::11)
 by PR0P264MB3340.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:144::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 07:22:23 +0000
Received: from PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cea:c378:fb53:82cc]) by PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cea:c378:fb53:82cc%5]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 07:22:23 +0000
From: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
To: openembedded-devel@lists.openembedded.org
CC: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
Subject: [meta-oe][PATCH 3/4] librelp: add CVE_PRODUCT
Date: Fri, 15 Nov 2024 08:21:49 +0100
Message-ID: <20241115072150.102677-4-benjamin.bouvier@ekinops.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241115072150.102677-1-benjamin.bouvier@ekinops.com>
References: <20241115072150.102677-1-benjamin.bouvier@ekinops.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0420.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39b::28) To PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAYP264MB4350:EE_|PR0P264MB3340:EE_
X-MS-Office365-Filtering-Correlation-Id: 640634a0-9d4f-4f76-39de-08dd05464001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ec3OOQPd2X9Q8YHKuBY3f9b2/z/SlGA8zXFZvEiZzTqYwU8YAmMGMB9ibRvy?=
 =?us-ascii?Q?EBUZ4yBFAdlaIwrv5cVC74C0WgABrQIR8bbEduz8ZmYcyHuL//O241wRiaN1?=
 =?us-ascii?Q?Hu+WFULicc1/V8QfnAnfA4/Nea+rtl0v4CA8z3+isjJQ2hhxynVxP5qIrdpZ?=
 =?us-ascii?Q?HQdb/jnqygk3R58HQIuq4tIOHEXa2KavCgRE8S9xm4qL40bLw/RwPv8KZ43t?=
 =?us-ascii?Q?/8sC4Ms00C62CSz525irTrzjuH8BYqAs0pyADiDCMkOWjvHImZeGxFIpuqIH?=
 =?us-ascii?Q?8fmYaLFsCaeceYLGZhP1UN32+luBGreC4YMX6xxEhIij3zdvczC707VytQK+?=
 =?us-ascii?Q?iJcSieJIckaDO1Dd50y9bAUm4qBHY2EfisGtdT2xKPzc9bwtnn8rk7R5W5zM?=
 =?us-ascii?Q?lF5lT5wLEjbdPMA+VJgurtGT3wtGs1b9L6+qR8l/XMEIumgNQSlkkn1GSoQN?=
 =?us-ascii?Q?qoU3ssNygeRGLCi857C3/y3wV3GXD8+S/d1IO/YX5u9YgEglb8jBFEcb44eZ?=
 =?us-ascii?Q?wT1dYbKDwRAHF1xxUN1n0qcCJ3lIDO9y9eA05ipGddLG3Vfmas7QmdQGmMvf?=
 =?us-ascii?Q?7TVdrk7UOAa9qfSP1SVOkBjdjZ0ybqaXkRX9fYPPj5pi+fduP6uxKbDnYrC8?=
 =?us-ascii?Q?EaaraN6HJ+7Z+jVCIpJ4hWwLKyVK0Q059GJyeH0V1REOj61jOalxc7IeBjqF?=
 =?us-ascii?Q?Fx1nYD82DlZZrCFDMoEufyR2kYezoDoesZXVCw8LvjZPvitstK9YwY3QWEex?=
 =?us-ascii?Q?5ha0uCiwZkSXEIPdTqTXaA1V3XUpVROuf9IiwMSsrUTSlI7AXJ+S4bnnanNG?=
 =?us-ascii?Q?yAnE34Zp3QHRcltGherqkedth26h6tCUuopcFSAkui19SWY9BsjX5zzw0IXN?=
 =?us-ascii?Q?UklQXtuKW2ztgH0S4bM3+LlaHHMjCmFN0COf6PD2DGLtcXMNdBiQkQ0d2rhX?=
 =?us-ascii?Q?SVSgeaqqxInl0XtHGpVnMQ2baD64m0XwUCcCzRFGfsDmJZRGjEQaHjjShoZT?=
 =?us-ascii?Q?C8BOKNWsHxy7itS+yoUPy4aNt3q9WmCSC78KSfEEQvlOZrUYcZo0qM+HC7G1?=
 =?us-ascii?Q?i8k+kZ1aFNuFm3/nDeywwtI41m6lHXm7tpr7hi/xfHx3gdV828m0KBfPfZdN?=
 =?us-ascii?Q?m2saXLGu25Z7A1aPq8hdYIlSybM6Z5MLbz3eJ9USeut13jG8Ku5dSjdW2C4u?=
 =?us-ascii?Q?0SXrupr5Il1jpbdVTzDnClKLBrwiUaUl+DT6aYxBC+6rzJHLWLCaujxjeg2k?=
 =?us-ascii?Q?Ij1iUI2Vaj8cr3RKsjNVl7THvDtDzTEjDJpmE6QvByyLR1CP30xo2RfASb5Y?=
 =?us-ascii?Q?n4HTnEASFc9w7GEL1oHr65VgoYg/ww704SsrNoOA9d2D6pKXlycQdhNHAZIg?=
 =?us-ascii?Q?XBIBADE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OTtGIVzE1i3gh3iLfdV18JpC/4ceyg1Q8EriY6MS6Q1L/bWIoDVuX/d/ZcFK?=
 =?us-ascii?Q?gvRqqC1P8IETX/wEL2XGLLm7j1p0OfhnRFjYtck/4Ob76j9xmCpM7AwvtAFh?=
 =?us-ascii?Q?LUoJqOgnfD51Q/QZbQ0sLXYnuKKREiQ4A3YmCrvDQgjFgIQl/ze+YgVpKeHK?=
 =?us-ascii?Q?XiIqHXDmZCXATwkhva1X99X7cEUx6FYVjlQvHERfHrlXs6sgPXpGMBcfqXLh?=
 =?us-ascii?Q?S1SD/jxWUVVjo+tqy0/u0dy7CZbJfNQVk8bDxOyJl1+3GyBTYsJ1JiOuOiP4?=
 =?us-ascii?Q?nCpg1Rfs8DhO12lZJDs8wKP1hv+w2WyNRMeLKACtRI3iR64hNrAXpIJO+Rcd?=
 =?us-ascii?Q?axemGib5euQBoySJOcW6ld8kmOdebLBe8/pDMqgujFXschWhgiQdWZJsn8sM?=
 =?us-ascii?Q?NYGpTNZE8Lkb+MON3k3z6tNoxx37hOA0yq+z4hzMzc4iNJypUSPmTS95OLBE?=
 =?us-ascii?Q?3UfGjXX2EAacY3JyP5KxrJ+Kkm4Q2mETJqnVKvsPIxLccrYnaDrC5sO/fDKZ?=
 =?us-ascii?Q?iSY6oZlGiaQW8jfF4hklfizP5qMM3Eq5gmaKaPEzs7U+wTK3x+RIwENE4Rmi?=
 =?us-ascii?Q?FnKW4BcQ1J7faC9L89xHE2AvDai7TGEaZcQCVDIpwwDdFQBJt2tU7KGvsI8i?=
 =?us-ascii?Q?0SLOCnx92Wfjm1/QectxPkELH6Nkxn/4dKXoKeRigB7zbv0mlfkllPXP+717?=
 =?us-ascii?Q?OSRxpkFGMbuleqA/qgH+As6z+EmHoTWrYGccraFrdTbh805cxiDyEJl476IX?=
 =?us-ascii?Q?ImgQ2U00UeFPmh1Rl3ptit/P0Juz/o+loqleECqyoNXZ0N5WBZwh/nv4I1c5?=
 =?us-ascii?Q?HJTg+Bl0aFEtF2nv8A5lLZnmSVThjYTc9KGQP220cqXW5hcKBjeWMu/1jBH0?=
 =?us-ascii?Q?Ba33RbQCmeoeo/+/aiqqiMjvCp7r8N4harYDFoSfWQ1cE2N4ahOgHzsCX4rR?=
 =?us-ascii?Q?EouSOyld1tasIQxVHsHz27oaQnrGg8q41/yZIlRXLFHNmKCvZLPC1dfV6EqX?=
 =?us-ascii?Q?YlgPu7jTP1n+i4zNGMmpEBIZjDBYvioSUwnivZ/S3BBvjIOJQ55CeuVaEC3v?=
 =?us-ascii?Q?QJx37OXndorNWyS0amq/cwlXsBEa/7x3m23IVjcysG03suhWnZFkHosul+c2?=
 =?us-ascii?Q?zD25GinQiZHjsoyvKfFG0HVWDuyF1Ifw9Rsy8Zow0V4ADQYoi+KOv8GJHgDp?=
 =?us-ascii?Q?oS7CdNsC/D4EswF7UV1ev8teWqkuERBBJK89C2r3rXwK/pf0QPA9QYP+xfSE?=
 =?us-ascii?Q?WaRD7opgIvZtV0xnAAR3Tjx3zFa72xNjIrYt9+OWvnG1XOFGwaZ1ddlJ9uG3?=
 =?us-ascii?Q?bhU6wKbyThsRxNsMqzxj0k3rcT2lGg0R/VBve4HnNw163jCVKlg9n0kUZilK?=
 =?us-ascii?Q?EmCB/8FGM+Tse+szHsO80VZX3xLrpFXazUgWSDGzp9v1Y07ezrqY6rXHRxjS?=
 =?us-ascii?Q?wTeZK4H5bXlg+U7gdqrmd18t5X9ZklVUBYTyP8yjiOuckEJsSRpnT4PByUse?=
 =?us-ascii?Q?MenfCimQvMQl/+ktZRSaDONsXXxKAeXSDI4ORdmfRpmiozQJc0uqDRfjRRX8?=
 =?us-ascii?Q?e/R1Dmsf9MHqJ6yONZccPUBE/wqPmueZYBf0lFd+5YqHPTSnxqOoqJw2W3ih?=
 =?us-ascii?Q?7w=3D=3D?=
X-OriginatorOrg: ekinops.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 640634a0-9d4f-4f76-39de-08dd05464001
X-MS-Exchange-CrossTenant-AuthSource: PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 07:22:23.7747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f57b78a6-c654-4771-a72f-837275f46179
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kwRjiOKixtfOMuDty+nwjoe55s4D5VB7eHlIjLUkWsXIRubNfW74ilNB6Qac+DLiuxuhYakfGHqlDkg9XkF45Vj1NWsr7Mxvp9PByIHUpKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3340
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Nov 2024 07:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113849

Add exact CPE name in CVE_PRODUCT.

Signed-off-by: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
---
 meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe/r=
ecipes-extended/rsyslog/librelp_1.11.0.bb
index 49847047a..0277dc9cd 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
@@ -19,6 +19,8 @@ SRCREV =3D "b421f56d9ee31a966058d23bd23c966221c91396"
=20
 S =3D "${WORKDIR}/git"
=20
+CVE_PRODUCT =3D "rsyslog:librelp"
+
 inherit autotools pkgconfig ptest
=20
 PACKAGECONFIG ?=3D "tls-openssl valgrind"
--=20
2.34.1


