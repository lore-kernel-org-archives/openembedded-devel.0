Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470FFC6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 17:18:09 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.48])
 by mx.groups.io with SMTP id smtpd.web10.20016.1679419085946860169
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Mar 2023 10:18:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=tS6tAiLd;
 spf=pass (domain: siemens.com, ip: 40.107.8.48, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgIoSdETlBULxqMDrttJNzgwn7f5urrbmC+n0+9gTORTOqVtspP+4mS0/+CLTILE3P/09Wlav+zdr4yFqCZeQie6Vv+xUe8DTOogYlWVLq0MSpYjmf2KRg8mjnv/t/sXyTa+ZG1uexHXY6lIjsxaWFdS/M2BA3QjOBT11SZtrGukmXSAB18c3m8Nf1J/drz6eZB4Xa9FjH4HZiloWrRIMWhm2c0hKN3uGmXNNuBvNANeMfYfYP23R9VHALL5gTwrjp+gXC8cyh7QNIG0/p/Dy2XO3z1EkhFg5XDV05UQWVmVv7Q84mnL5CyYuqKaPFizJPPV4XF2GvwHDsLBeu5pUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVN0swFy0pTGIj5wob8RL8g9dYzg9tB0wYlEhB78bFw=;
 b=jwCQn65pxwPzPB7SFcvU++dGOkRpYL2E3h4ewR7qAqV4JvnX+nG0aElWru6g9K2nh3rrJhD6gG2JTPDBC/7syN5+rrfMahF3DxUgWos3wro+DgcmQUfHxZOv1coBG2JqYxeEXV5oeBFgltQ+ZhJduRyPc/8qZ4piCjlWp+fICqTeSWDpXx82K8zmCm13OIizOzJvhAc/Kv53/SjKWOMWqaSLIsOvcT3Pv9AzBUg5IzsMh12wTCSqLhunhV+wrtpO9bnC9jnIeL/UR7jrSdR2SWdDSOXPkBFX/5PRbNgWHnoorT4n4idQkTvyBVzdBwc+0ACG5veAgDBu+Ln39ioPPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVN0swFy0pTGIj5wob8RL8g9dYzg9tB0wYlEhB78bFw=;
 b=tS6tAiLdWTWm5InZJ3txmllhcDKyb7vfwmj2EnYJ/RfB7/J3S+iXjnFV2pwXO5aYIAZnIcIEJK7bTAJBaZGTZxlX5Iky6t6UMY/d0jUkxptJFpOQJqRldnaU+87bI/s0aiMypXbkoPizXgJk5BQrdGXSMe0LyzjKxoHkuGdYIMoUO6dydV1xS5z7fxrOIpDMFf621M9hMkCmZXV1mLW6P4e6daui7N35oEjvnu9siS41230POMCbBXKplmeelo88pJ8pA06lWnPWcjl8tsBwt7PDVD2IEsvusGvA2iK44uxEA5u+YpVureE0KTUmjQ6QPJxrVUx8f9UMhlPpEzC5DQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAXPR10MB5519.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 21 Mar
 2023 17:18:02 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3f45:ac57:985a:c006]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3f45:ac57:985a:c006%7]) with mapi id 15.20.6222.008; Tue, 21 Mar 2023
 17:18:02 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: p7zip fixes for CVE-2018-5996 and CVE-2016-9296
Thread-Topic: p7zip fixes for CVE-2018-5996 and CVE-2016-9296
Thread-Index: AdlcGQHrxJQD5S2KQqmpFxNtQgi/AA==
Date: Tue, 21 Mar 2023 17:18:02 +0000
Message-ID: 
 <AS1PR10MB569716A2EA41CEA89DF8E4FDFD819@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-03-21T17:18:01Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7c0e745b-6533-49b5-b78a-4f5e7ad3ac70;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAXPR10MB5519:EE_
