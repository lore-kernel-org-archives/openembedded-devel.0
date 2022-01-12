Return-Path: <ernst.sjostrand@lists.verisure.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29384C433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 07:07:01 +0000 (UTC)
Received: from mx08-00271601.pphosted.com (mx08-00271601.pphosted.com
 [185.132.182.208])
 by mx.groups.io with SMTP id smtpd.web08.20040.1641971213137149075
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 23:06:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail,
 err=mail: missing word in phrase: charset not supported: "iso-8859-15";
 spf=none, err=permanent DNS error (domain: lists.verisure.com,
 ip: 185.132.182.208, mailfrom: ernst.sjostrand@lists.verisure.com)
Received: from pps.filterd (m0107398.ppops.net [127.0.0.1])
	by mx08-00271601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20C25XCf032457;
	Wed, 12 Jan 2022 08:06:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verisure.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pp16032020;
 bh=jGKkh/Scyis6x9LZ1QsWwQ4WKlZ8xBEhB3kjCbmkpZE=;
 b=l2YhhnrjUggP6N2ETdydiMPjDarDDoiYoCFaaSP6AclhVC2BdeDi7OC6jWXnvsazfh7t
 qbWEO5m9CrP2gFNuqJ3ZSHq7b2/GAeDps1JORztggtH+lbJe3x4zIfnxd0WnTzIgoA/d
 V+IcbSM5xfuXh8E8ioLhe1b5QLTmXneGOwh38r9QmipDGZ4jzzztX6sVnt2OixrFSAR9
 6CYW/NRYw/DRVr54qDOh5kzOY6Y7jBafQ/VIHSVUiCv+cj/GRRHdD5aSr+YY/Bf834Bz
 7qecLWaTd7ZQkhl7RKECauP18vQzRj0ng5d4ViTR+QMkHxNOp3Dq++pdfYYvPjkcglSW ZA==
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50])
	by mx08-00271601.pphosted.com (PPS) with ESMTPS id 3dh7nypegq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jan 2022 08:06:48 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkT7Y76U4Jula2NBjKs5exZcCsMCSuptjJtbTEDbVhV3xlTjJE2RpXxTMB0YMsVUfMmBgjhOc3SB9jXrlPawPG5+6U6KcmcmVEcD2+3ddn6dsX7UfBi6380M+Dhbpr0X+2JPO0ICkmDzsiUlfKCsMG5PbMogGD5/UAHNQ/Q4TgmRvCROQxmx16A9fO5e94vQQt/d6RpffzPxpRLGcSYSfEDOQTRla26m1+Tww6HwwNGBRGN7KbVubKx2yNPOtqAuseNaUe8Tf4vA12qOZl/r77d7lNVM78Yld3NtWEqFAvFDpV2jx3GC33zAvR91lKTa3+y3l8Kfple0CDGcaX1MHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jGKkh/Scyis6x9LZ1QsWwQ4WKlZ8xBEhB3kjCbmkpZE=;
 b=K1zOvj7q0YQfqzOYPfOeq6b9Ig2YmEjm9YgM1geCm5BXOmhysomYyQFuRPKfDgR+BjeykPLcF7IlQhXZaQbn8L3Am9cjTGA7CbOB75rLndVVYPdwDUFs3LKRems0zG6j4Xy44ZjjynGNz8w00m8L3a/9qfS1qwy3Jxe+dxisEj/3gXcGFfa19IaCfrHl6ObYigknw9+g22CiE/LicLEMfJCLvyq2+fTR7dH8DG8ldbrsGUUhq41SWTIJ48iB90ye1O9ySEF2+U8iRbhJjpSP13SOLoIpHSNv7r4QRx9xcDvp6cAudkQBajvIXuOJW05al9hJwhwxYJltSTWqnskDSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lists.verisure.com; dmarc=pass action=none
 header.from=lists.verisure.com; dkim=pass header.d=lists.verisure.com;
 arc=none
Received: from AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:43b::18)
 by DB9PR10MB4698.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:253::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 12 Jan
 2022 07:06:46 +0000
Received: from AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1104:29c3:9857:b65e]) by AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1104:29c3:9857:b65e%8]) with mapi id 15.20.4888.010; Wed, 12 Jan 2022
 07:06:46 +0000
From: =?iso-8859-15?Q?Ernst_Sj=F6strand?= <ernst.sjostrand@lists.verisure.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "akuster808@gmail.com" <akuster808@gmail.com>
Subject: [meta-oe][dunfell][PATCH] c-ares: Fix forgotten PV bump to 1.16.1
Thread-Topic: [meta-oe][dunfell][PATCH] c-ares: Fix forgotten PV bump to
 1.16.1
Thread-Index: AQHYB4L1QRBLMZVAakGgZxPYikg+gQ==
Date: Wed, 12 Jan 2022 07:06:45 +0000
Message-ID: 
 <0173f3da37397b1c9fb379b677310f379fba5fec.camel@lists.verisure.com>
