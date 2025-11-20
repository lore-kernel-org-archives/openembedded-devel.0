Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFED1CF8875
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:26:36 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30427.1763629570098347010
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 01:06:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=fRXGemf1;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.43, mailfrom: divyanshu.rathore@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UwDb+EoZGQfomXiPy4AsDJg06QvSwHsxhyR6eX+F9U4BHq2WYVxjgkLXlvAlNswWtSp7GwRnG5Lef9uE7KW57TpyMNlYyqI1untcodSUfmwHJafRVlKnn5OsV7nSmodcC1RzxKr4om4llL26LYPI3SZ9mXxvCK56+506ARakMpR4YOU8AP5FB1a2mzwU0EXyy4FT4Bqodxy3Lc5wGA7g4ruGSxeMiR5ogGx67RHAOR8khBTVHmkfC8O/BZvT+1PRs5DWnG0s9ytKtmSig340Uqv4OJm8ManG/Gr5l1yNYHkJDUtreMqCFf1x4w2xsFQjEYGA5s/8rTipKh3l1txsKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1HErrmWz6LXOAokCOJl4GxUeCfc9cEjT3cK+A+k0uY=;
 b=W9PcZF2MmGzxCw5WFUJ999SHPdiNdg+3i/Em/mTXkNbyYYIFRe9KVOlqQx8No0RGEcS3qdpR9+cLjmN0/nOU6EJS6ia5dRAC+C/O+dC/t9Go9PlCCFd8fXpKiU1H7MTiMHYjCjAmeoLdys79cIw9S5sSBkfvJ7Q7AKpXwt8eMtFr7S6OkOLYHW9rhDV0raXpZz4RrHYRR5+dNtMd42Ll3U6KqEbi3SPDUjIUAL0mYceANAszjfsc1YCO5WKC3MbEHnsOP7ewNeWtjmcJeVEpDnD/czuydeuvvNS6M756xptFIX+MN0Conz4JVwsWwwJ7q9AC949+d0HrZUDBW8Fbfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1HErrmWz6LXOAokCOJl4GxUeCfc9cEjT3cK+A+k0uY=;
 b=fRXGemf11MMMi/G6zwwX6O8uoOnmUsnlFcivXCd8X2j5XcXJU4jzLFGUELhecJW7ONSyJ65Xk3AaZo+wEdytN9721hYBKO909OJ4mh3F4Rf3HRnvu1BreoIzJsH2v7gB73qED2NUHLuOQBEpSdzs1NCJg8YbJEKbJV6l++pGwyo7g9GOmXYEQUS/RnW5553PHGiAWF3ODJjSR9heDHonJ3WYukeopp8e2RW72C9wYOE7loL8ow33NPytOk+Ud/9Gf6gZZ9ieusiJiZnmlbV7bwNEP7n4NL2tGcbrPCpKL41JBY7VBMle0y9zElqhJdaeEvIwe++9PSuwN0BaWUGU8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:143::11)
 by PN2P287MB1004.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:134::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 08:50:21 +0000
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483]) by MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 08:50:21 +0000
From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Sana.Kazi@bmwtechworks.in
Subject: [meta-oe][kirkstone][PATCH 11/12] ImageMagick: Fix CVE-2025-55298
Date: Thu, 20 Nov 2025 14:19:58 +0530
Message-ID: <20251120084959.51761-11-Divyanshu.Rathore@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
References: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
X-ClientProxiedBy: MA5P287CA0130.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::12) To MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:143::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3378:EE_|PN2P287MB1004:EE_
X-MS-Office365-Filtering-Correlation-Id: 532b9fd9-c399-4679-7586-08de2811d64c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?anNBiMY1c1lC/mpeMXYOQoBUiseNmkObxlnjmSIxwEDcqj82qJJ3GdfoXX1x?=
 =?us-ascii?Q?3b2nHTFd6LWLcGujHL7q5i2ZYgz7Z7DssIQZCoDd7sdavEEH/3IpQAYZ8i9t?=
 =?us-ascii?Q?QK8/fMvkKNvTtJHSqBDKx6mZ1AEGIUvMxHi15uA2STgqXTsD9Cu5vBkws9ig?=
 =?us-ascii?Q?698dMsZNTLg4vMmHV4jR+8qZnir+QRRXbk6KGCcNUKg15D4es58KfCsrDjI4?=
 =?us-ascii?Q?X+kuluYi93kVIH4reNna0NCo74ZyOoiSHnbuy0vA5wOpb2BtEWqVC5Vz2J/l?=
 =?us-ascii?Q?KXymEMpCPITwx+tuiaWSCp1pSfVqVosL77fV72FC5j/sZGc3B8NJ4HobT92S?=
 =?us-ascii?Q?rnEpnC33VIeCkamnjizd2wbVGnqbTEzIXl6QntXPMkTyD7ohVxY9HnEHZBxV?=
 =?us-ascii?Q?fL/CCWpQcXFZ+WKp/rx1sD536yGTIB+J3jXWYPCM6GcxYm2Fnv6uglZxopL1?=
 =?us-ascii?Q?QUw5joud8fqvjZxoV8xnh2Ps43brnUa56Nfjx8zZCNSxW6hd3BlF50ake0I+?=
 =?us-ascii?Q?bCPU+NWKibxj29U7LtnnFHqY/Rw6BzU8KZrQagBNi5lRSs2YzAm8LcSKIJJ6?=
 =?us-ascii?Q?EjeLViFB5KCivWzQeA5PXypl0Y3JpahXz3BbM2fm2DF83BpWmYv9O76+zWSN?=
 =?us-ascii?Q?yDeU20APgoJngdc9yKI0JBxawXx6A5VFLZ3dnrI1qRgESL2lbnwiErA/uLqY?=
 =?us-ascii?Q?f3+rFfxTVotcbNjR6CYaD4io1tRBNHGIlJMuFItMAilCCYtWu1S2hQ4IYtfy?=
 =?us-ascii?Q?82fwTa1eZ9NxueUmvMmARDR3TDN6ZMgBAqJd5TqAhDrI81jxiNg86U1lB4G8?=
 =?us-ascii?Q?zDbUyVgCnJRZy6TOGaNZ0HUQfsPQ7Ti7Ia1ztvc25reE0820zMZRu3Y5pn3l?=
 =?us-ascii?Q?KgqPqCSHALhjNdGWRH8CmIZPZc67CTdqd0dlwEm7a1umlXLP+JyiHftsnu+6?=
 =?us-ascii?Q?hhejFhRwnxhrLPTSSveLWiWZ1sg1gH8M3X12KTTuGZfI5FX2uRqjy4BPULE5?=
 =?us-ascii?Q?s9Rz+3Mr/FVybET9VA8xgGmOetp0+Rk1VGcgF9UbGUcin5ErNOZIqt09/H9c?=
 =?us-ascii?Q?zMSOxuw3CpJ7maP9weVIDgGSxmfEbBXtfgHGpx/r5/tchh2hEzLpfVx1C+wW?=
 =?us-ascii?Q?Z4scC7JzvhGKxNm3DqECR1lx2OOZoul2EsTAZtIjkhtaR5YzPOj+WzOMmcep?=
 =?us-ascii?Q?KRuuU7X1AWjg4sYXejPhNIzYP3L3vCg+9X9HItX80BPCUXnK0aKnKZnyCsdk?=
 =?us-ascii?Q?uRFNfRMB3rCYYaWARt/GFvo3DWZccXdfMr9vL95cnbe43M5aaHhKyv+AlS+O?=
 =?us-ascii?Q?Gs6WjdHR8MkXd/k+dKplNmfF4ZL70+Ou5NSeKpyRGdqJDS1+fFRKDLFV3JDM?=
 =?us-ascii?Q?oiVIbFqMTub4NZTqcBY+pYMsJYnoJTyiiSda1QSlXHS/QclRM/eA2huiVobO?=
 =?us-ascii?Q?lBuag2KzuqIIFVrCGoI1+B3JG4GerKXR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3378.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SLpMVtJMIu0cmHwnSZsIy4dD82FPwHcWbMby61ncXvr33h97EOrL0jsTkXZF?=
 =?us-ascii?Q?i48gpE/lBO8f1URaRoa4BKvikwUC+AtaktyAGR1UbRico1BjYXPsQ28PBpaT?=
 =?us-ascii?Q?bLwun9QomSXamH7Vl/0wAXstq34bv5k1VnBtkEb9ulSc7xQFwMu7El7M1BAS?=
 =?us-ascii?Q?Oyov8AEItK+Uw70kuocuWdeM8HnC/XpCk5vY2U0ZCspWoOXUiSakHSn8fn6s?=
 =?us-ascii?Q?L6HgaQ/bpP4y7HJeie83SuuYryg5cIK8Zj/yLPRWIfh3S9IK0yCuZiKr6o+Z?=
 =?us-ascii?Q?ooBXzfygbJm2OFfgJL9c+00a6RM6DDN5aSUlXNtAnD7FjgbPdEilk5HKVvvf?=
 =?us-ascii?Q?7jD5x59V13MvwMAZfH9zAYv6AF55lY9xr6AtkFEIPNHYTIqkIqTQKV7xH9MC?=
 =?us-ascii?Q?/GXrx+1hJScSsJS0GOz1BS/Te9vWvDQHM8e7M//znxmyaq559n59AXaFsSej?=
 =?us-ascii?Q?AXvX3Ymx8xABk6iUtHtp84lv1Fe2OYcc8FpdSaK7CmOWz5jaWmn29CBl8+7p?=
 =?us-ascii?Q?ciAikzQrLucHf6MTvsxgIjdNYLaiDHpAXQByGwCLEV7f5lSzyqnl01F14vBL?=
 =?us-ascii?Q?ZPSBOkuwKxv1oKKglEM+CBcCdAOrMmBD6RgTxSn1j310Jj1kcg9/F+CeNTwr?=
 =?us-ascii?Q?Hx4Bon7nSrcOnA1NLukqCQLvelwLN+znAn66RE6JC18YiD8+FxcTXr4VwrZo?=
 =?us-ascii?Q?S57Xp7q+2OOgqTrZIY9/jh4VOv++vUIHk/3lVAdLs5MBjK6rLUsuMOjZjymM?=
 =?us-ascii?Q?eXstFpuC67bhNZc9OxifWgtVvUM3dny4ZtEM8I+cZCk4+WRqm6QjypSqL7f2?=
 =?us-ascii?Q?xXYxRCCgHWm19Ms/FyskxY8CQWw+cdfbeN/4VBuJUAsS+7gKcuiQNgk2Ypd7?=
 =?us-ascii?Q?pP0+Qk+t4KDB7Y5iaHvgXx4fbSwXxzAQGTBf7/FYCuDm+edXCNF2E8SzM+Zq?=
 =?us-ascii?Q?g/JkM4nXgJAmNEF2Ro9Csdt0yR/q4Etwlb/Bm/jBJnL5mHPAGRYfG7tfz/7L?=
 =?us-ascii?Q?4rcmNGyOTh4RTPsJH2382UZlh+5vrjbzIag3Kv2j2bnYRd3mwhle6iNOIEKj?=
 =?us-ascii?Q?68/Ka4x/SHDgAAsJxhXCmzngEbIwHvtevCrqdEBAHPpYa3mDdn6EpNONWOM0?=
 =?us-ascii?Q?DZ8t4h2cs2N4kADFtrZN2PeCaA1IS15K4b5IviJQ9KBZ1+mdwbrUAh/axcoq?=
 =?us-ascii?Q?8GmPsgMBclwYzTd4CLOn2KtFKgIZYNDyC9TSoILbGzg0ljUR6RtKkA4IA+2r?=
 =?us-ascii?Q?0chF8A46Ps5DLfGa3grxTiXany1Frj3KPTo6Eu8b20l8DH0Gak1z9eE7CxVU?=
 =?us-ascii?Q?j98LvU7FHDgHjv88cvPOydsHcKq5aofTRN3QhRdhRh8o7OuybKr/v7LtVB+E?=
 =?us-ascii?Q?r9vXwTwy67bA459aZDmdZjM6suCwRcZBifR1xAXlR/bPSyY/60mncpUAK6RU?=
 =?us-ascii?Q?hTiGbY3KvL5I6P+ulxZVuSUtxjZTUZzKv6rp3NEyKzQpfgRAtfINGRXvUBDp?=
 =?us-ascii?Q?KdQLB6lr1lfplk4D6I/mNNXDQgHUhjm+8gMbx8uBXcFYy4xuo6eJCA7UUTSS?=
 =?us-ascii?Q?T2oMAJOLHdp9JUXec/9pJi+pvH9WGt7QgjLfL1IPakXVO4gHvrZQV15xacqe?=
 =?us-ascii?Q?Dsi5R4YM7l5mEYK6h0sDeA2o7HhLwtto3TDf5nNQgP3rdIpmY7GLgmILwcWT?=
 =?us-ascii?Q?4GFpzLptf3eTdA36G0te7J3M6dM=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 532b9fd9-c399-4679-7586-08de2811d64c
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 08:50:20.9568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hOg3RQwu5v/AizKQOviyEG0Jt/9aVbN85mbO+W7vPM0iNeaU5zBMqpPGOBBfB/RZGCyQSz9/q8HNd7/3+/2MgaHUn3+t+XG3R+PRN+iwglV0QzEZbW7eHj2Vq9weF3dZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1004
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 15:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121947

