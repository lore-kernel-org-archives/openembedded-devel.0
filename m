Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A891C67861
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 10:04:46 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.132])
 by mx.groups.io with SMTP id smtpd.web10.7391.1712311475602407930
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Apr 2024 03:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=w3rRPcS2;
 spf=pass (domain: siemens.com, ip: 40.107.20.132, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLBPzSaG8dzKImKriGgx2xNqcvb490n8y3USWzF9a3xfm1oyT6OCdaq11SMyyUPiHZIi7ecDkQNpm7iIRBxjrZbrzeH0oEMV/7k7LzX2kPudPhkgQ49vCysVbo0w9OzmnLClyUgjJJJTAC9xJNQ4jIfRjoJDCfhpGo6rWbiiaMOghP9TPpaxuDS6iJz4WEv878tdRQsAB4Crnzh1gBlg/5ExTZShNv8fyr5L+K2MG+vR1fj+17cbTRBiSFeCWCstlQOvAmimm+bMHWJHgmdO600udcQuAXpad+A+RZ4oCbON9hZst3QjsTDo7wLY+99bJ4vGxivzmqNvfLJTvhhxkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRbXFF23NUezxNR9fLDly3VdaobpcYeZ2k8tPdCO5Yc=;
 b=XuJ9pg9LMtvAFv2R6nLGdeS/rGreksY1Q9dqWqtYCKtUUve6heKc/rVOJ/LCzduo4hqij4CcewdjmiLGRbVVKxuxo+VnUa+HngfWOabLHIHJMgo2BbgPSDEQEacHab4vjfgjzxJ31i3vV4ER82M8L118McVHmcRjd092k3kZsk6FsZAK2RcnqxeeQs0PXxJqmZ3QPQ0FjbgbBAhj2vb7455ObzuNuZGoVUiNJ2//DbjiE0H6+qne+aAyHanknsFgruuG63znr1HMNohWduq+9Za2fw2eJ/roIminaRzMPDbUIzVX1/qnD/bUoTow8javR1t6jZ6/C1pqbqWIs8GMTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRbXFF23NUezxNR9fLDly3VdaobpcYeZ2k8tPdCO5Yc=;
 b=w3rRPcS2ou2siG6WcJ61e1jX9BRY/rcyuRsVC1H2lCrN0RST19+nq+2dWYKwr4ENyYp2os6MALWD03KoJDK2VKdZMesVsOG+SSE629YWTIimBqgSs9JNpk0uA0+0WKIkZPl/e+0w8KMgof5xAIBudwX2h3MAuZKoeFD5ouITTiUscd4f0bhi+K5cuJTRZNT270Tfn9iPGlZYyf6h4q7Qn3kjq7d8ZluJcrlIovqsgV1pLTRB1IPFEE62I4XELUipm0KkFlI4OwYeyRovaISb3+8F377NWs1tCD+0IIdVWrlwn9ksNh8O5FXyQB0S8+B/SOoJRruSJh9oPRgwdwfPYQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM0PR10MB3220.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:182::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 5 Apr
 2024 10:04:31 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd78:3502:7564:1891]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd78:3502:7564:1891%4]) with mapi id 15.20.7409.042; Fri, 5 Apr 2024
 10:04:31 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Khem Raj <raj.khem@gmail.com>, Wang Mingyu <wangmy@fujitsu.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "petr.gotthard@advantech.cz" <petr.gotthard@advantech.cz>
