Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E255C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 16:18:06 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.74])
 by mx.groups.io with SMTP id smtpd.web11.75767.1680538678797518013
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 09:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ryleTR5W;
 spf=pass (domain: siemens.com, ip: 40.107.247.74, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKheKWSXkGjVFnnpKJ7SUw9AmSCUaOxuZWSYRmWRYFzHJSg/t8WPkbkTTePhUv9DvrSPKrfIJKw+vzZpu2GZvnVqqn5jOle06WU0NnYoE2J3rBXsPaFPyIy+FV5WDMI0ZsnZIH1lx9EqUlgBXMCEUZ8XbVmXvchZt8v8mBBlVhu46bTuSHk4pcSytuKF9wMo8b6WaaUvoytZR1gCiXkzLRqGhDiuWzELgrMLwJzpZB4uxrHn7dN6aX3Gbiw5SpS4xw5TQxQIT2Z2FqgVhFs6k/sD6DF82wk8cAqNv9CJ3NKKiiH38tpSD8/SGegK5BWjJGrRVdpdc3ARE6G8JT7uYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5e9pq/3NQW6L2oP57GwqtTJkLNiWNRodWaDtoYIUzk=;
 b=Z0QvHjSDVCSJxzqSt1NDHRg5IMXeD+7IeJkddEyIfJu5gvclznkIZLel+fEWZyfjhJnRZw+TcdRQhi0wWOyEFBR+bECIZw6inVr3W/Dn3rTQqwv2jJBX/oWsEpnG74H7aoCwF+l4Hk6N0V28fgVj3YsgoyxcCwhnq63+muaSklhxASmkTN3UKEWyg21mvKiJy7+dgTWRJnUT6de+YjkJCpuvbWCigs2UF3x8zJwZ8nHb/EnVyl9L3Rw2lUOPXTPwy894BKWdiD3vMrFEySkbZ97zpqSsPYSU/9Fb+VjoRboDuVJSNtnlh2MR7aEOHkE9gnh//WpzNkf/xZxjCtAiKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5e9pq/3NQW6L2oP57GwqtTJkLNiWNRodWaDtoYIUzk=;
 b=ryleTR5WjuMOi8xkQ0IbtAvzjIksUfAhhAj2mkK0iXvYKOwn+OnR50oRMRj2LEbUT74KgokgD1z223FUtcTjTfWkzfjPbQ55CHI1J09T+2ovC/Xr1AlNq34nSzGaYUVQZdL6slONoRv+KqgpWuCClWcW/1Kkvi/fvMs4eWpRz2WEU3CPvYVrBdF7WeCNgZ9J/eFyU6pkGSXCPckUxUdXhAYvIY9N4oNgQOLrrb7KQzsTSrAxM8Mo7NXmQ0XoRon7T9TjyOUk/d9UopFyz6T+v1yNZJnnaCjeS+2LPpb0w6mNNX/RPUzTfs66zr53OPSo2z9H+43aFkBXxHes0bNyZg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS4PR10MB5343.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4bb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.22; Mon, 3 Apr
 2023 16:17:56 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3f45:ac57:985a:c006]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3f45:ac57:985a:c006%8]) with mapi id 15.20.6277.022; Mon, 3 Apr 2023
 16:17:55 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: p7zip fixes for CVE-2018-5996 and CVE-2016-9296
Thread-Topic: p7zip fixes for CVE-2018-5996 and CVE-2016-9296
Thread-Index: AdlcGQHrxJQD5S2KQqmpFxNtQgi/AAKLrC4g
Date: Mon, 3 Apr 2023 16:17:55 +0000
Message-ID: 
 <AS1PR10MB56971616BAFFF203812B7574FD929@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <174E7EC300F65F72.19937@lists.openembedded.org>
