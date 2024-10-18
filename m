Return-Path: <chanh@os.amperecomputing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5AD7D374BF
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 09:24:07 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.100])
 by mx.groups.io with SMTP id smtpd.web11.18519.1729243440679866492
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 02:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@os.amperecomputing.com header.s=selector2 header.b=ApGClNvb;
 spf=pass (domain: os.amperecomputing.com, ip: 52.101.85.100, mailfrom: chanh@os.amperecomputing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxzGMJH007nwgzXQOws/5/6Uofbza8fRIdkGokyFSxwwWJG5tMCUAtIGkuQ0ig+i/VzzlSoTULtAoEjGUSeRVEUJulLvCxWrHAgUc3I5f0YI8TUCULKL1VJoCiYe2wRhOcV5oZA3f9P52+4PECne0TS49qwEzjfwd8oIgsLRcDpmsOmH++1thWSmqqUGRlUm/50doryOH5Am16q09vWAsekGKBbaVXIMeQotugFepbOA0EdUy+BiwzzP088FljS/6ilNru6T7wgtZJk5rPOQpra8IJzacUCwxq/9L1qGoFOtbUZyhowiMty5L36iANt6pqN1NJHbQuKUjR0RhuYtuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3KK5VrTFZkWOZy03MusgjcS2OdL03EnPHCQC7OlhNo=;
 b=Zc+YFGzZzBiJVQVHODqdej+BT4gLnzscP5x8TKrv0LnxlWMMWMsmugmpfvWsGuBkMPhb2sTgpa8znh1RpI26vEjFFUGk/a0GNJkmt/uHpATT9Kxmx8OUKPavswx9qG3gz9xgvpyflO8SuvaQ/ppxzot7EZz55mr/R1sG63QXqs6RlkRsweebtLOTdcNlDIuIWdC1pg1SnHH2jcwiRMAZif1VXt4PnYxbKoXIkxkGS/D6jdyStDIlNuwcMvXU2mIVKsBMilfgKJISNPccONZDXTHi6f5WzdOC5TQ5rTiY/vOzb8TGwJswXle3RkxnnO3U0h2P+UqGgh2nswQJHDZNLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3KK5VrTFZkWOZy03MusgjcS2OdL03EnPHCQC7OlhNo=;
 b=ApGClNvbGthCQS2ZTpg1WLiuLOxW/alnXN7KpiU5/02f+Bm2BW/Q1oKQE41ha8XS3FoU69UGZvvvY+/6ThV26S/lCFBL6k1NafguulhuBc0HsSPzX0XD3/hlOS3qX2a/doPhqQx6gpXC40xNQtbmIQ5o+piM3k8VDmrxDbgmsYw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 BL3PR01MB6946.prod.exchangelabs.com (2603:10b6:208:359::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.34; Fri, 18 Oct 2024 09:23:56 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7982.033; Fri, 18 Oct 2024
 09:23:54 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: Khem Raj <raj.khem@gmail.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	openembedded-devel@lists.openembedded.org
CC: Phong Vo <phong@os.amperecomputing.com>,
	Thang Nguyen <thang@os.amperecomputing.com>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Khanh Pham <khpham@amperecomputing.com>,
	Thu Nguyen <tbnguyen@amperecomputing.com>,
	Chanh Nguyen <chanh@os.amperecomputing.com>
Subject: [meta-networking,v3][PATCH] mctp: upgrade 1.1 -> 2.0
Date: Fri, 18 Oct 2024 09:23:26 +0000
Message-ID: <20241018092326.2152223-1-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0025.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::10) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|BL3PR01MB6946:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b48ddb7-6a75-484d-291c-08dcef5695c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XHHvEc+eGB+rLkaYt/5ZyXmnWrk9KInA/aVNnX/MfUEAy0EscG8yaSstKhFp?=
 =?us-ascii?Q?cslgMNzt480d/ZDuev4PdLAihMyHWq6yNYLNGlXtkSBruL8tIGbTSKGrpBN1?=
 =?us-ascii?Q?DWAkRe2QekygPDYk1bs5ojsWfpA2376psIBdQzlOhsLAflTKBTO69pNzJBfu?=
 =?us-ascii?Q?F3ntciiVlipRCqV8eJ9gY3cSLncVt5ASEn0J8jgiPt1/8E0yG0+03We8GwtI?=
 =?us-ascii?Q?vqrt3akKLsKydp4MRGMo/cEkhNWFKUzVAMwpuzL9dN5IpTYOMhkPXxUsdqc6?=
 =?us-ascii?Q?aGpF4BKHCloRij7QtfsQLX64fIn8C5la3imhe4xMVCZHHPkmZzYY59ZIlbNe?=
 =?us-ascii?Q?QrAqRl82fQGgMahTTAqvSJ0rvWD+AkccVe0Bc+2RmL3x3Jt7x9cVSq9hZoio?=
 =?us-ascii?Q?iSXnecKNEgCDCF4dDLWQBwHWdbl6e+BZNgg+TEu9mlcZBB0SW2g2G8373ICH?=
 =?us-ascii?Q?DSB7JawgbMV0EodJCj9hvwjDCSEkHofEZ/NxLN9FcWZwDuOfviuQBt3Zzt7p?=
 =?us-ascii?Q?Vuf/+fqsOIAmyyyckYVqZ03YdjZa30yh+eLPItBsTNd4st97LZwkYIZ6CdKk?=
 =?us-ascii?Q?G7wUuBOEBkN+pGm6Rd3rY1Gocdqb1p2DupWUSMF1rN04roDYMk07BIEVDHnb?=
 =?us-ascii?Q?9UelvHLQqHehcNATSOwKrqhckhC7lgYkfMM4nPqRQdIMZKqW4+cvB1lKyxp7?=
 =?us-ascii?Q?Pp8EyHj4GD+fl9AUMIzPoTTsVRzktBcX+uOEDmhaRfd2y+tvHR1VTeJNGQwC?=
 =?us-ascii?Q?3P1gE8DxzwU6ppNjrSuLzpXglHOTsdP2ovh13VbIhdcKQIxTYJueNwka1gSc?=
 =?us-ascii?Q?m1dVAAcWSCYoJsKtdzNf1meOwYbqry5jANGGo/HcSyU9iR4M4u0MNLXIcORs?=
 =?us-ascii?Q?ekZciyiWGdKPtlW3ryczHiwxG2H3xvMtCUF1XTXDcAi9fLZx2cnquExHLv35?=
 =?us-ascii?Q?+goZ6Wgo1CT4sV2QjTd+peQYMoHAAgPWzIizkC+2YMTayZ+X9PtE3uC1fxot?=
 =?us-ascii?Q?Fs8jidXkonpq7gCaF7kHWTvAkxrKR8QtoA60DBEpbrZ/6uqZsQh6ndWk0DN6?=
 =?us-ascii?Q?W5F4ACTjATnpKIBxb078RSAwlIAw588QgRDr1iZOj0FeF+MknEtGHZK3mS4Y?=
 =?us-ascii?Q?f2/8rAxdrn6WPWswogGCLqONjpKDfhZYztOV6LL9mzDYydPRjwcrtz/X+jGV?=
 =?us-ascii?Q?lbqz3goQo1v5qDwwK5cSb52QdsldXrz2d686Jz7/+Z5yn9sGya0ogTxOJ3lW?=
 =?us-ascii?Q?yec6YmYclNGRfz7STtwv9XryclLRw3wIz6/AxrtyAid0dYzznuohKpuycRFG?=
 =?us-ascii?Q?taY9ZV0Pv5mXNZw1mppOPvz76lICanfdgUTGMdWe7iPpVZm0cHA3mrHIknOl?=
 =?us-ascii?Q?7d5xCBs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AoiHCBTvK6t6Q1wpZ0qT2jItCjK0Z5tIFXLEiEBueT4ie10yV1WC8Ep17eP7?=
 =?us-ascii?Q?r3CWQ4UqybTxAUI9iK9dbmBwEBy3DZN0B+fpih6oCo8M2n9jDSPkHaGkvWum?=
 =?us-ascii?Q?FGlhr4APOhFaN6P5XpOGu6taq3wqmPvrivO6jlRIojIhx+F1OpL/eLIFjrfO?=
 =?us-ascii?Q?Thg8PbvLrWH7vgJ2Gqi4jCKAdr4ZQl4d3KTuX4ddGbeuPuLs5qIIdQjzdAOK?=
 =?us-ascii?Q?TpQWMH/Q0E7JsfMBDvQPidpmXvgpgYXIMj9GmWvGatIeRvbo03jLxs4z2VZk?=
 =?us-ascii?Q?pYfABejPe3tNH8fwwQYYhvAIoiTdAo2xWkmShWvyTj4EmusyEQ2qqGHGC/2D?=
 =?us-ascii?Q?vIcKsXRHrGVEuB93xz3lq7jEFIuUdEyfekSzCWhd/tYMVo6xV26ICw+cXr1k?=
 =?us-ascii?Q?vFFdyFEHNfvbO2/eiZVlWhflztN/sg/pt28O3kVwe9Mn3NCE+iCgTnhLdVT2?=
 =?us-ascii?Q?ymIoxzPJLyUGish/xRTumj/FO2mKmGzJ/wX9d2u1J/NUhYyo9cXoZavprIct?=
 =?us-ascii?Q?+ALy8YJAYuobk2hSmqKqftaKUiYDrqcDf9z5VzdXerB5C3ziHGEnZTGSjsR9?=
 =?us-ascii?Q?e1OyEIddGWKVjs1fstsQfM7hQByar6uNy3wvJ0jrIjZt4tSJ9D9239jCqPd1?=
 =?us-ascii?Q?4QuTD4OEtA3x2qpLcmB/LSCqCSG5pTmkyfY7BqPg43lKFHLdJvwZaGu9GN5w?=
 =?us-ascii?Q?jMbPRTAHQJ5BgRhw9alZGQU91C1ywqTA2G6/3eoHRMG57Hnbj8GLyj/fPNmu?=
 =?us-ascii?Q?5yoCARimHergQhFe4y8uq9vdHH0Wj1ts7f6HogEV8vLLuX6b46mdSHPXdR2e?=
 =?us-ascii?Q?0xo/ZgxK1QFCNFAS1+MWhAqGicXOb7D7D6qbjQtqS+snyaZFRGQI3qpDopd7?=
 =?us-ascii?Q?8HK9TlWF5fM+UFek6GTe7m+r6kFarmiNjVWXM41+J7Zu/hL1S78wi/6IQUti?=
 =?us-ascii?Q?fVszdBascemblUQj0b+aPKov+FjnfCmiR2o8qRPJS0NipfjgHSmqv74444V8?=
 =?us-ascii?Q?i/GbMP//P/lvpimCJQbGRKYO9llBlPsCjhUyNetuT6vsH8jlqd+/to5+jgLv?=
 =?us-ascii?Q?1u5vEsDLfvIafGtlOQCCehDhc79eYDLRR4mITbNvCboA896i7qr8Ef5jo3ll?=
 =?us-ascii?Q?pS/lOb+bAXeJO1ur4RbCysYARnCH8+GTe3B6827+tjsZO+VpQ83xrWDjtOdt?=
 =?us-ascii?Q?N5wq7HsngULPw96hN6z925DtEtjnyvvZ2gu75oFPE2uhPm7OW+R2KLzkxhnF?=
 =?us-ascii?Q?WkRU4BaPjYl62GfC3ywPDg69AICRLZgTNsHZO61+jSdMcnndpcYW4fdeNQkU?=
 =?us-ascii?Q?NPtKw8z2QT2fQFV/MRADZs6efezlQAzngHOU7/QqDvR/7cDJIyMo2WcHbPj8?=
 =?us-ascii?Q?JqLdtumFy+xGTiqeznyp7MxKr2PTxDnViXsrGELIaFE2YCcKTabS9YZvfSnN?=
 =?us-ascii?Q?3Nef06XXyzDW1L5Jx+G1dVzP+vdZFZIlRw0Nq6DpuEw6o/WWANyGrE3+462A?=
 =?us-ascii?Q?Bc6t06h8woLkcMaaSWjN0dPXuRrrlW8GHOHsUsTct2DigU6R7JLH3C+KNyCk?=
 =?us-ascii?Q?0g3AGaAw4JSo4Z8xo5rUcsIU2mAjc8DkxKWXuX2PvJgd3MDiPJCL+r9UhB5i?=
 =?us-ascii?Q?R4L5a/wyiKso1GEVEpLUPv8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b48ddb7-6a75-484d-291c-08dcef5695c4
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 09:23:54.2721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNWKiDo8hcZhYHW4x2qR7NHmj66bXg772WjLhtwIOmXPskxpXQJKJfWkSzgjvqinEQpieB+zOGmwGVOiG12av82d25mVCCXhZjc2bhSwnDwJ18XFHQAMHq4hNGTbBIvB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR01MB6946
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 09:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112977

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
Change in v2:
  - Fix CI failed                              [Chanh]
Change in v3:
  - Update to latest srcrev to fix CI failed   [Chanh]
---
 .../recipes-support/mctp/{mctp_1.1.bb =3D> mctp_2.0.bb}       | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-support/mctp/{mctp_1.1.bb =3D> mctp_2.0.bb}=
 (93%)

diff --git a/meta-networking/recipes-support/mctp/mctp_1.1.bb b/meta-networ=
king/recipes-support/mctp/mctp_2.0.bb
similarity index 93%
rename from meta-networking/recipes-support/mctp/mctp_1.1.bb
rename to meta-networking/recipes-support/mctp/mctp_2.0.bb
index bf3961be4..c6aa7c104 100644
--- a/meta-networking/recipes-support/mctp/mctp_1.1.bb
+++ b/meta-networking/recipes-support/mctp/mctp_2.0.bb
@@ -5,7 +5,7 @@ LICENSE =3D "GPL-2.0-only"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61db2=
1"
=20
-SRCREV =3D "a591ad885aa28f113cb45870b2fd5bce48378d6f"
+SRCREV =3D "f110926b082731b25720b444378ad55d7a9d451d"
=20
 SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3D=
https"
=20
@@ -13,6 +13,10 @@ S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig systemd
=20
+EXTRA_OEMESON =3D " \
+    -Dtests=3Dfalse \
+"
+
 PACKAGECONFIG ??=3D " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 "
--=20
2.43.0


