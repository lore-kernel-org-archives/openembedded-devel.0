Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web11.2294.1616199920378201278
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Mar 2021 17:25:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FH1hjgew;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: koncept1@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id l13so4412265vst.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Mar 2021 17:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rjPjlr1yBXlSVztivQovBkWdjs9qdV514mrrHVnnWxQ=;
        b=FH1hjgewnf/r5Q8bUg8lEs49TgsDUK0e9SxSwGoGziawuEmkxnhissoXSpI6GpBfx5
         9B+tOw00BKK2dm0JjHSVccKfJNhtOIdiSSQiIgOun7gdKBE64FjI6xA6fBNHiEb4Bc5r
         PsqwZDAQY4k3qOUu+JI2J1tu+V2EwtNvQYkCOiCaW+rPCletliQDB74ABUFzs/KIl/NP
         aEQvHYBle+MDYUK4un/CfnTIdS6DFP/gcl5ZkpnrOdf8pdJMN7k7/kzq9UaMFf19EKEp
         oOkA3VFbWNZf3XYsbthh/5dqMvcD6mX9elpzQ7/Xbdks8SwP5QuaGhNSoqDZppl8Xfrt
         G+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rjPjlr1yBXlSVztivQovBkWdjs9qdV514mrrHVnnWxQ=;
        b=ODWUMj2sA4+aL5vMw/xeOr1FZ6Q5uD+klVPaCcXXR6HhWpHqmaASqDfIWXyYMinPW0
         bbjAUwvoVzvLHx5K3zJaBmjTJ+TlcMuimLQba0E+Jc9B2cndNeRo73d7+fOGKzb35n9/
         vC8lDUMBRoiOM3xpsyjR+HCdK/qHfgawTORllOAMj+ia2ojeHXWM/bxNbavwLAwzz1AK
         Ud/C9asJI0J778jai8KJanJjXDrZ8gfouBAQBwS7DjhH8eCjFfVo27+cSCEUjijMOj/y
         ZkewmxGz0p5CaEAUrqPZEc8nAA5HSPgWegpl50poB88XIll/rkZti7/ksnf5mh9Lk9g0
         oU4Q==
X-Gm-Message-State: AOAM530KebmuJQ0+iOK71qu/97SJoKIlBsE0/a77jyZjdUDsZlLi2uUp
	FypDpY4qpw8g7tY9nnpNpV4w3djgjNwNAHqyrYM=
X-Google-Smtp-Source: ABdhPJwPZIU0GYxI+yj/CDCXgej9N+ZLItZI+nDj5iv73y66VfuOaoyqqn0LcIPPhkV28tiBQ2nfGd6QnlUUBV0bPZw=
X-Received: by 2002:a67:e947:: with SMTP id p7mr4490654vso.59.1616199919367;
 Fri, 19 Mar 2021 17:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAKx8PBi4bXBoV_rfXfEPGwa4k52rONdG=s1kBat23+EH47aXXw@mail.gmail.com>
 <CAMKF1soa2R_5NnvP1KJm3bTVuaJK9dHNdmvmCg=M4=-ECA72CA@mail.gmail.com>
In-Reply-To: <CAMKF1soa2R_5NnvP1KJm3bTVuaJK9dHNdmvmCg=M4=-ECA72CA@mail.gmail.com>
From: "Ben Magistro" <koncept1@gmail.com>
Date: Fri, 19 Mar 2021 20:25:08 -0400
Message-ID: <CAKx8PBi1daYsakqxiPWf0wH7o9jdgVMyvu-aeUtKF=BspVihRg@mail.gmail.com>
Subject: [dunfell][meta-oe][patch] Backport openocd changes to dunfell
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, akuster808@gmail.com
Content-Type: multipart/alternative; boundary="000000000000147aa705bdecdeb6"

--000000000000147aa705bdecdeb6
Content-Type: text/plain; charset="UTF-8"

A patch exists in the initial email, cc'ing Armin.

On Thu, Mar 18, 2021 at 9:02 PM Khem Raj <raj.khem@gmail.com> wrote:

> please send a patch for dunfell backport as needed and CC Armin
>
> On Thu, Mar 18, 2021 at 5:35 PM Ben Magistro <koncept1@gmail.com> wrote:
> >
> > While porting another project to Dunfell, I found it necessary to update
> openocd.  The changes have already been applied to master.
> >
> >
> > See:
> >  *
> https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg70813.html
> >  *
> http://git.openembedded.org/meta-openembedded/commit/?id=0a27b0840f57d64cab091c9a0681582832d72c2d
> >  *
> http://git.openembedded.org/meta-openembedded/commit/?id=64bc3a36e4a36f16596c2f6e83998c8dccd717a6
> >
> >
> > I believe the patch below incorporates all of the relevant changes from
> the above commits to a single patch:
> > ```
> > diff --git
> a/meta-oe/recipes-devtools/openocd/openocd/0001-Do-not-include-syscrtl.h-with-glibc.patch
> b/meta-oe/recipes-devtools/openocd/openocd/0001-Do-not-include-syscrtl.h-with-glibc.patch
> > deleted file mode 100644
> > index 618ce2689..000000000
> > ---
> a/meta-oe/recipes-devtools/openocd/openocd/0001-Do-not-include-syscrtl.h-with-glibc.patch
> > +++ /dev/null
> > @@ -1,33 +0,0 @@
> > -From a763610719e7d7f6cdc45569b6fbfdb91bb7c87b Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Sat, 27 Jul 2019 14:30:08 -0700
> > -Subject: [PATCH] Do not include syscrtl.h with glibc
> > -
> > -glibc 2.30 has deprecated it see [1]
> > -Fixes
> > -sys/sysctl.h:21:2: error: "The <sys/sysctl.h> header is deprecated and
> will be removed." [-Werror,-W#warnings]
> > -
> > -[1]
> https://sourceware.org/git/?p=glibc.git;a=commit;h=744e829637162bb7d5029632aacf341c64b86990
> > -
> > -Upstream-Status: Pending
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - src/helper/options.c | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/src/helper/options.c b/src/helper/options.c
> > -index 12755e010..4007e37f6 100644
> > ---- a/src/helper/options.c
> > -+++ b/src/helper/options.c
> > -@@ -34,7 +34,7 @@
> > - #if IS_DARWIN
> > - #include <libproc.h>
> > - #endif
> > --#ifdef HAVE_SYS_SYSCTL_H
> > -+#if defined(HAVE_SYS_SYSCTL_H) && !defined(__GLIBC__)
> > - #include <sys/sysctl.h>
> > - #endif
> > - #if IS_WIN32 && !IS_CYGWIN
> > ---
> > -2.22.0
> > -
> > diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb
> b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> > index e95f1cfa5..05e06a25d 100644
> > --- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
> > +++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> > @@ -9,14 +9,13 @@ SRC_URI = " \
> >      git://
> repo.or.cz/r/git2cl.git;protocol=http;destsuffix=tools/git2cl;name=git2cl
> \
> >      git://
> repo.or.cz/r/jimtcl.git;protocol=http;destsuffix=git/jimtcl;name=jimtcl \
> >      git://
> repo.or.cz/r/libjaylink.git;protocol=http;destsuffix=git/src/jtag/drivers/libjaylink;name=libjaylink
> \
> > -    file://0001-Do-not-include-syscrtl.h-with-glibc.patch \
> >  "
> >
> >  SRCREV_FORMAT = "openocd"
> > -SRCREV_openocd = "ded67990255cc1e63c77832ffd6e6bef9120873d"
> > +SRCREV_openocd = "d46f28c2ea2611f5fbbc679a5eed253d3dcd2fe3"
> >  SRCREV_git2cl = "8373c9f74993e218a08819cbcdbab3f3564bbeba"
> > -SRCREV_jimtcl = "dc4ba7770d580800634f90b67a24e077b4a26d98"
> > -SRCREV_libjaylink = "cfccbc9d6763733f1d14dff3c2dc5b75aaef136b"
> > +SRCREV_jimtcl = "0aa0fb4e3a38d38a49de9eb585d93d63a370dcf6"
> > +SRCREV_libjaylink = "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"
> >
> >  PV = "0.10+gitr${SRCPV}"
> >  S = "${WORKDIR}/git"
> > @@ -55,3 +54,6 @@ FILES_${PN} = " \
> >  PACKAGECONFIG[sysfsgpio] = "--enable-sysfsgpio,--disable-sysfsgpio"
> >  PACKAGECONFIG[remote-bitbang] =
> "--enable-remote-bitbang,--disable-remote-bitbang"
> >  PACKAGECONFIG ??= "sysfsgpio remote-bitbang"
> > +
> > +# Can't be built with ccache
> > +CCACHE_DISABLE = "1"
> > ```
> >
> >
> > 
> >
>

