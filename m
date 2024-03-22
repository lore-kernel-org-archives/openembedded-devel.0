Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830B7C47DD9
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 14:01:51 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.13750.1711116104481756499
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Mar 2024 07:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P1o4Iufh;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-609f1b77728so23388497b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 07:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711116103; x=1711720903; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kceJQ53NsSM+dy1FXvuvdCSLKWaABfkawuTzgKgsjqI=;
        b=P1o4IufhAUmojOLVxxO8tiXCiBLXps98RZJJJ6i/YXUhps7FXHA8S4Vd1BMk5bUf58
         ANDCRkWcMn340Jxpgt+M6nf0w+yq8CyDXjeSZjXbJZoTUl+wRV7owVVoBMx1749iZQYD
         d0l2UH/OpBKe6kWgNLr317wdAy7cSLDpJNUW5iwg6tSes+Q9OPgT2qutmPdOX9pvTHVT
         EJBprZ82Gg01/3In3bTzWyBsfDa7jgqLfnMPlcKyPUZXEu8HmhHKPxhvcX9/RVkHJhEC
         Hh9WhPFhgxzCgMEhdDjkD/EvTfiaj62rt4XObp6xFPYf/kBzheJVuBAOOq3UKfzpqAPh
         jnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711116103; x=1711720903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kceJQ53NsSM+dy1FXvuvdCSLKWaABfkawuTzgKgsjqI=;
        b=oUKJ+uKjklISQetv90IJTRBeR1NF6dqF/BSCncclozvHzIUZ0jH9tzE+QQlU2d3ARp
         duAPC08yVtBpaJ+YNtGeSAdRTwPthoLu0EDgN04jrJiYKtIeF00iMNb5tjnVVPFZERa2
         fmoXhN6wwmJVPRS3HvwIxlNJ2PAmzyiDuVUijmoDlNyrdrWy0Tl4mck7WTrlnGPhNbwQ
         aopF/YNvXgDNfCoGcegoqk4iHpj0gNcLxv84ijIsiRKDkYeJ6JrQksbDwoCZxjm048bT
         jQKJeUKN+Q+keo7ZOVOuVnF9UnyODpZvVv9m9WjRL/gC7JHxmKoALm7QZ8CPD5iAHW3j
         tIJw==
X-Forwarded-Encrypted: i=1; AJvYcCWbxI3SjgSuGK7T5mnECuqMzHHKSyXXLdqjvmw8yoVuSzGiC43SV6Gr5m73ga8Atjrufy64ZYi9S1LTISN6jHPJjqbrmmlsNI345niCAqrJ65r0HQiI4ufDrw==
X-Gm-Message-State: AOJu0YxgWP18iYC+Pv8jFCNhHTiaqWEP7E6hQDsCIlMaSfAYMWtE6EyT
	alKviZwBP0I3kT/mujs503C2eQcYBmHr6GqAng5TKHg5sTdZsy7n3K/pTF92FdFHoYq++9aOpPD
	vvs0AQ9KtGjnzibUL/Kmxwq7MnBo=
X-Google-Smtp-Source: AGHT+IEVlOtITf4ISMgPW8bsFaCFVM5yizKKvh+OukC70aOcwo9+12+smcRgJckOxsivQocy/V+z2yqvptpTw0NcWZA=
X-Received: by 2002:a81:6956:0:b0:609:6bfc:eb8f with SMTP id
 e83-20020a816956000000b006096bfceb8fmr2154765ywc.48.1711116102726; Fri, 22
 Mar 2024 07:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240209181917.1941840-1-festevam@gmail.com> <17B249471F2E70E3.15017@lists.openembedded.org>
In-Reply-To: <17B249471F2E70E3.15017@lists.openembedded.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 22 Mar 2024 07:01:31 -0700
Message-ID: <CANx9H-AzFA2j-yjhk1+AOtBqh=WHSpV3A2xP=ytBcbuZMZafQQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] [meta-java] xml-commons: xom: Update github entry
To: ticotimo@gmail.com
Cc: Fabio Estevam <festevam@gmail.com>, openembedded-devel@lists.openembedded.org, 
	richard.leitner@skidata.com, tim.orling@konsulko.com, 
	Fabio Estevam <festevam@denx.de>
