Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB07C5479D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 09:32:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8194.1672824755234865006
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jan 2023 01:32:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mETLiOK/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=036884e4d1=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3049GKql016333
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Jan 2023 01:32:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=sHlDSzN9uF8R3EAtEbFwJY+gi5UdpUQpS5FAQnkQsNw=;
 b=mETLiOK/4uTeh9k/4Sm3sqA/LQTIDJBxNgNkmCzN0Igs41Vipga6rF7pPuiyKR5WJJh3
 IVk6m+6P4eaOW6oYQ+pgeuZfWwX/zEvGfqLlz7uXuyT87j++Z7UbRlDCW0SoquukVW1b
 Eyw6z6R7hxgnS2DkiHWLGXKdADIvxewl9Hk36qfacg8WcVoDx3iFmLqnGHgqvV/F2DGs
 Sdn5fZBXM5V/defeJnwiwITpZJ7yHNU165Xqwlyg79rsYecgEdqM9Q/nGPYm1itjOymJ
 wyx0FGec+hICxaHitOjaLUJV34WUbbgqgtw95yfAcX1IlYoRVF+sb3T+BT2rMk3v756Q CA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mth87t6w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 01:32:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BEm1kzLJS8/XAr/Iusgv+6gm2WYgy5dqwmHmzXTa6YPKsSU+Xb/2gWBTSz7OTFTJ87Q7DuHxVTqZQYlQk/8zUGEUvWhl9E1/wvTXwwsQiXwNeAEczP39tDUaeGTLxe/1Zr4RQq5IUMPkAx5c4AoOQehVZ3jL0rs2QcezcDDCm56lFHqWhwllTMBytlavKZEaVSpy+R51Ld/+vixPzLuH7/s2KHqY1tweucHD+yfIGmY2kl68IybH5lD+Lw31MWskzo7A/ZMKxbAi3VUqjDq6uy1qRGKVkc7GmEeQLXnMQ/VJh2nbxBDkK5x9CSZXPP7T3ClG5U1QqH4jEmLC8Sz1aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHlDSzN9uF8R3EAtEbFwJY+gi5UdpUQpS5FAQnkQsNw=;
 b=NwXxewVr/ezkYnnXi/LGxy0f6YQjNj6yka9zAIdRl/jyOTi5Q9OivttIPVNLJT60izetk9rgJy1Jct2wbvyRXSm4h+RMrALFTSdtlpZ8D/tZ7y52T9QduJVLLONtplOscthAw/i0JtbMQ6b9dAgi+5b7nnQGCnNwbU37OkZQw7Qbh5y7uk6MKmMc+vVtMruynuXCEqfFHEuo9hQEt/6imK4FGtN5QPn1hyQe1XZtvx9kx9Tav4fhhEzZtHWynh8vsnOQ7CDI6SdKkmAk7t7I+molVK2dZoSIS1JkariLzJrKMW/nQujskipz/++6vT0BMl4A7o4cYNwblimZr65GTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SJ0PR11MB4846.namprd11.prod.outlook.com (2603:10b6:a03:2d8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 09:32:32 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c0fd:6b71:8808:4c21]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c0fd:6b71:8808:4c21%7]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 09:32:32 +0000
From: "Yu, Mingli" <Mingli.Yu@windriver.com>
To: "Yu, Mingli" <Mingli.Yu@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [kirkstone][meta-oe][PATCH] php: Upgrade to 8.1.12
Thread-Topic: [oe] [kirkstone][meta-oe][PATCH] php: Upgrade to 8.1.12
Thread-Index: AQHZFe2jJCNfhXwCokKDRYagKz8x9K6OEwqO
Date: Wed, 4 Jan 2023 09:32:32 +0000
Message-ID: 
 <CO1PR11MB50099753FEA61C58B0867283F1F59@CO1PR11MB5009.namprd11.prod.outlook.com>