In-Reply-To: <174E7EC300F65F72.19937@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-04-03T16:17:54Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7c0e745b-6533-49b5-b78a-4f5e7ad3ac70;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS4PR10MB5343:EE_
x-ms-office365-filtering-correlation-id: 96d6036b-f082-4168-a144-08db345efbcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MIOrs1A73eD7uZBFyG9yVX4OjUykkCse2zc5mBcfSF3TaJlaOpUYIYAfFUvJdpRQKO+q4Lt39I2Nxcq8Ubfr6BEuh/Ijiwo7xhF2PCic6C+rOIYolvRS9K39C/qj3YfBZC0y7fM71V0rLxT39u6t5VUtjiIQW5qbg7WWUeljptOakTDPnFbTKaVJJsJ3IObFkK1ZqDsoI0ikQ4GK2BbESY3+aSgSQbEQp4AhbQDIgoc/6lj1E1mBt3Sgfy1Ppdcp60Hu+8hQmUhrwy8GzmmDKUbhX6GCKBdpgnXs15376DLf90blwYbpNGzfbgFtE51xcqlAldmT8MFHMymiB1scnd9m5DhqIhazB9XjznsWkbu6PYQyDMfCKI9OtiqvDtHaKAn14LzU9Vjjjp3KwFG4kAJJs0IHVgP3DT6HtmfOlBh/K4PH88Pzb5/s/bFxk3koLJvcL+9meUKUP30p6CKW4bAb3ERqFr9UcYIRDDmeH76Xqyv44MW0WBEAmz2bz/aXRD+YMtUkPTGByK2/WzyNpWbUPEFSQu5RO4m4z3T4Gn8IwbveNkQr4jj9yOWHF8Z52nDg9OZreckOJQzsPVuCdbMud16ChQsQUd02pB+FTVbpK++IbEGvYGID6LrLkub2Auc27zhqL5zAj1OdaPZC9g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(451199021)(55016003)(6916009)(64756008)(66946007)(76116006)(66556008)(66476007)(66446008)(478600001)(122000001)(316002)(52536014)(8936002)(5660300002)(8676002)(41300700001)(82960400001)(4744005)(38100700002)(53546011)(186003)(55236004)(83380400001)(71200400001)(966005)(6506007)(26005)(9686003)(86362001)(33656002)(166002)(2906002)(38070700005)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?1tk+e7RpT0mieLwpRDPD+gWVDS9bgy1J6CvEjz+HoY/2WTsL5JzCgaUqkYAu?=
 =?us-ascii?Q?TynEwQEFgpy9hdkoBqkQHZ5Xp6TBtwowqXoZz5jjo9phU5Rp/W63yzyMSjmH?=
 =?us-ascii?Q?gh9xt8TZSMJ1qnpSnMhvWNBOZrd50k6k3vJnYCMx5dH8exP7Auc1i+xbIBe8?=
 =?us-ascii?Q?J0Lvge38BLK+Lxh9of1UV77eDcdkLRGfkrR36HW+AABulFtt+R86rn9C3LVn?=
 =?us-ascii?Q?ttZ9AES7fsZlHhJ+KbspdotgMPrMuB0X8YtkzDrJTkXubA5n8eabDILEeBr1?=
 =?us-ascii?Q?sCcOogcaUeoLrD5U8oI4NHLnFgOgZ+NEEiINWs8I1OyBMXbmki1mhNBuXW89?=
 =?us-ascii?Q?G5/whZyptYx1Ci4rO/NfBaIrRDgTp99rp38Vz6l6USoiEzUkHM6UeCeATKIG?=
 =?us-ascii?Q?Jm6avrRZzlNDW9PDeFUHJPUfNwuzwZFrlcOrhVKPRoi08S3SGtp8auSEOqpl?=
 =?us-ascii?Q?AssfzMoLzyPAydDqM/rH0dasB+NZ2GGgjLX4SdAaHaQwY6jalDMuHBOUKs/P?=
 =?us-ascii?Q?haLNDHT+Idx2PGUx0zClohwqcDDuxnAa6NcPvshrqvShWtTrnqrW4RjD9UUQ?=
 =?us-ascii?Q?D/G9rRr3oeGOnk5/Mik34+l+qyheKtx+wR87MH7EfIC7G9soePce3TH0rBRM?=
 =?us-ascii?Q?VrB5oEl+L3/tioa0zvfFCiw5CJDOdSwIcv573d9VOdfC1iymlVRCfLClJmE8?=
 =?us-ascii?Q?WahBxtD8Wso1n7iYLLV/U5vSSWBGrlkfVOnS2FZcipjH5byCTK0OdALOxwcy?=
 =?us-ascii?Q?0wx524a06HD2AmszvjDc0RE5S7xCZI4fJieg9HDDuopjuTDCfwDc5vYXDBU0?=
 =?us-ascii?Q?RaECAZuZLNrGT0NROqodvrNo1xp340fAjido/i16DqQeA9EzAG+Zt0Gz+Hr1?=
 =?us-ascii?Q?NJ0jAzbeJH8MNPuGTbi6b1lgkAtTz7sbpS9uNPa8++3z9Q9H9dseSeC1OnBo?=
 =?us-ascii?Q?5xUQd3ApMd+nHCoGSHkfll978p3l6oEAoLFuegSEhSnV6g06aDOqiX2hx1oV?=
 =?us-ascii?Q?Evtkzmj5zqd/ZXyqyS/fx0+X50lfcVCYHq7+iPcpJ0sWcwhMUUWnS/VNJVpw?=
 =?us-ascii?Q?n5lVnlEu26RrdWT7IOl6EqetNbhke3HV9u364kVv1HMfF3msVR6wSte/MlOY?=
 =?us-ascii?Q?yeaYA+f74RoDkFnMOzZR5sYS/ruf7jBhX7WH41yo1vOkMkJRxpc/w2Q2zxhm?=
 =?us-ascii?Q?nF3g87yglHgS+QXTUy/EkGIjdI8D9nph2DA0C1sgiUHS4aN0m7/Oeg8ExRIC?=
 =?us-ascii?Q?sNe4Lbkm2lCBexfJhKCLMfZNdPwFZxT2h4WVrtfaf3Ug2HLTOyKgbFqnyhwr?=
 =?us-ascii?Q?Rd9P0U9XD63sG2TKo51IN7J3BFGkuJ2VmC+lkYjOKbl3a/+6T1sXF3V1uvq/?=
 =?us-ascii?Q?SnRY8WCYc/VVmQu7eAbC1MoGVphhSab6fF4MoSCMjQUv0GPslmCJnIjwEta1?=
 =?us-ascii?Q?KXRhe76xHM402xFLimoHEAsiQTkEG3uPUOfT6KVLJPg+D2gvYWMJoJWSXtZD?=
 =?us-ascii?Q?Zo00sauOEn5IEEEt/pkIe+ifO5cRAmrdN4YZY9iE2/MRhX6K3txauuIAR1qu?=
 =?us-ascii?Q?pIbilgGNPJPlu5Yy2VSTrlHIpBqw/LECn0tsgRex?=
