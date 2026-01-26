Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042AFC88E48
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 04:34:23 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12701.1769402055091153765
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jan 2026 20:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BpwrtL7t;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79430ef54c3so36126797b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 20:34:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769402054; cv=none;
        d=google.com; s=arc-20240605;
        b=QgQoTmHwIY2rUHo3LIgE6miv244Bw1nbQO214WAojmIQ+1wk8WVj/ZtR2YFlNBhDKM
         EOPt7rYqYg4gHtjzzzx30V3/ukO2lq4dBt0zlT0Er8Jwl87HccoMqi+3qgjd+UQzmJVv
         NndvhBqAInB4fB+E61q6xApR/GKO7qpEfTDf72ZUQNnau5JFxeyj5Wmpv+HVc5O4yYD+
         m6qCoXi70ZlBBZvMWdW5beB0MiYWrCot2LbDC9gImogJIaADHXyJYo4/VWlUw3ARCNEx
         1tWQ0URTbaeOVc/yNo9CGawHtouohgDXASJc1RUxP8050WKChoR4o4sRkIVenmHFMYkb
         YhfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ybCwyiK3CPXhOkbdfBKdp5fxUz/GPTsUV7GN/HHVyjk=;
        fh=RnZMXDUlwXY8UgMJsCy3860tY0uphmLPDqFPKV9t5MY=;
        b=DfSqCrXvjw8Gz8NeMDHQS8SpfMFmjGMWdu4C0BRPzEwuUSixufHxJLzr70ZI5rX3Kn
         FhqVAXyZOnij+twUqPiYNytYCk5kghVVjv0IfKxSXrDs3cOceT2KrPK/0qUBS+irYVQl
         NC6VKfETE33n2hWXJrFaw5B49u9eDp/EVwq/gaEHQrhSUEjh4U5UCCblEc9E2w6QXcxe
         BAnDLpvlhOZFtPvNM4emdXHNLy+Repn2HwMrrJ9512xnjdbvbrUj0gA1gs7spkm5DdnO
         Vngf7jfFrFZkMoF7X7PItGTsSezkbpzFLbuqoaqwztZhsiFnzZDtYZOcrxCVOm7rGLV7
         rX6w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769402054; x=1770006854; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ybCwyiK3CPXhOkbdfBKdp5fxUz/GPTsUV7GN/HHVyjk=;
        b=BpwrtL7tMEyMJK66nuveQvYZmLp+axP9fY/bO/yg0qglY4bB0jE9UZAqmrEOPPb5yn
         7XpHM2BEzFJpjEg8mGs2RL5m5I9FwDrxVFqXT4a+K4D8Ea8HhiZWsBmdaLdlgmy+AcdK
         FzKrMyCFxwEWhli6oHYAbIq6+FtQ/OEsHJy+w+8wfSQ/pLuF40Wuz2vr5rKZXVIPExaT
         c6cEsA4sWQNortynz8myUUYhjqX6YvpfmShut1GwrhH9KvDyRPIf9O4gTJto+P7LSIZJ
         el3wGNIuKpIk/31ZSN6SPi7T3RaO1UOkWsRJKg5p92olhimCYplK9ukiHC8oXySMA2ju
         pjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769402054; x=1770006854;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybCwyiK3CPXhOkbdfBKdp5fxUz/GPTsUV7GN/HHVyjk=;
        b=fwjGDtcSbD9TK8GRzsVykYsVooMN5q5rMyIx2nA6ck7ic67qPn260XsId/q2C05UbY
         hRumftmvxMIBcoqivxBhj1NM12LaYFRfVKyoqizhwemYUpv41++t1atKQ0C76mlugFYA
         nO8FwQW3j7HACt5AoR1d+GSuJFClkXevIzO90l7pyeE5s2QEOqi/qAukf83U0TvMaIyp
         OOQHG4ylJvZ0mXbaxelzM36NkA7RHwwbzvsbw3zajZVJJ2WW+EAQ6WqEqVM8ZvL6u8+H
         goWzYc+bzRnK1wE/RuLMM70w57pzTdxXManHJ7v8nRfP8tt0A3wWieIY8/4pt7fSUqRO
         uDiQ==
X-Gm-Message-State: AOJu0Yx+pR9Bk5vADodbqUw7uk4Sf4JOLWQ9XQvtseJBgHmkz1UlltSk
	MRX06o/R4JYgV+hj6zXgAv8Pt39I3K3vyeFTda7kaAfd3xEIdeXgWgl4pDHAKM+AkYDpRtVIlop
	+awA+YwQhUwsUdpsLxfGVHyNp1W3Tqho=