Content-Type: multipart/alternative; boundary="00000000000078fa1b06144043a0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 14:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109519

--00000000000078fa1b06144043a0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 9, 2024 at 11:43=E2=80=AFAM Tim Orling via lists.openembedded.o=
rg
<ticotimo=3Dgmail.com@lists.openembedded.org> wrote:

>
>
> On Fri, Feb 9, 2024 at 10:19=E2=80=AFAM Fabio Estevam <festevam@gmail.com=
> wrote:
>
>> From: Fabio Estevam <festevam@denx.de>
>>
>> Switch to using https, pass protocol and the branch name to fix
>> the following warnings:
>>
>> WARNING: .../meta-java/recipes-core/xml-commons/xom_1.2.10.bb: URL:
>> git://github.com/codehaus/jaxen;name=3Djaxen uses git protocol which is =
no
>> longer supported by github. Please change to ;protocol=3Dhttps in the ur=
l.
>> WARNING: .../meta-java/recipes-core/xml-commons/xom_1.2.10.bb: URL:
>> git://github.com/codehaus/jaxen;name=3Djaxen does not set any branch
>> parameter. The future default branch used by tools and repositories is
>> uncertain and we will therefore soon require this is set in all git urls=
.
>>
>> Signed-off-by: Fabio Estevam <festevam@denx.de>
>> ---
>>  recipes-core/xml-commons/xom_1.2.10.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-core/xml-commons/xom_1.2.10.bb
>> b/recipes-core/xml-commons/xom_1.2.10.bb
>> index 42ad957..2eed0fe 100644
>> --- a/recipes-core/xml-commons/xom_1.2.10.bb
>> +++ b/recipes-core/xml-commons/xom_1.2.10.bb
>> @@ -14,7 +14,7 @@ PV_jaxen =3D "1.1.6"
>>
>>  SRC_URI =3D "\
>>         http://www.cafeconleche.org/XOM/${P}-src.tar.gz;name=3Darchive \
>> -       git://github.com/codehaus/${SRCNAME_jaxen};name=3Djaxen
>> <http://github.com/codehaus/$%7BSRCNAME_jaxen%7D;name=3Djaxen> \
>> +
>> https://github.com/codehaus/${SRCNAME_jaxen};protocol=3Dhttps;branch=3Dm=
aster
>> \
>>
> This is incorrect. You needed to add the `protocol=3Dhttps;` but leave
`git://` as the fetcher. These are not
URIs like you would type for wget or curl.


>
> You should not drop the name=3Djaxen, pretty sure that is required for th=
e
> SRCREV_jaxen to work?
>
> We should also drop the archive.md5sum... we haven't used md5sum in quite
> some time.
>
>         file://04_remove_sun_import.patch \
>>  "
>>  SRC_URI[archive.md5sum] =3D "9f3a2ae827a9f6826fe76e4b7b0c22b3"
>> --
>> 2.37.3
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108691):
> https://lists.openembedded.org/g/openembedded-devel/message/108691
> Mute This Topic: https://lists.openembedded.org/mt/104264377/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000078fa1b06144043a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 9, 2024 at 11:43=E2=80=AF=
AM Tim Orling via <a href=3D"http://lists.openembedded.org">lists.openembed=
ded.org</a> &lt;ticotimo=3D<a href=3D"mailto:gmail.com@lists.openembedded.o=
rg">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Fri, Feb 9, 2024 at 10:19=E2=80=AFAM Fabio Estevam &lt;<a href=3D"mailto:=
festevam@gmail.com" target=3D"_blank">festevam@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">From: Fabio Estevam=
 &lt;<a href=3D"mailto:festevam@denx.de" target=3D"_blank">festevam@denx.de=
