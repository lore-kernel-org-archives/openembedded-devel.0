Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2886D59D99
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 21:03:43 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14954.1765552485003980206
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 07:14:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=EBc+7uzR;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.50, mailfrom: divyanshu.rathore@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bqjf3JBYGuGC9zkJ6XMaY0FL2Rt4jO5fAn7JXPf3fWrbkXdqQ7l+P3gHxAJQiHCcT+Sz+Sgp3MwaEm1VBQP5VNzkcxtPBlgKSgj7LnvHyy9eZtOWkHAOgKZ22tgYzYMtXyEak7D00hyq86Clt1TobQFLeVaiN72z82Z4RyoHH65cfA/zOP7GrCRdnoeQ1PIO0iNivgPoB+lPq8H/IpBL9v1bq1jzfpaMYwZ7TEEjJ8AUcfg3X2pPb3UCrsOk14j6YMLwxtT9tleOc+5LwkKxS0khQdMJOcqQ9tRmBg7bi0Hov41O+vilEMOzdVvw9Vm9r89p/ED01PINXrLfNDaUoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDNlR3bmW+d8yKLyiU8LDX5KT4RgB/dvnp99zEGTZIY=;
 b=qHL5fnU1se8BytuaWYQV18NHtaS74mweSFMtXvem0qCckMpualfZq2HDZJKZ9jICKmLaTNmvZxlJ/NnrJtZetgR3+/s8MCpL9XK42gvKXsja3bHWS6XmUkicKIiCoiAYeo++qrCcfRODjcGhwSWEQ5f6nh7xtHHOXt/w4KME8NuNGEd7KQdcF8LI8gEvJzgC5MGha+xVsdfxm0VDyHD8l+DH2MoszohyLR+1pem4St88mwC2SGfpkoLa96pczt24e6mmvnGl7MNEt/wbD9XJujXTCiDxNygXcGvz8zVsZiJoY175WTFrvMeYQDv9/OjRonw4AtDPqFiOreSdq0cokg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDNlR3bmW+d8yKLyiU8LDX5KT4RgB/dvnp99zEGTZIY=;
 b=EBc+7uzRFZetU4ROgRAixx2WGg/XceAD5yI2Ic7akMp0cUiWeGTkPNq3kSXpixDwzdBy4jZAlu//yynjGl17nOBQgOdRBjvh32M27rRdDWYg3p2m1clpCP0Nme9I/U86PsRhlMHOBvhOC5PIUuDGmZ1VUajNyI2ngWN0EaxWVM+MfeApxUfKlBktY37kC1c1ADnrwF8K04JX/fOwFVXfR4n+mtS1hPUneK9JVdT+pekoomyiOTD8ql9ZJI7a/3jmA7Pk9fq6SeKqe1/uRJ59CtCzAuUBfaVqNfaPEupwc6hKekFNO7ZRQ7m5KOyFrogcjRDQDj6vGOrt7ofnae+FIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:143::11)
 by PN0P287MB1122.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 15:00:20 +0000
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483]) by MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 15:00:20 +0000
From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Divyanshu.Rathore@bmwtechworks.in
Subject: [meta-oe][kirkstone][PATCH v2 09/11] ImageMagick: Fix CVE-2025-55154
Date: Fri, 12 Dec 2025 20:29:45 +0530
Message-ID: <20251212145947.7434-9-Divyanshu.Rathore@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212145947.7434-1-Divyanshu.Rathore@bmwtechworks.in>
References: <20251212145947.7434-1-Divyanshu.Rathore@bmwtechworks.in>
X-ClientProxiedBy: PN0PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::14) To MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:143::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3378:EE_|PN0P287MB1122:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fb5e230-caca-465e-d24e-08de398f2b14
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KPZcHeFy/0b+2jfqbk18ZQXTDphYuTPXd8jxaoO8P/Ir4J6iEl1TTr/nl4vb?=
 =?us-ascii?Q?zhV2aAtueqDGUrw2AoHtb+6/6/KQtvY/YO5qSJouBRi+pNRvnk9+Sfw8K+vQ?=
 =?us-ascii?Q?Uhul8dL8mE6iRp12c8UAbwafmfAiTsnDlqKdXt92yiBMT5VDRSwt32hlV5HG?=
 =?us-ascii?Q?vLYkyda2rvDaWcEeB25DEsZarG1QZNwMONPT2f1dZI8zRJfr/yZTUhpJsJfp?=
 =?us-ascii?Q?+LuwHfM392XfUfBFjecR+8z8oloOhMqYjfyWLguPYvgwyi7vhBjg7Hmlub2/?=
 =?us-ascii?Q?jxVRh4sTuuJmvHZZEKW1/+MI2aL1MGi8h7KBts+ghyUmly6ZH05x7dAPCptK?=
 =?us-ascii?Q?NLNBZdddd2UzjMehGnzLqaKfevJLsKo9HHhQ2Ljle7SW/STUR7W+7EBHiGsN?=
 =?us-ascii?Q?q+5Sdg7r1vRX4vh+/nBYVP37b61os/LCJ7mwKPavkHPAaDlhowkDho6GpQLk?=
 =?us-ascii?Q?cfmShzMg90H76n+bRTRZ5KPgmWhz15WLJlu2GJCovy44wTPaAUYzE3sY8jVi?=
 =?us-ascii?Q?BaZzM/3WbhUoaVFk9mH7ZJzvEchmo9K+b1qCXlYShjYX2c/jBBmNf7N9xoQj?=
 =?us-ascii?Q?h4Kx4r3HyQqfsknMkDS+O8wv73Ceo2DRCPoNl3OnBRcozK+NeJCniJvQ0u6X?=
 =?us-ascii?Q?8/gECInU7pIlTlWP/m7yIslfNMe21peP20oV1DtCETwn47LH7Bag1K1bVD3j?=
 =?us-ascii?Q?ddeZT84W4MfFvEJXbmds29QArqwuUCMiAxc9fH8keCDXkAhGYdKM8J5nYaZv?=
 =?us-ascii?Q?aqq+/7j05GaaTDKgrTkgSVXaZx6P/GOXQ5kIR3Xbl2i+8Z1pabvol9f/hZyK?=
 =?us-ascii?Q?M3P9/ZQc2wzFFflByhVDAVkWDlahtM1AyvtDsHlg6KKb+A83hAspyqmTuiid?=
 =?us-ascii?Q?ZVNQcYt7362Qd62V9sq+V8vwtTcdqcLZ4YGout+cGornePGG5bhlFto9c+IO?=
 =?us-ascii?Q?BWiiZchWJ8fBQ2dGCuIpSBqShSlolxCrw6B4d2gb9gtUJ59czQ7OfNx8CQMH?=
 =?us-ascii?Q?9MW6TLDpZcNXU8B/ml/wre1Q9GSH1mFZdBqCe6yVqezxka0BBUDRC+yCgIUe?=
 =?us-ascii?Q?N4s6EHNVa3EkZ9edNWxzwlSSfLHcIf05NSppYWZ1Gye9Gi4l91PZ6PpstX4V?=
 =?us-ascii?Q?9HNoHRjnCKPxIN/ATQu9RUEN7OUJKXdXMRtAf+DgtylhPn5fqFK6Q8CTJy/D?=
 =?us-ascii?Q?BfW9+KYHl1BdwgQXCEk9c+GJAT1AErZmMuWs2rXeWhG0T5dT4bpEAuEs3BOS?=
 =?us-ascii?Q?/dN0GiZwiWpK16BMYUXSCMDvDRCnFgzATmB8bHzZ78m5tNwqv5DW4ZD6hjc7?=
 =?us-ascii?Q?Z+a5jXzSxRNFzZizKfvbOKsRPzSv8nDdgR6BGp2P4HVCA1enjNPapeVsZMpe?=
 =?us-ascii?Q?T9hn3Rt1VPJZMiBjPAKZBQWu5BnO8ZVYzZ1U/XL6wgiRCx3Q5w8/otfecWlC?=
 =?us-ascii?Q?/FZSxV1TBAJ5HtQKC3Lw6v+/QwVUxlnabsGZ7/acBB8o2wQ66GNbbQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3378.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yYZ5u+DMyEJ7Ixx51OIwVZ5xC1RiXtRkzOzzPLn2HXcD8YXm/0AEaAAJTCWz?=
 =?us-ascii?Q?ruwruwu6PECzUReDRrJxWNTAvenMO5Rj5ebveWZAmlbsJWZXBCP1TDeXR3kX?=
 =?us-ascii?Q?QsrcJFzjIKT9H72Et/BPiWdNZUDS6AKHyng01bU5/4/XoZv7yOZWphp0EqY0?=
 =?us-ascii?Q?eOZnJIrexouoVGLdAbk/v2W7JgxR3yecgh4bE2ayw7j8fW8UyQKG73/09pe/?=
 =?us-ascii?Q?ARsM76N/X8cF09+NrlQ9G+TKYpel3kOp35u9L54G+vfONMWumGgjY26AiK9I?=
 =?us-ascii?Q?Cgl9zWekbMqZTYnvHAOh7qyPYpJcAWAVHKn5QQJUBpbdWMvyy/WzT43kDJ0I?=
 =?us-ascii?Q?aw+ovDV4kuFkhIh1DqM8zCWGNevTkr2NP6O2w/kI5uBCcI5CjryaDnTXXUYl?=
 =?us-ascii?Q?fM4eVe6Wo1byg2TXfu3NSIxT+4KWDiEfC0WZ60xozZYnAY+BG/mjtQO4PM2b?=
 =?us-ascii?Q?fXIp0XAwyrkz/WpfW5/MzHQPiEASjz2XCAC09oMNWUNnSRiJzHDZ8DEYa/ix?=
 =?us-ascii?Q?t+aa713TgmPstcq9fIBgtSLo+IMgxV5E0RjDhwJ0RILn3rL/p5lK1bkDXQhD?=
 =?us-ascii?Q?LZKCBHUcG6ZspVcMYa98veQKxURnrTPXWo6eR9gpN/jGAKmWSxFcQmaJuK37?=
 =?us-ascii?Q?ga5YZ2YTg8IXz8gAV13tq8AVSsO7G5Hr4t7h+wm11f12P7c2kpLtiiKedC3y?=
 =?us-ascii?Q?rCO4jpVl8k8Vcob4uq6Js8p5PPWAsDWCsoBUaFAvj2CRYpUx5VnXMC610bSo?=
 =?us-ascii?Q?lJBJTBwUhv8Ij+tufdZuOlFrcsOaDnZvUSlfLP1OG4xZGMGa/ujbC/kiRPeE?=
 =?us-ascii?Q?B95lYgSWA1W5+y6CBOD0sB+H62CmapCWYQ0p+2KHb3/zMKRafIY8TwGwUWbr?=
 =?us-ascii?Q?G5H7v9o5+oxnzRcuYqA3Grg5YGTr9QZ+mJ8K4LPQkTD2IF4p/fQ0No5FBY3F?=
 =?us-ascii?Q?ZAkiuy913eTItg5VxSNCaH8kzb6Rf8l6qVdAr8Kmh4+XksX+2ziWx+b8tU7h?=
 =?us-ascii?Q?dHzhEj/kEVsH8J6ZdxhjBkyK9iYZ34my+Hd3jdvITZa1gY81OcWST1gT9e6t?=
 =?us-ascii?Q?Jn0ByP5kh4RZgmeoNyU//kXIL9CzkdgLld/RbSBDUmoG8ejkKmdeBRKKPk8v?=
 =?us-ascii?Q?ItFu9hjzOtj6d/nNEdKFCODwsqBti8H3Ng4+PGiB3mFFQOrF5PQkisHXODTW?=
 =?us-ascii?Q?V6URiw4zemBpXjpsD5i5PVztZjY3LkiUtx8pdEp7/U9ij+3QxY+wvoL6sD4G?=
 =?us-ascii?Q?cf3krjzsyOHSphi9SeHxkmtFB2Nvsoo8sk4HKEgNfZbq9mL9XGLHzPKMcVyD?=
 =?us-ascii?Q?Trm1SfR+/Jb1o7wSf8wfmRf6qQwr5jIC8LVjd5RTTNfT78GjWyaEvwLRJCAL?=
 =?us-ascii?Q?rAcL0gUTN+6TmfsCqQxBLb/sETmf/pFeofrLr+I3G7VeLeJ+rnZf8pn4hA6K?=
 =?us-ascii?Q?Y3th0/O1FuhhYp+Kn28ZlroI/sHYn4Ref/xSr8hHFLddMfw5Gmf0/SE0GB3N?=
 =?us-ascii?Q?iTL4s1mdzetugwr3bYtBDrLKvNETCgzA7NnG+lBAgmcRLjOKZm+E2rqcbo/M?=
 =?us-ascii?Q?q/9mu9K2XAH0I93EC7NWMAYZ9AFl4GBu7UVtoQTqhhI2BAmwXN15OQxCsuNC?=
 =?us-ascii?Q?kw1vTM0+PcdtP2TrXQPnFoc=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb5e230-caca-465e-d24e-08de398f2b14
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 15:00:19.9956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ht2alc+ib0+HtQ4Le70ORV5D+VhgOQTGboSs60Vxe0toW9AwnCePs/maX6wDP7KI/8Zjlmv3Zl0XS0ESnurYdt1vw12OIn1Vwh+3LyG3gutCicxixNKtiYmuT6EdcIJ+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1122
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 21:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122616

