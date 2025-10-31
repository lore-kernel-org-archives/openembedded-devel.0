Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77313CCFA02
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 18:19:40 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.2234.1761934769908605131
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Oct 2025 11:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VwSaWb8T;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-429bcddad32so1065283f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 11:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1761934768; x=1762539568; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pMwrU9TY3gR/AnoY8Nube28UZcE1OefPFxFVP7X5isE=;
        b=VwSaWb8TPdFHWio4ZGeTFIyrpIbXv21FD3zwLVqQquF2OcH02FpA6YDCXSTp7MhW91
         TisYyzm1nLTmWEsKd45125Mzsxr6AT/9XghcQVJRY/8txYwbiv/yeKTg1qnklWGDqsAH
         hDRt/Tl5EU2M9VT/rF1rQBl91MW8eLjj4jvgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761934768; x=1762539568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pMwrU9TY3gR/AnoY8Nube28UZcE1OefPFxFVP7X5isE=;
        b=AAnL2njouT1TnSF79YBqX/Hqu992FEg+Udf/ryPtwmBNY3Ot3+mJGGWl5xtmFobuYv
         EZHNz8WYV6He3ZUMivL01VhagHtruZCHhKgrxR9fFbERKL3Z+g8LHkRhvodXkFkm6NO0
         fVoJPagxIH4F1cVbKpZAUUFUp4t3gA6u7E63DK5gBKFKo4AzeIg4dN/uym2CbezwjAHP
         h1pFriiktqiQDHUeNUWrYXvE1jglmzRC8ucFQGdci0LEUGKChEgPDx2EuO75LW8Wn92c
         xcfVb5MG1C0/zw306VFekDXI6RDTEcYXObR96BLReiPuW2wBSQjzKjNRcId5GTeraDK+
         DDIg==
X-Forwarded-Encrypted: i=1; AJvYcCU2UyoJSkV94fXkphGM3U2+LMywPU2NiZj8U3V9ExD63B5fWIHzVv2LaTfWVxTK1qrXiJLmuWs9C354PJ4xytYBZTk=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw1Kr6ysdxu0xD3aIbWX1p+4uhaGLPIDYqkJ89MKon6v0gLW2FB
	88rhWqnr9MSC7nUx8B0y+4YZBTtdfxm2G/1zdFP0RwlnwKbnDK3gyVWS/dOITE5r5S/m2D5WRzM
	pdbqfz/XhDOZGP1zgzAKJPOiJ7O7fZyjmcrenHSvfNw==
X-Gm-Gg: ASbGncsekFjarB9ej1TxtvpgLc3nU0CEbVaTbI0clG5BkzNo3BSwAKlgulZQWnY3Db5
	LGMb8sbQCcjhR47g69KHV3X0Zw/DXSdgBK5zPsCXIom/PKDON3Rax9Oot05ybqzsga+jQwrkG2T
	x6xR6ItPHMoLiSwoTAkVUJpaJd9uDsVOIDMDhhTvHr0Ks6Pqs70tOfic7X2mdPfw7A2oq7btIue
	ILRSm2qcEbyH3m4FdniM2YbvK0WhWzSNiaYNT3CUcxnvRKrj3tKxB0snCj2Jc3GdvuA39oSMxq7
	YLnumUWki6qURYufyCU=
X-Google-Smtp-Source: AGHT+IHvs4ZKkluaysJkvfnALlmHrL+Z8cZCK4//INATS5NoakWW2xq8sWAT4tp5E135XFAGWXTA0ChKRClTtuOh6gY=
X-Received: by 2002:a05:6000:186c:b0:3d1:8d1e:8e9 with SMTP id
 ffacd0b85a97d-429bd6a4c11mr4053161f8f.32.1761934768130; Fri, 31 Oct 2025
 11:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20251023144351.264756-1-skandigraun@gmail.com>
 <4248C252-5AC4-4D04-B9D6-B71509890D3A@arm.com> <CAMSfU+5oOg4FyOa6+BEz2ci2+4wVhXXg=9CVB63XQJEN88j2eA@mail.gmail.com>
 <48C3D497-F482-45F5-9A57-919781B6505D@arm.com> <CANPvuRmTRHQRMrHSzRE=TunPOSAnKqn9Y5O7FW7EwKm_Cg--Mg@mail.gmail.com>
 <CAMSfU+4+sTGafvD8N7v7d=H7UquJDY7YmxJUxUuMd_71en=Kgg@mail.gmail.com> <CANPvuRk5F3KYK2sxZJb3pxNzBixmdPd3w1=T=1VW-TmqhEieGg@mail.gmail.com>
