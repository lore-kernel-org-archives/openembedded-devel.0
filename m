Return-Path: <maira.canal@usp.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D18C433F5
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 21:58:19 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web12.4143.1634939895476644330
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Oct 2021 14:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@usp.br header.s=usp-google header.b=C3xdkhUO;
 spf=pass (domain: usp.br, ip: 209.85.166.41, mailfrom: maira.canal@usp.br)
Received: by mail-io1-f41.google.com with SMTP id n77so7117745iod.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Oct 2021 14:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gOfxYQvXonbTu7DFuNqODgqLRJ7PRSqeRfe5Us6vt7o=;
        b=C3xdkhUO/EryatQSybBbmNrOYwTm6r79kIQO6gWCAfU6NhvNBN1TCPEg2rgxLdSAEF
         2yfLO+MMyq32V8frimCz31k5oFBpcc5EgpgXkhj3+GinIbHBP3NSSAKUsE6FETIbsVU0
         BQMdVbzvlLt1ezweIjhcdXzOrQf8tz8VumFM+CRSoGr5tcOGx2qBDD3jFJ9IgR8z8uPc
         TBajgCMTXTOKJ4212xtvhk3iLpnxHqdCrMQoyskJlN8d1/NURYrJCYiRKQUnz93xDRvi
         Sxd5okdWomu5aIRhGaH9ZBPO3vCuw4mwxgbNNKYxFAKkeIqNTKZKgEOtTRRZbA5e2Z2u
         hFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gOfxYQvXonbTu7DFuNqODgqLRJ7PRSqeRfe5Us6vt7o=;
        b=xcQergyTpsvjcSrq6ajMzMdvZ02D8AfljtVHtwlx9wtxpSp+k1A8PMva/WsEMrzF1W
         fM7kDiiQmnFd4o/nyJOTQUDN/46dtmfsrxmI37hGRd2sRDGNQWOvuOREKzbW6XVe9iPi
         L1qNVuqhsf7t2QR9rNTFVkqYAxjknPm2mhi7aEWqsXstkR46VttLRaVFyv2P5JXxkscO
         5D/44J2gYbTZ4jBfmK7422mVerXKI1R4ZPzcXvt64p0dwsFrWpXOnFFbEGW1+soMYnI9
         96CkPhCCqdEsdFuojYe37cY+h6J0/vz/k81OWYmMHHXR76AFHAjEc9thCTzc37f3FqVg
         pkUg==
X-Gm-Message-State: AOAM533inwfOmGATCQGmfLqVWeZfti+e2zhBWrx8FvZ1yfaSNX3qMAsx
	PwxE0fMik8gljkxFPNY9eWlpwTfhZHtXnq8gaiI8mQ==
X-Google-Smtp-Source: 
 ABdhPJx9IaAyTM7cdZDuwqsjgNqXObWqHUdEVhTW9GQhLyrXINrQtTMVvlI2mZDxjEExRmTadkJSuI37aeWmruwHIJA=
X-Received: by 2002:a5d:80d6:: with SMTP id h22mr1440250ior.152.1634939894822;
 Fri, 22 Oct 2021 14:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <YXKu7Qkr246L9qD6@fedora>
 <601c36e4-edb2-0359-81c4-f7b051c95bf2@gmail.com>
In-Reply-To: <601c36e4-edb2-0359-81c4-f7b051c95bf2@gmail.com>
From: =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>
Date: Fri, 22 Oct 2021 18:58:03 -0300
Message-ID: 
 <CAH7FV3m+897rUhvWtwn-pDvy6cppnyRpnHPcw5=oA2rgb-gQvQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][dunfell][PATCH] python3-fasteners: update 0.15
 -> 0.16.3
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a973fa05cef81be1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Oct 2021 21:58:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93543

--000000000000a973fa05cef81be1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Armin, thanks for your reply.

