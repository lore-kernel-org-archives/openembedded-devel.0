Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097DACCFA00
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 16:02:39 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.19396.1761926551439817578
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Oct 2025 09:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KPSgO0Ni;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b4f323cf89bso558043766b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 09:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761926550; x=1762531350; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qi/GjsuEoZVvuCfsEz7bllkFJAC26XtQwtoW6+ie9PQ=;
        b=KPSgO0Ni3GcHlYDrUudkUsx/kn6KZJsDfohdxdZao4klGxQ5Ph/2PYu6WYzAdpgOhO
         TQL5Z11oANiT3Pv9NIVwAm/OEH4Px+h0NS16V+PrhdOWzZ13SDjsWoTnZhiG1ZrIvoKI
         jYTBgAMzU9K1tCEWAKjiwip+pAZtEzsOpz8/bPikMbZ4LjJoxAaPRUrtcbnqSAFQg4jX
         7eVKavMYigLtBBW3EPjh6RjLkt8zSQz4P6iky7sWOEiT1/LjeFVPlX8boCZVlQrGrom3
         7himBaWnUe0JK+MeoLMZByOMUnAPjmEK8BCLOyFp4VtMro6YsmA0Tj/566zU7Ikq64to
         OtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761926550; x=1762531350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qi/GjsuEoZVvuCfsEz7bllkFJAC26XtQwtoW6+ie9PQ=;
        b=Mb4cvHFxpxY6Te8/HcRQahRHhbg2flENCGOA05x/F95jbCQBnowIg7t7LOERhvcck8
         pZr0jWVUtQzzfgaFYc0qcGiEht6gwE6RdDRTg5Kb9n15+MiCuZpLkRyWm8t/kZ9FAmoo
         rwgmDQ7pnCLUXJYizivQb2aCALGJRaDtZywNqhFAnjF2gDB3o6Vu76WmxxCL2EfkYnWr
         RDW3o/WQOTHtFNKiGtSCkX5N+NYluRy0gaFa4GTInAJvBpYREgHq2uCGX32LyRWDw7gZ
         pz1kAl/giTWX4NZpDzLqg7xE9aHBgyEDVAPmJ4PhzV3qbKV0//sDwbvR7WT+HQlYnfEP
         O1Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWyn18B8K0Nazy+tytVfF/CPIVE3gjoc67bt3rvnrN32STTr3y+0LghGk/FAVp3hnC5uuhN1aehQMY2DyA426qoyIE=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyu1mOI3JSIrNwJ32cwVZqqBEgd5VzBOR1TaRaJXXMTQU05akmn
	U4E0HsRtcqU9fMmw3m7EfFo087ygcynCYPd/aV0idesjcsM7CwC8oDJYf8xLV9p3sR0/EzUTzfz
	i5/avg+qnzfztMBgZFJvQ9WdxhkiOD0g=
X-Gm-Gg: ASbGnctQ/UlNTBQIUwyy2CylOJRiViz3MFRWQioPQkY5fWTZ+9JudcbA/qhfVQAgckm
	CD6qog7IpqV0ulzxH1VV7xMZ5+WWRwIm4WREFb+wvfrgoVL64UDxzWETZ2VU7U1xCN+t7nlylNA
	EkXvki1KfFf5UaXnspYFAdAMhHHFfK5pFESU2AGWXegSc9j+m3VHftSd82h1G+c66iE7FMbLCck
	Gb1ZtwBRA4APD4cxL5ISoMjzzPIkFuYqIU+KUdmR/nXKPt95nPC7yVWjH2ngK9KNmbDSSgM
X-Google-Smtp-Source: AGHT+IFg/AOB+VenDfxE2N12AA2JI5nyG0kR+o/dNeXU+n9LN2zLmmTxcWo/bFIxdIMMKKhYmG4C6Ck3m5Xg53DM9MY=
X-Received: by 2002:a17:907:3d4f:b0:b70:6d3a:a08b with SMTP id
 a640c23a62f3a-b70700ad4dfmr446361766b.10.1761926548995; Fri, 31 Oct 2025
 09:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20251023144351.264756-1-skandigraun@gmail.com>
 <4248C252-5AC4-4D04-B9D6-B71509890D3A@arm.com> <CAMSfU+5oOg4FyOa6+BEz2ci2+4wVhXXg=9CVB63XQJEN88j2eA@mail.gmail.com>
 <48C3D497-F482-45F5-9A57-919781B6505D@arm.com> <CANPvuRmTRHQRMrHSzRE=TunPOSAnKqn9Y5O7FW7EwKm_Cg--Mg@mail.gmail.com>
 <CAMSfU+4+sTGafvD8N7v7d=H7UquJDY7YmxJUxUuMd_71en=Kgg@mail.gmail.com>
