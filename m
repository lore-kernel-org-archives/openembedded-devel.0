Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A649C52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 15:34:55 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.120])
 by mx.groups.io with SMTP id smtpd.web10.22924.1724254490383450475
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Aug 2024 08:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=GP9LAvga;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.120, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AMcIU4qfuGjdB2zt1xDLByNfYHhNqSznCs0Qvhgf6lhKDp0WcRPkVdJjYcG3bO0LegImrfKlpVMLPHALbblO0D3+nWShfV2UtIDkL7SALZxZY2ANyDWD53FycuTJQve6+ZSBueDYYnA5KJIoMZtWOAqbOzCOC1nMgrQGUNX1RP/KO0Q7SKC57oinb6WFeT5oDReqfbIyXC7ltaz19UFknu+6AhrkBB9ri1fozGkqb0xeb+074I+J/5z8MJnmGRBuWUdeBzsHqWTCLi9j1k43X8uAUcU3K20Ca4+jj4xv6TqVjaFuepGj7+AuYTCxXfiuewqoludc62mHRVAp3MaU9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IR+5GHnHtb8ChTi4boFbPCXlDffCw15qdB7H6jSGD84=;
 b=R6mRPMSL2s6mmTP5iMeEDA3RIU0Cbmeh6m07yV7NjgMXyDw6E450YjY59+LhZ1hmGT1jeqpWGPEbJoFFhIbbQv1gwVMRg/HW9iNFI65RAVaM2CAl4Sbj2y/b8N7r/6DerlUA4CJ4HFOU9TXdQR75dVyBbAAzDZIcjDmoUCjVzReptqedhRLjOnels8PrXx3zVdY/HMuUhA8AZsL7G/f9JhB1uw9jbN+G8lqmkAOpicv+T5lkeq8HQvx2DiJbdqrx9PTyrokZe+pCHQ3NUNjmPG7mfBew9Xt+WP81QOZ/VXPMAD4Wk6k49/0FpyomNsj4xVIlxmeFAmtJ4vyiYWgEKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IR+5GHnHtb8ChTi4boFbPCXlDffCw15qdB7H6jSGD84=;
 b=GP9LAvgacnSkC2xfhQLKO1AsZYV2yLtMu8OdRAQ3uQ7kHDqupm+8bLez9xVkcKXN3jl4apzzuA+geaFPR7EFo2uGeHSJc5EVcvTHyTe5i6VqfO5kKgz1HLaVypIVAW+JC+d0y0AhhDiwKWtqdfoDz/Lba5o20FvlCNsWbs6OqoVWHP6idMcw6e2EfWR2Ckz41ysTgYObRTsjQCZvFdact+T4i4Pd1pY8xvoQ7jLETqirzq7I66roJ6buH/ismoUWl9MPJr4dQAlmpOOagFACibJy7GesPDxTBTQNWDco9CegqR3t6rruHA+Q3FrcywLP4LwXiyE16mcmG6dEWQZxCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VI0PR06MB9635.eurprd06.prod.outlook.com (2603:10a6:800:231::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 15:34:48 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 15:34:48 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][master][scarthgap][PATCH v2 5/5] opensc: Cosmetic fixes