The 0.15 version of the fasteners package depends on a library called
monotonic (https://pypi.org/project/monotonic/), which only supports Python
2 and <3.3. Therefore, the 0.15 version of the fasteners package results in
a ModuleNotFoundError: No module named 'monotonic' on Python 3.8. This
result in a build error on Yocto, as you can see on this issue (
https://github.com/conan-io/meta-conan/issues/16).

The python3-fasteners package stopped depending on the monotonic package on
version 0.16 and, as a result, started supporting Python 3.8.

Considering that, I do believe it will be necessary to update the other
stable branches.


Em sex., 22 de out. de 2021 =C3=A0s 18:18, akuster808 <akuster808@gmail.com=
>
escreveu:

> Maira,
>
> On 10/22/21 5:30 AM, Ma=C3=ADra Canal via lists.openembedded.org wrote:
> > Updates the python3-fasteners package considering that the 0.15 version
> > doesn't support Python 3.8, only Python 3.5 or less. The 0.16.3 version
> > support Python 3.8.
> >
> > The non-support of Python 3.8 results in the malfunction of many layers
> > in the dunfell branch.
>
> Thanks for the patch. Can you expand on what you mean by "malfunction"?
> The Python 3.8 information leads me to believe the other stable branches
> will need to update as well.
>
> - Armin
> >
> > Signed-off-by: Ma=C3=ADra Canal <maira.canal@usp.br>
> > ---
> >  ...on3-fasteners_0.15.bb =3D> python3-fasteners_0.16.3.bb} | 9 +++++++=
--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >  rename meta-python/recipes-devtools/python/{python3-fasteners_0.15.bb
> =3D> python3-fasteners_0.16.3.bb} (51%)
> >
> > diff --git a/meta-python/recipes-devtools/python/
> python3-fasteners_0.15.bb b/meta-python/recipes-devtools/python/
> python3-fasteners_0.16.3.bb
> > similarity index 51%
> > rename from meta-python/recipes-devtools/python/
> python3-fasteners_0.15.bb
> > rename to meta-python/recipes-devtools/python/
> python3-fasteners_0.16.3.bb
> > index 8786a1484..1ba2c6f20 100644
> > --- a/meta-python/recipes-devtools/python/python3-fasteners_0.15.bb
> > +++ b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> > @@ -3,7 +3,12 @@ HOMEPAGE =3D "https://github.com/harlowja/fasteners"
> >  LICENSE =3D "Apache-2.0"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4476c4be31402271e101d9a4a34=
30d52"
> >
> > -SRC_URI[md5sum] =3D "440f8ab461c8fed941355860d8669556"
> > -SRC_URI[sha256sum] =3D
> "3a176da6b70df9bb88498e1a18a9e4a8579ed5b9141207762368a1017bf8f5ef"
> > +SRC_URI[md5sum] =3D "243188fe770ad60e9da722bef9dc7a78"
> > +SRC_URI[sha256sum] =3D
> "b1ab4e5adfbc28681ce44b3024421c4f567e705cc3963c732bf1cba3348307de"
> >
> >  inherit pypi setuptools3
> > +
> > +RDEPENDS:${PN} +=3D "\
> > +    ${PYTHON_PN}-logging \
> > +    ${PYTHON_PN}-fcntl \
> > +"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#93534):
> https://lists.openembedded.org/g/openembedded-devel/message/93534
> > Mute This Topic: https://lists.openembedded.org/mt/86512234/3616698
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> akuster808@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--000000000000a973fa05cef81be1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Armin, thanks for your reply. <br><br>The 0.15 version of =
the fasteners package depends on a library called monotonic (<a href=3D"htt=
ps://pypi.org/project/monotonic/">https://pypi.org/project/monotonic/</a>),=
 which only supports Python 2 and &lt;3.3. Therefore, the 0.15 version of t=
he fasteners package results in a ModuleNotFoundError: No module named &#39=
;monotonic&#39; on Python 3.8. This result in a build error on Yocto, as yo=
u can see on this issue (<a href=3D"https://github.com/conan-io/meta-conan/=
issues/16">https://github.com/conan-io/meta-conan/issues/16</a>).<br><br>Th=
e python3-fasteners package stopped depending on the monotonic package on v=
ersion 0.16 and, as a result, started supporting Python 3.8.<br><br>Conside=
ring that, I do believe it will be necessary to update the other stable bra=
nches.</div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">Em sex., 22 de out. de 2021 =C3=A0s 18:18, akuster808 &lt;<a href=
=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; escreveu:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Maira,<br>
<br>
On 10/22/21 5:30 AM, Ma=C3=ADra Canal via <a href=3D"http://lists.openembed=
ded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wr=
ote:<br>
&gt; Updates the python3-fasteners package considering that the 0.15 versio=
n<br>
&gt; doesn&#39;t support Python 3.8, only Python 3.5 or less. The 0.16.3 ve=
rsion<br>
&gt; support Python 3.8.<br>
&gt;<br>
&gt; The non-support of Python 3.8 results in the malfunction of many layer=
s<br>
&gt; in the dunfell branch.<br>
<br>
Thanks for the patch. Can you expand on what you mean by &quot;malfunction&=
quot;?<br>
The Python 3.8 information leads me to believe the other stable branches<br=
>
will need to update as well.<br>
<br>
- Armin<br>
&gt;<br>
&gt; Signed-off-by: Ma=C3=ADra Canal &lt;<a href=3D"mailto:maira.canal@usp.=
br" target=3D"_blank">maira.canal@usp.br</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...<a href=3D"http://on3-fasteners_0.15.bb" rel=3D"noreferrer" t=
arget=3D"_blank">on3-fasteners_0.15.bb</a> =3D&gt; <a href=3D"http://python=
3-fasteners_0.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastene=
rs_0.16.3.bb</a>} | 9 +++++++--<br>
&gt;=C2=A0 1 file changed, 7 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 rename meta-python/recipes-devtools/python/{<a href=3D"http://py=
thon3-fasteners_0.15.bb" rel=3D"noreferrer" target=3D"_blank">python3-faste=
ners_0.15.bb</a> =3D&gt; <a href=3D"http://python3-fasteners_0.16.3.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-fasteners_0.16.3.bb</a>} (51%)<br=
>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-fasteners_0.15.bb" rel=3D"noreferrer" target=3D"_blank">python3-fasten=
ers_0.15.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-fasteners_0.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-fast=
eners_0.16.3.bb</a><br>
&gt; similarity index 51%<br>
&gt; rename from meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-fasteners_0.15.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastene=
rs_0.15.bb</a><br>
&gt; rename to meta-python/recipes-devtools/python/<a href=3D"http://python=
3-fasteners_0.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastene=
rs_0.16.3.bb</a><br>
&gt; index 8786a1484..1ba2c6f20 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-fa=
steners_0.15.bb" rel=3D"noreferrer" target=3D"_blank">python3-fasteners_0.1=
5.bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-fa=
steners_0.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-fasteners_0=
.16.3.bb</a><br>
&gt; @@ -3,7 +3,12 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/harl=
owja/fasteners" rel=3D"noreferrer" target=3D"_blank">https://github.com/har=
lowja/fasteners</a>&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D4476c4be31402271=
e101d9a4a3430d52&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI[md5sum] =3D &quot;440f8ab461c8fed941355860d8669556&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;3a176da6b70df9bb88498e1a18a9e4a8579ed5b9=
141207762368a1017bf8f5ef&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;243188fe770ad60e9da722bef9dc7a78&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;b1ab4e5adfbc28681ce44b3024421c4f567e705c=
c3963c732bf1cba3348307de&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 inherit pypi setuptools3<br>
&gt; +<br>
&gt; +RDEPENDS:${PN} +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 ${PYTHON_PN}-logging \<br>
&gt; +=C2=A0 =C2=A0 ${PYTHON_PN}-fcntl \<br>
&gt; +&quot;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#93534): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/93534" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/93534</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86512234=
/3616698" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/86512234/3616698</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:akuster808@gmail.co=
m" target=3D"_blank">akuster808@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div>

--000000000000a973fa05cef81be1--

