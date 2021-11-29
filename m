Return-Path: <windel.bouwman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F00EC433F5
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 17:35:55 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web09.64551.1638207353629684564
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 09:35:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TMTejtwI;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: windel.bouwman@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id g14so75208018edb.8
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 09:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iFBYcPXfHfrJESWqEYSbZCoNDS8YARAj4+zUMLD0fiQ=;
        b=TMTejtwIa9v8DksqU0bFfrLR3i0Ih+76AvTwStjFtuilZCuqbpMBsUuR2AeUpQH5ht
         S4Udwlr7Om1nm6aizHZwJTn0bo/0Elp3m7wqxyq5+FyhHsiCJcvBnitJb4H9SHLciNC+
         1LMPczovpUEUUugEEelgidRfJNLuhXxTkwCwjlc/3R6w0aJI5cWuoxMOziJDM40J8bcw
         +SrRHJTrtyWo/8JkrUwV+CNR3pD16wWv6m3lndBB+d0cj0wlrRXgMefZTSVNNhFfuJrp
         EhgCWcU3tMMBt9KSUDXrQpHixvFFyPqZwUmXL7Uj3KVi1Rh4TL5kw2pB8DnQ6g9GkQ8h
         /08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iFBYcPXfHfrJESWqEYSbZCoNDS8YARAj4+zUMLD0fiQ=;
        b=na2Fz0XHVyNsb11Bl3K5vSR+9az6dSjHUQt2tIQtgjsP53SZinhdmRLDcSOUtH5Cr8
         FbhUsF92bqgGCmHKpDy6TN+c59sWDGampEfYEL3SUh6o/HMbgGx/RiQrtwJnE67358pt
         /rrCmDSpz/b226d8tZaICLDcS2fYVV98MeoLUciV26Bj9T6N4oOGLwHsWrDDp+KJBTPH
         dkBn36ixzpbpfKdGzylPQWmPV0+0SAtjcAI6yQX+yBsvsw+1mc3R0BQXFWo7p53QgarP
         7mKOHiiSqE26vhF2iFxrBv9Wa94iPmMz0JGVsyHu/4PSXk4bF5ISdk97xO5L5Bwpabi2
         Wfbg==
X-Gm-Message-State: AOAM531G2vzT2T+Sq68L+3pRcg/f2/Luu9N4nrIuUNPAOxi2M9x61r3K
	gGRpoQm2h4TbqgfLHUUh9I89I4fSCq5ORmWWKu4=
X-Google-Smtp-Source: 
 ABdhPJw582+Ywnob5lonDhIaroYbMn6MF6x6J/7RcaRsHe1SWOp3N5k7TWEKn7etZnKUIVww3AEZ6cnrWd1jqArAxBE=
X-Received: by 2002:a17:907:7ba4:: with SMTP id
 ne36mr62253872ejc.227.1638207352091;
 Mon, 29 Nov 2021 09:35:52 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAHMaQtB6aySwe6DjrGmAZXj9c8i1v6MSCX-Hfe7k3pvxW3RJtg@mail.gmail.com>
 <2076fc48-04ee-b7db-65d1-062c5438477f@gmail.com>
In-Reply-To: <2076fc48-04ee-b7db-65d1-062c5438477f@gmail.com>
From: Windel Bouwman <windel.bouwman@gmail.com>
Date: Mon, 29 Nov 2021 18:35:40 +0100
Message-ID: 
 <CAHMaQtBrRoXryLp3oZjuh5jWv8oJ5VButa2VUj3H3-2yHrVLrw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-coloredlogs: Added nativesdk
 python3-docutils: Added nativesdk and native python3-humanfriendly: Added
 nativesdk
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004a3b3b05d1f0dfc5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Nov 2021 17:35:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94140

--0000000000004a3b3b05d1f0dfc5
Content-Type: text/plain; charset="UTF-8"

This patch is for the hardknott branch. I'm sorry I did not tag it as such.

On Mon, Nov 29, 2021 at 6:06 PM Khem Raj <raj.khem@gmail.com> wrote:

> which branch are you proposing this patch for ?
> it seems to be not applicable to master and if its meant for release
> branches then tag it with appropriate release branch name in subject line.
>
> On 11/29/21 12:42 AM, Windel Bouwman wrote:
> > These changes are needed in order to build colcon as an SDK package.
> >
> > Signed-off-by: Windel Bouwman <windel.bouwman@gmail.com
> > <mailto:windel.bouwman@gmail.com>>
> > ---
> >   meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
> > <http://python3-coloredlogs_15.0.bb> | 2 +-
> >   meta-python/recipes-devtools/python/python3-docutils_0.17.bb
> > <http://python3-docutils_0.17.bb>    | 2 ++
> >   .../recipes-devtools/python/python3-humanfriendly_9.1.bb
> > <http://python3-humanfriendly_9.1.bb>        | 2 +-
> >   3 files changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git
> > a/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
> > <http://python3-coloredlogs_15.0.bb>
> > b/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
> > <http://python3-coloredlogs_15.0.bb>
> > index daeda6b2e..da4f7a574 100644
> > --- a/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
> > <http://python3-coloredlogs_15.0.bb>
> > +++ b/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
> > <http://python3-coloredlogs_15.0.bb>
> > @@ -20,4 +20,4 @@ RDEPENDS_${PN} += "\
> >       ${PYTHON_PN}-humanfriendly \
> >   "
> >
> > -BBCLASSEXTEND = "native"
> > +BBCLASSEXTEND = "native nativesdk"
> > diff --git
> > a/meta-python/recipes-devtools/python/python3-docutils_0.17.bb
> > <http://python3-docutils_0.17.bb>
> > b/meta-python/recipes-devtools/python/python3-docutils_0.17.bb
> > <http://python3-docutils_0.17.bb>
> > index 8605e93b5..f8cd205fa 100644
> > --- a/meta-python/recipes-devtools/python/python3-docutils_0.17.bb
> > <http://python3-docutils_0.17.bb>
> > +++ b/meta-python/recipes-devtools/python/python3-docutils_0.17.bb
> > <http://python3-docutils_0.17.bb>
> > @@ -7,3 +7,5 @@ LIC_FILES_CHKSUM =
> > "file://COPYING.txt;md5=836a1950177996968a49ff477a4a61c4"
> >   SRC_URI[sha256sum] =
> > "e2ffeea817964356ba4470efba7c2f42b6b0de0b04e66378507e3e2504bbff4c"
> >
> >   inherit pypi setuptools3
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> > diff --git
> > a/meta-python/recipes-devtools/python/python3-humanfriendly_9.1.bb
> > <http://python3-humanfriendly_9.1.bb>
> > b/meta-python/recipes-devtools/python/python3-humanfriendly_9.1.bb
> > <http://python3-humanfriendly_9.1.bb>
> > index fb6a7e3b6..a5f2031b2 100644
> > --- a/meta-python/recipes-devtools/python/python3-humanfriendly_9.1.bb
> > <http://python3-humanfriendly_9.1.bb>
> > +++ b/meta-python/recipes-devtools/python/python3-humanfriendly_9.1.bb
> > <http://python3-humanfriendly_9.1.bb>
> > @@ -21,4 +21,4 @@ RDEPENDS_${PN}_class-target += " \
> >       ${PYTHON_PN}-stringold \
> >   "
> >
> > -BBCLASSEXTEND = "native"
> > +BBCLASSEXTEND = "native nativesdk"
> > --
> > 2.25.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#94133):
> https://lists.openembedded.org/g/openembedded-devel/message/94133
> > Mute This Topic: https://lists.openembedded.org/mt/87373885/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--0000000000004a3b3b05d1f0dfc5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This patch is for the hardknott branch. I&#39;m sorry=
 I did not tag it as such.<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Nov 29, 2021 at 6:06 PM Khem Raj &lt;=
<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">which branch are yo=
u proposing this patch for ?<br>
it seems to be not applicable to master and if its meant for release <br>
branches then tag it with appropriate release branch name in subject line.<=
br>
<br>
On 11/29/21 12:42 AM, Windel Bouwman wrote:<br>
&gt; These changes are needed in order to build colcon as an SDK package.<b=
r>
&gt; <br>
&gt; Signed-off-by: Windel Bouwman &lt;<a href=3D"mailto:windel.bouwman@gma=
il.com" target=3D"_blank">windel.bouwman@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:windel.bouwman@gmail.com" target=3D"_blan=
k">windel.bouwman@gmail.com</a>&gt;&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-coloredlogs_15.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-color=
edlogs_15.0.bb</a> <br>
&gt; &lt;<a href=3D"http://python3-coloredlogs_15.0.bb" rel=3D"noreferrer" =
target=3D"_blank">http://python3-coloredlogs_15.0.bb</a>&gt; | 2 +-<br>
&gt;=C2=A0 =C2=A0meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-docutils_0.17.bb" rel=3D"noreferrer" target=3D"_blank">python3-docutils=
_0.17.bb</a> <br>
&gt; &lt;<a href=3D"http://python3-docutils_0.17.bb" rel=3D"noreferrer" tar=
get=3D"_blank">http://python3-docutils_0.17.bb</a>&gt; =C2=A0 =C2=A0| 2 ++<=
br>
&gt;=C2=A0 =C2=A0.../recipes-devtools/python/<a href=3D"http://python3-huma=
nfriendly_9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-humanfriendl=
y_9.1.bb</a> <br>
&gt; &lt;<a href=3D"http://python3-humanfriendly_9.1.bb" rel=3D"noreferrer"=
 target=3D"_blank">http://python3-humanfriendly_9.1.bb</a>&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A03 files changed, 4 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git <br>
