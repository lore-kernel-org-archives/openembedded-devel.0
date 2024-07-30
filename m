Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A9FC3DA49
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 11:19:09 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web10.15150.1722338349335401779
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jul 2024 04:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JHvp6s9Q;
 spf=pass (domain: gmail.com, ip: 209.85.221.171, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4f6b8b7d85bso1556616e0c.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jul 2024 04:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722338348; x=1722943148; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gaKjRcGdWHdXa0BrgnD3284Vhd26ds39uCVgpJ8zm20=;
        b=JHvp6s9QKy2SsPV3sGuU3sM3RxUfQFHCJ9eZSObhhKnSpDp5+Nda7E+N5ZrigR+WHN
         e+mBcAT4Uj4A+/fblSFwSN0f9gJCNHr8ejqoPUOJy+DX2EhFbKLlSBroujoQhv83Ltul
         +0+cb4Gj6ulxlPv2F3CgCDHt0bl2G+4ewSc7vUor+QcPmrlkvLs2lg2UPACfP9cfLcnA
         qELC1+GTMGcWkQsLzdasyMHWC1+DBzztgX38/viHOOH/h1DfREEd/cU3FvufKmzpeOc5
         md90NRa4DOTq/fpKUNjlxI7a5HM+EwBi7fYcKiL+duJEogX/Tm4gXi+zxo6oAMOrUE0F
         Ri8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722338348; x=1722943148;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gaKjRcGdWHdXa0BrgnD3284Vhd26ds39uCVgpJ8zm20=;
        b=oDa75I+CcSKPy41sTzRPyC1r4aaWBlHXa4bA73boQevSoplkQQ5qwMcEbgZwPv/OgT
         MgUc/2i+fJ4CkqwOEfzKPKOx2lLx4wqgl7rQKz5DeDhTtA06nLhHYxcIe+I1Gz8nDckm
         xwI5sCbeEuGMJNEiFgO4YpsqcaUbaJXSJKY+XB33bkvs9jN338s+5wYe/RHwLQ/7tj+b
         wYDcMovBn23HjDnuCp6muiPdd8GGzNPdqLmfYyGwWrSWX4vNd7TV41YUA9Bswu65Ax4c
         zd9VYGgz8HKcCYb+N+ARuwesAeMRdVbdTvE06rvnOc/+MDTWiK5MnHCPaKDQHGCLo+35
         icZw==
X-Gm-Message-State: AOJu0YyBcboMbKdSU74Xh7LEz/hcyDRCNcjm+tkL+cFhO6q7iBkefQN1
	N/ItJnB2bJVNQ3nSshAWzoNHeswAbmnZRYx2LYyBxyJC2TEr9Bzt+vEQ50Q6v3ra/QhQ8t0Mern
	uz0O2RwcbfeIfFMPSaMhzwZNpJcw=
X-Google-Smtp-Source: AGHT+IGT3pCK8Lj6RBe8Yvi5ROdmxNVdYtHRtmiWBh3c1WBC3kCQKPdXBPRZ3RAom3Vfh8X0BoQnSqD+fJxMaUsrTGo=
X-Received: by 2002:a05:6102:3589:b0:492:9e3a:9f48 with SMTP id
 ada2fe7eead31-493fa2ef4f6mr12756872137.2.1722338348102; Tue, 30 Jul 2024
 04:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <CANPvuRk-ty2q93DyYhke9iAK+1MU5AUk6h4Qj4AdGpdpyEwPnw@mail.gmail.com>
 <10204.1722337357143129339@lists.openembedded.org>
In-Reply-To: <10204.1722337357143129339@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 30 Jul 2024 12:18:56 +0100
Message-ID: <CANPvuRnxWrsgMA+be0asr4wFQ+L3mfYUn06ZsqY3LnwVqLgMnQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe,scarthgap][PATCH] libftdi: Fix missing ftdi_eeprom
To: przemyslaw.zegan@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006bfee0061e752537"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jul 2024 11:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111479

--0000000000006bfee0061e752537
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Przemyslaw Zegan via lists.openembedded.org <przemyslaw.zegan=3D
gmail.com@lists.openembedded.org> escreveu (ter=C3=A7a, 30/07/2024 =C3=A0(s=
) 12:02):

> Hi,
>
> Package ftdi-eeprom does not exist separate, it is part of libftdi packag=
e.
> My configuration in local.conf:
> IMAGE_INSTALL:append =3D " libftdi"
>

The problem is there ^
To install the ftdi-eeprom binary on the target you need to use:

IMAGE_INSTALL:append =3D " ftdi-eeprom"
PACKAGECONFIG:pn-libftdi =3D "ftdi-eeprom"

Can you please try that?

Jose

PACKAGECONFIG:pn-libftdi =3D "ftdi-eeprom"
>
> This patch does not make ftdi_eeprom install by default.
> Second line in my configuration enables this feature, if you remove this
> line ftdi_eeprom will not be build and place in the generated image.
>
> Przemyslaw Zegan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111478):
> https://lists.openembedded.org/g/openembedded-devel/message/111478
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

--0000000000006bfee0061e752537
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Przemyslaw Zegan via <a href=3D"http:=
//lists.openembedded.org">lists.openembedded.org</a> &lt;przemyslaw.zegan=
=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.open=
embedded.org</a>&gt; escreveu (ter=C3=A7a, 30/07/2024 =C3=A0(s) 12:02):<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
<div>Hi,</div>
<div>=C2=A0</div>
<div>Package ftdi-eeprom does not exist separate, it is part of libftdi pac=
kage.<br>My configuration in local.conf:<br>IMAGE_INSTALL:append =3D &quot;=
 libftdi&quot;<br></div></div></blockquote><div><br></div><div>The problem =
is there ^</div><div>To install the ftdi-eeprom binary on the target you ne=
ed to=C2=A0use:<br><br></div><div>IMAGE_INSTALL:append =3D &quot; ftdi-eepr=
om&quot;<br></div><div>PACKAGECONFIG:pn-libftdi =3D &quot;ftdi-eeprom&quot;=
</div><div>=C2=A0</div><div>Can you please try that?<br><br>Jose<br><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div>PACKAGECONFI=
G:pn-libftdi =3D &quot;ftdi-eeprom&quot;</div>
<div>=C2=A0</div>
<div>This patch does not make ftdi_eeprom install by default.<br>Second lin=
e in my configuration enables this feature, if you remove this line ftdi_ee=
prom will not be build and place in the generated image.</div>
<div><br>Przemyslaw Zegan</div>
</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#111478): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/111478" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/111478</a><br>
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

--0000000000006bfee0061e752537--

