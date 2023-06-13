Return-Path: <muhammad.hamzai@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E73C7EE29
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 05:49:14 +0000 (UTC)
Received: from sonic312-27.consmr.mail.ir2.yahoo.com (sonic312-27.consmr.mail.ir2.yahoo.com [77.238.178.98])
 by mx.groups.io with SMTP id smtpd.web10.7063.1686635352033713156
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 22:49:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=ikMHIdY9;
 spf=neutral (domain: yahoo.com, ip: 77.238.178.98, mailfrom: muhammad.hamzai@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1686635350; bh=ODT4H/OgnnBqb4WD1cQWvCkFLu83YIUQTgUTncZlV8s=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=ikMHIdY9GHLb6N2gRjlPeR7Vlo2iLyUGHTXMDzFv40XnNVUSNiAc1dxKBN9kLv70zq6CApwhcW/AYiEoroJmOhUtpvCZtNKk4K78Njvj1iBp6/uE1Z10FwbE4bZdRY4ro0MOHj37Fkf20RFqGf8Pv3kL/m6MHIYxxXnZgNSgtG3iCdmddxrrB4jKlkIv3mfYCGTLlCJzwLIVK3OlRCE+IURnYr7j+0WEPSkU4JAU6rS4XxYfyL7HfEZPXZibAsWzKvoTmEjox6Gz2N0CSlWdydi1vk7MHEc2VXF5AGwXkCxhMxTTRVnarWGkcrI2rFCUOXxU9dGuk8hDI+R9j0zgyw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1686635350; bh=hr9WlIhjBxIJJ1Fhxq0CtxGZGYSpSg93m6y+FS8Kz4f=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=RTCzR+eS10i3dLLF+yYqUzbVNKlVMHLwFQouS7dfEkUXW9GtcIS4bJIWs0tjcOFEuCqyeQV2SoM0nOvjNtNj2B7T2fNxgXSVehWJc03f8vv1qekbA1rch+KysRnBkcwOY1+NAD3r7BGngxkP1pNT/sWgEuoWEWskrnzbHn4DM0w7e7Lyi4eWyb7w8zYQyUP9wYqXvLkckCDH+s6JvyM1u0MSUZ7bZ2amkuWHCLuShnNb2VJ1AI81NnME3O7TE7idMRSVNWCkMhJ5qp/tcu2EJ8rbERynfgoPfrbiwJ6YxfaGaDvXRpgi+bJrBCXaDrWBxcWwOa3CbPPXqmqFWbzPUQ==
X-YMail-OSG: mmiQQW4VM1mTDq226Hs1m2ZZldRGc2mYlbchtKf5jVSG9weTnRZVHhxe360KRSy
 2YaHoZ0p3z9tAnzLSSBTrE2vyDL_IWNQv_5IQ.O4huQM.R_i5EjF7ogjJed.O_0jfuwl3uveMlQ7
 DMWVQvoaNFIFneVDkokWyMfcdGZkbEloZiHMULR8s2oZhUa6yR2fVyIWGSMeowoNIT0H7sqdQllH
 pfFdleQ5DbRmZh0aOX2grhfnSEd.g9YW9qY741vB.XbnT1TWi4dUobbcb8cksAAwlq8ZunRoGdoY
 wymR.uymSscBMIAd8sSZvJzFHnu9sAbkDs19qq52FIAhppqvafcoQ37BbqMo8wRrdUCTshUrvgpN
 Pje6bkgTafokaDElgjVC95vQc0qcpEb3RHVVFDnkXeDU6wUz1ssTm32aoowQvH4rScWdR1BeNWw7
 OilQFzZlLTYFiOhrwyyeKUrYwcsVGw0mHGiQf9ZQSFIKUMnoK0XkyPHS.Vwd_fzSuxT4Adw9ouN4
 eRo_OM5Zu0mmCVAO2_oKPrLho8PdhBW82BWxvpZU.ib02GPeKO93YQsFoEI1GBlnudr2fxTY4wUJ
 rcNDSt9upLxdlC5XeP0riHg27pONhy_3jxT7Pt.XdFyaxVFEjbOqb5bar1m62BKg3vK.DJp6HxNW
 WDAfZRYpPcWwWoxmvR6XN11ftFKl8QkrbfiNP6oGa8n6GvfOpz401u6Y8ISmC9RHr5A3kewXOhNl
 XtSBYksHRvfeZDAW0BAvV4O21pe0m07NerbCVs.YJmec8HmOfAqKToAzaEz2qbwW5O19IM0n5JUv
 WgTVW4bA6JTZceLNb0VKeIf9xfzrVqZG.yfC8VNTiIzlxanPBuuFQDv_NSihAOkP0w3IdAGUAaLj
 9k88pAPy6cZuy841mCWtmukPo8lD_sKdX9oxZf1sdaQiCk9UcMuRLC7RQEUOcij_nDPGrHWq7kDr
 QFIOmKRHiaVCBVX5PP5GBIIfJFtvhnTwFWPcap5hjKayJl3xAvb5lWVYXYQtZ5c4hGPjw9oBhPMc
 Qbgrcqo_xkgUWpm_lR_TjIVw5rj1QMwhSeKHy5rXn79GTR3CIBLGmRe._rN7fDMuR1NV_egLkr0a
 HefhApz9XHZHWlxDFSG1QFxLhBsY1JsF6qNbJ1uDrUd1y7H_fZsohzpqWaW4.6EQ3xJs.0DKUM1Q
 w0BO646EoolwIcqJ3nTtB3PHtPuBjnuz6eQ8gZdV2QjUH_O9SP0IT7YHstrG4xKYzUBJd8fT9.8L
 fjqz8fDtoUsyNkpkABZR7A72M2LHwV0GazNlEiHY341cM32TMgyTxpwHSA7Y5oe3OaHbrBuxEFvO
 Xdktr0mKM.1ngqZzjZkUWlS7eEkavmUfUDYOxXHklLe5GEcu8FEYgkhaobDm9JMRQ7YUGQTDFqjh
 aN9vpMvlb4vu0EUmbdtC9oxPrxvXZg6eax7dKgt7BYbe0J4X5dUpscB9_DOKikGU4RZPbehBm_UA
 uymwjWXFLmNpIo6r6a5.bmYKFVmQU6vUteC6BmZSOooEi8iDOeZCkOOTzH1pZEn8eJtlt5abLfFb
 sSSBy8VqQYVpBqjsOmWQVLlPAVIfnR5PpNBwygdZzy6gWWx1gRrXwLdPGQErJT4WzipuO6aSbh3S
 gzMkHepi2I1huDFiBBRoNfoP8P7068nnCZ0Qi6rdKi9caXwzUPXZbufd_P9dIul80j0kI2KMBKU1
 ywOzAIHSZ1uQAGQgzcPBny3CzYIO2VmO4Npp_lKH4uEKKgR.JzNcoygdDmvnrPwSRzYhcq5QzC4j
 ItwXtbjPWF4E99.Es5BE5rV3AJNBo4K.chjqu6D3i7HUdqYHcx2FGWpg5ZL4BrxQvDr3UMaR5OgT
 rVfpSIrkv6webC_bD_RoW_nv8i0rUgMiJvQCz.UYnucTP_Yasv4XwMDygZai8ubQVAgpKlvrYdnV
 hwKBnjiPdrzWvMs.fUoJQo4tn2T6_i23NGoFNgXJEO64NUyfQpxJHFo4sCMX3zc66tG3fonk3OWm
 vbPolaX3iqpgJjZPJvMShdxuCjvYubh1_pQBXic3lkBPalnYaARqpdL3S7dYK2oz0PV9KA5Fvrz0
 wIDHOYW7Dnhb8XX_VWxNUTKrQ69otd5CFEwr2p45zB61lCZ_PLnwt52yOFo1cW5RLZ7PgJhBZUIN
 o8oGrTtcqJ1KaYiD3N8Kx2tcOEUQl5RQ48xUZBJk9tyzkU0KNi2bRwOSQTZC1oZYP_OgABzv6mKt
 uPUXRrK.8gLENJrDYoZqbrrYqwlVJQThow95jN0YJ66KTkao3tn3HPzYS_.pgzx44qKV.4DFumNe
 uUFo-
X-Sonic-MF: <muhammad.hamzai@yahoo.com>
X-Sonic-ID: c77aca7c-eb0b-4091-92a3-91d535912734
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ir2.yahoo.com with HTTP; Tue, 13 Jun 2023 05:49:10 +0000
Date: Tue, 13 Jun 2023 05:49:01 +0000 (UTC)
From: "Muhammad.Hamza Ishfaq" <muhammad.hamzai@yahoo.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Message-ID: <228736090.4951148.1686635341179@mail.yahoo.com>
In-Reply-To: <CAMKF1sq_tn2QHQtjEJ8yg5fZ4gOp_Aj2fNFobJufGEvqBQBoqA@mail.gmail.com>
References: <1747474539.3138796.1686633366135.ref@mail.yahoo.com> <1747474539.3138796.1686633366135@mail.yahoo.com> <CAMKF1sq_tn2QHQtjEJ8yg5fZ4gOp_Aj2fNFobJufGEvqBQBoqA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] exprtk_git: Fix SRCREV for exprtk_git
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_4951147_304842832.1686635341178"
X-Mailer: WebService/1.1.21516 YahooMailIosMobile
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 05:49:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103259

