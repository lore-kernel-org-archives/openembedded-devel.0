Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.117])
 by mx.groups.io with SMTP id smtpd.web12.99.1611600212957760982
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 10:43:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@studentsecuedu66932.onmicrosoft.com header.s=selector2-studentsecuedu66932-onmicrosoft-com header.b=YQ71w8+v;
 spf=pass (domain: ecu.edu, ip: 40.107.237.117, mailfrom: pawluchm@ecu.edu)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LILaotdUERueFLtgTz7/aBPTxHx4DWjSlA/FOawMBjHcyvwLOQBjYFuxx++7y78A9GpWFoJKQNAdFuaz4vSbEU30w7IbOdp9xRDyYD8vOjhrh1SLn4qkVrXGhYv7EUduc+QOw1TXI1mMIKzNgAJgzhxyQlsaz/DiV7mMUgPSNEwOYVOYZCCKsxEOtimr9thyATL/ZL7Kq8rTO5A2fsnXVYM3Y8p8Nw8Q3Md8PlLp0XJsQiMppWAHFGTnuMD9DF1m8cQQHxGjC96cdVDqsEG6Ol0cG+s6AaQNNWaqDdhYdq/VmwwnCkBxgNERa8QzaDNvA1tabCMBTdBSb/d6HYXFmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/v8OeYQprDjNmqMkZWx+gyaeT6UAvvgt7Sfb5TYocx4=;
 b=JY21nVymnR71R2t1Q+PjMz1te4qyIVvtdWE8qd1TVFHS5VXnHPmfMAFobNcIRUPm1DKNjjkEIhUVtn+Jli/HdztldquuuGHQHhQkKYETOy3t68P5aQVHKaAAcw/nBvYhNh6xigV6DKoz3bOZNA3llcLGOpggnEgsxmoIuHIVBXZ46bmqLbr9bvSoHsnnFpweXXcmOECvd2KY6c3yj75cW5fFGOP6u1q8p+eqm2mLOW5f1DwwJeTuugkmYDnvgNQWU0uBFAClVy7aV5ohJhtcjGH7OQaPhNC/KnJo3gxgmV317pYSzaHEiUxarAxat2wt6JzKltxfYS7Q3lnm5LGsSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ecu.edu; dmarc=pass action=none header.from=ecu.edu; dkim=pass
 header.d=ecu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=studentsecuedu66932.onmicrosoft.com;
 s=selector2-studentsecuedu66932-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/v8OeYQprDjNmqMkZWx+gyaeT6UAvvgt7Sfb5TYocx4=;
 b=YQ71w8+vNJ87fFItplPBnrGNN8KeggaFAK1V3E+x9E3MkNCOTcQEA9+n8dfv0nDl/PQ/1vQHZWW4B8eXi2FkqWD5HUGnz1wxIFhbSdf6ZwpTA3bWHpca/JvSAV5aS0XNRphpdC+cREQ4rhKYaJsvY66sf+bOqx/9oQhkq3jcA4U=
