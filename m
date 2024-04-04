Return-Path: <chaitanya.vadrevu@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE46CD1292
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 16:49:15 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.122])
 by mx.groups.io with SMTP id smtpd.web11.43712.1712249351260927663
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Apr 2024 09:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=selector1 header.b=cFcNxP8t;
 spf=pass (domain: ni.com, ip: 40.107.220.122, mailfrom: chaitanya.vadrevu@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itmzbS/aCVAblaNQM4g3JfsKAV+qKnJBIqLftSOCsdUkQHGsUjS39ssGtmpI2Bmi/cx6vx+8PsfGz05S26TGf9aphneFPfa8bqb4UX1GI6y181u1yOJbR44MAXEmYBKpgLTsR8okCtRtqJp8TukPw/J1LOTWuS7qPR47RNDEQEnjTzn5bHGgH+ipgP7V8255eoq0mMktiO0Eg4ExJCOH9XSPwr00hGDMNlDJa3a+T+v1shVslk4sfncBUJ4e/zXgCggClN6wK/iGPpxxWLmx9DCkTCOvUEQgUFTxu7xd+eoC4nE8lNawtLxBWUQfe2grEZGaaXo/rRZf5R3SHL/eQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oe0V8uNxDtnNHdG+5vYiMgE7wiBp9h0yhu8CbWkiSWk=;
 b=FsICV426HUcBOootf1PYLeDJ8WlO+ymQjP5pYgrPsZDiJa1oLNKXIn4Oi0JbgxUo8UiBOCXq6A14tBbQ2s3A54sDJVoIEQxwyMEwukOB9YhCQ7oNxEo7TxyEzEbVMCpLWj+0symVNW97Nv78s6R3drkn88HE9CtjlNlIma4fSxv14dFj7fz6sgRLdTfsyxWrrIHGNBpZvZNuZNoKKE+UVfU5DiEn2zJy3kPgKff7+wAzqgK/334y2IHYzsyhKu3hutSrqdIFC0b91LYv52S36/jkJMMG7YYDJ25PukLFJLpy+dZePnoxR8BwZVqg05IInwxaaXMEpU7yxIT304mc9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oe0V8uNxDtnNHdG+5vYiMgE7wiBp9h0yhu8CbWkiSWk=;
 b=cFcNxP8tG4zOdspp2u6dOZoPDqkFPGPkXo22hry43jRzeqcfLqQ83ch/+k9IPJdcbE+2VwcSQ6IhK2xkftXzhNs1WNZImQSu3VBrt0V6si/p2SXEAScAxLLOEjuo7wnEMwO4Inkw8SX+P6c3jfgpnwnPw7/LCBwPq/cQGTdE0+Y=
Received: from SA0PR04MB7275.namprd04.prod.outlook.com (2603:10b6:806:e5::18)
 by PH0PR04MB7463.namprd04.prod.outlook.com (2603:10b6:510:14::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 16:49:07 +0000
Received: from SA0PR04MB7275.namprd04.prod.outlook.com
 ([fe80::bbff:7a0:86f6:6223]) by SA0PR04MB7275.namprd04.prod.outlook.com
 ([fe80::bbff:7a0:86f6:6223%7]) with mapi id 15.20.7409.042; Thu, 4 Apr 2024
 16:49:07 +0000
From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
To: Yoann CONGAL <yoann.congal@smile.fr>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] mariadb: Use inherit_defer for native class
Thread-Topic: [oe] [meta-oe][PATCH] mariadb: Use inherit_defer for native
 class
Thread-Index: AQHaho7ucl7lifiec0Sa2Xz55eqAU7FYUAGAgAACSkY=
Date: Thu, 4 Apr 2024 16:49:07 +0000
Message-ID: 
 <SA0PR04MB72754241B4F324EA7F8758D49B3C2@SA0PR04MB7275.namprd04.prod.outlook.com>
References: <20240404125210.3365296-1-chaitanya.vadrevu@ni.com>
 <CAMSfU+4f33EZozrWGMLn96i=hTxSXDgp6=5o_006L+XCs1Wp7g@mail.gmail.com>
In-Reply-To: 
 <CAMSfU+4f33EZozrWGMLn96i=hTxSXDgp6=5o_006L+XCs1Wp7g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Enabled=True;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_SiteId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_SetDate=2024-04-04T16:46:56.9598481Z;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_ContentBits=0;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA0PR04MB7275:EE_|PH0PR04MB7463:EE_
x-ni-monitor: EOP Exclude NI Domains ETR True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Vfqq6YGbQBM1XSDGPPTPeif50In1nJRB6u/2KR+ccIpj5BHPkHs7RS77V/EeWh1yLNqKtG2poFtB1NZSnG3zlHPesgjw+8V9bCAlOM9i5AstsuJBhu6g2zTU+CNQLhdBafY49P89M9pLdGK0I+gOQ/LD69cNIICEk9zMV2Z/WmT5mDs2f7Jh7fFh7zSS23xEIDR3sVXDOwsZl764bzrVhInfstuif0WP60ggvdZEOB7ytqqmYc4w4yMWEr21BcprKyWub8RhyvkD7tVa2ZeSpf6JqD8DtNtmCoeel9zXoeoUy8al9tom+N4m2zCRK0shUYwv5YMWNxFt1dt/rG1d9ZAdlaho9xoXDSQ9Lwnk/cnaeU4rJmbNRgvxvvLY7d1KlFuaTFy56J3wc2c4JYNxChmI0C/ULYq0S+p24O2c4Eu/4mgGLWBbXNnumPOZmXtDyKtuWlcclVpkpGMvS8PvrEkoqomLAe9qiX2E+Q2fJcXhSAk9cavhYsrpriTAdu8EvmYMndBuDNw8CE+i/LFcex/k14IVTzU9I8ih/xRrlBWkaxYJOXylKwW6buPYgZAyw5vAIkUr81ovxOY7z8oahDRzCDtAYbqOv6fUm2mub7fxvyOzcBOcRNOf1aUtwNQqsTjtjV/dvUHCCTfSOpCE1wKUqXH/OhHPpxtl+0UFjis=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR04MB7275.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?PQ/CbBJhCz87mEH5oFWFe5fu5n3ZMd/ZjWhReFtMro/UvEJPF0DlJ9Fm?=
 =?Windows-1252?Q?HYMtdiYMUZNppy4n/Mblv0uhMK6wLESgGoFzeiSWxhiKLuuIP+Rx8znT?=
 =?Windows-1252?Q?MPxZhHTH+glc7bhkdofTRgq/WCAu5SeZqr8ksr5KSpJg06P9eaeJHXRu?=
 =?Windows-1252?Q?fliU5+Ctqntt4eyTuD7TgWfamI1Svi79/b+8ybThGe0wSQuo8UeNJn5M?=
 =?Windows-1252?Q?4yZX7UWO/MhksvY6Lepc9YEQi2WAfLVpJsfTL/Dqya8gtfMhwHYNhK3o?=
 =?Windows-1252?Q?g7xAdjb449SctxVXT9sqikmWclD1jY+Fud2MHOhhCh6U8yOeE9z+MnjS?=
 =?Windows-1252?Q?5JKwNiOH+LPjMdur9mGmTV82NfPnryOy3YnQlAnwgeeHGG0PfZ1HkUCa?=
 =?Windows-1252?Q?WR4c3L9WCa2j/20GnY1dVvy24sHg6A19UQeqpmZgZM/jcWQMlc/0H2hu?=
 =?Windows-1252?Q?E8S0wH31/M+MOha/n97oVJa0Bn1TDFu5QlxFqNSXH4Im7Ov4JIWD4fBs?=
 =?Windows-1252?Q?loaojiPmFq9FVBlbIWhdCnhYPXnGy6VD2nATfVbep0wWWRBZpdjiQudS?=
 =?Windows-1252?Q?M0eCQKtkrVMHM04dj0KOOq3Ssl7Gd3i9DUYpippqxdt+DjSwOuy1zfrg?=
 =?Windows-1252?Q?7x8xtP/2qYiHdjmRlDlyAuvL7nM5ov65ahnIB1qzNicDQYNc0GgJ5YrA?=
 =?Windows-1252?Q?xbLo74OB57I5VCuHy10cb/bFdbqf3erK3ANQaVXKy8g4NxlNAFQUMviX?=
 =?Windows-1252?Q?p3HiWzjD8D5Onlq8jCCkyajw3nCgq+46y5eGACaPXbFAZBzEu8nU8dws?=
 =?Windows-1252?Q?vxkJd5uswVzb8vURI/lB3E4ku61g/fnJ1iS2CwnauBJQle3Hp6AMRIjs?=
 =?Windows-1252?Q?DzW1/3Bwdleb/Ti5umaaQPSMHFRqfsYfZFZTHvnXgSynixyKTZJzntvH?=
 =?Windows-1252?Q?wKWmaTVXDfTBqLKbi1mPAQeiD2LLy3j7vwWnuE6rqDt7bh4lNDGBgiwb?=
 =?Windows-1252?Q?Gyf2HuQNMLl0gaX+InHsPuXaBTZsMLNE220m9VhOKP29HAYSQ+LISbaA?=
 =?Windows-1252?Q?iyQqm/Bmx84l9kYVNPExaAdacZBN7IDHhOuss2N56pjDBX+JBRii1ju3?=
 =?Windows-1252?Q?wN49r9C5v7UiAduKX3XccHOrHHgRXgVwjMeANcUXbSGL8UBtzeMzjwMq?=
 =?Windows-1252?Q?rm+lhjr/hkiRiccFbYmh741D6fB3u8l/YnRIba2SiJjLY/lzDpCBunc3?=
 =?Windows-1252?Q?LE4v1nQj/cKtTHWPRP9Vi9w3A9ymAaUtRvpLe0mL3WryVSHZPaaRoIh7?=
 =?Windows-1252?Q?RWK220qVA1LUS3QS24KSM2vB9Ir5s47gpzb4qzX6TCpZdMC8NlNHNh29?=
 =?Windows-1252?Q?jjyrchhTlZBk32ewsciK/phCio+QYo2rCFG87I2bqcmrbZNqkAyPSov4?=
 =?Windows-1252?Q?SbXyJynQUYHHgvz/PdcvFBOAkrWkSEhR6R3fKHtgBlg1KC8dTuZCmOi+?=
 =?Windows-1252?Q?E1Vn0akyOcsQe9rF1BBvgC/4reVa+kM8Cbbldw7lJfiYBI8OXkexwBvK?=
 =?Windows-1252?Q?GZII4+kKEzpjpMFzLQV/14nHhJMyVPn7jVcUIsgtkNivyzQUSxOyVLFv?=
 =?Windows-1252?Q?PbTi311LKDhDOHhoLtpqP3PjariuMoFbIyH167uwH32OKg6khABA0Cct?=
 =?Windows-1252?Q?fkKXYIDbgV2PM9l7wDGr6gitQ4msJSnVWnFjY52/6sR+5Wvm5dIn5Fbu?=
 =?Windows-1252?Q?FpEVlcrmoODl2Tf+Qfg=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SA0PR04MB72754241B4F324EA7F8758D49B3C2SA0PR04MB7275namp_"
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR04MB7275.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f9bf6c-851a-40cf-55c8-08dc54c7252b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2024 16:49:07.8367
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NSbtW8VqN+dGNF+xnE+sR+gkcBwTWKsvp8BOwolxg7sfwXJAqHpanUBwXMr8uxa12lIDSA+BhkaOCWXb3oH7k8NAg7a9jwn7WuPVJMBE+Kk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7463
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 16:49:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109799

--_000_SA0PR04MB72754241B4F324EA7F8758D49B3C2SA0PR04MB7275namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

My apologies, you=92re right the issue is fixed. I was using a slightly old=
er master that didn=92t have the fix.

Please discard my patch.

Chaitanya


INTERNAL - NI CONFIDENTIAL

--_000_SA0PR04MB72754241B4F324EA7F8758D49B3C2SA0PR04MB7275namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;
	panose-1:2 11 0 4 2 2 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">My apologies, you=
=92re right the issue is fixed. I was using a slightly older master that di=
dn=92t have the fix.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Please discard my p=
atch.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Chaitanya<o:p></o:p=
></span></p>
</div>
<br>
<p style=3D"font-family:Calibri;font-size:10pt;color:#000000;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
INTERNAL - NI CONFIDENTIAL<br>
</p>
</body>
</html>

--_000_SA0PR04MB72754241B4F324EA7F8758D49B3C2SA0PR04MB7275namp_--