Subject: Versions of libmbim and libqmi
Thread-Topic: Versions of libmbim and libqmi
Thread-Index: AdqHPwZ12sgbyP74ROyEvn131iPQoQ==
Date: Fri, 5 Apr 2024 10:04:31 +0000
Message-ID: 
 <AS1PR10MB5697A0F615AB7B6FEBE3F9C5FD032@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=cec4cc8b-1341-4917-b308-2b1e5b5d6f68;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-04-05T09:52:13Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AM0PR10MB3220:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6DI2hKCRlYItgQxqt/nmaOlsnRoRTq6rkZ5lwhS24iHeXc6UYYOVPaEbj65pKQbI8xOniF9bmiL9bv4cJpaOkz4C3p8t9zqQhagvZV1AKOOspBtlNrg/uo4y4tYY0oW56Qh+uoLzD6sMtkMzQSFq3QIW+MTkCC4lNym1sBCb+dPGRyNjZTexFl6x5mjxaAX/kniGtTgH6baClufhra8++ACl9mzgYxR/xz/TSB7kU/4jH+K97BMR/eI+7AhRA3b+ZcU16bgNsgv5olBfykr/8i4spWh9kp8nM6oT+M4OaVld6bTjmiqXTGKXHS2rbbPgtu7X6g5Gp6hu4vbrAT07JI8+i9C1w9aGLNYxa9HimgpujnGYEJR57qIULNG084Rmh3T5nSiVXF0mrmuMhU5UnTircywZaYbOg8MaYU18ot19JzN9QAxHSEWZnW0QHC/sYNZDZwAc59iDQNUGkyIL6aFesGJfMCIAN2/H2vR5/ipR/9ew12v+DbiuB6IoSvJE/ST+Atu9EM5Cmg7FUQTim6i7YuunspLMV4QscbGFNtBp2NkqOvADtE3pfKWYy23URyyP5OfvzvwCRqSuV8/EfbB3OHGyyIGztrCgemzhBtU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Wl7E9QOi+JCvO/Vy4/O+b98g3vbafDV7ze7YWjaR7CUGp+cLXCc63ShdRqej?=
 =?us-ascii?Q?7tLDnh0JHKZC0Y2rIYSwKccsz78Mg/fOirNcVlUy9hzcKLfyRn6cJ7CXivmH?=
 =?us-ascii?Q?rHUqZm2xhJdaR6k7XTNw5JDOqx7GkPQA9shzkWo543ubqXc2OMg6Pt/UoOZr?=
 =?us-ascii?Q?AQN7pc4HRvzIQp29450dCDEw3yruGDsZgJj3Ho82eR8M36UuLSdncuZaar1F?=
 =?us-ascii?Q?2EP5/acaZjJy2kDI7+UrMHOJMOJIRnf+jLNLITnC5Ay3fhOpktmcFXAL29o9?=
 =?us-ascii?Q?8FLF0YYUdAIWOTA0mj8rqTfQGJSmK5Sgn8iU9TUswZ4hdKlM30qPU7h+qr5h?=
 =?us-ascii?Q?rqy3ysSTeftZ1J1ngkZvEO9wEBobKmn3xNHigvxvmJ4iCuR9kWpmXxs/uid6?=
 =?us-ascii?Q?+OCBLO6R2EwlUidL9EKcDYplh0SASbqfIlZEQaCInQFTXK97t9VwRIW+DDe5?=
 =?us-ascii?Q?f4kl31D/q9zGF37wYjw7BM++yEym72VlaKCTgr8ifaOB3A9EHxpNrJAxwzNx?=
 =?us-ascii?Q?QmPjg5853BnvNz6nC9SNbxucXx22MkpCxKUdniBK0AsibuvTov50ljdP1QbK?=
 =?us-ascii?Q?f4WlaJQzZJ0Tq0AsOtjIhezMmIBQkHwVF9u42ERPrQiH+gzh3c4057JaxFh7?=
 =?us-ascii?Q?g6lVXoSRTFmWoAbLYWv8xDK9EGM2NWmeqL0cX1th/JaFnwA82xt0qF0uoOtJ?=
 =?us-ascii?Q?VeXqubw6l3L+qfE+LDiUHbxx7OppPL0wzrQZXY6XDPEiMit5kW7dIPAKBSCS?=
 =?us-ascii?Q?z3tU0+mW88MekEmN7j0pJrubYjauxqqH75IhFItxsYnWTQHMO8IPRrULfQx1?=
 =?us-ascii?Q?y3kGctNhKt/TLz5PL9mV4miwi0l7Gtp+cXzSC8UVIVyo4Lf0r0zpHfk5kTxq?=
 =?us-ascii?Q?QQt3QRfk4W46OySJwDyTvBGnD6nFJFqoBHCuojf2ORxt7Tl1b5gDR0JslFbd?=
 =?us-ascii?Q?HPWNkNDBG/406LEsYLW7cs4C5sHlZUExSpa6AD91yxqtTWQRv0jYJ0ctzqgO?=
 =?us-ascii?Q?e4oFiGMbAjIaTvNBw5Elu9sU+jIyn12fHa7HagHphGYuUi9JY0aq/PM7Ylns?=
 =?us-ascii?Q?1iXH0XfJAOLQB7STx6WsWTkGGqs5KMYEF1idMnJWtMcnbEAcLRtahtMSOuiJ?=
 =?us-ascii?Q?7qCS/mDm7VDQxZWbr66shzGaCu1KE69w89+q0QtuY10n7PiLsm09VRUshjj3?=
 =?us-ascii?Q?sdPZMXU9qTuLnXiphvETSQtTzILyT4xGl4fkC0LKe1DXmaXnlogC+VjFlS8A?=
 =?us-ascii?Q?IOxgDf/wjYKylqjUe2MxnEUiEhYyd5tGIJXulirKlDX/EbpZaS8vtrlHg8mJ?=
 =?us-ascii?Q?e5zgcvvkIEPIv4aonkjFxyIoxnu9zKyx5BHlbAww95UwaSsaEa8QwNUkvzll?=
 =?us-ascii?Q?1Q0nM2+XeLsxV8OEs+q5u9Yvjx7WKOidJNc39jCENXg/HhUWPmIJ+bh/Irbn?=
 =?us-ascii?Q?muPMTkUftd7Pah0gUXBZal/9+X0iR1Gc/JipxP8fihn5T9EdjyLDjLoY+LM/?=
 =?us-ascii?Q?5cnWEIqMsJYKv1T25CTjIaOwVaveYMmFb8VVsulPFx9NjVlo84Zb/IC2y1OH?=
 =?us-ascii?Q?zIBDfWvNFNcLN+dN45H4CpXSI0Bq7Rb3V0UCQIQU?=
