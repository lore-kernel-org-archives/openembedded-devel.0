Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web10.108298.1597919195031869683
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2020 03:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p2lavcyk;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id a127so794866vsd.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2020 03:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=imPdp3/l6fcDAqMZfxoMpb3W78E+hVwfdXEXvIlZh8k=;
        b=p2lavcykzZ53zq0AlB8hloIMT2OubaK+wemjUx+K/y/wTVZTKRT22j/w7a0MCh6oDs
         UurLSOvEbBNf1AuFG/Y5ormUXil+mI6XB9KvC8MykuXLUeP6M+zcIniy4sdeSPl2vpMs
         /PPbskcHEn2ZO5gwQMMVHCs9ZVovE43vxrUAno6uq4oTV2xI1RicRh4Q56pvB3LH6y2+
         As56K5n0kHFdM9au3CO+r1YfXFYCwMPnaDwzJBAwpUzt6kBbTvv0i/M2b76Ei1Dz19u0
         jyRecCMaJrAYKQmbqE6t56x8T3rqjMrphhU8VkNmJJGNHkUVoAwP4ZH/bDSfrYQGNGWW
         GbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=imPdp3/l6fcDAqMZfxoMpb3W78E+hVwfdXEXvIlZh8k=;
        b=cCIPWUMsLGDd1C0ChXxagHzJm33FPZYEFMSMc87/0L7p0INSOYVC9OjEYDn8P4zvGc
         GNOtOxFJLdrIVX4R8eGP3e8jlfeowDj/waj6pDYDbJPT8dmm6J2L6jLmSXyWanixKdBa
         UESjGCp9kScFbHabeYy7whZ03GpsPrAl3SLB0mZV5XpceuGUIeR9FxkLadRSXJZjU5Hr
         jXoZlOi2A8eB+oMK39sMFE0b8Jx/d+xVzpkzmebEbqvhUGLaK8h7AndtZY0I6hZ1hLNX
         mXmqspldMP2QxOqlg6BEJytdnekIeb1VFfInpFdJ1VsvlSnXkAFIh6IaQ05Eks0t63Ll
         9vwA==
X-Gm-Message-State: AOAM530RKuILdbKlr6DHY15HDezV6l3h6jslmwrormP8BQjezS2j+nDA
	02Op2Jw9D6tIMgb04wVGDiGsaQzjXPmEtHA1zwY=
X-Google-Smtp-Source: ABdhPJyS5Qj+S5llC6JZxObr98Qj9l0s9Z8BQlxVpj+6suqMeODTcIDGYI5dD6y0LiiOOb4YRGWGcWZqzbz6sBslESA=
X-Received: by 2002:a67:fb0f:: with SMTP id d15mr1333722vsr.83.1597919194137;
 Thu, 20 Aug 2020 03:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200813162756.24193-1-alex.kanavin@gmail.com> <20200820101019.GB51054@pcleri>
In-Reply-To: <20200820101019.GB51054@pcleri>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 20 Aug 2020 12:26:22 +0200
Message-ID: <CANNYZj-0FffY0wvrfybRVsQ_Jg8eJu1fm9XCW7otjD=O-GcYxQ@mail.gmail.com>
Subject: Re: [oe] [meta-java][PATCHv2] openjdk-8: add a glibc 2.32 compatibility patch
To: Richard Leitner <richard.leitner@skidata.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f24a4d05ad4c8dd9"

--000000000000f24a4d05ad4c8dd9
Content-Type: text/plain; charset="UTF-8"

Thanks Richard.

There's also a problem with te cacao recipe: upstream has disappeared,
which renders fresh builds impossible:

--2020-08-20 10:22:51--
https://bitbucket.org/cacaovm/cacao-staging/get/2d6f6c14daf9.zip
Resolving bitbucket.org (bitbucket.org)... 2406:da00:ff00::22c5:2ef4,
2406:da00:ff00::22c3:9b0a, 2406:da00:ff00::22c2:513, ...
Connecting to bitbucket.org (bitbucket.org)|2406:da00:ff00::22c5:2ef4|:443...
connected.
HTTP request sent, awaiting response... 403 Forbidden
2020-08-20 10:22:52 ERROR 403: Forbidden.

I guess we need to put the zip somewhere else, and fetch it from there?

Alex


On Thu, 20 Aug 2020 at 12:10, Richard Leitner <richard.leitner@skidata.com>
wrote:

> Hi,
> thank you for your patch!
>
> This is a note to let you know that I've just added this patch to the
> master-next branch of the meta-java repository at
>         git://git.yoctoproject.org/meta-java
>
> As soon as it has gone through some more testing it will likely be
> merged to the master branch.
>
> If you have any questions, please let me know.
>
> regards;rl
>
> On Thu, Aug 13, 2020 at 06:27:56PM +0200, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  .../openjdk/openjdk-8-release-common.inc      |  1 +
> >  .../2010-Remove-usage-of-sys-sysctl.h.patch   | 39 +++++++++++++++++++
> >  2 files changed, 40 insertions(+)
> >  create mode 100644
> recipes-core/openjdk/patches-openjdk-8/2010-Remove-usage-of-sys-sysctl.h.patch
> >
> > diff --git a/recipes-core/openjdk/openjdk-8-release-common.inc
> b/recipes-core/openjdk/openjdk-8-release-common.inc
> > index 02210a1..c43fd22 100644
> > --- a/recipes-core/openjdk/openjdk-8-release-common.inc
> > +++ b/recipes-core/openjdk/openjdk-8-release-common.inc
> > @@ -20,6 +20,7 @@ PATCHES_URI = "\
> >      file://2007-jdk-no-genx11-in-headless.patch \
> >      file://2008-jdk-no-unused-deps.patch \
> >
> file://2009-jdk-use-gcc-instead-of-ld-to-link-genSocketOptionRegistry.patch
> \
> > +    file://2010-Remove-usage-of-sys-sysctl.h.patch \
> >  "
> >  HOTSPOT_UB_PATCH = "\
> >      file://1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch \
> > diff --git
> a/recipes-core/openjdk/patches-openjdk-8/2010-Remove-usage-of-sys-sysctl.h.patch
> b/recipes-core/openjdk/patches-openjdk-8/2010-Remove-usage-of-sys-sysctl.h.patch
> > new file mode 100644
> > index 0000000..f6d7681
> > --- /dev/null
> > +++
> b/recipes-core/openjdk/patches-openjdk-8/2010-Remove-usage-of-sys-sysctl.h.patch
> > @@ -0,0 +1,39 @@
> > +From 3ed9b4a109cf2f31b97ab8ba317d67886452523c Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Date: Thu, 13 Aug 2020 17:59:42 +0200
> > +Subject: [PATCH] Remove usage of sys/sysctl.h
> > +
> > +This header has been removed in glibc 2.32, and isn't used for
> > +anything.
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +---
> > + jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c | 1 -
> > + jdk/src/solaris/native/java/net/PlainSocketImpl.c         | 1 -
> > + 2 files changed, 2 deletions(-)
> > +
> > +diff --git a/jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c
> b/jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c
> > +index cd15654e..4d8abe03 100644
> > +--- a/jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c
> > ++++ b/jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c
> > +@@ -41,7 +41,6 @@
> > + #endif
> > + #ifdef __linux__
> > + #include <unistd.h>
> > +-#include <sys/sysctl.h>
> > + #include <sys/utsname.h>
> > + #include <netinet/ip.h>
> > +
> > +diff --git a/jdk/src/solaris/native/java/net/PlainSocketImpl.c
> b/jdk/src/solaris/native/java/net/PlainSocketImpl.c
> > +index 170957e7..9aafbc09 100644
> > +--- a/jdk/src/solaris/native/java/net/PlainSocketImpl.c
> > ++++ b/jdk/src/solaris/native/java/net/PlainSocketImpl.c
> > +@@ -43,7 +43,6 @@
> > + #endif
> > + #ifdef __linux__
> > + #include <unistd.h>
> > +-#include <sys/sysctl.h>
> > + #endif
> > +
> > + #include "jvm.h"
> > --
> > 2.28.0
> >
>

--000000000000f24a4d05ad4c8dd9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Richard.</div><div><br></div><div>There&#39;s =
also a problem with te cacao recipe: upstream has disappeared, which render=
s fresh builds impossible:</div><div><br></div><div>--2020-08-20 10:22:51--=
 =C2=A0<a href=3D"https://bitbucket.org/cacaovm/cacao-staging/get/2d6f6c14d=
