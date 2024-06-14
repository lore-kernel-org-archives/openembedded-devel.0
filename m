Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4845DC27C75
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 07:48:47 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.122])
 by mx.groups.io with SMTP id smtpd.web11.6358.1718351318218007566
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jun 2024 00:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=UO8XVIXZ;
 spf=pass (domain: topic.nl, ip: 40.107.13.122, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvm02Dn6t54giV3T0Fpsl3ZS4h0k7r90V9VRUvJyME6AtbQ8lBgVNc+BVrCIihKcb2pVSit5IYjZZ2qq2Dvlci/vjAIsuIuIgeoASUCUV2dNv7lfPaZ1GkNCkqxGkzhtwHBsPInSh3ffoz01ISQwU/AoS9VU1EKsrbFWlYNTnUm69eKsFy4v2RvgdscqHadcKAuTcwaaXTOb1KOSjnI+fMYSiV64LePZDqI5riSlNFjuQK/kFhJzAww/Bg0tZGh6pyw/yQhP9HbqbxEADZghHVK1MrRkP0+yDcDpraO90Yxsami4kO9uCx3Q9S7k/me3G1xT4oiSWAmTdMO8sbC5VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ATt5LmTO5LQzDyPunFZcYsMJv5AKSVa4w0fxFzyYk5I=;
 b=fZ6WAxizrPkSqBE/K/rLAqVoZw0PYMmAb/T1aLuWu1O7wOUI+GTkYZ6cZT3CR7pb0oKP1SM8AoSN7hIy6llaGI/TY5ey9GJj7U32kb8K87UCdHCOA8nEa6LoN2C9U1QsUVNxI3SnnKoOrTJbf/ZPWVh52lYh/tafA+wO1bd548t7X/fJ7hddFXb51fSPlZZd+aat8lZYXl/6KO+Nxi4xMf0f6gbJbjrN5OYmdBcgCwsbETU5GmwarTELNWduUJfr4isOyR1rDdNHg4C2z4mgH6hTiWpNyxcuKZ16UWPFkiFcFKS4qOxK8ZHGksvylg0R3iHmvMjebhnGcMczH01taw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=topic.nl;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ATt5LmTO5LQzDyPunFZcYsMJv5AKSVa4w0fxFzyYk5I=;
 b=UO8XVIXZxgbOCB8IsA8Hxh18LHtEO9WJyOutuY7JWYQdk0HjiYUYXUNCdONcfJCtFq38iLh+U0D8q/As6toO9FtRPCkIJOKnZsQOvBnX42h0wTACzmSL8ON1jbyx2TmaIyLKnm/PqAOQwBbIK11mzK+Ynu1cF+pbnWmKsovkbAFMTRoSIzdJbAiOm8nudXCV69E66Ml1VFqvgo/Ji0hN2O4Mn5eUbImWtZvFUNsCQN2IJziPJbl755LtpPmzwyiqSA9+rAcdZWxlGWwv36JEU8FU+L4JE1mqOftq4G+hT5GwheQRcX/VbOWoGRb4Sbf1/mJcQSaaktDL8mqxNh8Z9Q==
Received: from DB8PR06CA0055.eurprd06.prod.outlook.com (2603:10a6:10:120::29)
 by AS8PR04MB7943.eurprd04.prod.outlook.com (2603:10a6:20b:2a1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 07:48:33 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::92) by DB8PR06CA0055.outlook.office365.com
 (2603:10a6:10:120::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25 via Frontend
 Transport; Fri, 14 Jun 2024 07:48:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Fri, 14 Jun 2024 07:48:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.105) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 14 Jun 2024 07:48:31 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by DBAPR04MB7238.eurprd04.prod.outlook.com (2603:10a6:10:1aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 07:48:29 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%7]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 07:48:29 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
CC: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] nvme-cli: Support read-only systems
Date: Fri, 14 Jun 2024 09:48:22 +0200
Message-ID: <20240614074822.126556-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0065.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::18) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS8PR04MB8644:EE_|DBAPR04MB7238:EE_|DB3PEPF00008860:EE_|AS8PR04MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: b7360357-c840-4592-9ff0-08dc8c4663ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230035|376009|52116009|1800799019|366011|38350700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?UDVjNBDArrMe05CCY0gszPSQmMJ0F7DoRYE6IJcE/u70WYGxZnCFweQqznrL?=
 =?us-ascii?Q?/3Wt5fT8/cpaY9yRiDlazRQKboa4bZOOZgMkrYKhZM5zzQvrwOtcSCZgGKmg?=
 =?us-ascii?Q?h5z7xvYCOWvPYG3jacS7YlI1zKae+mfrI1G/eTItUro2CeMWRArJyIzCx8XK?=
 =?us-ascii?Q?J5B6fQ5YQMJ7ZjvQFZSvHhj2QJ2pp0MzK2XWMpZwiDJSJiRC2Kx2/YwtAcqs?=
 =?us-ascii?Q?63CPvpkBqK7/Vj/Z8jtNy/WVdWV/7qq6Q0UlKyCDHUwhy2gXXCivYggAoRMp?=
 =?us-ascii?Q?c5lc40JmWq+IrhgkPG9/0qxiW4BcnK1wPT9o+LUHDlmK8EhcZmgUD4Fzryil?=
 =?us-ascii?Q?YR+KWntiiDTZnKlqjoisYvrI8c7pu/M7MKDVOuP6GtHRsMAFBpmtbcF3sVUn?=
 =?us-ascii?Q?E24dz2leLivh+744RjV8gbiGkzFXFj1KFreuSOZ+FhbD5FdZi9jY96tTYoLg?=
 =?us-ascii?Q?xzwLJ37czfnbqid3c8B6KboKzKt8BxxkbEhv1ZfzDL2un0HFEzl8bf9Fd6VN?=
 =?us-ascii?Q?DGnGcYtgbInGouyn4ZSNzcLJEXYExcD1xBjJV1r5Xo3HRjICkCTO54objzTz?=
 =?us-ascii?Q?42MQDUAF8kL1NGT32CrD251TJptsdBajaLPMpi720oI/b4z3ZIDm32mgMK8F?=
 =?us-ascii?Q?DxfWmus18VAI9oG5o6XMk7MtyxP4qaYqnyXiRbQ1QYDFdnZvM/FMiLptNGhe?=
 =?us-ascii?Q?c6gFxpYhoyPO/iOa+8e6kwkLQezK/mXfn3SgI6HmwWr9eugWHERFAbrxwjSB?=
 =?us-ascii?Q?E0wBQgo5KBu02VcViYhUv+QNriwYVzLK9Au1XidyQ0WPgus4WSXlexyq3iUm?=
 =?us-ascii?Q?7lcM77IeeIUa7Fm2nPmc6r/+Ye5fWEYLGA39EtjYq/ogZGy/lNEkgdtRtJ4r?=
 =?us-ascii?Q?nF319n01+JnRfdZ+1n7phsOHPRFnMxBR+KJB/VFqcHnap8xsXR0gdyth55pP?=
 =?us-ascii?Q?UUaxjnAwYMxJxpc0+sI3a8pFrB2wR4ooWs1iFXXao+Lzxn77pgYWpQGyRQsq?=
 =?us-ascii?Q?oU81HKt1D38mXDX0BtV05t1yFVqU4E6fDc3L+k549mnL2XVvrjxPr+tBsFg6?=
 =?us-ascii?Q?Y2LZjrSdMmXdjzmgeVa1LZmynTezaMPCsRTvJv+TVANWmOkDqXWZfaU65036?=
 =?us-ascii?Q?gK5kYO1O8yxOPQgtsYE/mnmuZwlOydDyqg6wOjyGbUsfOibJzJirHDH+3OSM?=
 =?us-ascii?Q?Y0R2HJk7X7SrU3yB3CFDn+EgmcHBZDHLuY/suLDLp4KuVJbjLbHhtRCeSMGp?=
 =?us-ascii?Q?Aw2TYEFuYUMDLxAR1hp6YcFpJEU2k5Sx54PTMIXg1rhhSRxdCfhUoj4xUWXu?=
 =?us-ascii?Q?V7XirI9D5WmhgxWHlSGRnrtbA9/eNPglXCajlznjSHWpMFI1AuIED3RAu9XQ?=
 =?us-ascii?Q?H5z3GC4=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(376009)(52116009)(1800799019)(366011)(38350700009);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7238
