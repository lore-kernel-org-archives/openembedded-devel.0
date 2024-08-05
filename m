Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B84C5C3DA4A
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 13:40:17 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web10.8200.1722865216731139625
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Aug 2024 06:40:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P5NiGcDB;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-492a01bce97so2763054137.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Aug 2024 06:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722865216; x=1723470016; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gBLF9QVTo9W6jxLrPOPoRGNe3DNdZrCEfE6xWMOEUrk=;
        b=P5NiGcDBrEm7hZLsvRLuG98DZg5o6TX8TUDFsU4+LhoB6HmGN+LXCicmDYI5FwifND
         8Y1NnKH99+fkVR2NJ1Gjf90hSDeTcTTq0ZHbwYmq7duDIYRxEnekF4tBbGhuovRis3a+
         KFwI/I+UvycdHLStkfQWDgZwQI2j4EElrPadSkz5DTtZaFOPz/UI+gRiIrDf+ACXNvU1
         wVeprkrjTZSO8wztAk44RlHGPnRZzv3rwQfRM36LjMyGfrhOzw3KqBGaznustj2BwlLe
         K7jglY2Jgy9K2rwP1EG0czTkWgQelJx3eSy9iTl3I0pjIjcwPVgT8drJ1QuBLpsl73HG
         q/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722865216; x=1723470016;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gBLF9QVTo9W6jxLrPOPoRGNe3DNdZrCEfE6xWMOEUrk=;
        b=aBov4KZJ7i9dIvMTr+6ubvlVobAabM6cMYdVCTYDjWEkUf/2/xSDg+N/MVZ0hahAUu
         qjb+MhJDVYU9TBUdpl4BK19Qro+TL8LiYcwm0tHZO3SoygtFDElnrxMqFCqtnir5e7TW
         kiI/wi0tdmG5LigCVVDXj85hIIkTaFRdxf/Yz3Bwf1Oe+HjtaViPtnzMBen7AU9wrtCi
         19yym8fZQ6p4eXh3O0gY7/KxF7jZ52cQWixHzDTLjWcm+StECx/gHG5IfBXHkdlRkPhy
         vPDhJInT7FUvKRfU7bQ7XXW41SPsrcyEgBCHHLz4Svb4vBPiQo41xBIs9bXQjrJ68rHV
         B8WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXekrO4AtEMjF1ACNCl9Dvlct/Svp0EWS0PBh2YuW0NH+BlCKqO+NCji8DjRtYdTJspkYLuwY/KXEdSzX+Xd8ln1mg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzAhskg5RpLjh820W3W+ygGWbILx051lLn1vBSpqWbrUeHWH3I5
	d6KQpkdYXjTaWXSnzR8sgYhYDXbabMV5OLjKvqyV20BdzTLo7mL1Djua2Dt5OEJJxIiVkm/5kbt
	f7QWCK8xGUqyxbk+61tVnRf2Sxoc=
X-Google-Smtp-Source: AGHT+IHH4e626YyCpXDcQa2No3YPBVnXVTfC+FJ0WVDqsMvHq0wL2OU+lxFQqTdedTtFSoegUVU4PAEDsnZ7yhp3jD8=
X-Received: by 2002:a05:6102:c8a:b0:493:f8e4:4382 with SMTP id
 ada2fe7eead31-4945bde6d3bmr12344860137.4.1722865215577; Mon, 05 Aug 2024
 06:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <CANPvuRnxWrsgMA+be0asr4wFQ+L3mfYUn06ZsqY3LnwVqLgMnQ@mail.gmail.com>
 <22372.1722341730427474245@lists.openembedded.org> <17E70719B24635F2.20637@lists.openembedded.org>
In-Reply-To: <17E70719B24635F2.20637@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 5 Aug 2024 14:40:03 +0100
Message-ID: <CANPvuRkyvDvecxKraFVx4LRcxQ3rWSmptbuhq_DVgDOfOHMiwA@mail.gmail.com>
Subject: Re: [oe] [meta-oe,scarthgap][PATCH] libftdi: Fix missing ftdi_eeprom
To: quaresma.jose@gmail.com
Cc: przemyslaw.zegan@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002ba6e0061eefd19e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Aug 2024 13:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111512

--0000000000002ba6e0061eefd19e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I just noticed that this patch was integrated so it should be reverted.
There is no problem installing the ftdi-eeprom package.

Jose

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu (ter=C3=A7a, 30/07/2024 =C3=A0(s=
) 16:26):

