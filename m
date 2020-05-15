Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.12068.1589545457910672801
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 05:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fwV5KFqJ;
 spf=pass (domain: linaro.org, ip: 209.85.219.177, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f177.google.com with SMTP id o134so1039858ybg.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 05:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+XP1APE1cjMoPJItLZCJwF4qUG1UEv7WSeXpc4TaGPE=;
        b=fwV5KFqJ4XRldILPQ9SzVD9rj5gQg6EfY1wVkcEgGop1VDjF+SVKO7Yp4Q0JA3zGsy
         fsfjRnemvkVqeGaHA+AENzScy5jnL6S4r6vTPdSgI9lRDbwzxm3g3eBqYPc7q6BM3Cjx
         pvmXSwmiyO73RgLjxkqyPNi9ekk4cg5pqswuZvBBbCDiWqoCRLT9rV1XjbHckJTOYm1M
         qlwMuhL5KM/mVzQIa9NbjUDK/KhY6C0F5eYOJhvZzJSpu7vkc8i+TuAe7ss0SNL3Pc20
         aSshh3FsPVIY05F1ex4Db/tMmYG9XdGn6GcHA1vgcFhTH/W4Vb99Nn8Qi9QqnW9+OfTH
         cLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+XP1APE1cjMoPJItLZCJwF4qUG1UEv7WSeXpc4TaGPE=;
        b=FB5C+jSt/0Ghg6mnHvAj5ZzW425WtN6uiOAoAtdNyxdVa5IYfDhki5rBArga4B3ZVN
         MwlncWyQLc4P3lmtmOka078XSAXdCKmgbQ6rs2h0mvdyoLHoIRctLQ42nfGtu0d3g1Q/
         fSMkAntjlBYM/SCW7yoVodZZy70fq8OimImoHLSJoLq82XNxSmfx1EMe45E5xrB1s7fh
         k1K2OUhXhJDo5nujfT/KIBd9ryMCL3kKFp+O1PmKNnxClz3a/4pc16j+aMYDvTSxZnP/
         Tm62dmMfXFjWhIgog+w9LaD0++UH5tzhDJOVRy65ybghBJhr7jpcrWvWKkRZWdpdyZgr
         bR5Q==
X-Gm-Message-State: AOAM531ICkaMTGoW6eY0vitO947diZ3rFKe8v3uVzV/yTdj3M6MkzI+S
	O4uQIB7FY/ChkoVWnPCAIEEOsbEi9XLaARjG55jmww==
X-Google-Smtp-Source: ABdhPJztj8Rj08FrQAwPIJlhmsc91YAH0Y6qdqz55jMPbj5GZretGOnIzlTnvnCGF15XlT4gLvSJDZjNgPzFcKwzshQ=
X-Received: by 2002:a5b:a8e:: with SMTP id h14mr4892480ybq.454.1589545456802;
 Fri, 15 May 2020 05:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200515121436.2078760-1-sean@geanix.com>
In-Reply-To: <20200515121436.2078760-1-sean@geanix.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 15 May 2020 14:24:06 +0200
Message-ID: <CAP71Wjw91K67Z2fV9AyySsapyjmg20WE4c3JY84kr5+i0=u-Og@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] gpsd: fix build on aarch64
To: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, alistair23@gmail.com
Content-Type: multipart/alternative; boundary="0000000000004eb04d05a5aee41e"

--0000000000004eb04d05a5aee41e
Content-Type: text/plain; charset="UTF-8"

On Fri, May 15, 2020 at 2:14 PM Sean Nyekjaer <sean@geanix.com> wrote:

> Explicitly add ${CC} as linker, for it to understand -Wl option.
>
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>
> Alistair please check in your setup :)
>

I had found the same error on dragonboard/arm64. This patch fixes the build
problem. Note that I have only done build test, not run time.
thanks!


