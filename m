Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B51BC678DB
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 12:05:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6955.1677067507616077063
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Feb 2023 04:05:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hIxi/9fW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1417fd3ed4=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31MAPtjD031618
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 04:05:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=nCN2xRFknSMAGiE+Oclz0vYy5pMiFtkkEczlpidFfUY=;
 b=hIxi/9fWmA4r00GOB/XjzuM7WiKMd7NZcc32Ug1elTpWWLC67FzYBsxqABy6FUUC2HNp
 pAjOLH2gJoWz1MpJRpMxrd4NC7F6OQvbmVAkQUfXDJ+tY5TVkOgccIYwm9hD1KYLnnfq
 i8xgvPUutKa3g2b4MzyrXePdKqcN3SYtMLXfdzYfQunaA3eH0jYKJ9g6VOtljfTGdV7G
 hoRRNp33CkEgR3u39sHrl249DHnQbiDwL3rQgZc7G3iBR+niLKpJyQ3/xh/5G6qUAwYf
 2j84kGIJ500nIUc4u0mWEHdyHbPQA2bQB8CMPV6DAmussg0pXrhU6dvp8YQK8IMgu3TY fQ== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6umbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 04:05:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FL+K2aaCPcFxk/TN00TE5fxozwnU5lH2lZSvbFMjaMP4pKzDR/Wut8cK42R23JFoCPTEWjycwG9uQ8X241nxtcrV6bMZ6/9eErtPNtQMGNsKyDGJatOOnZaTJq7o9soxwI8s4L7CDAZoT0J4PxVpCfGlaQRty3CBF9E4zORFm2/yVIgzAXxdTLqOV6XCkGCd0ZFDAOWU7RHttR03b1hyb2A6pWcqNKckXttb9IcbLr2t8eRsiPhQwQ/VDG51+MjPaPTYzwH5qyb0iAyh8OvcbjT9BvbNXOTjebhrdSJsmO1n5/Ai9gTpWvDbLHnDOUwKg2gZjOS8QB0TaEvGjAaFpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCN2xRFknSMAGiE+Oclz0vYy5pMiFtkkEczlpidFfUY=;
 b=PkxeA1FWAh4KPE+TENm27eVM8AvgfcerRBazBxlbmtBp62bbO65KNCbjLWSesNUHLSjs0l5AmDeBqt7LECZKOkfi2TRi2PrYucrDzpLE93fC7SGS7CW1JlHqE8XImF7J+/MdkLIGzUWXOjCjXi7ZvOjeGS6srllDes19PBEfno3x7p+7GTxNin6fgZBuU6lru0uGK8xGSJ3LNmP/Y1AVejmttdsh/tQSWX36s5uT8JhK4lZAAnECJKdYLKON5Erf6rECy0G6RD9VBD/hj9S0S4AsX2JuZ1Q1jeDafJoi6oMGJezOkWT6EJxPRhRgnVMy9LInb8qc2CMCCUFXwmmB+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by MW3PR11MB4521.namprd11.prod.outlook.com (2603:10b6:303:55::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 12:05:04 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::37fa:8b56:8596:c286]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::37fa:8b56:8596:c286%4]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 12:05:04 +0000
From: "Mali, Narpat" <Narpat.Mali@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "Polampalli, Archana" <Archana.Polampalli@windriver.com>,
        "G Pillai, Hari"
	<Hari.GPillai@windriver.com>
Subject: RE: [oe][meta-python][kirkstone][PATCH 1/1] Fix collections.abc
 deprecation warning in downloadutils Warning appears as:
Thread-Topic: [oe][meta-python][kirkstone][PATCH 1/1] Fix collections.abc
 deprecation warning in downloadutils Warning appears as:
Thread-Index: AQHZE2vtlPIxu1JHAEeIoEmi+CbwLq7bRDIA
Date: Wed, 22 Feb 2023 12:05:04 +0000
Message-ID: 
 <DM4PR11MB55505E4A9EF24EC63FC7E772E4AA9@DM4PR11MB5550.namprd11.prod.outlook.com>
