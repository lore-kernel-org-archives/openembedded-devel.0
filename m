Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395D3C71157
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 06:36:16 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.2398.1750746974258119273
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 23:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nlYrfJ+l;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-70f862dbeaeso47892287b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 23:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750746973; x=1751351773; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GOenIwe16yWlHSrw2QExe5FyDIQLVpcaGJbHuBIeX40=;
        b=nlYrfJ+lOy5akfMrhDOpHp3e2l3XvgfpjJXEcIII+0sRFLV8aowyZ/tEDV18bHviIb
         pIMxR2MqOLoDFD27910wo8IHRcRvghCN0t36/d0TQXUjSsOuKG6oq2BRz9fHhukTFEBm
         iqVymfDhLHiXWf+2Ko4dGHWCk9IsrzO4XWmVDYE62tNmiNQC1JRxMifPMlnArxeiSk7a
         6ITynhjWBP+HU2XhXpZtiAP4ruUt/hxJOT5QRiZdD52LOT74pCB/DEU7EPEfASxdRbBu
         votLE1o2H8oyZIFBfw20TI32yIDNBNd2p26+RUp/j894u1YjuW0byqMO1zvwC+8VqvSi
         Oj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750746973; x=1751351773;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GOenIwe16yWlHSrw2QExe5FyDIQLVpcaGJbHuBIeX40=;
        b=SpiOW73KhfekX3yaFCYRPiiYns5LjFdOTlMK/8tJIrPY8e592olh5+PTvu7sn6fZMP
         hb6MH2qzO4ytsXJ44lQeqMApe8ZPk29CZrrRg6cFP1BhZZf+yqE2r63QJP6nK37IwvFV
         C7zRVQrjHjyvoexYNIcr2t0ZOhw1UD/S87mrJWmkh5KhRL4UVVe5BGTdSrV6KRay0/FV
         +O2hJJwjM/hrL4t/yc9OyyzP+LS7ek9nh6Uq7acogzNw1upSn9pqScWaZvQ0i3HlXw9z
         44w6p4Lz0I9TNYysIN5XyKTn+qmNMtZIpiW3JU3sv5LnTc5BOP1xq9/BzU3d4Pyy9hmD
         7Uqw==
X-Gm-Message-State: AOJu0Yxf8VlM50jOPNz4/HbYdZXNDnp1abegIfvI9VoJPLINIaKaymfI
	/AccecnmmqWZyJiUkikkkioHlYXbu00S4niGYC7C1lMT4ZhntZZCu2XxLvPJ6RWERHXIYwSLX+P
	LSCbfwiGphWZ/sdU5vzuh8enHdiv8E38=
X-Gm-Gg: ASbGncvBni0pxMVd27xwv520qsUjMf0n9TbtHQN8way4M+WAcy/DzYMcsGHcuFE2TIh
	YoPH4mIDtZTHYdV7jhb1T4kyrr2k7eSTsHrovNgroQVTukraC0/Oy0ykhdJTfs4GyCQ1NzMvqSN
	qWFxkMoZnB/N5+bynRfX8gFRPXo5BAH7Q/uXkXErmp6kSU
X-Google-Smtp-Source: AGHT+IF1zL+2ZhXCNlAxzmFmtLahU0P+Jh9IvYNqsPvlbvEF1qDcabzo6tixFfdFWjPMfVTOPCQtFVo4zz9YFqXFmZI=
X-Received: by 2002:a05:690c:6213:b0:70d:ff2a:d686 with SMTP id
 00721157ae682-712c6511072mr203932727b3.28.1750746973169; Mon, 23 Jun 2025
 23:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250623191048.488812-1-alperyasinak1@gmail.com>
 <CABF_=yia4NmdasTLkJNs+t10Z3YZL3pXkOpjN+WLw42=JyiPQw@mail.gmail.com> <CAGpma=6-q0_RmzvkXXoWvt6iK8KTBnX9RUO9cG7SnRSqAmFQaA@mail.gmail.com>
In-Reply-To: <CAGpma=6-q0_RmzvkXXoWvt6iK8KTBnX9RUO9cG7SnRSqAmFQaA@mail.gmail.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Tue, 24 Jun 2025 08:36:01 +0200
X-Gm-Features: AX0GCFuiqLnBMgk1JPEdLTWtFSbawo1ooIuOuLPxyG9bCEGb5q1M6PD6rFnJK7A
Message-ID: <CABF_=yhdc2NL_Ax2Dk6C5LMT0BYF_k3UzkZ4dF8Fo_b=KWFOVw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] tk: Fix compile error
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006d6c5906384b8b27"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Jun 2025 06:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118096

--0000000000006d6c5906384b8b27
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good point. I didn=E2=80=99t touch about the split of TCL and TK.

Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel


On Mon, 23 Jun 2025 at 22:17, Alper Ak <alperyasinak1@gmail.com> wrote:

> I thought about using PV, but if tcl and tk can be upgraded
> independently (tcl recipe is in poky, tk is in meta-oe), this may
> cause failures if tcl is upgraded without upgrading tk. That's why I
> preferred to hard code the version.
>
> If there is a better way to handle this, I=E2=80=99m open to suggestions.
>
> jan vermaete <jan.vermaete@gmail.com>, 23 Haz 2025 Pzt, 22:45
> tarihinde =C5=9Funu yazd=C4=B1:
> >
> > Could the variable PV not be used in the directory name to replace the
> > hard code version number?
> >
> > Br
> >
> > On Mon, Jun 23, 2025 at 9:11=E2=80=AFPM Alper Ak via lists.openembedded=
.org
> > <alperyasinak1=3Dgmail.com@lists.openembedded.org> wrote:
> > >
> > > tk9.0.1/unix/../generic/tk.h:19:10: fatal error: tcl.h: No such file
> or directory
> > > |    19 | #include <tcl.h>
> > > |       |          ^~~~~~~
> > >
> > > Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> > > ---
> > >  meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
> b/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
> > > index 504b40927e..230a244a6b 100644
> > > --- a/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
> > > +++ b/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
> > > @@ -30,6 +30,8 @@ S =3D "${UNPACKDIR}/${BPN}${PV}"
> > >  # Short version format: "8.6"
> > >  VER =3D "${@os.path.splitext(d.getVar('PV'))[0]}"
> > >
> > > +CFLAGS +=3D "-I${STAGING_INCDIR}/tcl9.0.1/generic"
> > > +
> > >  LDFLAGS +=3D "-Wl,-rpath,${libdir}/tcltk/${PV}/lib"
> > >
> > >  inherit autotools features_check pkgconfig
> > > --
> > > 2.43.0
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#118088):
> https://lists.openembedded.org/g/openembedded-devel/message/118088
> > > Mute This Topic: https://lists.openembedded.org/mt/113794949/2167232
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b
> [jan.vermaete@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> >
> >
> > --
> > Jan Vermaete
> > =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hame=
l
>

--0000000000006d6c5906384b8b27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Good point. I didn=E2=80=99t touch about the split of TCL=
 and TK.<br clear=3D"all"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"=
gmail_signature" data-smartmail=3D"gmail_signature">Jan Vermaete<br>=E2=80=
=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel</div></d=
iv></div><div><br></div><div><br><div class=3D"gmail_quote gmail_quote_cont=
ainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 23 Jun 2025 at 22:17, =
Alper Ak &lt;<a href=3D"mailto:alperyasinak1@gmail.com">alperyasinak1@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I thought about=
 using PV, but if tcl and tk can be upgraded<br>
independently (tcl recipe is in poky, tk is in meta-oe), this may<br>
cause failures if tcl is upgraded without upgrading tk. That&#39;s why I<br=
>
preferred to hard code the version.<br>
<br>
If there is a better way to handle this, I=E2=80=99m open to suggestions.<b=
r>
<br>
jan vermaete &lt;<a href=3D"mailto:jan.vermaete@gmail.com" target=3D"_blank=
">jan.vermaete@gmail.com</a>&gt;, 23 Haz 2025 Pzt, 22:45<br>
tarihinde =C5=9Funu yazd=C4=B1:<br>
&gt;<br>
&gt; Could the variable PV not be used in the directory name to replace the=
<br>
&gt; hard code version number?<br>
&gt;<br>
&gt; Br<br>
&gt;<br>
&gt; On Mon, Jun 23, 2025 at 9:11=E2=80=AFPM Alper Ak via <a href=3D"http:/=
/lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openemb=
edded.org</a><br>
&gt; &lt;alperyasinak1=3D<a href=3D"mailto:gmail.com@lists.openembedded.org=
" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; tk9.0.1/unix/../generic/tk.h:19:10: fatal error: tcl.h: No such f=
ile or directory<br>
&gt; &gt; |=C2=A0 =C2=A0 19 | #include &lt;tcl.h&gt;<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^=
~~~~~~<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Alper Ak &lt;<a href=3D"mailto:alperyasinak1@gmail=
.com" target=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta-oe/recipes-devtools/tcltk/<a href=3D"http://tk_9.0.1.b=
b" rel=3D"noreferrer" target=3D"_blank">tk_9.0.1.bb</a> | 2 ++<br>
&gt; &gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/recipes-devtools/tcltk/<a href=3D"http://tk_=
9.0.1.bb" rel=3D"noreferrer" target=3D"_blank">tk_9.0.1.bb</a> b/meta-oe/re=
cipes-devtools/tcltk/<a href=3D"http://tk_9.0.1.bb" rel=3D"noreferrer" targ=
et=3D"_blank">tk_9.0.1.bb</a><br>
&gt; &gt; index 504b40927e..230a244a6b 100644<br>
&gt; &gt; --- a/meta-oe/recipes-devtools/tcltk/<a href=3D"http://tk_9.0.1.b=
b" rel=3D"noreferrer" target=3D"_blank">tk_9.0.1.bb</a><br>
&gt; &gt; +++ b/meta-oe/recipes-devtools/tcltk/<a href=3D"http://tk_9.0.1.b=
b" rel=3D"noreferrer" target=3D"_blank">tk_9.0.1.bb</a><br>
&gt; &gt; @@ -30,6 +30,8 @@ S =3D &quot;${UNPACKDIR}/${BPN}${PV}&quot;<br>
&gt; &gt;=C2=A0 # Short version format: &quot;8.6&quot;<br>
&gt; &gt;=C2=A0 VER =3D &quot;${@os.path.splitext(d.getVar(&#39;PV&#39;))[0=
]}&quot;<br>
&gt; &gt;<br>
&gt; &gt; +CFLAGS +=3D &quot;-I${STAGING_INCDIR}/tcl9.0.1/generic&quot;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 LDFLAGS +=3D &quot;-Wl,-rpath,${libdir}/tcltk/${PV}/lib&quo=
t;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 inherit autotools features_check pkgconfig<br>
&gt; &gt; --<br>
&gt; &gt; 2.43.0<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#118088): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-devel/message/118088" rel=3D"noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-devel/message/118088</a>=
<br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113=
794949/2167232" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/113794949/2167232</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.o=
penembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembed=
ded.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:jan.vermaete@g=
mail.com" target=3D"_blank">jan.vermaete@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Jan Vermaete<br>
&gt; =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Ham=
el<br>
</blockquote></div></div>

--0000000000006d6c5906384b8b27--

