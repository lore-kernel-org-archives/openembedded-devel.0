Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC1CC43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 19:07:59 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41846.1782500873562704703
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2026 12:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OF7f01ta;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6611689dc10so1473397d50.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 12:07:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782500872; cv=none;
        d=google.com; s=arc-20260327;
        b=esoJ+gstOlbP/ng+HUCVF5yf9DVje0elAZ+UFiZPWBxTgqcFcd1H11wsuHgHr5sRgB
         NELMazj74/5pXZF8FBHsdLVApoF3wwdyV3nJNX5qZaONBo+xkjRreQAg3Rg/eywC6JBJ
         KJF+e1pZ/54I2oPgN3kaAbPDpSN87seX8CnSqxRIDQiCAStiRdjibZL3CXDtY1vIqQQJ
         KPgx+ToFBUAmbdPTT1H+u3VcMqZjobaLxmJHx+cezIKyQHj3gRMhbEDBu8RiC/8JSYiD
         jZiSHoVoxdz6KXC9DElLwJxbG8/uKiobOlr7QXkD+YPGZuMSeAmorPklTeieOORO8dNZ
         OU6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1myfHv82sm6ICAqMlqD4fbvjeSPhq4ndUvEUHfIblqc=;
        fh=baApAtWtIq3Fe09J4QGjwHUw3G8tVYEoSaLyDR4Y5yc=;
        b=G97aAnWL3tO6hYHBG4v4mg4bq9wrrYhlQTa9txy3gxfz4XLxf3JcW7gNolU4lPIUyf
         +C3bWbwKo6araa83a7uuxE/cefBkp73rumROH1tXfRzoPdcsLTiV+j8EYV0SIsE67AnM
         OT/l/TSv4gd3OXs7ms9lycB7XYZoW57bLrWDc4HBZwbWXmbahL1qV4Wv2QL6b+WjKiVc
         hIheq22wHFU3h6jBcGqM7TQS+TNnrkOwKpemphVMJTgcNJGnWSytbq49IhnHx+jqyycI
         UT+ijdME1zdhort+BdRLt9hvX630dF3ycZd1fjLRQXjl5VZjAjOyo1J4bH/1O5s3xty0
         idAg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782500872; x=1783105672; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1myfHv82sm6ICAqMlqD4fbvjeSPhq4ndUvEUHfIblqc=;
        b=OF7f01taK0INfBXhoY7hwWoTXRNs8MwqzC5GyFnNY4wuyKl7LztviiQC8bIrYoxQOi
         3RqNTCcxKNq5vPfNpjkHtWRA7a0cGz4FBlu8jMR2KNXOQLRZ8M9idzDD6onM1zLHG13X
         rWagaOmGlX1d9eBlv0mE5ipI1LO/CX6oAREKNCg8Ift7zRag3t9o+RKQ576tDvEq2qOQ
         QlagJSNpC8cXTY6RCH+DZu+iNj8YGoP8Hap/q8PKGuMrx2aE0c5bF22opt+N0yJXfSch
         FIwNAO8rodSBTWLpAvH9t5uYzl13Yw9trwh2V+ctCcfu1xs+ukHCoKK+09sFFeUysheo
         QyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782500872; x=1783105672;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1myfHv82sm6ICAqMlqD4fbvjeSPhq4ndUvEUHfIblqc=;
        b=WGaTH/xEhvN9d4FcENX30BBSxHXZUIUSA9Tse8drSeDKZHrAqFczmojE9ukwrIO99x
         389/J6it42S6LypeRG3R61bGN0kGJOe5/MTdE0ri/JM3XAoxebgq+zRQfC9AYZ/YIOAk
         Q8/9j4xKVy0loV5AAuNuvgV2VIGbHH1XYoOv4HqHPRQd7JAuuyrJ/r6qUzONkcTNqbhW
         YValSMRevBFmQtT0oRO35dcSWIu373SbQX00GoL9msVDu5VZPgYD5WJcf4JwCsmprAyq
         8CLine8v+fArlxTAOCHmC1zF5un5K9vVV7QNF0A30bUBXp3yUcMrgrfXoD7obLFGQ0M5
         rKOw==
X-Gm-Message-State: AOJu0YzUbZ79iOJs4+Hh3bHUdQqb7Go1QCIDGqNtmMmnNogyZJI0bM1s
	7q6rDxrgtRsTbBUfsfdUjK0O0ZSHQKFfbmv5SP1kE6fYnaX/d5hbolaVYHX4fhmUE564xfCCsKU
	F1HrfuxvugWhFEWeH841wK1fVhTfG/Dcc1NJI6IU=