>
>
> Przemyslaw Zegan via lists.openembedded.org <przemyslaw.zegan=3D
> gmail.com@lists.openembedded.org> escreveu (ter=C3=A7a, 30/07/2024 =C3=A0=
(s) 13:15):
>
>> In the following configuration as you suggested, ftdi-eeprom option is
>> still explicitly enabled in libftdi package, which is a bit confusing.
>>
>
> Sometimes bitbake is a little confusing but this is the way it works you
> can inspect the packages produced using the following:
>
> # this will build the ftdi-eeprom tool provided by the libftdi project
> echo 'PACKAGECONFIG:pn-libftdi =3D "ftdi-eeprom"' >> conf/local.conf
>
> # this will build the package
> bitbake libftdi -f -c do_package
>
> # with this you can inspect the packages produced by bitbake as well as
> its content:
> tree tmp/work/*/libftdi/*/packages-split
>
> # and with this you install the package from the above options on the ima=
ge
> echo 'IMAGE_INSTALL:append =3D " ftdi-eeprom"' >> conf/local.conf
>
>
> Everything you need is already there, just choose the right one.
>
> Jose
>
> IMAGE_INSTALL:append =3D " ftdi-eeprom"
>> PACKAGECONFIG:pn-libftdi =3D "ftdi-eeprom"
>>
>> Once you apply my patch, you can either select libftdi as a separate
>> package or explicitly add the ftdi-eeprom option:
>> IMAGE_INSTALL:append =3D " libftdi"
>> PACKAGECONFIG:pn-libftdi =3D "ftdi-eeprom"
>>
>> Przemyslaw Zegan
>>
>>
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111482):
> https://lists.openembedded.org/g/openembedded-devel/message/111482
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

--0000000000002ba6e0061eefd19e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>I just noticed that this patch was integrated s=
o it should be reverted.<br><div>There is no problem installing the=C2=A0ft=
di-eeprom package.<br></div><div><br></div><div>Jose</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma via=
 <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;q=
uaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.co=
m@lists.openembedded.org</a>&gt; escreveu (ter=C3=A7a, 30/07/2024 =C3=A0(s)=
 16:26):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Przemyslaw Zegan via <a href=3D"http://lists=
.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;przemys=
law.zegan=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_=
blank">gmail.com@lists.openembedded.org</a>&gt; escreveu (ter=C3=A7a, 30/07=
/2024 =C3=A0(s) 13:15):<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div>
<div>In the following configuration as you suggested, ftdi-eeprom option is=
 still explicitly enabled in libftdi package, which is a bit confusing.<br>=
</div></div></blockquote><div><br></div><div>Sometimes bitbake is a little =
confusing but this is the way it works you can inspect the packages produce=
d using the following:<br><br># this will build the ftdi-eeprom tool provid=
ed by the libftdi project=C2=A0</div><div><div>echo &#39;PACKAGECONFIG:pn-l=
ibftdi =3D &quot;ftdi-eeprom&quot;&#39; &gt;&gt; conf/<span style=3D"color:=
rgb(0,0,0)">local.conf<br><br></span><div># this will build the package</di=
v><div>bitbake libftdi -f -c do_package<br><br># with this you can inspect =
the packages produced by bitbake as well as its content:</div></div>tree tm=
p/work/*/libftdi/*/packages-split<br></div><div><br></div><div># and with t=
his you install the package from the above options on the image</div>echo &=
#39;IMAGE_INSTALL:append =3D &quot; ftdi-eeprom&quot;&#39; &gt;&gt; conf/<s=
pan style=3D"color:rgb(0,0,0)">local.conf</span><br><div><br></div><div><br=
></div><div>Everything you need is already there, just choose the right one=
.<br><br>Jose</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div><div>IMAGE_INSTALL:append =3D &quot; ftdi-eeprom&quot;<br>P=
ACKAGECONFIG:pn-libftdi =3D &quot;ftdi-eeprom&quot;</div>
<div>=C2=A0</div>
<div>Once you apply my patch, you can either select libftdi as a separate p=
ackage or explicitly add the ftdi-eeprom option:<br>IMAGE_INSTALL:append =
=3D &quot; libftdi&quot;<br>PACKAGECONFIG:pn-libftdi =3D &quot;ftdi-eeprom&=
quot;</div>
<br>
<div>Przemyslaw Zegan</div>
</div>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#111482): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/111482" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/111482</a><br>
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
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div>

--0000000000002ba6e0061eefd19e--