References: <173315C67D2ADC0A.12545@lists.openembedded.org>
In-Reply-To: <173315C67D2ADC0A.12545@lists.openembedded.org>
Accept-Language: en-US, en-AS, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5009:EE_|SJ0PR11MB4846:EE_
x-ms-office365-filtering-correlation-id: ef1253f6-8616-48e6-4057-08daee369b19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 peGUrzSUiGdtU/1EJO2BvRIeRQ9/5q67z42fapj6GBkpDHco1IY5z31RRJyOlQO0Vq90HPpWBuYoIHrMfL3lgcCDQFqGWXzFL1vXHz6MciQJy95eVQenI8uKE8o4991/fiIV/fsbEMp9ltO0ETDFQw/viuYWqoOzeCfYO6Ic4j0LzPXrFcDQD3p2apt/Trwbwr5bIsJFT58HVr/7P/QA0x07q7c1Hj/Qijj/8KRypmhl3wLjRGRF+ghsWwHJvoJbZzE8a0Q727a9eEk4UWhtKkosFPLbZvfByg1sLjDni0QWnG8XLsWQRAyuUDoPoHAZdIYP8o82uWX5TZHOB1Hvx3ApsaVWpZsf8dA1tCigBeYuNQYKZMkwWGlLqOxiBWKUnm9H1/+3CMWekSNcKeayuokicWpfkbEiQFp9xMZZi6P+Sx7OTUHUF4J6B+cywiOuMmEZ4yliOYxKDj9wg6+ngicJMmNG2JR+EYGi6Mnm8lwPeOM4ObeD5syVY5CBUtWR5llAl6vI936XD1iErXsFSL258L6pnZ2rkcfcorwiccTFemC//sFDmAR227IlAcZrkzQgfZOF5AW0cD7Aiv34JUHB7U9mZ3qLbieZ6DUF38khKi8eyNMCGXY0loH8znZ6HdQS8g4gNZvJVTb7ooSgaGETNHZpQrIJLUG+WoL1EBotJBzi1288k481wOI0HIPvXayFHM/goUDvrHkYBkpMQBWXbqietTT55LJnRKzh1qXM5EC1qNOV1bu0ldqAYnCD
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(366004)(39850400004)(346002)(451199015)(76116006)(91956017)(41300700001)(5660300002)(66476007)(8936002)(66446008)(64756008)(66556008)(66946007)(19627405001)(8676002)(110136005)(316002)(52536014)(6506007)(71200400001)(7696005)(9686003)(478600001)(966005)(26005)(186003)(53546011)(2906002)(86362001)(55016003)(83380400001)(122000001)(38100700002)(38070700005)(166002)(16799955002)(33656002)(9126006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?qCTk48GBofxbU3WT8aFKTomUnaEY3ioAWTnvf3jv2SJV4VFGFPkiglfenr0W?=
 =?us-ascii?Q?vMVCnshJams7pwTlvioG1dokpkue53UwzTG2I10YKj942gj5R9EG1GyMIGqH?=
 =?us-ascii?Q?D/BpGhWnW5CT61S6Yc0sMqBvrjOBuze8AYXUKGZPs8EEuZFuYdAwyOUJZ8G9?=
 =?us-ascii?Q?dAtA8ageIuVt++tStK4/4PTrS1WYJWd2p+2SZyjVNjsX7/FNzwykKmk5exV8?=
 =?us-ascii?Q?5MIX1SloyRKd3gi0tWpbASJs3xz71cLeMS61ZHlVDLc/qz1gMbzKjWMPW5g8?=
 =?us-ascii?Q?+IBqfFCF6NZx1ZXaax6czuCYJJOvyimX9RD/Tkwb4eqJKgzp4aQY3y7sXvAJ?=
 =?us-ascii?Q?HsNOcuLNOmpnIYOxlocSm+fr4N6ftbInDUs+yjdmCx83oUtw44CdQoNbvzMK?=
 =?us-ascii?Q?oIpl1HOQRsIMTvoccj/mf1xoS2WxgVK9jzBrsohPdknVzYg6iTbsQKhHyTSU?=
 =?us-ascii?Q?z74/axMIWKwoO6hVvxYkhDcJf/R+usobuTwKnzVAumL7eFZtoJA1kkT/EwVg?=
 =?us-ascii?Q?INMq99GHfG+Y7+WcBoHmddoNB0iVy1guOjCv2zNNk7UFO4EROP2V3tF5HY9h?=
 =?us-ascii?Q?ql2qIBfun1N5YZTEXaFtYp/HOgofc0pBvSSxwp/no5VEkGOZNTrZyvwokOiu?=
 =?us-ascii?Q?dLDhZKQQ08YNyMPAqMTdHsdogN9s1uI8bbUEs+R43QBcq/rxWnSQH85w10sy?=
 =?us-ascii?Q?+VJBiuTHjpxpNujJlUYjsXE4whoYMzVEvuwcY4/rD633GSgFmkEyJSHHglKm?=
 =?us-ascii?Q?4vJj4I6Ay+XqEbrrbT2pF1t3uXJ5EDhtlezif69D4dVnXQhmH/VPoD0DsNCs?=
 =?us-ascii?Q?+/3MvELB6viQ/FzlWvC/xX3N0sWfz4voEIaz15qX02ixoe5s/z68qlejNb5C?=
 =?us-ascii?Q?gpKVCX0+1xsEOhUe0I/+DwMeLQGQtCV0FmqBq/oR6zUGzEuRrS4Bu37FCOcN?=
 =?us-ascii?Q?WWS5PYysmokV7PjOwFv87E7HCNzO2KxKtx5okzQgAu1CaYRN4kEHdPnBFRHp?=
 =?us-ascii?Q?Q1P3m9oWuoZyKcqqQkF7dmsA0syXyCvSGlp7jtgVs8YZpgbdjhLs8q2N7kIv?=
 =?us-ascii?Q?XLQtWcJzvW8mQwg/o7NfZjYHBk30RzaIEEr6x1gcHsoE6hjKQQ3xGwi9FIZ4?=
 =?us-ascii?Q?xTa47hI+AlEMm1e83GhUrIbfWMOAl4Dh/TVyxRwagqU7vi54I5H4BDz0flJ5?=
 =?us-ascii?Q?Kk8s1RejM8DOM04xdJ/9YPIgLhyvr6gJ50xSPCh62WXtSdk54IVKH7Pwp280?=
 =?us-ascii?Q?jtR+fPeVbmWhk7umyaUIu29FfqH64i266SWCaOSUuoGxp6O/yMSAO8lI8TPD?=
 =?us-ascii?Q?NH7LHmZEkTrH01zDr5txn3uTdDlKNaBljvzYhWrCRGqb6O8Pm6ysPeRiuGV6?=
 =?us-ascii?Q?cE6VzlAi8e/OGOglHKveNQ4DAw1JdA2dS18I6JewP9s6WKmOLS9kY/Vqxqtu?=
 =?us-ascii?Q?gw9mDkEmKsJ1qUxd6tKkBDDJp8EAuFpXDnH1XDzXUkODlGs8oi5PYovF/trh?=
 =?us-ascii?Q?rvctxDtBJE8wGZTBv9U90dc7SzfqEO29/k4H4qoyCG2s61zDv09mj5PkEkPj?=
 =?us-ascii?Q?shAfcSGeEr7oeRVXijK6G3kOFbnYgkpnILpb0LPv?=
Content-Type: multipart/alternative;
	boundary="_000_CO1PR11MB50099753FEA61C58B0867283F1F59CO1PR11MB5009namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1253f6-8616-48e6-4057-08daee369b19
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2023 09:32:32.3645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /FbopBE9xgnj0kR7LDnivILOIbxzPC1z27fQ7ZFlOW8+wgaUk6c62DR1i9Foh/O26A0XsLiVQ5V3xQ+FvIgnYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4846
X-Proofpoint-ORIG-GUID: HG9BSleYX-0immbWQHXLuORZDME9Y7WW
X-Proofpoint-GUID: HG9BSleYX-0immbWQHXLuORZDME9Y7WW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_05,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1011 mlxscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301040080
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 09:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100391

--_000_CO1PR11MB50099753FEA61C58B0867283F1F59CO1PR11MB5009namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping.

Thanks,
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Yu, Mingli <mingli.yu@eng.windriver.com>
Sent: Thursday, December 22, 2022 18:10
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe] [kirkstone][meta-oe][PATCH] php: Upgrade to 8.1.12