Backport the fix for CVE-2025-55154

Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commi=
t/db986e4782e9f6cc42a0e50151dc4fe43641b337]

Add below patch to fix
0009-ImageMagick-Fix-CVE-2025-55154.patch

Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
---
 .../0009-ImageMagick-Fix-CVE-2025-55154.patch | 84 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0009-ImageMag=
ick-Fix-CVE-2025-55154.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/0009-ImageMagick-Fix=
-CVE-2025-55154.patch b/meta-oe/recipes-support/imagemagick/files/0009-Imag=
eMagick-Fix-CVE-2025-55154.patch
new file mode 100644
index 0000000000..96b8edf50b
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0009-ImageMagick-Fix-CVE-20=
25-55154.patch
@@ -0,0 +1,84 @@
+From f7f5f0f11631dcbd50c0b9a14e7fd4d794eff744 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Tue, 28 Oct 2025 14:12:27 +0530
+Subject: [PATCH 09/18] ImageMagick: Fix CVE-2025-55154
+
+CVE: CVE-2025-55154
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/db986e4782e9f6cc42a0e50151dc4fe43641b337]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ coders/png.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/coders/png.c b/coders/png.c
+index 343934ce8..e730edb03 100644
+--- a/coders/png.c
++++ b/coders/png.c
+@@ -6841,19 +6841,19 @@ static Image *ReadOneMNGImage(MngInfo* mng_info, c=
onst ImageInfo *image_info,
+               mng_info->magn_methy =3D 1;
+             if (mng_info->magn_methx =3D=3D 1)
+               {
+-                magnified_width=3Dmng_info->magn_ml;
++                magnified_width=3D(size_t) mng_info->magn_ml;
+=20
+                 if (image->columns > 1)
+                    magnified_width +=3D mng_info->magn_mr;
+=20
+                 if (image->columns > 2)
+-                   magnified_width +=3D (png_uint_32)
++                   magnified_width +=3D (size_t)
+                       ((image->columns-2)*(mng_info->magn_mx));
+               }
+=20
+             else
+               {
+-                magnified_width=3D(png_uint_32) image->columns;
++                magnified_width=3D(size_t) image->columns;
+=20
+                 if (image->columns > 1)
+                    magnified_width +=3D mng_info->magn_ml-1;
+@@ -6862,25 +6862,25 @@ static Image *ReadOneMNGImage(MngInfo* mng_info, c=
onst ImageInfo *image_info,
+                    magnified_width +=3D mng_info->magn_mr-1;
+=20
+                 if (image->columns > 3)
+-                   magnified_width +=3D (png_uint_32)
++                   magnified_width +=3D (size_t)
+                       ((image->columns-3)*(mng_info->magn_mx-1));
+               }
+=20
+             if (mng_info->magn_methy =3D=3D 1)
+               {
+-                magnified_height=3Dmng_info->magn_mt;
++                magnified_height=3D(size_t) mng_info->magn_mt;
+=20
+                 if (image->rows > 1)
+                    magnified_height +=3D mng_info->magn_mb;
+=20
+                 if (image->rows > 2)
+-                   magnified_height +=3D (png_uint_32)
++                   magnified_height +=3D (size_t)
+                       ((image->rows-2)*(mng_info->magn_my));
+               }
+=20
+             else
+               {
+-                magnified_height=3D(png_uint_32) image->rows;
++                magnified_height=3D(size_t) image->rows;
+=20
+                 if (image->rows > 1)
+                    magnified_height +=3D mng_info->magn_mt-1;
+@@ -6889,7 +6889,7 @@ static Image *ReadOneMNGImage(MngInfo* mng_info, con=
st ImageInfo *image_info,
+                    magnified_height +=3D mng_info->magn_mb-1;
+=20
+                 if (image->rows > 3)
+-                   magnified_height +=3D (png_uint_32)
++                   magnified_height +=3D (size_t)
+                       ((image->rows-3)*(mng_info->magn_my-1));
+               }
+=20
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/me=
ta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index 351e1eaf8c..751186b361 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -33,6 +33,7 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git=
;branch=3Dmain;protocol=3Dhtt
     file://0007-ImageMagick-Add-support-patch-to-fix-CVE-2025-57803.patch =
\
     file://0007-ImageMagick-Fix-CVE-2025-57803.patch \
     file://0008-ImageMagick-Fix-CVE-2025-57807.patch \
+    file://0009-ImageMagick-Fix-CVE-2025-55154.patch \
 "
=20
 SRCREV =3D "35b4991eb0939a327f3489988c366e21068b0178"
--=20
2.34.1


