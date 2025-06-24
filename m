Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 403DAC77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 06:46:56 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.2487.1750747611139730451
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 23:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZtOHBJwv;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d7b50815so38712295e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 23:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1750747609; x=1751352409; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lwndoivzHdsPUMf1Irjh+hmWhX9U8gMa7rXhznDiaLc=;
        b=ZtOHBJwv2NqUZJkex50Ju55E11+XRk3nrjCbpi2zjLVvgjnrDAAwUImkowCKM43fZi
         0Hczlqvk87HPT5Ffyti8HjLiyw7Q/CI7XHC9PrrM+JltJonV0hOuXOsoQzCM4AMAEP2a
         4W5MMe4mZqOb8TEzJRN4a1z8u2amA30mxkMz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750747609; x=1751352409;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lwndoivzHdsPUMf1Irjh+hmWhX9U8gMa7rXhznDiaLc=;
        b=fGcVKEXJ3a4rQMP6nmHy9tCAST5BFBajEpnZ2mjJ1lqH8ZxgvOR5SQ9plyOaK4S/yv
         RwgUq2UBBKbyJYbj4nucBbFjob2h+hDNap8Tmte9MFTa2w5BrNGr4x2K7rJd/qOFKxI5
         hjamLKVzFj4AJi8815a6LEmb58+RdUZ/+7/cSn7wSBNLA9eYpJHTR3wcq1PZBZKF/+As
         e3e3KPq2StYBkVhoDGaxYG5LCIpTbV+WrnzCJltED5s1R5zNdKduFO8Ym0kZ0e3Qrq49
         JTOUtoSoX6tL6NkpkDi5puit+nxxtM7dyvYOdFXEO3b/0i/jmDXdqMg26haT8KifobDJ
         fXpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuFqQpV84ZvfR3IhtCzWhG6GutgXRRSN3CdiPc52Pgq3vUEvPA9twYNFUvuhxm0BygTDipZyP36NSCf+uBD+e+GUk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YytgoPLgMN6c0OkXrPtkuXBmecA4G/6rfl0PyqphukZv8Wp1u4O
	0TMXyjdJPB2zykWL1fHYxj2ToZSirQ6QaaB6lbK37tAiN7gjyCzXMi9CYI15ED3290jcE3u4iAa
	cWJTSUunvTs/BLOofgCXFONJ2eye5xbWLxmuBrFoiNA==
X-Gm-Gg: ASbGnctu8Ub2svAtmPtXaUJfu7+IiD9DPMML3NUmsEaH7Go8Tsuu+QXDP79fI2K5a8B
	njjrY0rKXJVqUM/jj0TMnPO3CEIsveMvKEipMBQyaOQ1BoKMRO7A3DLKuOeQ+JKzVY3fJAwsVZ4
	+Qla861jpy3fkytwVUkI0s56eD+AAanfehwLNxmNkh4zTucsJ3kt8J8S8WP94QzJJC1eYBKlYsA
	zxDiQ==
X-Google-Smtp-Source: AGHT+IFwCzazA+pqdn3Cqftpzc1d/B2miHDsXPRINzEZ/YOxeR8DK4oTQRKXWbZvl/uvVzwgBQtUAFCqAZqLV7thxsg=
X-Received: by 2002:a05:600c:4ed1:b0:440:6a79:6df0 with SMTP id
 5b1f17b1804b1-453659ec1c2mr122349055e9.22.1750747609388; Mon, 23 Jun 2025
 23:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250623191048.488812-1-alperyasinak1@gmail.com>
 <CABF_=yia4NmdasTLkJNs+t10Z3YZL3pXkOpjN+WLw42=JyiPQw@mail.gmail.com> <CAGpma=6-q0_RmzvkXXoWvt6iK8KTBnX9RUO9cG7SnRSqAmFQaA@mail.gmail.com>
In-Reply-To: <CAGpma=6-q0_RmzvkXXoWvt6iK8KTBnX9RUO9cG7SnRSqAmFQaA@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 24 Jun 2025 08:46:23 +0200
X-Gm-Features: Ac12FXwmiz74vPOaNIJzwYEDvAZoPS4avo815punZt8FMYiCJ_zsPDuogp9YqOs
Message-ID: <CAMSfU+7i5-NWbcNm-DWL8gy=bK_biVFFXkC7aJ9N5j62xc=OCw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] tk: Fix compile error
To: alperyasinak1@gmail.com
Cc: jan vermaete <jan.vermaete@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000059690d06384bb1cd"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Jun 2025 06:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118097

--00000000000059690d06384bb1cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le lun. 23 juin 2025 =C3=A0 22:17, Alper Ak via lists.openembedded.org
<alperyasinak1=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

> I thought about using PV, but if tcl and tk can be upgraded
> independently (tcl recipe is in poky, tk is in meta-oe), this may
> cause failures if tcl is upgraded without upgrading tk. That's why I
> preferred to hard code the version.
>
> If there is a better way to handle this, I=E2=80=99m open to suggestions.
>

I see that the tk recipe uses the pkgconfig class, theoretically, that's
the way for tcl to tell tk where to find its headers.

Regards,


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
> > >
> > >
> >
> >
> > --
> > Jan Vermaete
> > =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hame=
l
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118091):
> https://lists.openembedded.org/g/openembedded-devel/message/118091
> Mute This Topic: https://lists.openembedded.org/mt/113794949/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--00000000000059690d06384bb1cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello,</div><div><br></div><div dir=
=3D"ltr">Le=C2=A0lun. 23 juin 2025 =C3=A0=C2=A022:17, Alper Ak via <a href=
=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedded.org=
</a> &lt;alperyasinak1=3D<a href=3D"mailto:gmail.com@lists.openembedded.org=
" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; a =C3=A9crit=
=C2=A0:</div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">I thought about using PV, but if tcl and tk can be upgraded<=
br>
independently (tcl recipe is in poky, tk is in meta-oe), this may<br>
cause failures if tcl is upgraded without upgrading tk. That&#39;s why I<br=
>
preferred to hard code the version.<br>
<br>
If there is a better way to handle this, I=E2=80=99m open to suggestions.<b=
r></blockquote><div><br></div><div>I see that the tk recipe uses the pkgcon=
fig class, theoretically, that&#39;s the way for tcl to tell tk where to fi=
nd its headers.</div><div><br></div><div>Regards,</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">

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
&gt; &gt; <br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Jan Vermaete<br>
&gt; =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Ham=
el<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#118091): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/118091" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/118091</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113794949/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113794949/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>
</div>

--00000000000059690d06384bb1cd--

