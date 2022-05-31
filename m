Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C0AC433EF
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 12:12:37 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web09.48502.1653999147917675325
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 05:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KoLbCngW;
 spf=pass (domain: gmail.com, ip: 209.85.221.177,
 mailfrom: samuli.piippo@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id az25so4947646vkb.12
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 05:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z9G128gvChzrphO+Zh/szBHohdX1HfWAi573gvd//90=;
        b=KoLbCngWeuM4wa5mdw7Oj5cqIQRiPWHfiT8Bn/GeUx0fid7N/49QwxevyynpTqZf8v
         bcQcnff3TxQSCOpImc6VDNbuoTILhPAGDGxmZhfBZ5gbeIuCtssO9W1y19aoQd8NxBdr
         K6K6bf0XXDFLM0+b26b8BAUcZBvzXlPn6ZUpC7iROjEAs9rVYsTCQ5h1feb0IQlbeAOb
         e0vh0PNbSXiEo5sP5YI3MM+0hnvdATOkMiq21SXAg/7nW12nxTViHd4haX2CPL+SqSZl
         C0gzonVfia8u85b0rIfonsK2diNFJkMhXZ/jNIdfYzhokm/iHeXW4qXhGiETe/ePiZo8
         HREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z9G128gvChzrphO+Zh/szBHohdX1HfWAi573gvd//90=;
        b=2UaeWJEks15lzDCQitCNrnQ3R0pNelTvAwkmEQQ40PsvzxFcE9gNVXvzL1Ro6OV+EA
         YzUImUlVMJkumsRh6xmEH2oD+DECK1Z254LRTv88I5FLccKdJINm7LJlUgeT9F/LTSnv
         U77+dQyCNA1gU3MlhS/YACx6zn+SqtigByt1hVu3z6LxCKGxztdnHfdhVVRXMwwlbAE2
         tscRpW95PSCCEomrTWJGvgMzCMMBshGdg1I7RDs821tJHkTIZMrYWqxBcJvraSE7FKqw
         kLZCvzEXBSo5XSHn5n6LB/S6rI/Py0/mq0/B8RP/MrrCGz4SFFgI92KRPoy8XLWQRYvD
         aRLA==
X-Gm-Message-State: AOAM5301Wtm+ySFHMO0qMReR+6av16qM2o/Mj4KeOIJ71zzb6rQt2JSS
	f5J0RnyiYsTjpHAWZNWMxndx1DAh+ZT79kY2KbY=
X-Google-Smtp-Source: 
 ABdhPJzT++eHeaj9QpbgCiR+LKIaBnFMAUEL3WbssmOO120uQ5iadCGUgKfIWsamfqsDyT3P9z+8Mk1+dXC9zAJmTK4=
X-Received: by 2002:ac5:cd41:0:b0:35c:a966:f3db with SMTP id
 n1-20020ac5cd41000000b0035ca966f3dbmr2845198vkm.33.1653999146999; Tue, 31 May
 2022 05:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220530122952.2715776-1-samuli.piippo@qt.io>
 <9881391e-a6d9-beb4-14a4-de636795c22@spiteful.org>
In-Reply-To: <9881391e-a6d9-beb4-14a4-de636795c22@spiteful.org>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Tue, 31 May 2022 15:12:15 +0300
Message-ID: 
 <CABXoSoVEMV4xPWmftuJcX63QCV5ZPcxObLzmF+kzY7kH1F=h2A@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] flite: add recipe
To: Scott Murray <scott.murray@konsulko.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009da63905e04dafd2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 May 2022 12:12:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97350

--0000000000009da63905e04dafd2
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 May 2022 at 17:43, Scott Murray <scott.murray@konsulko.com>
wrote:

> On Mon, 30 May 2022, Samuli Piippo wrote:
>
> > CMU Flite (festival-lite) is a small, fast run-time open source
> > text to speech synthesis engine developed at CMU and primarily
> > designed for small embedded machines.
> >
> > Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> > ---
> >  .../recipes-multimedia/flite/flite_2.2.bb     | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >  create mode 100644 meta-multimedia/recipes-multimedia/flite/
> flite_2.2.bb
> >
> > diff --git a/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
> b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
> > new file mode 100644
> > index 000000000..9ab9c0208
> > --- /dev/null
> > +++ b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
> > @@ -0,0 +1,19 @@
> > +SUMMARY = "Flite: a small run-time speech synthesis engine"
> > +HOMEPAGE = "http://cmuflite.org"
> > +SECTION = "libs/multimedia"
> > +LICENSE = "BSD-3-Clause"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=b3b732d1349633a53e69356607fd2d6c"
> > +
> > +inherit autotools-brokensep
> > +
> > +SRC_URI = "git://
> github.com/festvox/flite.git;protocol=https;branch=master"
> > +
> > +SRCREV = "e9e2e37c329dbe98bfeb27a1828ef9a71fa84f88"
> [snip]
>
> There's no 2.3 tag, but the README.md and Makefile imply that 2.3 was
> released in March 2022 (see commit 530060de), and the current voice files
> on http://festvox.org/flite/packed/ are "flite-2.3".  So perhaps this
> should be building that instead of the ~2 years old 2.2?
>

