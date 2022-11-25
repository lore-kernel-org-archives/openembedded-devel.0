Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C429DC4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 17:48:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.52649.1669398504946175188
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Nov 2022 09:48:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=csoIRkfd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8328c4fba4=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2APHWmaI024040
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 17:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=eNH1D1WjPxC+EsTOvTekzjS57i939whZt1xY9Kdt+Ak=;
 b=csoIRkfd1kpvV1x5OGBj/Wu4a0QxTovgIoR+lhQNHokbmmSnZ2qXye5GK8a2s96ZzL+5
 l50U6RxHx+p0Edl69nIOXGC7ezyv0Hxi5un9HREvY67JXOqAj0CiF/W+fCazgfJVkygP
 v1DIw85GLhFh42+HDCL1il1v1QfXRUgPV3i9QsTlmnq5HeR/z8bAg9DJ2lvyvCgAfZcL
 NU76inidlxRefVfN3Q2YyOCczLxf2StJwRgJH4ZdXvAkzRIsM5SxCHoWKGal4ULs0pTx
 71zh57z1jdPeapHOTte4CIUQ2c0IpOv9htDKS9K4n02LH7Bwy7JDjmUFgyN4lOxtsnN5 /A== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxp48n5ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 17:48:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYn/0kYp+Jkb4ho37W1NTn7UcjIn6HOu6UiQ0UZ0a3FMh/L5T0PKbVF9ij2IlgxzNNv/oH9ZrGYTAdwF3mkXMhYiXurh+NPuzOyFVRC30q9YKAklZm/m5gRZCkIKbZPVUO8/rBboGp2XTt2UXH4BcEJVoADYPPUM9a/NF2YXOi7efvIoJL8/bEpMQ6MRhW/9qTDjAPk1HsebSFBj29JScf+1aBmOJzzfCdUBo2gpM/TjqcImhwM7rHk2Sco8/jIQU+Q5sYFLrLkx5prvqXXndTlx6hWt4ow/e1UXT651EbQtKp85+CqKoGYvfd+rNKEVwRGmdbYUSDa51T6LMpyrlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNH1D1WjPxC+EsTOvTekzjS57i939whZt1xY9Kdt+Ak=;
 b=YRS+z4FHa15Q9HLP6JUJF2fppEWD0VcYolpS6BbdJgq5x2aZ3/RYuiv0p2Rw6+vQlhE7Om981SlwWzP+2OW1eSSceHQkso79KEOlsI93f97FiEcCC5nuJ+zSSj6A/TfK/bGIrSo7+U58LxMp+XPtQgHMorNvWfU+I6SKgYMvYw87WYXgyZIVhN9REDNuHR6xfBV4z2JOYhUtxiGYAducUIurgHdk/zLNF5rffB2TYb9GA1rrXVIV0tweHIO7qeIO9dMhy4sk4laQgcwYqeWNBaP7UrEBt6C8NgH1R9OlHuaf3ygRhyOqLF5wBR5WudaXb9NXlUe5LoZqknwVzKpb7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by PH7PR11MB6475.namprd11.prod.outlook.com (2603:10b6:510:1f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Fri, 25 Nov
 2022 17:48:20 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3fdd:fc11:e12c:46b0]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3fdd:fc11:e12c:46b0%5]) with mapi id 15.20.5857.020; Fri, 25 Nov 2022
 17:48:20 +0000