Received: from BL0PR0102MB3377.prod.exchangelabs.com (2603:10b6:207:1e::19) by
 BL0PR01MB4340.prod.exchangelabs.com (2603:10b6:208:81::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.19; Mon, 25 Jan 2021 18:43:31 +0000
Received: from BL0PR0102MB3377.prod.exchangelabs.com
 ([fe80::b586:28bb:d36b:487b]) by BL0PR0102MB3377.prod.exchangelabs.com
 ([fe80::b586:28bb:d36b:487b%3]) with mapi id 15.20.3784.017; Mon, 25 Jan 2021
 18:43:31 +0000
From: "Pawluch, Michael Mila" <pawluchm@ecu.edu>
To: "dmurphy@ti.com" <dmurphy@ti.com>, "akuster808@gmail.com"
	<akuster808@gmail.com>
CC: "Openembedded-issues@lists.openembedded.org"
	<Openembedded-issues@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [Openembedded-issues] [RFC] Issues with mariadb-10.4.17 and aarch64
Thread-Topic: [Openembedded-issues] [RFC] Issues with mariadb-10.4.17 and
 aarch64
Thread-Index: AQHW80HXHTynbOqvQ0+iUbuvBADZfKo4rQN2
Date: Mon, 25 Jan 2021 18:43:30 +0000
Message-ID: 
 <BL0PR0102MB3377F2478792A70F7F565A0DCABD9@BL0PR0102MB3377.prod.exchangelabs.com>
References: <6cde28bf-c69d-1d42-785e-dc228202e357@ti.com>
In-Reply-To: <6cde28bf-c69d-1d42-785e-dc228202e357@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=ecu.edu;
x-originating-ip: [150.216.21.56]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9539c4e-6a07-43b1-c15f-08d8c1611cd1
x-ms-traffictypediagnostic: BL0PR01MB4340:
x-microsoft-antispam-prvs: 
 <BL0PR01MB434026D172B3C66BE7895D55CABD9@BL0PR01MB4340.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 j+XhsJaIehRsiKfLbMNUCgE6MZ8w42tbyD5qeai0EhLnT7KM4mZQu5soQP0ogs7YpX6HVha4tiSMf3fXmMqtT3//c8HhM+ykTxt8PSlRp3q09dpo7aCpoEcZBpiBX+ZC5yRXgyCHbTRnkTDC9AakBTuhihK/dfCl0lz7Jnfx32yIWBZJYrjEqGuHSuBhFTm0cQ8nwS7Z63n8FD/mZ4gmd395oen2fQgUe1IkqauuWUF2pmhncyf5Nt5mW8IM8X4pzZMpSpSUjuNFKLz6fBALXn/g2h/rQtXD3MbCrXpDzyNxVCqnJR6nmsx/QgmJIi8HjQWUY8gCL00XfVZDcfOTYRehOg8m9oyF+jg63smlzNVUliKSsb13A+SFZyGEk6IL3vBsP2L09tb6pVe/3ULRjDYs5A1mDpPXL+XPYSk+xDvk7dx91ny8USVrlzgRaeIKS7M+X872mGOPlH4kLZgqRA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR0102MB3377.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(83380400001)(6506007)(53546011)(166002)(54906003)(110136005)(316002)(786003)(186003)(33656002)(86362001)(75432002)(7696005)(2906002)(76116006)(66946007)(26005)(64756008)(66476007)(66446008)(66556008)(8676002)(9686003)(55016002)(52536014)(5660300002)(8936002)(71200400001)(478600001)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 4LO708v4HdfRbTdtnALIpHyGfhJHyoldko987ooB2Ht+o8/yDmx9jGLcYPSSIcYNcevRaZM1C5RM0V9b9n0m5YxVs53X5W27697oO9Y71kvRwBNqqmeov3qCShqrAL9B4V8EIrlBeTWFHocrlY+jlJFbP3JVFPi7XZFrL31Yl9SnSlWLKpviitDS+fiM006VztopfyoUr0pm4lEtcDj12yzcRkDOawWOxQCn7XlTPEumjkuzs4rV4dFmapUo4rrQ6wNEL0OkUZb2PRCgS03XEG1yfEG+YOLVjto1OxWEDYGZ40NDOyj//JYGDTeLhtQT9i53dKp2bN3Ws7PLuFMFztyKf7Iy6cO1EUiErzxhb30s3ipXKXgKTiJmngxpezbDaPQ8csUfAOHPS6fR+olaplzorxpH9ymgWDU2g6Me06NxWJ/paHGFCgfzkJnGqHR6qn0/aXJqt6W6+1kMjqML9iU3HUgOdn3YsauVqWQ8XTHPtO6VIPmixDs3o9DmlB11484M4Thgat+c72g/Tf8nW5ikkeR+LwzCmfdOka5jsMz5dTai+JCj90tY6I3Lo+VreDB1Ho8WaXvUxjbvf+Mj71tYMbeHzVbgQVG7sLWhkwwT9+sGe6AVUke/XzcgIhFDdmerfcxln0CrHHCJ3c18Ya7mgjKryFMfrQ5aoSwLtcOMFFnwRIgIZhBXQi7aqZzlhR/ofJZ8PFNUHY3a/yvdqO1mGVfhUtgbcujftlr3opaPiyMg2oSfwGM4eBUGZzhDhAgL3J6/X3vhSz/WptoSfA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: ecu.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR0102MB3377.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9539c4e-6a07-43b1-c15f-08d8c1611cd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2021 18:43:31.0683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 17143cbb-385c-4c45-a36a-c65b72e3eae8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WHFETMBq1wb4i9mS7sPdLHmqQz0Uspt2y9i/aqvq4tJf3yp+FkUuHQ8U6TOBTbKy5ZOhDRpMC+fTLnpgy3oitg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4340
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BL0PR0102MB3377F2478792A70F7F565A0DCABD9BL0PR0102MB3377_"

--_000_BL0PR0102MB3377F2478792A70F7F565A0DCABD9BL0PR0102MB3377_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Why oh why is all of these being directed to me when I have nothing to do w=
ith Open embedded?

Sent from Mail<https://go.microsoft.com/fwlink/?LinkId=3D550986> for Window=
s 10

From: Dan Murphy via lists.openembedded.org<mailto:dmurphy=3Dti.com@lists.o=
penembedded.org>
Sent: Monday, January 25, 2021 1:40 PM
To: akuster808@gmail.com<mailto:akuster808@gmail.com>
Cc: Openembedded-issues@lists.openembedded.org<mailto:Openembedded-issues@l=
ists.openembedded.org>; openembedded-devel@lists.openembedded.org<mailto:op=
enembedded-devel@lists.openembedded.org>
Subject: [Openembedded-issues] [RFC] Issues with mariadb-10.4.17 and aarch6=
4

This email originated from outside ECU.


Hello

I was wondering if there has been any reports of the mariadb update on the =
dunfell branch causing issues with 64bit compilers when the 'pam' is set fo=
r DISTRO_FEATURES

There does not seem to be a compilation issue but more of an installation i=
ssue in which the lib/security directory is not being created.

We are seeing issues in our arago distro with the following errors

 mv: cannot stat '/OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-ex=
ternal-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image/lib/security':=
 No such file or directory

09:38:06 WARNING: /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-ex=
ternal-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/temp/run.do_install.=
5379:1 exit 1 from 'mv /OE/arago-dunfell-next-build/build-AARCH64_1/arago-t=
mp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image/lib/secur=
ity /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-gli=
bc/work/aarch64-linux/mariadb/10.4.17-r0/image//usr/lib'






--_000_BL0PR0102MB3377F2478792A70F7F565A0DCABD9BL0PR0102MB3377_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
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
	color:blue;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	font-size:10.0pt;
	font-family:"Courier New";}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