In-Reply-To: <CANPvuRk5F3KYK2sxZJb3pxNzBixmdPd3w1=T=1VW-TmqhEieGg@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 31 Oct 2025 19:19:11 +0100
X-Gm-Features: AWmQ_bkQaDqPnFv1FtbDQWkV8Tewek6kKDa5HIF5Y9PuZD3WPJ5pBQdHtfvZplc
Message-ID: <CAMSfU+5heJQakGhGwxBsiq_qXmwMC-EMeN6cP6rL_wm-UDg3+Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] psqlodbc: upgrade 16.00.0000 -> 17.00.0006
To: quaresma.jose@gmail.com
Cc: Ross Burton <ross.burton@arm.com>, Gyorgy Sarvari <skandigraun@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f8dcd4064278676d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 18:19:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121243

--000000000000f8dcd4064278676d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 31 oct. 2025 =C3=A0 17:02, Jose Quaresma via lists.openembedded.org
<quaresma.jose=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

>
>
> Yoann Congal <yoann.congal@smile.fr> escreveu (sexta, 31/10/2025 =C3=A0(s=
)
> 15:49):
>
>>
>>
>>
>> Le ven. 31 oct. 2025 =C3=A0 16:22, Jose Quaresma <quaresma.jose@gmail.co=
m> a
>> =C3=A9crit :
>>
>>>
>>>
>>> Ross Burton via lists.openembedded.org <ross.burton=3D
>>> arm.com@lists.openembedded.org> escreveu (sexta, 31/10/2025 =C3=A0(s) 1=
4:20):
>>>
>>>> On 31 Oct 2025, at 13:45, Yoann Congal <yoann.congal@smile.fr> wrote:
>>>> > Nice catch, this is most likely what did break the meta-oe-mirror
>>>> test :
>>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/494=
/steps/17/logs/errors
>>>>
>>>> Yes, it would be.
>>>>
>>>> > Maybe we need to add a recipe qa warning about this=E2=80=A6
>>>>
>>>> Agreed. I discovered this when adding a =E2=80=9CBB_NO_NETWORK=3D1 bit=
bake
>>>> =E2=80=94parse-only=E2=80=9D stage to our CI, because one of our recip=
es was using a named
>>>> tag too.
>>>>
>>>
>>> Would it make sense to implement something like this on
>>> the yocto-check-layer?
>>>
>>
>> Sounds like a good idea to me. I'll add it to the ticket.
>>
>> If I recall correctly, check-layer is a superset of qa checks so adding
>> it there should not be too hard.
>>
>
> There are already functions check_command on the
> scripts/lib/checklayer/__init__.py, so I think it's simple to implement.
> I can take a look at this next week.
>

I was more thinking about adding a QA check outside of checklayer then
adding it to CHECKLAYER_REQUIRED_TESTS. This way users can still benefit
from the QA check without running checklayer (I would bet most users don't)=
.
You can take https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16051 from
me if you plan to work on this.
Thanks!


> Jose
>
>
>>
>>
>>
>>> Jose
>>>
>>>
>>>> Ross
>>>>
>>>>
>>>>
>>>
>>> --
>>> Best regards,
>>>
>>> Jos=C3=A9 Quaresma
>>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121241):
> https://lists.openembedded.org/g/openembedded-devel/message/121241
> Mute This Topic: https://lists.openembedded.org/mt/115911777/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000f8dcd4064278676d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 31=
 oct. 2025 =C3=A0=C2=A017:02, Jose Quaresma via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;quaresma.jose=3D<a href=3D"ma=
ilto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>=
&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Yoann Congal &lt;<a href=
=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</=
a>&gt; escreveu (sexta, 31/10/2025 =C3=A0(s) 15:49):<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><div><br><br><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le ven. 31 oc=
t. 2025 =C3=A0 16:22, Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gma=
il.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">Ross Burton via <a href=3D"http://lists.openembe=
dded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> &=
lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.org" rel=3D"n=
oreferrer" target=3D"_blank">arm.com@lists.openembedded.org</a>&gt; escreve=
u (sexta, 31/10/2025 =C3=A0(s) 14:20):<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On 31 Oct 2025, at 13:45, Yoann Congal &lt;<a href=
=3D"mailto:yoann.congal@smile.fr" rel=3D"noreferrer" target=3D"_blank">yoan=
n.congal@smile.fr</a>&gt; wrote:<br>
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
d.</div></div></blockquote><div><br></div><div>There are already functions =
check_command on the scripts/lib/checklayer/__init__.py, so I think it&#39;=
s simple to implement.</div><div>I can take a look at this next week.</div>=
</div></div></blockquote><div><br></div><div>I was more thinking about addi=
ng a QA check outside of checklayer then adding it to=C2=A0CHECKLAYER_REQUI=
RED_TESTS. This way users can still benefit from the QA check without runni=
ng checklayer (I would bet most users don&#39;t).</div><div>You can take=C2=
=A0<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16051">ht=
tps://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16051</a> from me if you =
plan to work on this.</div><div>Thanks!</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_q=
uote"><div></div><div>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto"><br></div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"g=
mail_quote"><div><br></div><div>Jose</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Ross<br>
<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>
</blockquote></div></div></div>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121241): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121241" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121241</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115911777/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115911777/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000f8dcd4064278676d--

