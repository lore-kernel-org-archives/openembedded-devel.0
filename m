Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2665DE77188
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 18:44:01 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.111])
 by mx.groups.io with SMTP id smtpd.web10.3469.1735929836799071494
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jan 2025 10:43:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=z6YUqTMn;
 spf=pass (domain: navimatix.de, ip: 40.107.249.111, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vsx2nTiDbzbT/KfF2MfsDgj/+ZjlVKlSm8ITwiwVBbCga23Tvjp9e9AuXzJJfDvJjtxiGoYY78YwUvR8fz+0YpTKV3v+s2qo8plaoWXh3Hqy9L29AzZk5CCCMk8aJH6FpW6jJwS9BPjLZxHJD1dSO39d34cMqv5x42hadJC6IvMMh/ULm25vWaWZ9ADi6IfYURj8L7LJUwFsGoe1juDsfLVO78r6zGdwOlpJamUF38nLBqjWvP6ltEeXtRsc8S9fREMr4iw1laE4dOZDupCplFXdOG9FkyervnQVk/+dVnFvC20zNDOnPFuqiim2v0wwVAv1nF6qi9RWP5KW1I3ZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACbGyiXnTAyZZk9jAx3VgsV6A6VT4CWefFF8d0Rk1VE=;
 b=HwigyifDtnoVHG0mAhLM1nY2eZZArxkMUYN+6WrPC5r97h/WGsVYF8s8OwDv1t2JkSSV0LcLYjY7HgC8GgzPT2ne1AZ8DWljGU6xdbZ0ocishpPpUupIvRSon2yaYIxs/NSYqA9cjsan+fPt3vjGjrQ+joLJaY2p6je5j+oKFjPT2perech+AlqR77pC8f/eaBF+AEb8zzktHVnc1+bFx67J1ms/nivGrzfJaOJ1K8AfhA5HWtAf4CxE0zl3JdXSY70PpSPMciS9miNpXv949bvgNS0VHtb4kVVmNABiLqGZUem+gTv1ySWnDeW+q6D13Nkk4dMs9/ZlIznONyuRXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACbGyiXnTAyZZk9jAx3VgsV6A6VT4CWefFF8d0Rk1VE=;
 b=z6YUqTMnfDbgnSOIDLeSi9tLbTJ2VSPdGuXh1EylP0/jgHW4ie/SOorNqbvAkk2hJI9OB67IF5dK/Iq/gUMmObMj5J1Pt47V5G6QoIW/jTHur1qwMu0WwSGxm1/2eZDZ8+OfI7U3OKipoOIJiRvyK7ExWv/vMWbNmywcInEbLWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AS4PR01MB10252.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4fd::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 18:43:50 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%3]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 18:43:50 +0000