--000000000000147aa705bdecdeb6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>A patch exists in the initial email, cc&#39;ing Armin=
.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Thu, Mar 18, 2021 at 9:02 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">please send a patch for dunfell backport as need=
ed and CC Armin<br>
<br>
On Thu, Mar 18, 2021 at 5:35 PM Ben Magistro &lt;<a href=3D"mailto:koncept=
1@gmail.com" target=3D"_blank">koncept1@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; While porting another project to Dunfell, I found it necessary to upd=
ate openocd.=C2=A0 The changes have already been applied to master.<br>
&gt;<br>
&gt;<br>
&gt; See:<br>
&gt;=C2=A0 * <a href=3D"https://www.mail-archive.com/openembedded-devel@li=
sts.openembedded.org/msg70813.html" rel=3D"noreferrer" target=3D"_blank">ht=
tps://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg708=
13.html</a><br>
&gt;=C2=A0 * <a href=3D"http://git.openembedded.org/meta-openembedded/comm=
it/?id=3D0a27b0840f57d64cab091c9a0681582832d72c2d" rel=3D"noreferrer" targe=
t=3D"_blank">http://git.openembedded.org/meta-openembedded/commit/?id=3D0a2=
7b0840f57d64cab091c9a0681582832d72c2d</a><br>
&gt;=C2=A0 * <a href=3D"http://git.openembedded.org/meta-openembedded/comm=
it/?id=3D64bc3a36e4a36f16596c2f6e83998c8dccd717a6" rel=3D"noreferrer" targe=
t=3D"_blank">http://git.openembedded.org/meta-openembedded/commit/?id=3D64b=
c3a36e4a36f16596c2f6e83998c8dccd717a6</a><br>
&gt;<br>
&gt;<br>
&gt; I believe the patch below incorporates all of the relevant changes fr=
om the above commits to a single patch:<br>
&gt; ```<br>
&gt; diff --git a/meta-oe/recipes-devtools/openocd/openocd/0001-Do-not-inc=
lude-syscrtl.h-with-glibc.patch b/meta-oe/recipes-devtools/openocd/openocd/=
0001-Do-not-include-syscrtl.h-with-glibc.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 618ce2689..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/openocd/openocd/0001-Do-not-include-sy=
scrtl.h-with-glibc.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,33 +0,0 @@<br>
&gt; -From a763610719e7d7f6cdc45569b6fbfdb91bb7c87b Mon Sep 17 00:00:00 20=
01<br>
&gt; -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_=
blank">raj.khem@gmail.com</a>&gt;<br>
&gt; -Date: Sat, 27 Jul 2019 14:30:08 -0700<br>
&gt; -Subject: [PATCH] Do not include syscrtl.h with glibc<br>
&gt; -<br>
&gt; -glibc 2.30 has deprecated it see [1]<br>
&gt; -Fixes<br>
&gt; -sys/sysctl.h:21:2: error: &quot;The &lt;sys/sysctl.h&gt; header is d=
eprecated and will be removed.&quot; [-Werror,-W#warnings]<br>
&gt; -<br>
&gt; -[1] <a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;=
h=3D744e829637162bb7d5029632aacf341c64b86990" rel=3D"noreferrer" target=3D"=
_blank">https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D744e829637=
162bb7d5029632aacf341c64b86990</a><br>
&gt; -<br>
&gt; -Upstream-Status: Pending<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - src/helper/options.c | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/src/helper/options.c b/src/helper/options.c<br>
&gt; -index 12755e010..4007e37f6 100644<br>
&gt; ---- a/src/helper/options.c<br>
&gt; -+++ b/src/helper/options.c<br>
&gt; -@@ -34,7 +34,7 @@<br>
&gt; - #if IS_DARWIN<br>
&gt; - #include &lt;libproc.h&gt;<br>
&gt; - #endif<br>
&gt; --#ifdef HAVE_SYS_SYSCTL_H<br>
&gt; -+#if defined(HAVE_SYS_SYSCTL_H) &amp;&amp; !defined(__GLIBC__)<br>
&gt; - #include &lt;sys/sysctl.h&gt;<br>
&gt; - #endif<br>
&gt; - #if IS_WIN32 &amp;&amp; !IS_CYGWIN<br>
&gt; ---<br>
&gt; -2.22.0<br>
&gt; -<br>
&gt; diff --git a/meta-oe/recipes-devtools/openocd/<a href=3D"http://openo=
cd_git.bb" rel=3D"noreferrer" target=3D"_blank">openocd_git.bb</a> b/meta-o=
e/recipes-devtools/openocd/<a href=3D"http://openocd_git.bb" rel=3D"norefer=
rer" target=3D"_blank">openocd_git.bb</a><br>
&gt; index e95f1cfa5..05e06a25d 100644<br>
&gt; --- a/meta-oe/recipes-devtools/openocd/<a href=3D"http://openocd_git.=
bb" rel=3D"noreferrer" target=3D"_blank">openocd_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-devtools/openocd/<a href=3D"http://openocd_git.=
bb" rel=3D"noreferrer" target=3D"_blank">openocd_git.bb</a><br>
&gt; @@ -9,14 +9,13 @@ SRC_URI =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://repo.or.cz/r/git2cl.git;p=
rotocol=3Dhttp;destsuffix=3Dtools/git2cl;name=3Dgit2cl" rel=3D"noreferrer" =
target=3D"_blank">repo.or.cz/r/git2cl.git;protocol=3Dhttp;destsuffix=3Dtool=
s/git2cl;name=3Dgit2cl</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://repo.or.cz/r/jimtcl.git;p=
rotocol=3Dhttp;destsuffix=3Dgit/jimtcl;name=3Djimtcl" rel=3D"noreferrer" ta=
rget=3D"_blank">repo.or.cz/r/jimtcl.git;protocol=3Dhttp;destsuffix=3Dgit/ji=
mtcl;name=3Djimtcl</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://repo.or.cz/r/libjaylink.g=
it;protocol=3Dhttp;destsuffix=3Dgit/src/jtag/drivers/libjaylink;name=3Dlibj=
aylink" rel=3D"noreferrer" target=3D"_blank">repo.or.cz/r/libjaylink.git;pr=
otocol=3Dhttp;destsuffix=3Dgit/src/jtag/drivers/libjaylink;name=3Dlibjaylin=
k</a> \<br>
&gt; -=C2=A0 =C2=A0 file://0001-Do-not-include-syscrtl.h-with-glibc.patch =
\<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV_FORMAT =3D &quot;openocd&quot;<br>
&gt; -SRCREV_openocd =3D &quot;ded67990255cc1e63c77832ffd6e6bef9120873d&qu=
ot;<br>
&gt; +SRCREV_openocd =3D &quot;d46f28c2ea2611f5fbbc679a5eed253d3dcd2fe3&qu=
ot;<br>
&gt;=C2=A0 SRCREV_git2cl =3D &quot;8373c9f74993e218a08819cbcdbab3f3564bbeb=
a&quot;<br>
&gt; -SRCREV_jimtcl =3D &quot;dc4ba7770d580800634f90b67a24e077b4a26d98&quo=
t;<br>
&gt; -SRCREV_libjaylink =3D &quot;cfccbc9d6763733f1d14dff3c2dc5b75aaef136b=
&quot;<br>
&gt; +SRCREV_jimtcl =3D &quot;0aa0fb4e3a38d38a49de9eb585d93d63a370dcf6&quo=
t;<br>
&gt; +SRCREV_libjaylink =3D &quot;9aa7a5957c07bb6e862fc1a6d3153d109c7407e4=
&quot;<br>
&gt;<br>
&gt;=C2=A0 PV =3D &quot;0.10+gitr${SRCPV}&quot;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; @@ -55,3 +54,6 @@ FILES_${PN} =3D &quot; \<br>
&gt;=C2=A0 PACKAGECONFIG[sysfsgpio] =3D &quot;--enable-sysfsgpio,--disable=
-sysfsgpio&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[remote-bitbang] =3D &quot;--enable-remote-bitbang=
,--disable-remote-bitbang&quot;<br>
&gt;=C2=A0 PACKAGECONFIG ??=3D &quot;sysfsgpio remote-bitbang&quot;<br>
&gt; +<br>
&gt; +# Can&#39;t be built with ccache<br>
&gt; +CCACHE_DISABLE =3D &quot;1&quot;<br>
&gt; ```<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div></div>

--000000000000147aa705bdecdeb6--
