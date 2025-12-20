Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B473E67483
	for <webhook@archiver.kernel.org>; Sat, 20 Dec 2025 19:40:59 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45908.1766259657766556049
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Dec 2025 11:40:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D6FieaM2;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64472c71fc0so2403941d50.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Dec 2025 11:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766259657; x=1766864457; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoB3h0xC6xGTRA/MxL/0zFekuGJDKKh9Imw5ER5ocDg=;
        b=D6FieaM2XCbcpBc9wuzMCYfloxFZPYFL4iuqhJ3fDBpiS0k2QAIZ5XjnxwmCdfXfMj
         29XTyxKzZo3EYeC5T1wS2sWknO+6ptpLKaU18y8eoC1F/PFnAXZLGLkA5BGBdSi645GT
         MQgKNQlFoT8tlBf6zbZEr4enO01Kr18Yd6LIVj8CWHrhGGtQsNUUBUL9WQvjivGztzgf
         dzKU39oss3Nao2fNsckJiO2OoKiGTzZotDjKbyDMXhCev7pxagCoWOkTghq9qOje/pMZ
         jHmycgcYtT21ZltlnLwVFxH9EvdJvNOsBst8Q1Q3kf3wOzz4RohhC+LBLWbouq6W9uVn
         mrWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766259657; x=1766864457;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZoB3h0xC6xGTRA/MxL/0zFekuGJDKKh9Imw5ER5ocDg=;
        b=c3H4ILhUv5lT0aL+BGZhCNnVizPyYipeAxTk5lK7JxVkcyO2kW/+UtjaKV/3N3HaHL
         blfjDSY1vdEjJ4AqJUo7P0CJt127zuscSFKsBzSLlpvTj1LAHX6vS9S9WEvxnoVycdX2
         HaYfxgkJa1RD3ImaJqMpURXgWSIJHClAFY2BPjRHvinwPR6KZnYuC80QeOWFdlGa2fse
         0nvQ3mh/UZHTBwxUyUSBK/60baSMD7QNvUCwr8khtCe8ZlKHk+sZnVouLofP2+iUCwmj
         JarHTp8lfbeu6SoFwoflYgvxRw4WvLCX2Z1D0RDcw0QLv80g/wSlHtBsl3GsAYhNKwiP
         EImQ==
X-Gm-Message-State: AOJu0Yx7PA3iYWpsaqQJCqsHg9m1av1jyqzARHdq9dDocDiT/HYxRb9n
	ClCJqieSW8Kw3BltCtFJJ8fsFakRRrqm3x5LblpSmgdU341ER1+fEnWHF18Zt5ASY1MCcjDfFY5
	cGxu3n6HFSyQ6ENfO9epingXxjSWGJkw=
X-Gm-Gg: AY/fxX6b1jd+APuLKQ4v1XepK08nNAxp+sHaTpEjXwLB7itMOADK1kBP88FFDKieJrF
	Cz1F/dyhYJNOzAEb/AsMjElundADiQME2bgbEjiTOJ9Cyyscu5KYCPMdcTrFo1ASqa+NT17b7lE
	Ce9eKz2xjNy1j+Z73DubiqZB29nJeDp8CBbeBjIZFJB5P2TgnaNw90NGpOxSr4p9mhnK7Or5Qm9
	y9XkdQ3VGhX5SLd41M+MctrUJJVw6QY7IFzA5PprouQFiNQiLZ8/m1IL94VMJfcVbadqTefacxs
	BRgrlIlEptIR+RVC3ex2slra5K2DwEIvGIqb+0KMMw6KmzZzQf6769N05hkuNw466errMPzyBox
	qpGXD92VJyCwGNvX3e3B0mSexIoHH7nykdoyqOD/zOesleFDKdk43FgQo
