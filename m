Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC03C61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 17:53:28 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.80])
 by mx.groups.io with SMTP id smtpd.web11.49572.1677002007355758856
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 21 Feb 2023 09:53:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector2 header.b=rOqiV8fw;
 spf=pass (domain: witekio.com, ip: 40.107.14.80, mailfrom: hsimeliere.opensource@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INs4LxeVYXx0whhUWIQm5+1SU8X2QXJlgy33Zj0elSLG4LvnFaBVEi8vZI3Ms6M+XP+glG9cn6gL1txaAgPjRO0vzC8QBJEfpjcfV6sYC2sbIuigmzI1UZcVam9zuxGHiR/V50wUn/utUkCRx5Fs4pfZR87+HIxOs6PUQEgB0sf7BUkbbyPSGyjQKnMDBeEXfsknOlktiSQODSfGWBAJIFpkY/hrg4F+6zZVj5nAE+QMbpdNlskPTPjNI4gwxMccanJXyQpk+BVqIuZhUqw9m0qL7TyghOiYokY+PwTgE5ANHlIQb+TUgaFfYNItg0kVMHi5GDaDXX9J3y41LVbJlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epZlqCOr7SLLL2OZ1TZnuyvafxNvYU8qzWsmaH32tVM=;
 b=BGpB+ML+axl4Uv4qQWiS6oLZntlgmTYltZZCYUjH8wVcS7dDhSJFRWV7PpjOKki3TthErm++gjN54TyflfdU31POJ+DNCOwxa9RUGgvCN677XWpoqETM+adnThzakjTGV3V+AJd8blrf/Ns0upodYA2Tsq63Vg2v/hCssCXNl932DMI8XmSnG0ASy4UE9X/CEDJodeWnVodElJS4MdKklbKM+0OXH1+XsYXn6nO7U+cVJLXsN8YkDGnduHFWbghHsusSX7C5+qi4AGfKoSg7N2yDeifSqsSn0S5faLt9p0J1Mf9TrE6f5HvKPhtc71FmFCv4yHbTWwBPZrkSmokxcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epZlqCOr7SLLL2OZ1TZnuyvafxNvYU8qzWsmaH32tVM=;
 b=rOqiV8fwZ91B/gXNG1uvbviRKmJekDS846nXYBZf8x+If/lSvW7wR96vFViAqWbi++sI0k7AWRC/l+8cyFXj0Y2Bv/uWir8l+R1ylt08DDCCOMbWocU89IUQz8nCIOWY3SoKT3Nq0/4eErDzf+CK4N0yqMq43J3QPp/Jk2JeLA++Ekt0ryXhJr6hzfDFmKQ4tnaV6XXQePaI1kOoBhk/pe0pFBJq9PSaIZrHZmXQ1UEzmH/KK9gf21WB18a74QHsHuIBT/Ka6fGKwh/xGwUJ59o0pXd8DBnyu0i0NYzZ7peq71sE7ZXDz8O+9lBFJXA26vxM74chBj+X8LITbaEpww==
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:48::10)
 by DB5P192MB2198.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:48c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.15; Tue, 21 Feb
 2023 17:53:24 +0000
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::c795:3853:7373:322]) by PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::c795:3853:7373:322%7]) with mapi id 15.20.6134.017; Tue, 21 Feb 2023
 17:53:24 +0000
From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
To: "Openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][dunfell][PATCH 2/2] zeromq: upgrade 4.3.3 -> 4.3.4
Thread-Topic: [meta-oe][dunfell][PATCH 2/2] zeromq: upgrade 4.3.3 -> 4.3.4
Thread-Index: AdlGGe/m0o0Ky96+TPSv8yrnfit41AAA1Jig
Date: Tue, 21 Feb 2023 17:53:24 +0000
Message-ID: 
 <PR3P192MB07141BC31A5BD52181A554BEDAA59@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
References: 
 <PR3P192MB07146222CB16983334D716C4DAA59@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
In-Reply-To: 
 <PR3P192MB07146222CB16983334D716C4DAA59@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3P192MB0714:EE_|DB5P192MB2198:EE_
