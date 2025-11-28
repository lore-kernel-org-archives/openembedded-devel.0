Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438A4D116E2
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 22:43:02 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5376.1764369780910220202
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 14:43:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hn+/tIq2;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78a76afeff6so22421157b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 14:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764369780; x=1764974580; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/5CRpmTDERpcQQ3gTRLC/HfGVmODx+17zx8xwC49Jf0=;
        b=hn+/tIq2l9Txo1nYQ0CAcBSUhz4UU3L1y4vRv5Vg9+Zh6cerZ3IIZm82+5XfNBfsMY
         wxbye7EJGs0dbnn+7vki8Gk8rY00Jq2v29CBye+rAK+KazxNxLqOKM0LcL96JhVR7bt5
         0xZPO5oY8zGdRhl5HYm9HSm0c+XdlHm+AnbTOFfrOPUVlRU1tnNLpAL0kZHXblICNKNW
         /1cz+RuzFyu8TfNdlmX2mpYeoJ8eN/BSGJrz6WpOjE4Pvp3hvgtIgdigO8h9uMaElq1T
         hLca+i76P9WXSMoT9k0TA8aXAlzBPouVv/V+uDbi/RYIw/3XMA1tD0cab7J6KeHpP+HW
         aKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764369780; x=1764974580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5CRpmTDERpcQQ3gTRLC/HfGVmODx+17zx8xwC49Jf0=;
        b=nFd72FERLA0vorEcC19C9PaU9ezVfhNC27d7V96SA017ZUMq0q43TnAb9zQjwlg0nB
         ZrB2v43pFgRsQafOzv9Jb196ZiqWSNLOCnx92sHRDq7yAWyMBZhP2EPQ1takZxOeaTwG
         m9rytRBfAKK4J2756NgJW6IbXoyGX06DSBEGA3SGUcj/ePH9adOg8qqD8+hIsbke5h67
         ejbSDZhzvrBVjG+JlsT21c43FgHB/wBtVXYT+uKwbIYN6ENXORe2gb7Lmhc96B9mhYJv
         +MKsfMc2HWxZPx+NHrrBfuQTLmnJwT36Ep3iiyNxvlC13aY2Jwtf/DRpi+FvL9bb8ynI
         gUCg==
X-Forwarded-Encrypted: i=1; AJvYcCVPAqdgj7UKjKcGEmHD0dsE8pwgQwuJbY/MbpHDV40SQiT+RGE6zSP6gun6W28bKeKPl6HjLa/sI4BwEbGkijvIzp8=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw/Uz4SnaxUy4NTFtEy5Xa9WCNVrca3E/G4zRJ4Bm6fe705JoMj
	GtUTpipOPHxzCI94OXucZJUVNU5MtFKHlt0Vd9v5Z+O6dMVqJJTOFsgx/qaZyc3SSrGRiyvceBn
	caY5yjFCZpFuyNm4n0mDm82kGpIo3gdk=
X-Gm-Gg: ASbGncsjUCg1Ye0p9WdCuhFxjVgAZu0I2YDuhOMy56dIJK7MnOmj+yMSYi0qf4BXqcn
	lvlg3PVrZjf9is3Au21vl8wVzFSp5aqYYaaLiwNPVmsDIX917E9RqwhzSZCRFtdBJRfZAuGVR4e
	f1fZ14/ZJTKwbBngtPg4wFUqonhPJbD2sznsbBfDPyITrYTy3QkfLMJhRfl3HJM9TKJLfPRid3T
	Cxpl80Hs9i+nObMmmgPW7LzgctWsk/+duBsJn7IH8cWnCjl+zW/z2dVvwGxlNpgFcR+9Hv7XtTW
	qZpmMR4zFrHUCKbXJdXAFfl2q5QIwy0WBS+sUGddYf5zeflinHFPhJlc9v3taHzfuXdO7mwU7lL
	x/G8bsKVS4+WYHb2GB8Qd3dcq2gaXVZNsOOzXn/Mnp7zNWM3cWh64VqJ/zg==