References: <20221219053618.3558291-1-narpat.mali@windriver.com>
In-Reply-To: <20221219053618.3558291-1-narpat.mali@windriver.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5550:EE_|MW3PR11MB4521:EE_
x-ms-office365-filtering-correlation-id: 470bc454-0c8e-4f35-ff49-08db14cd0865
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 aqy4j8njcW7kgK03ouLB9qdPV20NqLbBMxfOA7m9m6CZMsX167RVA3WnANjFbpyMVcTHZ7pXzy05+CuY/fabUHO6TFfN6cSqoqSN9L8zfbf/Wvk1QSB/T0yHi4jo7xd7PYtxO1tDzrjvIUlru8b7v8FEnkZu7dh+wtHG7aMh24w71JKnAY4reJOWgh7XCS+65fefLU8+GJsWqSxxfLLBlXmNB/ji5jznkvi+vPaS1l1rkSylcitl/+2TsJW8itVo94KZagzg0zmkJI9fbYu/2a77/u/Uuk1pVzqOFkkcwSoV1u0yApWBcNoQkFr1OnH0mGiBssmisG8X+TOVbUNpWrxVB2ojOMAGX14jgw4pmU1oBW92Zb4TqLC4FOLKhdSTghOJln944jJ32FjcZ1GfVm+21flsNHjfDQmuQVUBI0DSVau0qbIArSwuR3V0fI3Xx986PaE7tFuWuXpLUisG0Nm0jlBmNIZLQGL+ZpnIbtJoxt+mraEjGuTx7eZaAI6rf7knEXpZ8mzehfaFm3CvqjWq5vD3skBCznkBopDDoVkFink1fVyquJ6ecciJFVE8zkT/YO55e9QMkSDpz/5n8pexcQQD30DZyp51U0GqVz7BN5Ii9JvOEgiMWo2xbIlq5QJ0tMdsRVkEDiuf0q31eVMvvGhFBcrtYADvBgaqZxGhZgUgD2XQhhco+hSF4WL8
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(376002)(366004)(136003)(39850400004)(451199018)(66899018)(122000001)(83380400001)(166002)(71200400001)(316002)(66446008)(76116006)(26005)(55016003)(66946007)(4326008)(6916009)(64756008)(478600001)(91956017)(66476007)(9686003)(186003)(6506007)(8676002)(66556008)(38070700005)(38100700002)(33656002)(86362001)(107886003)(53546011)(8936002)(2906002)(41300700001)(5660300002)(52536014)(7696005)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?WPO/Mufq5xYgKAj3/HI4RVs7xY5XECri0Rg+7H6cthGT+TgtYu6xjlGTbVIB?=
 =?us-ascii?Q?WotGNCwMGO5TGCtnFXd4jdY/0eEgclD76zdLh149AXSpQMAd0SSGWtsRBTyq?=
 =?us-ascii?Q?n1PVkPEJ0ZMIOFqj344qr1KyJFBfbJoJIo6HzoVm0wfZNREH39Is0BMf2sxi?=
 =?us-ascii?Q?XUTpjXzd1pVZnIu5DngupNGiZlJ8CTA8MNR6SJow2HboayR0n7g/BxzKE0u/?=
 =?us-ascii?Q?Zbr4mZVa2OqRhCD10p3MjfeRJN+NU2L0HgITrUlLbVTZcIXn9cYbdl0Gea6K?=
 =?us-ascii?Q?5t0922uju39HoIYWmS895PvSZoLib562lEIkHjQNDDNgMlLclZr2GUo830FQ?=
 =?us-ascii?Q?0vD89qEymVulLyBcWgbbE7aU5yCgLhx0xY+eESUsYjC1UHm1WT2Y+6dNzIjz?=
 =?us-ascii?Q?8EKh7ibkcNtkAXEDkO6OJL0/fx84BuKQ06MqJnCg4ebpQn/pgZWn1Bwpdfba?=
 =?us-ascii?Q?6Xh+KVBUxliT/jJ7d5CzzntVrMRwqv3w0B+mSRyDSWhVu+fm1aunYBVGkPYP?=
 =?us-ascii?Q?pUb0Q4QIzcOmIEWwRmdipazUhQa86ly9E37q0854iAh7AVh2tvFpLG3YMYfg?=
 =?us-ascii?Q?M8h00l0Seqs5RKI1heLF/p9Xb9t5NwCRpOcc2bFqaWLgd1wYLLiI6g+2AqbM?=
 =?us-ascii?Q?I8D3jnK/6oViTHWBwoPGLmdLidFuXMRq7iCd4jgnssS/UbWWhxmUb3DviYC4?=
 =?us-ascii?Q?HKEdNxy35qiTbvIEchmawXCnVpGbryDmZ5+zjMfBmdYH2bXOnqOQgrt7tJJS?=
 =?us-ascii?Q?imuxR8Irk0zMP2zv8Qpuyr49iOVqnSkQP9aSB5o0hqRBY0WzkfAiaeJNGLBN?=
 =?us-ascii?Q?IBkdiHyLmIA9m8dTYJ4B2PhsiLS1Xxcgct+9kUCkWbMuLUdtbLE4AhKhzJY2?=
 =?us-ascii?Q?R9rwxIRcp8+9aUvj0Y19NVHxS9zXvmWg7FQskh6JErnbRDmzrOdoalAD8y+j?=
 =?us-ascii?Q?nj9QdH8fZsRokFyz915k/eB65z6m/1X6Z02bOdcZ9U0JZNLOtxhegBRKHPlk?=
 =?us-ascii?Q?5jRG5NJ6rlhTkBypuIZMBt23yu3E97pnx4tMsoV1qJ86iNaqqZYJ2fKcwISC?=
 =?us-ascii?Q?w50V261QfnWYGPWDsTYUUqClgEvbtfMZiPpUY3EpeP2h9Pb5pkx+5CR81dg1?=
 =?us-ascii?Q?o2zlNVxSf1v10EdW4R0GXR9avqJ6imjo+EGjeqYu6Z1acoTbqunsf5nboP0Z?=
 =?us-ascii?Q?xf0w522kzxKfYkTfHkfH9Tgrpkq+gYUWk0tIzEkMQm6WphQIH7NMedNFID2C?=
 =?us-ascii?Q?MFMoIVd8aOgKeQem8TK345Q0WGVaZIXzjlK+Uqo3XNuzxVXFgCUdWVbvQ713?=
 =?us-ascii?Q?zPNZ04Wgxq+XnSuYhmu5PiSvyx3PTafvtiWRe/JPrOexHSnYP7aO2BYpaUcF?=
 =?us-ascii?Q?czHVNNAD/V79dj0dJNss7LjTwhgUzI5O/nzqPpZFneCsyR/63Ov4TV6QQlya?=
 =?us-ascii?Q?/ZYH15j95CodjFt8kEMEqtomwkjTjvMDXXC/BrROt1kiOIkNrLXwIjAY2j1a?=
 =?us-ascii?Q?8Hxo/BsPSdpZ55VY0CWk+yCNZtqwDfVoxZdwzv78ldKoHCywYAhl5WPs/9GZ?=
 =?us-ascii?Q?tHzSo5Tk93SxMfpHB1g0EYes6dea+u1mXlcSbtoS53UOcM58F7c77ARQRL44?=
 =?us-ascii?Q?khpWk6SclH5r4UdD8SStnOY=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB55505E4A9EF24EC63FC7E772E4AA9DM4PR11MB5550namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 470bc454-0c8e-4f35-ff49-08db14cd0865
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 12:05:04.4654
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lUXHCyMpXWRgCNsSeAvFObnZjesWwHuGKH4Ok5hr+tvunKG9dTdNVLDZHbzLEm4MivdutSsIwm4A19v5UuGLWj3xvYB5gxL21XBMzkj2E+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4521
X-Proofpoint-ORIG-GUID: pAryiIC10Bt9GxoXqR2RWfVjz1DtAyGK
X-Proofpoint-GUID: pAryiIC10Bt9GxoXqR2RWfVjz1DtAyGK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_05,2023-02-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302220106
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 12:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101209