x-ms-office365-filtering-correlation-id: 3f2bc6d2-0dcb-4f9e-6860-08db1434872f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bh4JWTCJuAFZZkaD3Dv0sKNh3f+xGJwFHyReJlBFizPRc0P1WzbUsP6weJoSOdyBQFfqP4tcI/27ppxcl2oQOXM/fQux2AkTr5CsisM+WT6DJyWgpvRb7XuPuOMvTk9otWIryzRybcY4MeUfgB8WxhAe2CYTmLv9qBxThrJSVcFgACEXeTvltLZkhvGL0XFMH/uEMdorshKk7VusV/qTAq1ydBSxhlurM5KkVMEjkStFgVffbs2WpoxKjlXmvilefOhATaRgf86zNx1nCHBkKuc6+qhdkguC+HLyBLLBDJb5mJ7uzZ7yOGxX974BQ14tUvrrga8CwEx+xmlctIh5cudVgl96GPcSaPV/2lDGrr1XqDBPJFpD2ZagFi7pyl9XCBIOgJ7kB9Sny5DmVhQ03+Gx2aXoNcys6UkTUPtwS+CI3eNNLO57+yr4+HzIYINHnWDXT5/Bmp6WHmY5L8KQyT/JvGLb0iVSe0SAXRcu44R95lRk+/F9KezVZQUDjUFXvgyXX/xd3vBh0qNJxgIhpkzkiUjADDIMuw/033HRyEvVC/fM+/Vig8hTSV30AuAEL+IX6Lih6gYv+AbEl2kpmy43Epm6+AhsGmKXg3ce+WwxmPAIS+Ps9MFfBlYlav+vpMeWnc52YgXSC2Zbya+zGJCSRQQ1k23wEw8ygko00SimXfpvDaIJDYWEbKXOwW+G
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB0714.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(39840400004)(396003)(376002)(136003)(366004)(346002)(451199018)(83380400001)(38100700002)(38070700005)(8936002)(122000001)(66946007)(5660300002)(2906002)(166002)(2940100002)(86362001)(33656002)(55016003)(66556008)(7696005)(478600001)(66476007)(66446008)(8676002)(76116006)(71200400001)(9686003)(6506007)(41300700001)(64756008)(186003)(6916009)(316002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?gXP4UH4LOVsoGr9vomxo78pWogglApG/sJHcFyBwegmeVVhIjGq+rtSUqvTZ?=
 =?us-ascii?Q?4YVXSXx6tajNzwBpMixbwh73JxAw+86P5kJpM7oL5xpuNNLWJ1B2whW6JHAP?=
 =?us-ascii?Q?CV/wOT/7+qZcWr8HiwIWK8MGld9S7jXS+51AhitxTpddkfnC4UsrUT54wZUF?=
 =?us-ascii?Q?j5A0cVhlQ1wFUfuMLvkVq1w1SYWg6kyLNtTIMOS+C6Xt9hwhCdefBqMcQ8ZR?=
 =?us-ascii?Q?IJiY4TgC98hpPmoxJa9tEkKxeEvtUl1b/FU3MmwCsvoBPmx5dttjG4G4E13+?=
 =?us-ascii?Q?T0QBldLciicRSFSg8sq3He+t5dImbBkIC0jBAJ3ph8ksNf9h1j2TFe7gRcbp?=
 =?us-ascii?Q?DFR0LeNOJVJ9f3/8eCy2pzs/FqQiRVpPcbOI8EfM8Q2izHDMTXxFVi0aw0ow?=
 =?us-ascii?Q?ALRjJAFm9wa6DK2nFdkiHqQvbffgdjAwO/DM2gF2B7QwLFd23RwMhgjaX40b?=
 =?us-ascii?Q?qP5E1hNuAAL8NvC32t+aNjDcTTV0v2WlPUt5MNjxeug79UVAY3YXj/an5h+l?=
 =?us-ascii?Q?tsyWfphlmL+S73NYeCSE4c6OKvPTBszRJo3BDj/f9nNw3V0HNfkV0xs09xPY?=
 =?us-ascii?Q?sU4sFfvZbLc3Cvbu0hnR5Fc3t1ilv4GpJyxP6kk1bMIDrjxjVTkfuiRUJQuL?=
 =?us-ascii?Q?Fxd5za6BhuP+yHVXoMPxaVtKMqxkFehbmF7nYAZbBF+iPgdc62c9MOtL0i2P?=
 =?us-ascii?Q?rfW9YJmZk9QG05+GKtbJ7wVQ0gIe7q0UtwPR3BFustf1yAj4hGImuAbZCggh?=
 =?us-ascii?Q?PYijLnk3T/iHW/YpaUFTlpYu2kGuAkUAH8LNUpX5rTTkM0rJdniHIzG3nQ/S?=
 =?us-ascii?Q?MxINuIrC9Rnq3UETJZ9sQdGXIkZ3s3CYzEKYScRatWPPZr4U5yRGKR9PMju/?=
 =?us-ascii?Q?6YfllbDS7PajvAI3JgWK+OTxXc9Y7DSovzyQJmCqx1lo8Ez0xprA+/paOjIA?=
 =?us-ascii?Q?ull7wy7yugMeIdP3D8GTb2iypzr5RNgW3JedHHts9tFE7aIgjkGoN2Xl97XC?=
 =?us-ascii?Q?t/yiLpFlWRwvmCiXV7YXOW6hV1fEHk72d73Kk1MqPsSW7j+1Mp4Yo1UtXgON?=
 =?us-ascii?Q?DrlFGwB0wX9ly0xExSaXpCXax7QigXel3WTwStAoMBpgltfpO2nRU8p1d8St?=
 =?us-ascii?Q?ylcchPc/+4rsPYGR54yq11YJx2CkF5rzofbKYV+9B6phsPnFjhvmYHcinNpC?=
 =?us-ascii?Q?al8Y45g7w3an5C5UkFiwkGpMrkyD84JEhr99pkV3WQqG5NiNO0RrbDzoj34I?=
 =?us-ascii?Q?Og++r6ruzy7y1/6U5qg6YzyHoeF9IfQ0sc/nW3UXae/ibsqzCxIYwICqrc+f?=
 =?us-ascii?Q?sIkHy6rH4iudxLxowYDodpXOYeOYeyeP8kAbqb8ML+EVOv5TJuHLJXs2B5dz?=
 =?us-ascii?Q?w1xfz1KSB3+zn+CsQD5P/9KdgVqjQ7AaFipj/kAJDQ8wWwraQ6pQ0RbI1USh?=
 =?us-ascii?Q?fQ82doftW+bWFBNcQp+438bG7mhkXFEfiofv0APhdxZsDEa7qyoVliXzCo6r?=
 =?us-ascii?Q?B/V/rAB2isU2d7qiT0TrTbQ02IDi6wF51RtFIHaPyZ5DLrnGqbLMNXwifmbC?=
 =?us-ascii?Q?XcAQwm542IrlNfNLhnNynZDQVXNvhEsVuxr1MnArPrx4e27+1EKTTuS6+XfR?=
 =?us-ascii?Q?MVZsqMYldqECpjw6liqrlijrXmyRXH6nejoCbSZ58D7R?=
Content-Type: multipart/alternative;
	boundary="_000_PR3P192MB07141BC31A5BD52181A554BEDAA59PR3P192MB0714EURP_"
MIME-Version: 1.0
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f2bc6d2-0dcb-4f9e-6860-08db1434872f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2023 17:53:24.1630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AnlEMtWrPXu+Nk/M1uaXQgSZjbK+ObHqRnSNG/QJFYCIOTZgpEjPX0/ioSbtGedOEAyJINWZPhmkwPplUoa+QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5P192MB2198
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 17:53:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101193

--_000_PR3P192MB07141BC31A5BD52181A554BEDAA59PR3P192MB0714EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com<mailto:zhengrq.fns=
t@cn.fujitsu.com>>
Signed-off-by: Khem Raj <raj.khem@gmail.com<mailto:raj.khem@gmail.com>>
(cherry picked from commit 8ced89f62f152e2b233c532ce03408bf46bde55b)
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com<mailto:hsi=
meliere.opensource@witekio.com>>
---
.../zeromq/{zeromq_4.3.3.bb =3D> zeromq_4.3.4.bb}               | 4 ++--
1 file changed, 2 insertions(+), 2 deletions(-)
rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.3.3.bb =3D> zeromq_4.3=
.4.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.3.bb b/meta-oe/=
recipes-connectivity/zeromq/zeromq_4.3.4.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/zeromq/zeromq_4.3.3.bb
rename to meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb
index a10500475..4381f2d6d 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.3.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb
@@ -10,8 +10,8 @@ SRC_URI =3D "http://github.com/zeromq/libzmq/releases/dow=
nload/v${PV}/zeromq-${PV}
     file://0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch=
 \
     file://run-ptest \
"
-SRC_URI[md5sum] =3D "78acc277d95e10812d71b2b3c3c3c9a9"
-SRC_URI[sha256sum] =3D "9d9285db37ae942ed0780c016da87060497877af45094ff9e1=
a1ca736e3875a2"
+SRC_URI[md5sum] =3D "c897d4005a3f0b8276b00b7921412379"
+SRC_URI[sha256sum] =3D "c593001a89f5a85dd2ddf564805deb860e02471171b3f20494=
4857336295c3e5"

 UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/libzmq/releases<https://=
github.com/$%7bBPN%7d/libzmq/releases>"

--
2.25.1


--_000_PR3P192MB07141BC31A5BD52181A554BEDAA59PR3P192MB0714EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
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
@font-face
	{font-family:"Source Sans Pro";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zh=
engrq.fnst@cn.fujitsu.com">zhengrq.fnst@cn.fujitsu.com</a>&gt;<o:p></o:p></=
p>
<p class=3D"MsoNormal">Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">(cherry picked from commit 8ced89f62f152e2b233c532ce=
03408bf46bde55b)<o:p></o:p></p>
<p class=3D"MsoNormal">Signed-off-by: Hugo SIMELIERE &lt;<a href=3D"mailto:=
hsimeliere.opensource@witekio.com">hsimeliere.opensource@witekio.com</a>&gt=
;<o:p></o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">.../zeromq/{zeromq_4.3.3.bb =3D&gt; zeromq_4.3.4.bb}=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; | 4 ++--<o:p></o:p></p>
<p class=3D"MsoNormal">1 file changed, 2 insertions(+), 2 deletions(-)<o:p>=
</o:p></p>
<p class=3D"MsoNormal">rename meta-oe/recipes-connectivity/zeromq/{zeromq_4=
.3.3.bb =3D&gt; zeromq_4.3.4.bb} (87%)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-oe/recipes-connectivity/zeromq/zer=
omq_4.3.3.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb<o:p></o:=
p></p>
<p class=3D"MsoNormal">similarity index 87%<o:p></o:p></p>
<p class=3D"MsoNormal">rename from meta-oe/recipes-connectivity/zeromq/zero=
mq_4.3.3.bb<o:p></o:p></p>
<p class=3D"MsoNormal">rename to meta-oe/recipes-connectivity/zeromq/zeromq=
_4.3.4.bb<o:p></o:p></p>
<p class=3D"MsoNormal">index a10500475..4381f2d6d 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3=
.3.bb<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3=
.4.bb<o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"FR">@@ -10,8 +10,8 @@ SRC_URI =3D &quo=
t;http://github.com/zeromq/libzmq/releases/download/v${PV}/zeromq-${PV}<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"FR">&nbsp;&nbsp;&nbsp;&nbsp; </span><a=
 href=3D"file://0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.p=
atch">file://0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patc=
h</a> \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://run-ptest=
">file://run-ptest</a> \<o:p></o:p></p>
<p class=3D"MsoNormal">&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-SRC_URI[md5sum] =3D &quot;78acc277d95e10812d71b2b3c=
3c3c9a9&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-SRC_URI[sha256sum] =3D &quot;9d9285db37ae942ed0780c=
016da87060497877af45094ff9e1a1ca736e3875a2&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">+SRC_URI[md5sum] =3D &quot;c897d4005a3f0b8276b00b792=
1412379&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">+SRC_URI[sha256sum] =3D &quot;c593001a89f5a85dd2ddf5=
64805deb860e02471171b3f204944857336295c3e5&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https:=
//github.com/$%7bBPN%7d/libzmq/releases">https://github.com/${BPN}/libzmq/r=
eleases</a>&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">2.25.1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_PR3P192MB07141BC31A5BD52181A554BEDAA59PR3P192MB0714EURP_--