X-Google-Smtp-Source: AGHT+IEBTPNMTFRvcKnC0KLzGvHa8qOzIsXx/ZCKTKxIxch8Gro64WngPPBpQrtp7NoP+R/rpwEy93WSmCs1K900IkU=
X-Received: by 2002:a05:690c:4d48:b0:785:f54a:998e with SMTP id
 00721157ae682-78a8b580a95mr213482347b3.69.1764369779877; Fri, 28 Nov 2025
 14:42:59 -0800 (PST)
MIME-Version: 1.0
References: <20251128115800.2757259-1-jan.claussen10@web.de>
 <CAMKF1soRo6=R=mCu=tah=SvEECFxrwONKxPA3OzXCi9MQXcYsA@mail.gmail.com>
 <CA+chaQcTCvLQjvfCVJGYgYPUMDK8rQGM_QOZQ+t=pv+jzkbW8w@mail.gmail.com>
 <35b21d06-11cb-4327-a80b-4ebeffdbad0d@web.de> <c7ac67c0-8a3b-4feb-8bd0-b3a77ae4d279@web.de>
In-Reply-To: <c7ac67c0-8a3b-4feb-8bd0-b3a77ae4d279@web.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Nov 2025 14:42:48 -0800
X-Gm-Features: AWmQ_blqRBMb469VEmMSPy99u0_lGFyUvspajWwGyul4tCIZLb3zleLbZUOyo0w
Message-ID: <CAMKF1srqSkS8ciWicCZN7VqKafSBHaOOuSrQxsZ0+HWSxu7=Qw@mail.gmail.com>
Subject: Re: [oe] [meta-python][master][PATCH] python3-soundcard: Add recipe
To: jan.claussen10@web.de
Cc: Martin Jansa <martin.jansa@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fb6a130644af59db"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 22:43:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122155

--000000000000fb6a130644af59db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please send patches with git send-email

On Fri, Nov 28, 2025 at 2:27=E2=80=AFPM <jan.claussen10@web.de> wrote:

> I added a longer DESCRIPTION, HOMEPAGE and added SECTION =3D "devel/pytho=
n".
>
> ---
>
> SoundCard is a library for playing and recording audio without resorting
> to a CPython extension.
>
> Signed-off-by: Jan Clau=C3=9Fen <jan.claussen10@web.de>
> ---
>  .../python/python3-soundcard_0.4.5.bb         | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-soundcard_0.4.5.bb
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-soundcard_0.4.5.bb b/meta-python/recipes-devtools/python/
> python3-soundcard_0.4.5.bb
> new file mode 100644
> index 0000000000..5116892dad
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "Python library for accessing soundcards"
> +DESCRIPTION =3D "SoundCard is a library for playing and recording audio
> without resorting to a CPython extension"
> +HOMEPAGE =3D "https://github.com/bastibe/SoundCard"
> +SECTION =3D "devel/python"
> +
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De39df1540c06c17ca310ce87c36b0=
42c"
> +
> +SRC_URI[sha256sum] =3D
> "07272ba927e32cafdf634e4a1ca53b9a3218321a60c7d2e08f54b832a56946aa"
> +
> +inherit pypi setuptools3 features_check
> +
> +REQUIRED_DISTRO_FEATURES =3D "pulseaudio"
> +
> +RDEPENDS:${PN} +=3D " \
> +    libpulse \
> +    pulseaudio-server \
> +    python3-cffi \
> +    python3-numpy \
> +"
> --
> 2.52.0
>
> On 28.11.25 21:27, Jan Clau=C3=9Fen <jan.claussen10@web.de> wrote:
> > @Martin: Thanks, for pointing that out
> >
> > I fixed the recipe added inherit features_check. Should maybe also add =
a
> > meaningful commit message, but I didn't know what to add.
> >
> >
> > Signed-off-by: Jan Clau=C3=9Fen <jan.claussen10@web.de>
> > ---
> >   .../python/python3-soundcard_0.4.5.bb            | 16 +++++++++++++++=
+
> >   1 file changed, 16 insertions(+)
> >   create mode 100644 meta-python/recipes-devtools/python/python3-
> > soundcard_0.4.5.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-
> > soundcard_0.4.5.bb b/meta-python/recipes-devtools/python/python3-
> > soundcard_0.4.5.bb
> > new file mode 100644
> > index 0000000000..e25f13a116
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
> > @@ -0,0 +1,16 @@
> > +SUMMARY =3D "Python library for accessing soundcards"
> > +LICENSE =3D "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De39df1540c06c17ca310ce87c36=
b042c"
> > +
> > +SRC_URI[sha256sum] =3D
> > "07272ba927e32cafdf634e4a1ca53b9a3218321a60c7d2e08f54b832a56946aa"
> > +
> > +inherit pypi setuptools3 features_check
> > +
> > +REQUIRED_DISTRO_FEATURES =3D "pulseaudio"
> > +
> > +RDEPENDS:${PN} +=3D " \
> > +    libpulse \
> > +    pulseaudio-server \
> > +    python3-cffi \
> > +    python3-numpy \
> > +"
> > --
> > 2.52.0
> >
> > Am 28.11.25 um 21:18 schrieb Martin Jansa:
> > > And REQUIRED_DISTRO_FEATURES =3D "pulseaudio" probably doesn't do
> > > anything without features_check inherit
> > >
> > > On Fri, Nov 28, 2025 at 9:01=E2=80=AFPM Khem Raj via lists.openembedd=
ed.org
> > > <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> > >> results in
> > >>
> > >> ERROR: ParseError at
> /mnt/b/yoe/master/sources/meta-openembedded/meta-python/recipes-devtools/=
python/
> python3-soundcard_0.4.5.bb:13: Unparsed lines
> /mnt/b/yoe/master/sources/meta-openembedded/meta-python/recipes-devtools/=
python/
> python3-soundcard_0.4.5.bb: ['RDEPENDS:${PN} +=3D " ', '    libpulse ']
> > >> ERROR: Parsing halted due to errors, see error messages above
> > >>
> > >>
> > >> On Fri, Nov 28, 2025 at 3:58=E2=80=AFAM Jan Clau=C3=9Fen via
> lists.openembedded.org<jan.claussen10=3Dweb.de@lists.openembedded.org>
> wrote:
> > >>> Signed-off-by: Jan Clau=C3=9Fen<jan.claussen10@web.de>
> > >>> ---
> > >>>   .../python/python3-soundcard_0.4.5.bb                | 12
> ++++++++++++
> > >>>   1 file changed, 12 insertions(+)
> > >>>   create mode 100644 meta-python/recipes-devtools/python/
> python3-soundcard_0.4.5.bb
> > >>>
> > >>> diff --git a/meta-python/recipes-devtools/python/
> python3-soundcard_0.4.5.bb b/meta-python/recipes-devtools/python/
> python3-soundcard_0.4.5.bb
> > >>> new file mode 100644
> > >>> index 0000000000..632b54eaef
> > >>> --- /dev/null
> > >>> +++ b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.b=
b
> > >>> @@ -0,0 +1,12 @@
> > >>> +SUMMARY =3D "Python library for accessing soundcards"
> > >>> +LICENSE =3D "BSD-3-Clause"
> > >>> +LIC_FILES_CHKSUM
> =3D"file://LICENSE;md5=3De39df1540c06c17ca310ce87c36b042c"
> > >>> +
> > >>> +SRC_URI[sha256sum] =3D
> "07272ba927e32cafdf634e4a1ca53b9a3218321a60c7d2e08f54b832a56946aa"
> > >>> +
> > >>> +inherit pypi setuptools3
> > >>> +
> > >>> +REQUIRED_DISTRO_FEATURES =3D "pulseaudio"
> > >>> +
> > >>> +RDEPENDS:${PN} +=3D " \
> > >>> +    libpulse \
> > >>> +    pulseaudio-server \
> > >>> +    python3-cffi \
> > >>> +    python3-numpy \
> > >>> +"
> > >>
> > >>> --
> > >>> 2.52.0
> > >>>
> > >>>
> > >>>
> > >>>
> > >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >> Links: You receive all messages sent to this group.
> > >> View/Reply Online (#122127):
> https://lists.openembedded.org/g/openembedded-devel/message/122127
> > >> Mute This Topic:https://lists.openembedded.org/mt/116512050/3617156
> > >> Group Owner:openembedded-devel+owner@lists.openembedded.org
> > >> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsu=
b
> [martin.jansa@gmail.com]
> > >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >>
> >
>

--000000000000fb6a130644af59db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please send patches with git send-email=C2=A0</div><div d=
ir=3D"auto"><br><div class=3D"gmail_quote gmail_quote_container" dir=3D"aut=
o"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 28, 2025 at 2:27=E2=80=
=AFPM &lt;<a href=3D"mailto:jan.claussen10@web.de">jan.claussen10@web.de</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I added a longer DESCR=
IPTION, HOMEPAGE and added SECTION =3D &quot;devel/python&quot;. <br>
<br>
---<br>
<br>
SoundCard is a library for playing and recording audio without resorting to=
 a CPython extension.<br>
<br>
Signed-off-by: Jan Clau=C3=9Fen &lt;<a href=3D"mailto:jan.claussen10@web.de=
" target=3D"_blank">jan.claussen10@web.de</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-soundcard_0.4.5.bb" rel=3D"noref=
errer" target=3D"_blank">python3-soundcard_0.4.5.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 20 +++++++++++++++++++<br>
=C2=A01 file changed, 20 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-soundcard_0.4.5.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-soundcard_0.4.5.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
soundcard_0.4.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-soundcard_=
0.4.5.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-soundcard_0.4.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-soundcar=
d_0.4.5.bb</a><br>
new file mode 100644<br>
index 0000000000..5116892dad<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-soundca=
rd_0.4.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-soundcard_0.4.5.b=
b</a><br>
@@ -0,0 +1,20 @@<br>
+SUMMARY =3D &quot;Python library for accessing soundcards&quot;<br>
+DESCRIPTION =3D &quot;SoundCard is a library for playing and recording aud=
io without resorting to a CPython extension&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/bastibe/SoundCard" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/bastibe/SoundCard</a>&quo=
t;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De39df1540c06c17ca310ce87c3=
6b042c&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;07272ba927e32cafdf634e4a1ca53b9a3218321a60c7d=
2e08f54b832a56946aa&quot;<br>
+<br>
+inherit pypi setuptools3 features_check<br>
+<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;pulseaudio&quot;<br>
+<br>
+RDEPENDS:${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 libpulse \<br>
+=C2=A0 =C2=A0 pulseaudio-server \<br>
+=C2=A0 =C2=A0 python3-cffi \<br>
+=C2=A0 =C2=A0 python3-numpy \<br>
+&quot;<br>
-- <br>
2.52.0<br>
<br>
On 28.11.25 21:27, Jan Clau=C3=9Fen &lt;<a href=3D"mailto:jan.claussen10@we=
b.de" target=3D"_blank">jan.claussen10@web.de</a>&gt; wrote:<br>
&gt; @Martin: Thanks, for pointing that out<br>
&gt; <br>
&gt; I fixed the recipe added inherit features_check. Should maybe also add=
 a <br>
&gt; meaningful commit message, but I didn&#39;t know what to add.<br>
&gt; <br>
&gt; <br>
&gt; Signed-off-by: Jan Clau=C3=9Fen &lt;<a href=3D"mailto:jan.claussen10@w=
eb.de" target=3D"_blank">jan.claussen10@web.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../python/<a href=3D"http://python3-soundcard_0.4.5.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-soundcard_0.4.5.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 16 ++++++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 16 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-python/recipes-devtools/python/pyt=
hon3- <br>
&gt; <a href=3D"http://soundcard_0.4.5.bb" rel=3D"noreferrer" target=3D"_bl=
ank">soundcard_0.4.5.bb</a><br>
&gt; <br>
&gt; diff --git a/meta-python/recipes-devtools/python/python3- <br>
&gt; <a href=3D"http://soundcard_0.4.5.bb" rel=3D"noreferrer" target=3D"_bl=
ank">soundcard_0.4.5.bb</a> b/meta-python/recipes-devtools/python/python3- =
<br>
&gt; <a href=3D"http://soundcard_0.4.5.bb" rel=3D"noreferrer" target=3D"_bl=
ank">soundcard_0.4.5.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..e25f13a116<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-so=
undcard_0.4.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-soundcard_0.=
4.5.bb</a><br>
&gt; @@ -0,0 +1,16 @@<br>
&gt; +SUMMARY =3D &quot;Python library for accessing soundcards&quot;<br>
&gt; +LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De39df1540c06c17ca310c=
e87c36b042c&quot;<br>
&gt; +<br>
&gt; +SRC_URI[sha256sum] =3D <br>
&gt; &quot;07272ba927e32cafdf634e4a1ca53b9a3218321a60c7d2e08f54b832a56946aa=
&quot;<br>
&gt; +<br>
&gt; +inherit pypi setuptools3 features_check<br>
&gt; +<br>
&gt; +REQUIRED_DISTRO_FEATURES =3D &quot;pulseaudio&quot;<br>
&gt; +<br>
&gt; +RDEPENDS:${PN} +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 libpulse \<br>
&gt; +=C2=A0 =C2=A0 pulseaudio-server \<br>
&gt; +=C2=A0 =C2=A0 python3-cffi \<br>
&gt; +=C2=A0 =C2=A0 python3-numpy \<br>
&gt; +&quot;<br>
&gt; -- <br>
&gt; 2.52.0<br>
&gt; <br>
&gt; Am 28.11.25 um 21:18 schrieb Martin Jansa:<br>
&gt; &gt; And REQUIRED_DISTRO_FEATURES =3D &quot;pulseaudio&quot; probably =
doesn&#39;t do<br>
&gt; &gt; anything without features_check inherit<br>
&gt; &gt;<br>
&gt; &gt; On Fri, Nov 28, 2025 at 9:01=E2=80=AFPM Khem Raj via <a href=3D"h=
ttp://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.op=
enembedded.org</a><br>
&gt; &gt; &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org=
" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt;&gt; results in<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; ERROR: ParseError at /mnt/b/yoe/master/sources/meta-openembed=
ded/meta-python/recipes-devtools/python/<a href=3D"http://python3-soundcard=
_0.4.5.bb:13" rel=3D"noreferrer" target=3D"_blank">python3-soundcard_0.4.5.=
bb:13</a>: Unparsed lines /mnt/b/yoe/master/sources/meta-openembedded/meta-=
python/recipes-devtools/python/<a href=3D"http://python3-soundcard_0.4.5.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-soundcard_0.4.5.bb</a>: [&#3=
9;RDEPENDS:${PN} +=3D &quot; &#39;, &#39;=C2=A0 =C2=A0 libpulse &#39;]<br>
&gt; &gt;&gt; ERROR: Parsing halted due to errors, see error messages above=
<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Fri, Nov 28, 2025 at 3:58=E2=80=AFAM Jan Clau=C3=9Fen via =
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a>&lt;jan.claussen10=3D<a href=3D"mailto:web.de=
@lists.openembedded.org" target=3D"_blank">web.de@lists.openembedded.org</a=
>&gt; wrote:<br>
&gt; &gt;&gt;&gt; Signed-off-by: Jan Clau=C3=9Fen&lt;<a href=3D"mailto:jan.=
claussen10@web.de" target=3D"_blank">jan.claussen10@web.de</a>&gt;<br>
&gt; &gt;&gt;&gt; ---<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0.../python/<a href=3D"http://python3-soundcar=
d_0.4.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-soundcard_0.4.5.bb=
</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 ++++++++++=
++<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A01 file changed, 12 insertions(+)<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0create mode 100644 meta-python/recipes-devtoo=
ls/python/<a href=3D"http://python3-soundcard_0.4.5.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-soundcard_0.4.5.bb</a><br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; diff --git a/meta-python/recipes-devtools/python/<a href=
=3D"http://python3-soundcard_0.4.5.bb" rel=3D"noreferrer" target=3D"_blank"=
>python3-soundcard_0.4.5.bb</a> b/meta-python/recipes-devtools/python/<a hr=
ef=3D"http://python3-soundcard_0.4.5.bb" rel=3D"noreferrer" target=3D"_blan=
k">python3-soundcard_0.4.5.bb</a><br>
&gt; &gt;&gt;&gt; new file mode 100644<br>
&gt; &gt;&gt;&gt; index 0000000000..632b54eaef<br>
&gt; &gt;&gt;&gt; --- /dev/null<br>
&gt; &gt;&gt;&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http=
://python3-soundcard_0.4.5.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-soundcard_0.4.5.bb</a><br>
&gt; &gt;&gt;&gt; @@ -0,0 +1,12 @@<br>
&gt; &gt;&gt;&gt; +SUMMARY =3D &quot;Python library for accessing soundcard=
s&quot;<br>
&gt; &gt;&gt;&gt; +LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; &gt;&gt;&gt; +LIC_FILES_CHKSUM =3D&quot;file://LICENSE;md5=3De39df1540=
c06c17ca310ce87c36b042c&quot;<br>
&gt; &gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt; +SRC_URI[sha256sum] =3D &quot;07272ba927e32cafdf634e4a1ca=
53b9a3218321a60c7d2e08f54b832a56946aa&quot;<br>
&gt; &gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt; +inherit pypi setuptools3<br>
&gt; &gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt; +REQUIRED_DISTRO_FEATURES =3D &quot;pulseaudio&quot;<br>
&gt; &gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt; +RDEPENDS:${PN} +=3D &quot; \<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 libpulse \<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 pulseaudio-server \<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 python3-cffi \<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 python3-numpy \<br>
&gt; &gt;&gt;&gt; +&quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt; --<br>
&gt; &gt;&gt;&gt; 2.52.0<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;&gt; Links: You receive all messages sent to this group.<br>
&gt; &gt;&gt; View/Reply Online (#122127):<a href=3D"https://lists.openembe=
dded.org/g/openembedded-devel/message/122127" rel=3D"noreferrer" target=3D"=
_blank">https://lists.openembedded.org/g/openembedded-devel/message/122127<=
/a><br>
&gt; &gt;&gt; Mute This Topic:<a href=3D"https://lists.openembedded.org/mt/=
116512050/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/mt/116512050/3617156</a><br>
&gt; &gt;&gt; Group <a href=3D"mailto:Owner%3Aopenembedded-devel%2Bowner@li=
sts.openembedded.org" target=3D"_blank">Owner:openembedded-devel+owner@list=
s.openembedded.org</a><br>
&gt; &gt;&gt; Unsubscribe:<a href=3D"https://lists.openembedded.org/g/opene=
mbedded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jans=
a@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>]<br>
&gt; &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;&gt;<br>
&gt; <br>
</blockquote></div></div>

--000000000000fb6a130644af59db--

