Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C36C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 11:19:20 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.135])
 by mx.groups.io with SMTP id smtpd.web10.5576.1743592755519605668
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Apr 2025 04:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=EtXa5FJv;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.135, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hf5G6oUIQm4rDrkyva7geO3HGSkyyIx42SvwDve/xO4EmkhNrPsH5H71hnipMLuAuTIpmjmF6fBLDVUkFXMwRDD5z4ve8WIiKF1+AMxvg6tjNjfpzelH2Tp2yQUKoSfL4xH6X04wiY0HSiaL34Ev+XoVaA++D43o/6HCymHbHJPfqf39WE1UzbXz1z6u2/K1JTto9eCSEZ0Pkdk3LBq0Oe2R2OzCgtbDoStf9GjqV3ruIGfcTQPRC7Qlz+jVvb3ApLhXFe46hOCnioq1E55KEQj9sJ7BVt4+Z7KJJo77m2mrl1KBT8wUxtyfDm3yXhBhS62keFGzvJ/LdK1STUXTTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTXdyl2H4Kre66Nq7w25uZCB3X3wiwlkQPTmeoVhQJc=;
 b=YlB4Ujtef/cNpu0M2GsTAOAETcP2f7YhaDjvn/nG8tV2FPrbWiOsdHqMnMgZ3bVA9OdBOcfJ+2UEqK0zTaaAD8UpNq8z4oLdf9NiSkc2lEp4rlP4NFzQvNHGfMmnEQj6TygY5ZELui/gsq55g6ZW/5Coc+AcVUn85ts2GL38Zd1QXJmpR/j6s4mDguPfQZyhg4TihYz2CoABIdzXh5m79ZFl1vupLvKJQVdNkYbcjqUN1H8wGRkAQYZS34q83MllovM3qH8XXJb7sqI05kfdBr7osf9aow4/7D0YNL5Dfc9JyhTwxgFeGLztoh9LKQxEJsALjFXS6uo/eVWVeiQSdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTXdyl2H4Kre66Nq7w25uZCB3X3wiwlkQPTmeoVhQJc=;
 b=EtXa5FJv4lcny5SNmxxb7MhT0NpYkJCYdUtNvuYSbD+IdiiCXI6+uohy6wS6jCDjhH2PgpNRfYBSboSr5l+Gc1je5buqJiW2+LcPb/djAFfNJhqzYkJUFFzx33fkcZnH4xYE/WBWGUHnxxSCf0gQDtRe/WpPAgBudTehQyX0Abj8z1AV3W5lVSvKKYuUu0/s6EMgzlp7Boq4NKq5kB7Q3p/h5SkahY5K2KABON6BTR5N9zH752Y4GmHDGI0MzUCWCGmuBh8AtzvE4Pi8Ofq1hDlwfQWH5URFZYi/HCwwn0Jm0rV0QeUHSW0/sMttNy/OdEuoRWhi9gsiljD+Mh89aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com (2603:10a6:10:371::13)
 by DB9PR06MB7610.eurprd06.prod.outlook.com (2603:10a6:10:251::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.51; Wed, 2 Apr
 2025 11:19:10 +0000
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522]) by DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522%3]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 11:19:10 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH 2/2] upower: Support using alternative runtime D-Bus
Date: Wed,  2 Apr 2025 11:18:48 +0000
Message-ID: <20250402111848.3803825-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250402111848.3803825-1-niko.mauno@vaisala.com>
References: <20250402111848.3803825-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4PR10CA0005.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::13) To DB9PR06MB8439.eurprd06.prod.outlook.com
 (2603:10a6:10:371::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR06MB8439:EE_|DB9PR06MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: ef3f5aa9-949b-4270-4f5f-08dd71d830c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rW0JLmuRxlDFYt8tWUyRhLM57wORCYEuFRHn5t98JO/fIi3JVhbdtSs8Jw1W?=
 =?us-ascii?Q?XMzwUzEYJofQYBL5sEmj4ZE/f8zVY73DLrx23SPTUNazhlDGCMNFtm7NDQ9t?=
 =?us-ascii?Q?/8VYcZ1NjtFAVJWaOvd1YhoAQaDiNcyTlDQIsxPTQp6kB0NwEOh4qvO4JjZg?=
 =?us-ascii?Q?gh9Zk2ZUBP/qDzLZbi2oYnLlJSEmCaGjMt6SMxrpu15YJvxP2/RBjb3PF6V9?=
 =?us-ascii?Q?onNPldgDF7xgpMpDXLOPRvnqx6UQXvABQUlWutq0C8r+Ml7V5h/4HW/jV2QH?=
 =?us-ascii?Q?S/TtJrH5Cv9WvuN/oxHO4QKiS+RAUQi7rUHZgFOY+Vv6Jl76fMnIYROxVTUK?=
 =?us-ascii?Q?b9GHeJtH9Ef9jxOW76qJSWZJdm0ZmyxcT3CbTvdxHC6+ZJBwq+mvl/Y9nc91?=
 =?us-ascii?Q?060lHyvOJ4KTnPiouKVzBqBE+cWO3oH4VjkSm5SvmrRUVrtDh7R05FckYbL3?=
 =?us-ascii?Q?akXm1Kba51gLrQZTJ5Bbf/8lq6XR8qja/NBRJvRkeiprgKEptJKRJa6Amart?=
 =?us-ascii?Q?mQPObHBvWArOexdeKcEEpURvx3HF+koijYripdQg/IzXLuT6U6wtLHyKgOlm?=
 =?us-ascii?Q?Alq/3kLCKB47blsRfOSwSC6T87BZruYH5QjyuPB0jhjNGUvDaUYEu4nyTI4O?=
 =?us-ascii?Q?MmcEYZa2XnCVo4CK684Nw1QVpsOIwspLUF7SFt6+255IsHNHFGM7K1ILlM2L?=
 =?us-ascii?Q?Hbt0LC7zZvrM6jwaszc2JHfDuykGNz8kFYa7XaGRnkxP8bmLb4tsbb4QELJe?=
 =?us-ascii?Q?//PN6MhohKZWmopwOKN6VuJ0/zyGn5JcW7+lVEkqoHDZi9Ko/CUGm/D7c5T/?=
 =?us-ascii?Q?el63VdG8b55GbZZD8TQoZDhsTtcgiD+RUuu5K3y3UO6/JAYtvO5meb3xxK/i?=
 =?us-ascii?Q?cDS9BV57nI2VHa2EdfHPj33QEsLs6Y06LdFf5dYktxPDd3OBBmKvM6kn+VA3?=
 =?us-ascii?Q?Gkfz9VP6j7B1HLrjiUvPIpqfwV+VMGksqfGqsecg16Cs0yVZpICo/B7hcL1V?=
 =?us-ascii?Q?8W01DVfBZSgonomrpz1u5atnY7282FXIY9DQ5n+9vRPbEDSk6wkoTKGF5CyW?=
 =?us-ascii?Q?i3qrN7E23NbtZQy8uFqYMW5BgzCnbF5rzO7vtPSYmfg+1JsCr4LeyUlIExVg?=
 =?us-ascii?Q?hscMhi992s1/gQ2lvY5wzwFr3hdsawKJbs1PaLe++tL/SRrSPoNiaBZzbUhw?=
 =?us-ascii?Q?9mLdQNfOYD/0Asb/NtRx5bQ30xQl3TD6t3reaYFCltNG/z7tXDLLEJPa+BLc?=
 =?us-ascii?Q?SzxrZgbBEu+JxyjHPgGKHii34QPmiMGzqMhpPBh4f/+Z8/69DOaH79yNu4c+?=
 =?us-ascii?Q?7hSizDGuH/qztpPlwaNnIsfer+LicRovNTWjvJkChjTVi6jhzCrhbTtOWVQf?=
 =?us-ascii?Q?1RxWDnSJW1V/mAPhAXRpTcboHoS6DmA3FkRBS0uXDpR7rJhn1GqAP60qHu2n?=
 =?us-ascii?Q?oGvjBEuv5U9NJbjaYZDVsUONllCKJ0S+zZP0M5IoklHa0spuQZuYxQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB8439.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bVwt92I/SNYDl5zGvZHq0Z+XcA8pdJ+NCnoV5nsU0fxK6It0+r8lTFQA/A9N?=
 =?us-ascii?Q?b/zh43ckboTAOWOZ3kvzbT7G34eZD3y5XV0gHC1FpYRmd+C4nVhs2kGgxdbm?=
 =?us-ascii?Q?ViFbKnK4ZsX/pv5bdi1qCHT2vbhyGpsKin9xczrXtoyl4wIVtZXQXxt2h7rT?=
 =?us-ascii?Q?Qumdpt6O/A3WBkYqdqtJg75+7su1rcz9+jB1VwOgD+UHENmpBRB/2N5u87FK?=
 =?us-ascii?Q?cZp/8ikrszOrcenXpKmOEyTNRBHMqLssRF4OHYV2RqbBVtuAl3VBUr5YuauU?=
 =?us-ascii?Q?ic/FHfT8WHV2J0c/jXkMgjbjrynBWjpierneaXLLd08kcw/OPgz6gDL480FS?=
 =?us-ascii?Q?k+mM9K1kFCFoDcKGNUM8mYATLNfxHw+fUSWP8j4L8la0Jzt2lnTdyMAWKfWW?=
 =?us-ascii?Q?v/O2hNxS5BU+Lsv/hvld0YWv32kH1XAnPTVZxsAXrhoE5FxwS01zOcP+0gwi?=
 =?us-ascii?Q?8p60BlBvPoNjziQkFrAZZeNdSN1gCGsj5kFXtMh9Pi07hjauXqCBFGxZM6qH?=
 =?us-ascii?Q?1XwdAGPBnHy+tv/s4l23MUI8z9927Vt/DFa35I0iclVmrl6vbpSqg1fChl3Z?=
 =?us-ascii?Q?w5UPnM2xmhxM7DDiQf3Kx+Ug1EZpq2SLZGdgOQRPdSisd1xq36KB8iEuO9GD?=
 =?us-ascii?Q?rE8+TyTYnbssUAzJsO5uak/krAKNDZaaUomTA5Ya0CZFKLtr7tQI+fWVhIlz?=
 =?us-ascii?Q?w7RC+onNBb243Y49+KNhD4MeqYXahjvmA3UUbbzCIjHLQzXUEcwmRJfFByd/?=
 =?us-ascii?Q?Um2mOy9mdidNfgVXK/mW8z+27CMOVa9g+GGovoUlu1PhUvcDkZOBuNQx9j01?=
 =?us-ascii?Q?mXAhs5QKZLDneUlWIhWy/HddISE1h4hNKs7Bw3j7btKg37RbSi+r0XqwRuAt?=
 =?us-ascii?Q?OKadDI5a72K3aJDfiDpb2HFtfs4ga1HRWXCkUVdsLOpaDOjJTxeW4u8wy/0F?=
 =?us-ascii?Q?HnSnvZmAZsA+BnF34HIAFI5TJGwt3ROR1+6bYR2A840/RVVCSvavVH6xUcHn?=
 =?us-ascii?Q?luEtBRinvxrPTPANnfNNKNZ/Ocf7lwNUYnBZFwjg+r8Uxba5vBy5/gc2Mymz?=
 =?us-ascii?Q?/o4bNpWbXh7Ef0hXQo6SaMjOWCccBvgvPdbTtkAFRxolVK07HN7ijS0OGoC8?=
 =?us-ascii?Q?e8FPL14AQoNzUE1za3JCDrfSfsSWAc4VqiU/5n2SoUMgq3yxEvp9WnJyoPpp?=
 =?us-ascii?Q?IRDaWGOrnANSd4ZFRKnHyJqG6yKSneHTwhCELfxYCk4IKUBz5PBBxAnU1PpS?=
 =?us-ascii?Q?52HWJHqCtSPYmh8vL8QmB9RVD7X0awH2WJ2Vr8XM8eBbSx8VtwSTEJ/7mL7o?=
 =?us-ascii?Q?FPQCTRZuptigdgSgNjTe1+BLFssuhg3GaQ+iJZw6xHFL5ynEc2vxS6MeHlJY?=
 =?us-ascii?Q?avceD/lr+25pKesWTpmEtM86mOSfCqajwU2FA0ZlLN1v8ZsIwZq89Z8yl2Yw?=
 =?us-ascii?Q?gb08L6Qn+DS+VCwHHoAuDWYQNVs6AsR576Ne6ZZKi4DsIL9ImTni1IknQlK5?=
 =?us-ascii?Q?HzwCitFANsbYfPcnv2p6IRDmAs2duRcl137TRATtvf9cbkUXPNjfERP/3LIS?=
 =?us-ascii?Q?F3csmHfxZ4ISh1VKWEkV4ZHKpB13dK7T2T2cKeLVJlZOO2tF6BUkvqZ8oPNH?=
 =?us-ascii?Q?yw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef3f5aa9-949b-4270-4f5f-08dd71d830c7
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB8439.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 11:19:10.4333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBGRqniAI0WKEdrP9eAIGNEvxMHID6Kx3eHk+mONDfaPemFniRLLIsGtCKVvGBkYoctb19FDUrqeDCGIRJOIwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7610
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 11:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116521

In order to facilitate using e.g. dbus-broker as runtime D-Bus
implementation, change the Freedesktop.org specific D-Bus runtime
dependency declaration to honor oe-core's new VIRTUAL-RUNTIME_dbus
variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-support/upower/upower_1.90.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/upower/upower_1.90.6.bb b/meta-oe/reci=
pes-support/upower/upower_1.90.6.bb
index 6d5fa70162..5bac85c57d 100644
--- a/meta-oe/recipes-support/upower/upower_1.90.6.bb
+++ b/meta-oe/recipes-support/upower/upower_1.90.6.bb
@@ -38,7 +38,7 @@ SYSTEMD_SERVICE:${PN} =3D "upower.service"
 # don't start on boot by default - dbus does that on demand
 SYSTEMD_AUTO_ENABLE =3D "disable"
=20
-RDEPENDS:${PN} +=3D "dbus"
+RDEPENDS:${PN} +=3D "${VIRTUAL-RUNTIME_dbus}"
 RRECOMMENDS:${PN} +=3D "pm-utils"
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1/ \
--=20
2.39.5


