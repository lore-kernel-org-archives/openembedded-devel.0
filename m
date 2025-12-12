Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030CBD59F49
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 21:03:44 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15017.1765552653352545030
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 07:17:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=NPbdP9Ut;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.227.57, mailfrom: divyanshu.rathore@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eceRPqLrh6I7x83GTVw+dkjnLtrCUTa241KlAh44EPdvqWjkNqlF0ENgV+6olgVePD64Z9/X71HktWL8DaFKwoq7+PVzvBSyxHHTFXymSATeYFczDECo3Mx/PiyBp01V7kKIaTB9Tql2y06TpFSigQwSWu9gG7/BB19difsKGR7HjIfUOzFYZ+Z+wEyEP70xyp8FEvaKLgO3Yax5W98CYsF7mP8Yeg3u7j62mDBDSElGObZkvhFC6o2lhIAHimqSUhiEg8iY4Fr9DXOwNW5b1WBaB5JdsyL0G42xcelBxUcuYw2jcs7s+xYxMqfjEt4nDPvdEZ5dZ2wsftzRhU1Cfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KE+1UHmnrHJfCGVulku3Eem+JVFkciPEFZyrQmCBTYU=;
 b=uU9RQAQmXZysAyngxa4wFzBCbziHKM8HVXOvFpa2WAsmvDS9aoayjY40ELYZPtZcukUCW7faA48UMuZ3Ytcd43MgZryy/2cZZ5FGeXgYwSJtO8YeQSu3NMtOKHbNxwvi96PGURbXHfcppDg8YEtm1Uy+s1wC9PqDv33kPdXQeVbjIYLSulpoQufx5tLRKcZ1X4YFS9CfL17Mw/MbGc1QXdF4rEWhbe1aCVepyxVo5NMj9UUuP/KR8zTMvbj9Jlu1W4vvOKSesG5faNrF4wTM5cb76Tefon3UK50p/SOffeMXupQSo9hW0+RyMerh5Fh0CJexPslIVBNBS2wq5aE70w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KE+1UHmnrHJfCGVulku3Eem+JVFkciPEFZyrQmCBTYU=;
 b=NPbdP9UtrTinuaP8PzvhQe3UQhD866l/H804e2damkvfwLBvC6GsebdSL/JVT+yHJdW4e4ZENiTC9fgJ1dgx0tOe8082qFtghJ9hhWHuEaONg7Y789zj77451/fQpLbXKCtayOFYYDzwjbsD3WJE+FGP1zTo8cNXBvQ3iw22T4WzIEgXFd8t10vV8UZE4IJeI7nKU1HrIHf+PoJz1N0qvygUOS1WTyLgq3RpsSrxl6qB/pKRmqi8zqPjQBKG9dilL5scyeJ2b2IzfvPkUFIf70qqyfgv02IUO1euoXzK/zgPWumw6lnoJBIvfOAde/DrA0/6Ne4LJgv0CRWpYUxOmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:143::11)
 by PN0P287MB1122.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 15:00:17 +0000
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483]) by MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 15:00:17 +0000
From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Divyanshu.Rathore@bmwtechworks.in
Subject: [meta-oe][kirkstone][PATCH v2 07/11] ImageMagick: Fix CVE-2025-57803
Date: Fri, 12 Dec 2025 20:29:43 +0530
Message-ID: <20251212145947.7434-7-Divyanshu.Rathore@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212145947.7434-1-Divyanshu.Rathore@bmwtechworks.in>
References: <20251212145947.7434-1-Divyanshu.Rathore@bmwtechworks.in>
X-ClientProxiedBy: PN0PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::14) To MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:143::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3378:EE_|PN0P287MB1122:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e0e63f3-fcaa-4402-5a1f-08de398f2982
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?V0/QRXLxRtvqYDcqnbRMwQuTVAOOc/tljoLXFUXqf2woWBkF0nO4f8Mt2lnv?=
 =?us-ascii?Q?Kc4Vq0AaNKew8ue6Tc0sHeiUOltUGQvYUf3gAzSobpozk8MQ6Rnr7NE4/2TV?=
 =?us-ascii?Q?iuIgPlgggzy5oLp1MBrHwYO/RiUeAYUG6VpBSKzd/Kd0dhokGRwIPkyJgWNF?=
 =?us-ascii?Q?dB0uwW9ckEli0tdx0O+Fb9Xu49+bNoef7WFgiUwbh17ouMBVHM4nQi6fMbjs?=
 =?us-ascii?Q?R+AmRAR+tUfoEh5H56yhGrq3kYQylf7PMXg39vdsxruFoX8ctpLSEJ6SVoTz?=
 =?us-ascii?Q?WYmPqNfxIqnVL1F1oL8pf2fvW8+xgshk6kXY+vfy/IGLV/+ixedXHW1R8Zka?=
 =?us-ascii?Q?J6hy611bnnLEKSwMJ7R8Vd6JPuHENyiioB/Xdc2TJZXRFx79nlkey8h40XDu?=
 =?us-ascii?Q?heEgM4q1UDYGIHZCSVL7NnSBI3IhvOrl/MU7IYLJymLnjI1GCYtSUfii3Wkw?=
 =?us-ascii?Q?ohkEVtnnWfprWCrY35a4Xe/xKn0vnqxvNC0Vd/kKNro0N18F7RDWdupck0fZ?=
 =?us-ascii?Q?r5EKKSM5DIZb0y90r+AIugexlWG5GN3P55OwmLrka+DMYl9z2WEffs5p+nRe?=
 =?us-ascii?Q?afSmq1v6iFWA2uapkrSVikEt6AL3eG2siPlix3U0nHvPaE//+zVs93cC/POo?=
 =?us-ascii?Q?CHJkcMU3m3K/aLy0YUuAPw8ghScbx9gXMxKWqWPblB9882lGNDtoHUjdVxVB?=
 =?us-ascii?Q?yq4O+JvYPmBhIQSdOMCnkfAnHwYE0yzCIlsmby4Rc+q/yS8GpVKcSWf1xnnY?=
 =?us-ascii?Q?7VQgJtCTz+2j/32eEwPczrCITPVSHNg4c3aGo69T/qZy+oqazP7956HnmIY7?=
 =?us-ascii?Q?T7HFkNSeQu25LKjvFxG/3N+a1fHV94iVYQbd7CJa78+URgvJuAZ568O4F1+D?=
 =?us-ascii?Q?jDYuN+od30xzA1qeYp11v6MonOcPH2d+Vr6n1OMqT6QHlpn/n/sRRCmukUau?=
 =?us-ascii?Q?tIXXliyu3IaR825nyLwbIpwFJKuJ2nsVvlUvFSGHT4Zn4+FE08To+rUMp0km?=
 =?us-ascii?Q?8+8rx05SMUfF6xTRV8IrmvRvifox6kRBKtMlknj/5xXmvINNWiZ5SyWEjSiE?=
 =?us-ascii?Q?pIxYuUAQSRulKQf7J7Fm4wF0tWexNRQmhZIi5bD+Ln5h/i099Y9zZ4+Psa8O?=
 =?us-ascii?Q?DqSR1V4tsEbjkFHNy6VHQvw8y294dH2ImWsr871nqpplgWWgiTwikweTvoxB?=
 =?us-ascii?Q?8c/GIUQpC5c2ub/TjcmGIsAHTDqAJz0s6raPvzm1uIdIr9Z/SDVHBAQIj3rL?=
 =?us-ascii?Q?97uiW0zjFEWq5q9yncNMdObbWBGXBNAM9T0yZUKC+C5bPzjElmPzk9xjLcRN?=
 =?us-ascii?Q?9Nwoat0fdoX3CoMuJzeb8ZdBaJStjTQ8h/uerUX/MAWVAeMOzenBgf/cugw8?=
 =?us-ascii?Q?/fCLBSG3lMni2364L1j6BGDm5yklziAZ1P5RRCKNX81wCZntXVUr2QFCxbk1?=
 =?us-ascii?Q?Ho9TpvqRN2LcN8/5jXi2v9BbcZlxl1ej8M1pRKxurOeAKWa5SU/hfg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3378.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RM5+pTCtsRl16D0l839PJEatHvhRYoMiSRCj1mVF9t4ax5Y8JPAKS15+y8++?=
 =?us-ascii?Q?rEGCXwfZCLKRh6QIjw9RtyVuQ/BmFZxXmejXtdMQF7JPLgaKntjdigmAn3id?=
 =?us-ascii?Q?cboKDlOKRBu6+YGR01pidqLqoq7S6T8ECxg3Ycb6B/pQDzkN6deSQDuYx6ee?=
 =?us-ascii?Q?MvyZFbC9Y5kQ/S1/8Ii6tmhQi+Us5+C0o4nGeI6vt0gKFQwT6NthBazH1Dtj?=
 =?us-ascii?Q?r4WqbqfQOYhox1kY4KtI/gHHgtGdtGkmyzoWYptHiRE95S4qsmZ9KluD0GEf?=
 =?us-ascii?Q?tCvfHylrcGQo7az/u7gNZZ1q0Zv92OWEkj9pte19vMLmMOMy0Q114BxpOWU3?=
 =?us-ascii?Q?yaRNQommbV8TvoqxKhIGhL3iXrvJBYY+smzzgz98LtS/E95UxNbe5chjJh77?=
 =?us-ascii?Q?Ias/pOVnwOf74lGX1tBg2JET1OqOj9Ax/JO0uUxZmF9snKESq/B8oNPGZMnS?=
 =?us-ascii?Q?3/77yriQHTD9JPQfRXbuNuT9eH89BzkJ8iZZD1x3NIqmgjR8Uw7cm8Uz73zz?=
 =?us-ascii?Q?bmUsG5Wnva3O7Qo6/H4L2LUpUSikk4ZX5nad/t9SHhZReLFV+BsAFe/NSV9o?=
 =?us-ascii?Q?phCHzT/EZL2pz0xp/qjl7hh6uwTozqRVbjKhbZ1oey3rWBFJjeC/R3V54sdi?=
 =?us-ascii?Q?u2yojI1KPHEQ6q/RXghgV4rIaOBHUFRYc9K+UjjqnO+tLU60Gk+WYHVWdZSz?=
 =?us-ascii?Q?8i4ChjMI+vaAi1+VoHTimD1DiAYXoo58LeA/MNwS4FYI+4Owvv6cLhbm3UYr?=
 =?us-ascii?Q?YJ4N71OeLyzSvXbllKqy9U1rXvsrDdpcKn2zt1etauS5Z0dbdGbB46niaQxt?=
 =?us-ascii?Q?RTr1i3cgc3Gqv8aBbhxTUn1LlIL+syDPJaFliDyzL93QVdW5tIYQO7g89+DI?=
 =?us-ascii?Q?BgOAj5D/xdwwfWTUOEl43FCbVa3Yvyw6OxY+jCgpOskFCs1PpGtTvSc6gEnB?=
 =?us-ascii?Q?OPiVi8AvkR5mWJkIgIrj5C2Kz8BSZbbtiJyAJlWrd/sqbrv9kA+dIitinPZU?=
 =?us-ascii?Q?Dgewd9vPv8LWnyhqr6L5mmejeYM5CrM184hTiRieT7Uf3M61b0mSu9ds+lsv?=
 =?us-ascii?Q?6Zalxi4C8cHgdK+117+TFz5RqCd0CYnrRWlT0kbElcvBiPkz+dL0zxsfUbd9?=
 =?us-ascii?Q?mqFeNb/cDiRX3AHSYXDYNkBJvfZPVuBABhLvow3J+un68pO3uia6tn8BLK4T?=
 =?us-ascii?Q?reoy7O5KlTFqrbXcfOodDQeert6wZq7DcSB67gBv6445vv4W/lTSCpoxfFBf?=
 =?us-ascii?Q?8gn907x+n0SnrfPb9o18uUDSrA39SVuzObLj6IQ0TQnXsl0m56lPllR96Wx1?=
 =?us-ascii?Q?DtLj1LncCTyRLrQLcPJsWXU7Sgh0LdmI5vslLiGcapMIltdJkJ4qrJigVxyW?=
 =?us-ascii?Q?xH6lRc8qwkn1DPTrZ80x/rXb/txIGuTJSv9rMK+FgtAS7rOjfpatGoDusGX0?=
 =?us-ascii?Q?KteNvYpd/SFfUM2ZrqDySXILenl22easOa6NgK9ixU2SMWvSWDDzuVYO2q1Z?=
 =?us-ascii?Q?tN7gXrOOlr2azG4iJobKieisM9WoSh6m5HSVUIsJq56nY98G62Lr0bqokjcT?=
 =?us-ascii?Q?HspcpcR4coBsQnO2Esa2u9YFGzeBwrqFyY9cxd5LhrVWCyimpthVk6xsHoBY?=
 =?us-ascii?Q?MdiMOiuXP1sG+9AIcLoo+H4=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0e63f3-fcaa-4402-5a1f-08de398f2982
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 15:00:17.5952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZGOUAOqUTm5vuHbnzmK9m26BBdoYNmXoOLIUhmRiQqJK0g35LOmzvMcRCDfk/kvGiTSWCte+vAr5CYJ2JJFK4YFnRG3XUVa2Mka9XUgIsshV94tIYtf6PhWnTokg76f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1122
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 21:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122626

