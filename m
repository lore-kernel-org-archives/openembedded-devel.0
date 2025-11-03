Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8DDCCFA05
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 11:21:49 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18216.1762168902292551530
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Nov 2025 03:21:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IQmpAd6D;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b713c7096f9so92881066b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 03:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762168901; x=1762773701; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NUIBxP2ZIhRjIWHBy5WDxNvLoS+GQj84D1lG20VffTg=;
        b=IQmpAd6DFYaJw/SlfmldMjR6ZNmo4yEneSo7rzef3ZzYKiui90HMc7QN6KVxZXpiIe
         X9/noUMrPJo10h6CCC91lk3dl3zd3XRdS15DZzj+RwdlXzQyPrIxmbMUU0T7vzk9wQmB
         Fu80RdVcbzSOn0O+GcBhTSOc2MNMwbodR1xE3u21VtzYsXVxQqODH8+f2EuEyUiVrvWw
         AodDT2bYzI2vbpB9E3Q8VZf0eWd55GRq+MrRkjD6Kto2/0TjovXU0mij3YyFY/1ocgfE
         J9sK+iif2dzLGL9hJsvafZfAW2ksENCTjEhwmF07WB22Mm2hEIBa+MCEuIJdrsr+Almm
         AYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762168901; x=1762773701;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUIBxP2ZIhRjIWHBy5WDxNvLoS+GQj84D1lG20VffTg=;
        b=BkSKF+Luj4idnJ85056b7ZNUy8T8HJYpT9kkRk9vFvQFAawIQeuREyxWU5m9dpyk2T
         lWWrnyFOXlsLBbLEeoiBUWjJ3WrNrgeOu5dOjUZQtuZ2Tzb3uJsr382PuOgMNcK4TS/T
         +EChq+7pQ1rDHZeI5TxjPfYLXDD9v6BmhxkZuj14NZo01QsjuEk01YigBBqntEB6LGpW
         Apbhq2fXdcGz5Y7rCJFzjjLGwPeH151zwwjO0y/u97bxBRZRGwGvWYdItJ9fquR1cDQ6
         QkoPK9y/KYlrtMX7VQG1h5dUWuE4k+JiSPkQqmBwUFioUzshLrJb2h8OFpJAePme8Mn6
         l+WA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ/4uAbGQxW7AjTtMb9Ah9KxUoBdx/CDbY64IPoHbcrEVc40EYlDYzo+sP0QPuVg9p913z0exUHlQEHlRoLYA9NDc=@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywe/Rk4KI1flzCkY7meD9r28QGuROAYK32rOmcD7dDiNxU+XP0f
	LhlIlUtSyUSXg6tC/0EUL+MmVZESMRd6S7YhEIevfqAxCBl6kEgA1fAE6j/jNHPmU3PyAGnxOIr
	BOTVnXp2S7yT5ZPsMImu2xivluQZ9pi0=
X-Gm-Gg: ASbGncuSQKz6EXgPnymbWzkl7NfF0yXcXytFd3b51stDCbUjsUUhvbVGoUxXaEAWb4e
	sR2HXNIGYFaFp5a2+JRQcKmTS8Ku2qtv6VvEt/DvhaIL56aEgD8rFYxtEm2OofQk4YXoFesHWUp
	Wd8t+4GiZK1RqELSoXJdAEyZXyiwc7it7EVxmiqOocvtptjzzlU1WLTDJI6s6CIJPBuVbsd6SZl
	K4la6oFo1kMeEQE1JKsl8TFs+dIzDVDPoMChDyWNFkjWAz3dy14V2JZQUWjUmE+ekeFDgHP
X-Google-Smtp-Source: AGHT+IH26ye62TYUZavQBa1ko0kz8Y3jRwz1jngufuLo8wk1Zd+Q3wcbkaNeK0OIUOiqhpOPXhjTery0nODnaCVYubM=
X-Received: by 2002:a17:906:370f:b0:b70:b94c:7f4b with SMTP id
 a640c23a62f3a-b70b94c7fdfmr280013766b.41.1762168900412; Mon, 03 Nov 2025
 03:21:40 -0800 (PST)
MIME-Version: 1.0
References: <20251023144351.264756-1-skandigraun@gmail.com>
 <4248C252-5AC4-4D04-B9D6-B71509890D3A@arm.com> <CAMSfU+5oOg4FyOa6+BEz2ci2+4wVhXXg=9CVB63XQJEN88j2eA@mail.gmail.com>
 <48C3D497-F482-45F5-9A57-919781B6505D@arm.com> <CANPvuRmTRHQRMrHSzRE=TunPOSAnKqn9Y5O7FW7EwKm_Cg--Mg@mail.gmail.com>
 <CAMSfU+4+sTGafvD8N7v7d=H7UquJDY7YmxJUxUuMd_71en=Kgg@mail.gmail.com>
 <CANPvuRk5F3KYK2sxZJb3pxNzBixmdPd3w1=T=1VW-TmqhEieGg@mail.gmail.com> <CAMSfU+5heJQakGhGwxBsiq_qXmwMC-EMeN6cP6rL_wm-UDg3+Q@mail.gmail.com>
