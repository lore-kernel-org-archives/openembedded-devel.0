Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF84BCDB479
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 02:44:45 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9628.1763088282156786059
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 18:44:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VTi8cEvU;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-78677ff31c2so13317257b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 18:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763088281; x=1763693081; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ogvgd635azPUz+WZ2ZBSyfGuvoqvFypd33I5RGDzDDo=;
        b=VTi8cEvUQxvYASjHh5/t1nsHgUT9Dm+9Ub5SehGp5IZGa7A+aHtukwd0sQqiJUjaS0
         unDXBiwf8rRYLaUPTB0J0xT7OaYKihwgI85gKsDSrTvPwXY0Ns1APpbeX+za0SUjPnoh
         bYWCnxh6WsKWUWm6yaFmX8aZGlQDgSzwFEZzXjwlggGQ0uH7wUxjgYhRg7ptlo8Y7lwl
         vSFUxIaTnW7KRy9eRdennz/vpnNlEfEjEoZK1fZIqAEyyAP0qkpmiqwkAga8jsT7+5A7
         IyUgzTMCg23txc9VhQZnXi8CkJz0W6vxg6D8fjcCbufoskq+q0hn9hOuN0GcIIZtqUjI
         rjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763088281; x=1763693081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ogvgd635azPUz+WZ2ZBSyfGuvoqvFypd33I5RGDzDDo=;
        b=npwpZmP7yOQLScrIfNqZwZ1igNbzY52q/1TzxAlZmG2Fg9NDKgwIT6he8NrRGtCfhd
         ivnPqAaq1l8z+ulxZUtgVxCq7rOdoyncGK/splT7722YR0cF/on221uf3nS5uElkBbkj
         8wnFaAmVTjyojok8wCVNBdS1wiTYh1FsF6EXkX2N7yOD3xpJ85Tm6LFML/bDYJ+2BfD4
         bWZWxWKpJVFjTDY4H9o5Iue7uTXuAdYnkN3HBtqL1Jc6UV4beZwiUHkWo3Gbs44cTwQb
         XDapnRC8FBfdEzhfXSnaIeCf4QAEe2TcQbsVUEw4b9/c1QyuNnesvFHdYPD2e3HEYbrL
         gmAQ==
X-Gm-Message-State: AOJu0YzN3xrNijKNg7Vmx0Sx9b2jX56C6GzrijolFuOweYpvSc5nswMe
	w6sO59t79fS9HzeCHQxQRyZwnDWSSabbn+VFo7488n/K0GdCO2Dv0HHGrP1GmNexDWlgF2Yo81z
	fuMiEGNvqtA0fDKNdqmkYKYYcJ2qP6ZA=
X-Gm-Gg: ASbGncswadgHhANL6U+s6l8KPVmUp+jtOe17mzbmDnR1QeTckprSCB0QX+QQaJ7O8iO
	X1FYcIXQ2OdpC/MC1qmV253tfw3Q3lHl8lDqX/dLaM8htwKRLOV/JuqiUCTO/LCP6SB1I5Aa7p0
	0OKzizNE9aZA2fqvN9421VqtoNi/50rQ/e9151THlPPhO8vao+QUXcgPnQqF+c6fV+oXDbZjc7K
	aWChLR7F92kY6M33gud8C219q8Rbwe+nrPAWMifPNn7wZWRWDHXRQX7bRft8jmDpz8MFPpszKYA
	GeiRB/mUZdEelaGdsaGCwnTSwGIOuVziFlJkLroTnGZUsNGalwCEvNJSHz5YrAnnim87UNrVyPp
	f/a4r5iMwrTlgXEt0OpEEAIBAjqcUWeuH4js=
X-Google-Smtp-Source: AGHT+IGo0idcSPQiN8w4408CKgI3Ufn1ss0dJ9PCvPsPjZy/6qkngcvNQUKjEme8icEMJ0S3vE1+IDKRr0Xr9GHW9zM=
X-Received: by 2002:a05:690c:8303:10b0:786:7434:dd67 with SMTP id
 00721157ae682-78929e083d0mr15024717b3.3.1763088281227; Thu, 13 Nov 2025
 18:44:41 -0800 (PST)
MIME-Version: 1.0
References: <20251113112122.1553793-1-anuj.mittal@oss.qualcomm.com>
 <CAMKF1sqQF434+QRz02vjnaSSzmBrXpoHgEsuqh==d2AzdBEr3Q@mail.gmail.com> <CA+s=J=w0hTgiKBYTYEP2pkzqNKhNtzdo0hQ+pYrbD2_G9DfEfw@mail.gmail.com>
In-Reply-To: <CA+s=J=w0hTgiKBYTYEP2pkzqNKhNtzdo0hQ+pYrbD2_G9DfEfw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Nov 2025 18:44:14 -0800
X-Gm-Features: AWmQ_bktU5B9kZUT9459X4AztGMLBQXbv7fGMJlp0QwRDD25Oz5JG9v9pPIN9lw
Message-ID: <CAMKF1sr=2c5eE+e9h-9s7QpGY3wUMY8ZB7M4Y+Y_8ibR=zhAqA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][master][scarthgap][PATCH] remmina: add
 DEPENDS on curl
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b5d461064384fa93"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 02:44:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121671

--000000000000b5d461064384fa93
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 6:22=E2=80=AFPM Anuj Mittal <anuj.mittal@oss.qualco=
mm.com>
wrote:

> Sorry, I must have generated it from wrong workspace. I had tested on
> master and it doesn't give an error there because of the reasons mentione=
d
> but it'd be good to explicitly mention the dependency anyway.
>
> Should I send a v2 for correct recipe version?
>

