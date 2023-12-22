Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D92C41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 13:49:46 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.23115.1703252983946403252
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Dec 2023 05:49:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YRZ/iTzo;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33697caf9a6so286664f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 05:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703252982; x=1703857782; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S4Ii9F0h5lbk9baJHt6IaGjM+QJDmF0rYHnbheVjp2E=;
        b=YRZ/iTzoiG4v2p7vN9BOyUMhjXfi00ZtEsEFT8SxePPxf9vAMHRh6SRg7iC09sFBrv
         Q/rjMoAkGdf0Kt7r0z6vo+w7Z/8HV1K90HurZkfwANJkuZCpAr2NEHwgh3YZxhZxceY4
         +HVuz+aoVr8VKE7txr4p6X7NI+LQjn+aAViKEItEsehAME1tj50LBH2NVbIQztp1+wNt
         9ZYB3JGixQeQXYpZk/gW+WpF44AcRLS5pkJRekKUJcLrDap18kBX1NEbrKQT1v7afX/y
         PySeMEfjHh9FKLH1LoFD6VTrDmbnNQ3tH2WgTBTEZhbRn0N9xQ6PT54LaTNSbu18qdz3
         en+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703252982; x=1703857782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S4Ii9F0h5lbk9baJHt6IaGjM+QJDmF0rYHnbheVjp2E=;
        b=AADu+r8bDyww6sNK7dVf0XHZRAT4FjaK/kwgETxxGtxXBYUvxYx0/2Q4gczFFPElYP
         jEC5UjqvI0TAUZ9IIP+xYNaJ+Jy5tKWx+Enq8yOOMMvENrq9AEfevXh9Nibh8fKR/i+v
         aZMjgLkjyQypLF2aVVx6qgAtRj2qrsk/TiTCnfYvoXpBrHfulP/8w/tbDRfOJ9/o183r
         wO3jsa6skNLDy4l0d2+DDmRGqXeJax9vZWVh5lcLur574ARh5QaZ6yT2vxjatGKfILKC
         337Q+h3qxrtWT5d7UnGKxR9lqGbK7S2keHDpFodvnBWTPkIVzM0wq5QjSwX2iJMpo8HX
         Gn7g==
X-Gm-Message-State: AOJu0Yzh38B29twD5u1Jkb2t16E4j2kvNllG+IFF//84El3LPoD7wU10
	itA62kDSdgJZ3SY1dcWk22sDP56m8YM9V40viMg=
X-Google-Smtp-Source: AGHT+IG1FH8zIATX2t7C1UthwAS3JSFhTArXk4OtUExRxCK9mix4/mtXq+7LSkNp6THn6N/NOTTizOGFF5aB720bUM4=
X-Received: by 2002:adf:f74a:0:b0:336:8030:214d with SMTP id
 z10-20020adff74a000000b003368030214dmr591630wrp.19.1703252982163; Fri, 22 Dec
 2023 05:49:42 -0800 (PST)
MIME-Version: 1.0
References: <17A32B63AF810A46.10357@lists.openembedded.org>
In-Reply-To: <17A32B63AF810A46.10357@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 22 Dec 2023 14:49:30 +0100
Message-ID: <CA+chaQd3VCor2PfEbJts50TQoVFKpWpdPZQPqks7EUoO_7iBAQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] wavpack: add PACKAGECONFIG for shared and
 enable it by default
To: martin.jansa@gmail.com
Cc: openembedded-devel@lists.openembedded.org, alperyasinak1@gmail.com
Content-Type: multipart/alternative; boundary="000000000000f6f410060d197c13"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 13:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107749

--000000000000f6f410060d197c13
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, ignore this one.

Something is still wrong, sent too soon (after do_compile finished), but
later there was:

ERROR: gstreamer1.0-plugins-good-1.22.7-r0 do_package_qa: QA Issue:
gstreamer1.0-plugins-good-wavpack rdepends on wavpack-dev [dev-deps]

so it's packaged incorrectly, because now it built unversioned .so:

tmp-glibc/work/cortexa57-oe-linux/wavpack/5.1.0-old/image/usr/lib/:
total 1528
drwxr-xr-x 3 martin martin   4096 Dec 22 14:27 ./
drwxr-xr-x 6 martin martin   4096 Dec 22 14:27 ../
-rw-r--r-- 2 martin martin 988636 Dec 22 14:27 libwavpack.a
lrwxrwxrwx 1 martin martin     19 Dec 22 14:27 libwavpack.so ->
libwavpack.so.1.2.0*
lrwxrwxrwx 1 martin martin     19 Dec 22 14:27 libwavpack.so.1 ->
libwavpack.so.1.2.0*
-rwxr-xr-x 1 martin martin 601320 Dec 22 14:27 libwavpack.so.1.2.0*
drwxr-xr-x 2 martin martin   4096 Dec 22 14:27 pkgconfig/

tmp-glibc/work/cortexa57-oe-linux/wavpack/5.6.0-shared/image/usr/lib/:
total 616
drwxr-xr-x 4 martin martin   4096 Dec 22 14:45 ./
drwxr-xr-x 6 martin martin   4096 Dec 22 14:45 ../
drwxr-xr-x 3 martin martin   4096 Dec 22 14:45 cmake/
-rwxr-xr-x 1 martin martin 608120 Dec 22 14:45 libwavpack.so*
drwxr-xr-x 2 martin martin   4096 Dec 22 14:45 pkgconfig/

will send v2 later