&gt; a/meta-python/recipes-devtools/python/<a href=3D"http://python3-colore=
dlogs_15.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-coloredlogs_15.=
0.bb</a> <br>
&gt; &lt;<a href=3D"http://python3-coloredlogs_15.0.bb" rel=3D"noreferrer" =
target=3D"_blank">http://python3-coloredlogs_15.0.bb</a>&gt; <br>
&gt; b/meta-python/recipes-devtools/python/<a href=3D"http://python3-colore=
dlogs_15.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-coloredlogs_15.=
0.bb</a> <br>
&gt; &lt;<a href=3D"http://python3-coloredlogs_15.0.bb" rel=3D"noreferrer" =
target=3D"_blank">http://python3-coloredlogs_15.0.bb</a>&gt;<br>
&gt; index daeda6b2e..da4f7a574 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-co=
loredlogs_15.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-coloredlogs=
_15.0.bb</a> <br>
&gt; &lt;<a href=3D"http://python3-coloredlogs_15.0.bb" rel=3D"noreferrer" =
target=3D"_blank">http://python3-coloredlogs_15.0.bb</a>&gt;<br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-co=
loredlogs_15.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-coloredlogs=
_15.0.bb</a> <br>
&gt; &lt;<a href=3D"http://python3-coloredlogs_15.0.bb" rel=3D"noreferrer" =
target=3D"_blank">http://python3-coloredlogs_15.0.bb</a>&gt;<br>
&gt; @@ -20,4 +20,4 @@ RDEPENDS_${PN} +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-humanfriendly \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt; <br>
&gt; -BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; diff --git <br>
&gt; a/meta-python/recipes-devtools/python/<a href=3D"http://python3-docuti=
ls_0.17.bb" rel=3D"noreferrer" target=3D"_blank">python3-docutils_0.17.bb</=
a> <br>
&gt; &lt;<a href=3D"http://python3-docutils_0.17.bb" rel=3D"noreferrer" tar=
get=3D"_blank">http://python3-docutils_0.17.bb</a>&gt; <br>
&gt; b/meta-python/recipes-devtools/python/<a href=3D"http://python3-docuti=
ls_0.17.bb" rel=3D"noreferrer" target=3D"_blank">python3-docutils_0.17.bb</=
a> <br>
&gt; &lt;<a href=3D"http://python3-docutils_0.17.bb" rel=3D"noreferrer" tar=
get=3D"_blank">http://python3-docutils_0.17.bb</a>&gt;<br>
&gt; index 8605e93b5..f8cd205fa 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-do=
cutils_0.17.bb" rel=3D"noreferrer" target=3D"_blank">python3-docutils_0.17.=
bb</a> <br>
&gt; &lt;<a href=3D"http://python3-docutils_0.17.bb" rel=3D"noreferrer" tar=
get=3D"_blank">http://python3-docutils_0.17.bb</a>&gt;<br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-do=
cutils_0.17.bb" rel=3D"noreferrer" target=3D"_blank">python3-docutils_0.17.=
bb</a> <br>
&gt; &lt;<a href=3D"http://python3-docutils_0.17.bb" rel=3D"noreferrer" tar=
get=3D"_blank">http://python3-docutils_0.17.bb</a>&gt;<br>
&gt; @@ -7,3 +7,5 @@ LIC_FILES_CHKSUM =3D <br>
&gt; &quot;file://COPYING.txt;md5=3D836a1950177996968a49ff477a4a61c4&quot;<=
br>
&gt;=C2=A0 =C2=A0SRC_URI[sha256sum] =3D <br>
&gt; &quot;e2ffeea817964356ba4470efba7c2f42b6b0de0b04e66378507e3e2504bbff4c=
&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0inherit pypi setuptools3<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; diff --git <br>
&gt; a/meta-python/recipes-devtools/python/<a href=3D"http://python3-humanf=
riendly_9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-humanfriendly_=
9.1.bb</a> <br>
&gt; &lt;<a href=3D"http://python3-humanfriendly_9.1.bb" rel=3D"noreferrer"=
 target=3D"_blank">http://python3-humanfriendly_9.1.bb</a>&gt; <br>
&gt; b/meta-python/recipes-devtools/python/<a href=3D"http://python3-humanf=
riendly_9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-humanfriendly_=
9.1.bb</a> <br>
&gt; &lt;<a href=3D"http://python3-humanfriendly_9.1.bb" rel=3D"noreferrer"=
 target=3D"_blank">http://python3-humanfriendly_9.1.bb</a>&gt;<br>
&gt; index fb6a7e3b6..a5f2031b2 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-hu=
manfriendly_9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-humanfrien=
dly_9.1.bb</a> <br>
&gt; &lt;<a href=3D"http://python3-humanfriendly_9.1.bb" rel=3D"noreferrer"=
 target=3D"_blank">http://python3-humanfriendly_9.1.bb</a>&gt;<br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-hu=
manfriendly_9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-humanfrien=
dly_9.1.bb</a> <br>
&gt; &lt;<a href=3D"http://python3-humanfriendly_9.1.bb" rel=3D"noreferrer"=
 target=3D"_blank">http://python3-humanfriendly_9.1.bb</a>&gt;<br>
&gt; @@ -21,4 +21,4 @@ RDEPENDS_${PN}_class-target +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-stringold \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt; <br>
&gt; -BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#94133): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/94133" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/94133</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87373885=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/87373885/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div></div>

--0000000000004a3b3b05d1f0dfc5--