From: Zheng Qiu <zheng.qiu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: zheng.qiu@windriver.com, randy.macleod@windriver.com
Subject: [master][PATCH v3] tiff: Security fix for CVE-2022-3970
Date: Fri, 25 Nov 2022 12:47:59 -0500
Message-Id: <20221125174759.3658017-1-zheng.qiu@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT3PR01CA0077.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::25) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|PH7PR11MB6475:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c983f37-d209-4fbf-aaa4-08dacf0d3cff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f5TGxUwUO94G8n1E4bNL8gssYfplZC5eZow8wLpdUGLN0nJZusJPJ/R2/KSZi72Z/EiEHlvP/Pq4qeq+WEJohZQ15J0pfUJuHQ74oXlz1zBRTDyJbq6J9afzPx66jNZhSO6GnN1Y0Qn2YqKTz6CkGC7hsND43MvAv6PG+0ahrk2IKMUXdLBTX5Izy5DgErM4Admwu1OSdufb/hyyU9oWCLqfqzqyP0/OY+dR3noM4l6TccXzzZSFjLSSmfxwRds2RjuroQbdQv78uGUNxqbUA7pXq3qzhyDckCEe8sxgXA3CtGeiEXB45ow5wje8TP8cNHeYToF87IWF6fxGp89RzwKfKAEdHNAfKrYOx2jrcmkFaBKsx2UAWu27GCck9Hkl4dsJmT8kZ+csDDdlc5Ls3hCndaqJxm8Ufo/1p7+gwH6ExZ0gO4KuK9RdZP468s4o8XuD1yRLVPj0b9Fa7cIBzsshGVSILlLIe+sLj3eBQkYHHfpsXtctsZ6zADUZ3oKkBfGmk2tn4btz16tKDfsl6fPSFrtJ72M62LUMBw2AheG+c7zstFAXG+QYli9sVAqBMBIslgd6xLacIkUhAqKAdbdvYwLAAsAAeYTEnw5wT5N/XjmccDiLJcXwRZKC69pA+ep39CaOh+r9cGCs7nYnTa+hgAa+txWePtttC2l5/i3Q/gvIidvOb7Bb+tNL5lwUmSJjUJt0RK0myxYK4oX4euGCwfF/culHIJ4fdoAkbWkdl9kN9C9ubGmg8kjE8CdTXEjP40H5dxCavoFr5OB3aw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(376002)(136003)(396003)(366004)(346002)(451199015)(15650500001)(66946007)(66556008)(36756003)(66476007)(8936002)(41300700001)(44832011)(8676002)(5660300002)(86362001)(107886003)(4326008)(26005)(6512007)(52116002)(6506007)(6666004)(83380400001)(2616005)(1076003)(186003)(6916009)(316002)(966005)(6486002)(38100700002)(38350700002)(478600001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RKo4Wc+aIrLyvf5xllIMmn0TGFH3JWAs9NQWWXWUxx5nfiy4pnXh/eO3RSwH?=
 =?us-ascii?Q?oIEPv5O/JzSgSDxJ11ZYJoBXBmqfUYbceqLKMcPTQIkOj896dHVoar6yvH9+?=
 =?us-ascii?Q?rAX8vOiWoTyWXGXs0ySrkX9p3z1Ep2PbD6AWqCokCIxIiK8/RhVo8CH2hNW/?=
 =?us-ascii?Q?/HXsiPmWHsn+V3JbMFHzMZhkFdAzrFzZt9s4ki4N6OfRsYgM603dAC1BeCtz?=
 =?us-ascii?Q?2exmZq8U5W8IyiAYHnhG0ijECLwmb2at919kbEgg9O6IxmI5YeBmUDz27tA/?=
 =?us-ascii?Q?DXv1U2Qz0aX2Qq1Z/YxgDvo5Px6YgeEe4DfM/RwkPKnUVxtzwPN6eEBmmiOC?=
 =?us-ascii?Q?5GFaXxj3A+Gptt7oOWgEpJnNl+WVb5kLXfUk2lNM5QoBWg7+nHuMRXC21Kfw?=
 =?us-ascii?Q?IRZftJM73EBTAp/bXXm0V0GTqUiy68aGY86UcDlaEqRf9of06oEQ6cL3a22F?=
 =?us-ascii?Q?oJ7lbtsevRrWj5zsVDKHNfRjQQO+4JdRGG/mN5r/1CbunUsh1wj+gJNSjBfs?=
 =?us-ascii?Q?hJxjUogn1ASsna4iIh9/7PlWEezjq/Y8TaoJLruJVywgFI8XfEMRmwl6lhVJ?=
 =?us-ascii?Q?HnGRfADl1A2lwZYBNQZcWjkf1l8qwNIGn8m+Z5mlktJJ6IaQDfbPUSPUbG3Q?=
 =?us-ascii?Q?brL4ps7O4qiojSaMeJQWaY+gjqi9i6tjlwEQifHzdTGUJA2CgYSbtSwrKzxh?=
 =?us-ascii?Q?ZOWMTSllTFn8CrME0wxVTI3aAKYST1SlxRI4rCL61c76S0lHcS7O483/aGuM?=
 =?us-ascii?Q?orwZ3rRtS5ycjLmhIyp6yrrAO42aSoveeBE5NqwI83v3nDrv9cQABr6A9H0X?=
 =?us-ascii?Q?PC/ish0VsLa21VF9NwMC9Ro4pL9JU09FVAyLUJrkzOmi8geZD0frRAuYt/ke?=
 =?us-ascii?Q?M02P95tcgY2+V+kK9QMxsAQQK3BJZhDksoGRicNHPqDrjqSGOzbpA8QUHDZt?=
 =?us-ascii?Q?lHfy9e4RNn78oo0h/ZAIkSoulA+frMc9siwn8L17J8yDiSdKcmCIy1+XLI4n?=
 =?us-ascii?Q?gjiBehpQ442GuNe3JqGz+N0O5jswOx4VLY+LLo55iBtqJHF1VuYAu9+7LiF/?=
 =?us-ascii?Q?jwydUWIAQ1j3/zqe/2rgFYDffYG+omaqkbfZ0aZyFMWozre4aWurVDxqJVka?=
 =?us-ascii?Q?V4DFPwsthovioZFrZ/0+6QbgtGTU43MuiJfPqVmPfcUzwYSNtNkkPwjgT8q/?=
 =?us-ascii?Q?8Q2IyoyGy9e9HYlIlUYu4ZJBkyyt6/EZBc14n14XYRrA1UnlLvmiPgp2azxj?=
 =?us-ascii?Q?4b64pAf2ri+vDWLcI7FDmvCQnyXtfigpQ4cxLh31Ice0YamAH0yFK89cIdLY?=
 =?us-ascii?Q?jrO63NOXxMJGSQzVaP8jjvSlEu514bLT1lQYgOVDn/eUDU1qm3xHRSSZelsN?=
 =?us-ascii?Q?1Pj4N/ta8sCIio04UQ6Ny6q1U6PjmtSZ20HqSbJueJKw3en2PF62TFmrnA6G?=
 =?us-ascii?Q?FWIXMVWSK5Q9ajrI8ua9HHqlEk5enlFM50C6lfohqiciAOxO3IgBu/tTDTmk?=
 =?us-ascii?Q?1ViCw6Qd9GC97NBEZBGejXK2UjElTSAi+mFp1bJOuhsr8rmERbnNjrfBIN44?=
 =?us-ascii?Q?XaEWCJ7obKPeTLKOkaCngxOvxO1Ih2lWcqt2SAWsVQ3qfRi0vq5wa/1qC54n?=
 =?us-ascii?Q?Qg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c983f37-d209-4fbf-aaa4-08dacf0d3cff
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 17:48:20.2975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JK8P2yR//33MeAydPmVh/yVnLymNzFKkcJ8SJCFsmZ6UhPgwbYIrkF9Q4rfPYcGzppRImk6ljHTFBMKQtEfGog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6475
X-Proofpoint-GUID: KAGJsI89L5JMHYZvnwEDUapZbc_4oSFx
X-Proofpoint-ORIG-GUID: KAGJsI89L5JMHYZvnwEDUapZbc_4oSFx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-25_09,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=637
 lowpriorityscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211250138
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 17:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99736

This patch contains a fix for CVE-2022-3970

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-3970
https://security-tracker.debian.org/tracker/CVE-2022-3970

Patch generated from :
https://gitlab.com/libtiff/libtiff/-/commit/227500897dfb07fb7d27f7aa570050e62617e3be

Upstream-Status: Accepted

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
---
 .../libtiff/files/CVE-2022-3970.patch         | 38 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch
new file mode 100644
index 0000000000..e8f143933a
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch
@@ -0,0 +1,38 @@
+From 227500897dfb07fb7d27f7aa570050e62617e3be Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Tue, 8 Nov 2022 15:16:58 +0100
+Subject: [PATCH] TIFFReadRGBATileExt(): fix (unsigned) integer overflow on
+ strips/tiles > 2 GB
+
+Fixes https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=53137
+---
+ libtiff/tif_getimage.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index a4d0c1d6..60b94d8e 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -3016,15 +3016,15 @@ TIFFReadRGBATileExt(TIFF* tif, uint32_t col, uint32_t row, uint32_t * raster, in
+         return( ok );
+ 
+     for( i_row = 0; i_row < read_ysize; i_row++ ) {
+-        memmove( raster + (tile_ysize - i_row - 1) * tile_xsize,
+-                 raster + (read_ysize - i_row - 1) * read_xsize,
++        memmove( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize,
++                 raster + (size_t)(read_ysize - i_row - 1) * read_xsize,
+                  read_xsize * sizeof(uint32_t) );
+-        _TIFFmemset( raster + (tile_ysize - i_row - 1) * tile_xsize+read_xsize,
++        _TIFFmemset( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize+read_xsize,
+                      0, sizeof(uint32_t) * (tile_xsize - read_xsize) );
+     }
+ 
+     for( i_row = read_ysize; i_row < tile_ysize; i_row++ ) {
+-        _TIFFmemset( raster + (tile_ysize - i_row - 1) * tile_xsize,
++        _TIFFmemset( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize,
+                      0, sizeof(uint32_t) * tile_xsize );
+     }
+ 
+-- 
+2.33.0
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
index 29cb4111d6..970aab5433 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch \
            file://CVE-2022-34526.patch \
            file://CVE-2022-2953.patch \
+           file://CVE-2022-3970.patch \
            file://0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch \
            file://0001-tiffcrop-S-option-Make-decision-simpler.patch \
            file://0001-tiffcrop-disable-incompatibility-of-Z-X-Y-z-options-.patch \
-- 
2.33.0


