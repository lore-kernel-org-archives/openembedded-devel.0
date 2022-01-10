Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C4BC433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 01:15:11 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web12.25739.1641777310734966156
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Jan 2022 17:15:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F2bHVesd;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id w27so13247817qkj.7
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Jan 2022 17:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WTBo5eUa4fMF+wOCdswOMnaLY142CVKej6UDe7n1kU8=;
        b=F2bHVesd2UwO5VsgetS4PFfTXwCoxzY0xHVX0r6QcFuYe6XE7hr2rcVLAhldicTJL8
         KE2c2sChjGG16FpyV22W3rusEvGS0bS2Um6a3pZSDVnyG7xlUIax8V1+/HD43gpAf8qe
         E6n5qh7IGQrELPDsfPsOm81QE1DKXLJnXvotIlo7q0rb/nLaZ/i2IzAQnKf8EZvBVJ3E
         cdc8mEJAm6+t4RuJVTGOiBg+R1LiuX4dDH7N4YhpRBryBsTP7FzhOSgzzm5b/1QPmajs
         2UCr6OmNEx+hLXj5iey7dO2L0EotQQg71xpYcvtPZj6YpHcJgy+X7QkCZ8FBsUsv4w9R
         a4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WTBo5eUa4fMF+wOCdswOMnaLY142CVKej6UDe7n1kU8=;
        b=Mu06bp+EX9FeX3a49oKGkNO3AZ+tJUddffgJBHLD/3h5RPelPS4M/aUFQdtuCfFBHR
         yT3HapwDo8Jcp/zLZLipEKpetdj2zUkUK6EO8MOkJyCZy+8yUBmeWI27sJMnXFUgyq11
         jL0SLg+LJH1Qscv5vOAanIx1CjBkooJh/u3xf1uGnZbGKx9fZv5RsbJLFFB0Z/B3z1Qt
         o+e6LZlkSS1bvSuc8gnb8Jnaz1tJYWIMGZ69unfA8MVO+1oxZxirDCFudk5beTV7XZGS
         za+Nl+awLPUpXCgbp9sv9AUSCk3jK9o8SLpom/kUEl4j0pIfA2CTmOCZeltkK1QeorWe
         SWTQ==
X-Gm-Message-State: AOAM533AZ+diYoW6ANFzPaFlC6ItDktxAdAjuUxiBaSGH3fZQvNH1217
	1nJu/RzhgjeWMIkSBQYfuGMJFf/EvnvY+YwlPvE=
X-Google-Smtp-Source: 
 ABdhPJz+A3m9MhGh16dVPmdGaFUodpqN2zxZWahAtnPlNETXj2dU6VGExs2d8IE9RqlD1uqNPmy9Psy+qpap68wXQnU=
X-Received: by 2002:a05:620a:f06:: with SMTP id
 v6mr51523957qkl.149.1641777309628;
 Sun, 09 Jan 2022 17:15:09 -0800 (PST)
MIME-Version: 1.0
References: <1641565655-53792-1-git-send-email-wangmy@fujitsu.com>
 <1641565655-53792-2-git-send-email-wangmy@fujitsu.com>
 <0ffbbd0b-3010-70d8-30c7-240fcbaeeed6@gmail.com>
 <OSBPR01MB1845113D00FC9BB6477A62EFDC509@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSBPR01MB1845113D00FC9BB6477A62EFDC509@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 9 Jan 2022 17:14:58 -0800
Message-ID: 
 <CAMKF1sqguORnRbHF6nYJLupPuruK_6x4+mNO14zX=zHqnKfXVA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] dnfdragora: upgrade 1.1.2 -> 2.1.2
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000573c5105d5301100"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jan 2022 01:15:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94706

--000000000000573c5105d5301100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 9, 2022 at 4:16 PM wangmy@fujitsu.com <wangmy@fujitsu.com>
wrote:

> Do you mean that I should change the name of recipe to dnfdragora_2.1.1.b=
b
> ?


Yes


>
> In addition, I'd like to ask you about the naming rules of recipe.
> Could you tell me when to use_ git.bb, and when to use_ versionnumber.bb?
>

When version is fixed and known then use PV otherwise if it is intermittent
version then use git