In-Reply-To: <CAMSfU+4+sTGafvD8N7v7d=H7UquJDY7YmxJUxUuMd_71en=Kgg@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 31 Oct 2025 16:02:17 +0000
X-Gm-Features: AWmQ_bnhdh-jjTYPKtIMr9w2tmGPUDsBm--dbU7cV4lV25pHVxm47cifjrc7jPk
Message-ID: <CANPvuRk5F3KYK2sxZJb3pxNzBixmdPd3w1=T=1VW-TmqhEieGg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] psqlodbc: upgrade 16.00.0000 -> 17.00.0006
To: Yoann Congal <yoann.congal@smile.fr>
Cc: Ross Burton <ross.burton@arm.com>, Gyorgy Sarvari <skandigraun@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000012de390642767e30"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 16:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121241

--00000000000012de390642767e30
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yoann Congal <yoann.congal@smile.fr> escreveu (sexta, 31/10/2025 =C3=A0(s)
15:49):

>
>
>
> Le ven. 31 oct. 2025 =C3=A0 16:22, Jose Quaresma <quaresma.jose@gmail.com=
> a
> =C3=A9crit :
>
>>
>>
>> Ross Burton via lists.openembedded.org <ross.burton=3D
>> arm.com@lists.openembedded.org> escreveu (sexta, 31/10/2025 =C3=A0(s) 14=
:20):
>>
>>> On 31 Oct 2025, at 13:45, Yoann Congal <yoann.congal@smile.fr> wrote:
>>> > Nice catch, this is most likely what did break the meta-oe-mirror tes=
t
>>> :
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/494/=
steps/17/logs/errors
>>>
>>> Yes, it would be.
>>>
>>> > Maybe we need to add a recipe qa warning about this=E2=80=A6
>>>
>>> Agreed. I discovered this when adding a =E2=80=9CBB_NO_NETWORK=3D1 bitb=
ake
>>> =E2=80=94parse-only=E2=80=9D stage to our CI, because one of our recipe=
s was using a named
>>> tag too.
>>>
>>
>> Would it make sense to implement something like this on
>> the yocto-check-layer?
>>
>
> Sounds like a good idea to me. I'll add it to the ticket.
>
> If I recall correctly, check-layer is a superset of qa checks so adding i=
t
> there should not be too hard.
>

There are already functions check_command on the
scripts/lib/checklayer/__init__.py, so I think it's simple to implement.
I can take a look at this next week.

Jose


>
>
>
>> Jose
>>
>>
>>> Ross
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#121235):
>>> https://lists.openembedded.org/g/openembedded-devel/message/121235
>>> Mute This Topic: https://lists.openembedded.org/mt/115911777/5052612
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
>>> quaresma.jose@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>
>>
>> --
>> Best regards,
>>
>> Jos=C3=A9 Quaresma
>>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000012de390642767e30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Yoann Congal &l=
t;<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt; es=
creveu (sexta, 31/10/2025 =C3=A0(s) 15:49):<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"auto"><div><br><br><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le ven. 31 oct. 2025=
 =C3=A0 16:22, Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">Ross Burton via <a href=3D"http://lists.openembedded.org"=
 rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> &lt;ross.b=
urton=3D<a href=3D"mailto:arm.com@lists.openembedded.org" rel=3D"noreferrer=
" target=3D"_blank">arm.com@lists.openembedded.org</a>&gt; escreveu (sexta,=
 31/10/2025 =C3=A0(s) 14:20):<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On 31 Oct 2025, at 13:45, Yoann Congal &lt;<a href=3D"mailto:=
yoann.congal@smile.fr" rel=3D"noreferrer" target=3D"_blank">yoann.congal@sm=
ile.fr</a>&gt; wrote:<br>
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
<div><br></div><div>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto"><br></div><div di=
r=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gma=
il_quote"><div><br></div><div>Jose</div><div><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
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
d.org" rel=3D"noreferrer" target=3D"_blank">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose=
@gmail.com" rel=3D"noreferrer" target=3D"_blank">quaresma.jose@gmail.com</a=
>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
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

--00000000000012de390642767e30--

