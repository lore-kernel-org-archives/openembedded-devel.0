Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.37356.1623078857932952132
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 08:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r8X7KMlU;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id o27so16964217qkj.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jun 2021 08:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EUgxEKV+QynTiXr85Y3Eq1g7QvMaeoUwQJpzIwdlC+A=;
        b=r8X7KMlUSlFvK+fBxhuz2slnslKa5Cg313F8uGRYQ9ZJw7IGibfr1UjeGEwYWZi7xB
         trjfnGmInor/9zoRZe01z/63odHT+tVNGtsOapYrqdpZ3omJO7kbmHc/oOkALBg2DVbi
         6ILJyU9cHMIz4pbd0Hb5/oUQqKbq3lxoeEsw5SpleqtkWzPi32lY8OC4zhulfMzlep7q
         W8w7XAqrMoxRJC7IGjSJuzdKEo2r00fR1bOcuI+lYT156ghTeV/qvcH/X7vgg5GiXnVn
         oOkA1G0LXr+v8tcP6VzEw4de+Ff0+2rOUIZLJlWKAeS0ts0FwPsIQs7WNBUFI5Zgoulv
         4Uig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EUgxEKV+QynTiXr85Y3Eq1g7QvMaeoUwQJpzIwdlC+A=;
        b=FcUhxA6mv9hG8UjQsZIK7WFE5yvi7Sz7w0wR9DaeIp4YbpQCv9bKEfJ4BM0x6bUxmC
         mc94SI+fMe7Ffc3wz6prujQ1v+mC5lhCPIwlf0Wp93MeL8n1sCHYbrmkUIS/zwHsJfAn
         q4eJjQCXFCGU3YYydqyWXB7J6vQt3zGuyqnXa3Kjdjd27j9ptt4Zdbn7/xVALcwoPG6L
         Jo93nqTLr7ZLZ/ASL3cbxiS/vdtJ0PkdE+CcVM/KEOONMqfbkX/GsClAGObRGbzRcwt8
         uU5WU0Hj/F1GZenZd+kPWnG+d8F5XojXgep9rxReltTi1jfwD8NsNX3WZ+IVlRJAFaeP
         Y3NA==
X-Gm-Message-State: AOAM531Yq6ToJaST5z8B4nlPQQX2D6Kt15m6wUTSRz/6NJ/oh7N/KtLu
	bHEPCWR2T6EBt2IORTt/Mlzd9a0ClozRxXwqzjU=
X-Google-Smtp-Source: ABdhPJzJbv1gAeJOyOcZ1Ju+uraOuDZ7a07drhzWvYqb8OUYutbCIw2GIEzbpePBrPWqg/xRvrD85+fiom1dGfx8oS4=
X-Received: by 2002:a05:620a:13a5:: with SMTP id m5mr16920957qki.119.1623078857102;
 Mon, 07 Jun 2021 08:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210602141501.6174-1-brgl@bgdev.pl> <20210602141501.6174-9-brgl@bgdev.pl>
 <CAMKF1spd2yzEBiStsv-+sqaCMe7HG-6iUKXcKkc+4MfZ5waG7Q@mail.gmail.com> <CAMRc=McX9H6GxvM9ejxUs4Eet6cSXxf63Ln0CkHO27M6iwRquw@mail.gmail.com>
In-Reply-To: <CAMRc=McX9H6GxvM9ejxUs4Eet6cSXxf63Ln0CkHO27M6iwRquw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 7 Jun 2021 08:14:06 -0700
Message-ID: <CAMKF1spmuj6ujbKF5JVWeixGmGtiY_zvjE32TVF79+3MKeTpxQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 8/9] libgpiod: ptest: warn if the gpio-mockup kernel module is not selected
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Armin Kuster <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b8598205c42e7e05"