Date: Wed, 21 Aug 2024 15:34:16 +0000
Message-ID: <20240821153416.650175-5-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240821153416.650175-1-niko.mauno@vaisala.com>
References: <20240821153416.650175-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0071.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:a::6)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VI0PR06MB9635:EE_
X-MS-Office365-Filtering-Correlation-Id: d359ca4b-4aa1-40e5-c78b-08dcc1f6ca5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?a8Sosi9/ET2U0Mql7GRq/KhlhdXS3bZ3Oraq3WdBsHJnEYjWxUKQYTyn8k+w?=
 =?us-ascii?Q?4vmSVaBIaDoVfAP8XwnTmIliZnOKFppWRZk43S9DF5ZdQ68llI8D5m1J+g6q?=
 =?us-ascii?Q?NZ3DPfZX2gAkx65a4ffLVpNfAwY15GWf4SMlaP3QTUKSpjy/MegtNjQwOcba?=
 =?us-ascii?Q?QDHeWpK13CcoG4OdnHyuJx5gDuUq2CoOpB18PopvxiGLg2bECmQSM1o4PrOP?=
 =?us-ascii?Q?A+MOicYmiuGaLPYXaNtZOigOzXmubaLygw/rhUoue8j7pm63QwWTcY83ZP6C?=
 =?us-ascii?Q?clt2964VV9N/bQL6lEq9clDQZKvvbVOlSmHpW4I9zSoa/KrM5QBSBx3mMQXR?=
 =?us-ascii?Q?6YzSAnC2TdvEVvfEPADvBkyyMgBtHZxtunu3Oy57iXuYycLo3WMEITxIes/R?=
 =?us-ascii?Q?VQ/aqNYduTg1rrO35cCuTAUJUYJ54jrx8hka2YtWZOuTFPfu0t4rLCKPgESN?=
 =?us-ascii?Q?NoZpQvxEJ6uD7Wv3BgxkeD13LobZ09tq+o+F2WQX2GuMMkPMsemdngkHVKED?=
 =?us-ascii?Q?ivoaadnY1fvo7Yh/LO7T+bcaHY74GcLDqOyO+N/hFOKoSH5XZvkKTxV7kyN4?=
 =?us-ascii?Q?mspRSUot41ACKpcE/LYdSSnAxPcflAARptt79/Y98VTct6kbRElelWWOxLcw?=
 =?us-ascii?Q?OaPBrmqSkonSKEI3aYC32e8J30jKNB7mPm2YNiCEe9zPWrwvT+TTJma+UMZ8?=
 =?us-ascii?Q?xo8KLqe2hh6ah0YFMOKSaxiOcKye5xmyUtKsSSGrKJ8BgOhnTOrOUB5Im2OX?=
 =?us-ascii?Q?BFlevKMvSs2tXpEUpd+h3tX2mxiQxNiKfQJJbDc+9JW131FdVoRd13+r8JzM?=
 =?us-ascii?Q?f7/Q82VIosMfmRjTBv3KDalkFWtdMMHLzM7MgbkBmItbzGxWofYD7x1XDaVy?=
 =?us-ascii?Q?tbV8G+NNSOeh6xhZGM8QBXJEjqCPAQzXwOj6plDCHi4fviJyFX34Dmx45TcI?=
 =?us-ascii?Q?5YkYhb6V0jJxwZn/B8wgzzD5PDbnsBDkY8J10NXG/pH9sjCWgVyzlYwfjiGm?=
 =?us-ascii?Q?41L7MAqg6UjZNM4OK+OR/qnZksVSp64F4BXL434Jm0uiJCXOy89BViENxpIK?=
 =?us-ascii?Q?laIP6rGqpZCcMOIrGPR22Zyw66RAV1AMvxSzvHUw2xY0wTZYhp4SzQoGyU6+?=
 =?us-ascii?Q?LCN+1IjYrf8/EKYkpy1bqtSc0Kjd1Gk9aCm/THy44sKX/GTiKnhvuYUxUsla?=
 =?us-ascii?Q?7go2SvTqAodArJGjzUPrPrNkKeOmkWThL14UScmBDqO5Xi8GQzG0VDh/vxSG?=
 =?us-ascii?Q?XVms8U8l7wwefJkxw6MRFsvERZZz8B4yZ2CGyvFNqdwgg7IBEkd7lg5mn/Uh?=
 =?us-ascii?Q?DjZ96mRKBuIywl4Eoqh+6nQB0+jEtg9bEuhzrGusVq0l3IzzkxgPZiOHwVN0?=
 =?us-ascii?Q?zcW5DII=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gzCawlY/XMcl8prtOa7IFw9EstACuJ9uNMpCjofAZkphEpseiz1byINsHtGr?=
 =?us-ascii?Q?j5p2WP2dZp+VGgM8lOsKGqmxxTbO+dQ6PmmdhQh6TmbT8BA2AAUAgrCylJRB?=
 =?us-ascii?Q?qV4p+vvpeh9GesOdW15xO/8Vxbw5JN0lcC+v85xPk5G9+9pI0B5+oV5DM3C/?=
 =?us-ascii?Q?4nkiFNyYYwZQz7UdJWyXTtZCN0N+pSyQh4z2TdXapm3iTqGOZd5/yRlaGC8b?=
 =?us-ascii?Q?N0tnTJCFzY7ol3jSJol2qABCv4UZ7mxwbn6tKr6PXh96HBg3oIl97Ztp/Brz?=
 =?us-ascii?Q?b/MseHSgOWyjiASR8E8FmosTlmsw1y5r3TR9Ai9Wq+OvzLYRv7UkQxCx/fph?=
 =?us-ascii?Q?oBIAy71NoxHZiToDBOzbxJjpPjEVZJEP7HYjYVA+hPpWeBNyrNXWL/DYnYEl?=
 =?us-ascii?Q?Ycf/IvaWN++bStdrj9lFTN70OT1+gzp2JQyey3XoBozjOSoCSb8RnFSi0/m0?=
 =?us-ascii?Q?j1dE7Fp4AcVetE2tqJ1w9ltbWBu51cz4oFoO81o50IYaDKwcHGmt6UeA6IXi?=
 =?us-ascii?Q?FL4ju4LQPWLS7JMm/b6mQy1qMyHf8a93sZF6wOXQSvN7qAH94PEoN6OTE8Sw?=
 =?us-ascii?Q?DExY8py3Kz9BZOZMEtqt7P/P+SoZuqW7QMIE5B+2AEk7UyI4Db8pTXRLacgj?=
 =?us-ascii?Q?j9VYx4mtFETj9PQnPO+uPZ9Srxdy2QL163BZC3NGph4ztAj3fK2whVw8s8Zn?=
 =?us-ascii?Q?R2yWjzb89UaLoxcemRf4Mxgj8XRqEfpoP3SzhgJ6tQBPbp/S273ponv+CKxC?=
 =?us-ascii?Q?jFqsuHWn1cW8N4CK1nYO3twrm3dYaugaaHta6UFokxWryolrt9Um9KJC8egv?=
 =?us-ascii?Q?A/DcJ4ZJuZzTHz4QiTJ/B8UdhB4yzPx9WBDRIKMj5amTFH//T8SZNSlEn4kV?=
 =?us-ascii?Q?XqYM9dkdesBqQX2cMnOMjYmOzar/ZIVjc6sLupnjEg2w7MhGorDBdqp1I63Z?=
 =?us-ascii?Q?uKPysxc0gUphnLM0P4v6HY1nEZ7kc9yVJ9HgZB9WkwsbpyMbBhjtuH+Ca/Pb?=
 =?us-ascii?Q?+HQRAPv4SMXJGKODVhbauHCIjfshL+PlsuP/oaJs5wKsu5yqYTJOhP9VElgb?=
 =?us-ascii?Q?1atOTB4zePncKisaHe492p+kL4ppmV++8MR9mDj55qtIlJp+GENv88AyxaCM?=
 =?us-ascii?Q?WRO6fj9XgQXubNnyf0QEKY56ic/82FhKBRmPefg54RXBtlBfonY1f0SD0l3n?=
 =?us-ascii?Q?4jIR2gWcal7dYnsrGxZU69XlB4njBxoGkEAdz4QnykbPgVS1S8IjqEGHMyeI?=
 =?us-ascii?Q?kYbcvZT6/z8r831zHCkKJ05h2Inhvs8qhddmX99QVX173NcE+26T3r3MokcC?=
 =?us-ascii?Q?ywbOc8jl8NUCM1Yw9axj6gAzbokBjWZIqcrqYbUXYnSHUQIGDQei7n7gae5E?=
 =?us-ascii?Q?88yYt+7qewcFnYsSu3dNm1Xp83/ZtPnjle9bj2FELAosk976kVyqynovNt9k?=
 =?us-ascii?Q?hUcf970zGV252avqEu/gt9VfUK6eMdFc71lf7gLPok1Vw7ymjXmY0UEYhFFE?=
 =?us-ascii?Q?G2oO0mAkKVV7mLqnOta6WqsC9tyYC1R7LMyMrZrqZ3YlgUbObNYFNsbawZBw?=
 =?us-ascii?Q?Rfh0xmYQDEwcQqWKSU/R2K1a8+b0xg9iGbjOGq8dNfS11Cz2yoXXIAu+vU1D?=
 =?us-ascii?Q?Eg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d359ca4b-4aa1-40e5-c78b-08dcc1f6ca5b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 15:34:48.1815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SPQFKshf0QE37nNck4UhjfQCU5LSEuJwpOo7iqrFZjVHrUql7Sly+iXkOgskIGrs5TeiUx0jiZCy4e40oAF85g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9635
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 15:34:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111894

