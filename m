Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E54C9C05027
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 19:48:36 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.89])
 by mx.groups.io with SMTP id smtpd.web11.4870.1678823307998789291
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Mar 2023 12:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=H5k0qTdS;
 spf=pass (domain: siemens.com, ip: 40.107.22.89, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKG7G9uNszbW2Jr+VTIjNpskCJ0FjmuC4diM9q1nce/zQYerYiUWml1Z5gXOikQ1XXluVLAwyHRFfjm8lQDSKEsQGTmZmsfoA3rZvk+wYXCiA5Wpr/myey8ku2Ehbyfny+s7X4RLKB2d68vuvhvIWKsfjMCie2qANG6teSD30T0uUzzR5e1zB8Nob2aI3PeVdgKN2o6z4BrZI4O0ZOlhtwJSIXt7sLpexQELbpZYjBlGCgEKfgIJpVyJCdJgu7t/AOAlnXYa3qeueXDIt2NoZmiT/CZfBXVlQ1dalrqMRhxCI2CFh8va57OXshfH6g1UL/cuc33xzkVihSEBUw1S7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4Wraam7R4z2C5CDyCGmb0N9z352FGOtu7KO08vVioM=;
 b=c/YK8k3IgYtnLIYDiHIdGbuBOifBnFT0nV1QFZd/i1okz4CKT7cnlxfY5j5i/JufzQe4LLK6eZ37QeceZ5+aaOUTDx0ZkhdTWSGsZgPnXewrXhnqUxfQEalueEE2hiMUSV7cV26Dg0PpqUO73rLHzvjuMdAQad8tXDRYmb483Nyl6f5A3idFhD3Z4Ic1yHQDDXvknNypyl8rQTlxfiIWHhb+tV/Q2/kGX4XItC8mihgU7DbfRR9VEyy5oBpQEVjliH98A3KLttDxb8ZmsrJLJxCOKhLfq7MEjul8GfEj12W5H5c2SZDOGhXWGyJCOwFUYwmmpFuHuX3WEucUZflq4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4Wraam7R4z2C5CDyCGmb0N9z352FGOtu7KO08vVioM=;
 b=H5k0qTdSnh/MKiZ6/3e42+QlUyuAFrECtYmUnH/SUNsFQo2GqI1qs+gYSV+6rsyDqi7Opn7yTyOytsviI6m4fZBOtv9BuQaOTQOGV+yDYMLSTpyx1RRLpCdoeiWY3ZyDqyT617w75SoAtKMToIFEl/dF6A3RWB0Z11MhgzUs/AvKLb0Gt1ShRzNUKnxLUJebcaWXcVzwL8/sQMkTWHsG/TRP7U2qwgJD1dSew4G8Fg2MtY5Ew/4L2LNGuJSLv++ydHUlmjZUdacJzRv04FfAt5JeehncHyqHvAhmhuQjrCjRwnmz28HfjP6wlWfBnKjHqDYMYW/zyDmPW/UMkWEYtA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM7PR10MB3669.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:132::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 19:48:25 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3f45:ac57:985a:c006]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3f45:ac57:985a:c006%8]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 19:48:25 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: jansson CVE-2020-36325 in kirkstone
Thread-Topic: jansson CVE-2020-36325 in kirkstone
Thread-Index: AdlWrdC3PEeKMe7TSIiETHERlPpUaw==
Date: Tue, 14 Mar 2023 19:48:25 +0000
Message-ID: 
 <AS1PR10MB5697F250BC3AE1827FA65593FDBE9@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-03-14T19:48:24Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=243cb6ee-7715-4e0e-b0e4-30ea6ea36a92;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AM7PR10MB3669:EE_
