Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A32A7D25942
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 05:53:44 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3825.1769493224173045200
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 21:53:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bR+EnTSs;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79273a294edso50892097b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 21:53:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769493223; cv=none;
        d=google.com; s=arc-20240605;
        b=guKC/3NbLbqPyPq0ENlRuUA+cfmUIzcXwjU6QYWwq/7C+hhzWISQthXl/Adb9Wzyh0
         Uhc3LcYyLa6ewRUXi8VKi67EK6hY1BouE7Hsv6Drp89h5cwUSgYUk5jV5yM4T+7TqvZ0
         3CssfesohuwJ5yE50WtbP/CUhxHBbdKRwh5vt9wMk2K52oFPqQY7uZ7TabuTp/GzuPFH
         NB9uou1WvDzpqrNwgA6/vFsQpPqAENYf+CWf509LghKR3V9ZJoXTZ70O+34czX8rNPAW
         YMEgiGOgK+6LkLXPIPaC94CsR4UTv2wxfEinPdRa8GTUrrGUrJ/Knti4MWgY0SxeHSVn
         eCYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xny7cxNW7hFKEGx5TGeTxVJa0rE+0vArlgN8xEswK6k=;
        fh=RnZMXDUlwXY8UgMJsCy3860tY0uphmLPDqFPKV9t5MY=;
        b=TDDNh2uIVzbYKIvTKzlobMq3K+MUJf/6Cz8H3Ya/gJjFrR4EVhq456tFXYSwnCzjk3
         DdsXK0g2Qfbh9sKDg6TyALQaZJciyWLIyaJ/RYoGZmlxKroYyq0JXxk8Ymw+Twv/HO/j
         IEiLkv5axf30g1/JESAxvx33zkAhixbycwPnW7rGFTCmdu1jZ6Yo02OSgmsynOCdfcLl
         RwehIWDsunphRLFudDUA8HPjYfW3xWX4erm9B8oYdL8H3fb7rn5B+0Ok84QLYNoEKuEN
         LaAfMC1V+wgIkbphnlMqUG6Oq6qBG7piFA4rtiKa5Or5TWzyxiqIgW0Buzitluj7nhEg
         93BQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769493223; x=1770098023; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xny7cxNW7hFKEGx5TGeTxVJa0rE+0vArlgN8xEswK6k=;
        b=bR+EnTSs6B8HRSMCgutuaf8jDGvDR4ZRDk/doq0yqTRJkirKpCzEvpo1vfY+KwQpTh
         oi5fNqqlI/TmWXrtcLwLS4inivErYdxz34dQCF0JOgAcejLIyMkgm2/nE7wz+zhpAMmE
         A0cVH2BFEI/VJa6bEdDHXGt8wQETh0BAZcEZ0ndiuTgQe01sPqA1H4sgyaM/NdvveKuW
         d18f2eTsf8F6odxmtjx8v2q2RhAbLk0esScB0UyFaSTFCPxzk2b7gOBYAN6sKqN0pLFf
         wPNj2b7UpYp6lqmuHXQ+0wFxRxcFvbKTlVIJ5FB2PopuaueQdCTRfNYwmWy5pMbr2HC8
         ftWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769493223; x=1770098023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xny7cxNW7hFKEGx5TGeTxVJa0rE+0vArlgN8xEswK6k=;
        b=iOIgEdvRkeIu/fCKaEN3/MNUsDY98kxzzCfEscfVQjE62JmC6mzKCEfoSYdtVIE0fh
         U8bEkev1u+ANvEYKuS7reuhLpJG31MCiZE4YQh+/q+iTd8/QXzXe6ef1vZ/6NvnAbM+u
         LqVIE55ljeJ4q16HI0sOv+dUD2LnlezRS5QIqGxevdI4/hUiXkmu4fs0Zm+yunVMTRGQ
         0Vd1UKoeujMXcD+kE3O/RnzEe+7cgeymGtjUl3m3ZWqoQwx3p/rgqYgWLuiRf7L3IXlJ
         mEpHeVk7lnUBJZP+ZtQFVuCF+xf1FA58RnU5hIfK6YRuVG+X8I2t12Ri1QDuB9bPFYVN
         G0TQ==
X-Gm-Message-State: AOJu0Yy1Wgq4s5Qkxm8+uf3pp8Dh60SEzP5ijuEAY20ZFOFLw3he+hK1
	s40txksN4DXZchaONlZg70b1ildPznFMQ9HQulS0CsgpZVlHGVBmZgvnam3c6wATLIviYBLN1Ka
	J6vDaq1mYnSjRDk49e8x7dT/J1qQuKhWb7tlk