Content-Type: multipart/alternative;
	boundary="_000_AS1PR10MB5697A0F615AB7B6FEBE3F9C5FD032AS1PR10MB5697EURP_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c3131e-1a04-4b99-ea86-08dc5557c9e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2024 10:04:31.7035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vaPNvNKdg3YAMMSH6+GBw5eUSbWVds97IXq9vDtkB0mQBWcx3hco+9tP6l+9qNhiUYQGGVD/FysFqhvrHlcYCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3220
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 10:04:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109818

--_000_AS1PR10MB5697A0F615AB7B6FEBE3F9C5FD032AS1PR10MB5697EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear maintainers,

Could you please clarify versions of libmbim and libqmi for scarthgap relea=
se?
These were recently upgraded to unstable, then reverted back to stable and =
upgraded to unstable again.
This second upgrade was done regardless of new inherit of upstream-version-=
is-even.

libqmi:
https://git.openembedded.org/meta-openembedded/commit/?id=3Df690ea9e33d9ff8=
0bb3e7434a5ce428c7a4a0c6c libqmi: upgrade 1.34.0 -> 1.35.1
https://git.openembedded.org/meta-openembedded/commit/?id=3D9ebcca5734830d4=
8241c2ec7cd03d738a5d10c76 libqmi: upgrade 1.35.1 -> 1.35.2
https://git.openembedded.org/meta-openembedded/commit/?id=3D7e0ce9b5e7e0e57=
4acbf3488c947693e52c45f9f libqmi: correct PV
https://git.openembedded.org/meta-openembedded/commit/?id=3D538b03a3ffaf25c=
3bfcde076ae6a81ca05b3c166 libqmi: Revert back to the latest stable 1.34.0
https://git.openembedded.org/meta-openembedded/commit/?id=3D3d3eea39abe7ddd=
6caeb1ad1fee10ddcb593dd7b libqmi: upgrade 1.34.0 -> 1.35.2

