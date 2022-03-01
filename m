Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37B1C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 11:41:10 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.7100.1646134869779749388
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 03:41:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LZAZojq4;
 spf=pass (domain: gmail.com, ip: 209.85.216.41,
 mailfrom: samuli.piippo@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 p3-20020a17090a680300b001bbfb9d760eso1808965pjj.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 03:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qs6y3+R18EL7XhHPvw+jtzhVf8A62P0dzWQN+4TXVUM=;
        b=LZAZojq4fAXnQ6p+191em3iFfvJYEEAX2PIlsucerDC+mBojMFwQvJHyLNLtgH9CLN
         EfupTUGHvWV3OJ/zJ2p2Wx5tWjCHxRcypMi+7wZQ/yH3vkt4o6OCF+Iu2+segSL3TfFw
         sPa+ONUnP4OcmmpJKc/jtyuVLN+yrhSYmCkwRbWFtXAztBw6/P5pQPCn++VdzwfzIkMm
         GzOy4UDcgXh+qSoiOMWfXi/O8/c/ZYvifIt1pU7jB2Fk4A165tNnzPXrPK44+NWqIHMo
         FAc9TZHLoqZ3TTeIg4QAaASIK/PJnxrOb5H5KRJCUVordFC6kwqmBKyGrG5DHn3BssYr
         MOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qs6y3+R18EL7XhHPvw+jtzhVf8A62P0dzWQN+4TXVUM=;
        b=dj0Lq8hLCohTx9W7XqbRP6C+dTrnr5Mb0kR5U2BslvvjaF8qc2WsNT6HwVnoyoJqN4
         YBe9/0+zlrNi/tyVQ2jAFeRC7R96ruUmJZV3bd2Tx8BUN0zuhr+ZYnAWdKn/LizH4SpQ
         TDv26Ai82h7xb63Fyyocw7H2JKpvpQIgW2wbt6qc1fOldJUAwL6ad+b+zWgxBeJQDFMK
         likq800/5DZRwg23WRVH7LAcL+LHeCeWyqWQZMoLfdAvf7JZNvHIHvkSuF1Ln8JFbYe0
         ClNM95WD9LREe0cCnhIMKmp1BiAXvq/bsQ7avHvjWL2DdV+qVni708CHQ/2tNwRKl50P
         Y1xw==
X-Gm-Message-State: AOAM530Rts0/sAwNKrweMkQ3NeOA8Z+WrZOze/AcQ+VLrgdPgE0dAL9Y
	w8a/7kj/9XOW73P+90NIldUkLHQNk1+EF44zRLehakLo
X-Google-Smtp-Source: 
 ABdhPJxYYQwf+UPL6mETr304/FCMuYy5DpxIpBD3Lmpksv9gtuL5LcGNfpr2GWMMZAKEk0k5pUGlREnbrrp7DA0qUEA=
X-Received: by 2002:a17:903:285:b0:14f:daea:e8d9 with SMTP id
 j5-20020a170903028500b0014fdaeae8d9mr24730156plr.128.1646134869169; Tue, 01
 Mar 2022 03:41:09 -0800 (PST)
MIME-Version: 1.0
References: <20220301093355.2746877-1-samuli.piippo@qt.io>
 <20220301093355.2746877-2-samuli.piippo@qt.io>
 <04253AFB-FAAA-4C9E-BDEB-BBCFAACDAFD9@iki.fi>
In-Reply-To: <04253AFB-FAAA-4C9E-BDEB-BBCFAACDAFD9@iki.fi>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Tue, 1 Mar 2022 13:40:57 +0200
Message-ID: 
 <CABXoSoVQQDj9KnhG1_oU9p5e9ZOY25x8qVb2LU1KZm8krwd0gg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-antrl4-runtime: add recipe
To: Anders Montonen <Anders.Montonen@iki.fi>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002118dc05d926a47c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 11:41:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95629

--0000000000002118dc05d926a47c
Content-Type: text/plain; charset="UTF-8"

d'oh!
v2 sent.

-samuli

On Tue, 1 Mar 2022 at 12:16, Anders Montonen <Anders.Montonen@iki.fi> wrote:

> Hi,
>
> > On 1 Mar 2022, at 11:33, Samuli Piippo <samuli.piippo@gmail.com> wrote:
> >
> > Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> > ---
> > .../python/python3-antrl4-runtime_4.9.2.bb            | 11 +++++++++++
> > 1 file changed, 11 insertions(+)
> > create mode 100644 meta-python/recipes-devtools/python/
> python3-antrl4-runtime_4.9.2.bb
>
> Spelling mistake, python3-antrl4-runtime_4.9.2.bb ->
> python3-antlr4-runtime_4.9.2.bb
>
> -a
>
> >
> > diff --git a/meta-python/recipes-devtools/python/
> python3-antrl4-runtime_4.9.2.bb b/meta-python/recipes-devtools/python/
> python3-antrl4-runtime_4.9.2.bb
> > new file mode 100644
> > index 000000000..6d67861a2
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/
> python3-antrl4-runtime_4.9.2.bb
> > @@ -0,0 +1,11 @@
> > +SUMMARY = "ANTLR runtime for Python"
> > +LICENSE = "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =
> "file://PKG-INFO;md5=c96f0ee5f5d08fd4387e5f00507bb13e"
> > +
> > +SRC_URI[sha256sum] =
> "31f5abdc7faf16a1a6e9bf2eb31565d004359b821b09944436a34361929ae85a"
> > +
> > +PYPI_PACKAGE = "antlr4-python3-runtime"
> > +
> > +inherit pypi setuptools_build_meta
> > +
> > +BBCLASSEXTEND = "nativesdk native"
> > --
> > 2.25.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#95622):
> https://lists.openembedded.org/g/openembedded-devel/message/95622
> > Mute This Topic: https://lists.openembedded.org/mt/89472243/3618057
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Anders.Montonen@iki.fi]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>