x-ms-office365-filtering-correlation-id: 23fd344c-eaa2-404f-da0c-08db2a303a48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4rl8I9yh5usg4x1n3C7fHiG2uVYTxvImo8WsHmGV/O21ul3ZgwpAf20gYHjIQpfbiemA9xPzqjidxOg7xBqhJXMj5Waft2RZF5O2je5snlqokgb8iXBzcvN0d/7lNeysAlW6W108czzW4GMjg/DuO6/04qLxtic25tUAv8HSOzjcYzRMa5TOJC9FeceJf3N5ccG25fvwBIXLLFO0D0ruUl8UuAiUu/2VL4ZJ3ypKLGQadG422LUKD0+NL+/WJzX3/9ZGyD+vdpBvxDv7Dx2TQx+Z/Q6VvXqT8yvDOLAKBciwK1jhlNtohPJqskkrZlMp+bG+mO09vmzXQQpFy+hBjNc0FCJGx/6I0CKdPb+a/tkyXdPZ8I1KuH4Y36+fL0GZ5w2UZwYTAZCx97/MCydO8XYyqeE7V77Dq9Tcg6RrKr794KgQb2V8pG8MzVoBw8A8DLMBFeLuDuVlmRqX0GPd6n4kn4Pn1/1nklIc6qjnmairq78JuuE3DK4tNgqkeQoChGHpimRQvwR5HQl+9J6nZmQWKFTASRKM6gq9UG4P1FQ4XHGg1x3p83RoHKtdo25aZFVKwt60vBfmaIJWv4/bhIdb8+JsZNlr/j19W4O5O2rb0DpZfeZJFaCkaK6+Dbkz9+Dfdk8qXKhoPCJA8ApF8sSPQAiNHLq/nqTnHTcwrAeiDcxNf7i+If6iaexCPIe9cODh4Mk7UDjpT1poP83uv2mgtMqZfN+ul5ZDqSTfd9s=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(451199018)(33656002)(2906002)(82960400001)(122000001)(66946007)(38100700002)(166002)(6916009)(8936002)(76116006)(478600001)(6506007)(316002)(86362001)(71200400001)(966005)(55236004)(55016003)(66556008)(8676002)(7696005)(64756008)(66446008)(5660300002)(26005)(83380400001)(66476007)(186003)(9686003)(41300700001)(38070700005)(52536014)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?OndO/OuBKbDMTZ4KLizxoBd/ICI5azu07132+Y/vMIfaWIkpumz92RnFAXNL?=
 =?us-ascii?Q?PrNuhOPfozYzhBTM1opB/k7MmDZMS356OpsFEtQNxBEEgXQRNngBZ4VQi9R1?=
 =?us-ascii?Q?fy/iqL5kQ78Ypiub41KSrNWBbgunQ2L3whH6/Iw3SO2o7aHyUH58TlUULZKf?=
 =?us-ascii?Q?O3+TUZpQPCoqvE6VSABtz5ypcshGnzgg4+FtKhVSk3GxffGQZ7GYWmXnkvsl?=
 =?us-ascii?Q?+Z5DlgAesjcBf9yP62oDE1I0KWjUNlT4NC4AejfzdaB2E7ERxUjCgAee9nyz?=
 =?us-ascii?Q?4sPtxzsZar7cJU9tOkZi4xZv0KboM8iJsnHenLSbip6vJBDb2TBsRRu4QcSn?=
 =?us-ascii?Q?WSf6CgpkYDu+necblKhSesrLnWnv3bnG/k7lRNaEULcA0bzcsizlWxMUBU+7?=
 =?us-ascii?Q?06wZLz7pMG90YE7Aw9WL54eTmhrw2r3lPW+mL4W/NpSBpzLm7OYbYxfeRE4e?=
 =?us-ascii?Q?2RkywuqpVXVLdb/HxTxkEEBD0CZQG2k2wAxDis0qZiAUuIraQOIemtmdE/Xq?=
 =?us-ascii?Q?YA7lK3u9kyW/5UboeUnl7bfgOlymlCit6E6nI7cRmk0IY++nv9ltecq4EAMH?=
 =?us-ascii?Q?h8uDcHCtUMZstiNuqt+4TGepQEQj4Lka/HqDwpVvZu6zU2VJAq5Kg2EIicXq?=
 =?us-ascii?Q?wV8i2z6LnMSWLbEXEEhFIDLUvqXrLCr1uC0xAnPI2StQ2Fj0wL2qn2oabPBy?=
 =?us-ascii?Q?i1SlWu7QA1bkTuVXHN8+5KjmWUYW+ExF030L1NvWJq7/L2Neq0BslaeuouBS?=
 =?us-ascii?Q?WLaYNCbxmXX/GWct/cn/qzybc0mAmS+V5uMSlCvNPc4ey+mvFzQwj+JtU4Us?=
 =?us-ascii?Q?iFGre31XjnWVGWeHaq2kNilh5dfn5G+4v+XIfAz1pwW8S5JrZQxK0J6urVOL?=
 =?us-ascii?Q?OwZsnFKMow78x/iAQHeZwTj49WfLpYfhyNPgIB7dVqcOEr+2YnGTUwEzBiS/?=
 =?us-ascii?Q?t6tnJ07EinLivtDD8t7F/kVyNZz8rXZCFeGeSBWqd6DwvS+j9Ze4238Fefmx?=
 =?us-ascii?Q?Z6G2sjw2BEmF/tW0yTz4ALZyefHET8S8Lv5t1IyHJmOcmUAUae2oE/7N/+2Z?=
 =?us-ascii?Q?sdZzl6yNVJy70atBcadlx9bH706jYBNiB0zlGqOpYKDxJO0zytQkNCLKKATW?=
 =?us-ascii?Q?evL/TyhFsttThj5u38t2+Eem3AtXMLaB/af0Fi/G72SYsMgg458LqcQebkXM?=
 =?us-ascii?Q?5MKOiT0oVcqcj6xAEaiNrGoF/3SsNF0aZ/a3rE+RuwmVt0YpjTv6tXL6fqre?=
 =?us-ascii?Q?LN/KjD7aWV9UMInRymKFkzTs24pXMUhXiAvZsUiRjGP+6rOg6AbqxcFSBJJ2?=
 =?us-ascii?Q?+P1rQBRrhmGXr6ObXtBZDwSZtWnZyVmBCCqFpUgmSsnrLeBNMLGY2MKQ3Pjf?=
 =?us-ascii?Q?FIrgIqzyv/Bs4SOII2lqW+NikZnIToiqBmOy9ESMDFAOJcB5bGnYUMr2YvA3?=
 =?us-ascii?Q?5nNk5mZdUqwhjD9Cbw91fjOHKG6V82VNqVgzA+k74hXGvrhUrNOffvZ0BaQf?=
 =?us-ascii?Q?yIMOBwmrkH7jIZmbNj+yZ8v6WPOSmwzmlVOlidFBjX66HjkJCmOvhzgXrOYi?=
 =?us-ascii?Q?GbORRg1Czd6V6MOxvfLysykRBznVcCDqZO4r/LTH?=
