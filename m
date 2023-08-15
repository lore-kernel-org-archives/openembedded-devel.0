Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23E1C41513
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 12:04:28 +0000 (UTC)
Received: from mx0a-0068d901.pphosted.com (mx0a-0068d901.pphosted.com [205.220.168.35])
 by mx.groups.io with SMTP id smtpd.web10.141038.1692121942652888997
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 10:52:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@biamp.com header.s=proofpoint header.b=aBozNVEp;
 dkim=fail reason="dkim: body hash did not verify" header.i=@biamp.com header.s=selector2 header.b=Zjh/Uj0q;
 spf=pass (domain: biamp.com, ip: 205.220.168.35, mailfrom: prvs=65910dd7f7=kirk.hays@biamp.com)
Received: from pps.filterd (m0278264.ppops.net [127.0.0.1])
	by mx0b-0068d901.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37FBj1GC026695
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 10:52:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	proofpoint; bh=YU4SU7ObXsjmwGNL+kchSQhIo1z2AUchxxs0yhOZgLQ=; b=a
	BozNVEpW/Rz5E8jc9GlVEmRV71vaZcArtJSwthKogQsR6Emf2mT002Tet6IEClLW
	WEXjQqSxcJhr9SyZJLWHXt8D67pg4izS4X8Te9vdLMmiVJOptco+xgqRV3yhLfmZ
	1pWoXpKm2MU9e2Zay1NCHMdcOYq+Ft7d8T8o64+gAz2Bp//18wKr5IZ5Y+GRlLHG
	2pkoQ1w/qMoxaOVO1to2264fxOUm5e55inNg7S1cXKGRolATeIE7wYqMryvoOVsh
	edodh4Hq4gTm8+9pWzT/He2TwYWV08eD1tadowmfBPpdzrNdITDb6kTnoeQlhdsl
	49xhoWhZZnbDhYCEyB1CQ==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0b-0068d901.pphosted.com (PPS) with ESMTPS id 3se94et52s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 10:52:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HzekSKEY0BQyba58jkb/m8cpZzsa4yMJT4XrzxAWtTr90/0Y0ksKNUBeL9X+6gaR3/juMiZ0ZYeGlJXXWEytmwYW8WhHT3kY8QAdEnwqjvLYIRqEehJj+hRSNk8j9+aTAjYS1KCrjKou8TOuWnLNr+TyaqG9CPwaytfPtyErPdkH2P7StJuIFqQV/pw92E6jyEwxMbXIpZNUtuRvHcXEtY+pghszjRizZT+NKpCslIFwZGouAvfYXLQBecTg1MjNsTWgMZWXP/S4PRFM2KBy4sEGwWQqQVoyAX9FYziY3Xa+3TX1J3fWUD1SfFR+Hqoqr1EBw7zMozZ0JuKDX19eFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RViQJFzU3DaQMfpY5IrPBNWxlF/fLla6crei0bmnJ64=;
 b=J6jsDYn37OX1B/8Lecn3qM+BzdO9vaV702Fsryhj676yeeZQEahDFp4s/ajU5ZzytStCEAS254EfLuQfp6fv+x8N1a7/d1U27afUA4vZnD5j99S0NZ4zw6TU2xh5DW5htL9MhqXUJsgWDZxuvUn3afxsVeZAH36Em+SXxEoUfqYOZc7vag21DkiZLgSe5HebKC4UpsniW5DT15jLEQ6q2f3j7HdkjOKt0AoUuG5ennZxEKv+kgfOlAkW9B4wUKcGHmdALl8LAbzcRg6tXMv7CJkXYTFy3uSnVCHRoVqBj1o4yA36h6xLrUb0MTXnjt+vH7/sK4s4BA5BoCvcQ//xvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=biamp.com; dmarc=pass action=none header.from=biamp.com;
 dkim=pass header.d=biamp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RViQJFzU3DaQMfpY5IrPBNWxlF/fLla6crei0bmnJ64=;
 b=Zjh/Uj0qjMNywYDygbTGsyCeMD1K2mD1vaHZyPw4340hxfkg8sBdvtzO0J4PFUHxOsAWMDga5sstrGFQVafOBgAipKxkT40Z3vsJhzLsBpMbinVm7izvxvJQ0KKsqUeDcSwVwm57dAWrcePFC5tNJO/R1Whlegka4M0nPuD+GZSuq1b6nuACyzILc+ZzeG9VrwPwW7Jsx+9hRvb+0dcdEStOR2D6ZN1ZvUqGlWSbGOOmXFU869YtE7sgKiGldbtJkUeiqhVBDNKByedFN7ZZh4UC1OZlSXou6c+EG9mmcKLpRk75ChsD6mV42/8Qm+rJp6pjrz+d0AYawuQ7YLYYQg==
