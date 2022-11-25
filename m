Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD787C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 18:07:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.53319.1669399663969897491
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Nov 2022 10:07:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XW1XOnmD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8328c4fba4=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2APGBV8S021209
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 10:07:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=+dU20xl2pUIO7EnuiuOWi1xFdSmz+CxQu8ZDbkd0glM=;
 b=XW1XOnmDiNqcgo1yUOaRrTkTxuI+k+8BcvWDxrJF7CWD9HUaKgXHibPzJ75X2I6e1uQe
 LKqmoGKdTccQEzrqSLpK3N7DjZuvUekadfS6QwOnS/vphSamNKLfrCqzxMyyxw9eAlXH
 zmCuBGVIs0k3/t21VrrGbnYF8saBHqmUCgP7eFHvMC6zKIn5/e+44+dvFVP6R5fpJ0Oi
 y+yDggU55piF3Ccib8ietfOC15liWfgjik7lHnScb+4i6PJrMiLjpCWAPgkSkQbrB4KW
 ANJ2gTnOsfucpCZJB03P6T1Z77NmucqufwLj87Ca9O48klvR3m087WlSZI8ka5RHFVW+ pw== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxyhqd03g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 10:07:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i6bLXomGs2J9SdJxMnxMxYlebqxib8l80EYzsH9hCPDuMEIWL91dB6bxCxHy9ouUEFcXxGzlcxXxQgbDgkkAH+yvA7LJGFCiPj1+dgWGmRn7hnt1VtqmdSTW1UkwVR5L2cf1GrKeKTSwnQ5lFZFVjEg/n9Pwq2ATiF4+zinSHYH8bOAEcrOsIgCHdZsvY3MfWi1iULonUnHOea8xNudOQMOsfJ9eYAaJTW3sTWDRvQ2dK7e33gv6hiAMlBBXl0BjFtLZ5zUJ4kFAt3Q57uUhb17Rc3eWwKxDf/0ipbEsRkuuSPncO5BJeDxVgzOCdHodi6SAnvoICcFiNfQN+GDeiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dU20xl2pUIO7EnuiuOWi1xFdSmz+CxQu8ZDbkd0glM=;
 b=Ka2k2+AXHVRmQQ7iDgX+sxT9+MmZ8ReDWgZguxfyVgSDhFfLvbKplc7/FO3pGqeYJbRELkI1v7aHGxOcEQHv74JzwIqkmWKptU03VlVrwzYMHjbouVMg0DhUZagXq1VoC2A1vUEOIdzeKohAtW3iLoHi/TuOb6irdTxU87b0SL43jxukKPTk7XWiLdwUP2jFepdVQMaciyHVNdAXHnRs0qj8/ZdG2jKjN5F1NiEFr7y87tQTvh0JNOj7jwaGW7GjHcAbJoWB7DIIeO/lYZGKZ9fM1P7xfLjATA4UDh9fsqYs3rtGbV8x8sP0dxP6hPr4ejZp+LZh7m7huvVJj4hfwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by DS7PR11MB6198.namprd11.prod.outlook.com (2603:10b6:8:9a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Fri, 25 Nov
 2022 18:07:38 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3fdd:fc11:e12c:46b0]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3fdd:fc11:e12c:46b0%5]) with mapi id 15.20.5857.020; Fri, 25 Nov 2022
 18:07:38 +0000
From: "Qiu, Zheng" <Zheng.Qiu@windriver.com>
To: "Qiu, Zheng" <Zheng.Qiu@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: RE: [oe] [master][PATCH v3] tiff: Security fix for CVE-2022-3970
Thread-Topic: [oe] [master][PATCH v3] tiff: Security fix for CVE-2022-3970
Thread-Index: AQHZAPYj864GDSSPGEKZmK1wrm3A865P75gg
Date: Fri, 25 Nov 2022 18:07:38 +0000
Message-ID: 
 <DM4PR11MB553690FBC856CC506C0A6D61E60E9@DM4PR11MB5536.namprd11.prod.outlook.com>
