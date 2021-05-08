Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.3963.1620462387158074259
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 May 2021 01:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BlNgmrU6;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id w3so17104613ejc.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 May 2021 01:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=umK2pmAxbhB1mVAX+oQ1MILsnhtSyvfkws4h4W9VSXg=;
        b=BlNgmrU62XYc6828Hp+xfZUpPozJq1MLSDHToTUCawStULZU8qWshMxKYNVonL6Wkl
         LnhPd0AU7Jt/uqHXmGaQpqC/U1ALnsvG9AqheHClbOL702IwbtcqzAquBOIDQWfc/w9O
         XF9dzkL3r7v5f4iCGT7UVwBmimmFmQaXvAlnoAgRW+D0Mjo7bvUI5ZNrU68g8D7J9qM6
         vtax55e4VF2E9Hhw5cbiEk0m+pnW1GlilLWYNl1g/6b45xI/+QDmrfAZRFb9jhOAH4aX
         Pk6RbDRl4tKIi8yACfN8yNLizriAxzyENtJMgvJCmNe0AHr7yxJW0Oc6o0IIX6AT3m+M
         Gl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=umK2pmAxbhB1mVAX+oQ1MILsnhtSyvfkws4h4W9VSXg=;
        b=c4+DD6zDd37+AjAP6OmzXNfj/RuHwWWEM99ZdkFBjDmhPYSbmUxunXN6Zf1mMV8nZ0
         t/anU9znLwbIlmRbM7+Iky6CFiIs5SKAlG3i0Zk9mh/dPQlabH7acjY1Xzz8ZK9dMeKJ
         SHeWTMLca9a0VxmqhtRz0EM/cpCSXlL1ZcTiIuQZDMss0wZO/jut5KjHKTy9IXSVzkZi
         pOieYD90U/lyBgVsQ+350R82GO9ripWvHgjqNrxC01c302EXtf9hGvp0yAVkEz4/917w
         gbLlClYU4ZAfHWpznaQE3FE1V7klimDmCJ4TFQMX2x1DVejGAjNv53QQeixR1ZwQ/BLD
         INEA==
X-Gm-Message-State: AOAM532caiFN5WfRAjwec/fQOsLQk3N7xleDPdRvBu0xpT5Wndn6MFW0
	ocBIoUpFZXsoWOUo5d/ub5gbjSK5ZYKP+8QCzQM=
X-Google-Smtp-Source: ABdhPJzZIxDkVDPG8qEjF+WFhJq6G6kmyL2DQwfK/6T+hwmG//X287i1KA/XycOAc2eair8mgEJjImmK5hJ0/SjkXsw=
X-Received: by 2002:a17:906:3458:: with SMTP id d24mr15089186ejb.54.1620462385565;
 Sat, 08 May 2021 01:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210508054942.1527640-1-raj.khem@gmail.com>
In-Reply-To: <20210508054942.1527640-1-raj.khem@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sat, 8 May 2021 10:26:14 +0200
Message-ID: <CA+chaQeBTJCYy3igBjD_Zf_+xKGVoNcnqnC7dU7oQEpCP0fJTQ@mail.gmail.com>
Subject: Re: [meta-python][PATCH] python3-m2crypto: Pass correct ABI defines to swig
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000dd155405c1cd4cc3"

--000000000000dd155405c1cd4cc3
Content-Type: text/plain; charset="UTF-8"

Thanks, this works in my setup (qemuarm64 + oe-core default) as well.

Can you drop most of do_configure_prepend with this? (Also small typo in
commit message 'currenrly' and 'wtong')

On Sat, May 8, 2021 at 7:49 AM Khem Raj <raj.khem@gmail.com> wrote:

> This ensures that WORDSIZE is as per the target, currenrly this does not
> get it right for cross compiling, and OE uses multilib headers by
> default which means if WORDSIZE is wrong it will go on to include wtong
> headers due to these artificial stubs
>
> Fixes
> swig -python -py3
> -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../lib/aarch64-oe-linux/gcc/aarch64-oe-linux/11.1.0/include
> -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../lib/aarch64-oe-linux/gcc/aarch64-oe-linux/11.1.0/include-fixed
> -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/lib/aarch64-oe-linux/11.1.0/include
> -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include
> -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include
> -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include/python3.9
> -I/usr/include/openssl -includeall -modern -builtin -outdir
> TOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/M2Crypto-0.37.1/M2Crypto
> -o SWIG/_m2crypto_wrap.c SWIG/_m2crypto.i
>
> TOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include/openssl/opensslconf.h:23:
> Error: Unable to find 'openssl/opensslconf-32.h'
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../recipes-devtools/python/python3-m2crypto_0.37.1.bb        | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-m2crypto_0.37.1.bb b/meta-python/recipes-devtools/python/
> python3-m2crypto_0.37.1.bb
> index 896d9d2cc4..305987d4f0 100644
> --- a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
> @@ -33,7 +33,9 @@ DISTUTILS_INSTALL_ARGS += "build_ext
> --openssl=${STAGING_EXECPREFIXDIR}"
>
>  SWIG_FEATURES_x86 = "-D__i386__"
>  SWIG_FEATURES_x32 = "-D__ILP32__"
> -SWIG_FEATURES ?= "-D__${HOST_ARCH}__"
> +
> +SWIG_FEATURES ?= "-D__${HOST_ARCH}__
> ${@['-D__ILP32__','-D__LP64__'][d.getVar('SITEINFO_BITS') != '32']}"
> +
>  export SWIG_FEATURES
>
>  # Get around a problem with swig, but only if the
> --
> 2.31.1
>
>

--000000000000dd155405c1cd4cc3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, this works in my setup (qemuarm64 + oe-core defaul=
t) as well.<div><br></div><div>Can you drop most of do_configure_prepend wi=
th this? (Also small typo in commit message &#39;currenrly&#39; and &#39;wt=
ong&#39;)</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, May 8, 2021 at 7:49 AM Khem Raj &lt;<a href=3D"mail=
to:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">This ensures that WORDSIZE is as p=
er the target, currenrly this does not<br>
get it right for cross compiling, and OE uses multilib headers by<br>
default which means if WORDSIZE is wrong it will go on to include wtong<br>
headers due to these artificial stubs<br>
<br>
Fixes<br>
swig -python -py3 -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2cryp=
to/0.37.1-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../lib/aarch=
64-oe-linux/gcc/aarch64-oe-linux/11.1.0/include -ITOPDIR/tmp-glibc/work/cor=
texa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot-native/usr/bin/aa=
rch64-oe-linux/../../lib/aarch64-oe-linux/gcc/aarch64-oe-linux/11.1.0/inclu=
de-fixed -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1=
-r0/recipe-sysroot/usr/lib/aarch64-oe-linux/11.1.0/include -ITOPDIR/tmp-gli=
bc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/in=
clude -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0=
/recipe-sysroot/usr/include -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/pyth=
on3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include/python3.9 -I/usr/include/=
openssl -includeall -modern -builtin -outdir TOPDIR/tmp-glibc/work/cortexa5=
7-oe-linux/python3-m2crypto/0.37.1-r0/M2Crypto-0.37.1/M2Crypto -o SWIG/_m2c=
rypto_wrap.c SWIG/_m2crypto.i<br>
=C2=A0 TOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/=
recipe-sysroot/usr/include/openssl/opensslconf.h:23: Error: Unable to find =
&#39;openssl/opensslconf-32.h&#39;<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_b=
lank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-m2crypto_0.37.1=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto_0.37.1.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
m2crypto_0.37.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto_0=
.37.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-m2crypto_0.37.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto=
_0.37.1.bb</a><br>
index 896d9d2cc4..305987d4f0 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-m2crypt=
o_0.37.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto_0.37.1.b=
b</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-m2crypt=
o_0.37.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto_0.37.1.b=
b</a><br>
@@ -33,7 +33,9 @@ DISTUTILS_INSTALL_ARGS +=3D &quot;build_ext --openssl=3D$=
{STAGING_EXECPREFIXDIR}&quot;<br>
<br>
=C2=A0SWIG_FEATURES_x86 =3D &quot;-D__i386__&quot;<br>
=C2=A0SWIG_FEATURES_x32 =3D &quot;-D__ILP32__&quot;<br>
-SWIG_FEATURES ?=3D &quot;-D__${HOST_ARCH}__&quot;<br>
+<br>
+SWIG_FEATURES ?=3D &quot;-D__${HOST_ARCH}__ ${@[&#39;-D__ILP32__&#39;,&#39=
;-D__LP64__&#39;][d.getVar(&#39;SITEINFO_BITS&#39;) !=3D &#39;32&#39;]}&quo=
t;<br>
+<br>
=C2=A0export SWIG_FEATURES<br>
<br>
=C2=A0# Get around a problem with swig, but only if the<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div>

--000000000000dd155405c1cd4cc3--