Content-Type: multipart/alternative;
	boundary="_000_AS1PR10MB56971616BAFFF203812B7574FD929AS1PR10MB5697EURP_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d6036b-f082-4168-a144-08db345efbcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2023 16:17:55.8555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CUDKmessfIKW4601K0BkVHsLX8vz9mTjiRnHSUGvFBMu9SoKB2hq0LwLECALqD1+YnLKczvdBA+Tq7oxMocVpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5343
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 16:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101942

--_000_AS1PR10MB56971616BAFFF203812B7574FD929AS1PR10MB5697EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

gentle ping

From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Peter Marko via lists.openembedded.org
Sent: Tuesday, March 21, 2023 18:18
To: openembedded-devel@lists.openembedded.org
Subject: [oe] p7zip fixes for CVE-2018-5996 and CVE-2016-9296

> Dear maintainers,
>
> CVE-2018-5996 and CVE-2016-9296 were fixed in dunfell but these patched d=
id not make it to master (and thus also not to langdale and kirkstone).
> Could you please pick them to these three branches?
> https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-ext=
ended/p7zip?h=3Ddunfell&id=3D4f701b46551d7a68aaed2c59943007f1e685c800
> https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-ext=
ended/p7zip?h=3Ddunfell&id=3D9d722e88d79e3a19d2ae07ac922109c18e2f5559
>
> I can also send new patches if it is needed.
>
> Thanks,
>  Peter

--_000_AS1PR10MB56971616BAFFF203812B7574FD929AS1PR10MB5697EURP_
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
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
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
<p class=3D"MsoNormal">gentle ping<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> openembedded-devel@lists.openembedded.o=
rg &lt;openembedded-devel@lists.openembedded.org&gt;
<b>On Behalf Of </b>Peter Marko via lists.openembedded.org<br>
<b>Sent:</b> Tuesday, March 21, 2023 18:18<br>
<b>To:</b> openembedded-devel@lists.openembedded.org<br>
<b>Subject:</b> [oe] p7zip fixes for CVE-2018-5996 and CVE-2016-9296<o:p></=
o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; Dear maintainers,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; CVE-2018-5996 and CVE-2016-9296 were fixed in d=
unfell but these patched did not make it to master (and thus also not to la=
ngdale and kirkstone).<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; Could you please pick them to these three branc=
hes?<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; <a href=3D"https://git.openembedded.org/meta-op=
enembedded/commit/meta-oe/recipes-extended/p7zip?h=3Ddunfell&amp;id=3D4f701=
b46551d7a68aaed2c59943007f1e685c800">
https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-exten=
ded/p7zip?h=3Ddunfell&amp;id=3D4f701b46551d7a68aaed2c59943007f1e685c800</a>=
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; <a href=3D"https://git.openembedded.org/meta-op=
enembedded/commit/meta-oe/recipes-extended/p7zip?h=3Ddunfell&amp;id=3D9d722=
e88d79e3a19d2ae07ac922109c18e2f5559">
https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-exten=
ded/p7zip?h=3Ddunfell&amp;id=3D9d722e88d79e3a19d2ae07ac922109c18e2f5559</a>=
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; I can also send new patches if it is needed.<o:=
p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp; Peter<o:p></o:p></p>
</div>
</body>
</html>

--_000_AS1PR10MB56971616BAFFF203812B7574FD929AS1PR10MB5697EURP_--