References: <172AE5187EA745C0.11309@lists.openembedded.org>
In-Reply-To: <172AE5187EA745C0.11309@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5536:EE_|DS7PR11MB6198:EE_
x-ms-office365-filtering-correlation-id: 07ed9330-47bf-4f5e-fae1-08dacf0ff046
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8ojgBrYRpjSmvi0Vwb/U+3Lg3hyVC5ORlvIPeUe2cXqgBTEHW0doE+2Q0eAZ7kIcQdmzPVlY/iQ+iD1ixbAJe2c3lmzN2+suvGJMRBe6PJevVec0cpbj1yTaY1jYdM3gu5oDKUJucHk0HNo9n2NXXVZhUwpIWOswvlVtXDMT+MZjilT7/g6YSiNekz4LDWQAqkxtCN4z5GaBeTyQpDzpOOaFoZD4pqx5HZ1zBq3CyZMW/Q1MJtL+Te2PNfHjiaZchLCjMFV7WpduLGbMWYfPX4WZ8MjZyGQhzpY87m4mUWUqkbHB+9Qnrp4WRUe5jXX0tGpTk6nhEo7vTjVoxkhdAR9YTr10wR5QAHHm6eL9ANhU0ehlJZtJB70QjkICePEA0qAQbhuaJE3iqlTBV7cqbt9UX+n9V7wJaHH3BN+dnAgR118UyeAPhVDppo4rewmT2tcN6PC4AQhQCCZ6uaHHTT2Q24Gg2wABq2ltQOEEDNL4hcL2TLaMUWKW5zbsKgHL0OKhNCwqybb6ucF4RRZIeeCwI76OaAc2/frzYICHH7UuR3UGa7ZGjkbSUHoGcrB/XRv1F+pSa0Ce59b7PK0Q3sAsni4wOhKLbQYHowcr57g/dM1R97pRYz/GwJntbbWjQAuNttCFVI/q1uwMT2rTvp2WRlalh0njGulWvPWqcQ+TYHuV8lOZjowtKdlUCCOPslg2/44byAtBI5eY9cu6wLm4Zn5OCg45xQWzLtWW/A6koW8Vvxt71oIJ+VFvMZliJXDsbknX5UHMTlGzK/bOGQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(39850400004)(346002)(376002)(451199015)(4326008)(66476007)(66446008)(8676002)(64756008)(66556008)(83380400001)(186003)(478600001)(66946007)(76116006)(966005)(41300700001)(86362001)(8936002)(26005)(38070700005)(9686003)(2906002)(5660300002)(52536014)(40140700001)(15650500001)(316002)(71200400001)(55016003)(107886003)(110136005)(122000001)(38100700002)(6506007)(33656002)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?5fcysqBitW3BIylF+VYW2EDl8c54TMlye+pe52yQeRLxBhzDyDP61L76qr?=
 =?iso-8859-1?Q?yR9mKt5LRGbohUv8TGbki7xDx4Mro0xk2SkDvW5llfMzdqQSGmx3iWIcxd?=
 =?iso-8859-1?Q?/1kUpdcQQAwdLaNydzF8LniepVi9KO4HPNYpYjyaiYe7Mqt0ZCRx4LiG/k?=
 =?iso-8859-1?Q?CCIAa8RTt3zFpSTrkTfLvRaffO9sZA4uQ1BXy88sjw9VwwBIAiOlhJPg5B?=
 =?iso-8859-1?Q?y3yN/dAAVy9epBEMzOg+sRI3bJ/g1rXAt3ChhCvRkRDGsWNM/otM6u1/Go?=
 =?iso-8859-1?Q?AFn9vOM0XN0zAQvpL2QOJ/fH2S4HSF/PLskxqlYas3YoTDOE4hwX/HYMEx?=
 =?iso-8859-1?Q?DxQaC1D1nDV53DkmTc1vdvixauUE7hoWof6xzy3rloA2x13vkycPQun7HD?=
 =?iso-8859-1?Q?QG76hA+k6+Oe+9VN/CJU0ghak9r60AuMfHyIYTrlqOm0zLReqhrv8XPNBW?=
 =?iso-8859-1?Q?fCHPQx2ZqXkoNsTYR5Om2C+sw++xyLurtSlrGYVgOeb9ps5DhpTEsZmowC?=
 =?iso-8859-1?Q?RWTifbZ55MgjkmVTjrO7PVNzaZpPVsqGh6Eb90vY5S0B1pVF5nVz3WTrX3?=
 =?iso-8859-1?Q?KvqbFwud2V0BHEY66SJi0u9tMNnFsIOrYPBWx6QjzpIViNdELRu5RNbNHV?=
 =?iso-8859-1?Q?tsE/rh7shQcSlsDMp5jA8J7jDnXRpnfE293DWLNcaKSZCXhdLbGUpBB5iX?=
 =?iso-8859-1?Q?PK8on5eZr689FVWMnA2cnDtpoKqlR9k3MvWjDq1UXIzQo6enC81mCtVgNX?=
 =?iso-8859-1?Q?a3M5sj4Cix+K5Fh5Jo8FGvctZdCekOoZpPPz0DaDNgRZY0l1Y+In7S9r5g?=
 =?iso-8859-1?Q?QPnavcIGQFuxDSZArQ4l12ghNBZhqtJEIqjk/s624rK5tTV+OsV8FCXK18?=
 =?iso-8859-1?Q?2Xg4a+k+24sHri8CMl9xqQeWnPNNtAeFTkQqiA/BJq2wQkG03d4QTL411j?=
 =?iso-8859-1?Q?RXVLMOTax3J2mFk2PtxlsZjuQAQh36eQqV/5CZKoIsg+2VlYyZn8tJcTSj?=
 =?iso-8859-1?Q?rBJo9NzDHbpEJMg8c/Db7F/Y36fNRzl05DYzf+2Pls73ulGKyqgQ4ZOde0?=
 =?iso-8859-1?Q?QU3gQRCF8UH1lqo1LzKaU09KjyN/mfpQtRMxJcvNmF2lJ0JQmuxNK/kPvs?=
 =?iso-8859-1?Q?G9xkImhNyRROEL6qSkhToGM4dNClp3FNhYRW2zpNiHuhdriOnVx6ars688?=
 =?iso-8859-1?Q?ARnXwM3dTyhAdB8c+v537jWiO1Zpn5RfaxYMsdkZMxldT2xjbvipkTujsU?=
 =?iso-8859-1?Q?Je8lpTigX2zd1B95amNiZcZnp0Oyo4L/rTfDMFeCA88Hlg7/v/yWiHzBaP?=
 =?iso-8859-1?Q?4PBeyU30Rc8hZBQFtS+hGrI5rsPyJO3zIYQEc6p90TC00Du9K6gX8eqTcv?=
 =?iso-8859-1?Q?Kb6D2Q0+L0U5O4tdyoNlIM5EwN30aLE4R6qBYuAJBd+Fr4OFrvEP3XfyU6?=
 =?iso-8859-1?Q?pGjQftUzXilRP+fz9R5TkesC/OBUhl71nAetIDFCn6SueAoCUN1Eqhjn80?=
 =?iso-8859-1?Q?rj9Burc5mDkmFv4ZR+lT85TVJ+lCutbebQHM3BzH6UBAsU5TW/KxvR5Vzq?=
 =?iso-8859-1?Q?rJ8DNLlvx3BVxwwt0qBPq+FU/iEJhBFS+i3r2TH9OC9QCZMIcc+Zw9mFVM?=
 =?iso-8859-1?Q?pjSn5FLSKKqQS6sJtqCcBPhGvIQmcxZsnH?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ed9330-47bf-4f5e-fae1-08dacf0ff046
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2022 18:07:38.8520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dQ9Z0407gCgmLrT+684H1xVHTdfjU3pvl2r4Km6aVv2PAUxquoDwJVLbpznXU8jfI2ilDbzrK09ZpvYrLxyf8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6198
X-Proofpoint-ORIG-GUID: 8_8d3T2IxGVlMrJNrZCdrO6dTT2YiSLO
X-Proofpoint-GUID: 8_8d3T2IxGVlMrJNrZCdrO6dTT2YiSLO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-25_10,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=954 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211250141
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 18:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99737

