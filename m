Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE553C001B0
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 22:49:02 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.76070.1691534935122383555
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Aug 2023 15:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KofA3aD0;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-583b3939521so71856657b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Aug 2023 15:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691534934; x=1692139734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c9q4CSoQB513HLNhxkuip8lOa+xBdOD5Gkztq7cR4tU=;
        b=KofA3aD05r2bkIpqGBkjbHewCeNpfQlr9TRYNqk3Opug2mxRimYA8t/VuCm8meuDLy
         yWi+mgf4fTUgeBizFw535SRlKob9g2V/jmOv0e0XlfKDcY+rcRhf8xziiHiZOYkSjxao
         gL3gLQU1HPJ0z1azElJYNC7rNj7rqcntqamYh0kgovtwMb5F4X3jb10euHJ3bxtIGrRi
         qUwmp6DyLUXUQibHYlWB/VtmDqTWHXzvBn3AhfhSPH0vurs+rU+AbgwZB7+F+CF60WDt
         ehZdPGSDmPquDwhw9JVGyP+t19XgAgKyg4GwJN2bgHStmDVQnmKo4uIg0ONkkoqGWTPB
         +J1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691534934; x=1692139734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c9q4CSoQB513HLNhxkuip8lOa+xBdOD5Gkztq7cR4tU=;
        b=US/AZ9q43LRlbh5jXb3HUIJUQZtT9tW58N61tp512AxAsVl85XR+4CPaABCXYdkpuh
         qh2eQuH0G+z36AySneSIBdDZmRsWvrWuxh+zAfDQK78cLvz/VyrEwz67isCAVUIWd4Hf
         1/73BCwXJs8SwL1IyGF/1Ti6/Y+W9ZAyQ9n3HHCjfNwIm2WmgfwP4JfLtjVmOdPzfjTa
         6HjOaRIDPJQ3lxwZPxXQ7d/jpXrOzzAm64IPNSpxeZmNq+iqkZMRLM3P4VfygrUxfPMy
         AwoHwyZzxiMK2GGA06Xxl0PFYUQY8bQ00kgg5BHVw6BNQLGa/kFA4rMgoNUgfc3t4Cug
         msrg==
X-Gm-Message-State: AOJu0YwoHk2ePZi/JCx40u+7cUtUTKFSiMaYmD9NbRYJSnti5jsCY+Nb
	W72G5NPlWgeL8dYAErctrBzNKuosINFeGhIEuok=
X-Google-Smtp-Source: AGHT+IEhZTUH0a3UV/xqn9d0V87MlCk5U/J5c/mZJECyMl0EmCMv5qC8UkY/Vea6zG5thqHgHsjJMtAtSv7mFXaoGd4=
X-Received: by 2002:a0d:d787:0:b0:583:f658:5dd with SMTP id
 z129-20020a0dd787000000b00583f65805ddmr1109973ywd.40.1691534934152; Tue, 08
 Aug 2023 15:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230807164452.381251-1-ticotimo@gmail.com> <CAMKF1srD-yabN0QN3FCLuGeRDBQSnKnNh=LFd2-a5VcPUQm-jQ@mail.gmail.com>
 <CANx9H-Csz-+o3FOxWXQeRGbWDJ+BkXcjQbsjBKp_bABizvog=A@mail.gmail.com> <CAMKF1sp9JaRgSJigcd6ZXspKcG+ffk0aVOJn0q8zEoacJ0hHfg@mail.gmail.com>
In-Reply-To: <CAMKF1sp9JaRgSJigcd6ZXspKcG+ffk0aVOJn0q8zEoacJ0hHfg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 8 Aug 2023 15:48:43 -0700
Message-ID: <CANx9H-D6YUq=cQJQaupyi1fSqgu8MiLDBJou9dvpgntQ3oes1g@mail.gmail.com>
Subject: Re: [oe] [meta-perl][PATCH v2] libmodule-build-tiny-perl: upgrade
 0.045 -> 0.046
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e01b1d0602712a34"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Aug 2023 22:49:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104308