X-Google-Smtp-Source: AGHT+IG5utR7eXXq5v2SS3+qfxtwubMZUtXzgbzLZGnnDKbsY/w7GciK6Q0ZJKh2/Wh+xw9oVLXog7EaX69YaTQ9swM=
X-Received: by 2002:a53:e313:0:b0:640:d255:2d6f with SMTP id
 956f58d0204a3-6466a84535amr4208321d50.34.1766259656694; Sat, 20 Dec 2025
 11:40:56 -0800 (PST)
MIME-Version: 1.0
References: <20251216135054.2467586-1-skandigraun@gmail.com>
In-Reply-To: <20251216135054.2467586-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Dec 2025 11:40:30 -0800
X-Gm-Features: AQt7F2rYUp64b6M6UHy58zTDjikIsfTItCM6kxGpnOt8ANjV15QVlMUC2Vo9TJA
Message-ID: <CAMKF1soaJ_AiY_OZ8tg8LVeXPEAgjgTiQgtjP6De8ngFSPLxkg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] dovecot: upgrade 2.4.1-4 -> 2.4.2
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006b20e00646675f3a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Dec 2025 19:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122778

--0000000000006b20e00646675f3a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fails to build with latest master branch of oe-core

https://termbin.com/z4a9



On Tue, Dec 16, 2025 at 5:50=E2=80=AFAM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> Contains fix for CVE-2025-30189
>
> Changelog: https://github.com/dovecot/core/releases/tag/2.4.2
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../dovecot/fix-musl-compilation.patch        | 28 -------------------
>  .../{dovecot_2.4.1-4.bb =3D> dovecot_2.4.2.bb}  |  3 +-
>  2 files changed, 1 insertion(+), 30 deletions(-)
>  delete mode 100644
> meta-networking/recipes-support/dovecot/dovecot/fix-musl-compilation.patc=
h
>  rename meta-networking/recipes-support/dovecot/{dovecot_2.4.1-4.bb =3D>
> dovecot_2.4.2.bb} (96%)
>
> diff --git
> a/meta-networking/recipes-support/dovecot/dovecot/fix-musl-compilation.pa=
tch
> b/meta-networking/recipes-support/dovecot/dovecot/fix-musl-compilation.pa=
tch
> deleted file mode 100644
> index a09165e588..0000000000
> ---
> a/meta-networking/recipes-support/dovecot/dovecot/fix-musl-compilation.pa=
tch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 951e371b6e44e2051de83c9fe73c778858fa73a1 Mon Sep 17 00:00:00 2001
> -From: Fabian Groffen <grobian@gentoo.org>
> -Date: Sat, 31 May 2025 10:49:28 +0200
> -Subject: [PATCH] lib: cpu-count - fix compilation using musl
> -
> -The macros, types and symbols CPU_* and cpuset_t are not exposed in
> -musl's sched.h unless _GNU_SOURCE is set.
> -
> -Upstream-Status: Backport [
> https://github.com/dovecot/core/commit/951e371b6e44e2051de83c9fe73c778858=
fa73a1
> ]
> -
> -Signed-off-by: Fabian Groffen <grobian@gentoo.org>
> ----
> - src/lib/cpu-count.c | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/src/lib/cpu-count.c b/src/lib/cpu-count.c
> -index 3eb38fa47d8..a3e80e6c157 100644
> ---- a/src/lib/cpu-count.c
> -+++ b/src/lib/cpu-count.c
> -@@ -3,6 +3,8 @@
> -
> - #ifdef HAVE_SCHED_H
> - #  define __USE_GNU
> -+/* _GNU_SOURCE: for musl's sched.h to expose cpuset/CPU_* */
> -+#  define _GNU_SOURCE
> - #  include <sched.h>
> - #  ifdef HAVE_SYS_CPUSET_H
> - #    include <sys/cpuset.h>
> diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
> b/meta-networking/recipes-support/dovecot/dovecot_2.4.2.bb
> similarity index 96%
> rename from meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
> rename to meta-networking/recipes-support/dovecot/dovecot_2.4.2.bb
> index 40cf991ae1..4632d9574f 100644
> --- a/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
> +++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.2.bb
> @@ -14,9 +14,8 @@ SRC_URI =3D "
> http://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz \
>             file://dovecot.service \
>             file://dovecot.socket \
>
> file://0001-m4-Check-for-libunwind-instead-of-libunwind-generic.patch \
> -           file://fix-musl-compilation.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "fb188603f419ed7aaa07794a8692098c3ec2660bb9c67d0efe24948cbb32ae00"
> +SRC_URI[sha256sum] =3D
> "2cd62e4d22b9fc1c80bd38649739950f0dbda34fbc3e62624fb6842264e93c6e"
>
>  DEPENDS =3D "openssl xz zlib bzip2 libcap icu libtirpc bison-native"
>  CFLAGS +=3D "-I${STAGING_INCDIR}/tirpc"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122696):
> https://lists.openembedded.org/g/openembedded-devel/message/122696
> Mute This Topic: https://lists.openembedded.org/mt/116809504/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006b20e00646675f3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>fails to build with latest=C2=A0master branch of oe-c=
ore</div><div><br></div><div><a href=3D"https://termbin.com/z4a9">https://t=
ermbin.com/z4a9</a></div><div><br></div><div><br></div><br><div class=3D"gm=
ail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On T=
ue, Dec 16, 2025 at 5:50=E2=80=AFAM Gyorgy Sarvari via <a href=3D"http://li=
sts.openembedded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a href=
=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Contains fix for CVE-2025-30189<br>
<br>
Changelog: <a href=3D"https://github.com/dovecot/core/releases/tag/2.4.2" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/dovecot/core/release=
s/tag/2.4.2</a><br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../dovecot/fix-musl-compilation.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=
8 -------------------<br>
=C2=A0.../{<a href=3D"http://dovecot_2.4.1-4.bb" rel=3D"noreferrer" target=
=3D"_blank">dovecot_2.4.1-4.bb</a> =3D&gt; <a href=3D"http://dovecot_2.4.2.=
bb" rel=3D"noreferrer" target=3D"_blank">dovecot_2.4.2.bb</a>}=C2=A0 |=C2=
=A0 3 +-<br>
=C2=A02 files changed, 1 insertion(+), 30 deletions(-)<br>
=C2=A0delete mode 100644 meta-networking/recipes-support/dovecot/dovecot/fi=
x-musl-compilation.patch<br>
=C2=A0rename meta-networking/recipes-support/dovecot/{<a href=3D"http://dov=
ecot_2.4.1-4.bb" rel=3D"noreferrer" target=3D"_blank">dovecot_2.4.1-4.bb</a=
> =3D&gt; <a href=3D"http://dovecot_2.4.2.bb" rel=3D"noreferrer" target=3D"=
_blank">dovecot_2.4.2.bb</a>} (96%)<br>
<br>
diff --git a/meta-networking/recipes-support/dovecot/dovecot/fix-musl-compi=
lation.patch b/meta-networking/recipes-support/dovecot/dovecot/fix-musl-com=
pilation.patch<br>
deleted file mode 100644<br>
index a09165e588..0000000000<br>
--- a/meta-networking/recipes-support/dovecot/dovecot/fix-musl-compilation.=
patch<br>
+++ /dev/null<br>
@@ -1,28 +0,0 @@<br>
-From 951e371b6e44e2051de83c9fe73c778858fa73a1 Mon Sep 17 00:00:00 2001<br>
-From: Fabian Groffen &lt;<a href=3D"mailto:grobian@gentoo.org" target=3D"_=
blank">grobian@gentoo.org</a>&gt;<br>
-Date: Sat, 31 May 2025 10:49:28 +0200<br>
-Subject: [PATCH] lib: cpu-count - fix compilation using musl<br>
-<br>
-The macros, types and symbols CPU_* and cpuset_t are not exposed in<br>
-musl&#39;s sched.h unless _GNU_SOURCE is set.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/dovecot/core/comm=
it/951e371b6e44e2051de83c9fe73c778858fa73a1" rel=3D"noreferrer" target=3D"_=
blank">https://github.com/dovecot/core/commit/951e371b6e44e2051de83c9fe73c7=
78858fa73a1</a>]<br>
-<br>
-Signed-off-by: Fabian Groffen &lt;<a href=3D"mailto:grobian@gentoo.org" ta=
rget=3D"_blank">grobian@gentoo.org</a>&gt;<br>
----<br>
- src/lib/cpu-count.c | 2 ++<br>
- 1 file changed, 2 insertions(+)<br>
-<br>
-diff --git a/src/lib/cpu-count.c b/src/lib/cpu-count.c<br>
-index 3eb38fa47d8..a3e80e6c157 100644<br>
---- a/src/lib/cpu-count.c<br>
-+++ b/src/lib/cpu-count.c<br>
-@@ -3,6 +3,8 @@<br>
- <br>
- #ifdef HAVE_SCHED_H<br>
- #=C2=A0 define __USE_GNU<br>
-+/* _GNU_SOURCE: for musl&#39;s sched.h to expose cpuset/CPU_* */<br>
-+#=C2=A0 define _GNU_SOURCE<br>
- #=C2=A0 include &lt;sched.h&gt;<br>
- #=C2=A0 ifdef HAVE_SYS_CPUSET_H<br>
- #=C2=A0 =C2=A0 include &lt;sys/cpuset.h&gt;<br>
diff --git a/meta-networking/recipes-support/dovecot/<a href=3D"http://dove=
cot_2.4.1-4.bb" rel=3D"noreferrer" target=3D"_blank">dovecot_2.4.1-4.bb</a>=
 b/meta-networking/recipes-support/dovecot/<a href=3D"http://dovecot_2.4.2.=
bb" rel=3D"noreferrer" target=3D"_blank">dovecot_2.4.2.bb</a><br>
similarity index 96%<br>
rename from meta-networking/recipes-support/dovecot/<a href=3D"http://dovec=
ot_2.4.1-4.bb" rel=3D"noreferrer" target=3D"_blank">dovecot_2.4.1-4.bb</a><=
br>
rename to meta-networking/recipes-support/dovecot/<a href=3D"http://dovecot=
_2.4.2.bb" rel=3D"noreferrer" target=3D"_blank">dovecot_2.4.2.bb</a><br>
index 40cf991ae1..4632d9574f 100644<br>
--- a/meta-networking/recipes-support/dovecot/<a href=3D"http://dovecot_2.4=
.1-4.bb" rel=3D"noreferrer" target=3D"_blank">dovecot_2.4.1-4.bb</a><br>
+++ b/meta-networking/recipes-support/dovecot/<a href=3D"http://dovecot_2.4=
.2.bb" rel=3D"noreferrer" target=3D"_blank">dovecot_2.4.2.bb</a><br>
@@ -14,9 +14,8 @@ SRC_URI =3D &quot;<a href=3D"http://dovecot.org/releases/=
2.4/dovecot-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://d=
ovecot.org/releases/2.4/dovecot-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dovecot.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dovecot.socket \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-m4-Check-for-libunwin=
d-instead-of-libunwind-generic.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-musl-compilation.patch=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;fb188603f419ed7aaa07794a8692098c3ec2660bb9c67=
d0efe24948cbb32ae00&quot;<br>
+SRC_URI[sha256sum] =3D &quot;2cd62e4d22b9fc1c80bd38649739950f0dbda34fbc3e6=
2624fb6842264e93c6e&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;openssl xz zlib bzip2 libcap icu libtirpc bison-nat=
ive&quot;<br>
=C2=A0CFLAGS +=3D &quot;-I${STAGING_INCDIR}/tirpc&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122696): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122696" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122696</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116809504/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116809504/1997914</a><br>
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

--0000000000006b20e00646675f3a--