X-Gm-Gg: AZuq6aJ1FU7LYlAxCMd79ylEI66cgkRhwg8HEWmDOd12RkawULDxHy5YqsHoJv1bqoO
	NA3uzE8rn0YOhVW+zwnvrv+hQOfOCjvtJCnBe6BMJTHu5PIqqkUG1IQLKj1rP7pC86kzDdVuc06
	kERHa7Fk7DRLCBV70mqwwbIDKfu3g1ZTSoD/CFOZjKi77QgjnHv/5jx8oNN/wS4qkEIErMI0VRI
	J4HAqO0+OahITqXCJ5xYhCmGMkc2FUHIuGG8GWVQyEdRLbaNYxnvi2GI+cYahfrZGedkHUosicE
	GPZL4dSJ1qmPyvFLrSAiKUYGVsps0FX+cWTah0zyTohCaxJszPL0G9WNOGB23qPln/czdeVBWV8
	/ggLdJs3ybZnFFmDIQhOqAlJCCog+ikXWQ0D2VXpMV8gA
X-Received: by 2002:a05:690c:3347:b0:78c:69fe:eb1d with SMTP id
 00721157ae682-7947ab157bamr3661207b3.17.1769493223104; Mon, 26 Jan 2026
 21:53:43 -0800 (PST)
MIME-Version: 1.0
References: <188E438EFF05B728.3837557@lists.openembedded.org> <20260126121236.1304966-2-frederikbraendstrup@gmail.com>
In-Reply-To: <20260126121236.1304966-2-frederikbraendstrup@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Jan 2026 21:53:17 -0800
X-Gm-Features: AZwV_QhCpYCkgF92polDjkw7IXnR0z2XUWnNHZB_tNudtTxPqSN9-useS_5ZYeQ
Message-ID: <CAMKF1spENDOL3q_ftgBfO5+i_44D5m2gg7FLUgQp8CeRYY6Dkg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v4] liboauth2: Add recipe at 2.2.0
To: frederikbraendstrup@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fee98f0649583ea2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:53:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123898

--000000000000fee98f0649583ea2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 4:13=E2=80=AFAM Frederik Br=C3=A6ndstrup via
lists.openembedded.org <frederikbraendstrup=3Dgmail.com@lists.openembedded.=
org>
wrote:

> V3: adds fixes for building with clang
>
> V4: removes default PACKAGECONFIG used for testing builds
>
> Signed-off-by: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
> ---
>  ..._easy_setopt-takes-a-long-not-an-int.patch | 33 +++++++++++++++++++
>  .../liboauth2/liboauth2_2.2.0.bb              | 23 +++++++++++++
>  2 files changed, 56 insertions(+)
>  create mode 100644
> meta-oe/recipes-support/liboauth2/liboauth2/0001-fix-clang-curl_easy_seto=
pt-takes-a-long-not-an-int.patch
>  create mode 100644 meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
>
> diff --git
> a/meta-oe/recipes-support/liboauth2/liboauth2/0001-fix-clang-curl_easy_se=
topt-takes-a-long-not-an-int.patch
> b/meta-oe/recipes-support/liboauth2/liboauth2/0001-fix-clang-curl_easy_se=
topt-takes-a-long-not-an-int.patch
> new file mode 100644
> index 0000000000..bdb4a0f108
> --- /dev/null
> +++
> b/meta-oe/recipes-support/liboauth2/liboauth2/0001-fix-clang-curl_easy_se=
topt-takes-a-long-not-an-int.patch
> @@ -0,0 +1,33 @@
> +From a9f28a44b9b387ef28904e24ca05d28562fdcc45 Mon Sep 17 00:00:00 2001
> +From: Frede Hoey Braendstrup <frede@vokalo.io>
> +Date: Mon, 26 Jan 2026 11:07:24 +0100
> +Subject: [PATCH] fix(clang): curl_easy_setopt takes a long not an int
> +
> +Signed-off-by: Frede Hoey Braendstrup <frede@vokalo.io>
> +Upstream-status: Backport https://github.com/OpenIDC/liboauth2/pull/69


Upstream status has a certain format, please make it so.
Upstream-Status: Backport [URL]