In-Reply-To: <CAMSfU+5heJQakGhGwxBsiq_qXmwMC-EMeN6cP6rL_wm-UDg3+Q@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 3 Nov 2025 11:21:29 +0000
X-Gm-Features: AWmQ_bm6wJE24__4bQHiHdBrU20sOMLOEMvASKGAxB2fRWzbNwbDkdTT79qggSg
Message-ID: <CANPvuRkRgxMDwiHfxYyqau+tbz_RXhLzK9iwQgSWOrMJ-B7UWA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] psqlodbc: upgrade 16.00.0000 -> 17.00.0006
To: Yoann Congal <yoann.congal@smile.fr>
Cc: Ross Burton <ross.burton@arm.com>, Gyorgy Sarvari <skandigraun@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000057eaf90642aeebdc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 11:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121269

--00000000000057eaf90642aeebdc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yoann Congal <yoann.congal@smile.fr> escreveu (sexta, 31/10/2025 =C3=A0(s)
18:19):

>
>
> Le ven. 31 oct. 2025 =C3=A0 17:02, Jose Quaresma via lists.openembedded.o=
rg
> <quaresma.jose=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
>
>>
>>
>> Yoann Congal <yoann.congal@smile.fr> escreveu (sexta, 31/10/2025 =C3=A0(=
s)
>> 15:49):
>>
>>>
>>>
>>>
>>> Le ven. 31 oct. 2025 =C3=A0 16:22, Jose Quaresma <quaresma.jose@gmail.c=
om> a
>>> =C3=A9crit :
>>>
>>>>
>>>>
>>>> Ross Burton via lists.openembedded.org <ross.burton=3D
>>>> arm.com@lists.openembedded.org> escreveu (sexta, 31/10/2025 =C3=A0(s)
>>>> 14:20):
>>>>
>>>>> On 31 Oct 2025, at 13:45, Yoann Congal <yoann.congal@smile.fr> wrote:
>>>>> > Nice catch, this is most likely what did break the meta-oe-mirror
>>>>> test :
>>>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/49=
4/steps/17/logs/errors
>>>>>
>>>>> Yes, it would be.
>>>>>
>>>>> > Maybe we need to add a recipe qa warning about this=E2=80=A6
>>>>>
>>>>> Agreed. I discovered this when adding a =E2=80=9CBB_NO_NETWORK=3D1 bi=
tbake
>>>>> =E2=80=94parse-only=E2=80=9D stage to our CI, because one of our reci=
pes was using a named
>>>>> tag too.
>>>>>
>>>>
>>>> Would it make sense to implement something like this on
>>>> the yocto-check-layer?
>>>>
>>>
>>> Sounds like a good idea to me. I'll add it to the ticket.
>>>
>>> If I recall correctly, check-layer is a superset of qa checks so adding
>>> it there should not be too hard.
>>>
>>
>> There are already functions check_command on the
>> scripts/lib/checklayer/__init__.py, so I think it's simple to implement.
>> I can take a look at this next week.
>>
>
> I was more thinking about adding a QA check outside of checklayer then
> adding it to CHECKLAYER_REQUIRED_TESTS. This way users can still benefit
> from the QA check without running checklayer (I would bet most users don'=
t).
> You can take https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16051 fr=
om
> me if you plan to work on this.
> Thanks!
>

Your approach is more appropriate than what I had in mind, so I'll leave
that for you to do.


>
>
>> Jose
>>
>>
>>>
>>>
>>>
>>>> Jose
>>>>
>>>>
>>>>> Ross
>>>>>
>>>>>
>>>>>
>>>>
>>>> --
>>>> Best regards,
>>>>
>>>> Jos=C3=A9 Quaresma
>>>>
>>>
>>
>> --
>> Best regards,
>>
>> Jos=C3=A9 Quaresma
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#121241):
>> https://lists.openembedded.org/g/openembedded-devel/message/121241
>> Mute This Topic: https://lists.openembedded.org/mt/115911777/4316185
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> yoann.congal@smile.fr]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>
> --
> Yoann Congal
> Smile ECS
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000057eaf90642aeebdc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Yoann Congal &l=
t;<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt; es=
creveu (sexta, 31/10/2025 =C3=A0(s) 18:19):<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0v=
en. 31 oct. 2025 =C3=A0=C2=A017:02, Jose Quaresma via <a href=3D"http://lis=
ts.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;quare=
sma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_b=
lank">gmail.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div di=
r=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>&gt; escreveu (sexta, 31/10/2025 =
=C3=A0(s) 15:49):<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"auto"><div><br><br><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">Le ven. 31 oct. 2025 =C3=A0 16:22, Jose Quaresma=
 &lt;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.=
jose@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Ross Burto=
n via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=
=3D"_blank">lists.openembedded.org</a> &lt;ross.burton=3D<a href=3D"mailto:=
arm.com@lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">arm.co=
m@lists.openembedded.org</a>&gt; escreveu (sexta, 31/10/2025 =C3=A0(s) 14:2=
0):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 31 Oct 20=
25, at 13:45, Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" rel=
=3D"noreferrer" target=3D"_blank">yoann.congal@smile.fr</a>&gt; wrote:<br>
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
=A0<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16051" ta=
rget=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16051</=
a> from me if you plan to work on this.</div><div>Thanks!</div></div></div>=
</blockquote><div><br></div><div>Your approach is more appropriate than wha=
t I had in mind, so I&#39;ll leave that for you to do.</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div c=
lass=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></div><div>Jo=
se</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"auto"><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><=
div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></d=
iv><div>Jose</div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
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
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--00000000000057eaf90642aeebdc--

