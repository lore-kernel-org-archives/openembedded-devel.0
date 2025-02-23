Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551B4C021B3
	for <webhook@archiver.kernel.org>; Sun, 23 Feb 2025 06:58:58 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.62690.1740293935004820117
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Feb 2025 22:58:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VE/XXYAW;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-72722d2717aso952924a34.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Feb 2025 22:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740293934; x=1740898734; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+TxXI72JT6kIQrqMM1r+4u5N7jb2kzpOXEQu7761eSk=;
        b=VE/XXYAWPvMnbAAoONBG4fWnlVOmC7wCAe9hcffR5t/7Z4RsdAxVL/ZKT8A82Fq/kT
         MhKUiLxfbPIXhcWNuK1EjnKOUFFnPQ758arf3P1AJ1PEKifr59Qdm4Y6S+gqXZywXgEq
         zzoSIGjUM8B42eOiqXwsAaM2riavbD94kiUG5Qu9PeJk3vKhDXZWKaKwJQLGNjQtmR1C
         21KrTHRu4/z+mP2JFwz4Dphtzr/H/FplD4YbUHXcayCR3/y6taipvuXSsfGdmjhTG65n
         7qDAyOy707GMIJGcqKR7T6ZUZH0E15myABA+r+jyrRpJHdJVcDoSqguATTCDCkpTEm6e
         W+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740293934; x=1740898734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+TxXI72JT6kIQrqMM1r+4u5N7jb2kzpOXEQu7761eSk=;
        b=bmF+880UhvnZCFixW6+xh3ReufFIabDtEjk5umZHgXAwtxz7Amt0+gUw8Sq28/HdE9
         J2G0SKvYfVor7/3O/z6oYqUbTXl77ZJGyBx/rvQ8uMmUKXFskwgcd6Q/wXnrAH/KTMvE
         ohsZ4fn3wSAdDtNuR59qqhFIMUXkE/47LWbLt/m9ka8BgfcBLlV8R9GSGM6CY/VXVar1
         pNHrL2+aRKdn/JWHyM0axtoomFm9Grkhh5TYcysmMM5RU9BrcTw74roweHoMSLM1t3hD
         rstQgsCp/rmbKhLW/EJGfdDIPQsXqtx32CtA3vGNsc3Tjd3sxlkJ75T7j63RdouI9ra3
         pEFw==
X-Gm-Message-State: AOJu0YynP/opzzSIFZbJTx3hLkzkXXiWu2hGnVh7hhRuZ+QIPyd7BZf/
	ItwEwG8MH2O8PtBPYiNoSdwhJQb9WcBChjcbNU7eUk66gPrrzYEr+5nmfdeLjIHtWooHswZcv4N
	3n9kOhtSL3B/28p37lxn7zR0ijhjC2LFF
X-Gm-Gg: ASbGncvD+x4+TH8zIO/xSklIirs2Vtl2l6SzLfMcf5dj3gurx9sh2AEYl/72/ME47wB
	mFaTfULttc8M6Fz9XHCnugFZZUd9SH2SWwaxqZ5pA68HzkWQta/vT2CI7jH8tfp1RMb9L6iSRvP
	uQscBwWb3qd/YhHVSEaY9IxF91JiffwdOL2F/SL8q4
X-Google-Smtp-Source: AGHT+IE2b+7miTWNQgUkFRd7auDqMprSSNgOUQt++ZUOzoUyNRXIUCgOflWU4Dqw+J3DYW97i5YXvRTKMLR6zn7FYrA=
X-Received: by 2002:a05:6808:201d:b0:3f4:16ab:934b with SMTP id
 5614622812f47-3f42468a62emr6546702b6e.6.1740293934029; Sat, 22 Feb 2025
 22:58:54 -0800 (PST)
MIME-Version: 1.0
References: <20250222170033.1061080-1-raj.khem@gmail.com> <12863.1740292229667605093@lists.openembedded.org>
In-Reply-To: <12863.1740292229667605093@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Feb 2025 22:58:42 -0800
X-Gm-Features: AWEUYZn6cCVaLX-0-h2NifOzmux0F7hxOGQObLNP92F1GHhsDYndZ43061LJybQ
Message-ID: <CAMKF1sr5_pemR2VogAwgbopYDudLSvi0Yvy4dYX4eydVndOjFA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] gphoto: Fix the sed expression to remove
 --sysroot from config.h
To: hieu2.nguyen@lge.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000be23a2062ec9c16c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Feb 2025 06:58:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115544

--000000000000be23a2062ec9c16c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 22, 2025 at 10:30=E2=80=AFPM Hieu Van Nguyen via lists.openembe=
dded.org
<hieu2.nguyen=3Dlge.com@lists.openembedded.org> wrote:

> Hi Khem Raj,
>
> I want to ask If --sysroot=3D empty, what does it affect? Does it cause a=
ny
> build/runtime errors?
>

Yes it causes errors because it also deletes terminating quote character of
BUILD_CC String


> I just want to know to backport your patch to our layers.
> and do you plan to backport this patch to Scarthgap and Styhead?
>

I am not planning to but if you need to then test it there and send a
backport patch


> Thanks.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115543):
> https://lists.openembedded.org/g/openembedded-devel/message/115543
> Mute This Topic: https://lists.openembedded.org/mt/111328249/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000be23a2062ec9c16c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 22, 2025 at 10:30=E2=80=AFP=
M Hieu Van Nguyen via <a href=3D"http://lists.openembedded.org">lists.opene=
mbedded.org</a> &lt;hieu2.nguyen=3D<a href=3D"mailto:lge.com@lists.openembe=
dded.org">lge.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204=
,204)"><div>Hi Khem Raj,<br><br>I want to ask If --sysroot=3D empty, what d=
oes it affect? Does it cause any build/runtime errors?</div></blockquote><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Yes it causes errors because it=
 also deletes terminating quote character of BUILD_CC String=C2=A0</div><di=
v dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-lef=
t:1ex;border-left-color:rgb(204,204,204)"><div dir=3D"auto"><br>I just want=
 to know to backport your patch to our layers.<br>and do you plan to backpo=
rt this patch to Scarthgap and Styhead?<br></div></blockquote><div dir=3D"a=
uto"><br></div><div dir=3D"auto">I am not planning to but if you need to th=
en test it there and send a backport patch</div><div dir=3D"auto"><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:=
rgb(204,204,204)"><div dir=3D"auto"><br>Thanks.</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#115543): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/115543" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/115543</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111328249/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111328249/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000be23a2062ec9c16c--

