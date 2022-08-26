Return-Path: <Muhammad_Hamza@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC94ECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 12:56:26 +0000 (UTC)
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 by mx.groups.io with SMTP id smtpd.web11.36573.1661518578018618077
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 05:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: mentor.com, ip: 68.232.137.180, mailfrom: muhammad_hamza@mentor.com)
X-IronPort-AV: E=Sophos;i="5.93,265,1654588800";
   d="png'150?scan'150,208,217,150";a="81867042"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 26 Aug 2022 04:56:16 -0800
IronPort-SDR: 
 bUvSHziE4xez1a/VXGlQPTBiyhYTQTDHh/oHqs8Tv6DVZmu7CzAWzD4UZEVhReaBBk44yKl1zF
 fpq8I0eDYwA74o0NS3akloODs4TjCRJMarQmQG1xOmryyPnrhA6InK5gVdQzzs2EcHA9b/l2XW
 5jMTFOEZ/VF0VmODwuiRpF3A35E/IGIJw+huDygnr7LDhGRvX/tKqF/mC8pIZCAXbzfFMAd1z3
 dTYRq7C2jspHFQTMR4rYciFo6V3WgPYVzy2tlzbqcqY3LAUnjLLb8iPCc5cd1IH85ec0Mal5b/
 J5Q=
From: "Hamza, Muhammad" <Muhammad_Hamza@mentor.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-oe] [kirkstone] recipes-support/pidgin: no rdepends on python3
Thread-Topic: [meta-oe] [kirkstone] recipes-support/pidgin: no rdepends on
 python3
Thread-Index: Adi5SorCCEV5X6xHTZ2xrnsaNL6Ezg==
Date: Fri, 26 Aug 2022 12:56:12 +0000
Message-ID: <a65c592f8ded460590707f34da6eb688@mentor.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.90]
Content-Type: multipart/related;
	boundary="_004_a65c592f8ded460590707f34da6eb688mentorcom_";
	type="multipart/alternative"
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 12:56:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98480

--_004_a65c592f8ded460590707f34da6eb688mentorcom_
Content-Type: multipart/alternative;
	boundary="_000_a65c592f8ded460590707f34da6eb688mentorcom_"

--_000_a65c592f8ded460590707f34da6eb688mentorcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I was going through pidgin recipe and found that it depends on python3 but =
does not rdepend on it.
Pidgin provides finch which required python3 at runtime and fails to run on=
 target if python3 is absent.
I wanted to ask if python3 is to be provided by any other recipe on runtime=
 or should I send a patch, where
pidgin recipe rdepends on python3.
I have built an image with packages including finch but python3 was not ava=
ilable at runtime till I explicitly added
it to my packages.
Regards,
Muhammad Hamza
Siemens Industry Software (Private) Limited
Pakistan Engineering
6th Floor Ali Tower M. M. Alam Road Gulberg III
Lahore Pakistan, 54660
hamza.muhammad.ext@siemens.com<mailto:hamza.muhammad.ext@siemens.com>
www.sw.siemens.com<http://www.sw.siemens.com/>

[cid:image001.png@01D8B975.1EE3FE00]


--_000_a65c592f8ded460590707f34da6eb688mentorcom_
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
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
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
<p class=3D"MsoNormal">Hi,<br>
<br>
I was going through pidgin recipe and found that it depends on python3 but =
does not rdepend on it.<br>
Pidgin provides finch which required python3 at runtime and fails to run on=
 target if python3 is absent.<br>
I wanted to ask if python3 is to be provided by any other recipe on runtime=
 or should I send a patch, where<br>
pidgin recipe rdepends on python3.<br>
I have built an image with packages including finch but python3 was not ava=
ilable at runtime till I explicitly added<br>
it to my packages. <o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><b><span style=3D"font-size:10.0pt;color:black">Regards,<br>
</span></b><b><span style=3D"font-size:10.0pt;color:#191919">Muhammad Hamza=
</span></b><span style=3D"font-size:10.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt">Siemens Industry So=
ftware (Private) Limited<br>
Pakistan Engineering<br>
6th Floor Ali Tower M. M. Alam Road Gulberg III <br>
Lahore Pakistan, 54660<br>
<a href=3D"mailto:hamza.muhammad.ext@siemens.com"><span style=3D"color:blue=
">hamza.muhammad.ext@siemens.com</span></a></span><br>
<u><span style=3D"font-size:8.0pt;color:#0563C1"><a href=3D"http://www.sw.s=
iemens.com/"><span style=3D"color:blue">www.sw.siemens.com</span></a></span=
></u><o:p></o:p></p>
<p class=3D"MsoNormal"><br>
<img border=3D"0" width=3D"152" height=3D"51" style=3D"width:1.5833in;heigh=
t:.5333in" id=3D"Picture_x0020_1" src=3D"cid:image001.png@01D8B975.1EE3FE00=
"><span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_a65c592f8ded460590707f34da6eb688mentorcom_--

--_004_a65c592f8ded460590707f34da6eb688mentorcom_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=2887;
	creation-date="Fri, 26 Aug 2022 12:56:11 GMT";
	modification-date="Fri, 26 Aug 2022 12:56:11 GMT"
Content-ID: <image001.png@01D8B975.1EE3FE00>
Content-Transfer-Encoding: base64

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

--_004_a65c592f8ded460590707f34da6eb688mentorcom_--