>
> +---
> + src/http.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/http.c b/src/http.c
> +index ab7a25a..bc242ed 100644
> +--- a/src/http.c
> ++++ b/src/http.c
> +@@ -1024,7 +1024,7 @@ bool oauth2_http_call(oauth2_log_t *log, const cha=
r
> *url, const char *data,
> +       curl_easy_setopt(curl, CURLOPT_MAXREDIRS, 5L);
> +
> +       if (ctx)
> +-              curl_easy_setopt(curl, CURLOPT_TIMEOUT, ctx->timeout);
> ++              curl_easy_setopt(curl, CURLOPT_TIMEOUT,
> (long)ctx->timeout);
> +
> +       curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION,
> +                        oauth2_http_curl_buf_write);
> +@@ -1092,7 +1092,7 @@ bool oauth2_http_call(oauth2_log_t *log, const cha=
r
> *url, const char *data,
> +
> +       if (data !=3D NULL) {
> +               curl_easy_setopt(curl, CURLOPT_POSTFIELDS, data);
> +-              curl_easy_setopt(curl, CURLOPT_POST, 1);
> ++              curl_easy_setopt(curl, CURLOPT_POST, 1L);
> +       }
> +
> +       if (ctx)
> diff --git a/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
> b/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
> new file mode 100644
> index 0000000000..31d7aec69d
> --- /dev/null
> +++ b/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "OAuth 2.x and OpenID Connect C library"
> +HOMEPAGE =3D "https://github.com/OpenIDC/liboauth2"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe7014dce33e26468b=
a93"
> +
> +SRC_URI =3D " \
> +    git://
> github.com/OpenIDC/liboauth2;protocol=3Dhttps;branch=3Dmaster;tag=3Dv${PV=
}
> <http://github.com/OpenIDC/liboauth2;protocol=3Dhttps;branch=3Dmaster;tag=
=3Dv$%7BPV%7D>
> \
> +    file://0001-fix-clang-curl_easy_setopt-takes-a-long-not-an-int.patch=
 \
> +    "
> +
> +PV =3D "2.2.0"
> +SRCREV =3D "12571b6d6568c2db7d5f080f60ecb55795c0db19"
> +
> +DEPENDS =3D "libpcre2 jansson curl openssl cjose"
> +
> +inherit pkgconfig autotools-brokensep
> +
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[memcache] =3D
> "--with-memcache,--without-memcache,libmemcached"
> +PACKAGECONFIG[redis] =3D "--with-redis,--without-redis,hiredis"
> +PACKAGECONFIG[jq] =3D "--with-jq,--without-jq,jq"
> +PACKAGECONFIG[apache] =3D "--with-apache,--without-apache,apache2"
> +
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123874):
> https://lists.openembedded.org/g/openembedded-devel/message/123874
> Mute This Topic: https://lists.openembedded.org/mt/117466911/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fee98f0649583ea2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 26,=
 2026 at 4:13=E2=80=AFAM Frederik Br=C3=A6ndstrup via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;frederikbraendstrup=3D<=
