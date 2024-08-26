Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00DBBC54731
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 09:41:21 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.127])
 by mx.groups.io with SMTP id smtpd.web11.48817.1724665270076341150
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 02:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=uTKkd7KC;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.127, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xy2+fAd9KbXnZ5NLXukU1KKJOohZpBRSJAgRP6Opc2tY4IgnK6oYj755gGhL8H3YjW3n31W86qhOPP4OEiQtn+Qjb9mDqaASWg4jzhS6ICDgqRq4ASJCJ1ptjrg6cpMUj5HbGL1kI+zLTeUbQSHp5pDTjB16ia1iO8VWnHUCongjimUdnHv/ajvS+s0uH0NP4W8Ehl/D2upxnYJkPijjimCdnZWT322R0xuSKUH0tYTCavmmT/MMOaDkxZRdJi4Tl9Hf3Z31Z5aH29W13iz8Th/Pon/RDgpGI+SLzdfWFzS/LTW5Knk73svjtmtuMuU37oagHaPeDTtyBjpiWqmcWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMgUGlj87n8aXJYdSdFdv8P/W73k2QnrN2SQB8g2VnU=;
 b=Cac+0MbDKwjbYVWLLecve5CzpCGVdAaUHKixlx0ipQmO0yJtPVpOVSVqxyqowrhNGHzrvstmDKJoR20yTWg6RNlsvsb1I1tJduSRUv1r1wNZ8m0q5T/bFcjzBVTeAfQNmOUHz54cuyQMHWLFm0Qg4c+KYm+Hzhaky20bgtc1tP2M2yPdnEe2KGD5E7QKzSVhqM1sdGBBiZFzQYHK/S6VO6leKjgOGphqme8z6DnVzTFfXERLuIxtwlYCY8faGDKSzUobx2lzl19Fh/pX+lkFVg9evAZEbK5kdg3PCi1QJlfkYri+O3q+YZIwsHG/Bxaz3WwQbwUnOD/dHahRCkgQKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMgUGlj87n8aXJYdSdFdv8P/W73k2QnrN2SQB8g2VnU=;
 b=uTKkd7KCgAEo+6zf1Ssqf+tVqvLrOpsjZIZMrkfWjn+i9aeKbZUML2H8H8m/XDnV6CIXKSftytKVo0uLkswYZNuU5t4ezJ0o8ROIRkiT+B4mwHu/vxQGk0qgTZxmN737xU0xO0FtHwnzPZ3bLpYfh1/aOjguAlMoNpueWXEoJGhIeZlHsCPNtVj/du/jTPHEdrCMu7/jOKKR+VunouTK63uXccnOpSgTS4jO0BD61tWejAnXjQa8bHx5hQa5XOH4kw6PKQA5KJweojMzXIkG7Db3m0AShdx4dCMyYpJxyrYw9ZPJ/CPhdnTlFvb1FAoz5jvzFERPGtdCSKthB4Iadw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9577.eurprd06.prod.outlook.com (2603:10a6:102:44e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 26 Aug
 2024 09:41:07 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 09:41:07 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 19/21] python3-libevdev: Fix LIC_FILES_CHKSUM