X-Gm-Gg: AfdE7ck9O2clqiPfYeQlb3Gt35XHwFf/k3Artohq8Z1W/Y0AIAJo21ouiWos657x8ZJ
	8BfYodxmhktycGZh7EQ9tR8is6YV58K2ZpYPqpv9UmHNB7tYJc/5z+zfe6arZp6HCNvVv9A1BIu
	NHxG5yQ42Hl+IPxlf2x9smP7vm319EvXvbgVFyUR92Ap9AxlfZfBRz8YSIotb1hq615LJuLniG+
	zmOvwjD7w9F9i7d/hnojTjiBPnE0k5dTChzqwmQQpqaZrGZlpxEq75GJYxWKxyb904//VKs9baP
	KmXmkrvXGkpY/eYrjW0RycLpxpAuHt6qTqyMhQiD9QajJtlyn4B9uT5hiQXTgQsA7c85AG/c7RD
	AwSLtCPMwSv69Hj+WeVXVaRYcuNxxiskV/VjD7iSiB42NjJnEjmoxWVfcjzOxKhLbDURXUwBk24
	4xBXdQmg==
X-Received: by 2002:a05:690e:440d:b0:662:d25f:daca with SMTP id
 956f58d0204a3-66487ea4213mr4801724d50.60.1782500872491; Fri, 26 Jun 2026
 12:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260626114133.3486742-1-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260626114133.3486742-1-Hemanth.KumarMD@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Jun 2026 12:07:25 -0700
X-Gm-Features: AVVi8Cfrbyf8FXjtWZe5ptsFIdz32xTwDfz6WWIAmzPDDfLhGJk0upGGFyyF8Jk
Message-ID: <CAMKF1sp7x=L4Fy7N35gJ9wq1bFXiYK7EkiboHm4hBy7itc8Y+w@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 1/2] lftp: backport fix for
 duplicate OpenSSL symbols
To: Hemanth.KumarMD@windriver.com
Cc: openembedded-devel@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: multipart/alternative; boundary="000000000000511efc06552cd343"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 19:07:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127810

--000000000000511efc06552cd343
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

i have sent an upgrade to 4.9.4 patch, do we still need this patch ?

On Fri, Jun 26, 2026 at 4:42=E2=80=AFAM Hemanth Kumar M D via lists.openemb=
edded.org
<Hemanth.KumarMD=3Dwindriver.com@lists.openembedded.org> wrote:

> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>
> Backport an upstream gnulib fix to avoid duplicate md5_* and sha1_*
> symbol definitions when building with OpenSSL enabled.
>
> Without this fix, lftp fails to link with errors such as:
>
>   multiple definition of `md5_init_ctx'
>   multiple definition of `sha1_init_ctx'
>
> Link: https://github.com/lavv17/lftp/issues/743
> Link: https://www.mail-archive.com/bug-gnulib@gnu.org/msg48445.html
>
> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> ---
>  .../lftp/files/gnulib-duplicate-symbols.patch | 40 +++++++++++++++++++
>  .../recipes-connectivity/lftp/lftp_4.9.3.bb   |  5 ++-
>  2 files changed, 44 insertions(+), 1 deletion(-)
>  create mode 100644
> meta-networking/recipes-connectivity/lftp/files/gnulib-duplicate-symbols.=
patch
>
> diff --git
> a/meta-networking/recipes-connectivity/lftp/files/gnulib-duplicate-symbol=
s.patch
> b/meta-networking/recipes-connectivity/lftp/files/gnulib-duplicate-symbol=
s.patch
> new file mode 100644
> index 0000000000..220a095ff8
> --- /dev/null
> +++
> b/meta-networking/recipes-connectivity/lftp/files/gnulib-duplicate-symbol=
s.patch
> @@ -0,0 +1,40 @@
> +From: Jan Palus <jpalus@fastmail.com>
> +Date: Sun, 17 Nov 2024 06:52:48 -0800
> +Subject: [PATCH] {md5,sha1}-stream: avoid duplicate symbols
> +
> +When building with OpenSSL, *_init_ctx and other inline symbols are
> +supposed to be provided by non *-stream compilation units. Drop the
> +GL_OPENSSL_INLINE _GL_EXTERN_INLINE override from *-stream.c files so
> +they don't re-emit those symbols as extern, causing duplicate symbol
> +errors at link time when --whole-archive is used (as lftp does).
> +
> +Link: https://www.mail-archive.com/bug-gnulib@gnu.org/msg48445.html
> +Upstream-Status: Backport [
> https://github.com/coreutils/gnulib/commit/353a3236d9328349c18ce2e4e98475=
5cb4a76ea7
> ]
> +
> +Signed-off-by: Jan Palus <jpalus@fastmail.com>
> +Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> +
> +--- a/lib/md5-stream.c
> ++++ b/lib/md5-stream.c
> +@@ -22,9 +22,6 @@
> + #include <config.h>
> +
> + /* Specification.  */
> +-#if HAVE_OPENSSL_MD5
> +-# define GL_OPENSSL_INLINE _GL_EXTERN_INLINE
> +-#endif
> + #include "md5.h"
> +
> + #include <stdlib.h>
> +--- a/lib/sha1-stream.c
> ++++ b/lib/sha1-stream.c
> +@@ -24,9 +24,6 @@
> + #include <config.h>
> +
> + /* Specification.  */
> +-#if HAVE_OPENSSL_SHA1
> +-# define GL_OPENSSL_INLINE _GL_EXTERN_INLINE
> +-#endif
> + #include "sha1.h"
> +
> + #include <stdlib.h>
> diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb
> b/meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb
> index 38bfa86751..3d838e6c42 100644
> --- a/meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb
> +++ b/meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb
> @@ -6,7 +6,10 @@ SECTION =3D "console/network"
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
>
> -SRC_URI =3D "http://lftp.yar.ru/ftp/lftp-${PV}.tar.bz2"
> +SRC_URI =3D "http://lftp.yar.ru/ftp/lftp-${PV}.tar.bz2 \
> +           file://gnulib-duplicate-symbols.patch \
> +"
> +
>  SRC_URI[md5sum] =3D "c32e15b96c08f7f0b2d17efbceb00db8"
>  SRC_URI[sha256sum] =3D
> "adceaef1bd21a38d07c973233fab603813c431f0a8dcbd23239fa9a41ae17b6e"
>
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127790):
> https://lists.openembedded.org/g/openembedded-devel/message/127790
> Mute This Topic: https://lists.openembedded.org/mt/119988165/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000511efc06552cd343
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div>i have sent an upgrade to 4.9.4 patch, do we stil=
l need this patch ?</div></div><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 26, 2026 at 4:42=
=E2=80=AFAM Hemanth Kumar M D via <a href=3D"http://lists.openembedded.org"=
>lists.openembedded.org</a> &lt;Hemanth.KumarMD=3D<a href=3D"mailto:windriv=
er.com@lists.openembedded.org">windriver.com@lists.openembedded.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: He=
manth Kumar M D &lt;<a href=3D"mailto:Hemanth.KumarMD@windriver.com" target=
=3D"_blank">Hemanth.KumarMD@windriver.com</a>&gt;<br>
<br>
Backport an upstream gnulib fix to avoid duplicate md5_* and sha1_*<br>
symbol definitions when building with OpenSSL enabled.<br>
<br>
Without this fix, lftp fails to link with errors such as:<br>
<br>
=C2=A0 multiple definition of `md5_init_ctx&#39;<br>
=C2=A0 multiple definition of `sha1_init_ctx&#39;<br>
<br>
Link: <a href=3D"https://github.com/lavv17/lftp/issues/743" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/lavv17/lftp/issues/743</a><br>
Link: <a href=3D"https://www.mail-archive.com/bug-gnulib@gnu.org/msg48445.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://www.mail-archive.com/bug-=
gnulib@gnu.org/msg48445.html</a><br>
<br>
Signed-off-by: Hemanth Kumar M D &lt;<a href=3D"mailto:Hemanth.KumarMD@wind=
river.com" target=3D"_blank">Hemanth.KumarMD@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../lftp/files/gnulib-duplicate-symbols.patch | 40 ++++++++++++++++++=
+<br>
=C2=A0.../recipes-connectivity/lftp/<a href=3D"http://lftp_4.9.3.bb" rel=3D=
"noreferrer" target=3D"_blank">lftp_4.9.3.bb</a>=C2=A0 =C2=A0|=C2=A0 5 ++-<=
br>
=C2=A02 files changed, 44 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/lftp/files/gn=
ulib-duplicate-symbols.patch<br>
<br>
diff --git a/meta-networking/recipes-connectivity/lftp/files/gnulib-duplica=
te-symbols.patch b/meta-networking/recipes-connectivity/lftp/files/gnulib-d=
uplicate-symbols.patch<br>
new file mode 100644<br>
index 0000000000..220a095ff8<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/lftp/files/gnulib-duplicate-symb=
ols.patch<br>
@@ -0,0 +1,40 @@<br>
+From: Jan Palus &lt;<a href=3D"mailto:jpalus@fastmail.com" target=3D"_blan=
k">jpalus@fastmail.com</a>&gt;<br>
+Date: Sun, 17 Nov 2024 06:52:48 -0800<br>
+Subject: [PATCH] {md5,sha1}-stream: avoid duplicate symbols<br>
+<br>
+When building with OpenSSL, *_init_ctx and other inline symbols are<br>
+supposed to be provided by non *-stream compilation units. Drop the<br>
+GL_OPENSSL_INLINE _GL_EXTERN_INLINE override from *-stream.c files so<br>
+they don&#39;t re-emit those symbols as extern, causing duplicate symbol<b=
r>
+errors at link time when --whole-archive is used (as lftp does).<br>
+<br>
+Link: <a href=3D"https://www.mail-archive.com/bug-gnulib@gnu.org/msg48445.=
html" rel=3D"noreferrer" target=3D"_blank">https://www.mail-archive.com/bug=
-gnulib@gnu.org/msg48445.html</a><br>
+Upstream-Status: Backport [<a href=3D"https://github.com/coreutils/gnulib/=
commit/353a3236d9328349c18ce2e4e984755cb4a76ea7" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/coreutils/gnulib/commit/353a3236d9328349c18c=
e2e4e984755cb4a76ea7</a>]<br>
+<br>
+Signed-off-by: Jan Palus &lt;<a href=3D"mailto:jpalus@fastmail.com" target=
=3D"_blank">jpalus@fastmail.com</a>&gt;<br>
+Signed-off-by: Hemanth Kumar M D &lt;<a href=3D"mailto:Hemanth.KumarMD@win=
driver.com" target=3D"_blank">Hemanth.KumarMD@windriver.com</a>&gt;<br>
+<br>
+--- a/lib/md5-stream.c<br>
++++ b/lib/md5-stream.c<br>
+@@ -22,9 +22,6 @@<br>
+ #include &lt;config.h&gt;<br>
+ <br>
+ /* Specification.=C2=A0 */<br>
+-#if HAVE_OPENSSL_MD5<br>
+-# define GL_OPENSSL_INLINE _GL_EXTERN_INLINE<br>
+-#endif<br>
+ #include &quot;md5.h&quot;<br>
+ <br>
+ #include &lt;stdlib.h&gt;<br>
+--- a/lib/sha1-stream.c<br>
++++ b/lib/sha1-stream.c<br>
+@@ -24,9 +24,6 @@<br>
+ #include &lt;config.h&gt;<br>
+ <br>
+ /* Specification.=C2=A0 */<br>
+-#if HAVE_OPENSSL_SHA1<br>
+-# define GL_OPENSSL_INLINE _GL_EXTERN_INLINE<br>
+-#endif<br>
+ #include &quot;sha1.h&quot;<br>
+ <br>
+ #include &lt;stdlib.h&gt;<br>
diff --git a/meta-networking/recipes-connectivity/lftp/<a href=3D"http://lf=
tp_4.9.3.bb" rel=3D"noreferrer" target=3D"_blank">lftp_4.9.3.bb</a> b/meta-=
networking/recipes-connectivity/lftp/<a href=3D"http://lftp_4.9.3.bb" rel=
=3D"noreferrer" target=3D"_blank">lftp_4.9.3.bb</a><br>
index 38bfa86751..3d838e6c42 100644<br>
--- a/meta-networking/recipes-connectivity/lftp/<a href=3D"http://lftp_4.9.=
3.bb" rel=3D"noreferrer" target=3D"_blank">lftp_4.9.3.bb</a><br>
+++ b/meta-networking/recipes-connectivity/lftp/<a href=3D"http://lftp_4.9.=
3.bb" rel=3D"noreferrer" target=3D"_blank">lftp_4.9.3.bb</a><br>
@@ -6,7 +6,10 @@ SECTION =3D &quot;console/network&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-3.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bcb673463ab874e=
80d47fae504&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://lftp.yar.ru/ftp/lftp-$%7BPV%7D.tar.bz2=
" rel=3D"noreferrer" target=3D"_blank">http://lftp.yar.ru/ftp/lftp-${PV}.ta=
r.bz2</a>&quot;<br>
+SRC_URI =3D &quot;<a href=3D"http://lftp.yar.ru/ftp/lftp-$%7BPV%7D.tar.bz2=
" rel=3D"noreferrer" target=3D"_blank">http://lftp.yar.ru/ftp/lftp-${PV}.ta=
r.bz2</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://gnulib-duplicate-symbols.p=
atch \<br>
+&quot;<br>
+<br>
=C2=A0SRC_URI[md5sum] =3D &quot;c32e15b96c08f7f0b2d17efbceb00db8&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;adceaef1bd21a38d07c973233fab603813c431f0=
a8dcbd23239fa9a41ae17b6e&quot;<br>
<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127790): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127790" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127790</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119988165/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119988165/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000511efc06552cd343--