</a>&gt;<br>
<br>
Switch to using https, pass protocol and the branch name to fix<br>
the following warnings:<br>
<br>
WARNING: .../meta-java/recipes-core/xml-commons/<a href=3D"http://xom_1.2.1=
0.bb" rel=3D"noreferrer" target=3D"_blank">xom_1.2.10.bb</a>: URL: git://<a=
 href=3D"http://github.com/codehaus/jaxen;name=3Djaxen" rel=3D"noreferrer" =
target=3D"_blank">github.com/codehaus/jaxen;name=3Djaxen</a> uses git proto=
col which is no longer supported by github. Please change to ;protocol=3Dht=
tps in the url.<br>
WARNING: .../meta-java/recipes-core/xml-commons/<a href=3D"http://xom_1.2.1=
0.bb" rel=3D"noreferrer" target=3D"_blank">xom_1.2.10.bb</a>: URL: git://<a=
 href=3D"http://github.com/codehaus/jaxen;name=3Djaxen" rel=3D"noreferrer" =
target=3D"_blank">github.com/codehaus/jaxen;name=3Djaxen</a> does not set a=
ny branch parameter. The future default branch used by tools and repositori=
es is uncertain and we will therefore soon require this is set in all git u=
rls.<br>
<br>
Signed-off-by: Fabio Estevam &lt;<a href=3D"mailto:festevam@denx.de" target=
=3D"_blank">festevam@denx.de</a>&gt;<br>
---<br>
=C2=A0recipes-core/xml-commons/<a href=3D"http://xom_1.2.10.bb" rel=3D"nore=
ferrer" target=3D"_blank">xom_1.2.10.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-core/xml-commons/<a href=3D"http://xom_1.2.10.bb" rel=
=3D"noreferrer" target=3D"_blank">xom_1.2.10.bb</a> b/recipes-core/xml-comm=
ons/<a href=3D"http://xom_1.2.10.bb" rel=3D"noreferrer" target=3D"_blank">x=
om_1.2.10.bb</a><br>
index 42ad957..2eed0fe 100644<br>
--- a/recipes-core/xml-commons/<a href=3D"http://xom_1.2.10.bb" rel=3D"nore=
ferrer" target=3D"_blank">xom_1.2.10.bb</a><br>
+++ b/recipes-core/xml-commons/<a href=3D"http://xom_1.2.10.bb" rel=3D"nore=
ferrer" target=3D"_blank">xom_1.2.10.bb</a><br>
@@ -14,7 +14,7 @@ PV_jaxen =3D &quot;1.1.6&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://www.cafeconleche.org/XOM/$%7B=
P%7D-src.tar.gz;name=3Darchive" rel=3D"noreferrer" target=3D"_blank">http:/=
/www.cafeconleche.org/XOM/${P}-src.tar.gz;name=3Darchive</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/codehaus/$%7=
BSRCNAME_jaxen%7D;name=3Djaxen" rel=3D"noreferrer" target=3D"_blank">github=
.com/codehaus/${SRCNAME_jaxen};name=3Djaxen</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/codehaus/$%7BSRCN=
AME_jaxen%7D;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/codehaus/${SRCNAME_jaxen};protocol=3Dhttps;bran=
ch=3Dmaster</a> \<br></blockquote></div></div></blockquote><div>This is inc=
orrect. You needed to add the `protocol=3Dhttps;` but leave `git://` as the=
 fetcher. These are not</div><div>URIs like you would type for wget or curl=
.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"></blockquote><div><br></div><div>You should not drop the =
name=3Djaxen, pretty sure that is required for the SRCREV_jaxen to work?</d=
iv><div><br></div><div>We should also drop the archive.md5sum... we haven&#=
39;t used md5sum in quite some time.</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://04_remove_sun_import.patch \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI[archive.md5sum] =3D &quot;9f3a2ae827a9f6826fe76e4b7b0c22b3&qu=
ot;<br>
-- <br>
2.37.3<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#108691): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108691" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108691</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104264377/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104264377/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000078fa1b06144043a0--