X-CodeTwo-MessageID: 3c0df5b7-b68f-4fe8-9aac-57dd6f5a3be4.20240614074831@westeu12-emailsignatures-cloud.codetwo.com
References: 
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.ba551bc3-35c1-4b42-9494-4d015164822c@emailsignatures365.codetwo.com>
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3418888a-f7fb-47c3-b21c-08dc8c46617d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230035|82310400021|1800799019|36860700008|35042699017|376009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NntPICFK254FZmt4r6grSey2wKqvicjuK2UAIr+ucl/2KgTRxwU89gx/8WYh?=
 =?us-ascii?Q?OQvZC4WUoKO7/D8wlhaAWLhcmHDNqAEHQ8z8zUWjkvmdP4k95GsZO5ERjxzA?=
 =?us-ascii?Q?tOdL90sg+XtXT4GTSWnmr/NH2U2s7yhmAnG1xjDEaMJsn0qgLAMKGOtVQomm?=
 =?us-ascii?Q?tFJ2HbvTikD4sVu57tsAhwgZZ2Kf15aatq/OpxEb0NA70rOGiNHDm/fJHk/r?=
 =?us-ascii?Q?mLXvMSjbEPt+lvsNrSwiak9z2DBx28B98iCGu/zjeBq+Tq9mMI8arVTkoz9C?=
 =?us-ascii?Q?ogA4p6MTcSPCzCpK622Arq/vkrbOF3yLTNlwncEUAQ6wtoVqh4cHQDNS0gG3?=
 =?us-ascii?Q?r6fNozyt/Yha9T3dlay2J+VjIaP1MKYxghe4SUsExkDEncHfTpLVTXe34jbm?=
 =?us-ascii?Q?Fzu+ZErcNuBa9ZpgVaod+KB++wOgcXOB+UtfMldg+TSCtAhv/hgf9u6EItF9?=
 =?us-ascii?Q?AKC3kLxSSkUYe9CPbIPYSGlz6s7Vnp7oeIFbwCxr3mkzZv5aUDTLISbasslg?=
 =?us-ascii?Q?KEWzB91zogMpa4qb7dbk0RIn0rFqZ3zqISttkFACj1EnQGPkaksoR0xYXrVp?=
 =?us-ascii?Q?xFSxe/f2E/0FcVNm07dj0lQkw3TztZvF9eLcPwFrb4+avqu5irWVB/cdK7BJ?=
 =?us-ascii?Q?e3K9RieEP/+yRT0bcM9P6g0nNaG9b43xjGkleTKX/IcNsInWbUo42G8PLubK?=
 =?us-ascii?Q?/iDaI/yC9SLPfrW9ZJC/ob5gxnXDXnBMED4j6gicQOJNEYZBIYDmFV1gwkz6?=
 =?us-ascii?Q?R5TeyB3NRqx0tkotVn8ynQ99nWR07JMImHBAgTvB7RxIWXCvoQHY7/PT/J8I?=
 =?us-ascii?Q?CnyVfqvvqjjQG64AK9eE+yK7Jn0Ex3IfyVPlRk9Ks3H3av973iyYa21LpUwB?=
 =?us-ascii?Q?85jLPWn7pgPTfB7tXZu9X62CLHf/ld6VFZAd6gOpnXwO7qONgsenga5rEdGT?=
 =?us-ascii?Q?mXdqg0FCugVJKK9D+hzLuVyfEM8N1V9abfpsfPHdvhn/LTZgtYg9BGLGGkAV?=
 =?us-ascii?Q?qBs3zusYGdp4FitC3w+gd8nIeSqG4SvQCqALC1lhdmZMKDHjH1o9oMIbdFr/?=
 =?us-ascii?Q?q2pgTVb8spzFLrZ4hGm9z4VJ5LzjA8J9JZQoa8VTPRUZHIvr+/RwkF4ejflH?=
 =?us-ascii?Q?aiRF8EasFwdRW1BDzxZ4nQicjJ3mMjjqtH1AbNyXPhT6hbnCL8housxNuB+e?=
 =?us-ascii?Q?/uQeS9Nq6zgUzPS5Ns21SJIWGSUlj2merkGRr7MTlH4d0NyLo6Y1yYgfFhK7?=
 =?us-ascii?Q?rrszfnZ794h8thJi2LBPOezCFdnrSRdo6sYdRxebPziHMtue2lS+A++RkUHB?=
 =?us-ascii?Q?CPYgO1reMUFbbDXnXMw+832cB1AjIepO3ibE/iQzJO+IMMcerwoJUyU/ffH8?=
 =?us-ascii?Q?GHPFETU=3D?=
