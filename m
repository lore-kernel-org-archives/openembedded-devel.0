Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06069C369A2
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 21:55:34 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.38464.1744408527970705364
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Apr 2025 14:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FCMTC9T+;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39129fc51f8so1994672f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 14:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1744408526; x=1745013326; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gLtxIEIq+vd42A7sffj/nVj5Jgll+B2uGvtsLQp0QFA=;
        b=FCMTC9T+sZ3QC9lcoUKSpW2cQPQ1Nvfih3AiW1ek273eeGAs+qS4ITP0MWF0GFoc0C
         oD9b2+i+mj2HWaf0dT1CSh1lunAwRzleN56E8Ys0/iujuV9SFNqClAReaIXyEU1DHqtD
         GZPTb6dMOT8txro97gntq/sTi6CWRj57CDXlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744408526; x=1745013326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gLtxIEIq+vd42A7sffj/nVj5Jgll+B2uGvtsLQp0QFA=;
        b=JeGyDPgfC2J7VG8PX8M7v4ISnFv0SporFsakBDkxtmvPnySxY1si1OFdgW8hn10PSE
         63070Z28KuyzfwXXO1ECZdLSjFTJAGPcafeh6p0OaLSW8r4QFWxaX6mcCSZq35TKO57w
         JZXij7Vnqn64l0VE71X4R8JWX9wWjjyF/903As08DaDRGk//VpRTMKZJBqPTnUbVJpN9
         oYvxIhn6mJAYlGdey10rHTeC4DerZMOcuFdZey9KkaMdHDxxquLoWWM7h3MhHBI3un42
         sZRtq5nuhVSrI0lDPE4OTWTLAAFpAfbKzFXjRve8WFCU7kS/sDj9w7zRflcMwshlYcDv
         Mv9g==
X-Forwarded-Encrypted: i=1; AJvYcCWgIk0x9/g6zb4gs8A3i8Oh2Io4EPLL59PQdR+8WiVAYro8RZ6/uEWzPu/hlD4kPsk8+gacKp2pzPI8m85D+gxfODk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwNwuPgluLk2WRagy8pmUyN3nyUWsSW2BZcJxbrpIyovba0bdKp
	PABVz/hYRdejcf8yum0vZEIaoAf3VXSKbiEbTvJ18Z5hmgEIG86yvJfvj8u7xX+lXFz6PExki10
	GGPfy5JqD2MSyxSBCRDyXas1SIp9GK0kNvAby+w==
X-Gm-Gg: ASbGncvFTVv1w4oHDO6KysR0hbq395f2cSp0Tq4j7lMSvIWbIzF+6K1T7CY2OE9U7pn
	RPgbFtEgab/4CutnjpYKys6rJ3Ok7VNrkblVFN4n7KYVMJRmGdpvVThZvHuU7fSnJoZcCwhbIJC
	s1fB9v0oEIP0OU2fYP+l6zn8XBsFn18y6R0Uc2KWvDADkSCVESXVUv1KM=
X-Google-Smtp-Source: AGHT+IFaez5GjQi+HlT9TqGIgqlT7u38R9tPxTrPY3rH+M1ZrEj6oafvMux7ogIX0rZK+BElRs20CovCRneBGsoeF6Y=
X-Received: by 2002:a05:6000:250e:b0:391:2932:e67b with SMTP id
 ffacd0b85a97d-39eaaea7f29mr3779443f8f.35.1744408526000; Fri, 11 Apr 2025
 14:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250401221249.2506503-1-yoann.congal@smile.fr>
 <CA+chaQc1_KMuC7LXyZymUEmPOTYMmOK67XqVfY7uPCFCmj8rww@mail.gmail.com>
 <CAMSfU+6Egmdumnc5JxOoRDR_tM2nMphkbG8gNBqarhHZSG3k9g@mail.gmail.com>
 <CAMKF1soyfmqbvo918uaTaAqPaMtv=EFtZXgXkiyRc4vAyTdQbg@mail.gmail.com>
 <CAMSfU+5LAe4EXgjrBj8+UYgY-C9+kqXBSUvuXEN+Zqhq4=nrSg@mail.gmail.com> <CA+chaQdfebEjz7UepPr33ZOUcj7D7VBTjxQ1c3v-_oEUOAQ_hQ@mail.gmail.com>
