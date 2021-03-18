Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web12.670.1616099199776028955
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Mar 2021 13:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ope8SAWe;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id g20so613850qkk.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Mar 2021 13:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=G2WCAVGyJGhoN/83k48RpA9iFanq7rNZWtomoUMVM/Y=;
        b=ope8SAWeyXvXQYVMImFvI/NYHh5y8ENXtTqu8IYcCnYUlui5uWsUTbVmOUsJtKpS17
         pbm1yQeL7Fsh8ieT+txydaSOZPombeYp0o0JH2D+QBaPs9UImbvz6IYjMklZ+85iOgKU
         ifU+SokyO43TENxlH7+gN7Xy7iRjlef6mdbEL2jIe9m3lOIGjBABWJeWlDlPuwoXhNhY
         NNUpxwJk/OjRkkDxTtG03YdsuFEYuhCo4zqvDXejPe3K2sUf3DwKz5+cVq/7Uyt3ehyO
         mTALaWtbJ0Q4Tt9wR8696wf4L7DwErgi3ibYZf671c5MnuAHQeUXYwlpqY1eEEHVP0MI
         Mfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=G2WCAVGyJGhoN/83k48RpA9iFanq7rNZWtomoUMVM/Y=;
        b=bYZ3agW56shFW0A7M39rKtpYtg0gJS9yrN8E68zKfnREprQuPgSoE7KMDnYFZt8Sww
         ltfig2OGTpZuYxP5EqxzJkw909dsNOtcAiOS1bNevVqtQMi86/Rxh0nGnrUVlUzt2H4p
         SzwkU0dUaW5EdEFrUyF3J9utv+QxnGwQhkip1Z9UGNfAqCyQ0vKyTfyoJUqPunxU1tnK
         D8cczHN9wrtwK+u8i8aeEGMBbPeGbBOcg1EFDzLphqNfvCs7IEySipWTp3XaOqmmJ1b5
         VpDGpND7jo4IXACz4BSwObpw9uAfwSDnRNmK1NCBohkBYkaOsFVSEg0nEYQMBBAJmu8X
         Pigg==
X-Gm-Message-State: AOAM53350eD72u08ZqkGuYpvWgueV1pNL9jPzJzEd6evkl/4beY6SO9K
	GgodqY2t/DKbdgyb81AdzqcKH9mTqC9i0dswBFY=
X-Google-Smtp-Source: ABdhPJzHUdSWHOP/nC788ueIl0GZXWQehYlCaHSHoMWtqZ+0vLpfKo5+bz3O1NthjVwpSbQku8uue/eSggHaqJJSS58=
X-Received: by 2002:a05:620a:12ae:: with SMTP id x14mr6311108qki.25.1616099198736;
 Thu, 18 Mar 2021 13:26:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a37:6f07:0:0:0:0:0 with HTTP; Thu, 18 Mar 2021 13:26:38
 -0700 (PDT)
In-Reply-To: <CAMRc=Mc8WCeCobNeS6=qyHQH43UO3mf-hG1YHUAFCyrTeANn4g@mail.gmail.com>
References: <CAMRc=McUB0dbu=GoQz_mrt0=V3=iYawp=WJi6Z5-_fW3i4dLPQ@mail.gmail.com>
 <20210318174457.gm2no6omtd6qgzma@apollo.localdomain> <CAMRc=Mc8WCeCobNeS6=qyHQH43UO3mf-hG1YHUAFCyrTeANn4g@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 18 Mar 2021 13:26:38 -0700
Message-ID: <CAMKF1soMR6uXiqHZhk-fZo3FFo3r1mH4i8HPJ5EXbJn3rKsXTQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] mpv can't find x11 components
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Trevor Woerner <twoerner@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000a99c3405bdd56ad3"

--000000000000a99c3405bdd56ad3
Content-Type: text/plain; charset="UTF-8"

On Thursday, March 18, 2021, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> On Thu, Mar 18, 2021 at 6:45 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, Mar 18, 2021 at 11:47:30AM +0100, Bartosz Golaszewski wrote:
> > > I'm trying to add mpv to an image using the minimal-x-session. The
> > > build fails with the following error at do_configure():
> > >
> > > | Checking for X11
> > >      : no ('x11 >= 1.0.0 xscrnsaver >= 1.0.0 xext >= 1.0.0 xinerama >=
> > > 1.0.0 xrandr >= 1.2.0' not found)
> > > | You manually enabled the feature 'x11', but the autodetection check
> failed.
> > >
> > > If I build the core-image-x11 image, mpv builds just fine so I assume
> > > I'm missing something in my custom image (or rather some dependency
> > > isn't pulled in by the recipe).
> > >
> > > Any idea on what could be missing?
> > >
> >
> > do you have x11 in DISTRO_FEATURES looking at config.log file might
> > reveal more on missing dependencies.
> >
>
> Yes I do. It looks like the build is looking for
> /recipe-sysroot/usr/lib/pkgconfig/xrandr.pc (provided by
> libxrandr-dev) and it finds it on current master but not on dunfell
> that I'm using.
>
> It doesn't look right, does it? Shouldn't it look in
> recipe-sysroot-native for any such development files?


Yeah sometime with-x option is needed to let it find in right sysroot
otherwise autoconf has mind of its own at times and pokes at build host


> Bart
>

--000000000000a99c3405bdd56ad3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Thursday, March 18, 2021, Bartosz Golaszewski &lt;<a href=3D"mai=
lto:brgl@bgdev.pl">brgl@bgdev.pl</a>&gt; wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">On Thu, Mar 18, 2021 at 6:45 PM Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, Mar 18, 2021 at 11:47:30AM +0100, Bartosz Golaszewski wrote:<b=
r>
&gt; &gt; I&#39;m trying to add mpv to an image using the minimal-x-session=
. The<br>
&gt; &gt; build fails with the following error at do_configure():<br>
&gt; &gt;<br>
&gt; &gt; | Checking for X11<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 : no (&#39;x11 &gt;=3D 1.0.0 xscrnsaver &gt;=
=3D 1.0.0 xext &gt;=3D 1.0.0 xinerama &gt;=3D<br>
&gt; &gt; 1.0.0 xrandr &gt;=3D 1.2.0&#39; not found)<br>
&gt; &gt; | You manually enabled the feature &#39;x11&#39;, but the autodet=
ection check failed.<br>
&gt; &gt;<br>
&gt; &gt; If I build the core-image-x11 image, mpv builds just fine so I as=
sume<br>
&gt; &gt; I&#39;m missing something in my custom image (or rather some depe=
ndency<br>
&gt; &gt; isn&#39;t pulled in by the recipe).<br>
&gt; &gt;<br>
&gt; &gt; Any idea on what could be missing?<br>
&gt; &gt;<br>
&gt;<br>
&gt; do you have x11 in DISTRO_FEATURES looking at config.log file might<br=
>
&gt; reveal more on missing dependencies.<br>
&gt;<br>
<br>
Yes I do. It looks like the build is looking for<br>
/recipe-sysroot/usr/lib/<wbr>pkgconfig/xrandr.pc (provided by<br>
libxrandr-dev) and it finds it on current master but not on dunfell<br>
that I&#39;m using.<br>
<br>
It doesn&#39;t look right, does it? Shouldn&#39;t it look in<br>
recipe-sysroot-native for any such development files?</blockquote><div><br>=
</div><div>Yeah sometime with-x option is needed to let it find in right sy=
sroot otherwise autoconf has mind of its own at times and pokes at build ho=
st=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Bart<br>
</blockquote>

--000000000000a99c3405bdd56ad3--
