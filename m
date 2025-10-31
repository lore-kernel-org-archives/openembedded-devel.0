Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F168ECCFA00
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 15:49:38 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.19011.1761925776626534868
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Oct 2025 08:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gYIGt1OI;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-429b9b6ce96so1376873f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 08:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1761925775; x=1762530575; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WrH5ApMdYmKOpoFvlAjwq4hS/uW05Fi3QyhP7HD7ViQ=;
        b=gYIGt1OI7Tisk+FcgbvjmfOR6LHL9Nr2xTd1fTW8aRSsQAvjBy8o13c3AC2SH7UPeK
         79SP7JjWdzKYFMHSuaCSI+ehy8yISMuuyHlIwz1N1UAIo8qwnthnRW7q5jn/+WekuUnW
         /EQi96Fe1vz1RozsPOMNpOiofqgGyobY7ciN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761925775; x=1762530575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WrH5ApMdYmKOpoFvlAjwq4hS/uW05Fi3QyhP7HD7ViQ=;
        b=Q5m3qUczz9uiBaGNF33tNUzjmzvwm6Bvsa1G+bzV9E8kdy7r0tT2A1MkxILSRFc9tD
         eUxteVFalMlDTlnD7hvGzdoPiyrG2BK0Ur+1j74J6Um0hD/5/E9NzazY1suExyi2POAG
         0c3/bLDeL4SEHu0IbwR99/3DQctEny5GfPOvCW5Dy/5kgyWK2chzm7TED2AZA7tn+5aq
         cwFxm96c6LE3Z/ebGUucYjKUJmhrbC/y9kbON4jpiXYDHaM2so1LRflOoNRK+4WABDbB
         GGm3EFbyTjpZirnT3iUk8Dg8I4j7sfPBa6AOjmrUkfu1c5hnQ8vgfKuV/Ow8J+04qiRN
         q9nQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6DhfF3lYdYxNvt3AhJOwFmJt9dVP8IneZMcGfvDuCOcIE6eNip/qLN7WAhsAkGyD7UjRvlEEX3NA1dmUS7Qo46Lg=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw6tiPm66Cto+RSLjMqPmPRJKVCWjfQRsqBScr2Oj3NrB+mhwnQ
	+4JWVqo/XEZ5WxJvwbUfKhGgwrMbwECjMbrA6QLJrtB8v7WRJJZxbuZLTWckdvZgeQuVmFrgAoP
	Iw9yxTbtqrqnRLvYDGvpNehkW6+/4vHpyL+1kDv3YMg==
X-Gm-Gg: ASbGncvrZ31yaG1KoLUZ7lTEr7viYjDLaen8wlzfP3wGczpvCFpC3Rk+1t7cHUawJFb
	1yPxER8cGVEHem1EY1murDuUjDwNXc5HQ6AbUPaZueVMNn8z3VB99XA+fx/ytNOmZX4CuESOMhF
	gxUQDX78JToB7Ep2+TvvyJ7pBEjh9TAq88DLfHSMqnKfIa+x3fkY2Inmcsj/TvTQToAmLNihOW0
	7DhtiHYSaWFNRevxZP23HXI8H8HrEH01WwS1CvdYbbg0m67jEykk4KX6dMpsNLotakcCRcD
X-Google-Smtp-Source: AGHT+IEhdmvGNsCt59XaciAvQH6veajxhGiG6jFjKDh6wzPuIRYdC4yYkBkXf9kl+T0UcIzz6YBl45SKv5Sr++py1x8=
X-Received: by 2002:a05:6000:659:10b0:429:c1f8:e0b8 with SMTP id
 ffacd0b85a97d-429c1f8e665mr2229395f8f.38.1761925774858; Fri, 31 Oct 2025
 08:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20251023144351.264756-1-skandigraun@gmail.com>
 <4248C252-5AC4-4D04-B9D6-B71509890D3A@arm.com> <CAMSfU+5oOg4FyOa6+BEz2ci2+4wVhXXg=9CVB63XQJEN88j2eA@mail.gmail.com>
 <48C3D497-F482-45F5-9A57-919781B6505D@arm.com> <CANPvuRmTRHQRMrHSzRE=TunPOSAnKqn9Y5O7FW7EwKm_Cg--Mg@mail.gmail.com>