--_000_DM4PR11MB55505E4A9EF24EC63FC7E772E4AA9DM4PR11MB5550namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reminder.

Best Regards,
Narpat

From: Narpat Mali<mailto:narpat.mali@windriver.com>
Sent: 19 December 2022 11:07
To: openembedded-devel@lists.openembedded.org<mailto:openembedded-devel@lis=
ts.openembedded.org>
Cc: Polampalli, Archana<mailto:Archana.Polampalli@windriver.com>; G Pillai,=
 Hari<mailto:Hari.GPillai@windriver.com>; Mali, Narpat<mailto:Narpat.Mali@w=
indriver.com>
Subject: [oe][meta-python][kirkstone][PATCH 1/1] Fix collections.abc deprec=
ation warning in downloadutils Warning appears as:

tests/test_downloadutils.py::test_stream_response_to_specific_filename
  requests_toolbelt/downloadutils/stream.py:161: DeprecationWarning: Using =
or importing the ABCs from 'collections' instead of from 'collections.abc' =
is deprecated, and in 3.8 it will stop working
    if path and isinstance(getattr(path, 'write', None), collections.Callab=
le):

Upstream-Status: Backport [https://github.com/requests/toolbelt/commit/7188=
b06330e5260be20bce8cbcf0d5ae44e34eaf]

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 ...abc-deprecation-warning-in-downloadu.patch | 41 +++++++++++++++++++
 .../python/python3-requests-toolbelt_0.9.1.bb |  5 ++-
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-requests-to=
olbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch

diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt/=
0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch b/meta-pyth=
on/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.a=
bc-deprecation-warning-in-downloadu.patch
new file mode 100644
index 000000000..baa833b6d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fi=
x-collections.abc-deprecation-warning-in-downloadu.patch
@@ -0,0 +1,41 @@
+From 7188b06330e5260be20bce8cbcf0d5ae44e34eaf Mon Sep 17 00:00:00 2001
+From: Jon Dufresne <jon.dufresne@gmail.com>
+Date: Fri, 1 Feb 2019 16:30:01 -0800
+Subject: [PATCH] Fix collections.abc deprecation warning in downloadutils
+
+Warning appears as:
+
+tests/test_downloadutils.py::test_stream_response_to_specific_filename
+  requests_toolbelt/downloadutils/stream.py:161: DeprecationWarning: Using=
 or importing the ABCs from 'collections' instead of from 'collections.abc'=
 is deprecated, and in 3.8 it will stop working
+    if path and isinstance(getattr(path, 'write', None), collections.Calla=
ble):
+
+Upstream-Status: Backport [https://github.com/requests/toolbelt/commit/718=
8b06330e5260be20bce8cbcf0d5ae44e34eaf]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ requests_toolbelt/downloadutils/stream.py | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/requests_toolbelt/downloadutils/stream.py b/requests_toolbelt=
/downloadutils/stream.py
+index eed60a7..1d1c31b 100644
+--- a/requests_toolbelt/downloadutils/stream.py
++++ b/requests_toolbelt/downloadutils/stream.py
+@@ -1,6 +1,5 @@
+ # -*- coding: utf-8 -*-
+ """Utilities for dealing with streamed requests."""
+-import collections
+ import os.path
+ import re
+
+@@ -158,7 +157,7 @@ def stream_response_to_file(response, path=3DNone, chu=
nksize=3D_DEFAULT_CHUNKSIZE):
+     pre_opened =3D False
+     fd =3D None
+     filename =3D None
+-    if path and isinstance(getattr(path, 'write', None), collections.Call=
able):
++    if path and callable(getattr(path, 'write', None)):
+         pre_opened =3D True
+         fd =3D path
+         filename =3D getattr(fd, 'name', None)
+--
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt_=
0.9.1.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.=
9.1.bb
index 366f41ca8..72ad7a618 100644
--- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.b=
b
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.b=
b
@@ -6,7 +6,8 @@ LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D71760e0f1dda8cff91b0bc9246caf57=
1"

 SRC_URI =3D "file://run-ptest \
-          "
+           file://0001-Fix-collections.abc-deprecation-warning-in-download=
u.patch \
+           "

 SRC_URI[md5sum] =3D "b1509735c4b4cf95df2619facbc3672e"
 SRC_URI[sha256sum] =3D "968089d4584ad4ad7c171454f0a5c6dac23971e9472521ea3b=
