Return-Path: <eero.aaltonen@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AEA7C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 11:31:47 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.114])
 by mx.groups.io with SMTP id smtpd.web11.18710.1713180699754178241
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Apr 2024 04:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=H2+6vSgf;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.114, mailfrom: eero.aaltonen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VjmgFciGpj+h8f0ZV/YSmd0hI4NZl2Ex/+oJHShQ1WaH9wzni+T1y8qs7+ZVccjMZq88iU8kGBIizoZEKtebuLj13lcBhTSlISKpIcw8w6U+IEfwv1qM0fDD19hYW4SdtTSVPUilQ7QD6WzV8aV+r5lJfaG8oj/qJlOleVt4GaQiuRiov551oXdEG5JjShXOodKjg9BmH+Z6yVgslxZw8+qWIVMzKIGCzWjd3GIgSeqbM9nzb415uG4q7XaP+qCXyf5L5XbpwE92Rqck08VqIpo5uKIzPRNucBZhpygVXiclprzz5Pe1IDjIOa+I4642EIFbplbIKgSZw/gk2YBIog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zpAfer2gS3tsJo58Y4zBOnSRMkXy5uqPF3XfwxIdpQ=;
 b=SA82EXa31+J3hESs1+fEqL4swPL6gXdDHGHbv/vefuCB01d2XCODFQQMNrOMKu9AVcG11QiKh1fy7tKzP1+PlOxQ3POs1RfUlbo8xrue7uJ1zzZyDi0ds/Z8YPwIM3e2tFmLWdkIYpdiFOzrT3DXUJwz2ZGccKYiyrf6pA0rpupczznRcCsEXQDmD5Gs8nrMA5D5VUi3SbOhH6Kae5e/SCblOL/cvr3MoGQQm+DSv70VNMYh259AUmZJBAs1oHSJPpc7LPqKxXVDBEiQ2bDsPK5Z7C2wUmvQKN+HmvVFVkb+jdtmfqN3RwF8YBKBxmpukogsNfvV7HnnbnGDmhJuQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zpAfer2gS3tsJo58Y4zBOnSRMkXy5uqPF3XfwxIdpQ=;
 b=H2+6vSgfHV8kAFqPtyOm/jcx0YHpcVr8Mswpwzlnjzn/1/WyNS89hki/QXpn9Oz+OLU4Ytxw0mns5iFFoRJqPC3gHCnGUpCiK7ZtzKsgOIHM/GiMK+t0lVIT6NMytfWFXM7UAhBfEecsZXs861q8B2wNMPXp2pEdi7iMEmWtdCJ2cctbgdi+74gETbf/9Waw+/86bOE7+mKnSOwPtYpwuzGnUPSwKQUU+0DyH9JnV8XEEhW1fEJRIsZZ+QYwmXnijTXicbNOEhuK3dcr/mqlOoxAdothJ36Qp5IimWzS2hat/g8oy/ywneKgdPaGF8M2pQMZaaX3nLvpHkx1xrDRhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS1PR06MB8515.eurprd06.prod.outlook.com (2603:10a6:20b:4dd::22)
 by GV1PR06MB9147.eurprd06.prod.outlook.com (2603:10a6:150:1ad::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Mon, 15 Apr
 2024 11:31:34 +0000
Received: from AS1PR06MB8515.eurprd06.prod.outlook.com
 ([fe80::caeb:9c64:8a5d:b578]) by AS1PR06MB8515.eurprd06.prod.outlook.com
 ([fe80::caeb:9c64:8a5d:b578%6]) with mapi id 15.20.7472.027; Mon, 15 Apr 2024
 11:31:34 +0000
From: eero.aaltonen@vaisala.com
To: openembedded-devel@lists.openembedded.org
CC: Eero Aaltonen <eero.aaltonen@vaisala.com>
Subject: [meta-oe][PATCH 2/2] docopt.cpp: add support for native and nativesdk
Date: Mon, 15 Apr 2024 14:30:30 +0300
Message-ID: <20240415113030.39050-2-eero.aaltonen@vaisala.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240415113030.39050-1-eero.aaltonen@vaisala.com>
References: <20240415113030.39050-1-eero.aaltonen@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0043.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::18) To AS1PR06MB8515.eurprd06.prod.outlook.com
 (2603:10a6:20b:4dd::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR06MB8515:EE_|GV1PR06MB9147:EE_
X-MS-Office365-Filtering-Correlation-Id: cae8116c-e13d-4b0b-f9f7-08dc5d3f9aa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	T659vm+pidg3FJCJQjc2wZqEew45N4+6MgLv5VeGY0uK00KORSOEmSOFnPccHb+lP8DnJwUrdBiT7s64SLQeHJofbYiDhHX87STVIzZlz7Qr8M+il+cV+T1iRJXWlWRpVnccG/RafU+7uB2xY5WHIkjE6PyB+sf6B6jBY7A31Su2v1xNp7ccZYyWlxB0DSzpq6Z97PJvYdffLSee9k5zKDPAKezI52djJYjRF3oGHOZG3HuoAEKPTanANnWrOnCeOyfoI6+t3JMyGab47MJBsG77TAbv4JLxe3d2+cwtjpdoKhkrTqYEbe8V2sTSB3siyasGy8CSxUHEFHYlQwaC2IdF03jk+snwM50hUhovsQuW3VMokgX8zDfrrrBSnlk9HWWQbwKa3dUi4ziP56QG0TVxacmnIB17bP8HeDVQ3tP4nJYUle+R46hzLhSOcqnHBgdQSwCcc5RzdILJ9tmlbPZZhs26lVZQdPH97xIK0L/jAFo3pEH/8YDluNwH3uTxF4T/AGxaQd1dKOJPMlsmfuEa/RrJbOVxaIxSqNhrZuyrMUCGvCGe+GIr9LOgDATEqHpf8OMhELKIE27P3Zmh+WkZ2IhbtlZg2ogp6ohSNCJ4sPpf/D6cXcqgKoJ7I9Ds4deNMFE6jgxqzW65/vCKb/ic567xvdcV3tVIB1J7M3L9PWjEBDzILNnx3HfG66W4C5c8zKIne6AR02YLkQjh/h/YNYARFdssHk/D6WmKymI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR06MB8515.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XmUw3u+NnU6MKBeW+0/Tyivv6PA1DaEtQqRDe1sobs7d3tfXJe0SrWQ750bu?=
 =?us-ascii?Q?lEafUiRQ7MO5lg1qRt0yJYm4Fj9YxnTGjuxq+cuyiGRwvp9Vj3aHVVcAkxI4?=
 =?us-ascii?Q?e29cvXTqqI4jDZ/mMZloxoaQO8gaATOyVP0sTmR+EUQyi04orkw16bZsKexb?=
 =?us-ascii?Q?w2h7ogQVLRij2YFu69zNopbXx+4lU/ijc1w95SuCTA0JtZfT/PSjwJvMPqtP?=
 =?us-ascii?Q?ju8rU9iPTXV0sUTUww3ItGTSQ1wJ1TgtevhI982FEQLxGaB6WNKp/CcbAaQ5?=
 =?us-ascii?Q?xolnTEliMaFucFs0MWuuJOOqqkr5wLfIcVR2v1T26YTL4AhPXuyQhGXAEY5I?=
 =?us-ascii?Q?UtxTdbcJjmK28mfsV3aAafNnfjq22biQb88REOgV392CyPzlH1Mdux3axrrm?=
 =?us-ascii?Q?zVgD3CDw9T5qBgS6ivVbBjth2l9d0401KgWxBBNZIqBxMXte8h0xkJZnGsYe?=
 =?us-ascii?Q?LQDo63OgG1j6eYKRfSsI/cTKFkdVpWWdKBM3OjRUiTQR23APF7Xx5xikhaTG?=
 =?us-ascii?Q?Mjn/FX+0cFP3O0ksrnduppF7TjpE7IrWUE0YT/62pB5vE89p0aR5VehU6gOj?=
 =?us-ascii?Q?BZcZtNVCqJnqIgfT4gOeeoR2oH9+cBKy6kf1gckY/Ri4IxQjY6JhKieT9Zmk?=
 =?us-ascii?Q?6el1FGee5dkeVITODgnK2N5XwDLXGFV/8aC21X67HYWFHtYbpqi3uIpm33UH?=
 =?us-ascii?Q?uMO67vyIPAneOFCui1Ebq2kkT3PaFaKjGtgNwFEgOTmUIcVm5lVO9a9YOr44?=
 =?us-ascii?Q?35FbbjFn6PuwWmhiN6BeA4XVmT0tAMmDGZXVLcOPG3LUMSz5D/xjPpeJvmMS?=
 =?us-ascii?Q?adY70RAAWEJhGAl3Hz5ihhbdbgmG5W/r4qJAKyKFbyG7LblR/bnz/lA5KCpu?=
 =?us-ascii?Q?cz4vEB2wRxE5j9Wks5FddK5vlGT1Yu5ifGZSHf5g+IQZxPqr4zBo5WQuhnlu?=
 =?us-ascii?Q?yPQn2TgfurSMFfVZj8mlJ3gRx7YufAR9cbUDlfvxwhm4U1qBl+ZIPOpv319M?=
 =?us-ascii?Q?4fxwhg9+KBXllGEZ0mLvJDoEjQWPf2t754B/EFdChFaNuQBrNeJ7fBj4L62d?=
 =?us-ascii?Q?fMFhb0OkG1J40co6855tfMNY2EV/x33nzgicoNSqk0nCC3zyOiwrxSBjbbgx?=
 =?us-ascii?Q?dOUL/MZQqFFBri1bcbZdfAuY7W5rxfSb4T2hB55LlhqYutfi/yDZm0gQe56r?=
 =?us-ascii?Q?XxroE6mpujQveLRAlQ6j87+PgMdrgKo7RVh4Vr2kLegtH3Ktmz3xZHq8xoS4?=
 =?us-ascii?Q?D0avC2FhmUJQgvhKQzTgyb1KoWCVzwecsLveRerKOkVjPqvJn1U+ldvnKx/y?=
 =?us-ascii?Q?+//9vBv1u3yuAxNx3UN/GNjaGzot2bo2tXjaUzwG9CP94eB6+SlbYk1e1wzU?=
 =?us-ascii?Q?iKSLhG6tt/O2lzDHklXdhFFQugrkDBjK2fnQEvZyASq0xa572B0jc0nK/VQm?=
 =?us-ascii?Q?KI5Z5xtqTLUZwKGArheWlwzUQEYS8xiUvPVf/qFqgcOdRzQFxo27aiEvTBF0?=
 =?us-ascii?Q?dI/mlHtO22ZrVOR6vDlj79liKx0nIyUScomX70L0xe4g27TElTVqWwWcbM6a?=
 =?us-ascii?Q?E63Eo93zp6aR7pvmfaDYlUFAIwk9CUK5a25i7VG7p0PGdUzPyQIPZaRzPnpg?=
 =?us-ascii?Q?oA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cae8116c-e13d-4b0b-f9f7-08dc5d3f9aa6
X-MS-Exchange-CrossTenant-AuthSource: AS1PR06MB8515.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 11:31:34.1794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ezFdQ8RzWCHataQtQ3N075IQ0H7ostizkaWQn+rAe0mtB3FrpWq9ZnHLxzWZr9BklqJp47pYMfm8yG0Z51R2vPHmjK5uKNl1YmpCq9tnaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR06MB9147
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 11:31:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109957

From: Eero Aaltonen <eero.aaltonen@vaisala.com>

There are use cases for build time cli tools, so include support for
native as well.

Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
---
 meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb b/meta-o=
e/recipes-extended/docopt.cpp/docopt.cpp_git.bb
index 87eed4b656..ec0b4da935 100644
--- a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
+++ b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
@@ -26,3 +26,5 @@ inherit cmake
=20
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[boost] =3D "-DUSE_BOOST_REGEX=3DON,-DUSE_BOOST_REGEX=3DOFF,b=
oost"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


