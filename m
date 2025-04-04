Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4EB1C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 10:54:42 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.113])
 by mx.groups.io with SMTP id smtpd.web10.8467.1743764076838542480
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 03:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=x7HZ/EpB;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.130.113, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DotrCz6TV2OF7PhSXckk4EFWFDrnCYKlP0EbUQ+WSwcCM6ymi3PO2N3rnZ+DkbDQpQlm2XJmBiPsi/odhXuXt2suSt8q8uKlKTsohGRiA0V7viye4Zmfbo90ZoyFljjUzMlF2WgyybLaKCsypIJV5gFF9i0KgIG/nR9qF2lC8Cbh9u9lG8UM5uEy389cd15IPjnxiiTS7y3HNqFqKsOiM87dfNZjvtGxMsJ3hb1KFaOm8F+Kiolt4W/2OA456hq3JHrqTX/SiZMugijbHNl6SMO7gExIvwWFiiiUipewkAe2rrN9cS2ztkfC/QFQ7rMwYNj2+dYvnXYSDe+NUhJvaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXDvXRgOIgu7DE0O9neAwltCfI+SSalNDESHFX/UEgE=;
 b=N3upXkgdH47c2Rb2DnJQTuonglS8J14pd4TxX9jpgdbtK2Fcvio0onp9+1qbLyG7x66AgOUQf8eySnZAaUYfkf0d2hCdKlYf8ebFe/S4Xl/eWUvYHfobc5zGC1UE28j+Do3LF8Jc7WKsXlK2aaW0Aih44BcyKZA5EQZ377SNUQJWXAMQH6Ppb7sOgxRczylXd8UaB1PtiId0ILp61e12JztV8jsGJReslB3tfjNn4JDhyOA0eicoH80/gODJDww8Lb4XO8/RaJBNHj7O2Amnk6TVyOJ57cSJhrN/04LXQZlL0g4dO9yGK9dKn0xByXqyaWmhUIAZ6pI/oW2uPNq0ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXDvXRgOIgu7DE0O9neAwltCfI+SSalNDESHFX/UEgE=;
 b=x7HZ/EpB5FQs151PvKNekRyG66eSqfqvRwpHDMbQpnoomLHXDTf8DMZ6dEQzQ7LfXJcY4WCxuClOqs1YocXUYQvpNIj8eWu/9MHC4IbQCrOsXFWmNajoXTEKRj6DwKBwdMebrtVItf7VKZmwyVITbrAaie2Mw2O0RpwOXlLMkyFm6Ntbiwq6OuEbq/t0wodqIXw9RaxFVtKXUPOqePiKeltiGQ2qFDm9h0jQkd64zEE7DhuDUfF6GAYMrWYDu0vruyke7UA3M2V1eItmGXtwnjX1jR1ZRKQr1oJleAN5c5vCn43rNoUiZFRfuYo+HiEqGksZD0jVqhnlC9wANtUdAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AS8PR06MB8167.eurprd06.prod.outlook.com (2603:10a6:20b:3c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Fri, 4 Apr
 2025 10:54:33 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 10:54:33 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v3 01/11] dbus-cxx: Amend dbus build time dependency