On Fri, Dec 22, 2023 at 2:46=E2=80=AFPM Martin Jansa via lists.openembedded=
.org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> * fixes gstreamer1.0-plugins-good build with wavpack enabled:
>   PACKAGECONFIG:append:pn-gstreamer1.0-plugins-good =3D " wavpack"
>
> * 5.1.0 built shared libs by default, 5.6.0 build with CMake doesn't,
> causing:
>   http://errors.yoctoproject.org/Errors/Details/748247/
>
> TOPDIR/tmp-glibc/work/cortexa57-oe-linux/gstreamer1.0-plugins-good/1.22.7=
/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../libexec/aarch64-oe-li=
nux/gcc/aarch64-oe-linux/13.2.0/ld:
> TOPDIR/tmp-glibc/work/cortexa57-oe-linux/gstreamer1.0-plugins-good/1.22.7=
/recipe-sysroot/usr/lib/libwavpack.a(read_words.c.o):
> relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `bitset' which may
> bind externally can not be used when making a shared object; recompile wi=
th
> -fPIC
> /usr/src/debug/wavpack/5.6.0/src/read_words.c:592:(.text+0xb88): dangerou=
s
> relocation: unsupported relocation
> collect2: error: ld returned 1 exit status
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
> b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
> index ebbc59dde8..1011cd4c03 100644
> --- a/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
> +++ b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
> @@ -9,3 +9,6 @@ SRCREV =3D "e03e8e29dc618e08e7baba9636e57ba1254874ce"
>  S =3D "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
> +
> +PACKAGECONFIG =3D "shared"
> +PACKAGECONFIG[shared] =3D "-DBUILD_SHARED_LIBS=3DON,-DBUILD_SHARED_LIBS=
=3DOFF,,"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107748):
> https://lists.openembedded.org/g/openembedded-devel/message/107748
> Mute This Topic: https://lists.openembedded.org/mt/103318396/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f6f410060d197c13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, ignore this one.<div><br></div><div>Something is st=
ill wrong, sent too soon (after do_compile finished), but later there was:<=
div><br></div><div>ERROR: gstreamer1.0-plugins-good-1.22.7-r0 do_package_qa=
: QA Issue: gstreamer1.0-plugins-good-wavpack rdepends on wavpack-dev [dev-=
deps]<br></div><div><br></div><div>so it&#39;s packaged incorrectly, becaus=
e now it built unversioned .so:</div><div><br></div><div>tmp-glibc/work/cor=
texa57-oe-linux/wavpack/5.1.0-old/image/usr/lib/:<br>total 1528<br>drwxr-xr=
-x 3 martin martin =C2=A0 4096 Dec 22 14:27 ./<br>drwxr-xr-x 6 martin marti=
n =C2=A0 4096 Dec 22 14:27 ../<br>-rw-r--r-- 2 martin martin 988636 Dec 22 =
14:27 libwavpack.a<br>lrwxrwxrwx 1 martin martin =C2=A0 =C2=A0 19 Dec 22 14=
:27 libwavpack.so -&gt; libwavpack.so.1.2.0*<br>lrwxrwxrwx 1 martin martin =
=C2=A0 =C2=A0 19 Dec 22 14:27 libwavpack.so.1 -&gt; libwavpack.so.1.2.0*<br=
>-rwxr-xr-x 1 martin martin 601320 Dec 22 14:27 libwavpack.so.1.2.0*<br>drw=
xr-xr-x 2 martin martin =C2=A0 4096 Dec 22 14:27 pkgconfig/<br><br>tmp-glib=
c/work/cortexa57-oe-linux/wavpack/5.6.0-shared/image/usr/lib/:<br>total 616=
<br>drwxr-xr-x 4 martin martin =C2=A0 4096 Dec 22 14:45 ./<br>drwxr-xr-x 6 =
martin martin =C2=A0 4096 Dec 22 14:45 ../<br>drwxr-xr-x 3 martin martin =
=C2=A0 4096 Dec 22 14:45 cmake/<br>-rwxr-xr-x 1 martin martin 608120 Dec 22=
 14:45 libwavpack.so*<br>drwxr-xr-x 2 martin martin =C2=A0 4096 Dec 22 14:4=
5 pkgconfig/<br></div><div><br></div><div>will send v2 later</div></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Fri, Dec 22, 2023 at 2:46=E2=80=AFPM Martin Jansa via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;martin.jansa=3D<a href=
=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">* fixes gstreamer1.0-plugins-good build with wavpack enabled:<br>
=C2=A0 PACKAGECONFIG:append:pn-gstreamer1.0-plugins-good =3D &quot; wavpack=
&quot;<br>
<br>
* 5.1.0 built shared libs by default, 5.6.0 build with CMake doesn&#39;t, c=
ausing:<br>
=C2=A0 <a href=3D"http://errors.yoctoproject.org/Errors/Details/748247/" re=
l=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/De=
tails/748247/</a><br>
<br>
TOPDIR/tmp-glibc/work/cortexa57-oe-linux/gstreamer1.0-plugins-good/1.22.7/r=
ecipe-sysroot-native/usr/bin/aarch64-oe-linux/../../libexec/aarch64-oe-linu=
x/gcc/aarch64-oe-linux/13.2.0/ld: TOPDIR/tmp-glibc/work/cortexa57-oe-linux/=
gstreamer1.0-plugins-good/1.22.7/recipe-sysroot/usr/lib/libwavpack.a(read_w=
ords.c.o): relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `bitset&#39=
; which may bind externally can not be used when making a shared object; re=
compile with -fPIC<br>
/usr/src/debug/wavpack/5.6.0/src/read_words.c:592:(.text+0xb88): dangerous =
relocation: unsupported relocation<br>
collect2: error: ld returned 1 exit status<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-multimedia/wavpack/<a href=3D"http://wavpack_5.6.0.bb=
" rel=3D"noreferrer" target=3D"_blank">wavpack_5.6.0.bb</a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-multimedia/wavpack/<a href=3D"http://wavpack_5=
.6.0.bb" rel=3D"noreferrer" target=3D"_blank">wavpack_5.6.0.bb</a> b/meta-o=
e/recipes-multimedia/wavpack/<a href=3D"http://wavpack_5.6.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">wavpack_5.6.0.bb</a><br>
index ebbc59dde8..1011cd4c03 100644<br>
--- a/meta-oe/recipes-multimedia/wavpack/<a href=3D"http://wavpack_5.6.0.bb=
" rel=3D"noreferrer" target=3D"_blank">wavpack_5.6.0.bb</a><br>
+++ b/meta-oe/recipes-multimedia/wavpack/<a href=3D"http://wavpack_5.6.0.bb=
" rel=3D"noreferrer" target=3D"_blank">wavpack_5.6.0.bb</a><br>
@@ -9,3 +9,6 @@ SRCREV =3D &quot;e03e8e29dc618e08e7baba9636e57ba1254874ce&q=
uot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit cmake pkgconfig<br>
+<br>
+PACKAGECONFIG =3D &quot;shared&quot;<br>
+PACKAGECONFIG[shared] =3D &quot;-DBUILD_SHARED_LIBS=3DON,-DBUILD_SHARED_LI=
BS=3DOFF,,&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#107748): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/107748" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/107748</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103318396/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103318396/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000f6f410060d197c13--