In-Reply-To: <CA+chaQdfebEjz7UepPr33ZOUcj7D7VBTjxQ1c3v-_oEUOAQ_hQ@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 11 Apr 2025 23:55:00 +0200
X-Gm-Features: ATxdqUE5MC9c6fKuoBx_xPxtactr9xNYRxhyYZt3GF-sv_0WKj2jboKqCC9sxLQ
Message-ID: <CAMSfU+6i0tUKtb=habchZ+1JuTp400wFrpG9jPv83dn_04tRmw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cmatrix: Fix host-based non-reproducibility
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000893150063287c22d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 21:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116800

--000000000000893150063287c22d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 9 avr. 2025 =C3=A0 09:11, Martin Jansa <martin.jansa@gmail.com> a =
=C3=A9crit :

> On Wed, Apr 9, 2025 at 8:56=E2=80=AFAM Yoann Congal <yoann.congal@smile.f=
r> wrote:
> >
> > Le mer. 9 avr. 2025 =C3=A0 03:42, Khem Raj <raj.khem@gmail.com> a =C3=
=A9crit :
> > >
> > > On Tue, Apr 8, 2025 at 2:03=E2=80=AFPM Yoann Congal via lists.openemb=
edded.org
> > > <yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:
> > > >
> > > > Le mar. 8 avr. 2025 =C3=A0 18:19, Martin Jansa <martin.jansa@gmail.=
com>
> a =C3=A9crit :
> > > > >
> > > > > This seems to cause:
> > > > >
> > > > > ERROR: QA Issue: lib32-cmatrix: Files/directories were installed
> but
> > > > > not shipped in any package:
> > > > >   /usr/lib
> > > > >   /usr/lib/X11
> > > > >   /usr/lib/X11/fonts
> > > > >   /usr/lib/X11/fonts/misc
> > > > >   /usr/lib/X11/fonts/misc/mtx.pcf
> > > > > Please set FILES such that these items are packaged. Alternativel=
y
> if
> > > > > they are unneeded, avoid installing them or delete them within
> > > > > do_install.
> > > > > lib32-cmatrix: 5 installed and not shipped files.
> [installed-vs-shipped]
> > >
> > > These files look arch independent, We can think of putting them into
> > > separate output packages and install them into ${datadir} and mark
> them allarch
> > > ideally. But I think that might require spinning it into two recipes.
> Otherwise
> > > using nonarch_libdir during install should work I guess.
> >
> > Those files are fonts for X and the console. I've looked at other
> > recipes writing such fonts and they seem to use subdirs of $libdir.
> > I've tried to find an automated way for cmatrix to find the correct
> > path to install its fonts but I did not find any obvious.
> >
> > I like the nonarch_libdir idea: My plan:
> > * change the patch to set the path to a marker @BASE_PATH@ or something
> > * in do_configure:prepend(), sed the correct path (nonarch_libdir) into
> the file
> > * Update FILES:${PN} to include the font files
> >
> > Sounds good?
>
> Sounds good to me.
>
> FWIW: I don't use cmatrix it was just a new build failure shown in
> world builds now when the files got installed (before they probably
> weren't because there was no /usr/lib/X11 directory in our docker
> images used for OE builds).
>

Yeah, that's the thing with improving reproducibility, sometimes, you get a
reproducible... failure ^^


> looking at
> meta-openembedded $ git grep fonts | grep FILES
>
> I guess using ${datadir}/fonts might be even easier option with
> -set(X_FONTS_DIRS "lib/X11/fonts/misc" "share/fonts/X11/misc")
> +set(X_FONTS_DIRS "share/fonts/misc")
> in your .patch as datadir will be the same with and without multilib.
>

I changed the patch many times but finally found that the cmake class
exports the paths we want, I sent a v2 with that.

Thanks!



> Cheers,
>


--=20
Yoann Congal
Smile ECS

