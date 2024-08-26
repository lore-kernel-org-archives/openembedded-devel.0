Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F35C5321E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 09:41:20 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.99])
 by mx.groups.io with SMTP id smtpd.web10.49387.1724665272924471758
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 02:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=k+OKEPbb;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.99, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXcdg6frft4EfIHI+GfABou9xJo1JRhmq16AVo2223fwkBKDY51zuXgKkxdIQh6opSuhbivmbHeN2vtH5PFGa7I8tQUhftDyilsd6o76O0UFLTFBL3cGPHn8xopwOxVlyjhxN4gFmMqdAq4OLuuI4sNt6RH+MGifPXyiQ2kylPbQrat10eby0fh97oQiaMWQXJXGcloEJfCOhvG8mLNuCfZ+RfgcGbejguqfSlKfuV52/SP4aw82zwWuduhXD2EXs3dYFD1S2apaBcoL4JHdorK/gKiMfSnD7wM1q8o4dJjF5Df81a74QjPY3jhYgY3IlW2yiBfDkTfgyxltd/0BUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2hsYkiGAQgJomeouOih6iY/uZOjKovj4+MxDFtOIJ0=;
 b=xK0J0bQL49TeELUnfv24ta+SSSRJwRhYAmgzoSLKl4sxNNTvBFm5K5tYU9kijziD2fvinUonGs1VrX6VJMkz6ZbX/5ebOYwHUktqenxvY0DZj0pAdyxP76qafMtKzYaWUoZ1O/5/L9XeC2HXBDbEFgmp61cFIlPMWxheCLZGchxXPOcDhIQnXXdNLuGK3P4EP7Q6yCXh3g4f1auamtiuPoy2ifBGLPJ8TZj3aCjpuToQ9J/GBA8Sc7U0EKStziTtHNo+UlFKNu1gxZTbdtgUDMRDlvYLvuWotCqhVG/gHE5yf4b9spur+5Dld74uyvjtsdP/U1E3Dw+ilnefbCzbqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2hsYkiGAQgJomeouOih6iY/uZOjKovj4+MxDFtOIJ0=;
 b=k+OKEPbbgperGOqMfDVWAnas/7zv4dVDkdrEzmnyzmaZU78njgKx/pUIolAp87xuWx9KvV7EdnFu7tkYZbfBzFz3S0m9rmPC6R33oxGzb2Cj0nRPljQ5RgudPWoqcQuPR0hMrwxlhmPvRQeQzx6NV3nyGYFTwqWcknE1Em4l2mNLR3oCk0YC5bhK/UaoqlD29FGsgaFOUPxpFhHMlpV/+ZEo6MgiRm61aAC0mS43uBysV3riPfuP7Dd61Xc6u6m4WOsoUsWOuf78YuoTK9DzysxF8em5nzFq1Kq5IJV0GEzh0U6POrOgdli8Y0On0exOYINmA8j1u15aKXBq7hT5fQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VI0PR06MB9581.eurprd06.prod.outlook.com (2603:10a6:800:21c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Mon, 26 Aug
 2024 09:41:08 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 09:41:08 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 21/21] python3-xmodem: Fix LIC_FILES_CHKSUM
