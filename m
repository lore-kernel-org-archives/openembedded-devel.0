Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D80C5472E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 09:41:21 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.99])
 by mx.groups.io with SMTP id smtpd.web10.49387.1724665272924471758
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 02:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=gWJgmJ+U;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.99, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cqEtYJEPDnXKoyjYBlDDrr6T5EJFibisCq/e5EfRhMMkRkSsXqKwmRBUeUL42FHqJqpT/Wd5Pscwk+BxTF76jLiAStgwVyZ5wRDwtJsGIkH1BiZoOC8GJtg06U5gNPhr5HjnxQYKCujSUgrbYekT1magTt/HUWw9neexhAuO/HEBMMhIYfprbKOXReVdzEe+cYhpbgFRLb1nU+v+UsuS5OGnCTwWU5Og2JBpJHfrBKQ0BS1ZlKXNKeREKXXWAeo+fXjRfKAdDnsJDSEKmgcLS/PFrqYxTiFvlTLhstxhXI8RQm/0LiqgkW7u+OAE7gwtsl9+WiBjeyMFqPYOwaUL1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jtx1YAhQA5AkFH7vYwJZSgI2DfXYHLgcK3TMuqAhD3E=;
 b=NFUHIFKP6fTIQeQ9mgtk6tUph8Oe1R0QOtaNXSJagAjbzFF4OWajRj2h/WX4OzFGbLavD0tKQVIulJ+u0XTWexZwadl9hGh5F9boc7N/fa7xI0tntnrKDdelB73IRalPGcXMCqU7iE+Q0mTZpwhSoeoPrwVBa/5J/JIfa6d7thmkNI/00LBQVNUMLFpgenYW9k0GWtmFPUHRkgUuKSPs+ZKkskQSXhwZbchfiw8iFIQjKK5Z5kr3WN3oBTlopQbDj+JWCEPpAYl+xjA4+2oguCBVZIIDo8LwADpAq6wP6NdC21ajALkQBkXFRg4Jp6IEI491MlejkKBWoP8p3i4ufQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jtx1YAhQA5AkFH7vYwJZSgI2DfXYHLgcK3TMuqAhD3E=;
 b=gWJgmJ+UPVfAtyZRstWjhqsbsYtNOM0wOwCq776/V0C+JiuUZzKn8zjslfj2wYrxFIVRcu/3K/qZPiSD1FAyM79Ulat3ilNZ7F3wn5UQ/GudM92XvNKS2+AwfZ87iqRlD6U1XYTC19hc5dVGbDTvGn8XT/B4TJjDKeID5JPuGCy7DLgb+PadgNOuD4pcFFBLz25UX/JltJxbrtVwlntaWDuJI9A2za6spBY7vNl6ufj4NN/Qt6pIjK3K36dzYFLtdJhJOuvg9A07C8yf7jnn3fvj1v/KM1LFTa9O5M4Njd0crmsoKmA99QRvMkHhg64UUu0D3hXd1ozuWKQngxqO8A==
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
 09:41:07 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 20/21] python3-smbus2: Fix LIC_FILES_CHKSUM
