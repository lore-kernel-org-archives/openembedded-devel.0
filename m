Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E03C44536
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 09:20:48 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.118])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33650.1769073640293700484
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 01:20:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=enxq7sks;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.162.118, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhnO+sPINC802m9QFQMRWoB/Sp36h02v9ly1bIZ7EJovc2cLXQl6w5ga/TM8BJ1Ez7HXBgZG33jgH+NETcsbG1hdr+MVQBreQhv/ftowoU49Ng2kGiOXVQbRfJM5wjQsbrV2fuc+yOgfTki38vzB1g/ZOVYeM1TCwuQXquysGZuhBiMh6UOYhcVQm37cxoh4jCrYFOAe7ZM6HeDt0/UcBuHKhVUtK1S41LQNDcCsJoa2al+K0/Y70FaQ7OUuCvVjFwxKRFlZW1r7aYDRYRCPBqZsM+LwPmDJU69U7vQhfq7NG7LDW1aE3qxbibTg7/Go9Q1JvWIJxUpOsivLJa3ZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQzYxfhmiEYy488Tm1b6nGtrjfiZmzb0SYwvw+YcfbY=;
 b=BMKVM3I6mPX5p0Fh6oVmrt/pShlLlZ1CQN+mgEIXHEG2Tv637s+j8dViMbvkovVbyZ1mwKoUQ2u2NVJs7L7sZ+t1UkgnecVMquToZORPv2V8iGba5DOW2ojguoAb8rM/wblLhITG5FLU20y8KCp54KkABmcp9VNU6S6PKALQNhJ150pnLYUxG5Pug0GbrKWSlmpV5QSu7/DQQBagQF75qwF2sKIfNB6FlpnUZDc7wssPvNBwUvgjH+krGx/JH2uQTXCSDchmfL2pwMiYGmEGkHz3sqpL76C/E7oLs2zhweRJrnyGcpJEpVJiNR9RA0Z78RP9CEElU8QB528Xdcup2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQzYxfhmiEYy488Tm1b6nGtrjfiZmzb0SYwvw+YcfbY=;
 b=enxq7sks669RrT018bWTIPkTbC4jf8E4JRjZTn7zjrpsnsoudhKqJAQC271knxQID98KkbBbjOSRmq0PdvfvsPAqcZUsez88qwW7XSbvlw0FS5e/qf93IdhZso5f7xo//BDgUiZCqXsQ91VaGpPotJqHJvk413LCkjqVve83Da1tLsYTQZ/m3vNUzYATHS4SApZ3TfqA/giFnjyuMpc1CkD+6bJHMa0U6/2m66GVOtaJimYO6QewPxq4cU62UCdZ1/3eLtlgjV3T0IM9a+TmkTtZiePh5zEmS5k4Nlv8WwGj6AJU+uU9cKANZoBjQv/m+0AcVjMPajSYzfbOohpn0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM7PR06MB6708.eurprd06.prod.outlook.com (2603:10a6:20b:1a0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 09:20:36 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 09:20:36 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: tero.kinnunen@vaisala.com,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCH] python3-watchdog: Remove obsolete dependencies