libmbim:
https://git.openembedded.org/meta-openembedded/commit/?id=3D3ddd5060a87182f=
614981f07d1e1f72f45b82719 libmbim: upgrade 1.30.0 -> 1.31.1
https://git.openembedded.org/meta-openembedded/commit/?id=3Ddd093656b9cc2de=
f64307387ba45da61451d5397 libmbim: upgrade 1.31.1 -> 1.31.2
https://git.openembedded.org/meta-openembedded/commit/?id=3Db7d577d8d3eccd0=
4098a245ce7fbe46097358786 libmbim: Revert back to the latest stable 1.30.0
https://git.openembedded.org/meta-openembedded/commit/?id=3D770f0b97c0e16bf=
4c2d8b2e092a5a28069d677ba libmbim: upgrade 1.30.0 -> 1.31.2

Thanks,
  Peter

--_000_AS1PR10MB5697A0F615AB7B6FEBE3F9C5FD032AS1PR10MB5697EURP_
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
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
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
<p class=3D"MsoNormal">Dear maintainers,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Could you please clarify versions of libmbim and lib=
qmi for scarthgap release?<o:p></o:p></p>
<p class=3D"MsoNormal">These were recently upgraded to unstable, then rever=
ted back to stable and upgraded to unstable again.<o:p></o:p></p>
<p class=3D"MsoNormal">This second upgrade was done regardless of new inher=
it of upstream-version-is-even.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">libqmi:<o:p></o:p></p>
<p class=3D"MsoNormal">https://git.openembedded.org/meta-openembedded/commi=
t/?id=3Df690ea9e33d9ff80bb3e7434a5ce428c7a4a0c6c libqmi: upgrade 1.34.0 -&g=
t; 1.35.1<o:p></o:p></p>
<p class=3D"MsoNormal">https://git.openembedded.org/meta-openembedded/commi=
t/?id=3D9ebcca5734830d48241c2ec7cd03d738a5d10c76 libqmi: upgrade 1.35.1 -&g=
t; 1.35.2<o:p></o:p></p>
<p class=3D"MsoNormal">https://git.openembedded.org/meta-openembedded/commi=
t/?id=3D7e0ce9b5e7e0e574acbf3488c947693e52c45f9f libqmi: correct PV<o:p></o=
:p></p>
<p class=3D"MsoNormal">https://git.openembedded.org/meta-openembedded/commi=
t/?id=3D538b03a3ffaf25c3bfcde076ae6a81ca05b3c166 libqmi: Revert back to the=
 latest stable 1.34.0<o:p></o:p></p>
<p class=3D"MsoNormal">https://git.openembedded.org/meta-openembedded/commi=
t/?id=3D3d3eea39abe7ddd6caeb1ad1fee10ddcb593dd7b libqmi: upgrade 1.34.0 -&g=
t; 1.35.2<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">libmbim:<o:p></o:p></p>
<p class=3D"MsoNormal">https://git.openembedded.org/meta-openembedded/commi=
t/?id=3D3ddd5060a87182f614981f07d1e1f72f45b82719 libmbim: upgrade 1.30.0 -&=
gt; 1.31.1<o:p></o:p></p>
<p class=3D"MsoNormal">https://git.openembedded.org/meta-openembedded/commi=
t/?id=3Ddd093656b9cc2def64307387ba45da61451d5397 libmbim: upgrade 1.31.1 -&=
gt; 1.31.2<o:p></o:p></p>
<p class=3D"MsoNormal">https://git.openembedded.org/meta-openembedded/commi=
t/?id=3Db7d577d8d3eccd04098a245ce7fbe46097358786 libmbim: Revert back to th=
e latest stable 1.30.0<o:p></o:p></p>
<p class=3D"MsoNormal">https://git.openembedded.org/meta-openembedded/commi=
t/?id=3D770f0b97c0e16bf4c2d8b2e092a5a28069d677ba libmbim: upgrade 1.30.0 -&=
gt; 1.31.2<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; Peter<o:p></o:p></p>
</div>
</body>
</html>

--_000_AS1PR10MB5697A0F615AB7B6FEBE3F9C5FD032AS1PR10MB5697EURP_--

