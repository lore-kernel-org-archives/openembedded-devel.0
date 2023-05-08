Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD2CC77B73
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:23:48 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.103884.1683541422937088818
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=oiOnlblh;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f41dceb9d4so17927225e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 03:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683541421; x=1686133421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l1LJKjwC2DABSZ6KH3xIK0ijKv8P3PQ+2FOFgoTj0sw=;
        b=oiOnlblh3H6ZFv2JIE7Dz72xLURpxUo1fQ9IRKbr+NgJt0FdKOPInRPDSJAROH4d1r
         4KED0BIk2k2RbAoV94z2DbHRpWhCGItnazzCIVfaC1quni9S9Ve5n9Wi4tJ0h6M5MCGs
         6Ir8kRh4fgo0mkTDNgb8lgI7E2qc4RO1Ze5OM1++J9eeg4iYionwO+wcKlYNf4IOcuMJ
         IuvL+GWcv7af1q/poQfTlFexPGxHbOknXbCp6LUk8c2VtKCUjXQyQsBuIdDcc2Gf37VS
         W1qy+0uvxBppKVH8aA554MfIPOzA0MAlmQBcwfgffhXSSizjas3EuXjIfr5eWZSYwzf7
         5n4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683541421; x=1686133421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1LJKjwC2DABSZ6KH3xIK0ijKv8P3PQ+2FOFgoTj0sw=;
        b=TzLCFtMPZJdNAnp4Os6v2HkysngGbocNDPTL36EDacpljLDvqtSjRp5nqoFUN9Hg8P
         t7yFYKrlUNyKLQClzkqNQLqvgJpLx5iny67s2YOwTv0Q42CP8kGk3O9zMQCKin0e0bL7
         9Wx7BsWSn+YDZ+Ri8sy8+X+Q41vYyxkxJDrIEyOLVjLyonMndhHiNEBOJP2GIh5in4gx
         wTKd1s/tb0OopdvLUmqzGAQIstQd3rEUhw5Rfr1Qo3FnNV7B+4++sqfI4JcbazDP9Mcg
         /7oTE/WU6W1aYdvquRjT7znz16imQfVnSCX/DIeC1FsXLmQQRKYJzRnmJbZbnUyRiwTP
         M8rg==
X-Gm-Message-State: AC+VfDxn4VgU+Me62i9o3i/FARHvpI0lZqsRMymT6sW0ntMvJzVJogD0
	cup2WKChmobaXe2//uKrCLuSR998scZ8GRdaesY=
X-Google-Smtp-Source: ACHHUZ7LpDwlEi2j9EDu0IoEED+zeCa9A+AtDTh2sEcchfNNArp+6Zr6aMuzBYGH1HOQg5ySL+hOrLbBTHk2rAWrauQ=
X-Received: by 2002:a5d:5641:0:b0:306:3817:4a80 with SMTP id
 j1-20020a5d5641000000b0030638174a80mr7276180wrw.0.1683541420846; Mon, 08 May
 2023 03:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230507224354.1149327-1-Martin.Jansa@gmail.com> <CAMKF1soqoDUTOh2ukekKHnre=4yUj9E4LFa9WK7yHg6NOWyCqg@mail.gmail.com>
In-Reply-To: <CAMKF1soqoDUTOh2ukekKHnre=4yUj9E4LFa9WK7yHg6NOWyCqg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 8 May 2023 12:23:29 +0200
Message-ID: <CA+chaQfnY7rzKcvhgKO2bKb=X_OLQ+oQ3bCdwPhrUUOYCQz+Vg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 01/16] lirc: fix do_install with multilib
To: Khem Raj <raj.khem@gmail.com>, akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005ab36f05fb2c0822"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102421

--0000000000005ab36f05fb2c0822
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, no these are all backports for mickledore, fat fingers forgot to add
the tag in subject prefix.

Armin: do you want me to resend with fixed subject or can you pick them
from here?

On Mon, May 8, 2023 at 5:04=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:

> Martin
>
> Are these patches for master ? if so please rebase them on latest
> master or master-next preferably, if they are for other branches then
> mark them so as well.
>
> On Sun, May 7, 2023 at 3:44=E2=80=AFPM Martin Jansa <Martin.Jansa@gmail.c=
om>
> wrote:
> >
> > * use ${S} instead of ${WORKDIR}/${PN}-${PV}
> >   and ${BP} instead of ${PN}-${PV}
> >   to fix build with multilib, where PN is lib32-lirc, but S is correctl=
y
> set
> >   as ${WORKDIR}/${BP} and do_install fails with:
> >   mkdir: cannot create directory
> =E2=80=98lib32-lirc/0.10.1-r0/lib32-lirc-0.10.1/python-pkg/dist/=E2=80=99=
: No such file or
> directory
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb    | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git
> a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/
> lirc_0.10.2.bb
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/
> lirc_0.10.2.bb
> > index 88e3f0486b..fcb347a2e5 100644
> > --- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/
> lirc_0.10.2.bb
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/
> lirc_0.10.2.bb
> > @@ -51,9 +51,9 @@ do_configure:append() {
> >
> >  # Create PYTHON_TARBALL which LIRC needs for install-nodist_pkgdataDAT=
A
> >  do_install:prepend() {
> > -    rm -rf ${WORKDIR}/${PN}-${PV}/python-pkg/dist/
> > -    mkdir ${WORKDIR}/${PN}-${PV}/python-pkg/dist/
> > -    tar --exclude=3D'${WORKDIR}/${PN}-${PV}/python-pkg/*' -czf
> ${WORKDIR}/${PN}-${PV}/python-pkg/dist/${PN}-${PV}.tar.gz ${S}
> > +    rm -rf ${S}/python-pkg/dist/
> > +    mkdir ${S}/python-pkg/dist/
> > +    tar --exclude=3D'${S}/python-pkg/*' -czf
> ${S}/python-pkg/dist/${BP}.tar.gz ${S}
> >  }
> >
> >  # In code, path to python is a variable that is replaced with path to
> native version of it
> > --
> > 2.40.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#102363):
> https://lists.openembedded.org/g/openembedded-devel/message/102363
> > Mute This Topic: https://lists.openembedded.org/mt/98750656/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000005ab36f05fb2c0822
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, no these are all backports for mickledore, fat fing=
ers forgot to add the tag in subject prefix.<div><br></div><div>Armin: do y=
ou want me to resend with fixed subject or can you pick them from here?</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Mon, May 8, 2023 at 5:04=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Martin<br>
<br>
Are these patches for master ? if so please rebase them on latest<br>
master or master-next preferably, if they are for other branches then<br>
mark them so as well.<br>
<br>
On Sun, May 7, 2023 at 3:44=E2=80=AFPM Martin Jansa &lt;<a href=3D"mailto:M=
artin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt; wro=
te:<br>
&gt;<br>
&gt; * use ${S} instead of ${WORKDIR}/${PN}-${PV}<br>
&gt;=C2=A0 =C2=A0and ${BP} instead of ${PN}-${PV}<br>
&gt;=C2=A0 =C2=A0to fix build with multilib, where PN is lib32-lirc, but S =
is correctly set<br>
&gt;=C2=A0 =C2=A0as ${WORKDIR}/${BP} and do_install fails with:<br>
&gt;=C2=A0 =C2=A0mkdir: cannot create directory =E2=80=98lib32-lirc/0.10.1-=
r0/lib32-lirc-0.10.1/python-pkg/dist/=E2=80=99: No such file or directory<b=
r>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../meta-python/recipes-connectivity/lirc/<a href=3D"http://lirc=
_0.10.2.bb" rel=3D"noreferrer" target=3D"_blank">lirc_0.10.2.bb</a>=C2=A0 =
=C2=A0 | 6 +++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/l=
irc/<a href=3D"http://lirc_0.10.2.bb" rel=3D"noreferrer" target=3D"_blank">=
lirc_0.10.2.bb</a> b/meta-oe/dynamic-layers/meta-python/recipes-connectivit=
y/lirc/<a href=3D"http://lirc_0.10.2.bb" rel=3D"noreferrer" target=3D"_blan=
k">lirc_0.10.2.bb</a><br>
&gt; index 88e3f0486b..fcb347a2e5 100644<br>
&gt; --- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/<a =
href=3D"http://lirc_0.10.2.bb" rel=3D"noreferrer" target=3D"_blank">lirc_0.=
10.2.bb</a><br>
&gt; +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/<a =
href=3D"http://lirc_0.10.2.bb" rel=3D"noreferrer" target=3D"_blank">lirc_0.=
10.2.bb</a><br>
&gt; @@ -51,9 +51,9 @@ do_configure:append() {<br>
&gt;<br>
&gt;=C2=A0 # Create PYTHON_TARBALL which LIRC needs for install-nodist_pkgd=
ataDATA<br>
&gt;=C2=A0 do_install:prepend() {<br>
&gt; -=C2=A0 =C2=A0 rm -rf ${WORKDIR}/${PN}-${PV}/python-pkg/dist/<br>
&gt; -=C2=A0 =C2=A0 mkdir ${WORKDIR}/${PN}-${PV}/python-pkg/dist/<br>
&gt; -=C2=A0 =C2=A0 tar --exclude=3D&#39;${WORKDIR}/${PN}-${PV}/python-pkg/=
*&#39; -czf ${WORKDIR}/${PN}-${PV}/python-pkg/dist/${PN}-${PV}.tar.gz ${S}<=
br>
&gt; +=C2=A0 =C2=A0 rm -rf ${S}/python-pkg/dist/<br>
&gt; +=C2=A0 =C2=A0 mkdir ${S}/python-pkg/dist/<br>
&gt; +=C2=A0 =C2=A0 tar --exclude=3D&#39;${S}/python-pkg/*&#39; -czf ${S}/p=
ython-pkg/dist/${BP}.tar.gz ${S}<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 # In code, path to python is a variable that is replaced with pa=
th to native version of it<br>
&gt; --<br>
&gt; 2.40.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#102363): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/102363" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/102363</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98750656=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/98750656/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000005ab36f05fb2c0822--