------=_Part_4951147_304842832.1686635341178
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,
My bad, I missed including branch, this is for Kirkstone.


Regards,Muhammad Hamza

On Tuesday, June 13, 2023, 10:48 AM, Khem Raj <raj.khem@gmail.com> wrote:

which release is it for ? master branch already is at
f46bffcd6966d38a09023fb37ba9335214c9b959

On Mon, Jun 12, 2023 at 10:16=E2=80=AFPM Muhammad Hamza via
lists.openembedded.org
<muhammad.hamzai=3Dyahoo.com@lists.openembedded.org> wrote:
>
> exprtk_git recipe uses a SRCREV that does not belong
> to any branch and results in a fetcher failure when bitbake
> tries to fetch it.
> This commit updates the SRCREV to fix this issue.
>
> Signed-off-by: Muhammad Hamza <muhammad.hamzai@yahoo.com>
> ---
>=C2=A0 meta-oe/recipes-devtools/exprtk/exprtk_git.bb | 2 +-
>=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/exprtk/exprtk_git.bb b/meta-oe/reci=
pes-devtools/exprtk/exprtk_git.bb
> index 52975c821..557c4f27a 100644
> --- a/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
> +++ b/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/ArashPartow/exprtk"
>=C2=A0 SECTION =3D "libs"
>=C2=A0 LICENSE =3D "MIT"
>=C2=A0 LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ad=
e698e0bcf8506ecda2f7b4f302"
> -SRCREV =3D "281c2ccc65b8f91c012ea3725ebcef406378a225"
> +SRCREV =3D "f46bffcd6966d38a09023fb37ba9335214c9b959"
>
>=C2=A0 SRC_URI =3D "git://github.com/ArashPartow/exprtk.git;branch=3Dmaste=
r;protocol=3Dhttps"
>
> --
> 2.34.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103256): https://lists.openembedded.org/g/openembedde=
d-devel/message/103256
> Mute This Topic: https://lists.openembedded.org/mt/99499725/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>




