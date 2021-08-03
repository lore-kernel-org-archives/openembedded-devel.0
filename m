Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.3860.1628019364594943895
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Aug 2021 12:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iAl2lA4o;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id i6so546043edu.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Aug 2021 12:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=44fkip4mpdokUUBNKQ60DWOttgfKv5AehXRU97x+12Y=;
        b=iAl2lA4ocybI6HnDb16CPjYH4hAVz/XwL5NvoDkPZXbTkAoEzW7l/H2LRfSBqKZI1z
         Aiz/OrKtiykEfv/arG1OKusf3q2REvzNSMgjf7GklvdFyc6GUVURaQyW7LQuAsRwwat7
         XWI/zlVQbEa8O8x49SEpolHXOsACwiUZ7NWDM1mFwbGQGFXWgqEOtA5yLsYLKKyskj7t
         /4wu5uc7z5NmSLNFFpl4VccyR63rJg9F/ET+Vd7Z6hfGvkfBOnlgyMt/jcua5gvqsZMq
         I62ndhc/FLOcGC91vTZ1Q0exlLFNw38iPHNgle+NPt31n7qlBJ6yoTr+01F7/IKB37Oj
         2O3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=44fkip4mpdokUUBNKQ60DWOttgfKv5AehXRU97x+12Y=;
        b=oY/ObdWWWF6oO83OSSKMwJmIisY6MOib0MNS7pT3auKswyR3BiqbSxvAApKcqlvHUj
         ZRAhS+hJPtFagVs+/aPBIf9/Qg2jMTApI0NQ1HJPAd2HUOgUEiR9djm7KIAduWxXj5xi
         PmBVgl5N4BWyZlPLQJDeD+z7ErhYV5pCZ2OXIVWW00ujCn5MsYvoUDJWznixASt2DDoX
         YOjb9xH/2Ctwwvux6Y3Sh7dhvEgr3ecMObcJwjdb8jHkfmHbc8SvS528bNIoyjKhrd0p
         NdCi5/RLgv8gA/IurLSIF73RibTmy8Gi6TvtrO3ferMkrRZkD7O/96Sj3VuElEhBVpvm
         WzGQ==
X-Gm-Message-State: AOAM530khzfNxmLJV00NsE5Mja1tJY5Us6giI+Gyp64/E0K+Ksnhv2g6
	NmDGaAe6jTMcd3sUbamYZ7unj4a9KfxwY47VvTY=
X-Google-Smtp-Source: ABdhPJzozNP07eaIaKQLVjcuspRCwWNTcRtD5YxdFxnuBAEgXqvIpvjWTRkbDK5eY54om/ka2lnht2G9X2FD1yNzKVQ=
X-Received: by 2002:aa7:d146:: with SMTP id r6mr27913220edo.264.1628019362941;
 Tue, 03 Aug 2021 12:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210803193316.2691502-1-raj.khem@gmail.com>
In-Reply-To: <20210803193316.2691502-1-raj.khem@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 3 Aug 2021 21:35:52 +0200
Message-ID: <CA+chaQfcQ5sv1aYZP+CRhbwC=VdZhJeeg3DB5t3pVZhgVtu9kg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] luajit: Fix override syntax
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d0d13105c8accb64"

--000000000000d0d13105c8accb64
Content-Type: text/plain; charset="UTF-8"

LGTM, thanks!

On Tue, Aug 3, 2021 at 9:33 PM Khem Raj <raj.khem@gmail.com> wrote:

> Do not convert the variable name resembling override setups passed to
> makefile
> Fix some of missed overrides
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-devtools/luajit/luajit_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb
> b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> index 645680cd9f..d4ff06b677 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> @@ -30,8 +30,8 @@ BUILD_CC_ARCH:append = "
> ${@['-m32',''][d.getVar('SITEINFO_BITS') != '32']}"
>  # Values: Windows, Linux, Darwin, iOS, SunOS, PS3, GNU/kFreeBSD
>  LUA_TARGET_OS = "Unknown"
>  LUA_TARGET_OS:darwin = "Darwin"
> -LUA_TARGET_OS_linux = "Linux"
> -LUA_TARGET_OS_linux-gnueabi = "Linux"
> +LUA_TARGET_OS:linux = "Linux"
> +LUA_TARGET_OS:linux-gnueabi = "Linux"
>  LUA_TARGET_OS:mingw32 = "Windows"
>
>  # We don't want the lua buildsystem's compiler optimizations, or its
> @@ -40,7 +40,7 @@ LUA_TARGET_OS:mingw32 = "Windows"
>  EXTRA_OEMAKE = "\
>      Q= E='@:' \
>      \
> -    CCOPT= CCOPT:x86= CFLAGS= LDFLAGS= TARGET_STRIP='@:' \
> +    CCOPT= CCOPT_x86= CFLAGS= LDFLAGS= TARGET_STRIP='@:' \
>      \
>      'TARGET_SYS=${LUA_TARGET_OS}' \
>      \
> --
> 2.32.0
>

--000000000000d0d13105c8accb64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">LGTM, thanks!</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Aug 3, 2021 at 9:33 PM Khem Raj &lt;<=
a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Do not convert the v=
ariable name resembling override setups passed to makefile<br>
Fix some of missed overrides<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_b=
lank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-devtools/luajit/<a href=3D"http://luajit_git.bb" rel=
=3D"noreferrer" target=3D"_blank">luajit_git.bb</a> | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/luajit/<a href=3D"http://luajit_git.b=
b" rel=3D"noreferrer" target=3D"_blank">luajit_git.bb</a> b/meta-oe/recipes=
-devtools/luajit/<a href=3D"http://luajit_git.bb" rel=3D"noreferrer" target=
=3D"_blank">luajit_git.bb</a><br>
index 645680cd9f..d4ff06b677 100644<br>
--- a/meta-oe/recipes-devtools/luajit/<a href=3D"http://luajit_git.bb" rel=
=3D"noreferrer" target=3D"_blank">luajit_git.bb</a><br>
+++ b/meta-oe/recipes-devtools/luajit/<a href=3D"http://luajit_git.bb" rel=
=3D"noreferrer" target=3D"_blank">luajit_git.bb</a><br>
@@ -30,8 +30,8 @@ BUILD_CC_ARCH:append =3D &quot; ${@[&#39;-m32&#39;,&#39;&=
#39;][d.getVar(&#39;SITEINFO_BITS&#39;) !=3D &#39;32&#39;]}&quot;<br>
=C2=A0# Values: Windows, Linux, Darwin, iOS, SunOS, PS3, GNU/kFreeBSD<br>
=C2=A0LUA_TARGET_OS =3D &quot;Unknown&quot;<br>
=C2=A0LUA_TARGET_OS:darwin =3D &quot;Darwin&quot;<br>
-LUA_TARGET_OS_linux =3D &quot;Linux&quot;<br>
-LUA_TARGET_OS_linux-gnueabi =3D &quot;Linux&quot;<br>
+LUA_TARGET_OS:linux =3D &quot;Linux&quot;<br>
+LUA_TARGET_OS:linux-gnueabi =3D &quot;Linux&quot;<br>
=C2=A0LUA_TARGET_OS:mingw32 =3D &quot;Windows&quot;<br>
<br>
=C2=A0# We don&#39;t want the lua buildsystem&#39;s compiler optimizations,=
 or its<br>
@@ -40,7 +40,7 @@ LUA_TARGET_OS:mingw32 =3D &quot;Windows&quot;<br>
=C2=A0EXTRA_OEMAKE =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0Q=3D E=3D&#39;@:&#39; \<br>
=C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 CCOPT=3D CCOPT:x86=3D CFLAGS=3D LDFLAGS=3D TARGET_STRIP=3D&#=
39;@:&#39; \<br>
+=C2=A0 =C2=A0 CCOPT=3D CCOPT_x86=3D CFLAGS=3D LDFLAGS=3D TARGET_STRIP=3D&#=
39;@:&#39; \<br>
=C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0&#39;TARGET_SYS=3D${LUA_TARGET_OS}&#39; \<br>
=C2=A0 =C2=A0 =C2=A0\<br>
--<br>
2.32.0<br>
</blockquote></div>

--000000000000d0d13105c8accb64--