Apply some suggestions from oe-stylize.py and sort configure options
alphabetically, and remove stale version comment line which has not
been updated for some time.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-support/opensc/opensc_0.25.1.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb b/meta-oe/reci=
pes-support/opensc/opensc_0.25.1.bb
index 1a31cdbda..636bfa036 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
@@ -5,24 +5,23 @@ functionality (e.g. SELECT FILE, READ BINARY) should work=
 on any ISO\
 keys on the smart card is possible with PKCS\
 such as the FINEID (Finnish Electronic IDentity) card. Swedish Posten\
 eID cards have also been confirmed to work."
-
 HOMEPAGE =3D "https://github.com/OpenSC/OpenSC/wiki"
 SECTION =3D "System Environment/Libraries"
 LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcb8aedd3bced19bd8026d96a8b6876d=
7"
+DEPENDS =3D "openssl"
=20
-#v0.21.0
 SRCREV =3D "0a4b772d6fdab9bfaaa3123775a48a7cb6c5e7c6"
 SRC_URI =3D "git://github.com/OpenSC/OpenSC;branch=3Dstable-0.25;protocol=
=3Dhttps"
-DEPENDS =3D "openssl"
=20
 S =3D "${WORKDIR}/git"
+
 inherit autotools pkgconfig bash-completion
=20
 EXTRA_OECONF =3D " \
-    --disable-static \
     --disable-ctapi \
     --disable-doc \
+    --disable-static \
     --disable-strict \
 "
 EXTRA_OEMAKE =3D "DESTDIR=3D${D}"
--=20
2.39.2


