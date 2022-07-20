Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9290CC433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 00:35:02 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.48345.1658277294038139684
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 17:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GNu2csdh;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id i4so2786034qvv.7
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 17:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nAOzw+c4RNsBrK/AczxYAndLHZ8FRY7f+WpRAvq4q/Y=;
        b=GNu2csdhIXnfHNn57kIECyDz4LyRo7d5YQXJ2l1BBIOKeT38FaSVp3ySSBbZ/ks8Wh
         /XNWPhYPuG0khe1vi5Kg5CYjmy/f9DkqIHwGCPnLRZyHD35VKJYFAFaw/u2rrCVsLgeS
         ri6m451SvMrodB4Gg8bKjCrMfQ8o9MoOF5r3vtF7zE2I0mMuoaFyHuSU1BUCreQnhMqA
         voFvegYTaqcw1Q+vaPK5CQCehyNAsriJXm/wI/3DfB5AAfGfXTh/ggcEDOroF9GjtzNc
         dIIZfxYvYYURO3C/sOZ8bb/wKEhI/y/iNQ1HiZNKJQJxmKK59BjyqQHxvLkiO+Hquv54
         bIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nAOzw+c4RNsBrK/AczxYAndLHZ8FRY7f+WpRAvq4q/Y=;
        b=PlKTEfd9lSDtmgzJbDNz18qEM0V5Zi4wueA6qQu0XZH70DpF9ERvqscCkBPhjB2Sgn
         8whiL/X+Y2MX7ByMvWuRkD8A3yksEJVAzjR6SaFo6kH5NJ1MGA6ZBDW1jw9okC55HGv2
         /vFxZRJeQbA7Vb9boBj2zaXktfEtFkyxiniFVxseQHgT87K97BolWPBxMMSbJ3U1f7I+
         XS0huc7nzJA8YbALaBcscL5eIdqqpKXaJFjHBx8BI2RPTgKjDz0JPil2q49kgBQnhbzS
         t3LJhU72hcX2w3hMOJe3MjYJO1EevAHOfQYahgjeliGd/k5WSj6Jh2YnwU0l4MmjqMc2
         ugng==
X-Gm-Message-State: AJIora+xO2k1iD6y9wYsiIhC/K/AZUu9XPibNwDKmkbjuo4kFbOuHTjG
	qMK4fzkyB7NgJGDVqJZDdcdExMeE4eiAvajzjtw=
X-Google-Smtp-Source: 
 AGRyM1uE3dZ6UflFAtRWOJ8/1pBPATHvY7VXBUeYr7hZgZzuHbn6y/FVSSKcUQVHJZdXKg8mIQt5nYwGG1PwMnMmLLU=
X-Received: by 2002:a05:6214:27e3:b0:472:ece6:3af5 with SMTP id
 jt3-20020a05621427e300b00472ece63af5mr27523866qvb.63.1658277293032; Tue, 19
 Jul 2022 17:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <1658211328-2951-1-git-send-email-wangmy@fujitsu.com>
 <1658211328-2951-4-git-send-email-wangmy@fujitsu.com>
 <3a331d56-ee77-c023-b0f9-2a96bae3098b@gmail.com>
 <OSBPR01MB1845E9C4EA8ED5C0C3635A8CDC8E9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSBPR01MB1845E9C4EA8ED5C0C3635A8CDC8E9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Jul 2022 20:34:41 -0400
Message-ID: 
 <CAMKF1sqwt56F=X++J1ovXRQHMM=6Vh6F_Wq7=TYB0XjcCvdF_w@mail.gmail.com>
Subject: Re: [oe] [meta-perl] PATCH] logcheck: upgrade 1.3.23 -> 1.3.24
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fd8cdb05e431c4bc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Jul 2022 00:35:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97904

--000000000000fd8cdb05e431c4bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2022 at 8:03 PM wangmy@fujitsu.com <wangmy@fujitsu.com>
wrote:

> The directory name changed after the source package was unzipped.
> 1.3.23: the unzipped directory name does not have a version number, it is
> logcheck.
> 1.3.24: the unzipped directory name has a version number. It is
> logcheck-1.3.24.
> There is no official explanation for this change.
>

