Return-Path: <ernst.sjostrand@lists.verisure.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAA1C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 12:54:39 +0000 (UTC)
Received: from mx08-00271601.pphosted.com (mx08-00271601.pphosted.com
 [185.132.182.208])
 by mx.groups.io with SMTP id smtpd.web09.6546.1641905678199608706
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 04:54:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail,
 err=mail: missing word in phrase: charset not supported: "iso-8859-15";
 spf=none, err=permanent DNS error (domain: lists.verisure.com,
 ip: 185.132.182.208, mailfrom: ernst.sjostrand@lists.verisure.com)
Received: from pps.filterd (m0107398.ppops.net [127.0.0.1])
	by mx08-00271601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20BBdMsI032438;
	Tue, 11 Jan 2022 13:54:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verisure.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=pp16032020;
 bh=s8uC3UEHJodgJI2b++zBEYscOhd7Z6aKWdqRochs+8Q=;
 b=Kv4dmcHBNawwA1X1gnySQwFSmJqspPkGqjSuYXvccZ5jq9r07QB+MV4l7kh0s2x/2cgM
 33FGy6DJii2yA3H0qi6wOtenzYQ0WzRSDdooZnUrfX5jsd3FIqGt7Kb3gOz6RkLG5f7C
 eO7qofquF5GvBs95XDF8PgKdpioQGHB+GtcJLXF9S3q/JtPzLIbcYu1bfctDi9glc4z7
 t8Zf41l8imwT7xnhUwxMAy5HYWBVjeDMQ2Bi22avaG66Cm5SU+VD8HioWZlQVrCMznUF
 8WCjke/557n6rAfpxwYC+9NB1PGRzPFD58RdS7JojJRO2OLifreDxCGJJLtLg6sprfCB 9Q==
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53])
	by mx08-00271601.pphosted.com (PPS) with ESMTPS id 3dh7nyhsxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jan 2022 13:54:34 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5OyR1L2OxjN7EWW/dr6cBrP/ICDGUvlJK0BElyXkojoq5m+EgSa0HZh0v0ZgDYTEuGyOu78KJPLmS4Cjb9z2LRMTUgY6CcuRE71NfTEzoFxssqcBMpZpZsE6fqYbJZzxN1kvieHfRckbSDuWITos7ZxzCCsW13W0GPOyP8OFmLHUwiW7nIpivhW16VAj8kYzZym2dKF49lYCIy31NaMsxoXgr7bjKvogGELYfJWXw+Cz6C/tdcjkft6Mv/Qi+UadKf+l21PtObOGq4e//2l6YwJjM2gbYDZmIeIzjLxfiiPVKp/NJhCnCRE7/+xuFD/1S/UWzN176tQ0Y9ZbL8eRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8uC3UEHJodgJI2b++zBEYscOhd7Z6aKWdqRochs+8Q=;
 b=TnlSXB0WZw2cmM1hfstmLB9X2u4XjzRyjOJgcEstgGE4UCeAMLfGPB1jt8K1vfA3Wb60KH4tpk0eI7+z1C4rB7mRp2813Sht5+vGVcg7sC+bEoPX16ohibw1Mtahpno4K/Nao6cLl5DkKmvD62caTWN+hezq86GyJd6sFHsyPMmzcIx9lQVZEkYdbgXQfUEj2U9ixbRJc7EMMh8zFEyxDHUq8Xhoe4VqRhzbfBqmOMOrElQf2UEoXZGiIVB4fvFOfxRoyCR8ofnJiRJJLETmXLnWPIOiOlMSgaEReU+7n6a+G91fuW5l2fziHp1TPdXO4n4rQzF6qI6wLJ4gJZD0cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lists.verisure.com; dmarc=pass action=none
 header.from=lists.verisure.com; dkim=pass header.d=lists.verisure.com;
 arc=none
Received: from AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:43b::18)
 by AM9PR10MB5024.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:3de::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Tue, 11 Jan
 2022 12:54:31 +0000
Received: from AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1104:29c3:9857:b65e]) by AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1104:29c3:9857:b65e%8]) with mapi id 15.20.4888.009; Tue, 11 Jan 2022
 12:54:31 +0000
From: =?iso-8859-15?Q?Ernst_Sj=F6strand?= <ernst.sjostrand@lists.verisure.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "akuster808@gmail.com" <akuster808@gmail.com>
Subject: [meta-oe][dunfell][PATCH] c-ares: Bump PV to 1.16.1
Thread-Topic: [meta-oe][dunfell][PATCH] c-ares: Bump PV to 1.16.1
Thread-Index: AQHYBupgLrAp0tnVW0mXIsl1x+Ukgw==
Date: Tue, 11 Jan 2022 12:54:31 +0000
Message-ID: 
 <c8e43ea446a08e64fa028a1b74bb6f529a5d3cfe.camel@lists.verisure.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9c4f353-f78b-49c6-75f0-08d9d50182f0