Backport the fix for CVE-2025-55298

Add below patch to fix
0011-ImageMagick-Fix-CVE-2025-55298.patch

Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
---
 ...support-patch-1-to-fix-CVE-2025-5529.patch |  49 ++++
 ...support-patch-2-to-fix-CVE-2025-5529.patch |  58 ++++
 ...support-patch-3-to-fix-CVE-2025-5529.patch | 205 +++++++++++++
 ...support-patch-4-to-fix-CVE-2025-5529.patch | 103 +++++++
 ...011-ImageMagick-Fix-1-CVE-2025-55298.patch |  71 +++++
 ...011-ImageMagick-Fix-2-CVE-2025-55298.patch | 274 ++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |   6 +
 7 files changed, 766 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0011-ImageMag=
ick-Add-support-patch-1-to-fix-CVE-2025-5529.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0011-ImageMag=
ick-Add-support-patch-2-to-fix-CVE-2025-5529.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0011-ImageMag=
ick-Add-support-patch-3-to-fix-CVE-2025-5529.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0011-ImageMag=
ick-Add-support-patch-4-to-fix-CVE-2025-5529.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0011-ImageMag=
ick-Fix-1-CVE-2025-55298.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0011-ImageMag=
ick-Fix-2-CVE-2025-55298.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add=
-support-patch-1-to-fix-CVE-2025-5529.patch b/meta-oe/recipes-support/image=
magick/files/0011-ImageMagick-Add-support-patch-1-to-fix-CVE-2025-5529.patc=
h
new file mode 100644
index 0000000000..d4bd7d6acb
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-suppor=
t-patch-1-to-fix-CVE-2025-5529.patch
@@ -0,0 +1,49 @@
+From 11f9e946dab3f2a4de68809bab9c01be2967bb08 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Tue, 11 Nov 2025 14:34:12 +0530
+Subject: [PATCH 1/6] ImageMagick: Add support patch 1 to fix CVE-2025-5529=
8
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/83caf59fce695fea0c5878e9f0d0b65e662cae66]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ MagickCore/image.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/MagickCore/image.c b/MagickCore/image.c
+index 34804e522..849a89931 100644
+--- a/MagickCore/image.c
++++ b/MagickCore/image.c
+@@ -1640,15 +1640,15 @@ MagickExport size_t InterpretImageFilename(const I=
mageInfo *image_info,
+   char
+     *q;
+=20
++  const char
++    *p;
++
+   int
+     c;
+=20
+   MagickBooleanType
+     canonical;
+=20
+-  const char
+-    *p;
+-
+   ssize_t
+     field_width,
+     offset;
+@@ -1656,6 +1656,8 @@ MagickExport size_t InterpretImageFilename(const Ima=
geInfo *image_info,
+   canonical=3DMagickFalse;
+   offset=3D0;
+   (void) CopyMagickString(filename,format,MagickPathExtent);
++  if (IsStringTrue(GetImageOption(image_info,"filename:literal")) !=3D Ma=
gickFalse)
++    return(strlen(filename));
+   for (p=3Dstrchr(format,'%'); p !=3D (char *) NULL; p=3Dstrchr(p+1,'%'))
+   {
+     q=3D(char *) p+1;
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add=
-support-patch-2-to-fix-CVE-2025-5529.patch b/meta-oe/recipes-support/image=
magick/files/0011-ImageMagick-Add-support-patch-2-to-fix-CVE-2025-5529.patc=
h
new file mode 100644
index 0000000000..3550a4abba
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-suppor=
t-patch-2-to-fix-CVE-2025-5529.patch
@@ -0,0 +1,58 @@
+From c02868456edccf0dd555c3d004efb491974c92c7 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Tue, 11 Nov 2025 15:17:32 +0530
+Subject: [PATCH 2/6] ImageMagick: Add support patch-2 to fix CVE-2025-5529=
8
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/66dc8f51c11b0ae1f1cdeacd381c3e9a4de69774]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ MagickCore/image.c | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/MagickCore/image.c b/MagickCore/image.c
+index 849a89931..3437ed358 100644
+--- a/MagickCore/image.c
++++ b/MagickCore/image.c
+@@ -1650,7 +1650,6 @@ MagickExport size_t InterpretImageFilename(const Ima=
geInfo *image_info,
+     canonical;
+=20
+   ssize_t
+-    field_width,
+     offset;
+=20
+   canonical=3DMagickFalse;
+@@ -1666,21 +1665,23 @@ MagickExport size_t InterpretImageFilename(const I=
mageInfo *image_info,
+         p=3Dq+1;
+         continue;
+       }
+-    field_width=3D0;
+-    if (*q =3D=3D '0')
+-      field_width=3D(ssize_t) strtol(q,&q,10);
+     switch (*q)
+     {
+       case 'd':
+       case 'o':
+       case 'x':
+       {
++        ssize_t
++          count;
++
+         q++;
+         c=3D(*q);
+         *q=3D'\0';
+-        (void) FormatLocaleString(filename+(p-format-offset),(size_t)
++        count=3DFormatLocaleString(filename+(p-format-offset),(size_t)
+           (MagickPathExtent-(p-format-offset)),p,value);
+-        offset+=3D(4-field_width);
++        if ((count <=3D 0) || (count > (MagickPathExtent-(p-format-offset=
))))
++          return(0);
++        offset+=3D(ssize_t) ((q-p)-count);
+         *q=3Dc;
+         (void) ConcatenateMagickString(filename,q,MagickPathExtent);
+         canonical=3DMagickTrue;
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add=
-support-patch-3-to-fix-CVE-2025-5529.patch b/meta-oe/recipes-support/image=
magick/files/0011-ImageMagick-Add-support-patch-3-to-fix-CVE-2025-5529.patc=
h
new file mode 100644
index 0000000000..63e88ebfd9
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-suppor=
t-patch-3-to-fix-CVE-2025-5529.patch
@@ -0,0 +1,205 @@
+From 19073f73f83c78a1fed8f040ed08b16ccfc817f5 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Tue, 11 Nov 2025 21:53:10 +0530
+Subject: [PATCH 3/6] ImageMagick: Add support patch-3 to fix CVE-2025-5529=
8
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/82550750ec8f79393b381c3ed349dd495bbab8a7]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ MagickCore/image.c | 134 +++++++++++++++++++--------------------------
+ 1 file changed, 55 insertions(+), 79 deletions(-)
+
+diff --git a/MagickCore/image.c b/MagickCore/image.c
+index 3437ed358..cd4de6df9 100644
+--- a/MagickCore/image.c
++++ b/MagickCore/image.c
+@@ -1638,34 +1638,41 @@ MagickExport size_t InterpretImageFilename(const I=
mageInfo *image_info,
+   ExceptionInfo *exception)
+ {
+   char
+-    *q;
++    *p =3D filename,
++    pattern[MagickPathExtent];
+=20
+   const char
+-    *p;
+-
+-  int
+-    c;
+-
+-  MagickBooleanType
+-    canonical;
+-
+-  ssize_t
+-    offset;
++    *cursor =3D format;
+=20
+-  canonical=3DMagickFalse;
+-  offset=3D0;
++  /*
++    Start with a copy of the format string.
++  */
+   (void) CopyMagickString(filename,format,MagickPathExtent);
+   if (IsStringTrue(GetImageOption(image_info,"filename:literal")) !=3D Ma=
gickFalse)
+     return(strlen(filename));
+-  for (p=3Dstrchr(format,'%'); p !=3D (char *) NULL; p=3Dstrchr(p+1,'%'))
++  while ((cursor=3Dstrchr(cursor,'%')) !=3D (const char *) NULL)
+   {
+-    q=3D(char *) p+1;
+-    if (*q =3D=3D '%')
++    const char
++      *q =3D cursor;
++
++    ssize_t
++      offset =3D (ssize_t) (cursor-format);
++
++    cursor++;  /* move past '%' */
++    if (*cursor =3D=3D '%')
+       {
+-        p=3Dq+1;
++        /*
++          Escaped %%.
++        */
++        cursor++;
+         continue;
+       }
+-    switch (*q)
++    /*
++      Skip padding digits like %03d.
++    */
++    if (*cursor =3D=3D '0')
++      (void) strtol(cursor,(char **) &cursor,10);
++    switch (*cursor)
+     {
+       case 'd':
+       case 'o':
+@@ -1674,93 +1681,62 @@ MagickExport size_t InterpretImageFilename(const I=
mageInfo *image_info,
+         ssize_t
+           count;
+=20
+-        q++;
+-        c=3D(*q);
+-        *q=3D'\0';
+-        count=3DFormatLocaleString(filename+(p-format-offset),(size_t)
+-          (MagickPathExtent-(p-format-offset)),p,value);
+-        if ((count <=3D 0) || (count > (MagickPathExtent-(p-format-offset=
))))
++        count=3DFormatLocaleString(pattern,sizeof(pattern),q,value);
++        if ((count <=3D 0) || (count >=3D MagickPathExtent))
+           return(0);
+-        offset+=3D(ssize_t) ((q-p)-count);
+-        *q=3Dc;
+-        (void) ConcatenateMagickString(filename,q,MagickPathExtent);
+-        canonical=3DMagickTrue;
+-        if (*(q-1) !=3D '%')
+-          break;
+-        p++;
++        if ((offset+count) >=3D MagickPathExtent)
++          return(0);
++        (void) CopyMagickString(p+offset,pattern,(size_t) (MagickPathExte=
nt-
++          offset));
++        cursor++;
+         break;
+       }
+       case '[':
+       {
+-        char
+-          pattern[MagickPathExtent];
+-
+         const char
+-          *option;
++          *end =3D strchr(cursor,']'),
++          *option =3D (const char *) NULL;
+=20
+-        char
+-          *r;
+-
+-        ssize_t
+-          i;
+-
+-        ssize_t
+-          depth;
++        size_t
++          extent =3D (size_t) (end-cursor);
+=20
+         /*
+-          Image option.
++          Handle %[key:value];
+         */
+-        if (strchr(p,']') =3D=3D (char *) NULL)
++        if (end =3D=3D (const char *) NULL)
+           break;
+-        depth=3D1;
+-        r=3Dq+1;
+-        for (i=3D0; (i < (MagickPathExtent-1L)) && (*r !=3D '\0'); i++)
+-        {
+-          if (*r =3D=3D '[')
+-            depth++;
+-          if (*r =3D=3D ']')
+-            depth--;
+-          if (depth <=3D 0)
+-            break;
+-          pattern[i]=3D(*r++);
+-        }
+-        pattern[i]=3D'\0';
+-        if (LocaleNCompare(pattern,"filename:",9) !=3D 0)
++        if (extent >=3D sizeof(pattern))
+           break;
+-        option=3D(const char *) NULL;
++        (void) CopyMagickString(pattern,cursor,extent);
++        pattern[extent]=3D'\0';
+         if (image !=3D (Image *) NULL)
+           option=3DGetImageProperty(image,pattern,exception);
+-        if ((option =3D=3D (const char *) NULL) && (image !=3D (Image *) =
NULL))
++        if ((option =3D=3D (const char *) NULL) && (image !=3D (Image *)N=
ULL))
+           option=3DGetImageArtifact(image,pattern);
+         if ((option =3D=3D (const char *) NULL) &&
+             (image_info !=3D (ImageInfo *) NULL))
+           option=3DGetImageOption(image_info,pattern);
+         if (option =3D=3D (const char *) NULL)
+           break;
+-        q--;
+-        c=3D(*q);
+-        *q=3D'\0';
+-        (void) CopyMagickString(filename+(p-format-offset),option,(size_t=
)
+-          (MagickPathExtent-(p-format-offset)));
+-        offset+=3Dstrlen(pattern)-strlen(option)+3;
+-        *q=3Dc;
+-        (void) ConcatenateMagickString(filename,r+1,MagickPathExtent);
+-        canonical=3DMagickTrue;
+-        if (*(q-1) !=3D '%')
+-          break;
+-        p++;
++        (void) CopyMagickString(p+offset,option,(size_t) (MagickPathExten=
t-
++          offset));
++        cursor=3Dend+1;
+         break;
+       }
+       default:
+         break;
+     }
+   }
+-  if (canonical =3D=3D MagickFalse)
+-    (void) CopyMagickString(filename,format,MagickPathExtent);
+-  else
+-    for (q=3Dfilename; *q !=3D '\0'; q++)
+-      if ((*q =3D=3D '%') && (*(q+1) =3D=3D '%'))
+-        (void) CopyMagickString(q,q+1,(size_t) (MagickPathExtent-(q-filen=
ame)));
++  for (p=3Dfilename; *p !=3D '\0'; )
++  {
++    /*
++      Replace "%%" with "%".
++    */
++    if ((*p =3D=3D '%') && (*(p+1) =3D=3D '%'))
++      (void) memmove(p,p+1,strlen(p));  /* shift left */
++    else
++      p++;
++  }
+   return(strlen(filename));
+ }
+ =0C
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add=
-support-patch-4-to-fix-CVE-2025-5529.patch b/meta-oe/recipes-support/image=
magick/files/0011-ImageMagick-Add-support-patch-4-to-fix-CVE-2025-5529.patc=
h
new file mode 100644
index 0000000000..65739cbf44
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-suppor=
t-patch-4-to-fix-CVE-2025-5529.patch
@@ -0,0 +1,103 @@
+From 3b5f524f80851b819bcbfd40e30912af3710ef48 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Wed, 12 Nov 2025 11:35:37 +0530
+Subject: [PATCH 4/6] ImageMagick: Add support patch-4 to fix CVE-2025-5529=
8
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/6c7c8d5866b9c0ce6cc76a741e05b9482716101e]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ MagickCore/image.c | 31 +++++++++++++++++++++----------
+ 1 file changed, 21 insertions(+), 10 deletions(-)
+
+diff --git a/MagickCore/image.c b/MagickCore/image.c
+index cd4de6df9..1acf8edbd 100644
+--- a/MagickCore/image.c
++++ b/MagickCore/image.c
+@@ -1647,6 +1647,8 @@ MagickExport size_t InterpretImageFilename(const Ima=
geInfo *image_info,
+   /*
+     Start with a copy of the format string.
+   */
++  assert(format !=3D (const char *) NULL);
++  assert(filename !=3D (char *) NULL);
+   (void) CopyMagickString(filename,format,MagickPathExtent);
+   if (IsStringTrue(GetImageOption(image_info,"filename:literal")) !=3D Ma=
gickFalse)
+     return(strlen(filename));
+@@ -1670,7 +1672,7 @@ MagickExport size_t InterpretImageFilename(const Ima=
geInfo *image_info,
+     /*
+       Skip padding digits like %03d.
+     */
+-    if (*cursor =3D=3D '0')
++    if (isdigit((int) ((unsigned char) *cursor)) !=3D 0)
+       (void) strtol(cursor,(char **) &cursor,10);
+     switch (*cursor)
+     {
+@@ -1682,9 +1684,8 @@ MagickExport size_t InterpretImageFilename(const Ima=
geInfo *image_info,
+           count;
+=20
+         count=3DFormatLocaleString(pattern,sizeof(pattern),q,value);
+-        if ((count <=3D 0) || (count >=3D MagickPathExtent))
+-          return(0);
+-        if ((offset+count) >=3D MagickPathExtent)
++        if ((count <=3D 0) || (count >=3D MagickPathExtent) ||
++            ((offset+count) >=3D MagickPathExtent))
+           return(0);
+         (void) CopyMagickString(p+offset,pattern,(size_t) (MagickPathExte=
nt-
+           offset));
+@@ -1698,7 +1699,9 @@ MagickExport size_t InterpretImageFilename(const Ima=
geInfo *image_info,
+           *option =3D (const char *) NULL;
+=20
+         size_t
+-          extent =3D (size_t) (end-cursor);
++          extent =3D (size_t) (end-cursor-1),
++          option_length,
++          tail_length;
+=20
+         /*
+           Handle %[key:value];
+@@ -1707,19 +1710,27 @@ MagickExport size_t InterpretImageFilename(const I=
mageInfo *image_info,
+           break;
+         if (extent >=3D sizeof(pattern))
+           break;
+-        (void) CopyMagickString(pattern,cursor,extent);
++        (void) CopyMagickString(pattern,cursor+1,extent+1);
+         pattern[extent]=3D'\0';
+         if (image !=3D (Image *) NULL)
+-          option=3DGetImageProperty(image,pattern,exception);
+-        if ((option =3D=3D (const char *) NULL) && (image !=3D (Image *)N=
ULL))
+-          option=3DGetImageArtifact(image,pattern);
++          {
++            option=3DGetImageProperty(image,pattern,exception);
++            if (option =3D=3D (const char *) NULL)
++              option=3DGetImageArtifact(image,pattern);
++          }
+         if ((option =3D=3D (const char *) NULL) &&
+             (image_info !=3D (ImageInfo *) NULL))
+           option=3DGetImageOption(image_info,pattern);
+         if (option =3D=3D (const char *) NULL)
+           break;
++        option_length=3Dstrlen(option);
++        tail_length=3Dstrlen(end+1);
++        if ((offset+option_length+tail_length+1) > MagickPathExtent)
++          return(0);
+         (void) CopyMagickString(p+offset,option,(size_t) (MagickPathExten=
t-
+           offset));
++        (void) ConcatenateMagickString(p+offset+option_length,end+1,(size=
_t) (
++          MagickPathExtent-offset-option_length-tail_length-1));
+         cursor=3Dend+1;
+         break;
+       }
+@@ -1733,7 +1744,7 @@ MagickExport size_t InterpretImageFilename(const Ima=
geInfo *image_info,
+       Replace "%%" with "%".
+     */
+     if ((*p =3D=3D '%') && (*(p+1) =3D=3D '%'))
+-      (void) memmove(p,p+1,strlen(p));  /* shift left */
++      (void) memmove(p,p+1,strlen(p+1)+1);  /* shift left */
+     else
+       p++;
+   }
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Fix=
-1-CVE-2025-55298.patch b/meta-oe/recipes-support/imagemagick/files/0011-Im=
ageMagick-Fix-1-CVE-2025-55298.patch
new file mode 100644
index 0000000000..1a92b36755
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Fix-1-CVE-=
2025-55298.patch
@@ -0,0 +1,71 @@
+From bc530e782bcee75960dac57e9191ab7257842bd9 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Wed, 12 Nov 2025 11:52:00 +0530
+Subject: [PATCH 5/6] ImageMagick: Fix CVE-2025-55298
+
+CVE: CVE-2025-55298
+
+This CVE fixed in two parts, this commit includes the first fix.
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/1f93323df9d8c011c31bc4c6880390071f7fb895]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ MagickCore/image.c | 32 ++++++++++++++++++++++++++++++++
+ 1 file changed, 32 insertions(+)
+
+diff --git a/MagickCore/image.c b/MagickCore/image.c
+index 1acf8edbd..7a52236d8 100644
+--- a/MagickCore/image.c
++++ b/MagickCore/image.c
+@@ -1633,6 +1633,31 @@ MagickExport VirtualPixelMethod GetImageVirtualPixe=
lMethod(const Image *image)
+ %    o exception: return any errors or warnings in this structure.
+ %
+ */
++
++static inline MagickBooleanType PercentNInvalidOperation(char *filename)
++{
++  MagickBooleanType
++    match =3D MagickFalse;
++
++  size_t
++    length =3D strlen(filename);
++
++  ssize_t
++    i;
++
++  for (i=3D0; i < (ssize_t) length-1; i++)
++  {
++    if ((filename[i] =3D=3D '%') &&
++        ((filename[i+1] =3D=3D 'n') || (filename[i+1] =3D=3D 'N')))
++      {
++        filename[i]=3D'?';
++        filename[i+1]=3D'\?';
++        match=3DMagickTrue;
++      }
++  }
++  return(match);
++}
++
+ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
+   Image *image,const char *format,int value,char *filename,
+   ExceptionInfo *exception)
+@@ -1652,6 +1677,13 @@ MagickExport size_t InterpretImageFilename(const Im=
ageInfo *image_info,
+   (void) CopyMagickString(filename,format,MagickPathExtent);
+   if (IsStringTrue(GetImageOption(image_info,"filename:literal")) !=3D Ma=
gickFalse)
+     return(strlen(filename));
++  if (PercentNInvalidOperation(filename) !=3D MagickFalse)
++    {
++      errno=3DEPERM;
++      (void) ThrowMagickException(exception,GetMagickModule(),OptionError=
,
++        "InvalidArgument","`%s'",filename);
++      return(0);
++    }
+   while ((cursor=3Dstrchr(cursor,'%')) !=3D (const char *) NULL)
+   {
+     const char
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Fix=
-2-CVE-2025-55298.patch b/meta-oe/recipes-support/imagemagick/files/0011-Im=
ageMagick-Fix-2-CVE-2025-55298.patch
new file mode 100644
index 0000000000..22fafbb4ff
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Fix-2-CVE-=
2025-55298.patch
@@ -0,0 +1,274 @@
+From 51bdbd8ba79cc29b5b8bd1cbe201612c4f1b6a14 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Wed, 12 Nov 2025 13:05:40 +0530
+Subject: [PATCH 6/6] ImageMagick: Fix CVE-2025-55298
+
+CVE: CVE-2025-55298
+
+This CVE fixed in two parts, this commit includes the second fix.
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/439b362b93c074eea6c3f834d84982b43ef057d5]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ MagickCore/image.c | 182 ++++++++++++++++++++++++---------------------
+ 1 file changed, 96 insertions(+), 86 deletions(-)
+
+diff --git a/MagickCore/image.c b/MagickCore/image.c
+index 7a52236d8..beaf69728 100644
+--- a/MagickCore/image.c
++++ b/MagickCore/image.c
+@@ -1619,7 +1619,7 @@ MagickExport VirtualPixelMethod GetImageVirtualPixel=
Method(const Image *image)
+ %
+ %  A description of each parameter follows.
+ %
+-%    o image_info: the image info..
++%    o image_info: the image info.
+ %
+ %    o image: the image.
+ %
+@@ -1634,28 +1634,39 @@ MagickExport VirtualPixelMethod GetImageVirtualPix=
elMethod(const Image *image)
+ %
+ */
+=20
+-static inline MagickBooleanType PercentNInvalidOperation(char *filename)
++static inline MagickBooleanType IsValidFormatSpecifier(const char *start,
++  const char *end)
+ {
+-  MagickBooleanType
+-    match =3D MagickFalse;
++  char
++    specifier =3D end[-1];
+=20
+   size_t
+-    length =3D strlen(filename);
++    length =3D end-start;
+=20
+-  ssize_t
+-    i;
++  /*
++    Is this a valid format specifier?
++  */
++  if ((specifier !=3D 'd') && (specifier !=3D 'x') && (specifier !=3D 'o'=
))
++    return(MagickFalse);
++  if ((length =3D=3D 1) && (*start =3D=3D specifier))
++    return(MagickTrue);
++  if (length >=3D 2)
++    {
++      size_t
++        i =3D 0;
+=20
+-  for (i=3D0; i < (ssize_t) length-1; i++)
+-  {
+-    if ((filename[i] =3D=3D '%') &&
+-        ((filename[i+1] =3D=3D 'n') || (filename[i+1] =3D=3D 'N')))
+-      {
+-        filename[i]=3D'?';
+-        filename[i+1]=3D'\?';
+-        match=3DMagickTrue;
+-      }
+-  }
+-  return(match);
++      if (*start =3D=3D '0')
++        {
++          if ((length >=3D 3) && (start[1] =3D=3D '0'))
++            return(MagickFalse);
++          i=3D1;
++        }
++      for ( ; i < (length-1); i++)
++        if (isdigit((int) ((unsigned char) start[i])) =3D=3D 0)
++          return(MagickFalse);
++      return(MagickTrue);
++    }
++  return(MagickFalse);
+ }
+=20
+ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
+@@ -1669,82 +1680,89 @@ MagickExport size_t InterpretImageFilename(const I=
mageInfo *image_info,
+   const char
+     *cursor =3D format;
+=20
+-  /*
+-    Start with a copy of the format string.
+-  */
+   assert(format !=3D (const char *) NULL);
+   assert(filename !=3D (char *) NULL);
+-  (void) CopyMagickString(filename,format,MagickPathExtent);
+   if (IsStringTrue(GetImageOption(image_info,"filename:literal")) !=3D Ma=
gickFalse)
+-    return(strlen(filename));
+-  if (PercentNInvalidOperation(filename) !=3D MagickFalse)
+     {
+-      errno=3DEPERM;
+-      (void) ThrowMagickException(exception,GetMagickModule(),OptionError=
,
+-        "InvalidArgument","`%s'",filename);
+-      return(0);
++      (void) CopyMagickString(filename,format,MagickPathExtent);
++      return(strlen(filename));
+     }
+-  while ((cursor=3Dstrchr(cursor,'%')) !=3D (const char *) NULL)
++  while ((*cursor !=3D '\0') && ((p-filename) < ((ssize_t) MagickPathExte=
nt-1)))
+   {
+     const char
+-      *q =3D cursor;
+-
+-    ssize_t
+-      offset =3D (ssize_t) (cursor-format);
++      *specifier_start,
++      *start;
+=20
+-    cursor++;  /* move past '%' */
++    if (*cursor !=3D '%')
++      {
++        *p++=3D(*cursor++);
++        continue;
++      }
++    start=3Dcursor++;  /* Skip '%' */
+     if (*cursor =3D=3D '%')
+       {
+-        /*
+-          Escaped %%.
+-        */
++        *p++=3D'%';
+         cursor++;
+         continue;
+       }
+-    /*
+-      Skip padding digits like %03d.
+-    */
+-    if (isdigit((int) ((unsigned char) *cursor)) !=3D 0)
+-      (void) strtol(cursor,(char **) &cursor,10);
+-    switch (*cursor)
+-    {
+-      case 'd':
+-      case 'o':
+-      case 'x':
++    specifier_start=3Dcursor;
++    while (isdigit((int) ((unsigned char) *cursor)) !=3D 0)
++      cursor++;
++    if ((*cursor =3D=3D 'd') || (*cursor =3D=3D 'o') || (*cursor =3D=3D '=
x'))
+       {
+-        ssize_t
+-          count;
++        const char
++          *specifier_end =3D cursor+1;
+=20
+-        count=3DFormatLocaleString(pattern,sizeof(pattern),q,value);
+-        if ((count <=3D 0) || (count >=3D MagickPathExtent) ||
+-            ((offset+count) >=3D MagickPathExtent))
+-          return(0);
+-        (void) CopyMagickString(p+offset,pattern,(size_t) (MagickPathExte=
nt-
+-          offset));
+-        cursor++;
+-        break;
++        if (IsValidFormatSpecifier(specifier_start,specifier_end) !=3D Ma=
gickFalse)
++          {
++            char
++              format_specifier[MagickPathExtent];
++
++            size_t
++              length =3D cursor-specifier_start;
++
++            ssize_t
++              count;
++
++            (void) snprintf(format_specifier,sizeof(format_specifier),
++              "%%%.*s%c",(int) length,specifier_start,*cursor);
++            count=3DFormatLocaleString(pattern,sizeof(pattern),format_spe=
cifier,
++              value);
++            if ((count <=3D 0) || ((p-filename+count) >=3D MagickPathExte=
nt))
++              return(0);
++            (void) CopyMagickString(p,pattern,MagickPathExtent-(p-filenam=
e));
++            p+=3Dstrlen(pattern);
++            cursor++;
++            continue;
++          }
++        else
++          {
++            /*
++              Invalid specifier =E2=80=94 treat as literal.
++            */
++            cursor=3Dstart;
++            *p++=3D(*cursor++);
++            continue;
++          }
+       }
+-      case '[':
++    if (*cursor =3D=3D '[')
+       {
+         const char
+           *end =3D strchr(cursor,']'),
+           *option =3D (const char *) NULL;
+=20
+         size_t
+-          extent =3D (size_t) (end-cursor-1),
+-          option_length,
+-          tail_length;
++          extent,
++          option_length;
+=20
+-        /*
+-          Handle %[key:value];
+-        */
+         if (end =3D=3D (const char *) NULL)
+-          break;
++          continue;
++        extent=3D(size_t) (end-cursor-1);
+         if (extent >=3D sizeof(pattern))
+-          break;
++          continue;
+         (void) CopyMagickString(pattern,cursor+1,extent+1);
+         pattern[extent]=3D'\0';
+-        if (image !=3D (Image *) NULL)
++        if (image !=3D NULL)
+           {
+             option=3DGetImageProperty(image,pattern,exception);
+             if (option =3D=3D (const char *) NULL)
+@@ -1754,32 +1772,24 @@ MagickExport size_t InterpretImageFilename(const I=
mageInfo *image_info,
+             (image_info !=3D (ImageInfo *) NULL))
+           option=3DGetImageOption(image_info,pattern);
+         if (option =3D=3D (const char *) NULL)
+-          break;
++          continue;
+         option_length=3Dstrlen(option);
+-        tail_length=3Dstrlen(end+1);
+-        if ((offset+option_length+tail_length+1) > MagickPathExtent)
++        if ((p-filename+option_length) >=3D MagickPathExtent)
+           return(0);
+-        (void) CopyMagickString(p+offset,option,(size_t) (MagickPathExten=
t-
+-          offset));
+-        (void) ConcatenateMagickString(p+offset+option_length,end+1,(size=
_t) (
+-          MagickPathExtent-offset-option_length-tail_length-1));
++        (void) CopyMagickString(p,option,MagickPathExtent-(p-filename));
++        p+=3Doption_length;
+         cursor=3Dend+1;
+-        break;
++        continue;
+       }
+-      default:
+-        break;
+-    }
+-  }
+-  for (p=3Dfilename; *p !=3D '\0'; )
+-  {
+     /*
+-      Replace "%%" with "%".
++      Invalid or unsupported specifier =E2=80=94 treat as literal.
+     */
+-    if ((*p =3D=3D '%') && (*(p+1) =3D=3D '%'))
+-      (void) memmove(p,p+1,strlen(p+1)+1);  /* shift left */
+-    else
+-      p++;
++    cursor=3Dstart;
++    if ((p-filename+1) >=3D MagickPathExtent)
++      return(0);
++    *p++=3D(*cursor++);
+   }
++  *p=3D'\0';
+   return(strlen(filename));
+ }
+ =0C
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/me=
ta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index af0a3149e3..d929a220f1 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -33,6 +33,12 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.gi=
t;branch=3Dmain;protocol=3Dhtt
     file://0008-ImageMagick-Fix-CVE-2025-57807.patch \
     file://0009-ImageMagick-Fix-CVE-2023-34151.patch \
     file://0010-ImageMagick-Fix-CVE-2025-55154.patch \
+    file://0011-ImageMagick-Add-support-patch-1-to-fix-CVE-2025-5529.patch=
 \
+    file://0011-ImageMagick-Add-support-patch-2-to-fix-CVE-2025-5529.patch=
 \
+    file://0011-ImageMagick-Add-support-patch-3-to-fix-CVE-2025-5529.patch=
 \
+    file://0011-ImageMagick-Add-support-patch-4-to-fix-CVE-2025-5529.patch=
 \
+    file://0011-ImageMagick-Fix-1-CVE-2025-55298.patch \
+    file://0011-ImageMagick-Fix-2-CVE-2025-55298.patch \
 "
=20
 SRCREV =3D "35b4991eb0939a327f3489988c366e21068b0178"
--=20
2.34.1