Ok thanks. I was not sure of this was intentional. Thanks for explaining

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
> > Sent: Tuesday, July 19, 2022 9:41 PM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>;
> > openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-perl] PATCH] logcheck: upgrade 1.3.23 -> 1.3.24
> >
> >
> >
> > On 7/19/22 2:15 AM, wangmy wrote:
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >   .../logcheck/{logcheck_1.3.23.bb =3D> logcheck_1.3.24.bb}       | 4
> +---
> > >   1 file changed, 1 insertion(+), 3 deletions(-)
> > >   rename meta-perl/recipes-extended/logcheck/{logcheck_1.3.23.bb =3D>
> > > logcheck_1.3.24.bb} (96%)
> > >
> > > diff --git a/meta-perl/recipes-extended/logcheck/logcheck_1.3.23.bb
> > > b/meta-perl/recipes-extended/logcheck/logcheck_1.3.24.bb
> > > similarity index 96%
> > > rename from meta-perl/recipes-extended/logcheck/logcheck_1.3.23.bb
> > > rename to meta-perl/recipes-extended/logcheck/logcheck_1.3.24.bb
> > > index b40d52ab94..ea3dd5a4c9 100644
> > > --- a/meta-perl/recipes-extended/logcheck/logcheck_1.3.23.bb
> > > +++ b/meta-perl/recipes-extended/logcheck/logcheck_1.3.24.bb
> > > @@ -14,9 +14,7 @@ LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3Dc93c0550bd3173f4504b2cbd8991e50b"
> > >   SRC_URI =3D "${DEBIAN_MIRROR}/main/l/${BPN}/${BPN}_${PV}.tar.xz \
> > >              file://99_logcheck \
> > >   "
> > > -SRC_URI[sha256sum] =3D
> > "a2188ba549fff4412c82074b271884ff66d25f3fdb2a41916e817ce676855b29"
> > > -
> > > -S =3D "${WORKDIR}/${BPN}"
> >
> > S is not needed to be set here anymore ? Is this change documented
> somewhere
> >
> > > +SRC_URI[sha256sum] =3D
> > "5e304adf2880967c3b155bcf98e4f0809417a16bf91adb372fa065f38ab2c0cf"
> > >
> > >   inherit useradd
> > >
> > >
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#97894):
> > > https://lists.openembedded.org/g/openembedded-devel/message/97894
> > > Mute This Topic: https://lists.openembedded.org/mt/92477643/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b
> > > [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>

--000000000000fd8cdb05e431c4bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jul 19, 2022 at 8:03 PM <a href=3D"mailto:wangmy@fu=
jitsu.com">wangmy@fujitsu.com</a> &lt;<a href=3D"mailto:wangmy@fujitsu.com"=
>wangmy@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
The directory name changed after the source package was unzipped. <br>
1.3.23: the unzipped directory name does not have a version number, it is l=
ogcheck.<br>
1.3.24: the unzipped directory name has a version number. It is logcheck-1.=
3.24.<br>
There is no official explanation for this change.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ok thanks. I was=
 not sure of this was intentional. Thanks for explaining=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><br>
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
&gt; Sent: Tuesday, July 19, 2022 9:41 PM<br>
&gt; To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C &lt;<a href=3D"mailto:wa=
ngmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;;<br>
&gt; <a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D=
"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt; Subject: Re: [oe] [meta-perl] PATCH] logcheck: upgrade 1.3.23 -&gt; 1.=
3.24<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On 7/19/22 2:15 AM, wangmy wrote:<br>
&gt; &gt; Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.c=
om" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0.../logcheck/{<a href=3D"http://logcheck_1.3.23.bb" r=
el=3D"noreferrer" target=3D"_blank">logcheck_1.3.23.bb</a> =3D&gt; <a href=
=3D"http://logcheck_1.3.24.bb" rel=3D"noreferrer" target=3D"_blank">logchec=
k_1.3.24.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 +---<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 3 deletions(-)<br>
&gt; &gt;=C2=A0 =C2=A0rename meta-perl/recipes-extended/logcheck/{<a href=
=3D"http://logcheck_1.3.23.bb" rel=3D"noreferrer" target=3D"_blank">logchec=
k_1.3.23.bb</a> =3D&gt;<br>
&gt; &gt; <a href=3D"http://logcheck_1.3.24.bb" rel=3D"noreferrer" target=
=3D"_blank">logcheck_1.3.24.bb</a>} (96%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-perl/recipes-extended/logcheck/<a href=3D"http:=
//logcheck_1.3.23.bb" rel=3D"noreferrer" target=3D"_blank">logcheck_1.3.23.=
bb</a><br>
&gt; &gt; b/meta-perl/recipes-extended/logcheck/<a href=3D"http://logcheck_=
1.3.24.bb" rel=3D"noreferrer" target=3D"_blank">logcheck_1.3.24.bb</a><br>
&gt; &gt; similarity index 96%<br>
&gt; &gt; rename from meta-perl/recipes-extended/logcheck/<a href=3D"http:/=
/logcheck_1.3.23.bb" rel=3D"noreferrer" target=3D"_blank">logcheck_1.3.23.b=
b</a><br>
&gt; &gt; rename to meta-perl/recipes-extended/logcheck/<a href=3D"http://l=
ogcheck_1.3.24.bb" rel=3D"noreferrer" target=3D"_blank">logcheck_1.3.24.bb<=
/a><br>
&gt; &gt; index b40d52ab94..ea3dd5a4c9 100644<br>
&gt; &gt; --- a/meta-perl/recipes-extended/logcheck/<a href=3D"http://logch=
eck_1.3.23.bb" rel=3D"noreferrer" target=3D"_blank">logcheck_1.3.23.bb</a><=
br>
&gt; &gt; +++ b/meta-perl/recipes-extended/logcheck/<a href=3D"http://logch=
eck_1.3.24.bb" rel=3D"noreferrer" target=3D"_blank">logcheck_1.3.24.bb</a><=
br>
&gt; &gt; @@ -14,9 +14,7 @@ LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://LICENSE;md5=3Dc93c0550bd3173f4504b2cbd8991e50b&quot;<br>
&gt; &gt;=C2=A0 =C2=A0SRC_URI =3D &quot;${DEBIAN_MIRROR}/main/l/${BPN}/${BP=
N}_${PV}.tar.xz \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://99_logchec=
k \<br>
&gt; &gt;=C2=A0 =C2=A0&quot;<br>
&gt; &gt; -SRC_URI[sha256sum] =3D<br>
&gt; &quot;a2188ba549fff4412c82074b271884ff66d25f3fdb2a41916e817ce676855b29=
&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -S =3D &quot;${WORKDIR}/${BPN}&quot;<br>
&gt; <br>
&gt; S is not needed to be set here anymore ? Is this change documented som=
ewhere<br>
&gt; <br>
&gt; &gt; +SRC_URI[sha256sum] =3D<br>
&gt; &quot;5e304adf2880967c3b155bcf98e4f0809417a16bf91adb372fa065f38ab2c0cf=
&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0inherit useradd<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#97894):<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/me=
ssage/97894" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/message/97894</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/924=
77643/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/92477643/1997914</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.o=
penembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembed=
ded.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-devel/unsub</a><br>
&gt; &gt; [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem=
@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
</blockquote></div></div>

--000000000000fd8cdb05e431c4bc--