x-ms-traffictypediagnostic: AM9PR10MB5024:EE_
x-microsoft-antispam-prvs: 
 <AM9PR10MB502439ED3BBA58D156C5ECB3CB519@AM9PR10MB5024.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bV9AAZSUBvFbkFjlKYHBZxnAOu1K9YWUttk953FydnEZxj1ntn6yKW6c0bf2esdSsXn0uW/V8VJW1gBLUhKQbncgtNYhWcU0loqKUx4n7zFPp4dcoLUpaA92RPa/BdWohQMURc+RC1n6XdmErFbVDB8/GqcowFrqDZQvpNdw0nQelHsS5+mp6wsXHpGYtuXcggAPmGqrPO8n4c8aElMseqxKhPQ3tF8eFqGstkDiRGpgFGFbTlBfGTehHzJz743pFyc5FK/qDR3aY2lMUO38S1SX/0b1Y28wf2SLcJ6ddMzkOdT8/MZfTj1BZ1iPrCjqbgSTIampf+tV7Zo8n8Z5Qum1pDjGgrsdq6Rk6oDMLcaOqhKiMpJf/JthwxToBQhsLeLyVAs9ag0QdZSNOVQnBEA9L5OXLizFKP8b4e3HtPQVNujcHY703v2UU1mvBs+UyMvujx5VcA0T6YNPgzeoiKBEZAUN//cXNAWb9K2sWKDygQOUEz55UvA1SWByzffKSm7aTl4uuzc4kRvJdejssP+Zb13OeEEbPNE7JMnUPa8v7OOrl0IOJaQQY9bo2/+IhvxN8Oryc2A/kM+bZmHj4BL0XM/EfLrXn87FunjRUKz8prk7MkyDMXfLHfY+DRp/DJySWeWKWBYOxdc1W09HiQWnZzi2hEuPkHS7i3rQG2Iyp1RsboBub3OiWhNeAFDnKPa/0H6k4Bt6GLvxwEVqFQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(6506007)(83380400001)(316002)(66574015)(6916009)(6512007)(38070700005)(26005)(91956017)(5660300002)(66476007)(2616005)(6486002)(8936002)(2906002)(66946007)(186003)(508600001)(38100700002)(66556008)(71200400001)(4326008)(4744005)(66446008)(8676002)(122000001)(64756008)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-15?Q?pKLn6enLEAxHOgQNrgW90DI7ogn/GpmMFjtClUiri1i3Qk0IOt0byvzmD?=
 =?iso-8859-15?Q?JTyeZbdoBVBVf5hSo/0iwOfmStt6uiK3SOJDtGChLRcoSV41lDMHzxBor?=
 =?iso-8859-15?Q?i4RhbyfGswRjSc54Bl/8pxXenqeLb0m0gr10d6KNH51+9LgxEb13jVHxu?=
 =?iso-8859-15?Q?T3nImwUTvVY7KSdq9Nw0NxgeVor+JXuCUHjcw90Wvg45s99NRMXy6OKzX?=
 =?iso-8859-15?Q?YZpdWTPAycYgO7imYm7U+i2N/2zy+jxxW54IR7za/wz+n4Ta1/m7wCHdv?=
 =?iso-8859-15?Q?eHBNVOxk26NC+5KcdBtQPpQz+qir1/DdmFjES2V/Z4oFEaRFGvlBn7X6Y?=
 =?iso-8859-15?Q?Hi52IMx7Czuewva1twMe2TA8XYFL9VSpBkc3Jr5DE4R+v5TcCYNcxABya?=
 =?iso-8859-15?Q?Js36Q8fDEcd8cOEu9F+IXMTNzfovAfFTDzSEApwWD+uubwd8F+uEsrSK4?=
 =?iso-8859-15?Q?i1IEob9PLJKJXqwGKymY+Gy7BMP+i7CPCvy4oBbXdGDyUqMwxTAj6EluF?=
 =?iso-8859-15?Q?ewwZiQ8AtOcCMYiu0rlN9ZXrujlRAO8qy2EuHNjFndo2/rjlGntQ3ZT/d?=
 =?iso-8859-15?Q?s3zCy+jitxcLI/hh/TKBWkkpH3m1/mbbTU7/s0GE6jGbr+ZdtngFB+zNs?=
 =?iso-8859-15?Q?j8qc5PMB2RALmXf69HTnckSc39BMZyrbA8msB3F71l5TfSczhGOX6krUN?=
 =?iso-8859-15?Q?BLhJ8jVqOTbHHfpCsqSUb33uXGRRHUW5pPiWCRmIHY6J+P0aor0aJwowM?=
 =?iso-8859-15?Q?Zoc0VkU/gUUP9dtsCQS8pf/opyVzG6cFwCpVpgc4WXyKUKmpvHvnZeuVz?=
 =?iso-8859-15?Q?VkvUule+LSe/8sDRPGr6TUenuvOOw/Bc8Ab/KKcLfFHIEmnXEabLYN44j?=
 =?iso-8859-15?Q?WpsBKoBMbTGTZJge8AWl3M2ZOL80FQrPSOwTrZ63CFoOqBmxmBMJ70Ldz?=
 =?iso-8859-15?Q?ND4zRRGtKeMC3gPBWRmgTaUr0jXdlHkaLDsF7DOUZuvi2aoeS2BOEMqHE?=
 =?iso-8859-15?Q?5le/3Nq/4TMRdRSVHru2wyTeXpubPpt8BlUWdADxt/iZliwJ+P2pwdsq2?=
 =?iso-8859-15?Q?0dMhVAN418Ufwmk/zjfu1ZYJbpBpJlS82xlo0OKcE6oKsURZkrKZDuCsT?=
 =?iso-8859-15?Q?HQobP0MtJURzrNz5ZUmyLhQ2nw++31K39o2IydGPI4Igj2HLuftCtPfNP?=
 =?iso-8859-15?Q?gCMF7vGzJ9clylU5HbIIEPiJbcWbCj8Bz92tDmHJCGMXUvY6ad4nVZJMu?=
 =?iso-8859-15?Q?JEScMh1i+nlOi6BmGPsyV/03vJUUJC3BtmSffLq2Adl5988kwlfwn3EwE?=
 =?iso-8859-15?Q?R4nIodPT7L2aYgizeVBjs+ZPTmMBL1YC6WBDjKCrj9Yl3SXfHG2YshdHE?=
 =?iso-8859-15?Q?JP0EjEe/UTTGui3JlCvWi5Q2mc0VqxeXIrOrdWstHkqftBG6UQAONoPZ7?=
 =?iso-8859-15?Q?uLH7S22iePRvI51TOSNkS1GHveNs7nKd0UskxNoTBuV57SNpf5RHXNaZk?=
 =?iso-8859-15?Q?FmzHT01+Wr4gUAxwfg5ZAk+m6H0Hg681HoyCNe7nscbDNWmJcxeNQnNFE?=
 =?iso-8859-15?Q?BKKoKBGoEzDm7xxcyhRZSscNsqSX5/H+IzyXw+t94Xr14B19kPN2F/Ikx?=
 =?iso-8859-15?Q?VMtYnSfJFmt6y2G3RTnEtDciOgzJH8I7uTbO3osmLfpqbPCU3SetHXjAq?=
 =?iso-8859-15?Q?Qz8LbZ0YEna9Ky06qFwgUQMPfWnzfl8LJOEaB+4UWZLmYy8uduy7+7ysa?=
 =?iso-8859-15?Q?w8hK+5OpbhkGjCPONg/4xPHgkw4Z5XsH30FkN7kR22qc+KwxfI9iZY=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <EB75A59A1800464A9908E495FACF8D22@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: lists.verisure.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c9c4f353-f78b-49c6-75f0-08d9d50182f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2022 12:54:31.7491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3055fa7f-a944-4927-801e-a62b63119e43
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Lg8bwrz3Zuo48tmlcR6U5Ar01wannv+mWAZQqavsotQX5xMzURtOtj0mt7q1t0z4YluRuDpjei9JcCmlpgd40/+Fe/29idRM+hk0eT7qqus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB5024
X-Proofpoint-ORIG-GUID: 8dGTi02zxTpuVj_b0OQr4_P94Vb-lXEM
X-Proofpoint-GUID: 8dGTi02zxTpuVj_b0OQr4_P94Vb-lXEM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-11_04,2022-01-11_01,2021-12-02_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jan 2022 12:54:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94744

Signed-off-by: Ernst Sj=F6strand <ernst.sjostrand@verisure.com>
---
 meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb b/meta-oe/reci=
pes-support/c-ares/c-ares_1.16.1.bb
index b77604797..692a5f0d6 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
@@ -5,7 +5,7 @@ SECTION =3D "libs"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dfb997454c8d62aa6a47f07a8cd48=
b006"
=20
-PV =3D "1.16.0+gitr${SRCPV}"
+PV =3D "1.16.1+gitr${SRCPV}"
=20
 SRC_URI =3D "\
     git://github.com/c-ares/c-ares.git;branch=3Dmain;protocol=3Dhttps \
--=20
2.34.0