--000000000000893150063287c22d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0mer. 9 avr. 2025=
 =C3=A0=C2=A009:11, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.c=
om" target=3D"_blank">martin.jansa@gmail.com</a>&gt; a =C3=A9crit=C2=A0:</d=
iv><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Wed, Apr 9, 2025 at 8:56=E2=80=AFAM Yoann Congal &lt;<a href=3D"mai=
lto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt; =
wrote:<br>
&gt;<br>
&gt; Le mer. 9 avr. 2025 =C3=A0 03:42, Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; a =C3=A9crit :<=
br>
&gt; &gt;<br>
&gt; &gt; On Tue, Apr 8, 2025 at 2:03=E2=80=AFPM Yoann Congal via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a><br>
&gt; &gt; &lt;yoann.congal=3D<a href=3D"mailto:smile.fr@lists.openembedded.=
org" target=3D"_blank">smile.fr@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Le mar. 8 avr. 2025 =C3=A0 18:19, Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt; a =C3=A9crit :<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This seems to cause:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; ERROR: QA Issue: lib32-cmatrix: Files/directories were =
installed but<br>
&gt; &gt; &gt; &gt; not shipped in any package:<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0/usr/lib<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0/usr/lib/X11<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0/usr/lib/X11/fonts<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0/usr/lib/X11/fonts/misc<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0/usr/lib/X11/fonts/misc/mtx.pcf<br>
&gt; &gt; &gt; &gt; Please set FILES such that these items are packaged. Al=
ternatively if<br>
&gt; &gt; &gt; &gt; they are unneeded, avoid installing them or delete them=
 within<br>
&gt; &gt; &gt; &gt; do_install.<br>
&gt; &gt; &gt; &gt; lib32-cmatrix: 5 installed and not shipped files. [inst=
alled-vs-shipped]<br>
&gt; &gt;<br>
&gt; &gt; These files look arch independent, We can think of putting them i=
nto<br>
&gt; &gt; separate output packages and install them into ${datadir} and mar=
k them allarch<br>
&gt; &gt; ideally. But I think that might require spinning it into two reci=
pes. Otherwise<br>
&gt; &gt; using nonarch_libdir during install should work I guess.<br>
&gt;<br>
&gt; Those files are fonts for X and the console. I&#39;ve looked at other<=
br>
&gt; recipes writing such fonts and they seem to use subdirs of $libdir.<br=
>
&gt; I&#39;ve tried to find an automated way for cmatrix to find the correc=
t<br>
&gt; path to install its fonts but I did not find any obvious.<br>
&gt;<br>
&gt; I like the nonarch_libdir idea: My plan:<br>
&gt; * change the patch to set the path to a marker @BASE_PATH@ or somethin=
g<br>
&gt; * in do_configure:prepend(), sed the correct path (nonarch_libdir) int=
o the file<br>
&gt; * Update FILES:${PN} to include the font files<br>
&gt;<br>
&gt; Sounds good?<br>
<br>
Sounds good to me.<br>
<br>
FWIW: I don&#39;t use cmatrix it was just a new build failure shown in<br>
world builds now when the files got installed (before they probably<br>
weren&#39;t because there was no /usr/lib/X11 directory in our docker<br>
images used for OE builds).<br></blockquote><div><br></div><div>Yeah, that&=
#39;s the thing with improving reproducibility, sometimes, you get a reprod=
ucible... failure ^^</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">

looking at<br>
meta-openembedded $ git grep fonts | grep FILES<br>
<br>
I guess using ${datadir}/fonts might be even easier option with<br>
-set(X_FONTS_DIRS &quot;lib/X11/fonts/misc&quot; &quot;share/fonts/X11/misc=
&quot;)<br>
+set(X_FONTS_DIRS &quot;share/fonts/misc&quot;)<br>
in your .patch as datadir will be the same with and without multilib.<br></=
blockquote><div><br></div><div>I changed the patch many times but finally f=
ound that the cmake class exports the paths we want, I sent a v2 with that.=
</div><div><br></div><div>Thanks!</div><div><br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
Cheers,<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>
</div>

--000000000000893150063287c22d--