6d49d610aa6fc0"
@@ -31,4 +32,4 @@ do_install_ptest() {
         # remove test test_multipart_encoder.py as it fails,
         # downloaded file is not supported
         rm -f ${D}${PTEST_PATH}/tests/test_multipart_encoder.py
-}
+}
--
2.25.1


--_000_DM4PR11MB55505E4A9EF24EC63FC7E772E4AA9DM4PR11MB5550namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-IN" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Reminder.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,</p>
<p class=3D"MsoNormal">Narpat</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"border:none;padding:0cm"><b>From: </b><a hr=
ef=3D"mailto:narpat.mali@windriver.com">Narpat Mali</a><br>
<b>Sent: </b>19 December 2022 11:07<br>
<b>To: </b><a href=3D"mailto:openembedded-devel@lists.openembedded.org">ope=
nembedded-devel@lists.openembedded.org</a><br>
<b>Cc: </b><a href=3D"mailto:Archana.Polampalli@windriver.com">Polampalli, =
Archana</a>;
<a href=3D"mailto:Hari.GPillai@windriver.com">G Pillai, Hari</a>; <a href=
=3D"mailto:Narpat.Mali@windriver.com">
Mali, Narpat</a><br>
<b>Subject: </b>[oe][meta-python][kirkstone][PATCH 1/1] Fix collections.abc=
 deprecation warning in downloadutils Warning appears as:</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">tests/test_downloadut=