--0000000000002118dc05d926a47c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>d&#39;oh! <br></div><div>v2 sent.</div><div><br></div=
><div>-samuli<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, 1 Mar 2022 at 12:16, Anders Montonen &lt;<a href=
=3D"mailto:Anders.Montonen@iki.fi">Anders.Montonen@iki.fi</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
&gt; On 1 Mar 2022, at 11:33, Samuli Piippo &lt;<a href=3D"mailto:samuli.pi=
ippo@gmail.com" target=3D"_blank">samuli.piippo@gmail.com</a>&gt; wrote:<br=
>
&gt; <br>
&gt; Signed-off-by: Samuli Piippo &lt;<a href=3D"mailto:samuli.piippo@qt.io=
" target=3D"_blank">samuli.piippo@qt.io</a>&gt;<br>
&gt; ---<br>
&gt; .../python/<a href=3D"http://python3-antrl4-runtime_4.9.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-antrl4-runtime_4.9.2.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 +++++++++++<br>
&gt; 1 file changed, 11 insertions(+)<br>
&gt; create mode 100644 meta-python/recipes-devtools/python/<a href=3D"http=
://python3-antrl4-runtime_4.9.2.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3-antrl4-runtime_4.9.2.bb</a><br>
<br>
Spelling mistake, <a href=3D"http://python3-antrl4-runtime_4.9.2.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-antrl4-runtime_4.9.2.bb</a> -&gt; <a=
 href=3D"http://python3-antlr4-runtime_4.9.2.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-antlr4-runtime_4.9.2.bb</a><br>
<br>
-a<br>
<br>
&gt; <br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-antrl4-runtime_4.9.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
antrl4-runtime_4.9.2.bb</a> b/meta-python/recipes-devtools/python/<a href=
=3D"http://python3-antrl4-runtime_4.9.2.bb" rel=3D"noreferrer" target=3D"_b=
lank">python3-antrl4-runtime_4.9.2.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..6d67861a2<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-an=
trl4-runtime_4.9.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-antrl4-=
runtime_4.9.2.bb</a><br>
&gt; @@ -0,0 +1,11 @@<br>
&gt; +SUMMARY =3D &quot;ANTLR runtime for Python&quot;<br>
&gt; +LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;md5=3Dc96f0ee5f5d08fd4387e=
5f00507bb13e&quot;<br>
&gt; +<br>
&gt; +SRC_URI[sha256sum] =3D &quot;31f5abdc7faf16a1a6e9bf2eb31565d004359b82=
1b09944436a34361929ae85a&quot;<br>
&gt; +<br>
&gt; +PYPI_PACKAGE =3D &quot;antlr4-python3-runtime&quot;<br>
&gt; +<br>
&gt; +inherit pypi setuptools_build_meta<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;nativesdk native&quot;<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#95622): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/95622" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/95622</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89472243=
/3618057" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/89472243/3618057</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Anders.Montonen@iki=
.fi" target=3D"_blank">Anders.Montonen@iki.fi</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div></div>

--0000000000002118dc05d926a47c--