------=_Part_4951147_304842832.1686635341178
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:v=3D"urn:schemas-microso=
ft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com:office:office"><head><!--[=
if gte mso 9]><xml><o:OfficeDocumentSettings><o:AllowPNG/><o:PixelsPerInch>=
96</o:PixelsPerInch></o:OfficeDocumentSettings></xml><![endif]--></head><bo=
dy>
Hello,<div><br></div><div>My bad, I missed including branch, this is for Ki=
rkstone.<br><br><div class=3D"yahoo-signature"><br><div>Regards,</div><div>=
Muhammad Hamza</div></div><br><p class=3D"yahoo-quoted-begin" style=3D"font=
-size: 15px; color: #715FFA; padding-top: 15px; margin-top: 0">On Tuesday, =
June 13, 2023, 10:48 AM, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:</p><blo=
ckquote class=3D"iosymail"><div dir=3D"ltr">which release is it for ? maste=
r branch already is at<br clear=3D"none">f46bffcd6966d38a09023fb37ba9335214=
c9b959<br clear=3D"none"><div class=3D"yqt6201634965" id=3D"yqtfd08427"><br=
 clear=3D"none">On Mon, Jun 12, 2023 at 10:16=E2=80=AFPM Muhammad Hamza via=
<br clear=3D"none">lists.openembedded.org<br clear=3D"none">&lt;muhammad.ha=
mzai=3Dyahoo.com@lists.openembedded.org&gt; wrote:<br clear=3D"none">&gt;<b=
r clear=3D"none">&gt; exprtk_git recipe uses a SRCREV that does not belong<=
br clear=3D"none">&gt; to any branch and results in a fetcher failure when =
bitbake<br clear=3D"none">&gt; tries to fetch it.<br clear=3D"none">&gt; Th=
is commit updates the SRCREV to fix this issue.<br clear=3D"none">&gt;<br c=
lear=3D"none">&gt; Signed-off-by: Muhammad Hamza &lt;<a shape=3D"rect" ymai=
lto=3D"mailto:muhammad.hamzai@yahoo.com" href=3D"mailto:muhammad.hamzai@yah=
oo.com">muhammad.hamzai@yahoo.com</a>&gt;<br clear=3D"none">&gt; ---<br cle=
ar=3D"none">&gt;&nbsp; meta-oe/recipes-devtools/exprtk/exprtk_git.bb | 2 +-=
<br clear=3D"none">&gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)=
<br clear=3D"none">&gt;<br clear=3D"none">&gt; diff --git a/meta-oe/recipes=
-devtools/exprtk/exprtk_git.bb b/meta-oe/recipes-devtools/exprtk/exprtk_git=
.bb<br clear=3D"none">&gt; index 52975c821..557c4f27a 100644<br clear=3D"no=
ne">&gt; --- a/meta-oe/recipes-devtools/exprtk/exprtk_git.bb<br clear=3D"no=
ne">&gt; +++ b/meta-oe/recipes-devtools/exprtk/exprtk_git.bb<br clear=3D"no=
ne">&gt; @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/ArashPartow/exprt=
k"<br clear=3D"none">&gt;&nbsp; SECTION =3D "libs"<br clear=3D"none">&gt;&n=
bsp; LICENSE =3D "MIT"<br clear=3D"none">&gt;&nbsp; LIC_FILES_CHKSUM =3D "f=
ile://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302"<br =
clear=3D"none">&gt; -SRCREV =3D "281c2ccc65b8f91c012ea3725ebcef406378a225"<=
br clear=3D"none">&gt; +SRCREV =3D "f46bffcd6966d38a09023fb37ba9335214c9b95=
9"<br clear=3D"none">&gt;<br clear=3D"none">&gt;&nbsp; SRC_URI =3D "git://g=
ithub.com/ArashPartow/exprtk.git;branch=3Dmaster;protocol=3Dhttps"<br clear=
=3D"none">&gt;<br clear=3D"none">&gt; --<br clear=3D"none">&gt; 2.34.1</div=
><br clear=3D"none">&gt;<br clear=3D"none">&gt;<br clear=3D"none">&gt;<br c=
lear=3D"none">&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br clear=
=3D"none">&gt; Links: You receive all messages sent to this group.<br clear=
=3D"none">&gt; View/Reply Online (#103256): <a shape=3D"rect" href=3D"https=
://lists.openembedded.org/g/openembedded-devel/message/103256" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/103256</a=
><br clear=3D"none">&gt; Mute This Topic: <a shape=3D"rect" href=3D"https:/=
/lists.openembedded.org/mt/99499725/1997914" target=3D"_blank">https://list=
s.openembedded.org/mt/99499725/1997914</a><br clear=3D"none">&gt; Group Own=
er: openembedded-devel+owner@lists.openembedded.org<br clear=3D"none">&gt; =
Unsubscribe: <a shape=3D"rect" href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/unsub" target=3D"_blank">https://lists.openembedded.org/g/o=
penembedded-devel/unsub</a> [raj.khem@gmail.com]<div class=3D"yqt6201634965=
" id=3D"yqtfd65201"><br clear=3D"none">&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-<br clear=3D"none">&gt;<br clear=3D"none"></div></div><bloc=
kquote></blockquote></blockquote></div>
</body></html>
------=_Part_4951147_304842832.1686635341178--