X-Gm-Gg: AZuq6aKb5uOcwoPsgFIexT/2M7U39Tmni1DZhE1CVAzaIndmubMJ7rmDXrKzUTWSp88
	In4vh2Gp7oJalg8s4HvOUGAU8J2z+xJnWxhq7K2WRd4RIuHI1CJn233EQHKH4EtCscoKU5oNL5F
	ufcdTN6z5iIoIm6MKIOt8qUqOtJRq2UPa6l59ipljBSbKPGWZ6cE6AHyanGuiSrVqc9JypAsCYZ
	qvN3Tzh9FsUazGHUJ84Zvr0l8yKGGMEYwf4pjaChkzG9pXCMwka3ik5P8MfSaNCyCMfWWE9fLr6
	v/qfy1RK+MRohqefLD3v6wTEZPfsrsXhJqZYpcXZ9qKNcYkRr+tZrBapo8mYXa46BrKxZNwZBEQ
	DVjSqVXENZ6AoCTyCC9YqA7oQ8qQ=
X-Received: by 2002:a05:690c:992:b0:794:e8e:745b with SMTP id
 00721157ae682-7945aa1858emr16281497b3.70.1769402054120; Sun, 25 Jan 2026
 20:34:14 -0800 (PST)
MIME-Version: 1.0
References: <20260125102742.1827360-2-frederikbraendstrup@gmail.com> <20260125102742.1827360-4-frederikbraendstrup@gmail.com>
In-Reply-To: <20260125102742.1827360-4-frederikbraendstrup@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 25 Jan 2026 20:33:48 -0800
X-Gm-Features: AZwV_Qh9V8jpnlWShrMoD6GafrNMHaPFJrUo9jcuxYpdMcMZo76UI2WAG9sCToo
Message-ID: <CAMKF1sqs2Vi8hfZ3bdAh0_YJ8W=oPahkV6RJw17e2P=y9cMqGQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 2/2] liboauth2: Add recipe at 2.2.0
To: frederikbraendstrup@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e69ad20649430406"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 04:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123847

--000000000000e69ad20649430406
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fails to build with TOOLCHAIN =3D "clang"

src/http.c:1027:3: error: call to 'Wcurl_easy_setopt_err_long' declared
with 'warning' attribute: curl_easy_setopt expects a long argument
[-Werror,-Wattribute-warning]
 1027 |                 curl_easy_setopt(curl, CURLOPT_TIMEOUT,
ctx->timeout);
      |                 ^
/srv/build/yoe/build/tmp/work/cortexa57-yoe-linux/liboauth2/2.2.0/recipe-sy=
sroot/usr/include/curl/typecheck-gcc.h:50:15:
note: expanded from macro 'curl_easy_setopt'
   50 |               Wcurl_easy_setopt_err_long();
    \
      |               ^
src/http.c:1095:3: error: call to 'Wcurl_easy_setopt_err_long' declared
with 'warning' attribute: curl_easy_setopt expects a long argument
[-Werror,-Wattribute-warning]
 1095 |                 curl_easy_setopt(curl, CURLOPT_POST, 1);
      |                 ^
/srv/build/yoe/build/tmp/work/cortexa57-yoe-linux/liboauth2/2.2.0/recipe-sy=
sroot/usr/include/curl/typecheck-gcc.h:50:15:
note: expanded from macro 'curl_easy_setopt'
   50 |               Wcurl_easy_setopt_err_long();
    \
      |               ^
2 errors generated.

Detailed build log
https://termbin.com/qfx8

On Sun, Jan 25, 2026 at 2:28=E2=80=AFAM Frederik Br=C3=A6ndstrup via
lists.openembedded.org <frederikbraendstrup=3Dgmail.com@lists.openembedded.=
org>
wrote:

> V2 removes the hard requirement for apache2 for liboauth2
>
> Signed-off-by: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
> ---
>  .../liboauth2/liboauth2_2.2.0.bb              | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
>
> diff --git a/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
> b/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
> new file mode 100644
> index 0000000000..0890a6b78d
> --- /dev/null
> +++ b/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "OAuth 2.x and OpenID Connect C library"
> +HOMEPAGE =3D "https://github.com/OpenIDC/liboauth2"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe7014dce33e26468b=
a93"
> +
> +SRC_URI =3D "git://
> github.com/OpenIDC/liboauth2;protocol=3Dhttps;branch=3Dmaster;tag=3Dv${PV=
}
> <http://github.com/OpenIDC/liboauth2;protocol=3Dhttps;branch=3Dmaster;tag=
=3Dv$%7BPV%7D>
> "
> +
> +PV =3D "2.2.0"
> +SRCREV =3D "12571b6d6568c2db7d5f080f60ecb55795c0db19"
> +
> +DEPENDS =3D "libpcre2 jansson curl openssl cjose"
> +
> +inherit pkgconfig autotools-brokensep
> +
> +PACKAGECONFIG ??=3D "memcache redis jq apache"
> +PACKAGECONFIG[memcache] =3D
> "--with-memcache,--without-memcache,libmemcached"
> +PACKAGECONFIG[redis] =3D "--with-redis,--without-redis,hiredis"
> +PACKAGECONFIG[jq] =3D "--with-jq,--without-jq,jq"
> +PACKAGECONFIG[apache] =3D "--with-apache,--without-apache,apache2"
> +
> --
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123839):
> https://lists.openembedded.org/g/openembedded-devel/message/123839
> Mute This Topic: https://lists.openembedded.org/mt/117448448/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e69ad20649430406
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">fails to build with TOOLCHAIN =3D &quot;clang&quot;<div><b=
r></div><div>src/http.c:1027:3: error: call to &#39;Wcurl_easy_setopt_err_l=
ong&#39; declared with &#39;warning&#39; attribute: curl_easy_setopt expect=
s a long argument [-Werror,-Wattribute-warning]<br>=C2=A01027 | =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curl_easy_setopt(curl, CURLOP=
T_TIMEOUT, ctx-&gt;timeout);<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>/srv/build/yoe/build/tmp/work/cort=
exa57-yoe-linux/liboauth2/2.2.0/recipe-sysroot/usr/include/curl/typecheck-g=
cc.h:50:15: note: expanded from macro &#39;curl_easy_setopt&#39;<br>=C2=A0 =
=C2=A050 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Wcurl_easy_seto=
pt_err_long(); =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>src/http.c:1095:3: error: ca=
ll to &#39;Wcurl_easy_setopt_err_long&#39; declared with &#39;warning&#39; =
attribute: curl_easy_setopt expects a long argument [-Werror,-Wattribute-wa=
rning]<br>=C2=A01095 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 curl_easy_setopt(curl, CURLOPT_POST, 1);<br>=C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>/srv/build/yoe/bu=
ild/tmp/work/cortexa57-yoe-linux/liboauth2/2.2.0/recipe-sysroot/usr/include=
/curl/typecheck-gcc.h:50:15: note: expanded from macro &#39;curl_easy_setop=
t&#39;<br>=C2=A0 =C2=A050 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Wcurl_easy_setopt_err_long(); =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>=C2=A0 =C2=A0=
 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>2 errors ge=