Sent to the wrong list, please ignore it ....

Zheng Qiu
Linux Developer


M/=A0(437) 341-1849

>-----Original Message-----
>From: openembedded-devel@lists.openembedded.org <openembedded-
>devel@lists.openembedded.org> On Behalf Of Qiu, Zheng via
>lists.openembedded.org
>Sent: Friday, November 25, 2022 12:48 PM
>To: openembedded-devel@lists.openembedded.org
>Cc: Qiu, Zheng <Zheng.Qiu@windriver.com>; MacLeod, Randy
><Randy.MacLeod@windriver.com>
>Subject: [oe] [master][PATCH v3] tiff: Security fix for CVE-2022-3970
>
>This patch contains a fix for CVE-2022-3970
>
>Reference:
>https://nvd.nist.gov/vuln/detail/CVE-2022-3970
>https://security-tracker.debian.org/tracker/CVE-2022-3970
>
>Patch generated from :
>https://gitlab.com/libtiff/libtiff/-
>/commit/227500897dfb07fb7d27f7aa570050e62617e3be
>
>Upstream-Status: Accepted
>
>Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
>---
> .../libtiff/files/CVE-2022-3970.patch         | 38 +++++++++++++++++++
> meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |  1 +
> 2 files changed, 39 insertions(+)
> create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-
>3970.patch
>
>diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch
>b/meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch
>new file mode 100644
>index 0000000000..e8f143933a
>--- /dev/null
>+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch
>@@ -0,0 +1,38 @@
>+From 227500897dfb07fb7d27f7aa570050e62617e3be Mon Sep 17 00:00:00
>2001
>+From: Even Rouault <even.rouault@spatialys.com>
>+Date: Tue, 8 Nov 2022 15:16:58 +0100
>+Subject: [PATCH] TIFFReadRGBATileExt(): fix (unsigned) integer overflow
>+on  strips/tiles > 2 GB
>+
>+Fixes https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D53137
>+---
>+ libtiff/tif_getimage.c | 8 ++++----
>+ 1 file changed, 4 insertions(+), 4 deletions(-)
>+
>+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c index
>+a4d0c1d6..60b94d8e 100644
>+--- a/libtiff/tif_getimage.c
>++++ b/libtiff/tif_getimage.c
>+@@ -3016,15 +3016,15 @@ TIFFReadRGBATileExt(TIFF* tif, uint32_t col,
>uint32_t row, uint32_t * raster, in
>+         return( ok );
>+
>+     for( i_row =3D 0; i_row < read_ysize; i_row++ ) {
>+-        memmove( raster + (tile_ysize - i_row - 1) * tile_xsize,
>+-                 raster + (read_ysize - i_row - 1) * read_xsize,
>++        memmove( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize,
>++                 raster + (size_t)(read_ysize - i_row - 1) *
>++ read_xsize,
>+                  read_xsize * sizeof(uint32_t) );
>+-        _TIFFmemset( raster + (tile_ysize - i_row - 1) * tile_xsize+read=
_xsize,
>++        _TIFFmemset( raster + (size_t)(tile_ysize - i_row - 1) *
>++ tile_xsize+read_xsize,
>+                      0, sizeof(uint32_t) * (tile_xsize - read_xsize) );
>+     }
>+
>+     for( i_row =3D read_ysize; i_row < tile_ysize; i_row++ ) {
>+-        _TIFFmemset( raster + (tile_ysize - i_row - 1) * tile_xsize,
>++        _TIFFmemset( raster + (size_t)(tile_ysize - i_row - 1) *
>++ tile_xsize,
>+                      0, sizeof(uint32_t) * tile_xsize );
>+     }
>+
>+--
>+2.33.0
>+
>diff --git a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb b/meta/recipes-
>multimedia/libtiff/tiff_4.4.0.bb
>index 29cb4111d6..970aab5433 100644
>--- a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
>+++ b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
>@@ -12,6 +12,7 @@ SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-
>${PV}.tar.gz \
>            file://0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch \
>            file://CVE-2022-34526.patch \
>            file://CVE-2022-2953.patch \
>+           file://CVE-2022-3970.patch \
>            file://0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-
>TIF.patch \
>            file://0001-tiffcrop-S-option-Make-decision-simpler.patch \
>            file://0001-tiffcrop-disable-incompatibility-of-Z-X-Y-z-option=
s-.patch \
>--
>2.33.0


