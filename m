Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 646BAC3DA49
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 10:19:19 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web10.14417.1722334755069599860
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jul 2024 03:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W2VMzOZ9;
 spf=pass (domain: gmail.com, ip: 209.85.222.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-824ae03efbfso878538241.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jul 2024 03:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722334754; x=1722939554; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uOt/Qjr+xEjysmUxix4dNFPXRypFdQPA0XJSJUeNiKE=;
        b=W2VMzOZ9zHXD/2RapbQrTaE0NkePVEIbW3AsZ3LnZpTL8Xe9U8VriYOynKVCVeWBFC
         Qp96cHTd3Ed2Vr96JnAkddAKrHtDW2e4CMbfM4BU5wJ4npFHrlGObwtEfUTo6wKNkWNR
         QM5wtxfB+zMOxNLhETA5AHgAUBHZyaBw+cFFGz9EgavAmcKzRsVs8IZXYNn48zwwGuUu
         HS1tkW1EJw6JUHLz4wp3nxWiRSztC/oeIBXORJS2DOXxAd37AUyCDYf+P64G3uyHb6Sr
         xcORA1DunHzYD0ZJh8GMrwCPvPqo5KeM2JjrmtF5eIq8XVuKdFnDW+909FgU67B4GbaV
         qdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722334754; x=1722939554;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOt/Qjr+xEjysmUxix4dNFPXRypFdQPA0XJSJUeNiKE=;
        b=uMO3yQbL/gFIzvMyg0NFnctuuwBz7MIA5YxueG3uxQo9tp6qfVpfrNu7sq2fcmSXn0
         stMtAUHZDMRpA+zIeidBscliwJiLQd7S8a5CyZvkuNt+M3PhrYbZ4NrL5NVZFotVas7/
         zAPg8wh8re6SJKEqmAQBqz+zdwU0ijHrLRKZ32yGc12iF20FEXTpQB32dEs0bFJZlJ+y
         /Z5kYYSGhoBhbuCaaQ8YvRBFWqtzWSllyUiOZsycky/QnOLerrJD5WbOJAuGO35+U3Ik
         D1sy8SmDWPNacpvg2dH2pUhNJnnFGBLlW7HkBwTCEuDu80WkWQld0QOvPJ7ShT7nVfyW
         Z+bg==
X-Gm-Message-State: AOJu0YxKSf19n3CVqzlBfhjIXlPVHFZhDrNgnkN0nFdUBVp2AlrRPLEt
	5RJWu9oPGA1+fFBWpMAyYrTrEsUBgfj3mODrubSmXepRABBmGD+3s1SkVbu1pyDxrizcXYZi1OZ
	jZnCgfiEf1lM2/Y9o5kO984ZQllk=
X-Google-Smtp-Source: AGHT+IFHJHV8Yvs3Ko4z7pmfG/AyxVMds1FLdNMX0k+aZoODsGn8n5kpYkUhetCiIMndUNgjFDnxf0fUYBlDe1W62js=
X-Received: by 2002:a05:6102:512c:b0:48f:df86:dba with SMTP id
 ada2fe7eead31-493fa15fa58mr11598097137.5.1722334753843; Tue, 30 Jul 2024
 03:19:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240729182532.432091-1-przemyslaw.zegan@gmail.com>
In-Reply-To: <20240729182532.432091-1-przemyslaw.zegan@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 30 Jul 2024 11:19:02 +0100
Message-ID: <CANPvuRk-ty2q93DyYhke9iAK+1MU5AUk6h4Qj4AdGpdpyEwPnw@mail.gmail.com>
Subject: Re: [oe] [meta-oe,scarthgap][PATCH] libftdi: Fix missing ftdi_eeprom
To: przemyslaw.zegan@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002ff295061e744f80"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jul 2024 10:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111477

--0000000000002ff295061e744f80
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Przemyslaw Zegan via lists.openembedded.org <przemyslaw.zegan=3D
gmail.com@lists.openembedded.org> escreveu (segunda, 29/07/2024 =C3=A0(s) 1=
9:25):

> Due to the incorrect subpackage name, the ftdi_eeprom does not placed in
> the generated image. This patch fixes it.
>

What is the package name you are using to install the ftdi_eeprom on the
image?
Should be the 'ftdi-eeprom' package


>
> Signed-off-by: Przemyslaw Zegan <przemyslaw.zegan@gmail.com>
> ---
>  meta-oe/recipes-support/libftdi/libftdi_1.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
> b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
> index eae1c02f0..ed989a311 100644
> --- a/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
> +++ b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
> @@ -36,5 +36,5 @@ BBCLASSEXTEND =3D "native nativesdk"
>
>  PACKAGES =3D+ "${PN}-python ftdi-eeprom"
>

Above the packages provided by this recipe are 'libftdi', 'libftdi--python'
and 'ftdi-eeprom'.


>
> -FILES:ftdi-eeprom =3D "${bindir}/ftdi_eeprom"
> +FILES:${PN}-ftdi-eeprom =3D "${bindir}/ftdi_eeprom"
>

This package 'libftdi-ftdi-eeprom' doesn't exist and with this patch you
are making it install the ftdi_eeprom
on the default 'libftdi' package.

Jose

 FILES:${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}/"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111474):
> https://lists.openembedded.org/g/openembedded-devel/message/111474
> Mute This Topic: https://lists.openembedded.org/mt/107614478/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000002ff295061e744f80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Przemyslaw Zegan via <a href=3D"http:=
//lists.openembedded.org">lists.openembedded.org</a> &lt;przemyslaw.zegan=
=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.open=
embedded.org</a>&gt; escreveu (segunda, 29/07/2024 =C3=A0(s) 19:25):<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Due to the incorrect s=
ubpackage name, the ftdi_eeprom does not placed in the generated image. Thi=
s patch fixes it.<br></blockquote><div><br></div><div>What is the package n=
ame you are using to install the ftdi_eeprom on the image?</div><div>Should=
 be the &#39;ftdi-eeprom&#39; package<br></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Przemyslaw Zegan &lt;<a href=3D"mailto:przemyslaw.zegan@gmai=
l.com" target=3D"_blank">przemyslaw.zegan@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/libftdi/<a href=3D"http://libftdi_1.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libftdi_1.5.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-support/libftdi/<a href=3D"http://libftdi_1.5.=
bb" rel=3D"noreferrer" target=3D"_blank">libftdi_1.5.bb</a> b/meta-oe/recip=
es-support/libftdi/<a href=3D"http://libftdi_1.5.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libftdi_1.5.bb</a><br>
index eae1c02f0..ed989a311 100644<br>
--- a/meta-oe/recipes-support/libftdi/<a href=3D"http://libftdi_1.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libftdi_1.5.bb</a><br>
+++ b/meta-oe/recipes-support/libftdi/<a href=3D"http://libftdi_1.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libftdi_1.5.bb</a><br>
@@ -36,5 +36,5 @@ BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-python ftdi-eeprom&quot;<br></blockquote><d=
iv><br></div><div>Above the packages provided by this recipe are &#39;libft=
di&#39;, &#39;libftdi--python&#39; and &#39;ftdi-eeprom&#39;.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-FILES:ftdi-eeprom =3D &quot;${bindir}/ftdi_eeprom&quot;<br>
+FILES:${PN}-ftdi-eeprom =3D &quot;${bindir}/ftdi_eeprom&quot;<br></blockqu=
ote><div><br></div><div>This package &#39;libftdi-ftdi-eeprom&#39; doesn&#3=
9;t=C2=A0exist and with this patch=C2=A0you are making it install the ftdi_=
eeprom</div><div>on the default &#39;libftdi&#39; package.</div><div>=C2=A0=
</div><div>Jose</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
=C2=A0FILES:${PN}-python =3D &quot;${PYTHON_SITEPACKAGES_DIR}/&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#111474): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/111474" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/111474</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107614478/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107614478/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000002ff295061e744f80--