From: Mingli Yu <mingli.yu@windriver.com>

This is a security release[1].

[1] https://www.php.net/ChangeLog-8.php#8.1.12

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.10.bb =3D> php_8.1.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.10.bb =3D> php_8.1.12.bb} (99=
%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.10.bb b/meta-oe/recipes-d=
evtools/php/php_8.1.12.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.10.bb
rename to meta-oe/recipes-devtools/php/php_8.1.12.bb
index 624ab2621..794330dcb 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.10.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.12.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target =3D " \
           "

 S =3D "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] =3D "2de8e0402285f7c56887defe651922308aded58ba60befcf3b=
77720209e31f10"
+SRC_URI[sha256sum] =3D "f87d73e917facf78de7bcde53fc2faa4d4dbe0487a9406e1ab=
68c8ae8f33eb03"

 CVE_CHECK_IGNORE +=3D "\
     CVE-2007-2728 \
--
2.25.1


--_000_CO1PR11MB50099753FEA61C58B0867283F1F59CO1PR11MB5009namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"elementToProof">ping.</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"elementToProof"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"elementToProof">Thanks,</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Yu, Mingli &lt;mingli.yu@eng.windriver.com&gt;<br>
<b>Sent:</b> Thursday, December 22, 2022 18:10<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> [oe] [kirkstone][meta-oe][PATCH] php: Upgrade to 8.1.12</fo=
nt>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br=
>
<br>
This is a security release[1].<br>
<br>
[1] <a href=3D"https://www.php.net/ChangeLog-8.php#8.1.12">https://www.php.=
net/ChangeLog-8.php#8.1.12</a><br>
<br>
Signed-off-by: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
---<br>
&nbsp;meta-oe/recipes-devtools/php/{php_8.1.10.bb =3D&gt; php_8.1.12.bb} | =
2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
&nbsp;rename meta-oe/recipes-devtools/php/{php_8.1.10.bb =3D&gt; php_8.1.12=
.bb} (99%)<br>
<br>
diff --git a/meta-oe/recipes-devtools/php/php_8.1.10.bb b/meta-oe/recipes-d=
evtools/php/php_8.1.12.bb<br>
similarity index 99%<br>
rename from meta-oe/recipes-devtools/php/php_8.1.10.bb<br>
rename to meta-oe/recipes-devtools/php/php_8.1.12.bb<br>
index 624ab2621..794330dcb 100644<br>
--- a/meta-oe/recipes-devtools/php/php_8.1.10.bb<br>
+++ b/meta-oe/recipes-devtools/php/php_8.1.12.bb<br>
@@ -33,7 +33,7 @@ SRC_URI:append:class-target =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/php-${PV}&quot;<br>
-SRC_URI[sha256sum] =3D &quot;2de8e0402285f7c56887defe651922308aded58ba60be=
fcf3b77720209e31f10&quot;<br>
+SRC_URI[sha256sum] =3D &quot;f87d73e917facf78de7bcde53fc2faa4d4dbe0487a940=
6e1ab68c8ae8f33eb03&quot;<br>
&nbsp;<br>
&nbsp;CVE_CHECK_IGNORE +=3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp; CVE-2007-2728 \<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR11MB50099753FEA61C58B0867283F1F59CO1PR11MB5009namp_--