>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> Development Dept.I
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road,
> Nanjing, 210012, China
> <https://www.google.com/maps/search/Wenzhu+Road,+Nanjing,+210012,+China?e=
ntry=3Dgmail&source=3Dg>
> TEL: +86+25-86630566-8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
> http://www.fujitsu.com/cn/fnst/
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Saturday, January 8, 2022 2:51 AM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>;
> > openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe] [PATCH] dnfdragora: upgrade 1.1.2 -> 2.1.2
> >
> >
> >
> > On 1/7/22 6:27 AM, wangmy wrote:
> > > Changelog:
> > > Bugs fixed for this release
> > > <https://github.com/manatools/dnfdragora/issues/#####>
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > Fixed wrong access to manatools.service module (issue #202) Fixed
> > > issue #189 "No line break to fit the width of the window in dnfdragor=
a"
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >   meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
> > > b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
> > > index fdc164d56..a67bd9bcb 100644
> > > --- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
> > > +++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
> > > @@ -9,8 +9,8 @@ SRC_URI =3D
> > "git://github.com/manatools/dnfdragora.git;branch=3Dmaster;protocol=3Dh=
ttp
> > >              file://0001-To-fix-error-when-do_package.patch \
> > >              "
> > >
> > > -PV =3D "1.1.2+git${SRCPV}"
> > > -SRCREV =3D "19e123132cfd4efd860e5204261c3c228bfe80a8"
> > > +PV =3D "2.1.2"
> > > +SRCREV =3D "5cbbc07c9d015af284a424a172a379b385f05b6f"
> > >
> > >   S =3D "${WORKDIR}/git"
> > >
> > >
> >
> > please rename the recipe as well to reflect PV while you are here.
> >
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#94688):
> > > https://lists.openembedded.org/g/openembedded-devel/message/94688
> > > Mute This Topic: https://lists.openembedded.org/mt/88261764/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-devel/unsub
> > > [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>

--000000000000573c5105d5301100
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Jan 9, 2022 at 4:16 PM <a href=3D"mailto:wangmy@fuj=
itsu.com">wangmy@fujitsu.com</a> &lt;<a href=3D"mailto:wangmy@fujitsu.com">=
wangmy@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">D=
o you mean that I should change the name of recipe to <a href=3D"http://dnf=
dragora_2.1.1.bb" rel=3D"noreferrer" target=3D"_blank">dnfdragora_2.1.1.bb<=
/a>?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yes</div><di=
v dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
In addition, I&#39;d like to ask you about the naming rules of recipe. <br>
Could you tell me when to use_ <a href=3D"http://git.bb" rel=3D"noreferrer"=
 target=3D"_blank">git.bb</a>, and when to use_ <a href=3D"http://versionnu=
mber.bb" rel=3D"noreferrer" target=3D"_blank">versionnumber.bb</a>?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">When version is =
fixed and known then use PV otherwise if it is intermittent version then us=
e git=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
=C2=A0 --<br>
Best Regards<br>
---------------------------------------------------<br>
Wang Mingyu<br>
Development Dept.I<br>
Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 <a href=3D"https=
://www.google.com/maps/search/Wenzhu+Road,+Nanjing,+210012,+China?entry=3Dg=
mail&amp;source=3Dg">Wenzhu Road, Nanjing, 210012, China</a><br>
TEL: +86+25-86630566-8568<br>
COINS: 79988548<br>
FAX: +86+25-83317685<br>
MAIL: <a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujits=
u.com</a><br>
<a href=3D"http://www.fujitsu.com/cn/fnst/" rel=3D"noreferrer" target=3D"_b=
lank">http://www.fujitsu.com/cn/fnst/</a><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt;<br>
&gt; Sent: Saturday, January 8, 2022 2:51 AM<br>
&gt; To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C &lt;<a href=3D"mailto:wa=
ngmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;;<br>
&gt; <a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D=
"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt; Subject: Re: [oe] [meta-oe] [PATCH] dnfdragora: upgrade 1.1.2 -&gt; 2.=
1.2<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On 1/7/22 6:27 AM, wangmy wrote:<br>
&gt; &gt; Changelog:<br>
&gt; &gt; Bugs fixed for this release<br>
&gt; &gt; &lt;<a href=3D"https://github.com/manatools/dnfdragora/issues/#%2=
3%23%23%23" rel=3D"noreferrer" target=3D"_blank">https://github.com/manatoo=
ls/dnfdragora/issues/#####</a>&gt;<br>
&gt; &gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; Fixed wrong access to manatools.service module (issue #202) Fixed=
<br>
&gt; &gt; issue #189 &quot;No line break to fit the width of the window in =
dnfdragora&quot;<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.c=
om" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0meta-oe/recipes-graphics/dnfdragora/<a href=3D"http:/=
/dnfdragora_git.bb" rel=3D"noreferrer" target=3D"_blank">dnfdragora_git.bb<=
/a> | 4 ++--<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/recipes-graphics/dnfdragora/<a href=3D"http:=
//dnfdragora_git.bb" rel=3D"noreferrer" target=3D"_blank">dnfdragora_git.bb=
</a><br>
&gt; &gt; b/meta-oe/recipes-graphics/dnfdragora/<a href=3D"http://dnfdragor=
a_git.bb" rel=3D"noreferrer" target=3D"_blank">dnfdragora_git.bb</a><br>
&gt; &gt; index fdc164d56..a67bd9bcb 100644<br>
&gt; &gt; --- a/meta-oe/recipes-graphics/dnfdragora/<a href=3D"http://dnfdr=
agora_git.bb" rel=3D"noreferrer" target=3D"_blank">dnfdragora_git.bb</a><br=
>
&gt; &gt; +++ b/meta-oe/recipes-graphics/dnfdragora/<a href=3D"http://dnfdr=
agora_git.bb" rel=3D"noreferrer" target=3D"_blank">dnfdragora_git.bb</a><br=
>
&gt; &gt; @@ -9,8 +9,8 @@ SRC_URI =3D<br>
&gt; &quot;git://<a href=3D"http://github.com/manatools/dnfdragora.git;bran=
ch=3Dmaster;protocol=3Dhttp" rel=3D"noreferrer" target=3D"_blank">github.co=
m/manatools/dnfdragora.git;branch=3Dmaster;protocol=3Dhttp</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-To-fi=
x-error-when-do_package.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; &gt;<br>
&gt; &gt; -PV =3D &quot;1.1.2+git${SRCPV}&quot;<br>
&gt; &gt; -SRCREV =3D &quot;19e123132cfd4efd860e5204261c3c228bfe80a8&quot;<=
br>
&gt; &gt; +PV =3D &quot;2.1.2&quot;<br>
&gt; &gt; +SRCREV =3D &quot;5cbbc07c9d015af284a424a172a379b385f05b6f&quot;<=
br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; <br>
&gt; please rename the recipe as well to reflect PV while you are here.<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#94688):<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/me=
ssage/94688" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/message/94688</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/882=
61764/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/88261764/1997914</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.o=
penembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembed=
ded.org</a><br>
&gt; &gt; Unsubscribe:<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/unsub" =
rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/opene=
mbedded-devel/unsub</a><br>
&gt; &gt; [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem=
@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
</blockquote></div></div>

--000000000000573c5105d5301100--