a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">V3: adds fixes for building with clang<br>
<br>
V4: removes default PACKAGECONFIG used for testing builds<br>
<br>
Signed-off-by: Frede Hoey Braendstrup &lt;<a href=3D"mailto:frederikbraends=
trup@gmail.com" target=3D"_blank">frederikbraendstrup@gmail.com</a>&gt;<br>
---<br>
=C2=A0..._easy_setopt-takes-a-long-not-an-int.patch | 33 ++++++++++++++++++=
+<br>
=C2=A0.../liboauth2/<a href=3D"http://liboauth2_2.2.0.bb" rel=3D"noreferrer=
" target=3D"_blank">liboauth2_2.2.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 23 +++++++++++++<br>
=C2=A02 files changed, 56 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/liboauth2/liboauth2/0001-f=
ix-clang-curl_easy_setopt-takes-a-long-not-an-int.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/liboauth2/<a href=3D"http:=
//liboauth2_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">liboauth2_2.2.0.=
bb</a><br>
<br>
diff --git a/meta-oe/recipes-support/liboauth2/liboauth2/0001-fix-clang-cur=
l_easy_setopt-takes-a-long-not-an-int.patch b/meta-oe/recipes-support/liboa=
uth2/liboauth2/0001-fix-clang-curl_easy_setopt-takes-a-long-not-an-int.patc=
h<br>
new file mode 100644<br>
index 0000000000..bdb4a0f108<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/liboauth2/liboauth2/0001-fix-clang-curl_easy_=
setopt-takes-a-long-not-an-int.patch<br>
@@ -0,0 +1,33 @@<br>
+From a9f28a44b9b387ef28904e24ca05d28562fdcc45 Mon Sep 17 00:00:00 2001<br>
+From: Frede Hoey Braendstrup &lt;<a href=3D"mailto:frede@vokalo.io" target=
=3D"_blank">frede@vokalo.io</a>&gt;<br>
+Date: Mon, 26 Jan 2026 11:07:24 +0100<br>
+Subject: [PATCH] fix(clang): curl_easy_setopt takes a long not an int<br>
+<br>
+Signed-off-by: Frede Hoey Braendstrup &lt;<a href=3D"mailto:frede@vokalo.i=
o" target=3D"_blank">frede@vokalo.io</a>&gt;<br>
+Upstream-status: Backport <a href=3D"https://github.com/OpenIDC/liboauth2/=
pull/69" rel=3D"noreferrer" target=3D"_blank">https://github.com/OpenIDC/li=
boauth2/pull/69</a></blockquote><div><br></div><div>Upstream status has a c=
ertain format, please make it so.</div><div>Upstream-Status: Backport [URL]=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><b=
r>
+---<br>
+ src/http.c | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/src/http.c b/src/http.c<br>
+index ab7a25a..bc242ed 100644<br>
+--- a/src/http.c<br>
++++ b/src/http.c<br>
+@@ -1024,7 +1024,7 @@ bool oauth2_http_call(oauth2_log_t *log, const char =
*url, const char *data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0curl_easy_setopt(curl, CURLOPT_MAXREDIRS, 5L);<=
br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curl_easy_setopt(curl, C=
URLOPT_TIMEOUT, ctx-&gt;timeout);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curl_easy_setopt(curl, C=
URLOPT_TIMEOUT, (long)ctx-&gt;timeout);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 oauth2_http_curl_buf_write);<br>
+@@ -1092,7 +1092,7 @@ bool oauth2_http_call(oauth2_log_t *log, const char =
*url, const char *data,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (data !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0curl_easy_setopt(cu=
rl, CURLOPT_POSTFIELDS, data);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curl_easy_setopt(curl, C=
URLOPT_POST, 1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curl_easy_setopt(curl, C=
URLOPT_POST, 1L);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx)<br>
diff --git a/meta-oe/recipes-support/liboauth2/<a href=3D"http://liboauth2_=
2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">liboauth2_2.2.0.bb</a> b/met=
a-oe/recipes-support/liboauth2/<a href=3D"http://liboauth2_2.2.0.bb" rel=3D=
"noreferrer" target=3D"_blank">liboauth2_2.2.0.bb</a><br>
new file mode 100644<br>
index 0000000000..31d7aec69d<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/liboauth2/<a href=3D"http://liboauth2_2.2.0.b=
b" rel=3D"noreferrer" target=3D"_blank">liboauth2_2.2.0.bb</a><br>
@@ -0,0 +1,23 @@<br>
+SUMMARY =3D &quot;OAuth 2.x and OpenID Connect C library&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/OpenIDC/liboauth2" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/OpenIDC/liboauth2</a>&quo=
t;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D2ee41112a44fe7014dce33e264=
68ba93&quot;<br>
+<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/OpenIDC/liboauth2;protoco=
l=3Dhttps;branch=3Dmaster;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" target=3D"_b=
lank">github.com/OpenIDC/liboauth2;protocol=3Dhttps;branch=3Dmaster;tag=3Dv=
${PV}</a> \<br>
+=C2=A0 =C2=A0 file://0001-fix-clang-curl_easy_setopt-takes-a-long-not-an-i=
nt.patch \<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
+PV =3D &quot;2.2.0&quot;<br>
+SRCREV =3D &quot;12571b6d6568c2db7d5f080f60ecb55795c0db19&quot;<br>
+<br>
+DEPENDS =3D &quot;libpcre2 jansson curl openssl cjose&quot;<br>
+<br>
+inherit pkgconfig autotools-brokensep<br>
+<br>
+PACKAGECONFIG ??=3D &quot;&quot;<br>
+PACKAGECONFIG[memcache] =3D &quot;--with-memcache,--without-memcache,libme=
mcached&quot;<br>
+PACKAGECONFIG[redis] =3D &quot;--with-redis,--without-redis,hiredis&quot;<=
br>
+PACKAGECONFIG[jq] =3D &quot;--with-jq,--without-jq,jq&quot;<br>
+PACKAGECONFIG[apache] =3D &quot;--with-apache,--without-apache,apache2&quo=
t;<br>
+<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123874): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123874" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123874</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117466911/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117466911/1997914</a><br>
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

--000000000000fee98f0649583ea2--