Date: Mon, 26 Aug 2024 09:40:20 +0000
Message-ID: <20240826094021.2744296-20-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: fec4108d-0a33-4c50-a433-08dcc5b33241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?odYq/F67R1ug8K23/uSATriSJi4Q4B1gi0/bJ1kQi4twhlQs9DafN00dfeXo?=
 =?us-ascii?Q?xwLSu/SMnnDHnQZbiI/XoBBI9V0RiBj3pBbovgSK7MGvkYxJ9upsNY0tCSDA?=
 =?us-ascii?Q?iyykEdvZTI10F4DJ+KektVPYfz3AUyR/vM0ceQgG9lRMzxa6The4ys9U0NWC?=
 =?us-ascii?Q?Iu+KR7aGuw2CtXnG+zbl4Dysj3u2fSedNtSZWyYN2F/oz8hUBg16TNaTn5iJ?=
 =?us-ascii?Q?EvNn1r2jU5fpGpZAaXmhjPdsNDVsGIskkceZlFXcmFg8U2g4jRqB1cJgZ0m+?=
 =?us-ascii?Q?nFPTyMcyCn4Wd6JaRUxxiZPrP8HrILSbhD9S720m2LfLQFc79iwAdez0ByQo?=
 =?us-ascii?Q?MgmxMq9HiqfaemacyxqNOZsMxCoa24cz/WPRHmFsj8+8UcE2Nk9qpN3g1Qbw?=
 =?us-ascii?Q?e4fu8ybsfH4wQJz65Haqq3XaE8JTjyOEL0L3B0q6iLiBU4Fp8tnQSFqtd1ZO?=
 =?us-ascii?Q?OoaxUiwKQJ0QSgCoPdz//UergR0ynLXFz8uQfUvd8wnhXpQxJl0hHBe9O9bt?=
 =?us-ascii?Q?/2ptgyB4XfQcqcOQp1EpR5DZ/A8yQ6eWPaLYBwVX6/Re81Nx1qfTZVB/SisG?=
 =?us-ascii?Q?h+xGyAD3iI+ISv74WJBcvlGAu/DOSl4R18VF6Oki/FKbbbo7C3MvQZmojS/p?=
 =?us-ascii?Q?4NhN+7l8uTc0uSycAxwWnfKO9olQI5NQuy1M13EOYY2UoZ9+SoZmTFuq892m?=
 =?us-ascii?Q?uAD1b0LelJJjLMuo/01Gf2CcopqV1DpIVq2/J5eVOI9nY01WPgOWDiQczur2?=
 =?us-ascii?Q?JWzpQxCDSdc3MLIlNIrTWosYHw7L2AMzYvxA4Q9urK6K/SQrGwOatC2pWn3t?=
 =?us-ascii?Q?L1xldjn0eSqUkhj7X2sFV73ZA/AsCLXy799Ha9oGCyOcfikHAn8wlPhMEKgm?=
 =?us-ascii?Q?P8xUZEHakYV/kF9UKnYr1ILLj4APTsEIkTrzuAkeVme3xcUEWSHT88n4ju2z?=
 =?us-ascii?Q?HAXI6p1p/VGSCSR5otAAlC0HL8foco7XrmI00L+snBVjHnHLbwpCbocVoHnh?=
 =?us-ascii?Q?i43QrkSIIgUmQNtAGWZgM1izlpgix4sLwWrVEHlXE956NmHIxNcNJxpCh42A?=
 =?us-ascii?Q?ENB/OGyLTb6xHBUuZzNngGeiz9xxjw/ycXFEA3C9tXWUE8SuZWVYfAByYf/v?=
 =?us-ascii?Q?u1B5cOeT7oTjlMWBJwS+VHkjyOgJOoT+nJ2fcXGbx7GB63LZh/Q68uPHTFlh?=
 =?us-ascii?Q?fYn/3LRYfBndj3p4WwZilwzIRMf8CQ7Ggh6OOAZdhtYzcnsWtSqTWxF5uTZw?=
 =?us-ascii?Q?5WkwTRZ2tvQ5J5JNO1roGcffWgq2zLqcc/H6im1swY3InEpmIt2x0wEr96z9?=
 =?us-ascii?Q?g1BskY35VdPWXBYV4PPNL2p7O3SU0+Wc60H88GLbB/hMXzP4ucK+3O4XB+bO?=
 =?us-ascii?Q?+xMXzw8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sdbdB/u6DbT7ctE9iI8NWs/wYR3k2e0LEOdEPjYVaQEnBpGwV+uki7C8DZZO?=
 =?us-ascii?Q?HU0F+kFHOsuoPXR2PgI1OL9gFbEGi9ARC96UW4XwREpXpcKt7frgW0r2eph7?=
 =?us-ascii?Q?jZQSdvjaRksFDmyo74+Na/zwsQVQoNWdhiAqyr2GnoDAHUUbPq6YGkFjoLuc?=
 =?us-ascii?Q?OKg5khOh/QipG0r7s35f7yGqxti8hNPshXWdcgJX9KGm82w5CwU8RLxRoBTc?=
 =?us-ascii?Q?4hwp26LtaI/50jOUnPcBixIAOantDtwLneVmRgUutUOphdgGPpA65EC7l4F7?=
 =?us-ascii?Q?yvny7pSaNsDlsPoYIxpHvqV3IO+rizXi2W3UTcBUO9YEM2KO5hz8uCBFwM0m?=
 =?us-ascii?Q?sDkqxoI/v1K+erpIcUNYG0Q1NRHL5h+NrBOcnQymRozgWLkrsX9MdNnYGRQ0?=
 =?us-ascii?Q?I9a2lTRXI71/ZxuPy8AORT9yC2UVXkLTmMKMkU0SR9/T93afCTK5CISnknMN?=
 =?us-ascii?Q?eWFU7sv85lhWBsccdQxUQRZZ5buLSnGmWe3d0dWRGMT8LX0Fj09nefPGNsEO?=
 =?us-ascii?Q?M4J+csGCyzPHV8dWx5s8O2KPkL8ebY4RMIiF9ZuXcB5PBo8FUX00oJWwdDCC?=
 =?us-ascii?Q?5D98en/sCfIX47lwolFgibx36lAg03pbZYZvfVR4kbOOTfh8hEp4pbhPH7cF?=
 =?us-ascii?Q?6yhWXwTdk0C3iS6UhUqcrDsEQveMSgAqvETRNL8Y5GQyUcAmwM8kz8+0qDuK?=
 =?us-ascii?Q?fKhIoweaqeVpw4HTkoPC7h7/Dkd0U7MBXv9fIg86OC2cs0RR2I1y064KdArn?=
 =?us-ascii?Q?Ls3U67cy5vlhhPPp9upnzrLV8ZNtWTSDLdSmO3SNAsVKYWa2h1yWy/SZNNPt?=
 =?us-ascii?Q?GOgzvVpGNyRzdDLc9OeJTcPrVIAJ09712F9fPyLZhddm6nNHhAve5Gp/3gD0?=
 =?us-ascii?Q?BPAEXNsSUcTp9zxaWOpfb34SACGwjIbDHZ6ild7qvlvfVYvFjRGNScsFlEvF?=
 =?us-ascii?Q?p6d+qUYeyRHDR8A6YKgJwG7LSBy+pqmZCTTluszV+aYC0v8HoAIvvq1yqsNA?=
 =?us-ascii?Q?bTYxNx5BkdztpxPq89UeGmhFroE0Vve4uez9zoeDC0BY7Aks97OhIoIDgVq7?=
 =?us-ascii?Q?LUOz504KINrRq7L4U0jsVqu3pJ63WtCV7bqem/sTp7J6RIfcDRU6SZpN7NrW?=
 =?us-ascii?Q?BtkCM4cnSlYRxaloscUkHxGUlsDmM0eoJmBQpzKw+lbNemhbjftzlpNMznHh?=
 =?us-ascii?Q?28myd+LyWmrDakz7dXTqm7tXiWv9pt67v/LlapXlXWu1BErSYXxuonAoHLcx?=
 =?us-ascii?Q?uowd0RLlo3TleOmOZ1sLBKpAe7LwypeLKw1kv1gjMMZg50mLn8bcQjTNQyTn?=
 =?us-ascii?Q?Qcq/4nW50cusHirh/rJLzZkIwi/vXLDdWSjUYAhw5TSRsVtJI8PxY63mevz8?=
 =?us-ascii?Q?JYaqhgJFtBXSlEzyAJOp/xbE8Cb2te3ZTHHrKBKU5sALbO9sTf4UZQwjqRn1?=
 =?us-ascii?Q?b3hPJF5eOx9VsqLdrD+OXYhiCq3aPWM5zpexvNQosD1xH+yY1T+2yrN3hjpa?=
 =?us-ascii?Q?bQcfzYev2lv+FQBTILhD4ISIUeQ/9GHn7Hin2YlM69ejKlnJ+kRPnpZ/Jzko?=
 =?us-ascii?Q?GvWa1lIsGLPsSM2pmxjRciaEH9nEPxVUAcxiYjFlRn7DvP1Ldo44wk3c6gBU?=
 =?us-ascii?Q?oQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fec4108d-0a33-4c50-a433-08dcc5b33241
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 09:41:01.5320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7QyBF+KXGMYLeSB8NiBJMXpm/parWYO30abnCbzl/f0CFGWuPN0VxL8sL8sh/7psZYQPxE8Tac0Bjb2LAO+G8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9581
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 09:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111961

Change the reference to the MIT license containing LICENSE file in the
downloaded archive.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-python/recipes-devtools/python/python3-smbus2_0.4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-smbus2_0.4.3.bb b/=
meta-python/recipes-devtools/python/python3-smbus2_0.4.3.bb
index b54cdb005..779562d04 100644
--- a/meta-python/recipes-devtools/python/python3-smbus2_0.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus2_0.4.3.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Drop-in replacement for smbus-cffi/smbus-pytho=
n in pure Python"
 DESCRIPTION =3D "smbus2 is a drop-in replacement for smbus-cffi/smbus-pyth=
on in pure Python"
 HOMEPAGE =3D "https://github.com/kplindegaard/smbus2"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2a3eca2de44816126b3c6f33811a9fb=
a"
=20
 inherit pypi setuptools3
=20
--=20
2.39.2


