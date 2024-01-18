Return-Path: <Tobias.Gassner.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 155BFC4707B
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 12:47:35 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web11.10532.1705582052276539969
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jan 2024 04:47:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=A0eGy9+x;
 spf=pass (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: tobias.gassner.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40IBmpVO012949
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 12:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=from:to:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=S-DKIM-20210427; bh=3
	u4/YfffBX85nC0Kz4Uv6is2ncV7sNlbHhs9pjqncXI=; b=A0eGy9+xrATLx1bFl
	d7Bnn8hr3FG8x7rgtUmNyq0ARCk5EljBMcIFOobqjJCDXFdoaOjUBcDMZaGtLSA1
	rOrdxz4YKKBlUNeO2YZq+tCUZ8P/wwWPrvZifrl4Yo8VenoiF3uvmYk9jUx42pvd
	AfV+kagNLo+giqZP3zsDRjDWviz7/+T16VMQ/Im3epSStApwLN7UpnNPieC2JRg7
	tqVe8yOuIgCLzlDUm8gaGfJ0OfxThXhnjNNtp/fUJKcK22JdGmHgrumYZHyxOBic
	0KZlghzV+41Rmd4Hs1V6uS4GS9rz9PZJBqXb9nTdonI9JpgeVFbrLqZMvEr1KO1Z
	eL0fQ==
Received: from eur04-vi1-obe.outbound.protection.outlook.com (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 3vq3eb89u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 12:47:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+UCHZ8lSQK5PtfIR7c1rQJA/hL9YYTg4XGFN8P6vkFdq/uKiN7YAnh+KaknDdXaBEBrfBNuJEM4zUWClILt3HAsPTVwbyQUiQD6IzRAdOkHlKDAxLGm3aDHCZSy3jLQ2Pw6e4xXjUEeeifXk/J/3N4ARKer9NO+SCZqQ7oCiZIQBXci3eOz2oY+2hHSd8cf7J+4ccN/2o4zT9oLG9LIyYLcrYdl1t11vb6SSoNKaaL+CPCoOK5iMbQW5CY0/0LABppRSX36TdlesCg/WoaLb8vbCSriNIlwVrE7bIqjta9cZXfgJjWILM+e/j03sr2SJpGVVOXBEWoTvL6s9dKzaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3u4/YfffBX85nC0Kz4Uv6is2ncV7sNlbHhs9pjqncXI=;
 b=GbFY1tDT10zS4yRn2qNvedDOlDYYceMdzLbuJIFk6IoL50he9y00rofKeEYoLEDViE4o+GIEi9m2tjdyc4YkQevmppkOGG5m51dRyhtquRS3U++Z6glH04/WO56CBeAnEyDVZ9e11J3DCQN/ivrRKCKtt//NtkglO/CetuQ+GJKc6kPbTeoE2114xgIXvREKMHX1UrdE5Aqyt94t5XWVVv8fTtLNUgk+Z1qL6hlOOX2t0DE9qdE1ttTZpdtjzTE1PTlEP9xD3eYkrbVVauDBiypNIMv/O96POr/BSMtJ7lmZhSxs2UVa1qv4UT1ci59lgFktqnRs6zIwrHcaRx/r0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=karlstorz.com; dmarc=pass action=none
 header.from=karlstorz.com; dkim=pass header.d=karlstorz.com; arc=none
Received: from AM6PR01MB4246.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:1c::31) by DU2PR01MB7982.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:239::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 12:47:27 +0000
Received: from AM6PR01MB4246.eurprd01.prod.exchangelabs.com
 ([fe80::1578:5f40:d4b6:72eb]) by AM6PR01MB4246.eurprd01.prod.exchangelabs.com
 ([fe80::1578:5f40:d4b6:72eb%6]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 12:47:27 +0000
From: "Gassner, Tobias.ext" <Tobias.Gassner.ext@karlstorz.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] softhsm_2.6.1.bb fixing p11-kit module path, adding
  softhsm2.module to FILES
Thread-Topic: [meta-oe][PATCH] softhsm_2.6.1.bb fixing p11-kit module path,
 adding  softhsm2.module to FILES
Thread-Index: AQHaSgwSvMJ2l7qlBk+BghjEPp9g/Q==
Date: Thu, 18 Jan 2024 12:47:27 +0000
Message-ID: 
 <AM6PR01MB4246A6FEFC46EBB4776255DBD5712@AM6PR01MB4246.eurprd01.prod.exchangelabs.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR01MB4246:EE_|DU2PR01MB7982:EE_
x-ms-office365-filtering-correlation-id: 3a32c760-27c9-4a8e-9ce5-08dc1823a040
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hXjasEFyj0O7qWTSatPEi5C/LpHrJkoC6kNc3y0skQ7bDTgkDu4Ow8vs2nUJQdjzzHODPt90WsG9f2qKwHL3mvTxibQAtJdcULe7F6Qx9tY8CthUQKn1bPYtFn5uPwD1iTyTKlQVNa48sZKthGdF8wnM4W08TePAVd+74WkHiXNHaxXxtuW/zpGw1pseAyooXOfUkoPYrPNDwgKJI5U4ZKOMljpLJ6+WSbomTRkJSeoZ8oAMf8zHVJJIArYQxaglJC5ReC8LA8WqMQ1xxFQuOd0cojP6zNMYsOeaC+rIVvCK24Nbmv/t8op7aXuXYPff6kKNy8jvYFitZpLRwn9i7NeTUq4YVzkcHGTPlC4Y4Ddh1qO2RkQ/payAhyJgzXnacReYKqwaqfqUI7f9YL0B3Fss/tJ3jNTmET34hfp+XJdppw3WQCBXtNEZJ20d6+8M2Niyngcij128XgtP5jWX3z8pKiKRpMGmsiHeJeG+S7YhuHHczQq4D+zqB6CrcqrpnkFmWAaFE+PfmMQelfXMu4jvxz5OBpjoESHpkRgq6aeGOHKDnyDSibiTmpuCu9Ho9aoea9YVkQS4Vo0oFYwPeMeD4p+hP4qyfEXLn8hmyFAlmmgDnp80wHed6k3J79O/
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR01MB4246.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(39850400004)(136003)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(122000001)(52536014)(71200400001)(9686003)(83380400001)(6506007)(7696005)(53546011)(55016003)(38100700002)(478600001)(8936002)(6916009)(76116006)(66446008)(66556008)(66476007)(66946007)(91956017)(316002)(64756008)(8676002)(5660300002)(33656002)(38070700009)(41300700001)(2906002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?UA12NcqDpxMmssZ9vv3D8Adaqv8iJxNXb/VhsyF37BuvQHfT3frrJQ3fnW?=
 =?iso-8859-1?Q?P/jeyOxaxx2JlwMhD7vqPwHnSM9mLwSsvnjwCgYk1lMavQgcPCopZNWh4s?=
 =?iso-8859-1?Q?CA3Hj2esW5T9ee2i1OZ7z035CwPvxRWyWid852SZK9A8lz85ON6xvyV+x6?=
 =?iso-8859-1?Q?Pz1EsxXhDq6I7qLeBGYMgJoOR4g9HdyordNFzV06AIZ+rsXmgHV1HARlUR?=
 =?iso-8859-1?Q?Vihb36oYH+/lvTggQy1rG5WZrJXvySlHQJc2KautJOFIzi5zmRracCv2x4?=
 =?iso-8859-1?Q?eGgMDYBicYzHMZBFSnJ2KHezkVR+mzYJfAinBWbxJjZf1s5+tF+iz3cUil?=
 =?iso-8859-1?Q?ei6LP26VwckWlZSLCRuIea0/3oseq9Eq8IYa/yHlBUQ9kK7UAALbFicg9J?=
 =?iso-8859-1?Q?2U19itWExCcHKWKIG+r1XWrXTUmuCaP7Ec2b/hg8VejwZ/9KQHVW+Ke8o6?=
 =?iso-8859-1?Q?j8g4awgPpxhuL934nNTlyWNjpvXUjiE3XHp94QvcBc0qPGg8qJpHrsY68s?=
 =?iso-8859-1?Q?vyewdFEQ7gNJieeGjPpHDolHWQWKQBya8IH1MR2bGMm549SuJ4h5pCEzeg?=
 =?iso-8859-1?Q?ufo4VfRssvZbP5Jqm0y3X6N8wCD49TFQscJKUD6+rpX2JdYIMzToTQUd/G?=
 =?iso-8859-1?Q?e5xic+4nt0mHSA9/ksfSizzaDdxVunr3t/nb8REAIAgTa6y2lnnUyyJL4n?=
 =?iso-8859-1?Q?z4z921PhK22B3ri8pkxVX5a41IQ5N86mDKEWhKrrTZP+1NJXOKZoQYhBCC?=
 =?iso-8859-1?Q?IhjPJkqgPhO6STHXGclyBwOqIqlpbAr5ZWBStmHvsGoHWvwMZsQnf8hnFy?=
 =?iso-8859-1?Q?ukLq1X/gayN/jw3017wxeNFDU5BjoT+mIr7lsTe3GHxQZB64U7yA1mNK10?=
 =?iso-8859-1?Q?OeKCvHMYguGzeQfidTagtOzyVoyJI1Bc+u6/SACkvfySF42jDCT9eikgUe?=
 =?iso-8859-1?Q?XRgqK+kG7HUU3h1hqdrrmsMHo/ju2VLRtCKqCOPEOdBkl8WlEDVOWcqvVx?=
 =?iso-8859-1?Q?YR39E+y7NYAvPGA9N9qY7+BSaLfQxKPsAuUVu1mFSFn6btmrbfO3dIu8c1?=
 =?iso-8859-1?Q?EMs5OUQz7SWI/OU9s74rYRA74bR+n1yQhyZxqHs2nqHD7cUZb2rYgMe9Ji?=
 =?iso-8859-1?Q?cRAoUaLwD4IitHyypY3+pqH4xFBVHTi+UlJxsmvwFmow4VHRZHA5Ml0L7Z?=
 =?iso-8859-1?Q?cyDaw3dVqNDq2LnXPaSlgzXC/J/RLzOBdsX9mjh+F2GOfxyKpywnqxVx5x?=
 =?iso-8859-1?Q?BrI1ht40+WDidwccgTKmLVhSulXkM6CqtpNvUk5drOVgrIWA3RN42vavnx?=
 =?iso-8859-1?Q?A7u2TkrMsg+J+RU+DqzrXVURrOOeQb5GbQ7zpUCKgUJ9ZzPqk5RJT8f0ub?=
 =?iso-8859-1?Q?PinaVYHnS0M0IuReoV77BffqbE672dJwFkS21wd6bnwW0BVwxPwyH+Yr0G?=
 =?iso-8859-1?Q?seA7RexK2CP0J2XILcXBqN1rKxawZULJ6NBUNYxW4YlBQVdn5l8RUIzwJR?=
 =?iso-8859-1?Q?c64UHHKEVK0qlmMT7vEIPb8ctM1ZoiqJavZTOmSTyAyifEds6q+1pn4fHN?=
 =?iso-8859-1?Q?k5bUHjYZ7uPE/pGEim3iIRen72OOGvsFySaFTggmv3F5KCy4uEuqEOEDz0?=
 =?iso-8859-1?Q?w4fST0PfzuzraQ6IID54XL/xyd5QQJ/yBq8HIQ7YN6AsgujEZwFn8bmUnr?=
 =?iso-8859-1?Q?KjWinzfQAQhg96eb+nFClglxKs9njdpcAEo46i/2/maVmX85tQotJfSToC?=
 =?iso-8859-1?Q?DwuA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: karlstorz.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR01MB4246.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a32c760-27c9-4a8e-9ce5-08dc1823a040
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2024 12:47:27.1119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4a0b6f21-e6e1-4ed6-9dcf-e60e7190f648
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fyHFdH97KTCiG4GNB8HoV4YK/vClstSEQAm56N1iU5wPCYYRLDJr7kPA9XbIx1vTkqSiwcPdCUJG+FCkapGaEYiaAd7G4FoTDx8bNqr0k3Qy4acjCQhNh3eHporzMNZx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR01MB7982
X-Proofpoint-ORIG-GUID: JpjfOXX_rgs3Xm1JRSa3lXs7zZ65bQ3b
X-Proofpoint-GUID: JpjfOXX_rgs3Xm1JRSa3lXs7zZ65bQ3b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_06,2024-01-17_01,2023-05-22_02
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 12:47:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108344

From d19ac03cd6cca251fca7aa0d84db379153702449 Mon Sep 17 00:00:00 2001=0A=
From: "Gassner, Tobias.ext" <tobias.gassner.ext@karlstorz.com>=0A=
Date: Thu, 18 Jan 2024 12:50:22 +0100=0A=
Subject: [PATCH] softhsm_2.6.1.bb fixing p11-kit module path, adding=0A=
 softhsm2.module to FILES=0A=
=0A=
In order for the softhsm module to be discoverable by p11-kit proxy the=0A=
softhsm2.module file must be deployed to ${datadir}/p11-kit/modules.=0A=
This was previously not the case. Also the p11-kit module path=0A=
(--with-p11-kit) seemed to point to the wrong directory and had a syntax=0A=
error (two =3D=3D instead one =3D).=0A=
=0A=
Signed-off-by: Gassner, Tobias.ext <tobias.gassner.ext@karlstorz.com>=0A=
---=0A=
 meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb | 4 +++-=0A=
 1 file changed, 3 insertions(+), 1 deletion(-)=0A=
=0A=
diff --git a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb b/meta-oe/re=
cipes-security/softhsm/softhsm_2.6.1.bb=0A=
index 2c68ba984..d8c38dd04 100644=0A=
--- a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb=0A=
+++ b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb=0A=
@@ -27,7 +27,9 @@ PACKAGECONFIG[notvisable] =3D "--disable-visibility"=0A=
 PACKAGECONFIG[openssl] =3D "--with-openssl=3D${STAGING_DIR_HOST}/usr --wit=
h-crypto-backend=3Dopenssl, --without-openssl, openssl, openssl"=0A=
 PACKAGECONFIG[botan] =3D "--with-botan=3D${STAGING_DIR_HOST}/usr --with-cr=
ypto-backend=3Dbotan, --without-botan, botan"=0A=
 PACKAGECONFIG[migrate] =3D "--with-migrate"=0A=
-PACKAGECONFIG[pk11] =3D "--enable-p11-kit --with-p11-kit=3D=3D${STAGING_DI=
R_HOST}/usr, --without-p11-kit, p11-kit, p11-kit"=0A=
+PACKAGECONFIG[pk11] =3D "--enable-p11-kit --with-p11-kit=3D${datadir}/p11-=
kit/modules, --without-p11-kit, p11-kit, p11-kit"=0A=
+=0A=
+FILES:${PN} +=3D "${datadir}/p11-kit/modules/softhsm2.module"=0A=
 =0A=
 RDEPENDS:${PN} =3D "sqlite3"=0A=
 BBCLASSEXTEND =3D "native nativesdk"=0A=
-- =0A=
2.42.0=0A=
=0A=