Yes please.


>
> On Fri, Nov 14, 2025 at 10:17=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wr=
ote:
>
>> This patch mentions master in subject but the patch is not for version o=
f
>> recipe in master. Can you confirm if it is still needed with the master
>> version ?
>>
>> On Thu, Nov 13, 2025 at 3:21=E2=80=AFAM Anuj Mittal via lists.openembedd=
ed.org
>> <anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>>
>>> remmina has a hard dependency on curl [1]. This doesn't result in an
>>> error on branches with gtk4 because curl gets pulled in via vte ->
>>> gtk4 -> gstreamer-plugins-bad -> curl.
>>>
>>> Add an explicit DEPENDS on curl to reflect the dependency.
>>>
>>> [1]
>>> https://github.com/FreeRDP/Remmina/blob/a8afdd728d215791e3ce2ebc0411569=
529cd0296/src/CMakeLists.txt#L259
>>>
>>> Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
>>> ---
>>>  meta-oe/recipes-support/remmina/remmina_1.4.34.bb | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.34.bb
>>> b/meta-oe/recipes-support/remmina/remmina_1.4.34.bb
>>> index 921d34d9fd..d101908b94 100644
>>> --- a/meta-oe/recipes-support/remmina/remmina_1.4.34.bb
>>> +++ b/meta-oe/recipes-support/remmina/remmina_1.4.34.bb
>>> @@ -20,6 +20,7 @@ DEPENDS =3D " \
>>>      libvncserver \
>>>      libsecret \
>>>      libxkbfile \
>>> +    curl \
>>>  "
>>>
>>>  DEPENDS:append:libc-musl =3D " libexecinfo"
>>> --
>>> 2.51.2
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#121643):
>>> https://lists.openembedded.org/g/openembedded-devel/message/121643
>>> Mute This Topic: https://lists.openembedded.org/mt/116272361/1997914
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
>>> raj.khem@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>

--000000000000b5d461064384fa93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 13,=
 2025 at 6:22=E2=80=AFPM Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@oss.=
qualcomm.com">anuj.mittal@oss.qualcomm.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Sorry, I mu=
st have generated it from wrong workspace. I had tested on master and it do=
esn&#39;t give an error there because of the reasons mentioned but it&#39;d=
 be good to explicitly mention the dependency anyway.</div><div><br></div><=
div>Should I send a v2 for correct recipe version?</div></div></blockquote>=
<div><br></div><div>Yes please.</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 14, 2025 at 10:17=E2=80=
=AFAM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">=
raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr">This patch mentions master in subject bu=
t the patch is not for version of recipe in master. Can you confirm if it i=
s still needed with the master version ?</div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 13, 2025 at 3:21=E2=80=
=AFAM Anuj Mittal via <a href=3D"http://lists.openembedded.org" target=3D"_=
blank">lists.openembedded.org</a> &lt;anuj.mittal=3D<a href=3D"mailto:oss.q=
ualcomm.com@lists.openembedded.org" target=3D"_blank">oss.qualcomm.com@list=
s.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">remmina has a hard dependency on curl [1]. This doesn&#39=
;t result in an<br>
error on branches with gtk4 because curl gets pulled in via vte -&gt;<br>
gtk4 -&gt; gstreamer-plugins-bad -&gt; curl.<br>
<br>
Add an explicit DEPENDS on curl to reflect the dependency.<br>
<br>
[1] <a href=3D"https://github.com/FreeRDP/Remmina/blob/a8afdd728d215791e3ce=
2ebc0411569529cd0296/src/CMakeLists.txt#L259" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/FreeRDP/Remmina/blob/a8afdd728d215791e3ce2ebc041=
1569529cd0296/src/CMakeLists.txt#L259</a><br>
<br>
Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@oss.qualcomm.c=
om" target=3D"_blank">anuj.mittal@oss.qualcomm.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/remmina/<a href=3D"http://remmina_1.4.34.bb" =
rel=3D"noreferrer" target=3D"_blank">remmina_1.4.34.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta-oe/recipes-support/remmina/<a href=3D"http://remmina_1.4.=
34.bb" rel=3D"noreferrer" target=3D"_blank">remmina_1.4.34.bb</a> b/meta-oe=
/recipes-support/remmina/<a href=3D"http://remmina_1.4.34.bb" rel=3D"norefe=
rrer" target=3D"_blank">remmina_1.4.34.bb</a><br>
index 921d34d9fd..d101908b94 100644<br>
--- a/meta-oe/recipes-support/remmina/<a href=3D"http://remmina_1.4.34.bb" =
rel=3D"noreferrer" target=3D"_blank">remmina_1.4.34.bb</a><br>
+++ b/meta-oe/recipes-support/remmina/<a href=3D"http://remmina_1.4.34.bb" =
rel=3D"noreferrer" target=3D"_blank">remmina_1.4.34.bb</a><br>
@@ -20,6 +20,7 @@ DEPENDS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0libvncserver \<br>
=C2=A0 =C2=A0 =C2=A0libsecret \<br>
=C2=A0 =C2=A0 =C2=A0libxkbfile \<br>
+=C2=A0 =C2=A0 curl \<br>
=C2=A0&quot;<br>
<br>
=C2=A0DEPENDS:append:libc-musl =3D &quot; libexecinfo&quot;<br>
-- <br>
2.51.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121643): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121643" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121643</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116272361/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116272361/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div></div>
</blockquote></div></div>

--000000000000b5d461064384fa93--

