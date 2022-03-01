Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9F2C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 14:46:54 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.8948.1646146012599541007
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 06:46:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AQmL4y40;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id a1so5540422qta.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 06:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n9Wl55b5zqA4J9h+Wmim9tmfruv3fIGwViGNqT8Wj2g=;
        b=AQmL4y40V4VwaH2rzdGBJB50tYPD8qdKhhtHBI3NZp8GrboX24DNXlZlxLmssm+AgU
         Q3zpCheens2d9bwqr5nf2v1mF9Nh3N47yNYLDVogT26lt5cDQJAx2ZacoT5OBLPkfj7N
         xyNeSRB/ynVDvNxghN/uGNhez8i/uF+vd1TgpsktkUHNQ5+k6fq5o1+8qgYcm71RP/tt
         cB6LziOCSvoIrRd+2sB61e6MC6fOoGP37GqlE6+BuQhDqPSubmZyl4Uu7YgzElUpi0dL
         701AiwI8FjrqSbPUgcdI9TvABF5Pb6sTmmPmIDqhjN3RjRH/IiD1teXKY9czzVLsRdEF
         weCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n9Wl55b5zqA4J9h+Wmim9tmfruv3fIGwViGNqT8Wj2g=;
        b=iJfHaocVZqNukwN/klUR1so103reXpa0/FouC7XGky1qAkUox4SnGEtWP9+SA+vXnp
         s6wVuayT5wsjt8KjAzz1bA2itOd9oJ6bJdFKHdI/yFJUBmz9UQXaQulua7OWM6QdDGWZ
         b/eceN8Yro6YAYNMuK2Gd+F3+K+liZGQtnAI1CIXSuL6yh0o4FuZTekwnN3jMa9RCZPU
         Gm52H5OWwPpIytlyyMML8cPNB1O3JKI1uzuPX15SQJZVOthtvtw2wuvai4fcOGh+gDXU
         V5U03EyyCka7JGSySbSOd6RW6dQqi+Owzo7BuY3uO4h7U1FM1wHB3sjfXbhslVpr/Lmv
         hbVQ==
X-Gm-Message-State: AOAM532oVqz909hAmnnxFdqwfMpwBwSelhxwHupxy9bDMkozQFpEng3L
	rFOI6+2AduG/rjJ6En4mXAoSNPFSzx2SZy2C1yA=
X-Google-Smtp-Source: 
 ABdhPJysiD3JkjGO99jOK6CWncpvoZ/56W2v2K7q0bs6fD632C6mWtyBWQDiX2LgG2vTFm0Dy7eu9x38RnCVVCYFcGE=
X-Received: by 2002:ac8:7dd1:0:b0:2de:600:a5ab with SMTP id
 c17-20020ac87dd1000000b002de0600a5abmr20037952qte.532.1646146011460; Tue, 01
 Mar 2022 06:46:51 -0800 (PST)
MIME-Version: 1.0
References: <20220228215547.17414-1-jsbronder@cold-front.org>
 <CAMKF1soSRc1dFegS7Me0xcjJU3NfO2BCH-=o-wawjBHSnb4dqA@mail.gmail.com>
 <38d51c4e-880c-38b8-e6f1-618e6f4b49fb@windriver.com>
In-Reply-To: <38d51c4e-880c-38b8-e6f1-618e6f4b49fb@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Mar 2022 06:46:39 -0800
Message-ID: 
 <CAMKF1spH-xA=hL5EE2SDc1jEsEgDyz8KUQ_qm70NMtbc29Ucjw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-termcolor: drop recipe
To: hongxu <hongxu.jia@windriver.com>
Cc: Justin Bronder <jsbronder@cold-front.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000042f9f805d9293c1c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 14:46:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95634

--00000000000042f9f805d9293c1c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 1, 2022 at 1:53 AM hongxu <hongxu.jia@windriver.com> wrote:

> On 3/1/22 06:34, Khem Raj wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > Hongxu added this recipe in 2019, I would like to hear from him. Maybe
> > he has future plans for this recipe.
>
> This recipe is required by tensorflow, but long time no maintain, I am
> open to remove it in OE
>
> I will move the recipe to meta-tensorflow


There is a fix for it to build with wheel so we don=E2=80=99t have need to =
remove
it and since it=E2=80=99s still needed by Other layers it makes sense to ke=
ep it
here

>
>
> //Hongxu
>
> > On Mon, Feb 28, 2022 at 1:55 PM Justin Bronder <jsbronder@cold-front.or=
g>
> wrote:
> >> No releases since 2011, no upstream repository and does not build with
> >> bdist_wheel.  If you depend upon this recipe, please work with upstrea=
m
> >> to update the package to PEP-517 packaging.
> >>
> >> Note that there are alternatives on PyPI and numerous forks on github,
> >> but none appear to have become canonical.
> >>
> >> Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> >> ---
> >>   .../packagegroups/packagegroup-meta-python.bb        |  1 -
> >>   .../python/python3-termcolor_1.1.0.bb                | 12
> ------------
> >>   2 files changed, 13 deletions(-)
> >>   delete mode 100644 meta-python/recipes-devtools/python/
> python3-termcolor_1.1.0.bb
> >>
> >> diff --git a/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb
> >> index 9626231bba..dbfa991ebe 100644
> >> --- a/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb
> >> +++ b/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb
> >> @@ -421,7 +421,6 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
> >>       python3-sympy \
> >>       python3-tabulate \
> >>       python3-term \
> >> -    python3-termcolor \
> >>       python3-textparser \
> >>       python3-texttable \
> >>       python3-thrift \
> >> diff --git a/meta-python/recipes-devtools/python/
> python3-termcolor_1.1.0.bb b/meta-python/recipes-devtools/python/
> python3-termcolor_1.1.0.bb
> >> deleted file mode 100644
> >> index 17df7f983d..0000000000
> >> --- a/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb
> >> +++ /dev/null
> >> @@ -1,12 +0,0 @@
> >> -SUMMARY =3D "ANSII Color formatting for output in terminal"
> >> -HOMEPAGE =3D "https://pypi.python.org/pypi/termcolor"
> >> -SECTION =3D "devel/python"
> >> -LICENSE =3D "MIT"
> >> -LIC_FILES_CHKSUM =3D
> "file://COPYING.txt;md5=3D809e8749b63567978acfbd81d9f6a27d"
> >> -
> >> -inherit pypi setuptools3
> >> -
> >> -SRC_URI[md5sum] =3D "043e89644f8909d462fbbfa511c768df"
> >> -SRC_URI[sha256sum] =3D
> "1d6d69ce66211143803fbc56652b41d73b4a400a2891d7bf7a1cdf4c02de613b"
> >> -
> >> -BBCLASSEXTEND =3D "native"
> >> --
> >> 2.35.1
> >>
> >>
> >>
> >>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95624):
> https://lists.openembedded.org/g/openembedded-devel/message/95624
> Mute This Topic: https://lists.openembedded.org/mt/89462395/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000042f9f805d9293c1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Mar 1, 2022 at 1:53 AM hongxu &lt;<a href=3D"mailto=
:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">On 3/1/22 06:34, Khem Raj wrote:<br>
&gt; [Please note: This e-mail is from an EXTERNAL e-mail address]<br>
&gt;<br>
&gt; Hongxu added this recipe in 2019, I would like to hear from him. Maybe=
<br>
&gt; he has future plans for this recipe.<br>
<br>
This recipe is required by tensorflow, but long time no maintain, I am <br>
open to remove it in OE<br>
<br>
I will move the recipe to meta-tensorflow</blockquote><div dir=3D"auto"><br=
></div><div dir=3D"auto">There is a fix for it to build with wheel so we do=
n=E2=80=99t have need to remove it and since it=E2=80=99s still needed by O=
ther layers it makes sense to keep it here=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex" dir=3D"auto"><br>
<br>
//Hongxu<br>
<br>
&gt; On Mon, Feb 28, 2022 at 1:55 PM Justin Bronder &lt;<a href=3D"mailto:j=
sbronder@cold-front.org" target=3D"_blank">jsbronder@cold-front.org</a>&gt;=
 wrote:<br>