Received: from DM6PR17MB3180.namprd17.prod.outlook.com (2603:10b6:5:193::29)
 by MW4PR17MB5596.namprd17.prod.outlook.com (2603:10b6:303:12b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 17:52:19 +0000
Received: from DM6PR17MB3180.namprd17.prod.outlook.com
 ([fe80::8985:2b88:8dd6:67e9]) by DM6PR17MB3180.namprd17.prod.outlook.com
 ([fe80::8985:2b88:8dd6:67e9%4]) with mapi id 15.20.6678.023; Tue, 15 Aug 2023
 17:52:19 +0000
From: kirk.hays@biamp.com
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Patch for Jack recipe to remove "readline" from DEPENDS, (Issue #732)
Thread-Topic: Patch for Jack recipe to remove "readline" from DEPENDS, (Issue
 #732)
Thread-Index: AdnPoSC64ADKAFHfSF6uSFI8xuyEPA==
Date: Tue, 15 Aug 2023 17:52:19 +0000
Message-ID: 
 <DM6PR17MB3180FCAFFBB103C1DE85D58EF414A@DM6PR17MB3180.namprd17.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR17MB3180:EE_|MW4PR17MB5596:EE_
x-ms-office365-filtering-correlation-id: 654eeea4-2afc-45eb-0b3d-08db9db85eaf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QibJAzjSKBBT3n9hc0m2y4figw1l0Qqp1FetYI6vWgB2CDli0mYKZAAaEmBSHNy/QZO13tv4hKJPMFmbI91ANr7nWzEpuYo7QaNDsxpNd9E8V+FtBbHV2asS4coTU9LFEIms6+vZ5LCOnr1anmsPdtJeMMqQbPcyu42ggC1U0P09rK8MOtASEpw34JecG9uSkIBaDX7cK5KUKgBYTHVNujnRiJYKs28ac7Dt6GSry+HwtG5NINmwi10NC6iTimICge7rCeRlai88rTWAKWblio/YixEgUJDhCXd3PnZMr9uhEgJsGOaVNr4qEra8dxcdEY8NHMnGPr7fprsRFmE+2FoNkUoU3Wt8UI4WuaF6ijRAI62rEHPJmxBmqxGjdLg6SRCsH5MFfdvmaClSOMyxo96LOCBdgFDNQ2eTVk2pFclCl6XHlJjXhWvnPqutqzMYr4a5wbhgWDcQaHzm05xsJbr7K/Nymms01pTQB9N/6RCrvFk2+4v0QKaX2z7Y4iwI4QNGoGmivTwVXfcEoq0w1rBzQ/DE5kGD0aKsekqxcVDKQkfFK3HSIDdOuPisoEx29GrCjDFSAiHFOkEeqDEZRj/5kxWyLlb38NEkk6AwNyg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR17MB3180.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(136003)(396003)(346002)(376002)(1800799009)(186009)(451199024)(26005)(316002)(5660300002)(52536014)(8676002)(6916009)(66446008)(66476007)(122000001)(38100700002)(166002)(99936003)(38070700005)(55016003)(2906002)(478600001)(7696005)(71200400001)(966005)(6506007)(41300700001)(66946007)(64756008)(76116006)(86362001)(66556008)(33656002)(558084003)(8936002)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?aEjsgvV4xva/cv8QtnPcsIl5FFoSI/yV+09yBeU9KFq2sOMwO6yO+mmoHy1h?=
 =?us-ascii?Q?hrIpOFk5nYCjxn7dKLfcknjzqvKR8jVoCeHx3laRoeIvhh6Qapzr5J3azQwc?=
 =?us-ascii?Q?Vn7+LYXCg4UtJf0/C7BKF/Ne74c/mMSjudV1yaj7LVg7BLyEuoZ93cUCd4Tb?=
 =?us-ascii?Q?8SxZ3P6tdEMCs+0O1Scu87EbNEe3AU7JkbvAFEuOlbxe8DLonIA1/dgv/fPE?=
 =?us-ascii?Q?xPBBnOMcD9DBzuof8BO0XQcRavQTFKqpMEp4r2SsYZG5TMa0uAX2XZJxqM9D?=
 =?us-ascii?Q?K8u8ZpsoQstm4LblRnzJ/atv1tcrF+voEI5MqFfUYYR7IVO9cp/zNBAzVFCh?=
 =?us-ascii?Q?/GnVR7GDkDsNmsaV4mk3jMJv8EtxzQENpTrYcHMVUgmF39Kys7Lm4+cYN/3P?=
 =?us-ascii?Q?Rq4V+J9ob4ydocp8YQBRkf50YSQoYKtdk33TmWL7Zmt5Cm1/UweUyX9ziBRa?=
 =?us-ascii?Q?/kEvI5IJ8RrJd5WaDv5IBDSx/XoXfMmfn0Cq4VDisxw9AS+NWTyzKmLHEfEj?=
 =?us-ascii?Q?ma8rdIszrzd0/rYPNX3qdMQ1MIUrypScQJ86hVey7dfeWkEzW315kTLv+MwY?=
 =?us-ascii?Q?V5y0Vup4tnrpFt8abmOBhi/Tm9o2qiaLHmJeqQs66ekNHC+ISXxWD3YNyIpd?=
 =?us-ascii?Q?3yB44QrlQ5SXhwXNiRwM1qeq8KI1dBfzN74qL049E9WtlzRmQViBtZosDVVL?=
 =?us-ascii?Q?nFoiLiWUUu5g6EutmrNs+fbk9EoMeFIjknRAZO0ZkKeTNB3Cz6vnX1FAVGxi?=
 =?us-ascii?Q?oJt4aPPe2l51q1B0e0ux3jbMjvAPWx+RD6c8gDn99pjoJc8ohW3OsunZXsf8?=
 =?us-ascii?Q?NX5s5oO2eJBYDEcocePKtFuyStE3VBhDQ/7aV7K4C23wf+5XRmDal6d7cKxC?=
 =?us-ascii?Q?5OtWlxxYcP1ICOaTk957sErP8J3WKraB1EsGXSNK5F0N6Nn+EjE4TlWOBLlP?=
 =?us-ascii?Q?BWq3Nq9uoJW9Q/mDqnoKge32y8cs5udH/CLhSv3Yjnex7oHm4c59lQY8UA2Y?=
 =?us-ascii?Q?zZZYJnXMd4j8Ldf6xq5BaXpjKnKGtel5SUyOUa5UQQ7HX2m3D2htFDCbwjnz?=
 =?us-ascii?Q?EmtFASC2BoEeg18gY05WM8VC4g2+NVz8gBG9by0lmv9BJ/TjqzDYmgNCwFHq?=
 =?us-ascii?Q?GBXI18xqC3RiwtzP25mPRH/61VS2g1xLt/8xwgmsG7Nn4UP73ZvZ9+vmZ/Fz?=
 =?us-ascii?Q?NIai5/67/ctWsyjWkVY3guaUMcCLPQkAfWW7HPiVPbcbItR/r7B34mbMcTzJ?=
 =?us-ascii?Q?xxMOBbgtdY9YwC6CYT+Kr6Ut7SIEYWbO8Pia8ocIIlu4X5RJhcJCY81v3IeY?=
 =?us-ascii?Q?pmKikmfsZ3min7Bn5SBmecNz4vc8uA5J5tTfua+596DiT2PxYFyGt7171IVt?=
 =?us-ascii?Q?NiXfbLQD+KNm6DEM6eCfBypd6lXIbm/TbNZRpO3FbU+d8udFEdC5IFSnnJiB?=
 =?us-ascii?Q?Eoop6iWaJknkfu3AZLBcTfcW+hAVTaXqmvJZy8wBwZuLqooPSIkJXzsHWig+?=
 =?us-ascii?Q?cX66nimcGGL0tdQ2Ubs15huWFKQ1e3ywsqPQLkefsP9xQcJKnTq8qfoYhujU?=
 =?us-ascii?Q?NisDpelHz5YXYrByuQxeZZzHY6tth28jGnyaXfcW?=
MIME-Version: 1.0
X-OriginatorOrg: biamp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3180.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 654eeea4-2afc-45eb-0b3d-08db9db85eaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 17:52:19.0663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 341ac572-066c-46f6-bf06-b2d0c7ddf1be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JJYUsKjcGM0PNKRKmxrWwqwhF4tRBbOcjwzCq5EZq3tRj4/ZLiNP1wdoqVIQyEu3wafPQT18A9KG5xOlerOJ7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR17MB5596
X-Proofpoint-ORIG-GUID: DWnob7ZItEp5n4lxRCKYcwKe5GE9Kx2S
X-Proofpoint-GUID: DWnob7ZItEp5n4lxRCKYcwKe5GE9Kx2S
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_DM6PR17MB3180FCAFFBB103C1DE85D58EF414ADM6PR17MB3180namp_"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 12:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104458

--_004_DM6PR17MB3180FCAFFBB103C1DE85D58EF414ADM6PR17MB3180namp_
Content-Type: multipart/alternative;
	boundary="_000_DM6PR17MB3180FCAFFBB103C1DE85D58EF414ADM6PR17MB3180namp_"

--_000_DM6PR17MB3180FCAFFBB103C1DE85D58EF414ADM6PR17MB3180namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

https://github.com/openembedded/meta-openembedded/issues/732

Since Jack version 1.19.22, "readline" is no longer used:

https://jackaudio.org/news/

The attached patch remove "readline" from the DEPENDS macro.

Kindest,
Kirk Hays




--_000_DM6PR17MB3180FCAFFBB103C1DE85D58EF414ADM6PR17MB3180namp_
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
	font-family:"Calibri",sans-serif;
	mso-ligatures:none;}
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
<p class=3D"MsoNormal"><a href=3D"https://github.com/openembedded/meta-open=
embedded/issues/732">https://github.com/openembedded/meta-openembedded/issu=
es/732</a><br>
<br>
Since Jack version 1.19.22, &#8220;readline&#8221; is no longer used:<br>
<br>
<a href=3D"https://jackaudio.org/news/">https://jackaudio.org/news/</a><o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The attached patch remove &#8220;readline&#8221; fro=
m the DEPENDS macro.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Kindest,<o:p></o:p></p>
<p class=3D"MsoNormal">Kirk Hays<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR17MB3180FCAFFBB103C1DE85D58EF414ADM6PR17MB3180namp_--

--_004_DM6PR17MB3180FCAFFBB103C1DE85D58EF414ADM6PR17MB3180namp_
Content-Type: application/octet-stream; name="jack_issue_732.patch"
Content-Description: jack_issue_732.patch
Content-Disposition: attachment; filename="jack_issue_732.patch"; size=615;
	creation-date="Tue, 15 Aug 2023 17:48:48 GMT";
	modification-date="Tue, 15 Aug 2023 17:52:18 GMT"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1tdWx0aW1lZGlhL2phY2svamFja18xLjE5LjIy
LmJiIGIvbWV0YS1vZS9yZWNpcGVzLW11bHRpbWVkaWEvamFjay9qYWNrXzEuMTkuMjIuYmIKaW5k
ZXggYjg1Yjc5OTNkLi4xMDRiOTQ2YzYgMTAwNjQ0Ci0tLSBhL21ldGEtb2UvcmVjaXBlcy1tdWx0
aW1lZGlhL2phY2svamFja18xLjE5LjIyLmJiCisrKyBiL21ldGEtb2UvcmVjaXBlcy1tdWx0aW1l
ZGlhL2phY2svamFja18xLjE5LjIyLmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtT
VU0gPSAiIFwKICAgICBmaWxlOi8vY29tbW9uL2phY2svamFjay5oO2JlZ2lubGluZT0xO2VuZGxp
bmU9MTk7bWQ1PTZiNzM2ZWQ2YjgxMDU5MmIxMzU0ODBhNWU4NTMzOTJlIFwKICIKIAotREVQRU5E
UyA9ICJsaWJzYW1wbGVyYXRlMCBsaWJzbmRmaWxlMSByZWFkbGluZSIKK0RFUEVORFMgPSAibGli
c2FtcGxlcmF0ZTAgbGlic25kZmlsZTEiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9q
YWNrYXVkaW8vamFjazIuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMiCiBTUkNSRVYg
PSAiNGY1ODk2OTQzMjMzOWEyNTBjZTg3ZmU4NTVmYjk2MmM2N2QwMGRkYiIK

--_004_DM6PR17MB3180FCAFFBB103C1DE85D58EF414ADM6PR17MB3180namp_--