>
>  meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
> b/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
> index 0914f7ec2..5463c8231 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
> @@ -35,6 +35,7 @@ EXTRA_OESCONS = " \
>      systemd='${SYSTEMD_OESCONS}' \
>      libdir='${libdir}' \
>      manbuild='false' \
> +    LINK='${CC}' \
>      ${PACKAGECONFIG_CONFARGS} \
>  "
>  # this cannot be used, because then chrpath is not found and only static
> lib is built
> @@ -44,6 +45,7 @@ do_compile_prepend() {
>      export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
>      export
> PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\" pkg-config"
>      export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
> +    export LD="${CC}"
>      export LINKFLAGS="${LDFLAGS}"
>  }
>
> @@ -51,6 +53,7 @@ do_install() {
>      export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
>      export
> PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\" pkg-config"
>      export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
> +    export LD="${CC}"
>      export LINKFLAGS="${LDFLAGS}"
>
>      export DESTDIR="${D}"
> --
> 2.26.2
>
> 
>

--0000000000004eb04d05a5aee41e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 15, 2020 at 2:14 PM Sean =
Nyekjaer &lt;<a href=3D"mailto:sean@geanix.com">sean@geanix.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Explicitly a=
dd ${CC} as linker, for it to understand -Wl option.<br>
<br>
Signed-off-by: Sean Nyekjaer &lt;<a href=3D"mailto:sean@geanix.com" target=
=
=3D"_blank">sean@geanix.com</a>&gt;<br>
---<br>
<br>
Alistair please check in your setup :)<br></blockquote><div><br></div><div=
>I had found the same error on dragonboard/arm64. This patch fixes the buil=
d problem. Note that I have only done build test, not run time.</div><div>t=
hanks!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
=C2=A0meta-oe/recipes-navigation/gpsd/<a href=3D"http://gpsd_3.20.bb" rel=
=3D"noreferrer" target=3D"_blank">gpsd_3.20.bb</a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-navigation/gpsd/<a href=3D"http://gpsd_3.20.b=
b" rel=3D"noreferrer" target=3D"_blank">gpsd_3.20.bb</a> b/meta-oe/recipes-=
navigation/gpsd/<a href=3D"http://gpsd_3.20.bb" rel=3D"noreferrer" target=
=3D"_blank">gpsd_3.20.bb</a><br>
index 0914f7ec2..5463c8231 100644<br>
--- a/meta-oe/recipes-navigation/gpsd/<a href=3D"http://gpsd_3.20.bb" rel=
=3D"noreferrer" target=3D"_blank">gpsd_3.20.bb</a><br>
+++ b/meta-oe/recipes-navigation/gpsd/<a href=3D"http://gpsd_3.20.bb" rel=
=3D"noreferrer" target=3D"_blank">gpsd_3.20.bb</a><br>
@@ -35,6 +35,7 @@ EXTRA_OESCONS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0systemd=3D&#39;${SYSTEMD_OESCONS}&#39; \<br>
=C2=A0 =C2=A0 =C2=A0libdir=3D&#39;${libdir}&#39; \<br>
=C2=A0 =C2=A0 =C2=A0manbuild=3D&#39;false&#39; \<br>
+=C2=A0 =C2=A0 LINK=3D&#39;${CC}&#39; \<br>
=C2=A0 =C2=A0 =C2=A0${PACKAGECONFIG_CONFARGS} \<br>
=C2=A0&quot;<br>
=C2=A0# this cannot be used, because then chrpath is not found and only st=
atic lib is built<br>
@@ -44,6 +45,7 @@ do_compile_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0export PKG_CONFIG_PATH=3D&quot;${PKG_CONFIG_PATH}&quot=
;<br>
=C2=A0 =C2=A0 =C2=A0export PKG_CONFIG=3D&quot;PKG_CONFIG_SYSROOT_DIR=3D\&q=
uot;${PKG_CONFIG_SYSROOT_DIR}\&quot; pkg-config&quot;<br>
=C2=A0 =C2=A0 =C2=A0export STAGING_PREFIX=3D&quot;${STAGING_DIR_HOST}/${pr=
efix}&quot;<br>
+=C2=A0 =C2=A0 export LD=3D&quot;${CC}&quot;<br>
=C2=A0 =C2=A0 =C2=A0export LINKFLAGS=3D&quot;${LDFLAGS}&quot;<br>
=C2=A0}<br>
<br>
@@ -51,6 +53,7 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0export PKG_CONFIG_PATH=3D&quot;${PKG_CONFIG_PATH}&quot=
;<br>
=C2=A0 =C2=A0 =C2=A0export PKG_CONFIG=3D&quot;PKG_CONFIG_SYSROOT_DIR=3D\&q=
uot;${PKG_CONFIG_SYSROOT_DIR}\&quot; pkg-config&quot;<br>
=C2=A0 =C2=A0 =C2=A0export STAGING_PREFIX=3D&quot;${STAGING_DIR_HOST}/${pr=
efix}&quot;<br>
+=C2=A0 =C2=A0 export LD=3D&quot;${CC}&quot;<br>
=C2=A0 =C2=A0 =C2=A0export LINKFLAGS=3D&quot;${LDFLAGS}&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0export DESTDIR=3D&quot;${D}&quot;<br>
-- <br>
2.26.2<br>
<br>
<br>
</blockquote></div></div>

--0000000000004eb04d05a5aee41e--