ils.py::test_stream_response_to_specific_filename<br>
&nbsp; requests_toolbelt/downloadutils/stream.py:161: DeprecationWarning: U=
sing or importing the ABCs from 'collections' instead of from 'collections.=
abc' is deprecated, and in 3.8 it will stop working<br>
&nbsp;&nbsp;&nbsp; if path and isinstance(getattr(path, 'write', None), col=
lections.Callable):<br>
<br>
Upstream-Status: Backport [<a href=3D"https://github.com/requests/toolbelt/=
commit/7188b06330e5260be20bce8cbcf0d5ae44e34eaf">https://github.com/request=
s/toolbelt/commit/7188b06330e5260be20bce8cbcf0d5ae44e34eaf</a>]<br>
<br>
Signed-off-by: Narpat Mali &lt;narpat.mali@windriver.com&gt;<br>
---<br>
&nbsp;...abc-deprecation-warning-in-downloadu.patch | 41 ++++++++++++++++++=
+<br>
&nbsp;.../python/python3-requests-toolbelt_0.9.1.bb |&nbsp; 5 ++-<br>
&nbsp;2 files changed, 44 insertions(+), 2 deletions(-)<br>
&nbsp;create mode 100644 meta-python/recipes-devtools/python/python3-reques=
ts-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch=
<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt/=
0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch b/meta-pyth=
on/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.a=
bc-deprecation-warning-in-downloadu.patch<br>
new file mode 100644<br>
index 000000000..baa833b6d<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fi=
x-collections.abc-deprecation-warning-in-downloadu.patch<br>
@@ -0,0 +1,41 @@<br>
+From 7188b06330e5260be20bce8cbcf0d5ae44e34eaf Mon Sep 17 00:00:00 2001<br>
+From: Jon Dufresne &lt;jon.dufresne@gmail.com&gt;<br>
+Date: Fri, 1 Feb 2019 16:30:01 -0800<br>
+Subject: [PATCH] Fix collections.abc deprecation warning in downloadutils<=
br>
+<br>
+Warning appears as:<br>
+<br>
+tests/test_downloadutils.py::test_stream_response_to_specific_filename<br>
+&nbsp; requests_toolbelt/downloadutils/stream.py:161: DeprecationWarning: =
Using or importing the ABCs from 'collections' instead of from 'collections=
.abc' is deprecated, and in 3.8 it will stop working<br>
+&nbsp;&nbsp;&nbsp; if path and isinstance(getattr(path, 'write', None), co=
llections.Callable):<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/requests/toolbelt=
/commit/7188b06330e5260be20bce8cbcf0d5ae44e34eaf">https://github.com/reques=
ts/toolbelt/commit/7188b06330e5260be20bce8cbcf0d5ae44e34eaf</a>]<br>
+<br>
+Signed-off-by: Narpat Mali &lt;narpat.mali@windriver.com&gt;<br>
+---<br>
+ requests_toolbelt/downloadutils/stream.py | 3 +--<br>
+ 1 file changed, 1 insertion(+), 2 deletions(-)<br>
+<br>
+diff --git a/requests_toolbelt/downloadutils/stream.py b/requests_toolbelt=
/downloadutils/stream.py<br>
+index eed60a7..1d1c31b 100644<br>
+--- a/requests_toolbelt/downloadutils/stream.py<br>
++++ b/requests_toolbelt/downloadutils/stream.py<br>
+@@ -1,6 +1,5 @@<br>
+ # -*- coding: utf-8 -*-<br>
+ &quot;&quot;&quot;Utilities for dealing with streamed requests.&quot;&quo=
t;&quot;<br>
+-import collections<br>
+ import os.path<br>
+ import re<br>
+ <br>
+@@ -158,7 +157,7 @@ def stream_response_to_file(response, path=3DNone, chu=
nksize=3D_DEFAULT_CHUNKSIZE):<br>
+&nbsp;&nbsp;&nbsp;&nbsp; pre_opened =3D False<br>
+&nbsp;&nbsp;&nbsp;&nbsp; fd =3D None<br>
+&nbsp;&nbsp;&nbsp;&nbsp; filename =3D None<br>
+-&nbsp;&nbsp;&nbsp; if path and isinstance(getattr(path, 'write', None), c=
ollections.Callable):<br>
++&nbsp;&nbsp;&nbsp; if path and callable(getattr(path, 'write', None)):<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pre_opened =3D True<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D path<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; filename =3D getattr(fd, =
'name', None)<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt_=
0.9.1.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.=
9.1.bb<br>
index 366f41ca8..72ad7a618 100644<br>
--- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.b=
b<br>
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.b=
b<br>
@@ -6,7 +6,8 @@ LICENSE =3D &quot;Apache-2.0&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://LICENSE;md5=3D71760e0f1d=
da8cff91b0bc9246caf571">file://LICENSE;md5=3D71760e0f1dda8cff91b0bc9246caf5=
71</a>&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI =3D &quot;file://run-ptest \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch">
file://0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch</a> =
\<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&nbsp;<br>
&nbsp;SRC_URI[md5sum] =3D &quot;b1509735c4b4cf95df2619facbc3672e&quot;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;968089d4584ad4ad7c171454f0a5c6dac23971e9=
472521ea3b6d49d610aa6fc0&quot;<br>
@@ -31,4 +32,4 @@ do_install_ptest() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # remove test test_multipa=
rt_encoder.py as it fails,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # downloaded file is not s=
upported<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm -f ${D}${PTEST_PATH}/te=
sts/test_multipart_encoder.py<br>
-}<br>
+} <br>
-- <br>
2.25.1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM4PR11MB55505E4A9EF24EC63FC7E772E4AA9DM4PR11MB5550namp_--

