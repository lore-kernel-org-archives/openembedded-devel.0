Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.60])
 by mx.groups.io with SMTP id smtpd.web11.7173.1585748880305995389
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2020 06:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hotmail.com header.s=selector1 header.b=qDL9KkvQ;
 spf=pass (domain: hotmail.com, ip: 40.92.91.60, mailfrom: fawadmazhar@hotmail.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SoSOEgiEUO+NP7xSNVjhrgdQKkisGiuWTB09q6J3UHCuI8LXel2OdPPXoQo3RM3x0aq9iqrpbuoEqmupMTZxW0GBEA+D2NdDzBJhcltO2uMlZfao2EOjyhP7mR7Z0Um1FRtRqp6AuCPlANntfuErnnB1qfFQlvvC6gl4J1YQX1dMvomPmsTIVeTKQ8FtRaqmIeeuK2cgq4dRiRxpENZxA1NY9S/dmYlGOONFQocVQHYMW0BolPMP2dijuwKxsy+ibqE60XW7Cl9+aL0M/L4VqFGoXlM5+FfNkT7FR4pT/e7536A42IzlgrZmN6DYGxn3kws3dv31eIwyWYeoN+5tQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgOEeTx5TidB/+5GuB01i2NVC7cf3o2iEq6T1QBpLnw=;
 b=ORH8Fu/ePm2WuLhGW+2Ssrvyy1PAsi/hRmIIJC7HtWosOdYwmHMN5gqoLGOHeDl+3YobS9emKmI2VD0VRR5OZihHx5LHf9s1Dwcug5AKg3JN4U+YR/BO66fF3p7gfW35ura+0AmBvdczAGdxLRR2u6Aahj2YD4cOoknQjmVqBXBbBxAhF3dRFdKPqchHTs9EPnZcXQ/HMsCZ1cyBNSd+D1SXYu4nAyZpAVTTdatdWxipu4K1HiPPY9xys3dvzXn7Cf56xO/HdDnaexvF7KgCkWWzRxZD9zKjjvuke8rZh993qVqeAUHHGB6TRZ1sZbnRMfxZR3tqBPYa0T52wyd2sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgOEeTx5TidB/+5GuB01i2NVC7cf3o2iEq6T1QBpLnw=;
 b=qDL9KkvQ2bZ7ZrjRCx/eQ8snrNKYgrZcEGA2cLMaZ0OBX5UzCY3U8sovttz6bwMvmKE2Fhx3T5vBVcY84e2NKDbwhmfyRB7PKT/W2Om5vCSw74jB08CQWyNIUZC7GDiOjYFrFY4V3izOn7nTQPr0ADomFT35pFUJCPc5ujpEP2aJvuW0RLSE3wBVD59qQGc3epm43HlqK+TmSVE8pR5Q4i/U/Jhj9jX7QmNAc5fztiLxJuyQ76Ld5c01PbeRUbQopSEsc2pLE3Mfa+GDBJaV6cnPhyFTQtK/3LFAGGwmJq5oQfFy1V0LUtApOwkXNh/hoB0Ht2Db7Hqswc+olVcx3Q==
Received: from DB8EUR05FT063.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc0f::44) by
 DB8EUR05HT145.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc0f::337)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.17; Wed, 1 Apr
 2020 13:47:57 +0000
Received: from HE1P195MB0201.EURP195.PROD.OUTLOOK.COM (10.233.238.51) by
 DB8EUR05FT063.mail.protection.outlook.com (10.233.238.195) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.15 via Frontend Transport; Wed, 1 Apr 2020 13:47:57 +0000
Received: from HE1P195MB0201.EURP195.PROD.OUTLOOK.COM
 ([fe80::59f7:728f:3e51:bd62]) by HE1P195MB0201.EURP195.PROD.OUTLOOK.COM
 ([fe80::59f7:728f:3e51:bd62%4]) with mapi id 15.20.2878.014; Wed, 1 Apr 2020
 13:47:56 +0000
From: "Fawad Mazhar" <fawadmazhar@hotmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] #oe [meta-python] python 3.7 runtime with sumo
Thread-Topic: [oe] #oe [meta-python] python 3.7 runtime with sumo
Thread-Index: AQHWCCWpAPjUu3WBfEuTBgVRoMyY+6hkR8rD
Date: Wed, 1 Apr 2020 13:47:56 +0000
Message-ID: 
 <HE1P195MB0201B3A8AEBB08E556399509B7C90@HE1P195MB0201.EURP195.PROD.OUTLOOK.COM>