span.timestamp
	{mso-style-name:timestamp;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><b><span style=3D"font-size:20.0pt">Why oh why is al=
l of these being directed to me when I have nothing to do with Open embedde=
d?<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Sent from <a href=3D"https://go.microsoft.com/fwlink=
/?LinkId=3D550986">
Mail</a> for Windows 10</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0in 0in 0in">
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><b>From: </b><a hr=
ef=3D"mailto:dmurphy=3Dti.com@lists.openembedded.org">Dan Murphy via lists.=
openembedded.org</a><br>
<b>Sent: </b>Monday, January 25, 2021 1:40 PM<br>
<b>To: </b><a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>=
<br>
<b>Cc: </b><a href=3D"mailto:Openembedded-issues@lists.openembedded.org">Op=
enembedded-issues@lists.openembedded.org</a>;
<a href=3D"mailto:openembedded-devel@lists.openembedded.org">openembedded-d=
evel@lists.openembedded.org</a><br>
<b>Subject: </b>[Openembedded-issues] [RFC] Issues with mariadb-10.4.17 and=
 aarch64</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" style=3D"border-collapse:collapse">
<tbody>
<tr>
<td valign=3D"top" style=3D"border:solid black 1.0pt;background:#592A8A;pad=
ding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:white">This email originated from outside ECU.<o=
:p></o:p></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p>Hello</p>
<p>I was wondering if there has been any reports of the mariadb update on t=
he dunfell branch causing issues with 64bit compilers when the 'pam' is set=
 for DISTRO_FEATURES</p>
<p>There does not seem to be a compilation issue but more of an installatio=
n issue in which the lib/security directory is not being created.</p>
<p>We are seeing issues in our arago distro with the following errors<o:p><=
/o:p></p>
<pre style=3D"box-sizing: border-box;white-space:pre-wrap;overflow-wrap: br=
eak-word;font-variant-ligatures: normal;font-variant-caps: normal;orphans: =
2;text-align:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration=
-thickness: initial;text-decoration-style: initial;text-decoration-color: i=
nitial;word-spacing:0px"><span class=3D"timestamp"><span style=3D"font-size=
:10.5pt;color:#333333"> </span></span><span style=3D"font-size:10.5pt;color=
:#333333">mv: cannot stat '/OE/arago-dunfell-next-build/build-AARCH64_1/ara=
go-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image/lib/s=
ecurity': No such file or directory<o:p></o:p></span></pre>
<pre><span class=3D"timestamp"><b><span style=3D"font-size:10.5pt;color:#33=
3333">09:38:06</span></b></span><span class=3D"timestamp"><span style=3D"fo=
nt-size:10.5pt;color:#333333"> </span></span><span style=3D"font-size:10.5p=
t;color:#333333">WARNING: /OE/arago-dunfell-next-build/build-AARCH64_1/arag=
o-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/temp/run.do_=
install.5379:1 exit 1 from 'mv /OE/arago-dunfell-next-build/build-AARCH64_1=
/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image/l=
ib/security /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external=
-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image//usr/lib'<o:p></o:p>=
</span></pre>
<pre><span style=3D"font-size:10.5pt;color:#333333"><o:p>&nbsp;</o:p></span=
></pre>
</div>
<pre><span style=3D"font-size:10.5pt;color:#333333"><o:p>&nbsp;</o:p></span=
></pre>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_BL0PR0102MB3377F2478792A70F7F565A0DCABD9BL0PR0102MB3377_--