Date: Thu, 22 Jan 2026 09:20:10 +0000
Message-ID: <20260122092010.1550223-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0064.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::16) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM7PR06MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 64b7dd28-a59f-4420-1737-08de599780c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oiZ1XgXGKUel+GuJ04oFHx25ZF7zClKll5/cNBbkBkiV204rktPFG1oz0QBC?=
 =?us-ascii?Q?1Av0PRWj0HpRkStKrqPaMl7xJ3wupiN+zv5PLbZY/DGm8/l0yQIYgEQDtEmk?=
 =?us-ascii?Q?JY6s9vbAN9qfYxXAIa7Sf33F2oWMrA47BBvwjGma29eHGU7UqOkjuGJhdEM2?=
 =?us-ascii?Q?8gSDM96xt4T6Nmw8n5L/fsS7annTwJfH0g04I2v3kM+2JUBg3dQiJfnC332o?=
 =?us-ascii?Q?74s7hzQve4ZDfpXRE6hXeJQ44X8B5mLi/xiONeZJuJeuzwK32WfxhH0fqCzR?=
 =?us-ascii?Q?Q5oxkZzvb+JRp7HaUaRNpEB7g2pgmaz+a3s9qkJeCA4PyJd5QFQ8ZMb35t5G?=
 =?us-ascii?Q?ugntghe4TkyO2S4M0lFdOvZ55Tm3jVabXujSqZ1prEtSP6vuuJG6Qa+md1Z3?=
 =?us-ascii?Q?qk4/C619Tz0Gs7oVUNvC4ZbJB5IeUUxByFII/Z3anK6bwKwYWujG5F3fzRjU?=
 =?us-ascii?Q?v58xrPcVEHvdKxYFqlnkM1c2vZP2Wy01gpUXHlhElD7f3wQk1fichsg2U9tW?=
 =?us-ascii?Q?GScaJflvitfOCYbqorKAMh+2XVbqiGEIW5ZCro14WF/mqlX7+oy7pMO6eEBt?=
 =?us-ascii?Q?bL6ebZBhJB/tXKFwrHN4m1qxQzcCHdBsCoBHy9OgsvoQwzE0xUf6hM7V6QfY?=
 =?us-ascii?Q?lnCTmI2qSq2RglEQ6uaFbePA7uDZiXd+2oddaZ+lCzEAHZsxXaXmKawZnaPx?=
 =?us-ascii?Q?1A4O83iGNSJ0rzG8p7FFDYAB+vMo7jGWaiorqtD3j8wxY8ReN+s6hOFmQqcx?=
 =?us-ascii?Q?rRqEfO5G9IMnVSh8mCNEiQTaS48aC55SeOnlNwNoptKBRgMrJd0fc4oGy1pc?=
 =?us-ascii?Q?t6ZhEQSIWwE0snNo55Z1wH99+WjV6m569gX/ub1xwm8Gz8/WixIMxVi73XoS?=
 =?us-ascii?Q?f/hzCvpX8SIJBSRC9TPBxVszYd5TnOZhk06T1f074EksAZrsolNjzsqqvqQQ?=
 =?us-ascii?Q?hjtt4cUmuW/Zb0hA7dccG8lZQ52R+lFegNNBX2O5jQtYVL67YqSplRxQV5e0?=
 =?us-ascii?Q?LXgV5ALhZfxhsOfbCkQdgoF3hNFXR2bx/8YaDxSGrks/A654edFNoVvJG+8x?=
 =?us-ascii?Q?lK4YzV66DgD1V6uDT95q9ogY14trgDnJHa1drSMp7h1qQ7D9IDEMhTt6UtOO?=
 =?us-ascii?Q?rO7SIZ6yrtHeXCw54/XWElt8ce4igJi3D+KUTPtrKfxTH36Sh8gvuUVkFG9w?=
 =?us-ascii?Q?rz85IRhIMAzt5Gh3XrrOLjZqEFw0l1VoaPWTC9S6Yj1TkRITppHkpeofSKD+?=
 =?us-ascii?Q?1p+K/b/Tpocl4mU3lPnvSl09Ifo7SRgmAoKrKDg7GIsSzMXFsUTTFuEmUYfe?=
 =?us-ascii?Q?r4haH0NXbdSITFAoDxB38f8DXe8qCx+MGpENT8uu1zKPrIcMo2R8sUpdkIi8?=
 =?us-ascii?Q?i4/QXbgAXw5/jMSS/B2p7mS3+2X1EpKHTvi6ChH8iHwgy+qKPrG7ajuT42G0?=
 =?us-ascii?Q?j651h0rdVGLXACajbYdJza6S8EJVMyL9TMr0zh9nyCWUQsQtz/LabT58gZ99?=
 =?us-ascii?Q?duHjl1WMAAO/aYcmtWiBP/SNnyk65bR+jf6a7/4qmPiyXd3bXl4JRukrZWKa?=
 =?us-ascii?Q?fn+Ih77dxitTtdo5sN5GCdkkwojGogYych2e0YjlZroL3kvuGeRHUWWuUbLY?=
 =?us-ascii?Q?Pj7sBZfb7cG0ga8rmjKUdyc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6GfDS7eUU+W/GyPow+mD6+l81oHqfh76maouS7wWRmeBjdHjpDV6xJGPAd7w?=
 =?us-ascii?Q?niInl0OhqWaipBT0JGRtlcy2v61CzlAU21bjE3xZtCk8BHB3/hvrfmZCOOl4?=
 =?us-ascii?Q?vrlXadVoN2I0tiZiUyt6puf0xsMdBPH16TfsnvWMxw42ZY04GLALJSeuxHqd?=
 =?us-ascii?Q?evGNcDMJTpPAh5TGgN7M/63YwYJ6WpSVCc+jKWoyUomEzByfrmHAUNovSNyy?=
 =?us-ascii?Q?7Ud9PDlWZJjA5jMnvjykIDn16cuV7ls7yFlFpzcb0s+3xhw+12jZXBG6Xpy+?=
 =?us-ascii?Q?bRB+23OmAUBXxq0oiqi2ba00mAEmSF3S52A2LSVjpncRStdB013LJFw2wGS5?=
 =?us-ascii?Q?gn8mOgDE8d3pjaMuP7JouxAYUNY/QTZHeIFAFSHUgx2pdKNjEsCdhJPnR5yg?=
 =?us-ascii?Q?wOkjjb7lvGboQEKVx3d7pGAoyMWN72yrAM/+MYyJ1yyhQNgvo0lnQre4oUEH?=
 =?us-ascii?Q?E9EAm2NGmPC3LLSEVSGRPt9DSLOFZvsqOnElWnqCnupIhF+Fdl15YXkgR39T?=
 =?us-ascii?Q?tI+gbPgvx+Ae/ma5oJlWnpkaQPhDLKur6w0wcQUmlw8c9g8a8h0Phkwa6Bq4?=
 =?us-ascii?Q?xmdbCRUN3znzuQrlddufebOaQ6Ezh2H3KIQF2Dfq1FMFJokFuSWpSiIMbD5X?=
 =?us-ascii?Q?zPPrkZiODOUixN5E2A1sm8SyxGhiSL82o9DwYtidoEYUCJ0wtCZ9mbaM9nIF?=
 =?us-ascii?Q?0TIY6Xip60PQCusk24spkleH1LBJMN7M95TBe5kaZlVYOq/KaTclXam0m0kF?=
 =?us-ascii?Q?YkH2Qa51cLMfW4viz1zqiyj8w7hWVLKsDOT6je77dK9WtacxKI2o6uYrTIop?=
 =?us-ascii?Q?sIhkdTHXggoZaDs4TWlDPYzUfq+zuipMESbl5z2W74wWCgfQ2cVWkxuyJCjW?=
 =?us-ascii?Q?aei/PXlEJ/4sewra6OVEtCCh8FAnDsWFWN30lZ1a799Bk4DPZQLJSafXZd0L?=
 =?us-ascii?Q?TpomxGOfDlr3dZ0LvWXvPkjU8cSJwQmQPIn2/M2tiVrsWe8627w3fyRWbGEn?=
 =?us-ascii?Q?0WweBWJUndCTK/Hsw67vtTZwAvOIPMhe5mGWfwWkAX7Il4/1u4/6xSNUadYJ?=
 =?us-ascii?Q?J6OuTdIuFs7Y3UUiaL9KKiwDdzvMMdkxvHzyNsB9DpUiaVxkokybgAlzXhgl?=
 =?us-ascii?Q?HZBi7KiA1CeG7TdrMmfVd3o1ixGaFtbze+oVPe+xRunk77XAHZzsV1MtAoaQ?=
 =?us-ascii?Q?kgNczfmBWJFJ4HjcmrJ2D0ogomNnnpFmMV/KwKuezbBssH3oP4iSEClszEMH?=
 =?us-ascii?Q?N8EN2YA9B1QGIjDeA+iImNDitkcoa927S0hpeaRVmajDbXeK/pWQnuBveon8?=
 =?us-ascii?Q?8Ayysr4wThMypQpm2cjvORVcYxIGm7PdVVUXrV17ytX2AStt6vyEBaSPcgKe?=
 =?us-ascii?Q?zwbbSQEw1laFbGO4qWGhSrE9oeCxuN+aGKSVC8L5AasEyUk3bFwYm2M7L8Hf?=
 =?us-ascii?Q?g3Zpqf8sBZyYnnciR3abrnolOO1E9LeNj4nGC/cNLDXeahRj92SY6cvzhp22?=
 =?us-ascii?Q?mIMSSOnG/JfnLvYJ9ijvJ1z9+SFVMgBeXJT5ONA/XkF7vcmPSfWYJvOjtP1F?=
 =?us-ascii?Q?Zb4r2W36zhy0vwj/8V1mZEySdlLfFi9M4+Hc23iTtN4qKDm3XMs1Um2VuvC7?=
 =?us-ascii?Q?2q7w98wxs+oR2vrYQqT/W9AlRmYGSWeeZcGl2O1R5pdqy6O9GMpo0IvHEaue?=
 =?us-ascii?Q?3eR+AKV7EnFquULb70Xgi9krF4FArXTm62Q6ccjASdItFKXlbFjWGGNXo3Ns?=
 =?us-ascii?Q?Y1SrnDKajCtxb5pIiqLcva+6Y0rENW8=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b7dd28-a59f-4420-1737-08de599780c3
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 09:20:36.9406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BajICgtLJG7wNxnMC0w3hzsISTEwEHdQxHB63OcWK4VRxi5eJeJfQdT0ot+5EPnE1dqNtxDajAppeN4tMmPAcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR06MB6708
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 09:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123733