--000000000000b8598205c42e7e05
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 7, 2021 at 1:55 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> On Sun, Jun 6, 2021 at 12:17 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Jun 2, 2021 at 7:15 AM Bartosz Golaszewski <brgl@bgdev.pl>
> wrote:
> > >
> > > libgpiod test-suites work with the gpio-mockup kernel module. When
> using
> > > linux-yocto, it's enabled using the gpio/mockup.scc kernel feature.
> Check
> > > if this feature is present in KERNEL_FEATURE and warn if not.
> > >
> > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > > ---
> > >  meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> > > index 874453fbd..febf625a6 100644
> > > --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> > > +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> > > @@ -52,6 +52,13 @@ RRECOMMENDS_${PN} +=
> "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-py
> > >  PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES',
> 'ptest', 'tests', '', d)}"
> > >
> > >  do_install_ptest() {
> > > +    if [ "${PREFERRED_PROVIDER_virtual/kernel}" = "linux-yocto" ] && \
> > > +       ${@bb.utils.contains('KERNEL_FEATURES',
> 'features/gpio/mockup.scc', 'false', 'true',d)}; then
> > > +        bbwarn "libgpiod test-suites need the gpio-mockup
> > > +module and will not work without it. Consider adding
> > > +'features/gpio/mockup.scc' to KERNEL_FEATURES"
> > > +    fi
> > > +
> >
> > perhaps turn this into a bbnote something like what libbpf is doing see
> >
> http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-kernel/libbpf/libbpf_0.3.bb?h=master
> >
>
> I really think that a warning is in order here. The ptests won't work
> without this module. At the same time we can't really skip the package
> altogether because the build may be using a different kernel recipe
> with its own defconfig - this is why we first check if we're using
> linux-yocto.


It should check for module being built in kernel irrespective of Linux
yocto that is right but we perhaps need a logic to consider the case where
I might have a kernel without this option and distro is using ptest feature

>
>
> Bart
>

--000000000000b8598205c42e7e05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jun 7, 2021 at 1:55 AM Bartosz Golaszewski &lt;<a h=
ref=3D"mailto:brgl@bgdev.pl">brgl@bgdev.pl</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On Sun, Jun 6, 2021 at 12:17 AM Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
 wrote:<br>
&gt;<br>
&gt; On Wed, Jun 2, 2021 at 7:15 AM Bartosz Golaszewski &lt;<a href=3D"mail=
to:brgl@bgdev.pl" target=3D"_blank">brgl@bgdev.pl</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; libgpiod test-suites work with the gpio-mockup kernel module. Whe=
n using<br>
&gt; &gt; linux-yocto, it&#39;s enabled using the gpio/mockup.scc kernel fe=
ature. Check<br>
&gt; &gt; if this feature is present in KERNEL_FEATURE and warn if not.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Bartosz Golaszewski &lt;<a href=3D"mailto:brgl@bgd=
ev.pl" target=3D"_blank">brgl@bgdev.pl</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta-oe/recipes-support/libgpiod/<a href=3D"http://libgpiod=
_1.6.3.bb" rel=3D"noreferrer" target=3D"_blank">libgpiod_1.6.3.bb</a> | 7 +=
++++++<br>
&gt; &gt;=C2=A0 1 file changed, 7 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/recipes-support/libgpiod/<a href=3D"http://l=
ibgpiod_1.6.3.bb" rel=3D"noreferrer" target=3D"_blank">libgpiod_1.6.3.bb</a=
> b/meta-oe/recipes-support/libgpiod/<a href=3D"http://libgpiod_1.6.3.bb" r=
el=3D"noreferrer" target=3D"_blank">libgpiod_1.6.3.bb</a><br>
&gt; &gt; index 874453fbd..febf625a6 100644<br>
&gt; &gt; --- a/meta-oe/recipes-support/libgpiod/<a href=3D"http://libgpiod=
_1.6.3.bb" rel=3D"noreferrer" target=3D"_blank">libgpiod_1.6.3.bb</a><br>
&gt; &gt; +++ b/meta-oe/recipes-support/libgpiod/<a href=3D"http://libgpiod=
_1.6.3.bb" rel=3D"noreferrer" target=3D"_blank">libgpiod_1.6.3.bb</a><br>
&gt; &gt; @@ -52,6 +52,13 @@ RRECOMMENDS_${PN} +=3D &quot;${@bb.utils.conta=
ins(&#39;PACKAGECONFIG&#39;, &#39;python3&#39;, &#39;${PN}-py<br>
&gt; &gt;=C2=A0 PACKAGECONFIG_append =3D &quot; ${@bb.utils.contains(&#39;D=
ISTRO_FEATURES&#39;, &#39;ptest&#39;, &#39;tests&#39;, &#39;&#39;, d)}&quot=
;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 do_install_ptest() {<br>
&gt; &gt; +=C2=A0 =C2=A0 if [ &quot;${PREFERRED_PROVIDER_virtual/kernel}&qu=
ot; =3D &quot;linux-yocto&quot; ] &amp;&amp; \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;KERNEL_FEAT=
URES&#39;, &#39;features/gpio/mockup.scc&#39;, &#39;false&#39;, &#39;true&#=
39;,d)}; then<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbwarn &quot;libgpiod test-suites ne=
ed the gpio-mockup<br>
&gt; &gt; +module and will not work without it. Consider adding<br>
&gt; &gt; +&#39;features/gpio/mockup.scc&#39; to KERNEL_FEATURES&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 fi<br>
&gt; &gt; +<br>
&gt;<br>
&gt; perhaps turn this into a bbnote something like what libbpf is doing se=
e<br>
&gt; <a href=3D"http://cgit.openembedded.org/meta-openembedded/tree/meta-oe=
/recipes-kernel/libbpf/libbpf_0.3.bb?h=3Dmaster" rel=3D"noreferrer" target=
=3D"_blank">http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/rec=
ipes-kernel/libbpf/libbpf_0.3.bb?h=3Dmaster</a><br>
&gt;<br>
<br>
I really think that a warning is in order here. The ptests won&#39;t work<b=
r>
without this module. At the same time we can&#39;t really skip the package<=
br>
altogether because the build may be using a different kernel recipe<br>
with its own defconfig - this is why we first check if we&#39;re using<br>
linux-yocto.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">It s=
hould check for module being built in kernel irrespective of Linux yocto th=
at is right but we perhaps need a logic to consider the case where I might =
have a kernel without this option and distro is using ptest feature=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Bart<br>
</blockquote></div></div>

--000000000000b8598205c42e7e05--