In-Reply-To: <CANPvuRmTRHQRMrHSzRE=TunPOSAnKqn9Y5O7FW7EwKm_Cg--Mg@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 31 Oct 2025 16:49:22 +0100
X-Gm-Features: AWmQ_blkA11BQpICeTqaOAWEA2WnHMHUuwcJcIVchkZW7On002GNehnaNDwfSx4
Message-ID: <CAMSfU+4+sTGafvD8N7v7d=H7UquJDY7YmxJUxUuMd_71en=Kgg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] psqlodbc: upgrade 16.00.0000 -> 17.00.0006
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>, Gyorgy Sarvari <skandigraun@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ee71780642764f3d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 15:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121240

--000000000000ee71780642764f3d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 31 oct. 2025 =C3=A0 16:22, Jose Quaresma <quaresma.jose@gmail.com> =
a
=C3=A9crit :

>
>
> Ross Burton via lists.openembedded.org <ross.burton=3D
> arm.com@lists.openembedded.org> escreveu (sexta, 31/10/2025 =C3=A0(s) 14:=
20):
>
>> On 31 Oct 2025, at 13:45, Yoann Congal <yoann.congal@smile.fr> wrote:
>> > Nice catch, this is most likely what did break the meta-oe-mirror test
>> :
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/494/s=
teps/17/logs/errors
>>
>> Yes, it would be.
>>
>> > Maybe we need to add a recipe qa warning about this=E2=80=A6
>>
>> Agreed. I discovered this when adding a =E2=80=9CBB_NO_NETWORK=3D1 bitba=
ke
>> =E2=80=94parse-only=E2=80=9D stage to our CI, because one of our recipes=
 was using a named
>> tag too.
>>
>
> Would it make sense to implement something like this on
> the yocto-check-layer?
>

Sounds like a good idea to me. I'll add it to the ticket.

If I recall correctly, check-layer is a superset of qa checks so adding it
there should not be too hard.



> Jose
>
>
>> Ross
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#121235):
>> https://lists.openembedded.org/g/openembedded-devel/message/121235
>> Mute This Topic: https://lists.openembedded.org/mt/115911777/5052612
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> quaresma.jose@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>

--000000000000ee71780642764f3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">Le ven. 31 oct. 2025 =C3=A0 =
16:22, Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com">quaresm=
a.jose@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Ross Bur=
ton via <a href=3D"http://lists.openembedded.org" target=3D"_blank" rel=3D"=
noreferrer">lists.openembedded.org</a> &lt;ross.burton=3D<a href=3D"mailto:=
arm.com@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">arm.co=
m@lists.openembedded.org</a>&gt; escreveu (sexta, 31/10/2025 =C3=A0(s) 14:2=
0):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 31 Oct 20=
25, at 13:45, Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>&gt; wrote:<br>
&gt; Nice catch, this is most likely what did break the meta-oe-mirror test=
 : <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/b=
uilds/494/steps/17/logs/errors" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/494=
/steps/17/logs/errors</a><br>
<br>
Yes, it would be.<br>
<br>
&gt; Maybe we need to add a recipe qa warning about this=E2=80=A6<br>
<br>
Agreed. I discovered this when adding a =E2=80=9CBB_NO_NETWORK=3D1 bitbake =
=E2=80=94parse-only=E2=80=9D stage to our CI, because one of our recipes wa=
s using a named tag too.<br></blockquote><div><br></div><div>Would it make =
sense to implement something like this on the=C2=A0yocto-check-layer?</div>=
</div></div></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Sounds like a good idea to me. I&#39;ll add it to the ticket.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">If I recall correctly, chec=
k-layer is a superset of qa checks so adding it there should not be too har=
d.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><div class=3D"gmail_quote gmail_quote_container"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><div><br></div><div>Jose</div><div><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
Ross<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121235): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121235" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/121235</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115911777/505=
2612" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/115911777/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose=
@gmail.com" target=3D"_blank" rel=3D"noreferrer">quaresma.jose@gmail.com</a=
>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>
</blockquote></div></div></div>

--000000000000ee71780642764f3d--