Backport the fix for CVE-2025-57803

Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commi=
t/61f444e5457e4e506c73f18460133c80c235ebb6]

Add below patch to fix
0007-ImageMagick-Fix-CVE-2025-57803.patch

Add below support patch to fix
0007-ImageMagick-Add-support-patch-to-fix-CVE-2025-57803.patch

Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
---
 ...-support-patch-to-fix-CVE-2025-57803.patch | 58 +++++++++++++++++
 .../0007-ImageMagick-Fix-CVE-2025-57803.patch | 65 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  2 +
 3 files changed, 125 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0007-ImageMag=
ick-Add-support-patch-to-fix-CVE-2025-57803.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0007-ImageMag=
ick-Fix-CVE-2025-57803.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/0007-ImageMagick-Add=
-support-patch-to-fix-CVE-2025-57803.patch b/meta-oe/recipes-support/imagem=
agick/files/0007-ImageMagick-Add-support-patch-to-fix-CVE-2025-57803.patch
new file mode 100644
index 0000000000..ef570a496a
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0007-ImageMagick-Add-suppor=
t-patch-to-fix-CVE-2025-57803.patch
@@ -0,0 +1,58 @@
+From 558a3a71c2b107483d8e88cd2d20242358b6633d Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Fri, 5 Dec 2025 13:43:17 +0530
+Subject: [PATCH 1/1] ImageMagick: Add support patch to fix CVE-2025-57803
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/61f444e5457e4e506c73f18460133c80c235ebb6]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ coders/bmp.c | 17 ++++++-----------
+ 1 file changed, 6 insertions(+), 11 deletions(-)
+
+diff --git a/coders/bmp.c b/coders/bmp.c
+index a46448a95..703ad0483 100644
+--- a/coders/bmp.c
++++ b/coders/bmp.c
+@@ -968,18 +968,18 @@ static Image *ReadBMPImage(const ImageInfo *image_in=
fo,ExceptionInfo *exception)
+       ThrowReaderException(CorruptImageError,"ImproperImageHeader");
+     if (bmp_info.compression =3D=3D BI_RLE4)
+       bmp_info.bits_per_pixel<<=3D1;
+-    bytes_per_line=3D4*((image->columns*bmp_info.bits_per_pixel+31)/32);
++    bytes_per_line=3Dimage->columns*(4*(bmp_info.bits_per_pixel+31)/32);
+     length=3D(size_t) bytes_per_line*image->rows;
+     if ((MagickSizeType) (length/256) > blob_size)
+       ThrowReaderException(CorruptImageError,"InsufficientImageDataInFile=
");
++    pixel_info=3DAcquireVirtualMemory(image->rows,
++      MagickMax(bytes_per_line,image->columns+256UL)*sizeof(*pixels));
++    if (pixel_info =3D=3D (MemoryInfo *) NULL)
++      ThrowReaderException(ResourceLimitError,"MemoryAllocationFailed");
++    pixels=3D(unsigned char *) GetVirtualMemoryBlob(pixel_info);
+     if ((bmp_info.compression =3D=3D BI_RGB) ||
+         (bmp_info.compression =3D=3D BI_BITFIELDS))
+       {
+-        pixel_info=3DAcquireVirtualMemory(image->rows,
+-          MagickMax(bytes_per_line,image->columns+256UL)*sizeof(*pixels))=
;
+-        if (pixel_info =3D=3D (MemoryInfo *) NULL)
+-          ThrowReaderException(ResourceLimitError,"MemoryAllocationFailed=
");
+-        pixels=3D(unsigned char *) GetVirtualMemoryBlob(pixel_info);
+         if (image->debug !=3D MagickFalse)
+           (void) LogMagickEvent(CoderEvent,GetMagickModule(),
+             "  Reading pixels (%.20g bytes)",(double) length);
+@@ -996,11 +996,6 @@ static Image *ReadBMPImage(const ImageInfo *image_inf=
o,ExceptionInfo *exception)
+         /*
+           Convert run-length encoded raster pixels.
+         */
+-        pixel_info=3DAcquireVirtualMemory(image->rows,
+-          MagickMax(bytes_per_line,image->columns+256UL)*sizeof(*pixels))=
;
+-        if (pixel_info =3D=3D (MemoryInfo *) NULL)
+-          ThrowReaderException(ResourceLimitError,"MemoryAllocationFailed=
");
+-        pixels=3D(unsigned char *) GetVirtualMemoryBlob(pixel_info);
+         status=3DDecodeImage(image,bmp_info.compression,pixels,
+           image->columns*image->rows);
+         if (status =3D=3D MagickFalse)
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/files/0007-ImageMagick-Fix=
-CVE-2025-57803.patch b/meta-oe/recipes-support/imagemagick/files/0007-Imag=
eMagick-Fix-CVE-2025-57803.patch
new file mode 100644
index 0000000000..9a26aa6892
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0007-ImageMagick-Fix-CVE-20=
25-57803.patch
@@ -0,0 +1,65 @@
+From 9624a36f5c77d81cfdce20d0978850fa0db1543c Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Thu, 23 Oct 2025 23:41:32 +0530
+Subject: [PATCH 07/18] ImageMagick: Fix CVE-2025-57803
+
+CVE: CVE-2025-57803
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/2c55221f4d38193adcb51056c14cf238fbcc35d7.patch]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ coders/bmp.c | 31 +++++++++++++++++++------------
+ 1 file changed, 19 insertions(+), 12 deletions(-)
+
+diff --git a/coders/bmp.c b/coders/bmp.c
+index a46448a95..beff10bb5 100644
+--- a/coders/bmp.c
++++ b/coders/bmp.c
+@@ -506,6 +506,10 @@ static MagickBooleanType IsBMP(const unsigned char *m=
agick,const size_t length)
+ %    o exception: return any errors or warnings in this structure.
+ %
+ */
++static inline MagickBooleanType BMPOverflowCheck(size_t x,size_t y)
++{
++  return((y !=3D 0) && (x > 4294967295UL/y) ? MagickTrue : MagickFalse);
++}
+
+ static Image *ReadBMPImage(const ImageInfo *image_info,ExceptionInfo *exc=
eption)
+ {
+@@ -546,6 +550,7 @@ static Image *ReadBMPImage(const ImageInfo *image_info=
,ExceptionInfo *exception)
+   size_t
+     bit,
+     bytes_per_line,
++    extent,
+     length;
+
+   ssize_t
+@@ -968,12 +973,18 @@ static Image *ReadBMPImage(const ImageInfo *image_in=
fo,ExceptionInfo *exception)
+       ThrowReaderException(CorruptImageError,"ImproperImageHeader");
+     if (bmp_info.compression =3D=3D BI_RLE4)
+       bmp_info.bits_per_pixel<<=3D1;
+-    bytes_per_line=3Dimage->columns*(4*(bmp_info.bits_per_pixel+31)/32);
+-    length=3D(size_t) bytes_per_line*image->rows;
++    extent=3Dimage->columns*bmp_info.bits_per_pixel;
++    bytes_per_line=3D4*((extent+31)/32);
++    if (BMPOverflowCheck(bytes_per_line,image->rows) !=3D MagickFalse)
++      ThrowReaderException(CorruptImageError,"InsufficientImageDataInFile=
");
++    length=3Dbytes_per_line*image->rows;
+     if ((MagickSizeType) (length/256) > blob_size)
+       ThrowReaderException(CorruptImageError,"InsufficientImageDataInFile=
");
+-    pixel_info=3DAcquireVirtualMemory(image->rows,
+-      MagickMax(bytes_per_line,image->columns+256UL)*sizeof(*pixels));
++    extent=3DMagickMax(bytes_per_line,image->columns+1UL);
++    if ((BMPOverflowCheck(image->rows,extent) !=3D MagickFalse) ||
++        (BMPOverflowCheck(extent,sizeof(*pixels)) !=3D MagickFalse))
++      ThrowReaderException(ResourceLimitError,"MemoryAllocationFailed");
++    pixel_info=3DAcquireVirtualMemory(image->rows,extent*sizeof(*pixels))=
;
+     if (pixel_info =3D=3D (MemoryInfo *) NULL)
+       ThrowReaderException(ResourceLimitError,"MemoryAllocationFailed");
+     pixels=3D(unsigned char *) GetVirtualMemoryBlob(pixel_info);
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/me=
ta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index c209faa29c..3566932fa2 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -30,6 +30,8 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git=
;branch=3Dmain;protocol=3Dhtt
     file://0004-ImageMagick-Fix-CVE-2025-55005.patch \
     file://0005-ImageMagick-Fix-CVE-2025-53019.patch \
     file://0006-ImageMagick-Fix-CVE-2025-55004.patch \
+    file://0007-ImageMagick-Add-support-patch-to-fix-CVE-2025-57803.patch =
\
+    file://0007-ImageMagick-Fix-CVE-2025-57803.patch \
 "
=20
 SRCREV =3D "35b4991eb0939a327f3489988c366e21068b0178"
--=20
2.34.1