af9.zip">https://bitbucket.org/cacaovm/cacao-staging/get/2d6f6c14daf9.zip</=
a><br>Resolving <a href=3D"http://bitbucket.org">bitbucket.org</a> (<a href=
=3D"http://bitbucket.org">bitbucket.org</a>)... 2406:da00:ff00::22c5:2ef4, =
2406:da00:ff00::22c3:9b0a, 2406:da00:ff00::22c2:513, ...<br>Connecting to <=
a href=3D"http://bitbucket.org">bitbucket.org</a> (<a href=3D"http://bitbuc=
ket.org">bitbucket.org</a>)|2406:da00:ff00::22c5:2ef4|:443... connected.<br=
>HTTP request sent, awaiting response... 403 Forbidden<br>2020-08-20 10:22:=
52 ERROR 403: Forbidden.</div><div><br></div><div>I guess we need to put th=
e zip somewhere else, and fetch it from there? <br></div><div><br></div><di=
v>Alex<br></div><div><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu, 20 Aug 2020 at 12:10, Richard Leitne=
r &lt;<a href=3D"mailto:richard.leitner@skidata.com">richard.leitner@skidat=
a.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Hi,<br>
thank you for your patch!<br>
<br>
This is a note to let you know that I&#39;ve just added this patch to the<b=
r>
master-next branch of the meta-java repository at<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yoctoproject.org/me=
ta-java" rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/meta-jav=
a</a><br>
<br>
As soon as it has gone through some more testing it will likely be<br>
merged to the master branch.<br>
<br>
If you have any questions, please let me know.<br>
<br>
regards;rl<br>
<br>
On Thu, Aug 13, 2020 at 06:27:56PM +0200, Alexander Kanavin wrote:<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../openjdk/openjdk-8-release-common.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
&gt;=C2=A0 .../2010-Remove-usage-of-sys-sysctl.h.patch=C2=A0 =C2=A0| 39 +++=
++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 40 insertions(+)<br>
&gt;=C2=A0 create mode 100644 recipes-core/openjdk/patches-openjdk-8/2010-R=
emove-usage-of-sys-sysctl.h.patch<br>
&gt; <br>
&gt; diff --git a/recipes-core/openjdk/openjdk-8-release-common.inc b/recip=
es-core/openjdk/openjdk-8-release-common.inc<br>
&gt; index 02210a1..c43fd22 100644<br>
&gt; --- a/recipes-core/openjdk/openjdk-8-release-common.inc<br>
&gt; +++ b/recipes-core/openjdk/openjdk-8-release-common.inc<br>
&gt; @@ -20,6 +20,7 @@ PATCHES_URI =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://2007-jdk-no-genx11-in-headless.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://2008-jdk-no-unused-deps.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://2009-jdk-use-gcc-instead-of-ld-to-link-genS=
ocketOptionRegistry.patch \<br>
&gt; +=C2=A0 =C2=A0 file://2010-Remove-usage-of-sys-sysctl.h.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 HOTSPOT_UB_PATCH =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://1001-hotspot-fix-crash-on-JNI_CreateJavaVM.=
patch \<br>
&gt; diff --git a/recipes-core/openjdk/patches-openjdk-8/2010-Remove-usage-=
of-sys-sysctl.h.patch b/recipes-core/openjdk/patches-openjdk-8/2010-Remove-=
usage-of-sys-sysctl.h.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..f6d7681<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-core/openjdk/patches-openjdk-8/2010-Remove-usage-of-sys-=
sysctl.h.patch<br>
&gt; @@ -0,0 +1,39 @@<br>
&gt; +From 3ed9b4a109cf2f31b97ab8ba317d67886452523c Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +Date: Thu, 13 Aug 2020 17:59:42 +0200<br>
&gt; +Subject: [PATCH] Remove usage of sys/sysctl.h<br>
&gt; +<br>
&gt; +This header has been removed in glibc 2.32, and isn&#39;t used for<br=
>
&gt; +anything.<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c | 1 -<br>
&gt; + jdk/src/solaris/native/java/net/PlainSocketImpl.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
&gt; + 2 files changed, 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.=
c b/jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c<br>
&gt; +index cd15654e..4d8abe03 100644<br>
&gt; +--- a/jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c<br>
&gt; ++++ b/jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c<br>
&gt; +@@ -41,7 +41,6 @@<br>
&gt; + #endif<br>
&gt; + #ifdef __linux__<br>
&gt; + #include &lt;unistd.h&gt;<br>
&gt; +-#include &lt;sys/sysctl.h&gt;<br>
&gt; + #include &lt;sys/utsname.h&gt;<br>
&gt; + #include &lt;netinet/ip.h&gt;<br>
&gt; + <br>
&gt; +diff --git a/jdk/src/solaris/native/java/net/PlainSocketImpl.c b/jdk/=
src/solaris/native/java/net/PlainSocketImpl.c<br>
&gt; +index 170957e7..9aafbc09 100644<br>
&gt; +--- a/jdk/src/solaris/native/java/net/PlainSocketImpl.c<br>
&gt; ++++ b/jdk/src/solaris/native/java/net/PlainSocketImpl.c<br>
&gt; +@@ -43,7 +43,6 @@<br>
&gt; + #endif<br>
&gt; + #ifdef __linux__<br>
&gt; + #include &lt;unistd.h&gt;<br>
&gt; +-#include &lt;sys/sysctl.h&gt;<br>
&gt; + #endif<br>
&gt; + <br>
&gt; + #include &quot;jvm.h&quot;<br>
&gt; -- <br>
&gt; 2.28.0<br>
&gt; <br>
</blockquote></div>

--000000000000f24a4d05ad4c8dd9--
