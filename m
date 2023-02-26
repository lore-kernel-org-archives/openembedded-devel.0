Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726E9C7EE2D
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 22:25:48 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.77030.1677450344989999036
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Feb 2023 14:25:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jwigPA/M;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id bh20so3863182oib.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Feb 2023 14:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0iCsTKpJlIN03zsne+VdTzG67dLZufmK1yR44xztHdQ=;
        b=jwigPA/Md5CH44RNHHXoxgXTH6BEw/zZ6BYN0MRvudXl3g40StjnvCXHGxaf+W9XOl
         ssnL2lV8osbN9TsnQ8YLj7oYaayNzLrlCl4pwAGBiG2FYzvvC9wS02PG+ssOM+ggDNoh
         X9wNrCILWhtBZRX/vncNoPTdrE9FqV4zwIDstByG+ODkG12uL3QSiTJZM0o2Mbaf7Ncq
         cZHHCrPo7K3eTtEaMBIixVw2PgGfCA0qClg5+/AyoiZnh4GgSlspxG7sSWzdibDBoeHo
         bJYX3AFAGwEffsTT6NOmP5vxcKfJbzrfx5zUCa5usvPMVXHWScpDhF1Pu29CGXWwWt4J
         dX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0iCsTKpJlIN03zsne+VdTzG67dLZufmK1yR44xztHdQ=;
        b=hul+FrUbGi1mLRXzky86Z301As7oqEOnKJiUTyX7l+HA7jndJeWKoo8oovkTDNXK00
         FcmaZnuDbu80Fvuvy7tSCfiha8XDgJuzPvpaH42DPrP03ErD7ZBeGgWtSnZGrIX119pn
         ijhWR5x+3xZ01lQSxu6hyjO7/aPAjJS+kR7pZqfa/XjMZT/PjpMEnL/9CCVoZnqEYUpN
         6Nx25P7eIn91fgDFITpOSCadt1qrfkne/iazCgPQ10g0F9aT1J3N3wNTDoYD63O72TB/
         5uujGugeKZfmyr2PqMlpntb77s0WppOMf1P+HKJQ5xuozy74I3Dj3s3wEibYXiQIwZiI
         WaHQ==
X-Gm-Message-State: AO0yUKV9lF12yNcpxMnD+ZssT0UZS4G7XusuhfBdD56SF4B2nRUo1k3c
	b0vQ9/wFn6ndWYnW0f9xTm4bezt3uCUA+QKHHwo=
X-Google-Smtp-Source: AK7set/J4LdlNn5245vBydeDjyb/RiTrcjysutYhCYfSDW1U+BPUZvLWL7c0Ux06LgUOJiXlgJ5KTYWB7X/+SVmWWoY=
X-Received: by 2002:a05:6808:3db:b0:384:2a27:8567 with SMTP id
 o27-20020a05680803db00b003842a278567mr627604oie.2.1677450343926; Sun, 26 Feb
 2023 14:25:43 -0800 (PST)
MIME-Version: 1.0
References: <20230223123239.1727935-1-ross.burton@arm.com> <02b30985-8149-c1a2-e74a-b774628b8d4f@denx.de>
In-Reply-To: <02b30985-8149-c1a2-e74a-b774628b8d4f@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Feb 2023 14:25:33 -0800
Message-ID: <CAMKF1sqSwtEH7q07Yf71n3SFM23Q6HpBBODopJpbfsB1uXJzBQ@mail.gmail.com>
Subject: Re: [oe] [PATCH v3] zchunk: upgrade to 1.2.4
To: Stefano Babic <sbabic@denx.de>
Cc: Ross Burton <ross.burton@arm.com>, nd@arm.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e0cf8105f5a1d7b0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Feb 2023 22:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101258

--000000000000e0cf8105f5a1d7b0
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 26, 2023 at 7:39 AM Stefano Babic <sbabic@denx.de> wrote:

> Hi Ross,
>
> Jonathan released a new version of zchunk 1.3.0, that fixes some huge
> memory consumption on embedded system. What about to skip 1.2.4 and just
> upgrade to 1.3.0 ? Or do you prefer I send a patch after you merged 1.2.4 ?


Send a patch on top of master-next

>
>
> Best regards,
> Stefano
>
> On 23.02.23 13:32, Ross Burton wrote:
> > Add a patch submitted upstream to fix the argp detection with clang.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >   .../recipes-support/zchunk/files/clang.patch  | 35 +++++++++++++++++++
> >   .../recipes-support/zchunk/zchunk_1.2.0.bb    | 22 ------------
> >   .../recipes-support/zchunk/zchunk_1.2.4.bb    | 25 +++++++++++++
> >   3 files changed, 60 insertions(+), 22 deletions(-)
> >   create mode 100644 meta-oe/recipes-support/zchunk/files/clang.patch
> >   delete mode 100644 meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
> >   create mode 100644 meta-oe/recipes-support/zchunk/zchunk_1.2.4.bb
> >
> > diff --git a/meta-oe/recipes-support/zchunk/files/clang.patch
> b/meta-oe/recipes-support/zchunk/files/clang.patch
> > new file mode 100644
> > index 0000000000..86faf4aac7
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/zchunk/files/clang.patch
> > @@ -0,0 +1,35 @@
> > +From e69d907c3fe8765ce50ce1258648ebc8283ef8a7 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Wed, 22 Feb 2023 14:55:07 -0800
> > +Subject: [PATCH] meson: Use global function in argp check
> > +
> > +clang is optimizing away parse_opt() since its marked static and not
> > +used in main(), make life a bit harder for clang :)
> > +removing static now emits the global symbols to be resolved during link
> > +and when libargp is missing the error is thrown rightly
> > +
> > +riscv64-yoe-linux-musl-ld: /tmp/a-5ba039.o: in function `.Lpcrel_hi0':
> > +a.c:(.text+0x44): undefined reference to `argp_state_help'
> > +clang-16: error: linker command failed with exit code 1 (use -v to see
> invocation)
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Submitted [https://github.com/zchunk/zchunk/pull/92/]
> > +Signed-off-by: Ross Burton <ross.burton@arm.com>
> > +---
> > + meson.build | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/meson.build b/meson.build
> > +index 3b92d58..ab54abd 100644
> > +--- a/meson.build
> > ++++ b/meson.build
> > +@@ -57,7 +57,7 @@ if host_machine.system() == 'windows'
> > + endif
> > +
> > + # argp-standalone dependency (if required)
> > +-if build_machine.system() == 'windows' or build_machine.system() ==
> 'darwin' or build_machine.system() == 'freebsd' or not cc.links('#include
> <argp.h>\nstatic error_t parse_opt (int key, char *arg, struct argp_state
> *state) { argp_usage(state); return 0; }; void main() {}')
> > ++if build_machine.system() == 'windows' or build_machine.system() ==
> 'darwin' or build_machine.system() == 'freebsd' or not cc.links('#include
> <argp.h>\nerror_t parse_opt (int key, char *arg, struct argp_state *state)
> { argp_usage(state); return 0; }; void main() {}')
> > +     argplib = cc.find_library('argp', has_headers : ['argp.h'],
> required: false)
> > +     if not argplib.found()
> > +         argplib = dependency('argp-standalone')
> > diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
> b/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
> > deleted file mode 100644
> > index 0baea5032a..0000000000
> > --- a/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
> > +++ /dev/null
> > @@ -1,22 +0,0 @@
> > -DESCRIPTION = "A file format designed for highly efficient deltas while
> maintaining good compression"
> > -AUTHOR = "Jonathan Dieter"
> > -
> > -LICENSE = "BSD-2-Clause"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
> > -
> > -SRC_URI = "git://
> github.com/zchunk/zchunk.git;protocol=https;branch=main"
> > -
> > -SRCREV = "dd6a30a1e4e8b738b0cafc682f3c00e7706134e5"
> > -S = "${WORKDIR}/git"
> > -
> > -DEPENDS = "\
> > -    curl \
> > -    zstd \
> > -    "
> > -
> > -DEPENDS:append:libc-musl = " argp-standalone"
> > -LDFLAGS:append:libc-musl = " -largp"
> > -
> > -inherit meson pkgconfig
> > -
> > -BBCLASSEXTEND = "native nativesdk"
> > diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.2.4.bb
> b/meta-oe/recipes-support/zchunk/zchunk_1.2.4.bb
> > new file mode 100644
> > index 0000000000..b4fd027603
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/zchunk/zchunk_1.2.4.bb
> > @@ -0,0 +1,25 @@
> > +DESCRIPTION = "A file format designed for highly efficient deltas while
> maintaining good compression"
> > +AUTHOR = "Jonathan Dieter"
> > +
> > +LICENSE = "BSD-2-Clause"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
> > +
> > +SRC_URI = "git://
> github.com/zchunk/zchunk.git;protocol=https;branch=main \
> > +           file://clang.patch"
> > +
> > +SRCREV = "0bed8496262a71beadccd4e562bdac093ef6e06f"
> > +S = "${WORKDIR}/git"
> > +
> > +DEPENDS = "zstd"
> > +DEPENDS:append:libc-musl = " argp-standalone"
> > +
> > +inherit meson pkgconfig lib_package
> > +
> > +PACKAGECONFIG ??= "openssl zckdl"
> > +
> > +# zckdl gets packaged into zchunk-bin
> > +PACKAGECONFIG[zckdl] = "-Dwith-curl=enabled,-Dwith-curl=disabled,curl"
> > +# Use OpenSSL primitives for SHA
> > +PACKAGECONFIG[openssl] =
> "-Dwith-openssl=enabled,-Dwith-openssl=disabled,openssl"
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> >
> >
> >
> >
> >
>
> --
> =====================================================================
> DENX Software Engineering GmbH,        Managing Director: Erika Unter
> HRB 165235 Munich,   Office: Kirchenstr.5, 82194 Groebenzell, Germany
> Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
> =====================================================================
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101257):
> https://lists.openembedded.org/g/openembedded-devel/message/101257
> Mute This Topic: https://lists.openembedded.org/mt/97181425/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000e0cf8105f5a1d7b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Feb 26, 2023 at 7:39 AM Stefano Babic &lt;<a href=
=3D"mailto:sbabic@denx.de">sbabic@denx.de</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Hi Ross,<br>
<br>
Jonathan released a new version of zchunk 1.3.0, that fixes some huge <br>
memory consumption on embedded system. What about to skip 1.2.4 and just <b=
r>
upgrade to 1.3.0 ? Or do you prefer I send a patch after you merged 1.2.4 ?=
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Send a patch on =
top of master-next=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><=
br>
<br>
Best regards,<br>
Stefano<br>
<br>
On 23.02.23 13:32, Ross Burton wrote:<br>
&gt; Add a patch submitted upstream to fix the argp detection with clang.<b=
r>
&gt; <br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" =
target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../recipes-support/zchunk/files/clang.patch=C2=A0 | 35 ++=
+++++++++++++++++<br>
&gt;=C2=A0 =C2=A0.../recipes-support/zchunk/<a href=3D"http://zchunk_1.2.0.=
bb" rel=3D"noreferrer" target=3D"_blank">zchunk_1.2.0.bb</a>=C2=A0 =C2=A0 |=
 22 ------------<br>
&gt;=C2=A0 =C2=A0.../recipes-support/zchunk/<a href=3D"http://zchunk_1.2.4.=
bb" rel=3D"noreferrer" target=3D"_blank">zchunk_1.2.4.bb</a>=C2=A0 =C2=A0 |=
 25 +++++++++++++<br>
&gt;=C2=A0 =C2=A03 files changed, 60 insertions(+), 22 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-oe/recipes-support/zchunk/files/cl=
ang.patch<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta-oe/recipes-support/zchunk/<a href=
=3D"http://zchunk_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">zchunk_1.2=
.0.bb</a><br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-oe/recipes-support/zchunk/<a href=
=3D"http://zchunk_1.2.4.bb" rel=3D"noreferrer" target=3D"_blank">zchunk_1.2=
.4.bb</a><br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-support/zchunk/files/clang.patch b/meta-o=
e/recipes-support/zchunk/files/clang.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..86faf4aac7<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/zchunk/files/clang.patch<br>
&gt; @@ -0,0 +1,35 @@<br>
&gt; +From e69d907c3fe8765ce50ce1258648ebc8283ef8a7 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Wed, 22 Feb 2023 14:55:07 -0800<br>
&gt; +Subject: [PATCH] meson: Use global function in argp check<br>
&gt; +<br>
&gt; +clang is optimizing away parse_opt() since its marked static and not<=
br>
&gt; +used in main(), make life a bit harder for clang :)<br>
&gt; +removing static now emits the global symbols to be resolved during li=
nk<br>
&gt; +and when libargp is missing the error is thrown rightly<br>
&gt; +<br>
&gt; +riscv64-yoe-linux-musl-ld: /tmp/a-5ba039.o: in function `.Lpcrel_hi0&=
#39;:<br>
&gt; +a.c:(.text+0x44): undefined reference to `argp_state_help&#39;<br>
&gt; +clang-16: error: linker command failed with exit code 1 (use -v to se=
e invocation)<br>
&gt; +<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Submitted [<a href=3D"https://github.com/zchunk/zchu=
nk/pull/92/" rel=3D"noreferrer" target=3D"_blank">https://github.com/zchunk=
/zchunk/pull/92/</a>]<br>
&gt; +Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com"=
 target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; +---<br>
&gt; + meson.build | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/meson.build b/meson.build<br>
&gt; +index 3b92d58..ab54abd 100644<br>
&gt; +--- a/meson.build<br>
&gt; ++++ b/meson.build<br>
&gt; +@@ -57,7 +57,7 @@ if host_machine.system() =3D=3D &#39;windows&#39;<b=
r>
&gt; + endif<br>
&gt; +<br>
&gt; + # argp-standalone dependency (if required)<br>
&gt; +-if build_machine.system() =3D=3D &#39;windows&#39; or build_machine.=
system() =3D=3D &#39;darwin&#39; or build_machine.system() =3D=3D &#39;free=
bsd&#39; or not cc.links(&#39;#include &lt;argp.h&gt;\nstatic error_t parse=
_opt (int key, char *arg, struct argp_state *state) { argp_usage(state); re=
turn 0; }; void main() {}&#39;)<br>
&gt; ++if build_machine.system() =3D=3D &#39;windows&#39; or build_machine.=
system() =3D=3D &#39;darwin&#39; or build_machine.system() =3D=3D &#39;free=
bsd&#39; or not cc.links(&#39;#include &lt;argp.h&gt;\nerror_t parse_opt (i=
nt key, char *arg, struct argp_state *state) { argp_usage(state); return 0;=
 }; void main() {}&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0argplib =3D cc.find_library(&#39;argp&#39;, has_h=
eaders : [&#39;argp.h&#39;], required: false)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if not argplib.found()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argplib =3D dependency(&#39;argp-st=
andalone&#39;)<br>
&gt; diff --git a/meta-oe/recipes-support/zchunk/<a href=3D"http://zchunk_1=
.2.0.bb" rel=3D"noreferrer" target=3D"_blank">zchunk_1.2.0.bb</a> b/meta-oe=
/recipes-support/zchunk/<a href=3D"http://zchunk_1.2.0.bb" rel=3D"noreferre=
r" target=3D"_blank">zchunk_1.2.0.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 0baea5032a..0000000000<br>
&gt; --- a/meta-oe/recipes-support/zchunk/<a href=3D"http://zchunk_1.2.0.bb=
" rel=3D"noreferrer" target=3D"_blank">zchunk_1.2.0.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,22 +0,0 @@<br>
&gt; -DESCRIPTION =3D &quot;A file format designed for highly efficient del=
tas while maintaining good compression&quot;<br>
&gt; -AUTHOR =3D &quot;Jonathan Dieter&quot;<br>
&gt; -<br>
&gt; -LICENSE =3D &quot;BSD-2-Clause&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Ddaf6e68539f564601a5a5=
869c31e5242&quot;<br>
&gt; -<br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/zchunk/zchunk.gi=
t;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/zchunk/zchunk.git;protocol=3Dhttps;branch=3Dmain</a>&quot;<br>
&gt; -<br>
&gt; -SRCREV =3D &quot;dd6a30a1e4e8b738b0cafc682f3c00e7706134e5&quot;<br>
&gt; -S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; -<br>
&gt; -DEPENDS =3D &quot;\<br>
&gt; -=C2=A0 =C2=A0 curl \<br>
&gt; -=C2=A0 =C2=A0 zstd \<br>
&gt; -=C2=A0 =C2=A0 &quot;<br>
&gt; -<br>
&gt; -DEPENDS:append:libc-musl =3D &quot; argp-standalone&quot;<br>
&gt; -LDFLAGS:append:libc-musl =3D &quot; -largp&quot;<br>
&gt; -<br>
&gt; -inherit meson pkgconfig<br>
&gt; -<br>
&gt; -BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; diff --git a/meta-oe/recipes-support/zchunk/<a href=3D"http://zchunk_1=
.2.4.bb" rel=3D"noreferrer" target=3D"_blank">zchunk_1.2.4.bb</a> b/meta-oe=
/recipes-support/zchunk/<a href=3D"http://zchunk_1.2.4.bb" rel=3D"noreferre=
r" target=3D"_blank">zchunk_1.2.4.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..b4fd027603<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/zchunk/<a href=3D"http://zchunk_1.2.4.bb=
" rel=3D"noreferrer" target=3D"_blank">zchunk_1.2.4.bb</a><br>
&gt; @@ -0,0 +1,25 @@<br>
&gt; +DESCRIPTION =3D &quot;A file format designed for highly efficient del=
tas while maintaining good compression&quot;<br>
&gt; +AUTHOR =3D &quot;Jonathan Dieter&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;BSD-2-Clause&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Ddaf6e68539f564601a5a5=
869c31e5242&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/zchunk/zchunk.gi=
t;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/zchunk/zchunk.git;protocol=3Dhttps;branch=3Dmain</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://clang.patch&quot;<br>
&gt; +<br>
&gt; +SRCREV =3D &quot;0bed8496262a71beadccd4e562bdac093ef6e06f&quot;<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +DEPENDS =3D &quot;zstd&quot;<br>
&gt; +DEPENDS:append:libc-musl =3D &quot; argp-standalone&quot;<br>
&gt; +<br>
&gt; +inherit meson pkgconfig lib_package<br>
&gt; +<br>
&gt; +PACKAGECONFIG ??=3D &quot;openssl zckdl&quot;<br>
&gt; +<br>
&gt; +# zckdl gets packaged into zchunk-bin<br>
&gt; +PACKAGECONFIG[zckdl] =3D &quot;-Dwith-curl=3Denabled,-Dwith-curl=3Ddi=
sabled,curl&quot;<br>
&gt; +# Use OpenSSL primitives for SHA<br>
&gt; +PACKAGECONFIG[openssl] =3D &quot;-Dwith-openssl=3Denabled,-Dwith-open=
ssl=3Ddisabled,openssl&quot;<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
-- <br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
DENX Software Engineering GmbH,=C2=A0 =C2=A0 =C2=A0 =C2=A0 Managing Directo=
r: Erika Unter<br>
HRB 165235 Munich,=C2=A0 =C2=A0Office: Kirchenstr.5, 82194 Groebenzell, Ger=
many<br>
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: <a href=3D"mailto:sb=
abic@denx.de" target=3D"_blank">sbabic@denx.de</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#101257): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/101257" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/101257</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97181425/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97181425/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000e0cf8105f5a1d7b0--