X-Forefront-Antispam-Report: 
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230035)(82310400021)(1800799019)(36860700008)(35042699017)(376009);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 07:48:32.7155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7360357-c840-4592-9ff0-08dc8c4663ac
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7943
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jun 2024 07:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110901

Attempting to install nvme-cli on a read-only system fails because of
the post-install script that creates /etc/nvme/hostnqn and hostid.
These files aren't actually needed for 99% of nvme-cli functionality.

Split the postinstall into a separate package, nvme-cli-user and also
move the unwanted util-linux-uuidgen dependency to that package.

This allows to install and use nvme-cli on a read-only rootfs. If
someone wants to run nvme-stas it will need a dependency on nvme-cli-user
to create the files.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.8.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.8.bb b/meta-oe/recipes=
-bsp/nvme-cli/nvme-cli_2.8.bb
index 81b30c283..2f034a675 100644
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.8.bb
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.8.bb
@@ -16,15 +16,16 @@ inherit bash-completion meson pkgconfig systemd
=20
 EXTRA_OEMESON +=3D "-Dsystemddir=3D${systemd_unitdir}/system"
=20
-pkg_postinst_ontarget:${PN}() {
+pkg_postinst_ontarget:${PN}-user() {
     ${sbindir}/nvme gen-hostnqn > ${sysconfdir}/nvme/hostnqn
     ${bindir}/uuidgen > ${sysconfdir}/nvme/hostid
 }
=20
-PACKAGES =3D+ "${PN}-dracut ${PN}-zsh-completion"
+PACKAGES =3D+ "${PN}-dracut ${PN}-zsh-completion ${PN}-user"
=20
 FILES:${PN} +=3D "${systemd_system_unitdir}"
 FILES:${PN}-dracut =3D "${nonarch_libdir}/dracut/dracut.conf.d"
 FILES:${PN}-zsh-completion =3D "${datadir}/zsh/site-functions"
+ALLOW_EMPTY:${PN}-user =3D "1"
=20
-RDEPENDS:${PN} =3D "util-linux-uuidgen"
+RDEPENDS:${PN}-user =3D "util-linux-uuidgen"
--=20
2.34.1


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=