Date: Fri, 3 Jan 2025 19:43:49 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 2/2] libtinyxml2: set CVE product to tinyxml2
Message-ID: <b0624f1eab1c90d144ea2d83e15bebd5f1647ee1.1735929826.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.45.2
References: <ac298193710dab19a082c9d6cecc0d4c0503a3b3.1735929826.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ac298193710dab19a082c9d6cecc0d4c0503a3b3.1735929826.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0339.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7d::16) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AS4PR01MB10252:EE_
X-MS-Office365-Filtering-Correlation-Id: 18a41a2a-d81b-440a-a598-08dd2c2690b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?G8cfYSEj4Bl6kkv2kpl/Is719CKyW6OAs6VkGnAPdRrFSrWGWiI5IiuANJjM?=
 =?us-ascii?Q?YiIPXMTNh1rzCuK0uihwpD8M5j6wD2mCMEE+xWZg59gJBSA0Nm92vkU6dWZI?=
 =?us-ascii?Q?Ba7bqrLFNZFd5JnQaQwK3zvmTXGdri9Gba1pI55L1obWfLwL3eAi0HO0OZUS?=
 =?us-ascii?Q?qcAhuEfpcY+jDW9UY2m+3zM73AADq+bMda4DgJsp96IY1D2/+dUgmnqwmDVN?=
 =?us-ascii?Q?TyHOdHwLkyQZPm97hBkqXczrfEf1XWlV07gNyBUpyum2t6qr38yO/Z8Sx2C0?=
 =?us-ascii?Q?tvjsQ3Wor4O2088ISbyp5z32K/Tl8V1u5onxXkqcCOunK4iPAQt4gYrbAZCC?=
 =?us-ascii?Q?l0Uwo6YHB+7JOoInxNxkkMxEObh6jsRtCgo53E6eVtsbdQv5VjdNTI+oMZNz?=
 =?us-ascii?Q?1d8zYZPLMFKj72H3E9l1fEeJgEQ14poXnrDNg4Lc57Lq/z7pyywR015IVuNs?=
 =?us-ascii?Q?moh36L6KEvMSD1ghWuk5RC8sDRk9eBCZ4BKd+yNRohcMyuG49gzMC3O+zCEM?=
 =?us-ascii?Q?wqSn8DEZjHQnaxa4KY2xfCUryZO42RU6YA8yjhSiiKBayv5d6f/NIL9fBisv?=
 =?us-ascii?Q?v+EvjTK7KPyjj3smZQK3AXPj+tBuK7K9uVhiMLFtCKl4fi7LKfQKgzqMwHe+?=
 =?us-ascii?Q?EqxkAr/WswWGn9104hp2x6sEfTpFb6ttoglzgu8KRDS4Id5R3Gd3nEKLAK9x?=
 =?us-ascii?Q?c0gQ6azwXeNYTLmS9eYEX1MYGKZ5n7gxPtGxP5AwwwK5l+L7k9wV5kN3dKQm?=
 =?us-ascii?Q?9o5ueCtwO0hEq+dpz0rIsp4j0XEq4rISZSVjGFHbmcYeV78SjaAP5ykiydUF?=
 =?us-ascii?Q?ZORifdRYYJ2dnKRAcU+9iuW7tJov+6M6Ywfe13jikrTfPqrEFeRzpy4G2IFz?=
 =?us-ascii?Q?Zgzac46ehiBcOcdk5lo9lZuDjn/uwFfc3TFFdNcs3OS+r2SsxAsUAImnkwH+?=
 =?us-ascii?Q?UQ9VOJVPD2cHvjltLLHi6vcXhKydxY8f2dN+hPWM/LEYG2oqCgAXSMf6QOAo?=
 =?us-ascii?Q?YanM+Db8E6yLyvz8lZIraA+zB/bXZ8pn+3kfoEHDzJx7dEsW8Wol5NIcYm2B?=
 =?us-ascii?Q?+CBtTt6E3Wz7q2A1e37cXuuvT0QIusb8tbQUBhcV1oIervl6bndKe1LDLpgU?=
 =?us-ascii?Q?KaBkDXh5d7JhSAMdeVe3/iISTCVgz+QR/8Pk6lBZjh3w+/GtKlboBvgupHRn?=
 =?us-ascii?Q?eHk0+kZExqnEIerAyRNVPFy4LjXvJsGkk7MnU3XfLy/6lVaGu2T+EkLLQ8Jq?=
 =?us-ascii?Q?8STa/BQhReUNYEIJDuuV8BYjdvuwd2Sz8nMaI8XNP0TzcdWhXEheh4nP99Pb?=
 =?us-ascii?Q?jzgTpngoJjCjMwEV/Yx5xJS7WNKl6WcutPV/GP9nRu5TUQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sWTCm2ndLaxbP5P2sIG+OYOeDJZ9E/khJfCEqPNOC2nC/BxXlI9uqQA/xBkW?=
 =?us-ascii?Q?H4i5Qx1K75mO4Z2cIPOlNcPP+Bsnqku8+1HYz+Wp4BmLLkGy5++9EbPT5uUP?=
 =?us-ascii?Q?v3yKVUTu3FvoXAC2kifYx9aVGG4XOn/L1bk7YOPzg8gQTxrn2WMKxFe7mpva?=
 =?us-ascii?Q?NkldhRc7SGEvFk0lnSA90niF/j4EJF9WXd2lLU2We1NJ6aB9MNvYm+UTyNOu?=
 =?us-ascii?Q?E7S49eGd0+y+s44JLmm8ZUiQgVZVrJsq4hPN+BpQZWtI35TPKABSninAOz0q?=
 =?us-ascii?Q?74LDtHvbtqO+9lEqvUplPu3bQLVTjey8Vv07Fw20YJHVE0/p6MjXqbnpKW0/?=
 =?us-ascii?Q?tXSCshCTo+fZr/X/4/JpktTvvelWBAk1CtYc0GvfIX/S5I8XliahRmguVmbW?=
 =?us-ascii?Q?HBtFhqpimhyaBudcCpdC/SUjvzxhm9gjQK0d0ACA0PuZNyzE7hVnsOV+dJbI?=
 =?us-ascii?Q?V3cpgIotXr9uMko1MvSO9EYyW/Qxb+rB018kUNHvZRX4Qtk18ajZQzz8eR1N?=
 =?us-ascii?Q?gjka7uK3es3XwPjc0HQFBNpfuik834ZMyhZ+6h2X4BSZeq5VpHqXxTFa4FiC?=
 =?us-ascii?Q?mlkZa9nV2cmRVlYvPjBuPT5sJoEhAW/kgxqVlYX74hg1g2Z8W3/fkxJK4pa1?=
 =?us-ascii?Q?W6H+lOGynmXAxXNw+bpS+obrUjTWB3DRAiv5lGauLp51wMkTLEpIdKvNniSE?=
 =?us-ascii?Q?A19lvjmAxw/qi7K4sg2dpBxcq4IPD1NBrJdqFhklw0JbQ5I5JTTdXGjJHNX+?=
 =?us-ascii?Q?rQcQa0P7QaTmE+45z0O1L8NnjCZMJ1sEy6bDgjfvK9RD1EpmafwIMh2mYwNH?=
 =?us-ascii?Q?GLTMs84zcbhuPtbNQqnMpHz8R/8CxikLFlOMJpAcFmZG9XkK8U7KAzhUTbQx?=
 =?us-ascii?Q?ZPJDHwp0LQ39taGRyDdziytVtdfDvRK4xQQv8EcsGZkQr1Nu3p/NDPj5JA87?=
 =?us-ascii?Q?pRWPtWFOIw3Mo84E5SkmDOgiVNbJ7vsn7qMNlHrCwhQWdY5OIyNxaFSoRdVE?=
 =?us-ascii?Q?PyoqbMOYlroF0vaXwF/FtLCWgaIBuZSvZPbKfhVdJPk7ODfqtbMz7cPatEiZ?=
 =?us-ascii?Q?zmzo34XIqhPlD4hYMi1MotKet5RwvpaSIQldk1zaanYOtlVshwzEUHFOuCJv?=
 =?us-ascii?Q?A7XzLMueU7HucsMLT+Y1jAK+GWAJa9KpMP0P1g1N44qCcNAOrDkqzD5XX5IW?=
 =?us-ascii?Q?ilOqivVxvsuH2NJiHzmPB0eSRx1r0wRJCWsGE1x7OfX55/EUrGifEsIdwZRT?=
 =?us-ascii?Q?9/jI/pai6p0EyncSpwxZYAuOMGzAV5l1NiAg5kLGAeEy4iPfsJXhjuPxpgJ9?=
 =?us-ascii?Q?nwbtxOM3h6rlY1X13VYyF/rxptGD/Q8G49D0qGkndnUD7V3aRP7uG7rb8LH6?=
 =?us-ascii?Q?gGO9/p93ABehEKZDk1qjJuH8eZI+DFCUa07hMCP6eCPJeDLqMnLOHtPuRZV/?=
 =?us-ascii?Q?Z6uzXKxg+4j/N3zcrgjsKiI5lJ6uVnI9TiwGNK0Au2eGizWYHyovXUUnBm/k?=
 =?us-ascii?Q?BvQs9lghZIxrSeEsZyLQ4zYAlk4UWuqVgaXewJh7Q/d5QnsC8ClzyPTUcKC9?=
 =?us-ascii?Q?VXKuC3QpHkej/Fagy7krTPKDUB2bdtSC6pd37q7SXQqhEfLoamWQcGCtuoXH?=
 =?us-ascii?Q?Qg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a41a2a-d81b-440a-a598-08dd2c2690b5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 18:43:50.5774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eIaLB4yblSB0A1hbUvMrz0JARlyflm4Ey6Or/vYPYyRNtvv5N8/H9XJaqAYdDRYxJtpZkj7r4M3MzS0OVilvHneVcz2wwvlAvSpaNjwUEBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR01MB10252
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jan 2025 18:44:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114629

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

This library gets tracked with the product name tinyxml2:

https://nvd.nist.gov/products/cpe/detail/5A6C04CB-E6AD-4740-882A-34620AEC06=
0A

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb b/me=
ta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
index bcd309282b..2ee43ebc03 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
@@ -3,6 +3,7 @@ HOMEPAGE =3D "https://leethomason.github.io/tinyxml2"
 SECTION =3D "libs"
 LICENSE =3D "Zlib"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D135624eef03e1f1101b9ba9ac9b=
5fffd"
+CVE_PRODUCT =3D "tinyxml2"
=20
 SRCREV =3D "321ea883b7190d4e85cae5512a12e5eaa8f8731f"
 SRC_URI =3D "git://github.com/leethomason/tinyxml2.git;branch=3Dmaster;pro=
tocol=3Dhttps \
--=20
2.45.2


