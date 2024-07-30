Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 632FAC3DA70
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 15:26:31 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web11.20275.1722353189228424726
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jul 2024 08:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z2mEJMo3;
 spf=pass (domain: gmail.com, ip: 209.85.222.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-8223f0614b6so1265911241.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jul 2024 08:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722353188; x=1722957988; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M63Oa1BfPUNhQUg3syb0rS09F40f1hdoSF46AIqibkU=;
        b=Z2mEJMo3ynsKWhsHqVn/tW3URi96+wQ0ZxTiM5IJRuBtKpoxkt4jc9smVWapDspQ3L
         TibeHpELNOyf/W/12cBby5nGWDSVNs6nMhrAgc+LZg/r2zMhYhsJSzdksHVTNeeyJsXT
         /LQ/qblQnz48woHvtRyKwt1OnYgC09UGOi9DifHVazKXDHwQcRmfx/iOfZ5VJfnp2zKT
         q3Js1WEJ1sL5QkuivH5W7lukVv+Us9/SoBPiJLbWuf+bFfshPWTFMr5R7xIzK9pZGWho
         z4XnaZl/xusIY32QSJqlYPKzrigxQB0hmUtS0fURmH3drq2044GO/XY2oGmBd+MrE24k
         8Z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722353188; x=1722957988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M63Oa1BfPUNhQUg3syb0rS09F40f1hdoSF46AIqibkU=;
        b=MkBHLGJDHck6tg0PoxY3jpQd1fRbNcoF9NKBAJADEprpV6FtYj6aPBQk0/YOIOI+a1
         4CEf5SzvFd3whqCK15avsJ+9bj30QsSJWRJKQxiDILLNVRWBC6Se1PFgsqf/jwHvuYjt
         UlUP3yFhNjYdPtbnJs4sPh8sx0YD0OjeOtuBt/C+7Nh/SjfFImISDGnpo5NL8aHp7chX
         0nI7RjxkOTHEf/ZL7BnJk4BEsEpWZWzvoodBfNVc7NnahGqCJR/3WZAtyanofZRwOj2y
         GiKNVc8WS+SvX1x6nIvEr4fINtgjbaekM/a7hs+DsfuQtIEVa6SyI06GcLZUYLTM1pM/
         mevA==
X-Gm-Message-State: AOJu0Yxys+It8EzZUFP4px5fm99wEfU32EZHXbHq6l2IZez+ygfanqvy
	vkQVnUvSGtL2uy4o7iRxqtQ5O9zEzaYIi375sbf9Vv66bWpjCJualPuzQYq7E8gc1N3Yg32meZr
	DUOrjfaNf5L3MQh04OhiKZjz1pJQ=
X-Google-Smtp-Source: AGHT+IEf7scS+xYogegDreifoTDKcM8of/mn32tvimYBpG3eGkSekNtT7qnMx3Wmx7fYZ4i+exi2/j3qwoXonNiZmfk=
X-Received: by 2002:a05:6102:440e:b0:494:383b:c0d0 with SMTP id
 ada2fe7eead31-494383bcad1mr1868360137.2.1722353188036; Tue, 30 Jul 2024
 08:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <CANPvuRnxWrsgMA+be0asr4wFQ+L3mfYUn06ZsqY3LnwVqLgMnQ@mail.gmail.com>
 <22372.1722341730427474245@lists.openembedded.org>
In-Reply-To: <22372.1722341730427474245@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 30 Jul 2024 16:26:16 +0100
Message-ID: <CANPvuRmgCTTX1KtTo2iEvAK1bSFFRQDQpjKv6aNupkEswTzWhw@mail.gmail.com>
Subject: Re: [oe] [meta-oe,scarthgap][PATCH] libftdi: Fix missing ftdi_eeprom
To: przemyslaw.zegan@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f3684e061e78997c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jul 2024 15:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111482

--000000000000f3684e061e78997c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Przemyslaw Zegan via lists.openembedded.org <przemyslaw.zegan=3D
gmail.com@lists.openembedded.org> escreveu (ter=C3=A7a, 30/07/2024 =C3=A0(s=
) 13:15):

> In the following configuration as you suggested, ftdi-eeprom option is
> still explicitly enabled in libftdi package, which is a bit confusing.
>

Sometimes bitbake is a little confusing but this is the way it works you
can inspect the packages produced using the following:

# this will build the ftdi-eeprom tool provided by the libftdi project
echo 'PACKAGECONFIG:pn-libftdi =3D "ftdi-eeprom"' >> conf/local.conf

# this will build the package
bitbake libftdi -f -c do_package

# with this you can inspect the packages produced by bitbake as well as its
content:
tree tmp/work/*/libftdi/*/packages-split

# and with this you install the package from the above options on the image
echo 'IMAGE_INSTALL:append =3D " ftdi-eeprom"' >> conf/local.conf


Everything you need is already there, just choose the right one.

Jose

IMAGE_INSTALL:append =3D " ftdi-eeprom"
> PACKAGECONFIG:pn-libftdi =3D "ftdi-eeprom"
>
> Once you apply my patch, you can either select libftdi as a separate
> package or explicitly add the ftdi-eeprom option:
> IMAGE_INSTALL:append =3D " libftdi"
> PACKAGECONFIG:pn-libftdi =3D "ftdi-eeprom"
>
> Przemyslaw Zegan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111480):
> https://lists.openembedded.org/g/openembedded-devel/message/111480
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

--000000000000f3684e061e78997c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Przemyslaw Zegan via <a href=3D"http:=
//lists.openembedded.org">lists.openembedded.org</a> &lt;przemyslaw.zegan=
=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.open=
embedded.org</a>&gt; escreveu (ter=C3=A7a, 30/07/2024 =C3=A0(s) 13:15):<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
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
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#111480): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/111480" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/111480</a><br>
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

--000000000000f3684e061e78997c--