Date: Mon, 26 Aug 2024 09:40:19 +0000
Message-ID: <20240826094021.2744296-19-niko.mauno@vaisala.com>
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
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA1PR06MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d6aa9e-eac8-4b78-b998-08dcc5b331fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?++XdvI9Nf8BzyWSXJbpT1ZLY35nQjk83WRwoNlSQvdJ8kFL23upSdyF8Tl5u?=
 =?us-ascii?Q?8XNS0oda0CACQ0Ggj/La5toM14JJfWdpTM0y5AoH7k8GWBFFDcNntRT1nbWo?=
 =?us-ascii?Q?8qL9pU6w6TOO5tSjYFfBwvuCdstNamCZTFF7Ct+k5siIuIxgu02EW5ZvMlPH?=
 =?us-ascii?Q?pxL1dN31vnjfI/+ynG5COR1GUGvoCneZtbB0bI3Z/zDeoWrhoekyQ7GFbMqX?=
 =?us-ascii?Q?UXYgsb+tIDYX6WdeKPV26YTCWTXcs1bJQk90L/4ofN+pABX8wLTu2/7R4lFF?=
 =?us-ascii?Q?tvOjjU8J07vE0FWUEBAONRdIemlRi6opYuQUnJFR/2DJHpj8mQZFi3x51s3u?=
 =?us-ascii?Q?/6mch8acjnjF2DrAsFugQRSmMUggsicXiiZdMiuRXigCmbUonFYetejw554a?=
 =?us-ascii?Q?+E3Vl2bmK4xCehVO34lWyVvq1fMk+Y/NvHJVVUccxErNxwmTGaoMdMFrMRZS?=
 =?us-ascii?Q?vMCcG3me8p9ehUWvU8XMXhTvUqk7rYSOQVot8xxsuDms7f70pujFx5TDXtwD?=
 =?us-ascii?Q?UDZIVHknnyKT/VVfJmCNeIAwElj2HYJ8snDDHM41Jex4xdXhsPvXLamDPWmi?=
 =?us-ascii?Q?/NUUolt8G+58m7ZY9d56AQ1sLo9Jx9rCqlp9an1IJ0XRtGjRyOHQDadcAQRR?=
 =?us-ascii?Q?cxEtOghx/99oUrAlokmKH5OPNs3klEwfcVfK8OJGw8qbtJDThXEE/Yeu5Kjk?=
 =?us-ascii?Q?1/mORZboPx5XunZXhfHTj3gESyECuUijWsusxvavV3R25xEhEUrgyWZlPVEF?=
 =?us-ascii?Q?1Nh50HcdIAySN+W6YqKW8Hht8nSoBRdju96H5hNTiSp3OCVjakXWr4GNDL56?=
 =?us-ascii?Q?1sKKSl0cjL4uoK7/xAgN9u2r5PI9rRR7jI3Cp4/9yE9bWPY3mTR8OzIac4bp?=
 =?us-ascii?Q?NgoxBsfZt3p9eLWOIpPU/RVaQIKfSFVQ+2Mfiv8VgNj6Q9u15P05yECQjD/e?=
 =?us-ascii?Q?2bowMExn2zRJugTCZ1BAWDIKmXW8UbiyME4RbRj4qkDPjQxMgBiE/K43ldtC?=
 =?us-ascii?Q?iRjGPdvcgxdaPRv5a+j3OrLMhDmyg81WNrRPxPLB2vyBIDPrBQN7iZDU8qfD?=
 =?us-ascii?Q?OKnqn7Ms9U3qs/RCUMkj+nkiNXHm4RlicMrQKb8AIdOQlt3Cng4LquSyQoZD?=
 =?us-ascii?Q?/IeSLgDTxw/S5F6r8Czw/GK2USHcmMeJdnMnfoHGXz/GEAnQODBRjfpYaUHG?=
 =?us-ascii?Q?F5h6JQs7e5o4h1t0qPjloXML85y1zKa0gRFPyTzHrSqpN/7Vp8PgBfYdRIWT?=
 =?us-ascii?Q?yPiFAfO0BpSErv76J2croWDzrx7631QoEIoLulDgtBfl41yZWk6pYGMS7tLc?=
 =?us-ascii?Q?9+VgVtTVovBjrOYU3s0okEl1F2W26DGx8GyBgmU+PQhlZ5oflfklKV61/nmX?=
 =?us-ascii?Q?Bjxcglo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SUDvKUaBXTL9JAk97B+cUNQ8CAOoOKk2npfRIA57W9muGhZTur+4PW75X4/W?=
 =?us-ascii?Q?uuPk5w7XaWDUIK8tYejpmweK9G8g5tmjyPxkmwsAbM2y4puvyMHa2xROdz42?=
 =?us-ascii?Q?PaSN6hdZs0taEq5oLQ96txRRHX8684My+Vq1rsje9v6xCUTroUv8ZZ6wUxOx?=
 =?us-ascii?Q?nbo8bkZHnX++I4HGanLELoVbgaCHUt8DayzXTPfD6WkP0fSJ3xLI/lAJLSzc?=
 =?us-ascii?Q?xX1LWlaDb0vs5Cm+Ol9k+l/EBhCCmEs6aPZjY0bOUf1nJgoklXDTvPLoUWj/?=
 =?us-ascii?Q?7YDrYfq1muGrvRP0NfIv6lT8FJrGouD3t3o6Ug6lOiLgC+O4kmUcdcxNsw7z?=
 =?us-ascii?Q?4pSZogMKL0ohk0u9T1YVXXIeks5huxlApm+AxTgDc0BClrK+HWNNyaROnb+q?=
 =?us-ascii?Q?kkUTpQyLa27YQfopGZWKUJJziMuRtPS7DW+JAD9YUuj+MfDVqfrFlkS7VdKJ?=
 =?us-ascii?Q?ZpHn+/PNsJkKhBqMF4d9iugCO4W1QumC62e+HvXTyLss/+cl7ypCQisUWEEu?=
 =?us-ascii?Q?sRtQEUuFsAMwNk9nFqt7EmzRk0a7j8ZFr403cYeLRluVPESeqglAQTHMz6Ei?=
 =?us-ascii?Q?l8ey92EDxpp2+3wBMt1McLvBGM0AO+HD+tNucfiazvkM9Jsm9GHKPt2a+joE?=
 =?us-ascii?Q?EESvGclPdOJPpzVZ1d5894DoVEOmcU7rOQcKjEmjhUqZyMxRvuSBec5IK8e9?=
 =?us-ascii?Q?RUB7lBtthOeOFR4cb41aClZvhn4sGosSdnm0SJqym8jNJPfGdXWZMafpUWBw?=
 =?us-ascii?Q?9bevS8N/K7koaUfO7420jlkUrC8RY4//EftFS/vaHcQfh0z+gpX+lnBldqa2?=
 =?us-ascii?Q?m5zQng1lwBEb2UpcXWq4MRQwMIMfwpxNyvhdHbcdJ13izQP9CiEkOOaQk8hm?=
 =?us-ascii?Q?xoBV9MQQrXORsmNwfZ+hgsHpuckzlRzjksO20a6GisCGMkPh6cb0yrYfhRIS?=
 =?us-ascii?Q?NPUf4yZ5GG88yYqdNDLxrMfOw1aO2qFW6EO0IA6BLA8RUDOQYOdz4Y/tLZSr?=
 =?us-ascii?Q?oJ62uHwUOu31gWlxQuwZ0gS9CkM/QSGluVrMFPuejbod7ucnCQOGxwjx6Yrl?=
 =?us-ascii?Q?q1q45G5OuHBlfYrjYYZUy1EvlI0xCv6/0qGUMTNRW/PvwD0/jyp2ECdFHkUg?=
 =?us-ascii?Q?lmKOPMOWuarhPquyIGHRvu+YHJJIlBmAZ/CUTisKzQGAIaumP3GoLzvXavi7?=
 =?us-ascii?Q?3CAyzEr0ABQPu+ITXTQ219+jb8AEYNQsFUVmqjK2Re5QQVl8p2uzx1n3DnAk?=
 =?us-ascii?Q?A5ASZ8GN/GeJQK9zUDJMD24h+12M5m9yyoNoedAtxQvdI/EP0o+k55MjUpzd?=
 =?us-ascii?Q?v/moUeC7zaY20SL+zCASwHAMrHVN2sNKjB2MMR1+/9O3VEa2gpN5thxBGrxI?=
 =?us-ascii?Q?vB1JC+O2D2nKkOVhvXyz2b+EmuNv2OzSM7eSCSPeuHvdy3mgFt8d2qSHg3v4?=
 =?us-ascii?Q?Y6/o0ST9B+kp+7nJNw/tySuXEWKRF7wkRjqgLegivd3Xb+HMzRQm9DtlGskj?=
 =?us-ascii?Q?bVoI1ZN86IuvsIlqwtqUqXm/rt9lg0/+Ct7u9G831VbCA9UTfQsl6rRXqdHw?=
 =?us-ascii?Q?Jw/foGlXH4lM1+Q45HgxRSTuDzwJDl7CAsEb0zkh1HO9JcoiqGJ0B1lrXBQa?=
 =?us-ascii?Q?Kw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d6aa9e-eac8-4b78-b998-08dcc5b331fd
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 09:41:00.9767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2Pq7srbYiqsZrbC1hfwSvfWCdOf2tvzr0HYv3g4+BwMJbwKDpAvokV4CK7mnU2kQzLiQ5ZNGqiBay0UgJ9XCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9577
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 09:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111960

Change the reference to the MIT license containing COPYING file in the
downloaded archive.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-python/recipes-devtools/python/python3-libevdev_0.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-libevdev_0.11.bb b=
/meta-python/recipes-devtools/python/python3-libevdev_0.11.bb
index 27e336710..5ad2a5995 100644
--- a/meta-python/recipes-devtools/python/python3-libevdev_0.11.bb
+++ b/meta-python/recipes-devtools/python/python3-libevdev_0.11.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://gitlab.freedesktop.org/libevdev/pytho=
n-libevdev"
 SECTION =3D "devel/python"
=20
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd94c10c546b419eddc6296157ec4074=
7"
=20
 SRC_URI[md5sum] =3D "34b48098c1fba26de79a0d67a17a588a"
 SRC_URI[sha256sum] =3D "e9ca006a4df2488a60bd9a740011ee948d81904be2364f017e=
560169508f560f"
--=20
2.39.2