References: 
 <0lSA.1585309548597994059.HtCB@lists.openembedded.org>,<CANNYZj9pKtUwiAmWNB=O1Py-q0jUckfheAc+Sxe9nou17ok12g@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9pKtUwiAmWNB=O1Py-q0jUckfheAc+Sxe9nou17ok12g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: 
 OriginalChecksum:443B0D373CB26737EAF92C5BCD32D1471A0C5E6C87F78FF21F1D8E6B50ADCA9F;UpperCasedChecksum:38153DD4AD232BE42AA5F97E265C998892FFEDC1AFF2D8FEA34A08080472F8A3;SizeAsReceived:7057;Count:46
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [wFHZhkoTNAx3mBCEKSRBmWA5rtiMeyH8]
x-ms-publictraffictype: Email
x-incomingheadercount: 46
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 413b4df8-3ce3-4176-e710-08d7d64348d9
x-ms-traffictypediagnostic: DB8EUR05HT145:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SS15/AdS95byXO4TIt/BLWFE89gomn9ft7bn76gkHwbeXSxye9FnLLcuDmT2CFXDFm0rLUJTZRhP1/n/VqSXEHiRxKshkGKuJoRYWz2uMQlxcVCyQ3eN3D8FKFm0VD4eN19xxdcVxZ968u1rTvX5jBd2uFrnD5csv7piPPhx0leNigMgGy3RnEaDnfaNNglFq8FoveqhWEMd/q+iGXtcYTa7FmswiOlGvJttSGyXNDk=
x-ms-exchange-antispam-messagedata: 
 SXpnsPNYB1f+f0uW1OWpjBYrhNUFnF2vW6XYLQHZg9nOdLDAqflT/1CW46h+wXHXit/t/k4+TqxRSUj+fQ8/Bdkzcb3m73vI6LWDVCAioInq7QDlDv518FMdizkWW03PkoVtucqHm6bIMKupVwfSVQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 413b4df8-3ce3-4176-e710-08d7d64348d9
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 13:47:56.8977
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR05HT145
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_HE1P195MB0201B3A8AEBB08E556399509B7C90HE1P195MB0201EURP_"

--_000_HE1P195MB0201B3A8AEBB08E556399509B7C90HE1P195MB0201EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Thanks for your response. Yes you are right and I am also considering the =
upgrade.


BR,
Fawad

________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Wednesday, April 1, 2020 4:01 PM
To: Fawad Mazhar <fawadmazhar@hotmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] #oe [meta-python] python 3.7 runtime with sumo

You should upgrade to a yocto release that already has 3.7. Backporting is=
 difficult at best, and probably impossible.

Alex

On Wed, 1 Apr 2020 at 14:47, Fawad Mazhar <fawadmazhar@hotmail.com<mailto:=
fawadmazhar@hotmail.com>> wrote:
Hi guys!

Is it possible to have python 3.7 runtime for the target while baking imag=
e using sumo branch. I would like to overwrite the default 3.5.5 by 3.7 som=
ehow. Can anyone guide me here?

Thanks!

BR,
Fawad=20

--_000_HE1P195MB0201B3A8AEBB08E556399509B7C90HE1P195MB0201EURP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859=
-1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-b=
ottom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt=
; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Hi Alex,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt=
; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt=
; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Thanks for your response. Yes you are right and I am also considering the =
upgrade.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt=
; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt=
; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt=
; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
BR,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt=
; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Fawad</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt=
; color: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" c=
olor=3D"#000000" style=3D"font-size: 11pt;" data-ogsc=3D""><b>From:</b> Ale=
xander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> Wednesday, April 1, 2020 4:01 PM<br>
<b>To:</b> Fawad Mazhar &lt;fawadmazhar@hotmail.com&gt;<br>
<b>Cc:</b> OpenEmbedded Devel List &lt;openembedded-devel@lists.openembedd=
ed.org&gt;<br>
<b>Subject:</b> Re: [oe] #oe [meta-python] python 3.7 runtime with sumo</f=
ont>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div>You should upgrade to a yocto release that already has 3.7. Backporti=
ng is difficult at best, and probably impossible.</div>
<div><br>
</div>
<div>Alex<br>
</div>
</div>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Wed, 1 Apr 2020 at 14:47, Fawad=
 Mazhar &lt;<a href=3D"mailto:fawadmazhar@hotmail.com" style=3D"">fawadmazh=
ar@hotmail.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bor=
der-left:1px solid rgb(204,204,204); padding-left:1ex">
Hi guys!&nbsp;<br>
<br>
Is it possible to have python 3.7 runtime for the target while baking imag=
e using sumo branch. I would like to overwrite the default&nbsp;3.5.5 by 3.=
7 somehow. Can anyone guide me here?&nbsp;<br>
<br>
Thanks!<br>
<br>
BR,<br>
Fawad <br>
</blockquote>
</div>
</div>
</div>
</body>
</html>

--_000_HE1P195MB0201B3A8AEBB08E556399509B7C90HE1P195MB0201EURP_--