Date: Fri,  4 Apr 2025 10:51:40 +0000
Message-ID: <20250404105150.870898-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0133.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::38) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AS8PR06MB8167:EE_
X-MS-Office365-Filtering-Correlation-Id: aecb263f-a62b-440e-4863-08dd7367151d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ymxY4H9lTxyCjqvSWXlfVpvV5yf/smeBBoXoBSk/pr7xmMjlMQzXDrwAatac?=
 =?us-ascii?Q?Vp8vFH3FPI+ypjBIbBYNBnXcTvA/Pcft/gLPh6X2HgO/Iw8N3J7TAXB7zZ5F?=
 =?us-ascii?Q?7SJ2hv8XIqul3zO2M6v9SuG5i+8bjhCDVfngM2eDT27Xo6EMwgf6EuVgzikz?=
 =?us-ascii?Q?IGfcSn/LRP5/+IT7fMhzev/tvrGCp28unIYHosIaAd0X/9tZL9Bovnd476gm?=
 =?us-ascii?Q?TRSA5bdbDw9dl2o0BjkfWacsCoZy7apG4T4b5XPfNYbxEhpozHT5He66Cdll?=
 =?us-ascii?Q?wKw5LXZzCA51cSJa5qo89LqL/fMorj4L/o8rjr3NtT1brQwQuCWgOzxiLjlU?=
 =?us-ascii?Q?kHhCHAdeks60qOSGjf/7sJUqY4dP45TZYk0rIMj5ImWoOHoY07FrNrOAhH4H?=
 =?us-ascii?Q?HMRpZozOIZNnuxjyuJ1q1yaldcdZ+zYrHuRUvCdhNSBGGaA7XDGQhyps8Xej?=
 =?us-ascii?Q?XqRa7Okatczzv76CujpmaxiYQGUyZpt9mQ4YHl47uJ0NgTu46s/j5WH7YjlB?=
 =?us-ascii?Q?q8/A8Hu4zgdr4M8BSxI/IlSLJa3xqLTYtXJ3n+4sFf0vkpy94NMJTYWksQkk?=
 =?us-ascii?Q?/UcmH+3TbvVKjdxRMA1W+dY7+DV+2MLTrFP0NH2TDrTMqwFD8FTq+B0sNvY2?=
 =?us-ascii?Q?FZIMf28ZbZv3zd6cu7PeRdemn2+deoHmI52ZRZYe8eVFXVQvaybaLnUWAQVm?=
 =?us-ascii?Q?1VgTfouVGhB0yF2z2QUJEVF6R/LhKmUOrIWekQ5xZj3njIv+F61RRpodHcGF?=
 =?us-ascii?Q?rxCm+tQaBcAuo6TXGyNk/pubxkKExeojqyOQq9k4T/AcSD0uA56NtTtEgVZn?=
 =?us-ascii?Q?JbOLacjfDTVJsmHyeGSGu5L/O/l7eO/dMA6uKV0tazUIUZdHqJKfGB1Tb4yn?=
 =?us-ascii?Q?K/aJMA2FTqRkGq3llw2Jk2xlH2uG/XRcD5YGtrqSzIYJN7ezpFy2H2H/Lwh9?=
 =?us-ascii?Q?dWy84tY9FhvLw72AN1Ytzp5kr5LTW5PAyIXoG45POEm2FRWYQZhkVkGvHhEw?=
 =?us-ascii?Q?C4TvLSOEZc0OnXVXzhKJXqOdTetPq7DoBEJAmmQYsZbWYZfZhrpOVfFvmU0V?=
 =?us-ascii?Q?xs+uqE5t+TH73aw8qrD6Rie/rTdY4xDsQYjd+yg4B6PR4nZCfnaZq8RKkpKf?=
 =?us-ascii?Q?9DmrK5bAH/bABDJw6Ze8i5VGi3QA6phzOjRErURdSveqaR9kLj7RGYvG7rr+?=
 =?us-ascii?Q?mdJ81bSHicRp1UDcpBg70bzQ525v9PSaIsWFQ9McmfIzigxkaABNFWuf98gM?=
 =?us-ascii?Q?d8jVrnPPVu0+0lL5MYfDGVdBibD0HAQjFvl/Y9Y+oSvSeq0hDYUMorKtotgn?=
 =?us-ascii?Q?JPvxuWWQxaB1DYOw1DTRJREiBiJC3mEB2RTc9CKH995d8PCbR5PI7Wa3vgH8?=
 =?us-ascii?Q?WTq03B/SRzzHWd5vcXR2BnD+JdT4vZHiBkdovX+d0fQnoAPE7RJ3KLZu/HgX?=
 =?us-ascii?Q?cNQakB1V+vZUw+N45wp10zymbgY1fKik?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fytd1VmocyCdnmED3aa74sWINa6lLLf2OPHaiXB0a6JKo3GxB3eklL8XAU0k?=
 =?us-ascii?Q?pvM1om3de18jQ0z07gFHnaia+UfA2fVU1e5/GD5+pZbiG/KcozGOdBDie6sU?=
 =?us-ascii?Q?L6qwHPQXa7bTzsPeIhIUwKsdBgkS/fVCFvcQv6skWd5G3g+eMDncwZDkqy6s?=
 =?us-ascii?Q?V5v1RWcuD84dBj04OyMH6NRyGBEhVglUMqhSnGpx/BGFQnADHybJdQu3/IiB?=
 =?us-ascii?Q?trEnpp2VYfyHRwzJfTsOstLe8VgU1fKf7vxyZy86gXaFab/rLK2o0YoUw7kK?=
 =?us-ascii?Q?Jb+dSA+jetCsgUrswvKziSJlSiIkuwU3ZjYESHihxwcLr91jbDvtZtI9rTun?=
 =?us-ascii?Q?NGK463b4s/QbqwRlz9ICBwmSatzJ/UBRSrUQ4j3xLFxcczAW6PrmfLuwG7iV?=
 =?us-ascii?Q?HTl6wL7lqpN9z57knD5tk+IlsDetOeLImf9ljjkroe/yRNP9TSaIOWRCBJTa?=
 =?us-ascii?Q?Lcsu8i1Ed/R6QedP2Fl8aFlqwSrGXYRPcA+UvUTaArxalUJtVuVGlsC9w70A?=
 =?us-ascii?Q?AZVx96QB7IJMgqgP9gwcSznbhGBxJZHn8QZJHfXFAoyzAEO73hZ1mVv+NW5q?=
 =?us-ascii?Q?l8HLww1XBzeWg0q+wGihS2GYrUNNVwsl1BZciALzEuVTY53FP3n0f1aRlEQq?=
 =?us-ascii?Q?QlUp7HCrUwhShRfcJPXizPwEvIw5mZ2FCNTDFwV2nG5kYgHo4Cx4R/94IFSC?=
 =?us-ascii?Q?c8cctWtHi/PFxRFh7kaWHIIKFVanU997BbmblFeWljnUArywIV00BdTWo7QL?=
 =?us-ascii?Q?BZgVF4D0KQqktPd89srt/FzNkLaeGfOtbuWPHDJ+jcegqyW3ioSNtvSlZ8E+?=
 =?us-ascii?Q?UHqWiPBHhAzKF/6v6ctyq6WOJexP1Z8ZDigFpdEMNcvv5XUhqCOsmpYWk5mf?=
 =?us-ascii?Q?CoKj7uCB/N8FN/ETG6cW6LXIr9s8jdGkETHa3TDiEfBHux6v24sv7l+zzkWQ?=
 =?us-ascii?Q?vxxngWP5V8oCmbIgWBguuo0OwGcXbiMQz1fgwDm2jJLZISYbbWNqaizEFs0s?=
 =?us-ascii?Q?irg3o/Z+PF78yazgWEMM6c6+k27dkHaKYEvpUZxekGEkZekGbPelz0gfWda5?=
 =?us-ascii?Q?E31ZTf/PLqaWFvnpLMu/sf/C389brnfM9/tzsKGqcWWYu9fup82omkWL81ah?=
 =?us-ascii?Q?o5BMGAWPlkch8FnfiLvQsqPvFOaNaFxgRt40KAgIJdsHPUUpurzAPV+bRuWp?=
 =?us-ascii?Q?X8C3NFT/pYGUmZm6ZS4KFmKqIYFGusuGgVPWath+vIp+kKErlBS9UbCIarD4?=
 =?us-ascii?Q?bobuXNy8o5a7BOiJXOLCkqjRMrA8ohNcZMqrs7f097wK8u1TF3/IdDj88EJX?=
 =?us-ascii?Q?wmCVVCr/dCa01BBF+GUvBzQR42KvjJ9L58gATq7/f7H3uD18fQrG7CdChpkU?=
 =?us-ascii?Q?a/yBKVNgpfZpLKdTWrnToAGLTP9shqWVhA+cFlgwVSUqcDAtWAw9qaR2o33n?=
 =?us-ascii?Q?/yddmGMOmRipf+CALT7XhhcMdF+3w+Aj96CrdYsPCQVTLFiLJ7h6SC68QXVl?=
 =?us-ascii?Q?4B2oC691e1SbtS1HVFHdcYEH1/K1APZllR00WNN79WMnb4pN44/SAwnv6/2R?=
 =?us-ascii?Q?6q8NgkyF3HYIWcci3YV2CoUk1TOJ/C9tVkqJtmzWMv/yC93G7H8huc6l96md?=
 =?us-ascii?Q?KA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aecb263f-a62b-440e-4863-08dd7367151d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 10:54:33.0658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hlxui7kKB0+2+3RW0pNTXvB9g1/G49pOmz7CnpY5963YrmlCDk8xmO3y8Sfd/iNdJRAUfAUEueUZ6wlgVjZN+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8167
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 10:54:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116574