Hard to say if there's a specific revision that was meant to be the
release, but I could update this to 2.3 and just use the latest revision?


> > +
> > +S = "${WORKDIR}/git"
> > +
> > +EXTRA_OECONF += "--enable-shared"
> > +
> > +do_install:append() {
> > +    chown -R root:root ${D}${libdir}/*
>
> This seems a bit odd, I'm curious what prompted adding it?
>

The installed files had local user and group IDs that caused host
contamination error.

--0000000000009da63905e04dafd2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Mon, 30 May 2022 at 17:43, Scott Murray &lt;<a href=3D"mailto=
:scott.murray@konsulko.com">scott.murray@konsulko.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 30 May 2022, S=
amuli Piippo wrote:<br>
<br>
&gt; CMU Flite (festival-lite) is a small, fast run-time open source<br>
&gt; text to speech synthesis engine developed at CMU and primarily<br>
&gt; designed for small embedded machines.<br>
&gt;<br>
&gt; Signed-off-by: Samuli Piippo &lt;<a href=3D"mailto:samuli.piippo@qt.io=
" target=3D"_blank">samuli.piippo@qt.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-multimedia/flite/<a href=3D"http://flite_2.2.bb" rel=
=3D"noreferrer" target=3D"_blank">flite_2.2.bb</a>=C2=A0 =C2=A0 =C2=A0| 19 =
+++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 19 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-multimedia/recipes-multimedia/flite/<a h=
ref=3D"http://flite_2.2.bb" rel=3D"noreferrer" target=3D"_blank">flite_2.2.=
bb</a><br>
&gt;<br>
&gt; diff --git a/meta-multimedia/recipes-multimedia/flite/<a href=3D"http:=
//flite_2.2.bb" rel=3D"noreferrer" target=3D"_blank">flite_2.2.bb</a> b/met=
a-multimedia/recipes-multimedia/flite/<a href=3D"http://flite_2.2.bb" rel=
=3D"noreferrer" target=3D"_blank">flite_2.2.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..9ab9c0208<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-multimedia/recipes-multimedia/flite/<a href=3D"http://flite=
_2.2.bb" rel=3D"noreferrer" target=3D"_blank">flite_2.2.bb</a><br>
&gt; @@ -0,0 +1,19 @@<br>
&gt; +SUMMARY =3D &quot;Flite: a small run-time speech synthesis engine&quo=
t;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"http://cmuflite.org" rel=3D"noreferrer"=
 target=3D"_blank">http://cmuflite.org</a>&quot;<br>
&gt; +SECTION =3D &quot;libs/multimedia&quot;<br>
&gt; +LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db3b732d1349633a53e693=
56607fd2d6c&quot;<br>
&gt; +<br>
&gt; +inherit autotools-brokensep<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/festvox/flite.gi=
t;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/festvox/flite.git;protocol=3Dhttps;branch=3Dmaster</a>&quot;<br>
&gt; +<br>
&gt; +SRCREV =3D &quot;e9e2e37c329dbe98bfeb27a1828ef9a71fa84f88&quot;<br>
[snip]<br>
<br>
There&#39;s no 2.3 tag, but the README.md and Makefile imply that 2.3 was<b=
r>
released in March 2022 (see commit 530060de), and the current voice files<b=
r>
on <a href=3D"http://festvox.org/flite/packed/" rel=3D"noreferrer" target=
=3D"_blank">http://festvox.org/flite/packed/</a> are &quot;flite-2.3&quot;.=
=C2=A0 So perhaps this<br>
should be building that instead of the ~2 years old 2.2?<br></blockquote><d=
iv><br></div><div>Hard to say if there&#39;s a specific revision that was m=
eant to be the release, but I could update this to 2.3 and just use the lat=
est revision? <br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +EXTRA_OECONF +=3D &quot;--enable-shared&quot;<br>
&gt; +<br>
&gt; +do_install:append() {<br>
&gt; +=C2=A0 =C2=A0 chown -R root:root ${D}${libdir}/*<br>
<br>
This seems a bit odd, I&#39;m curious what prompted adding it?<br></blockqu=
ote><div>=C2=A0</div><div>The installed files had local user and group IDs =
that caused host contamination error.<br></div><div>=C2=A0</div></div></div=
>

--0000000000009da63905e04dafd2--