&gt;&gt; No releases since 2011, no upstream repository and does not build =
with<br>
&gt;&gt; bdist_wheel.=C2=A0 If you depend upon this recipe, please work wit=
h upstream<br>
&gt;&gt; to update the package to PEP-517 packaging.<br>
&gt;&gt;<br>
&gt;&gt; Note that there are alternatives on PyPI and numerous forks on git=
hub,<br>
&gt;&gt; but none appear to have become canonical.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Justin Bronder &lt;<a href=3D"mailto:jsbronder@cold=
-front.org" target=3D"_blank">jsbronder@cold-front.org</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-=
python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-python.bb=
</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
&gt;&gt;=C2=A0 =C2=A0.../python/<a href=3D"http://python3-termcolor_1.1.0.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-termcolor_1.1.0.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 ------------<br>
&gt;&gt;=C2=A0 =C2=A02 files changed, 13 deletions(-)<br>
&gt;&gt;=C2=A0 =C2=A0delete mode 100644 meta-python/recipes-devtools/python=
/<a href=3D"http://python3-termcolor_1.1.0.bb" rel=3D"noreferrer" target=3D=
"_blank">python3-termcolor_1.1.0.bb</a><br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-python/recipes-core/packagegroups/<a href=3D"htt=
p://packagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packa=
gegroup-meta-python.bb</a> b/meta-python/recipes-core/packagegroups/<a href=
=3D"http://packagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank=
">packagegroup-meta-python.bb</a><br>
&gt;&gt; index 9626231bba..dbfa991ebe 100644<br>
&gt;&gt; --- a/meta-python/recipes-core/packagegroups/<a href=3D"http://pac=
kagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup=
-meta-python.bb</a><br>
&gt;&gt; +++ b/meta-python/recipes-core/packagegroups/<a href=3D"http://pac=
kagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup=
-meta-python.bb</a><br>
&gt;&gt; @@ -421,7 +421,6 @@ RDEPENDS:packagegroup-meta-python3 =3D &quot;\=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-sympy \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-tabulate \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-term \<br>
&gt;&gt; -=C2=A0 =C2=A0 python3-termcolor \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-textparser \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-texttable \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-thrift \<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http:/=
/python3-termcolor_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-t=
ermcolor_1.1.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http=
://python3-termcolor_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-termcolor_1.1.0.bb</a><br>
&gt;&gt; deleted file mode 100644<br>
&gt;&gt; index 17df7f983d..0000000000<br>
&gt;&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-termcolor_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-termcolo=
r_1.1.0.bb</a><br>
&gt;&gt; +++ /dev/null<br>
&gt;&gt; @@ -1,12 +0,0 @@<br>
&gt;&gt; -SUMMARY =3D &quot;ANSII Color formatting for output in terminal&q=
uot;<br>
&gt;&gt; -HOMEPAGE =3D &quot;<a href=3D"https://pypi.python.org/pypi/termco=
lor" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/pypi/term=
color</a>&quot;<br>
&gt;&gt; -SECTION =3D &quot;devel/python&quot;<br>
&gt;&gt; -LICENSE =3D &quot;MIT&quot;<br>
&gt;&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING.txt;md5=3D809e8749b6356=
7978acfbd81d9f6a27d&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -inherit pypi setuptools3<br>
&gt;&gt; -<br>
&gt;&gt; -SRC_URI[md5sum] =3D &quot;043e89644f8909d462fbbfa511c768df&quot;<=
br>
&gt;&gt; -SRC_URI[sha256sum] =3D &quot;1d6d69ce66211143803fbc56652b41d73b4a=
400a2891d7bf7a1cdf4c02de613b&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.35.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#95624): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/95624" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/95624</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89462395/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89462395/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000042f9f805d9293c1c--