nerated.<br></div><div><br></div><div>Detailed build log</div><div><a href=
=3D"https://termbin.com/qfx8">https://termbin.com/qfx8</a></div></div><br><=
div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"g=
mail_attr">On Sun, Jan 25, 2026 at 2:28=E2=80=AFAM Frederik Br=C3=A6ndstrup=
 via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &=
lt;frederikbraendstrup=3D<a href=3D"mailto:gmail.com@lists.openembedded.org=
">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">V2 removes the hard requirement for apach=
e2 for liboauth2<br>
<br>
Signed-off-by: Frede Hoey Braendstrup &lt;<a href=3D"mailto:frederikbraends=
trup@gmail.com" target=3D"_blank">frederikbraendstrup@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../liboauth2/<a href=3D"http://liboauth2_2.2.0.bb" rel=3D"noreferrer=
" target=3D"_blank">liboauth2_2.2.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 20 +++++++++++++++++++<br>
=C2=A01 file changed, 20 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/liboauth2/<a href=3D"http:=
//liboauth2_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">liboauth2_2.2.0.=
bb</a><br>
<br>
diff --git a/meta-oe/recipes-support/liboauth2/<a href=3D"http://liboauth2_=
2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">liboauth2_2.2.0.bb</a> b/met=
a-oe/recipes-support/liboauth2/<a href=3D"http://liboauth2_2.2.0.bb" rel=3D=
"noreferrer" target=3D"_blank">liboauth2_2.2.0.bb</a><br>
new file mode 100644<br>
index 0000000000..0890a6b78d<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/liboauth2/<a href=3D"http://liboauth2_2.2.0.b=
b" rel=3D"noreferrer" target=3D"_blank">liboauth2_2.2.0.bb</a><br>
@@ -0,0 +1,20 @@<br>
+SUMMARY =3D &quot;OAuth 2.x and OpenID Connect C library&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/OpenIDC/liboauth2" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/OpenIDC/liboauth2</a>&quo=
t;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D2ee41112a44fe7014dce33e264=
68ba93&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/OpenIDC/liboauth2;pro=
tocol=3Dhttps;branch=3Dmaster;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" target=
=3D"_blank">github.com/OpenIDC/liboauth2;protocol=3Dhttps;branch=3Dmaster;t=
ag=3Dv${PV}</a>&quot;<br>
+<br>
+PV =3D &quot;2.2.0&quot;<br>
+SRCREV =3D &quot;12571b6d6568c2db7d5f080f60ecb55795c0db19&quot;<br>
+<br>
+DEPENDS =3D &quot;libpcre2 jansson curl openssl cjose&quot;<br>
+<br>
+inherit pkgconfig autotools-brokensep<br>
+<br>
+PACKAGECONFIG ??=3D &quot;memcache redis jq apache&quot;<br>
+PACKAGECONFIG[memcache] =3D &quot;--with-memcache,--without-memcache,libme=
mcached&quot;<br>
+PACKAGECONFIG[redis] =3D &quot;--with-redis,--without-redis,hiredis&quot;<=
br>
+PACKAGECONFIG[jq] =3D &quot;--with-jq,--without-jq,jq&quot;<br>
+PACKAGECONFIG[apache] =3D &quot;--with-apache,--without-apache,apache2&quo=
t;<br>
+<br>
-- <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123839): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123839" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123839</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117448448/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117448448/1997914</a><br>
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

--000000000000e69ad20649430406--