Date: Mon, 26 Aug 2024 09:40:21 +0000
Message-ID: <20240826094021.2744296-21-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240826094021.2744296-1-niko.mauno@vaisala.com>
References: <20240826094021.2744296-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00003668.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::384) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VI0PR06MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: cd38a94b-0199-4668-9755-08dcc5b3328f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Jjnf/oOWjmjtCUIrXEuch1StteAdPPK67m2AKt/WXSkIQaoW6rfHlfMLiJFC?=
 =?us-ascii?Q?Y/5E/IKPrJZlom51RukmMq+unVHrLqKznOIJxA7xnD2OobwwWw1F1+k7YXIX?=
 =?us-ascii?Q?0++CRspgluJKxwHiGfd96gC4TunxiPbsw3sViGiahXPhIE9QhaQJkNEUnZ5x?=
 =?us-ascii?Q?VxqLOHqISGAVGuR/Ow/x0uPygdWXaCJs8SzYij3rNyuXVHU1loVoSRjLlI6o?=
 =?us-ascii?Q?BBnM0YRtOzoheqXXfoxq8Lch4hPvf3mN9kDoRm6C9ZSdYG8rvRCytvQGlx73?=
 =?us-ascii?Q?UsI+LJimy9dPj1+5YyIYecUjYugAWtGz1uaYxdej+36MRY7uapSS9YxeYZhn?=
 =?us-ascii?Q?/mDcOVl9+XIS89TjCHWyP+oMzHQy7I/B8FrXn9Si0k55sa6uAs8mbAQQEvpg?=
 =?us-ascii?Q?wXibqNDE4PtXZy8MO4cjIkzO7V/gT+9yHjbLUoujsfZCvBLx7GqgjxOZ/G0U?=
 =?us-ascii?Q?FTrUjVs199MJf/fDjYHn0JZdebswV6Qo/zS1VJiD06EBbmaX2ku1EWhTYMen?=
 =?us-ascii?Q?y7SX978pZqu6ABG8JcbYNyzVmNPyebK3D1v8xY5KDs2h0hClka9l9JCRd3J4?=
 =?us-ascii?Q?QgJ8fpXgdF5BjDBbhE5ezYB/fsq2xv2ukQXhvJ9PVfkZB2sI6uoqSjUGnFcs?=
 =?us-ascii?Q?fE7ISUbR9N+UlsGCPzFbzVh3XMrzVBE7rRs6FqdvXM2BrsacF95uw1a4s5p8?=
 =?us-ascii?Q?rpOa0Dyo/HUBBljPuLvCTat9QCB61Hj83nWFY3ioYai89e2oW9FpEXRvWPO2?=
 =?us-ascii?Q?efYa+qJPwDKcxu5YoLpjDLKxuRLW9LpK3QzHa8FZAqEnhsoMshwYJZ4IpIWH?=
 =?us-ascii?Q?Q7reNgh+gqasxIwvNJsKTAaLRIoAGBXGu2n8ujGnLA1fMKv/MMPrxEVX82NN?=
 =?us-ascii?Q?xG+hewt+xIjdiVWkEtWxCMdFsQcY6SDwQyneQK/187T9+YPNVxPfF4sn2GQD?=
 =?us-ascii?Q?9JRFom67TFZkkg38map9mMeDPuYcdaDLmfV+nSjmZufIEkXrG1W+TDbF3cMF?=
 =?us-ascii?Q?7gruloJXmOh60JdP/5TmtRnYW9/d1u0zMum5Hn0dY3Gd8GGRs1S6NCs2Oq6g?=
 =?us-ascii?Q?Yx/dFWzj8RVOZFpTejxGUZM+xhNW7K+rMAYpdtqzxYbHSoBidIuyrKg+fWv9?=
 =?us-ascii?Q?9QowZvkliGmc6KVl5ZmadqKKMNAjQ8N3dYF5+EhoIc4RZm8iqLijReOAtXBz?=
 =?us-ascii?Q?FvBvuuiIiNEYjFgGhUsS/JGPzUzPadS5n8bzjoAN7L4eWdfMBixSQk8c1lU3?=
 =?us-ascii?Q?LUs+AVryJlSp0XoFbtCQ77OHQuqN99aXiWq5Na3PVjjNq1CclzXeGSJ+f+0n?=
 =?us-ascii?Q?QdsEM/eHwgE5YGuhnkZfs3lEoNogDCAchM1uExKYL10+gP4KzCCA+ocNOod/?=
 =?us-ascii?Q?qjuUMnFSjNPPSvoU4cCFniN3ajKhipmqzkK84tBZGimlu00QHw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FDlqjfMai4SOvKLb0vQBZyXa30uzoazun+5xqVNn69VMo5VMD0Q3i8hjizLQ?=
 =?us-ascii?Q?/U4WiSq5CwMmQm1jciC5Hq0kT1tHhMK9SaCR+Y6KCvYYrYYVuu2iw9U8JZPz?=
 =?us-ascii?Q?BOe+MrR3Kq5R1h11p7mpjVN/Dtm9/U6YzoiMVHdU8stDiZ8rGvlpuN7BCZm1?=
 =?us-ascii?Q?Jh0FeKUuCpFWvBMB183RygVTNq+n+oIYH/BXlQPFseq/r0PGMqlB6OLOuFFP?=
 =?us-ascii?Q?G4TpBTMTBvfEMq0UpxYuN2MEuan+Art+Qg9i3/OUvTCPfPc48Y40htYyJEGU?=
 =?us-ascii?Q?YlK1OFp5xdqgntpY46nFi1YsfViDIQMv5pN1Vj/CTkeuYliegLyl/hzzUESE?=
 =?us-ascii?Q?BvY8U8YqUCR/cfSyzvzyw5GRvV9TEC9SizLaSmc13IZM/+/vxAOS31EjdqhV?=
 =?us-ascii?Q?qxUGB6oua4hG/W20FwwMroRfj6Zs4BV5ItqIgY6zRC8cY9S8M/HKcKIDO3hk?=
 =?us-ascii?Q?TMXmkJhbQkytm6+6U9QosIyj1zZLdbBMrE9j4rA/dozwRbNNtb1c6cXErhXm?=
 =?us-ascii?Q?uOtBpIIP6xSrkkl6+UmiExYTmZARp24mPQaG/T4JT9EoMpOz7S8rAh5N64Fd?=
 =?us-ascii?Q?5OY68iPwOUXhceg44yJizdu5nSagW6MldLDtZyHS9GwX6n/74+EeNPlR5AKb?=
 =?us-ascii?Q?7AgYtFWrnLTcfMiVzz4/FvsFEr0Uh5gyaOXrXMIm9cL78Xr3jrXVyioPpycy?=
 =?us-ascii?Q?gMMasar/o+wyusGbc7rnR6Db8bE5Bwap2BMmJAa105529tRgWaousgQUIlHg?=
 =?us-ascii?Q?ADkQUTNBhiCt3ymSlyqK3xKWuOMWphsVo/E/lfIfHGVyAnG/I+pEwnopts9q?=
 =?us-ascii?Q?BQ4qKoipjaXRqpgmiN0A2aZ1OhAUxpPiGs1zYgTQ9HZQX0CthakUUtIUsVOp?=
 =?us-ascii?Q?wjm2WWNny+W7tmzfC0921qJ7Hnl4IP7goSqd/3lTkv8apH/teUqTaCru2Pz1?=
 =?us-ascii?Q?oNITFOC/mBoGNrfbuZlljsGhHtO4g9o889jfRtwb3sSjk8nxd3YLdomplmRS?=
 =?us-ascii?Q?emtBqy51Ct9p2TNfjMq09MfezK8WXhTeuw+Vxeq0S6jPWJO7ROq+0ZvSjPZK?=
 =?us-ascii?Q?V7HkKzSet+FULf1SotVwhmnpKBUiFZNIAiS21fIpRc436a7u5PGtuKu9LGhs?=
 =?us-ascii?Q?3Iwk8oemOWwWtw8JvvEbErIt0oMfp9TYNKpZVOlV7YMPwDdwVCQQKX4SsJ78?=
 =?us-ascii?Q?4MmSlpqFspc1cs0+FmjBcx7q+Z+s5eK2994egprINL1SZFEcDLANpvuCeT4h?=
 =?us-ascii?Q?c4/ZrXoWDwUprtlt100nn2sGNBNCgkG9MafBnJZ5rjF6tpcViRk1+vja2lgR?=
 =?us-ascii?Q?J09+hpw5+G560UP7OV9MNwaJE/WcBOpq5z7ZfoXVY05F6FAw1KILdJkMk4WL?=
 =?us-ascii?Q?MOXIiCNLp0sK8erBMTOyiksXicqnddsBanQx3AcuOeNKEOgZT4uodx0uvUyG?=
 =?us-ascii?Q?J/WLKfsRYjj8bTJkFIHxDVWdg91KaHpPOAgkTHhRIOwOiIFm/EKJ+xTudF8F?=
 =?us-ascii?Q?x/C1ehtZMuRQgxaDkAz/uEiMtYY22msKDPEiU4NGuJrZATI1J6LubyFRmwnP?=
 =?us-ascii?Q?G7eutSrCSz6LcKT6Z5NJltaYkVnid7aOrexFo/RxUs2rvrHWLRtwgoQ/CngB?=
 =?us-ascii?Q?5Q=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd38a94b-0199-4668-9755-08dcc5b3328f
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 09:41:01.9356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3EZEVsU4ePVVMC+zNkT/0jqbRPlJg3MB1tTsindbXoZirNosmp7zVDv+xRgsiPrbaP4yYzWO//Gc3li10D9WwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9581
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 09:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111962

Change the reference to the MIT license containing LICENSE file in the
downloaded archive.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb b/=
meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb
index 482f0c641..c1ad6a2a8 100644
--- a/meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb
+++ b/meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "XMODEM protocol implementation"
=20
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D90bc9522130d68de0dcbf33707bbf12=
4"
=20
 SRC_URI[sha256sum] =3D "2f1068aa8676f0d1d112498b5786c4f8ea4f89d8f25d07d3a0=
f293cd21db1c35"
=20
--=20
2.39.2