The build time dependency seems to be particular to the 'tools'
PACKAGECONFIG option, so update the recipe in this respect to
reflect the state of affairs more accurately.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb b/meta-oe/reci=
pes-core/dbus-cxx/dbus-cxx_2.5.2.bb
index 05bce6b903..3282e4dcf2 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
@@ -8,10 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D24594f493407a4c=
d401ce9794e0b9308"
 SRC_URI =3D "git://github.com/dbus-cxx/dbus-cxx.git;branch=3Dmaster;protoc=
ol=3Dhttps"
 SRCREV =3D "f2637e726207ecfbdaaf02744e1b36e54f929c9d"
=20
-DEPENDS =3D "\
-	dbus \
-	libsigc++-3 \
-"
+DEPENDS =3D "libsigc++-3"
=20
 RDEPENDS:${PN} =3D "\
 	dbus \
@@ -29,7 +26,7 @@ PACKAGECONFIG ??=3D ""
 PACKAGECONFIG:class-native ?=3D "tools"
 PACKAGECONFIG:class-nativesdk ?=3D "tools"
=20
-PACKAGECONFIG[tools] =3D "-DENABLE_TOOLS=3DON,-DENABLE_TOOLS=3DOFF,popt cp=
pgenerate"
+PACKAGECONFIG[tools] =3D "-DENABLE_TOOLS=3DON,-DENABLE_TOOLS=3DOFF,popt cp=
pgenerate dbus"
 PACKAGECONFIG[glib] =3D "-DENABLE_GLIB_SUPPORT=3DON,-DENABLE_GLIB_SUPPORT=
=3DOFF,glib-2.0"
 PACKAGECONFIG[uv] =3D "-DENABLE_UV_SUPPORT=3DON,-DENABLE_UV_SUPPORT=3DOFF,=
libuv"
=20
--=20
2.39.5