x-ms-office365-filtering-correlation-id: 61b500dd-d97a-470d-3145-08db24c5132b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vic9QJUF9CpioLQ9CunSfz1GvGY8u2boBoNZ8rEMPOBcdP0M+mC2u5jDgUnFvKUWeYvF5aixbGC31npm9mxRVB959QxR+D3DkcUQQlDKgwmYs6qzXqvPa05AQ2fKZsaPCw3jdwElJF2B0aZBFFUjaorVAGfJITwVoHMrlt/ZqHFyDltZX5XdNrBoRZwEQwVbGPxyfoTwBQOg7u2ve4+KQ2Zjo4pLWlN60Xco+NLW0FFBkmtulhKAsSJ+8VYGJ5STOZpgbsHzCXyePBsGijIGw06OvGZe+ZoKkA6lfyCm/tYS275Je0Pq3Pi57Zsz1kv5HnwMQDvoSeoVmO96T/r8SKpNlunKuh2ixX5ppzZI5OXkZKG5/Rw7Get/hYYaai6zhLHP/XIyxUnW+lApamLmik/L42noN0cxSAfHj9oW5K6qLo6M+kAH4kloPbJG45DrYIOvgXoj/CSwU6jOZKnPq0tCHaxYfARJ8KgkzAARqmKukGVk+Z2XQ8QXm+Y/fSzZfXtT8h+midzbdoJjgveUVwfg+DYLDXgDK7o7+4dKv3h4PUjOz9/aGZNwCKFNX/rO45IPZyaCBV2lxYHK001f8bE8du0jkPV21qQXFFNXlAZ0HRowdJhP7WEXO1PEQH0BDT6PaS2S6smZbTWmt8e5FJwpPeAX9cpAOdFl5kbnOELvEFTmYmycfEgxOuiRaKiL
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199018)(82960400001)(122000001)(9686003)(64756008)(66446008)(41300700001)(66556008)(86362001)(8676002)(6916009)(76116006)(66946007)(38070700005)(66476007)(166002)(38100700002)(26005)(6506007)(52536014)(8936002)(55236004)(558084003)(55016003)(7696005)(33656002)(316002)(5660300002)(186003)(71200400001)(966005)(2906002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?gvNuI0kRZxT2rMbsFuTTzqiYyFeg6RBDOyFr7zwRqX/wnnqjS5vHev8nyrHM?=
 =?us-ascii?Q?BPrA0nYE2aFsMPjP6/FGsgdYXKft9sw+H9/2qVjvLsdNGRSGcSkaEQg7ngPc?=
 =?us-ascii?Q?TELMR0O3yBmsWCH5Qili4xas30MEvvwuHPWT1PxYPH4q4qTrwPLR0bZJEYlz?=
 =?us-ascii?Q?zUgQaW7ktrd+JeM6znbJMRLxBOgYV4S8daZTUr+0vobOAt+OK/oqBFW3fEuN?=
 =?us-ascii?Q?GqUD0aMOD2IQPTBlvkyeZlnFgAud+8uOwd5BzAj18Hf9DPAfjvoO3wtNiG4L?=
 =?us-ascii?Q?WaVdUHlbh41ZdrfbetYQKgSR1PzeUNQ4JFwqcKSfGc3VWXX6mIG9+R9B497R?=
 =?us-ascii?Q?QeyY+jThv+YcrJvkw9Cf+q5IzutzQff8+d8zoElBsDWF88aIsY4bSIfEu3XE?=
 =?us-ascii?Q?ybyNroNzLs1Di81MVjNW1j4U9uwmTQgpU09ejBEOOcLfNwJLKIU8z7PXb7j6?=
 =?us-ascii?Q?kiK77HR/dB4crzZSBlKlP3j9YbtzIj7Y77kuWM4YnXa9okRuThpJL9gmMfv/?=
 =?us-ascii?Q?eZBBwnY2UoJ8dIk2HxGDNe05oxzYeafougjRc5ToMzVW8JZOuj1PsyVqjsZO?=
 =?us-ascii?Q?eqOiAhesBfEpgxWXaMvMjzl/GxuymTy49ZZKFY+Trq05KMpJKMjsMguz3x13?=
 =?us-ascii?Q?Mm4Mr0ntUJzXI9GcPdPcsDrAaRWfcgrKwluTMLdgbnUo4wHFkdJfyg79Cv2y?=
 =?us-ascii?Q?FN3+pgZ26checjmUWKLOseJRLQzJ88si3flWUZvzAoSwxeuUZZTf9TFigqic?=
 =?us-ascii?Q?BQvw+0Ps3eusWQT+x4siVuNexq9di+2zXIQxeznlZ+xy4yTOZ8gbwCrTCrMM?=
 =?us-ascii?Q?SwgEkI1JzMb0io8w39/sj4XiT96KsLjEa06gJoMlKFqEj+Wky+uQBriR2SbM?=
 =?us-ascii?Q?IJ2ltcbbz4/9AxrGkecenVoq8D4biTv3T+PphOWrcIU0lRlODe2tKYbkH4rn?=
 =?us-ascii?Q?0p4oaB7NhDPimQEkWpaOZyc5ws+k9lxGFQe8FlXtEqeEA5gRMDua6rUZT37o?=
 =?us-ascii?Q?EFo5BGqTzmbLzoErxyv1E3vYU11wuXhWgxd1UHQDFeTY4+S1SUaFNbp5wkPC?=
 =?us-ascii?Q?f/EqxRzOKB7g0phbDZ3noda5MHYjZNp8Kz8SYQCoMcVhCR5BxlasnIbGG6dd?=
 =?us-ascii?Q?v5dp/8VLmUQpQacT6EMeCbS7AtM59CzRFPn+TEVNxlYzgbngXbDwkNFY8uHv?=
 =?us-ascii?Q?dPdvOS9iCxOGriCtUvRm8g8+mIzPFUDBwzXpuc+uOf9PHdFIwjCDsqYTVnu8?=
 =?us-ascii?Q?UisSCU+LCsR0OcKn7ZOwCTSufozzk3zoxa2t6VYJ/JzWgyL7Xtd30bpvxngk?=
 =?us-ascii?Q?KzmNy822tjB1pr51RQb4UlKSMmYOffIV2wAmbv/Tu5yx7SPL2goHYYNJGJ+v?=
 =?us-ascii?Q?FW4KAbl3o5xay+PFi+2oxd2bh4tKxHZ1KurCddP1Smk19oTU6y72ds6rOxYC?=
 =?us-ascii?Q?xQGV/e1Z0bjb4b8C8M1nUj7ilmgGoN2Ujfk7mSiPPjRDTGjdqgeg/se+HQxW?=
 =?us-ascii?Q?L35ey+VV2T8yFdB0wHsSF+8FonLuIhhat23fqcGSPSeCh1OzYMxS9kPUx1nW?=
 =?us-ascii?Q?0MsypsWynqtTsL9CNByaKUkazJMKkyHUeZuEQ68h?=
Content-Type: multipart/alternative;
	boundary="_000_AS1PR10MB5697F250BC3AE1827FA65593FDBE9AS1PR10MB5697EURP_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b500dd-d97a-470d-3145-08db24c5132b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 19:48:25.1187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ecU7GRAxn035mFsHYFFh1KpXPXRXaEmDv22ZbjEQHtvPnBQy8TYGA47jXn9EjzFAjisooKL/pPa2hhl6a5MpHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3669
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Mar 2023 19:48:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101523

--_000_AS1PR10MB5697F250BC3AE1827FA65593FDBE9AS1PR10MB5697EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Could you please pick following commit from dunfell to kirkstone?
http://git.openembedded.org/meta-openembedded/commit/?h=3Ddunfell&id=3De0e7=
9bbde23f17185cc59908fee97c0cea098428

Thanks.

--_000_AS1PR10MB5697F250BC3AE1827FA65593FDBE9AS1PR10MB5697EURP_
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
<p class=3D"MsoNormal">Could you please pick following commit from dunfell =
to kirkstone?<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"http://git.openembedded.org/meta-openembe=
dded/commit/?h=3Ddunfell&amp;id=3De0e79bbde23f17185cc59908fee97c0cea098428"=
>http://git.openembedded.org/meta-openembedded/commit/?h=3Ddunfell&amp;id=
=3De0e79bbde23f17185cc59908fee97c0cea098428</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks.<o:p></o:p></p>
</div>
</body>
</html>

--_000_AS1PR10MB5697F250BC3AE1827FA65593FDBE9AS1PR10MB5697EURP_--