--000000000000e01b1d0602712a34
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 7, 2023 at 10:53=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:

> On Mon, Aug 7, 2023 at 10:46=E2=80=AFAM Tim Orling <ticotimo@gmail.com> w=
rote:
> >
> <snip>
> >> > +RDEPENDS:${PN}-ptest +=3D " \
> >> > +    binutils \
> >> > +    gcc \
> >>
> >> binutils and gcc should be part of packagegroup below
> >> so you can remove it as well.
> >>
> >
> > They are not. I built without them added and neither "gcc" (-musl-gcc)
> nor "as" (-musl-as) were present.
> > The packagegroup only includes libgcc and friends, but not the tools in
> /usr/bin/
> >
>
> Looking at the core you are right. Contrary to name this packagegroup
> does not provide tools but just runtime.
> perhaps packagegroup-core-buildessential is more appropriate instead.
>
>
Agreed. Even though packagegroup-core-buildessential has more tools than
are strictly required NOW it is an example for the future and should help
us be "future proof".
I'll update in v3.

Thank you for helping make meta-openembedded a better place.


> >>
> >> > +    packagegroup-core-standalone-sdk-target \
> >> > +    perl-dev \
> >> > +    perl-module-blib \
> >> > +    perl-module-ipc-open2 \
> >> > +"
> >> > +
> >> > +INSANE_SKIP:${PN}-ptest +=3D "dev-deps"
> >> > +
> >> > +BBCLASSEXTEND =3D "native"
> >> > --
> >> > 2.34.1
> >> >
> >> >
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#104302):
> https://lists.openembedded.org/g/openembedded-devel/message/104302
> >> > Mute This Topic: https://lists.openembedded.org/mt/100603983/1997914
> >> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >
>

--000000000000e01b1d0602712a34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 7, 2023 at 10:53=E2=80=AF=
AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Mon, Aug 7, 2023 at 10:46=E2=80=AFAM Tim Orling &lt;<a href=3D"mailto:ticot=
imo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;<br>&lt;snip&gt;<br>
&gt;&gt; &gt; +RDEPENDS:${PN}-ptest +=3D &quot; \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 binutils \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 gcc \<br>
&gt;&gt;<br>
&gt;&gt; binutils and gcc should be part of packagegroup below<br>
&gt;&gt; so you can remove it as well.<br>
&gt;&gt;<br>
&gt;<br>
&gt; They are not. I built without them added and neither &quot;gcc&quot; (=
-musl-gcc) nor &quot;as&quot; (-musl-as) were present.<br>
&gt; The packagegroup only includes libgcc and friends, but not the tools i=
n /usr/bin/<br>
&gt;<br>
<br>
Looking at the core you are right. Contrary to name this packagegroup<br>
does not provide tools but just runtime.<br>
perhaps packagegroup-core-buildessential is more appropriate instead.<br>
<br></blockquote><div><br></div><div>Agreed. Even though packagegroup-core-=
buildessential has more tools than are strictly required NOW it is an examp=
le for the future and should help us be &quot;future proof&quot;.</div><div=
>I&#39;ll update in v3.</div><div><br></div><div>Thank you for helping make=
 meta-openembedded a better place.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
&gt;&gt;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 packagegroup-core-standalone-sdk-target \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 perl-dev \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 perl-module-blib \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 perl-module-ipc-open2 \<br>
&gt;&gt; &gt; +&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +INSANE_SKIP:${PN}-ptest +=3D &quot;dev-deps&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.34.1<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt; View/Reply Online (#104302): <a href=3D"https://lists.openemb=
edded.org/g/openembedded-devel/message/104302" rel=3D"noreferrer" target=3D=
"_blank">https://lists.openembedded.org/g/openembedded-devel/message/104302=
</a><br>
&gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt=
/100603983/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.open=
embedded.org/mt/100603983/1997914</a><br>
&gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lis=
ts.openembedded.org" target=3D"_blank">openembedded-devel+owner@lists.opene=
mbedded.org</a><br>
&gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/open=
embedded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;<br>
</blockquote></div></div>

--000000000000e01b1d0602712a34--