References: 
 <c8e43ea446a08e64fa028a1b74bb6f529a5d3cfe.camel@lists.verisure.com>
	 <CAMKF1spWmhaEmVFcJzzGbONTL0HR4Ghh84pm2ZzkXMaTZBfNcQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spWmhaEmVFcJzzGbONTL0HR4Ghh84pm2ZzkXMaTZBfNcQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c830624-0da3-446c-513d-08d9d59a18a2
x-ms-traffictypediagnostic: DB9PR10MB4698:EE_
x-microsoft-antispam-prvs: 
 <DB9PR10MB46983318B1601B8322B553F2CB529@DB9PR10MB4698.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pWy7GhwUZfUoRUGtv/YGGvY+FlmDywy0jO13Kfr2x4aoYTY3n10geXaZsW4I/zzEBi/OBygSej2Ks7fGGX/Zh5DSwucGNMWMQsabl2Ic+PU6XFUARudSJ4t+D3Vje02xEnxgtu84vrZYNEU+PBzqVBNbbDeyM1+vyZ30eo0oE/vf3rAHwu9eONlECphghmHzz0X60dNtc/eny8h+cub6kEutavlCmqgUo7l26Eqw+Y17XNTPPstAzZhvHEVz+ssPAlF1Tgrj8eXgOZ0VeasTfk5nYg9oth4AaWSDqFmQ4Rm0CCyjtJRy565LIzzz7N11gD86sNpKNcBqs5nH7FjgFyt/BCD0/U/TFY1AupRe747Iwz+JUX23AF7H9R4eAOZ2qzOlWbzigfEdVpECBlJ7M/qnP0yUjnGh5tZJ82Ye9UJKT2xyEupVYqyuY/EDBry1WsrLc4cnWB63Cakq4ojM1GnZ50O0KL0PeDxZfmcI3EPWesK2pyQa44q3lJPqhiNWafTfP5eq2BfPScsJE27cZFUJJWQoTnMbv1cgkOf4r8SRGs8WPaQjCGxl0ambQFHtMwKaq4gdlT6aBROaK08ZBvu8GOgdw9FMH/4mcipQyCI2VRtfQvcjhN+YuukI9OTYIZg2hsCQ7P9aOPr0Q17pz7e+ChGRgta0mhbptbAWTLSy18rFcT9oH4qhIurKrT+FDAVW2dy/E69x10ienUfInQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(66446008)(66556008)(5660300002)(64756008)(66476007)(76116006)(26005)(2906002)(38100700002)(6486002)(6512007)(83380400001)(508600001)(6506007)(316002)(2616005)(38070700005)(8936002)(8676002)(66946007)(4744005)(91956017)(110136005)(186003)(122000001)(86362001)(4326008)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-15?Q?85ih5zLYs5EHd/pii1KcN3k5hk8EvHQVnFvbsSDrXD6ASqWq5LCHlmsVl?=
 =?iso-8859-15?Q?ZfZCbkY/Zhb8gosXbAK34xDCduPdrWjEZp9FlY5nMrg1SElet+4HEf4Xp?=
 =?iso-8859-15?Q?Vjn/mmyan4mnypiB+nG+yTFUMgS4HcTHk4Z7+GgzWBRjDN4xrgc60OLsz?=
 =?iso-8859-15?Q?lJqxlf0JTR8cO01SclHlhWPH9CVUfW02RQ0ke0cPlWx9VCGoDl7d6IYUA?=
 =?iso-8859-15?Q?ZFNt0Ab9Va64FBueJtxKXJzYwsjFFfhGOBRdK/ImeZmsxQKnQDLJQFVUr?=
 =?iso-8859-15?Q?/BKqpyPV9gdyrMxzxDCqONLXVvku+h6plwUor/lFYIl3EDoOpFaXxXsrJ?=
 =?iso-8859-15?Q?5PDYbtZLg3CSQFgdAMVKd5sl2kqVvaxJq9UYAnKBkw1iA9qhSiHH9n56v?=
 =?iso-8859-15?Q?NMA8snC9ve8+vagAYKANrctP1MPFZyqTiwOiiTMAyqgPcsBXg5kgthmDO?=
 =?iso-8859-15?Q?ErbtQjXMApyB7QRxN5vFwnkgl6DAXalvv2FY/yXLB+VY09lPJ/+7OQyJK?=
 =?iso-8859-15?Q?lN88yaaEkIT8D/HVAo0CrsDJHmfxfSJ/s1WsqIQqCPOq1BXi+bY80JQFp?=
 =?iso-8859-15?Q?DVnI5rlTeCm6wFbN/9QN3LWdWh21AIVZOLchxGugwF8UZA0jjYlPFedkK?=
 =?iso-8859-15?Q?AXFb/UA0thxvpidgq9duAWr/i+Ku/Wv/1D9TYW05JGfx7AchczWQZRrX1?=
 =?iso-8859-15?Q?0qxSXH4fQgizlHQ0Q1GcqgAEE3IJ1rLn032WRS3SbuaZFfnZiHo/eL1Zi?=
 =?iso-8859-15?Q?2vxULRYM/7VI+P+JrkaHbVQw4fmZ3lxSeEO9RTUiGhKTA40+wasykcCC7?=
 =?iso-8859-15?Q?hIME4r7YuejG5Bms5aPBWt8nmwcs9nqEbucUBbWzxqhGatCPHCpSkHNOi?=
 =?iso-8859-15?Q?QScbtbV6rYdSQNUiRfFgBe+InBBMpRDnvOSpfKK17PQKj92Cu0/PF9NxA?=
 =?iso-8859-15?Q?5fyAUYjumWZI0p4pPtajbekFF0uMoU1oHWFIHAM+0MQ8+0TJS6OUViGDo?=
 =?iso-8859-15?Q?k/IdrSxdRcBrYGnpeAqA/bMd/m15TFm07EA+U3kmjDUrnGny6rGfAongy?=
 =?iso-8859-15?Q?ltoyIJWflwIP4O1zjuIZBZcpwe5CFQI228Unq0hrFSIVYrL5lCLgY5yWQ?=
 =?iso-8859-15?Q?pkz3jXZTXEqf92xeZs4XbuJLZZjjb1F1G5R+VT8+2w9P8FRZOzwwGBFFj?=
 =?iso-8859-15?Q?R0XtqjQ8QsbuVwJb/Ee5pQ0b1WxM+LpHGG2/s/OSK+sArGHQ1J7hEQUSM?=
 =?iso-8859-15?Q?jbEZChdtwRGULZcfiRYzdAOOqeZZ+pXTu3xPvkuJywIS6pwSaxXYKQw4K?=
 =?iso-8859-15?Q?j8qepta5fKvr163kHpCdklbdTBHdNtdnWJ7eTR0Hs0KA5dpfEgShp95s+?=
 =?iso-8859-15?Q?Rd4YZb72VNU7+1qj+mAgvKv+4SMCvRgl+gC73Ku0PThM7Kpj3u2TdSE6j?=
 =?iso-8859-15?Q?R2N6zXYuHHCFDJ65tlco5ILxf1dcqF/hj+fTzxI8etcvKIsrZ+SMtaaUe?=
 =?iso-8859-15?Q?BUqXZ2LZHcFoAuYE92WENFKvGMJPBuCphbYpEore6AcMLH2IvnYeYmPBe?=
 =?iso-8859-15?Q?OlQBX8OS6zOl89C+Ym1Av1aNEp1xMrup+sSr2qUeZ/d6WWKKNo3gXCT/R?=
 =?iso-8859-15?Q?tGKONRnjBUgBwL8My1P9LFdqOEMv+GqKFCp37Q1pJm5rrizubB5lI0lFb?=
 =?iso-8859-15?Q?OOrYFP0ZTw69IC+8PiXBsOlP31Zdsj4KNuCF3aRaDmvxQuN0FMzjvCLip?=
 =?iso-8859-15?Q?tt+Q3rokjipK6A3gurbDeQ3aCsB6qzF3oKxTwzzERQBzfwOX2KmFms=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <0FA76002AE67DB4D9A9BDB861371627B@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: lists.verisure.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6c830624-0da3-446c-513d-08d9d59a18a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2022 07:06:45.8654
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3055fa7f-a944-4927-801e-a62b63119e43
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 riaWDlnXkiS1ml1/Kcqb9cIZhMfXymP694lvuFROnQqyE8hCLTWr1nYmLXTuPDIqVHQdDb+hSYZsFBtlWNH5dRlqe0/2MIxGDId+e/YL4p0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB4698
X-Proofpoint-ORIG-GUID: Kw76TYYIYzFivkBBkJIAIIBQnRJ-a-0y
X-Proofpoint-GUID: Kw76TYYIYzFivkBBkJIAIIBQnRJ-a-0y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_02,2022-01-11_01,2021-12-02_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 07:07:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94776

Since SRCREV is pointing to the release tag we can drop the PV part and
just use it from the filename.

Signed-off-by: Ernst Sj=F6strand <ernst.sjostrand@verisure.com>
---
 meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb b/meta-oe/reci=
pes-support/c-ares/c-ares_1.16.1.bb
index b77604797..462ed5c45 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
@@ -5,8 +5,6 @@ SECTION =3D "libs"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dfb997454c8d62aa6a47f07a8cd48=
b006"
=20
-PV =3D "1.16.0+gitr${SRCPV}"
-
 SRC_URI =3D "\
     git://github.com/c-ares/c-ares.git;branch=3Dmain;protocol=3Dhttps \
     file://cmake-install-libcares.pc.patch \
--=20
2.34.1


