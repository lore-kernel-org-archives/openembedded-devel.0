Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2F0C43458
	for <webhook@archiver.kernel.org>; Sat,  4 Jul 2026 07:42:57 +0000 (UTC)
Received: from mailserv.regfish.com (mailserv.regfish.com [52.57.101.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.108986.1783150973367026572
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Jul 2026 00:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: michael-fitzmayer.de, ip: 52.57.101.90, mailfrom: mail@michael-fitzmayer.de)
Received: by mailserv.regfish.com (Postfix, from userid 706)
	id 8009F60771; Sat,  4 Jul 2026 07:42:51 +0000 (UTC)
Received: from DESKTOPB84SDL6 (ipservice-092-208-170-243.092.208.pools.vodafone-ip.de [92.208.170.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: 46272-0001)
	by mailserv.regfish.com (Postfix) with ESMTPSA id 61462606DE
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Jul 2026 07:42:51 +0000 (UTC)
From: "Michael Fitzmayer" <mail@michael-fitzmayer.de>
To: <openembedded-devel@lists.openembedded.org>
References: <20260704053656.648316-1-mail@michael-fitzmayer.de> <CAMKF1sr-o4FHMJrCZ4MWtTR8RC1qvLBoq7k-gvqD=7bYZW4XQA@mail.gmail.com>
In-Reply-To: <CAMKF1sr-o4FHMJrCZ4MWtTR8RC1qvLBoq7k-gvqD=7bYZW4XQA@mail.gmail.com>
Subject: RE: [oe] [PATCH] canopenterm: update to version 2.03
Date: Sat, 4 Jul 2026 09:42:52 +0200
MIME-Version: 1.0
Message-ID: <002001dd0b88$b8a65830$29f30890$@michael-fitzmayer.de>
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIo5+ivkq/K9DqDcdjHa0ZDcXcZ4QG1PIKXtbeXPDA=
Content-Language: en-gb
Content-Type: multipart/signed;
	protocol="application/pgp-signature";
	micalg=pgp-sha256;
	boundary="=-=VMlPe78hmqaBVw=-="
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Jul 2026 07:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128020

This is a multipart message in MIME format.

--=-=VMlPe78hmqaBVw=-=
Content-Type: multipart/alternative;
	boundary="=-=8jV9+CUzF0o35T=-="


--=-=8jV9+CUzF0o35T=-=
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

thanks. What do you mean by =E2=80=9Cdropped the hunk=E2=80=9D?

=20

I didn=E2=80=99t change much:

=20

14c14

< LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dbd2edc721b4a0289efe949bdbe7=
dda79"

---

> LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D8977ecf3af54da2a5271158cc96=
9bd45"

18,21c18,19

< PV .=3D "+git"

<=20

< SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttp=
s;branch=3Dmain"

< SRCREV  =3D "7a9466029a6e88345e65e794ff1779f778c9358a"

---

> SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttp=
s;branch=3Dmain;tag=3Dv${PV}"

> SRCREV  =3D "63ccae8262f5e796ffca0c8a44fdf7ff0bd28571"

=20

From: Khem Raj <raj.khem@gmail.com>=20
Sent: 04 July 2026 08:58
To: mail@michael-fitzmayer.de
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH] canopenterm: update to version 2.03

=20

On Fri, Jul 3, 2026 at 10:37=E2=80=AFPM Michael Fitzmayer via lists.openemb=
edded.org <http://lists.openembedded.org>  <mail=3Dmichael-fitzmayer.de@lis=
ts.openembedded.org <mailto:michael-fitzmayer.de@lists.openembedded.org> > =
wrote:

	- Added new script to interface CiA 305: Layer setting services (LSS)
	- New API function to set baud rate: can_set_baudrate()
	- Remove usage of white text-color
	- License-Update: update year in copyright

=20

This looks ok.

=20

this version dropped the hunk against do_install. Is this intentional ?

=20

--=-=8jV9+CUzF0o35T=-=
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40"><head><meta name=3DGenerator content=3D"Microso=
ft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-GB link=3Dblue vli=
nk=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span style=3D'm=
so-fareast-language:EN-US'>Hi,<o:p></o:p></span></p><p class=3DMsoNormal><s=
pan style=3D'mso-fareast-language:EN-US'>thanks. What do you mean by =E2=80=
=9C</span>dropped the hunk=E2=80=9D?<o:p></o:p></p><p class=3DMsoNormal><sp=
an style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p clas=
s=3DMsoNormal><span style=3D'mso-fareast-language:EN-US'>I didn=E2=80=99t c=
hange much:<o:p></o:p></span></p><p class=3DMsoNormal><span style=3D'mso-fa=
reast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><spa=
n style=3D'mso-fareast-language:EN-US'>14c14<o:p></o:p></span></p><p class=
=3DMsoNormal><span style=3D'mso-fareast-language:EN-US'>&lt; LIC_FILES_CHKS=
UM =3D &quot;file://LICENSE.md;md5=3Dbd2edc721b4a0289efe949bdbe7dda79&quot;=
<o:p></o:p></span></p><p class=3DMsoNormal><span style=3D'mso-fareast-langu=
age:EN-US'>---<o:p></o:p></span></p><p class=3DMsoNormal><span style=3D'mso=
-fareast-language:EN-US'>&gt; LIC_FILES_CHKSUM =3D &quot;file://LICENSE.md;=
md5=3D8977ecf3af54da2a5271158cc969bd45&quot;<o:p></o:p></span></p><p class=
=3DMsoNormal><span lang=3DDE style=3D'mso-fareast-language:EN-US'>18,21c18,=
19<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DDE style=3D'mso-f=
areast-language:EN-US'>&lt; PV .=3D &quot;+git&quot;<o:p></o:p></span></p><=
p class=3DMsoNormal><span lang=3DDE style=3D'mso-fareast-language:EN-US'>&l=
t;<o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DDE style=3D=
'mso-fareast-language:EN-US'>&lt; SRC_URI =3D &quot;git://github.com/CANope=
nTerm/CANopenTerm.git;protocol=3Dhttps;branch=3Dmain&quot;<o:p></o:p></span=
></p><p class=3DMsoNormal><span style=3D'mso-fareast-language:EN-US'>&lt; S=
RCREV=C2=A0 =3D &quot;7a9466029a6e88345e65e794ff1779f778c9358a&quot;<o:p></=
o:p></span></p><p class=3DMsoNormal><span style=3D'mso-fareast-language:EN-=
US'>---<o:p></o:p></span></p><p class=3DMsoNormal><span style=3D'mso-fareas=
t-language:EN-US'>&gt; SRC_URI =3D &quot;git://github.com/CANopenTerm/CANop=
enTerm.git;protocol=3Dhttps;branch=3Dmain;tag=3Dv${PV}&quot;<o:p></o:p></sp=
an></p><p class=3DMsoNormal><span style=3D'mso-fareast-language:EN-US'>&gt;=
 SRCREV=C2=A0 =3D &quot;63ccae8262f5e796ffca0c8a44fdf7ff0bd28571&quot;<o:p>=
</o:p></span></p><p class=3DMsoNormal><span style=3D'mso-fareast-language:E=
N-US'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><b><span lang=3DEN-U=
S>From:</span></b><span lang=3DEN-US> Khem Raj &lt;raj.khem@gmail.com&gt; <=
br><b>Sent:</b> 04 July 2026 08:58<br><b>To:</b> mail@michael-fitzmayer.de<=
br><b>Cc:</b> openembedded-devel@lists.openembedded.org<br><b>Subject:</b> =
Re: [oe] [PATCH] canopenterm: update to version 2.03<o:p></o:p></span></p><=
div><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><div><p class=3DMsoNorma=
l>On Fri, Jul 3, 2026 at 10:37=E2=80=AFPM Michael Fitzmayer via <a href=3D"=
http://lists.openembedded.org">lists.openembedded.org</a> &lt;mail=3D<a hre=
f=3D"mailto:michael-fitzmayer.de@lists.openembedded.org">michael-fitzmayer.=
de@lists.openembedded.org</a>&gt; wrote:<o:p></o:p></p></div><blockquote st=
yle=3D'border:none;border-left:solid #CCCCCC 1.0pt;padding:0cm 0cm 0cm 6.0p=
t;margin-left:4.8pt;margin-right:0cm'><p class=3DMsoNormal>- Added new scri=
pt to interface CiA 305: Layer setting services (LSS)<br>- New API function=
 to set baud rate: can_set_baudrate()<br>- Remove usage of white text-color=
<br>- License-Update: update year in copyright<o:p></o:p></p></blockquote><=
div><p class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p class=3DMsoNorm=
al>This looks ok.<o:p></o:p></p></div><div><p class=3DMsoNormal>&nbsp;<o:p>=
</o:p></p></div><div><p class=3DMsoNormal>this version dropped the hunk aga=
inst do_install. Is this intentional ?<o:p></o:p></p></div><div><p class=3D=
MsoNormal>&nbsp;<o:p></o:p></p></div></div></div></div></body></html>

--=-=8jV9+CUzF0o35T=-=--

--=-=VMlPe78hmqaBVw=-=
Content-Type: application/pgp-signature;
	name="openpgp-digital-signature.asc"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCAAdFiEEeko8mQdaojPAePLVyfzHsirX2UkFAmpIuXUACgkQyfzHsirX
2UnxSAv8CmUYO0ey4lWcFxDRIBePFnrf+g5H18qLMLQYue7tDA1x2c/qKYxW3gn/
OThyRMeFZ5gNqXSTi7B13fO4wpa2zhGG097lCMlmMbQF4/+FvwuQecjCyOyrSfGv
Tkblq6l1aZXs6pjQ8Gij1118KLw6mcNxS1z4sy3Fr+stsHmf52+Kh9K2eDPLppX+
bbVGKdUy2pm1UtTpfIa9KpEFEurbbt62+P8wc1NNjEeoHAWzMsQQK/Yd/0P0I/FI
vbuHeVpdSDJQpV1irhiPvx3J9LvPMsICnqZbtjKFq38X0AQRhkBuT6sZQ76YSTcM
NmLpE/hLHkgVXIlZt7AmzqEH1m4MC72aCiHWx9auvn3vRFhKL3ONZsJjSsPyy2nW
DRotNuZf8rMCqBqGji5HRvj2IAiija8Z37hzOKw2r9wEzcDyzD48FScVOBzA6/hH
NQLeNMJXw7gdPZy716ECfVTyxPw9hpfnllPWXQmQlUFHy1mkvY4tgoZ9KyiPr8cc
H982vL4O
=H+Ym
-----END PGP SIGNATURE-----


--=-=VMlPe78hmqaBVw=-=--


