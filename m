Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9631CCF9FE
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 15:22:58 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.18261.1761924175360196424
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Oct 2025 08:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a18dEhfy;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b6d855ca585so518660466b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 08:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761924174; x=1762528974; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3lnjzcohC1VmlQ+/kZw7mYwA4l7HxFrJlY5jWbhr9nQ=;
        b=a18dEhfy2W3R8eWn9PQTwTD4mF68CbjM4RGSQjJ7hxbTP6YjBiWXu7f8J9AvXfd3/O
         /EbL+U3rCFmfKmdWDDsYKItFmzQGJnVrqxarhjenMC+8szSIfYgjxzYgZn12aTv5Y2kI
         9GMSwsOp8qLX5PEGI/At44/lMox+YjihLd93rTCy+RddAFTN2IQgRbh0r2rMrT9mwwM/
         ZvVgRw18FcAQItSWDAks8GOm+27vdwHQidq5xnn4c7SvHrUj2u+UB9SCgk11CclqWQp9
         2TSxTHY+ClBF++tpTw8FUZUkoQ7W461q4a4xT7R1Af93FTWjs58/nGVK5mIuQ8f8ua2F
         JH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761924174; x=1762528974;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lnjzcohC1VmlQ+/kZw7mYwA4l7HxFrJlY5jWbhr9nQ=;
        b=ABflqGHnfHUHBRhBJOcSGSpJK0a5boNguadBRagTA/vY+EXvzWT1/Udy0UcPCiPdlX
         7jSYUxp+ZawOm3QbVW+owDV4yGulED01rnVvFNHGS9SdYxIfoEXG+qWHAXHTH89QinTX
         bfzv7Mm3BwRtJaXotsYUy8y5eGEWyNicTe45dT67IXJuGPWgEotXZ02JNBJ77vMkXpsC
         +3yI5+wsl1S2+MYVXu5fOQTeCA5ZwW37fafjTO7/CwV4tVVlNLu4e4O/TuNSs3gFi9qS
         z2Pd1gQx19s10LZVOMCduPXlwZ88RAEp2TqDlk18X4/GI5kEYQe3zirkQXi9a6atZcXm
         ilow==
X-Forwarded-Encrypted: i=1; AJvYcCXAUykZDRqiUONXFwGCFjNI75eVrH3K68wxASzKYkMW1yf/QuUM8liO4bwkx1+UUCvFhrnMOsQ1Am7YoGF6HfdR3QM=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy86PsU/S0FgRGIfC/K2zfm2q3P/PmhFY/TsivTRUabxCMgmg1x
	VeQYyguqcUf5giKLmnVqeFePLaBsIk88h6Bpnkp+Lm70wtP5mLPIVCjNRF+Pt6HeFRi7aMR52kz
	b0HkbBXcP0iaYoG1ftXhzzKNgV3egE1c=
X-Gm-Gg: ASbGncs5Q6a5DK5NIbxsR0SyOP1nqUja0KqJwqb8JOBZqrIzXRqxKeE4kNZMBZDlKqB
	8F+C5XvIZS7C2AMRpTRbxhpkqNxDikLEUdwtHjc8O7cKN4RUp/AV13zl+xHV/XQdJEELsxom7fZ
	kvilZqekkVLHNksDZBFlYdZb+Oea3RpSgAfzzMv/RguLZG6gLkESUKuCt1bzWCw7Go3y9J4lfm5
	zVo1aJ6L5HjCLoQEm0IBlObR1BK3VXkaE2GdvTxILSg5KtU/QXtsMP1eCwWaw==
X-Google-Smtp-Source: AGHT+IGwaFp5adG6niJPp5QtY0B9NMpmxLiSd1HLkNd4ZiuytNsnYTLx3gJnxa14zbelw1P4LARiaZHKx/D9WX5yQ0s=
X-Received: by 2002:a17:907:720e:b0:b6a:694e:472e with SMTP id
 a640c23a62f3a-b70700c7b2emr456471766b.12.1761924173267; Fri, 31 Oct 2025
 08:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20251023144351.264756-1-skandigraun@gmail.com>
 <4248C252-5AC4-4D04-B9D6-B71509890D3A@arm.com> <CAMSfU+5oOg4FyOa6+BEz2ci2+4wVhXXg=9CVB63XQJEN88j2eA@mail.gmail.com>
 <48C3D497-F482-45F5-9A57-919781B6505D@arm.com>
In-Reply-To: <48C3D497-F482-45F5-9A57-919781B6505D@arm.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 31 Oct 2025 15:22:40 +0000
X-Gm-Features: AWmQ_bmCUREJXxrcvQc2HAI5ZA_R2xkwZryvUCtVYkx7AMPfWKihiDvEw-VAFUo
Message-ID: <CANPvuRmTRHQRMrHSzRE=TunPOSAnKqn9Y5O7FW7EwKm_Cg--Mg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] psqlodbc: upgrade 16.00.0000 -> 17.00.0006
To: ross.burton@arm.com
Cc: Yoann Congal <yoann.congal@smile.fr>, Gyorgy Sarvari <skandigraun@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000078099a064275f0da"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 15:22:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121237

--00000000000078099a064275f0da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ross Burton via lists.openembedded.org <ross.burton=3D
arm.com@lists.openembedded.org> escreveu (sexta, 31/10/2025 =C3=A0(s) 14:20=
):

> On 31 Oct 2025, at 13:45, Yoann Congal <yoann.congal@smile.fr> wrote:
> > Nice catch, this is most likely what did break the meta-oe-mirror test =
:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/494/st=
eps/17/logs/errors
>
> Yes, it would be.
>
> > Maybe we need to add a recipe qa warning about this=E2=80=A6
>
> Agreed. I discovered this when adding a =E2=80=9CBB_NO_NETWORK=3D1 bitbak=
e
> =E2=80=94parse-only=E2=80=9D stage to our CI, because one of our recipes =
was using a named
> tag too.
>

Would it make sense to implement something like this on
the yocto-check-layer?

Jose


> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121235):
> https://lists.openembedded.org/g/openembedded-devel/message/121235
> Mute This Topic: https://lists.openembedded.org/mt/115911777/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000078099a064275f0da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Ross Burton via=
 <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;r=
oss.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.org">arm.com@list=
s.openembedded.org</a>&gt; escreveu (sexta, 31/10/2025 =C3=A0(s) 14:20):<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On 31 Oct 2025, at=
 13:45, Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=3D=
"_blank">yoann.congal@smile.fr</a>&gt; wrote:<br>
&gt; Nice catch, this is most likely what did break the meta-oe-mirror test=
 : <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/b=
uilds/494/steps/17/logs/errors" rel=3D"noreferrer" target=3D"_blank">https:=
//autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/494/steps/17/l=
ogs/errors</a><br>
<br>
Yes, it would be.<br>
<br>
&gt; Maybe we need to add a recipe qa warning about this=E2=80=A6<br>
<br>
Agreed. I discovered this when adding a =E2=80=9CBB_NO_NETWORK=3D1 bitbake =
=E2=80=94parse-only=E2=80=9D stage to our CI, because one of our recipes wa=
s using a named tag too.<br></blockquote><div><br></div><div>Would it make =
sense to implement something like this on the=C2=A0yocto-check-layer?</div>=
<div><br></div><div>Jose</div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
Ross<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121235): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121235" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121235</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115911777/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115911777/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--00000000000078099a064275f0da--