From: Tero Kinnunen <tero.kinnunen@vaisala.com>

Python watchdog has removed all dependencies except optional `pyyaml`
dependency for `watchmedo` utility, like follows [1]:

* pathtools dependency was removed in 1.0.0
* python-argh dependency removed in 2.1.6
* requests was never a dependency
* pyyaml only needed for extras (`watchmedo`) and may not be strictly neces=
sary

[1] https://github.com/gorakhargosh/watchdog/blob/master/changelog.rst

Signed-off-by: Tero Kinnunen <tero.kinnunen@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-watchdog_4.0.0.bb    | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_4.0.0.bb =
b/meta-python/recipes-devtools/python/python3-watchdog_4.0.0.bb
index 9e36264d62..a272e25bda 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_4.0.0.bb
@@ -1,5 +1,4 @@
 SUMMARY =3D "Filesystem events monitoring"
-DEPENDS =3D "python3-argh"
=20
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd5=
7"
@@ -8,11 +7,7 @@ SRC_URI[sha256sum] =3D "e3e7065cbdabe6183ab82199d7a4f6b3ba=
0a438c5a512a68559846ccb7
=20
 inherit pypi setuptools3
=20
-RDEPENDS:${PN} =3D " \
-    python3-argh \
-    python3-pathtools3 \
-    python3-pyyaml \
-    python3-requests \
-"
+PACKAGECONFIG ??=3D "watchmedo"
+PACKAGECONFIG[watchmedo] =3D ",,,python3-pyyaml"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.47.3