Content-Type: multipart/alternative;
	boundary="_000_AS1PR10MB569716A2EA41CEA89DF8E4FDFD819AS1PR10MB5697EURP_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 23fd344c-eaa2-404f-da0c-08db2a303a48
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2023 17:18:02.7193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JZyC5dQ98nO9yinwLXppA+mHtKNKI2dWdZukAY1UpV+Rz6t+8JHA/S5sQjcLxrH3CyQ7ms21lMYpw8DwwxWfNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5519
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 17:18:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101620

--_000_AS1PR10MB569716A2EA41CEA89DF8E4FDFD819AS1PR10MB5697EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear maintainers,

CVE-2018-5996 and CVE-2016-9296 were fixed in dunfell but these patched did=
 not make it to master (and thus also not to langdale and kirkstone).
Could you please pick them to these three branches?
https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-exten=
ded/p7zip?h=3Ddunfell&id=3D4f701b46551d7a68aaed2c59943007f1e685c800
https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-exten=
ded/p7zip?h=3Ddunfell&id=3D9d722e88d79e3a19d2ae07ac922109c18e2f5559

I can also send new patches if it is needed.

Thanks,
  Peter

--_000_AS1PR10MB569716A2EA41CEA89DF8E4FDFD819AS1PR10MB5697EURP_
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
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<p class=3D"MsoNormal">CVE-2018-5996 and CVE-2016-9296 were fixed in dunfel=
l but these patched did not make it to master (and thus also not to langdal=
e and kirkstone).<o:p></o:p></p>
<p class=3D"MsoNormal">Could you please pick them to these three branches?<=
o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://git.openembedded.org/meta-openemb=
edded/commit/meta-oe/recipes-extended/p7zip?h=3Ddunfell&amp;id=3D4f701b4655=
1d7a68aaed2c59943007f1e685c800">https://git.openembedded.org/meta-openembed=
ded/commit/meta-oe/recipes-extended/p7zip?h=3Ddunfell&amp;id=3D4f701b46551d=
7a68aaed2c59943007f1e685c800</a><o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://git.openembedded.org/meta-openemb=
edded/commit/meta-oe/recipes-extended/p7zip?h=3Ddunfell&amp;id=3D9d722e88d7=
9e3a19d2ae07ac922109c18e2f5559">https://git.openembedded.org/meta-openembed=
ded/commit/meta-oe/recipes-extended/p7zip?h=3Ddunfell&amp;id=3D9d722e88d79e=
3a19d2ae07ac922109c18e2f5559</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I can also send new patches if it is needed.<o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; Peter<o:p></o:p></p>
</div>
</body>
</html>

--_000_AS1PR10MB569716A2EA41CEA89DF8E4FDFD819AS1PR10MB5697EURP_--

