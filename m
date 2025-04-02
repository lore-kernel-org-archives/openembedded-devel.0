Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937ABC36014
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 10:31:19 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.103])
 by mx.groups.io with SMTP id smtpd.web11.4913.1743589870249213268
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Apr 2025 03:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=J5KC7YUU;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.159.103, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adhij6R/Ux6tPeS+dkbYVTm6axxQf9tPY2ckugIv6yx3Y2RNzEN2ULhVvlLjbW90Nn9NX4jdT7SMen5tEd14M4LGxWhU0EzKpRcEQCfNH2AB5N7K9j8J2eC2xMsD6DSl2bHoNuwRw+UNZdntvl2rt8DVBI2MkS953lkYjyHOb4QW2ZRt+zHdrSmt4KKZEc0gxqmIWNbwpYwN51I59MB1h3OOwNiCEjHmD1rBnUZqe4V2BqSbq9pUyg6p6H7bQ0Woa0v1ZgV036OewqZVf3zqYmONX5mcTF9XJLgxFLHhOgC03s7E6FhZ3tLTsMgWPUdWgQnIE+HO86t1oPBVJDN/bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lDV2gMxWCHiAHmEpUdyowdYaKuuUvwUekL7d1TckzE=;
 b=jD871nx1O0Qfk9RMbDM7/rblg+9uiyMGF3VSuqffrIrFqFuKUi6UgI7HHv/UBCPb48xNIvJxSBsE4pHhzzxaJiXeuD+isq58Jedj3xi+lafeDYLO541F7L4kkQLHWYnw5hYzuHiLPW11GXxhJLYKZGjz9koNlmNdvNTmkxUbG17chp0tSIOEPG6BLlIy9DO7YmDcnNcF1o0UZ9s58GF77o+cd6ZKDHEEHo3pBu6/LgTBP1OhtoaBaH1j2HOhVdAuEsImfOx7m9oRGd/ZDgInNWG5IIbJ2KZPjMnj1YYIYvGaD7Y27xyRalBvhvBGoWF1uhkFaJWWbSJ5tZfQGKzksw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lDV2gMxWCHiAHmEpUdyowdYaKuuUvwUekL7d1TckzE=;
 b=J5KC7YUURQBLN/l86VhFFXqT0UIIPpYlrh7BG6O6+vB2HbVV0Mvkqr8hQAk1lY2C4EVEdpDismO5NwxFgWh+NmGtyIOMNLhbsvxnGLD9L6kZmoxO25eHu3uDOgWDNip9LFbeyKBc+CAYyRxqReIvrG9aNDU6gSGrWXQ7A9/D5IsgQf2bkMrHEdiF8f8JE0o3CBQRrS2zN275a/XbuKumnKJ0mpNjL31eNu8ZJmGx6NZVpX6wMaxyyRA7sAgRPrhaT20gGWal2mjexQn42ZhxgXJ0vreuQLAbJaueNcU49sNT5GVOrD/FA1kzzywajconrdQlnSQ5Eb5bsxxUTdigzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com (2603:10a6:10:371::13)
 by PA2PR06MB9397.eurprd06.prod.outlook.com (2603:10a6:102:402::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 10:31:07 +0000
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522]) by DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522%3]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 10:31:06 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH 2/3] dbus-cxx: Drop libsigc++-3 from RDEPENDS
Date: Wed,  2 Apr 2025 10:30:46 +0000
Message-ID: <20250402103047.3142275-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250402103047.3142275-1-niko.mauno@vaisala.com>
References: <20250402103047.3142275-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0045.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:26f::16) To DB9PR06MB8439.eurprd06.prod.outlook.com
 (2603:10a6:10:371::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR06MB8439:EE_|PA2PR06MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: dbe1ef6c-48ef-4504-b99f-08dd71d17a16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EIP05E9WHynw+l9N86tCbhabEQy401KOXDoI9O+WIaeKQbA7zXry+a3HEEvW?=
 =?us-ascii?Q?/TEPLsTZDOTJZS+Jm5HOAcZtLt3XMwZ4ht+c8rOYkC3xPtd6B7hGUj2FK3EC?=
 =?us-ascii?Q?+3p7ZbT0sbwvLsOnvDiU0WEHIhq1maEF+Qa+EOIh5SW/2mq/nA+pv48MrAvI?=
 =?us-ascii?Q?0osfj2Yh2lwFw8cSUN0xMeTTpcQciDHA3a2QYnqkjbX0mlOlvIuoP0dvFUZT?=
 =?us-ascii?Q?pWyg49X1TMmEFAkbAKKs/rUGrot+q2U1rhdDnIRKF5lOTUz1Lapo71nu/AI2?=
 =?us-ascii?Q?nTFHTIyOPIEk9JFi4/ByQV1vYmGpTCxVur7DzKqDk29zf6MUDreV4i8e+4Vv?=
 =?us-ascii?Q?HyiP3uHY9yKa9nnf+TI96G+G8Nwj+XHLoPI01HL7CRQqZmnI69WaLB3hkQjF?=
 =?us-ascii?Q?BNzETLO6sKXoLLGOuVzoWd64vyvSoSUaHcRm2r7FXoPNvsJjZQWfaC7dUrbW?=
 =?us-ascii?Q?CsAF4DiBXEA+C8KpLiEYAjF/nrL+AsAFDpHQXmh943ZBf8TW00h/tMufBs1G?=
 =?us-ascii?Q?w1Yh5IndTTTk3VY8tqpAlhwgIfoEO+Esab3i/fk4gTEo2zt9bXbAj7im+PWt?=
 =?us-ascii?Q?fb7RVCkKm5Y7eQABWdF7elSxTGq5qUZteEqueoO5bo5/BjRBAYgnSBTUD2iP?=
 =?us-ascii?Q?M5uLLyZemIVzXOxnW2Y/E3jfDf7NPJ0wzunO/M4IU3fh62dnyrGWAN6+uiYF?=
 =?us-ascii?Q?ezW8C9L1Pwl5bZPqZEG8JwRGEL3U9s2VjBegy7/mT7jFQv6UQjjzHQXRr+Pj?=
 =?us-ascii?Q?wOg0GsKrV2AAvHV5cAou8PqxV1pelutZCrH2or01zfYE6OYfnVYYVcaYWaFu?=
 =?us-ascii?Q?ZtNOlgGTlw6ioJfQhZBpp3wk0mEkB8ghsGzUTqyEbw+W4cjJMVvmAnsmXZmc?=
 =?us-ascii?Q?v8J+yJxFpsZdBEixwB9iK7AVbXClNnMmW/T4P72K/TxOUkIGXhvRVZprCO9J?=
 =?us-ascii?Q?fEt13xHhu0eGYOXhxIHlEp7MgskrSYQ/e3M6CBqD0VPJCQSvOH491sH5cY7A?=
 =?us-ascii?Q?jrElfStQnv9JjnHTmaf78bVU5E6NtLWNxyFpyzdnEoEUSu2U27T5KcBoBz4M?=
 =?us-ascii?Q?XAQODmfIW442DSMZlSLiis0ZpCW3Wg1eyuKgsM6se4oDOlZBVyllczzSa8U9?=
 =?us-ascii?Q?BH5XCZRmFozaJR9Ak2nPBy0wIi3E+hYG17I5fxZY+4IOEtxCqcO5ZBdL56o2?=
 =?us-ascii?Q?8CMK/jtdWmHTCMEhdxSUASEI9/dIY9gFHDpKwdLWtXLaeWzNCgD5Gq5TFACc?=
 =?us-ascii?Q?J3KIPfBB9lboT0ccmPmwWxelsS2xYasBEavpetLDBm6eSRmGujCOukxUJ7wy?=
 =?us-ascii?Q?pvt6qDCkMrFIOoaauMo5HkYat8qBRDktadFmqZQStADh7m+2VEoayZg4ZHZi?=
 =?us-ascii?Q?+TLGVHYAsN/gVhiEqlbmfsL0fXxDYxf+xTOXl2/Y5140oJBDcRJPCzVJcFux?=
 =?us-ascii?Q?GTrruzsHAyyJ6O7nBkDmGD2ATNheJwnnIv/pGQV0/7UGfpHqcZYvJw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB8439.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zdyRSAOzFblL4/nV5ai+Wiuc63w8qryIXhcfo1fRDUkxfITPmXrixQ2WIMSW?=
 =?us-ascii?Q?rzB2Rs+evHrf/G6TJeyPWQrYSYQwME1jH1+Y/Hmj7ItUu9lXQ7oqx0o6Pyop?=
 =?us-ascii?Q?V43Ovf4njN9v701JabgDK7vLgiyp8ViD/NXl8epbH6GFq5s/QLM9Xv5aqC16?=
 =?us-ascii?Q?KAGh4nT/K9SWWFB9lBCyVQwyHDhtKQHk5k4jq7wY2fNfvUGpLtawM2fgcNIN?=
 =?us-ascii?Q?9Qozp+y0Py8S5L8PnTbOq4RXVWubHvST1ZD0avE+B1bvxaX1laULiboF3OsQ?=
 =?us-ascii?Q?pKRK7Z8IMvTapDHiwYxve2spU5ZYDqvoEoNiv9rQCiWbboE+rvT8fNarW5uU?=
 =?us-ascii?Q?CBiu1ZJy94LBFVs8ToEqhhCR23r4VPnCfyx09Gc8Ff/COZu770suP/ab3GIO?=
 =?us-ascii?Q?dKiPH8Zd8WBWf0qhsaEfMZo6tjNXCLZaINb8Q526+pvwoZGap5PafHHxyZ2y?=
 =?us-ascii?Q?krqucekHGhwZF2SEEuSRvH5uqTlEaVpWPLcwCuDeSU2FkrfOYmdtSWKXHMez?=
 =?us-ascii?Q?BDp5CVSrugHPKpnnz+le82kDjwXpqQc/W9pHNsO0qI3NpkviQ6d+2famkQ8U?=
 =?us-ascii?Q?5lhICqQaSguFjLIuibNRuI97EaVhC53yvPI1uPt42So+JA3L0/56QqmuReBm?=
 =?us-ascii?Q?iX8rqkNZhMmZq8/MA3upYGbCq0mZZW9sTyWppJS5IEmKqoSvcR3f6il/TPrT?=
 =?us-ascii?Q?klMNL+uID0XOZICdONYm4bDEFJjkwWmBnGJ99rJdBfZIglXWSOssGap0tY7P?=
 =?us-ascii?Q?N2moelqnLLqJBHUZCmles8Rtzr7FSysi9Az7M8vIGLiUhNh4bRn/esq033K9?=
 =?us-ascii?Q?EkgjCiIVbS8wVvz5ixe8f+phwS6jLofeV7m7r5kqv249Aw9/Z5pgeLQfDRGm?=
 =?us-ascii?Q?kPlUF040clQXVCD1K8tnfN7fE0j2O340Hmrpm68gLLG6n28cMMYGjc9+lkMx?=
 =?us-ascii?Q?iI9m2BJnIx4PllUsvXIvwJV/JB0u6PuqKDRjhrP4Fx2V+txtIiBIjiozsSsJ?=
 =?us-ascii?Q?iSxPfKj3B4PK9FYG5vpmM0FJ5MVLzEi7NOdf8LHK568R/FjagXD/jbC6AQBW?=
 =?us-ascii?Q?kEoeQUZtpFoEmKD1tFxQl11u8yOzv6afe7FrnudWxzG+3bO7okJeVZH/1FS7?=
 =?us-ascii?Q?duzRT+PRGL0EP+PVTbwxv7pU5pX1GJnq4bE6LAMQbQHDhjj8bKuDXiuif1dl?=
 =?us-ascii?Q?YBSWNwD/5G30ENpr1SAteQFqLFf+fSStDCJJRa3jcGKZVZj0V3RSBhce5SdR?=
 =?us-ascii?Q?Orn+HwyzyVfiMdR2QE8IBHd9DgyEy3IFJ2lY1c3m4EGCg07ujmkWRYcK/mES?=
 =?us-ascii?Q?5FuiUHtaGTaxKLH+B/d+QkRfyFXsjjNZJ9UceLvSUPKJkyQTEIoArkktydbH?=
 =?us-ascii?Q?T5zYgxZ+n5WhZeBuRuFBePjOiezlsXLPofo9QutLBgdex+m5Me+2xxl3CXuu?=
 =?us-ascii?Q?6wv3X6bOS0p77JvVwE458B/4ZaruRYzikTRZzeZdtDTrP+IH0pBbqYuKpono?=
 =?us-ascii?Q?S+Bk7oLmjmURFCifI1ek9UANLpn2FGxMEfInuVHimgi/W/vgpmQMVa6LcPv3?=
 =?us-ascii?Q?mdXXqPpu/euqYdpT4dwmmJFm36fHadN7AJTLeJRNzpA0Gzt1Vy6TBjKurdpG?=
 =?us-ascii?Q?kQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe1ef6c-48ef-4504-b99f-08dd71d17a16
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB8439.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 10:31:06.9056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0BPCtC0I/DrOXcrCHHXYwx5vH5zpKos51mLjvdD0y+6noCIqUsHnhbZOub0mpYa/DL6+z8NEGcSaxShRopvSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9397
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 10:31:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116517

Since it is already declared in DEPENDS the build system will add the
libsigc++-3 runtime dependency automatically, therefore we can leave
out the redundant declaration.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb b/meta-oe/reci=
pes-core/dbus-cxx/dbus-cxx_2.5.2.bb
index 3282e4dcf2..a10f7f22dd 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
@@ -10,10 +10,7 @@ SRCREV =3D "f2637e726207ecfbdaaf02744e1b36e54f929c9d"
=20
 DEPENDS =3D "libsigc++-3"
=20
-RDEPENDS:${PN} =3D "\
-	dbus \
-	libsigc++-3 \
-"
+RDEPENDS:${PN} =3D "dbus"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.39.5


