Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45050C7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 17:07:27 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.1135.1750266438715961751
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Jun 2025 10:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aebajN5G;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so9426605e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Jun 2025 10:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1750266437; x=1750871237; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dhSILIyjqE2Jh0zYK00E2aaaIe+LLrnDFq1A1XgLnbA=;
        b=aebajN5GxWP7XJo/3cY9FgCU/iRAzmNVvE4tUsWU9WZA6fSgEkZUy1ETVHEdemR7vI
         EsAU6pM2niVhaPryYd7CcKulLHr0RgE0esSmu/lLqgvnAFXO3pW/K/f4LwwY2FI0nvHm
         YWOmYI1ZTTCdvkgvh5OA12xU9KdrlqQKTh1QU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750266437; x=1750871237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhSILIyjqE2Jh0zYK00E2aaaIe+LLrnDFq1A1XgLnbA=;
        b=eoPI9MNhpo5C1tyHrdq/a0CEqFNe8ZV8o+8406W4YgJ3xJdjf5XiI18z1o7B7HwB5B
         NC/GBgFCgXQJl0QDLliF1HFBAxAzfPgJ3VGPsOC+9Tri9YLzlcW+5iz6DHifCxTYtyxr
         Kl9hayTCZ5ai96u3uMOsW/v5Ksf/cW6jG7wrK1iLKGp35m2K8s2IOH1xVzO6hzTXDTFq
         akVqXygN3jWV0LSbVdEOXYU+GJEKzXnxTwwR2DCg4QCfd5Epd/vgNpo0yyasTY35JSjD
         sBHCM5MrL6wypNvzYLDwsb9twsmwTSSg3h32aHsEBVHnethoTonKQVwJvwj+k4a3Wm9j
         nfJA==
X-Gm-Message-State: AOJu0YzGjJBMN20zwuXCCxUwsTEpLRbKvLuLwLl8ZtH/MGHv4MHQsPrP
	BZh5iUjXlcBKCa4mCexjIpdYma0Mwmpn5W+Aec9DigL5nVj8hEsWJ0IAbt5yUdBcgJ1W7Huc/F4
	Rfs72C5zo0sgmQshxABlGpgcMaAIVYEHO2qhUUsn0cw==
X-Gm-Gg: ASbGncvFYi20Pp2bWWtOTuLqOSD+tzCwwH/Fl/+kdwtYi/3NN7ChuNeO0o1yYRRKfpX
	RUJhpfpdPPqMh9Jr+12J483ifaGR2O6hY4gCfQ9X8pAi1OpW5VNDcDCCNGGG/iBtYkELwg9fGn5
	hxY4PN13htsA0bChowqxYE9vJykvdiZ0aDSekUFiHWA+wV8D/CXg==
X-Google-Smtp-Source: AGHT+IFAPmflUW5hCxpBiY8Aix7QgmX1n3ouYy1f7sKzgkAlIBkXMrSJ3YE3SWdU6LqegFS21/+cg+GTB5/XwrHGFzU=
X-Received: by 2002:a05:600c:a11c:b0:43c:ed33:a500 with SMTP id
 5b1f17b1804b1-4535ec65683mr3054965e9.10.1750266436556; Wed, 18 Jun 2025
 10:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250617061552.161683-1-Qi.Chen@windriver.com>
In-Reply-To: <20250617061552.161683-1-Qi.Chen@windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 18 Jun 2025 19:06:49 +0200
X-Gm-Features: Ac12FXwSZ4aiCPK7IDM8nlWdkp7yKyw8B8DFE1X6Zh2wDTRB4twyFotbXwG4-Ck
Message-ID: <CAMSfU+5XZj4rt+ut1-11y0X32YueBapGHGHw9sy=hZiYUgxJ3w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] suitesparse: do not use := to avoid parsing error
To: Qi.Chen@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000036cdb30637dba90c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Jun 2025 17:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117943

--00000000000036cdb30637dba90c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 17 juin 2025 =C3=A0 08:16, Chen Qi via lists.openembedded.org <Qi.C=
hen=3D
windriver.com@lists.openembedded.org> a =C3=A9crit :

> From: Chen Qi <Qi.Chen@windriver.com>
>
> There's really no need to use ":=3D", and it is now causing parsing
> error because CC is defined in base.bbclasss using:
>
>   inherit_defer toolchain/${TOOLCHAIN}
>

Hello,

While it does fix the parsing issue, this patch do change the CC value used
by the recipe:
$ bitbake-getvar CC -r suitesparse
# $CC [4 operations]
#   exported ast.py:67 [eval]
#     [export] "1"
#   exported
/home/yocon/Documents/projets/yocto/poky/meta-openembedded/meta-oe/recipes-=
devtools/suitesparse/
suitesparse_5.10.1.bb:23
#     [export] "1"
#   set
/home/yocon/Documents/projets/yocto/poky/meta-openembedded/meta-oe/recipes-=
devtools/suitesparse/
suitesparse_5.10.1.bb:23
#     "${@d.getVar('CC').split()[0]}"
#   set
/home/yocon/Documents/projets/yocto/poky/meta/classes/toolchain/gcc.bbclass=
:1
#     "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
# pre-expansion value:
#   "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
export CC=3D"x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -mss=
e3
-mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat
-Wformat-security -Werror=3Dformat-security
--sysroot=3D/home/yocon/Documents/projets/yocto/poky/build-master/tmp/work/=
core2-64-poky-linux/suitesparse/5.10.1/recipe-sysroot"

^ the value from gcc.bbclass overwrite the value se from the recipe


> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../suitesparse/suitesparse_5.10.1.bb                | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
> b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
> index 13e6fd066c..7b194790a3 100644
> --- a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
> +++ b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
> @@ -19,14 +19,14 @@ RPROVIDES:${PN} =3D "mongoose graphblas"
>  # the command line. To get around this problem, set these variables to
> only the
>  # program name and prepend the rest of the value onto the corresponding
> FLAGS
>  # variable.
> -CFLAGS:prepend :=3D "${@" ".join(d.getVar('CC').split()[1:])} "
> -export CC :=3D "${@d.getVar('CC').split()[0]}"
> +CFLAGS:prepend =3D "${@" ".join(d.getVar('CC').split()[1:])} "
> +export CC =3D "${@d.getVar('CC').split()[0]}"
>
> -CXXFLAGS:prepend :=3D "${@" ".join(d.getVar('CXX').split()[1:])} "
> -export CXX :=3D "${@d.getVar('CXX').split()[0]}"
> +CXXFLAGS:prepend =3D "${@" ".join(d.getVar('CXX').split()[1:])} "
> +export CXX =3D "${@d.getVar('CXX').split()[0]}"
>
> -LDFLAGS:prepend :=3D "${@" ".join(d.getVar('LD').split()[1:])} "
> -export LD :=3D "${@d.getVar('LD').split()[0]}"
> +LDFLAGS:prepend =3D "${@" ".join(d.getVar('LD').split()[1:])} "
> +export LD =3D "${@d.getVar('LD').split()[0]}"
>
>  export CMAKE_OPTIONS =3D " \
>      -DCMAKE_INSTALL_PREFIX=3D${D}${prefix} \
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117918):
> https://lists.openembedded.org/g/openembedded-devel/message/117918
> Mute This Topic: https://lists.openembedded.org/mt/113685233/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--00000000000036cdb30637dba90c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 17=
 juin 2025 =C3=A0=C2=A008:16, Chen Qi via <a href=3D"http://lists.openembed=
ded.org">lists.openembedded.org</a> &lt;Qi.Chen=3D<a href=3D"mailto:windriv=
er.com@lists.openembedded.org">windriver.com@lists.openembedded.org</a>&gt;=
 a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_=
blank">Qi.Chen@windriver.com</a>&gt;<br>
<br>
There&#39;s really no need to use &quot;:=3D&quot;, and it is now causing p=
arsing<br>
error because CC is defined in base.bbclasss using:<br>
<br>
=C2=A0 inherit_defer toolchain/${TOOLCHAIN}<br></blockquote><div><br></div>=
<div>Hello,</div><div><br></div><div>While it does fix the parsing issue, t=
his patch do change the CC value used by the recipe:</div><div>$ bitbake-ge=
tvar CC -r suitesparse</div><div># $CC [4 operations]<br># =C2=A0 exported =
ast.py:67 [eval]<br># =C2=A0 =C2=A0 [export] &quot;1&quot;<br># =C2=A0 expo=
rted /home/yocon/Documents/projets/yocto/poky/meta-openembedded/meta-oe/rec=
ipes-devtools/suitesparse/<a href=3D"http://suitesparse_5.10.1.bb:23">suite=
sparse_5.10.1.bb:23</a><br># =C2=A0 =C2=A0 [export] &quot;1&quot;<br># =C2=
=A0 set /home/yocon/Documents/projets/yocto/poky/meta-openembedded/meta-oe/=
recipes-devtools/suitesparse/<a href=3D"http://suitesparse_5.10.1.bb:23">su=
itesparse_5.10.1.bb:23</a><br># =C2=A0 =C2=A0 &quot;${@d.getVar(&#39;CC&#39=
;).split()[0]}&quot;<br># =C2=A0 set /home/yocon/Documents/projets/yocto/po=
ky/meta/classes/toolchain/gcc.bbclass:1<br># =C2=A0 =C2=A0 &quot;${CCACHE}$=
{HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}&quot;<br># pre-expansi=
on value:<br># =C2=A0 &quot;${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOO=
LCHAIN_OPTIONS}&quot;<br>export CC=3D&quot;x86_64-poky-linux-gcc =C2=A0-m64=
 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-stro=
ng =C2=A0-O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dfor=
mat-security --sysroot=3D/home/yocon/Documents/projets/yocto/poky/build-mas=
ter/tmp/work/core2-64-poky-linux/suitesparse/5.10.1/recipe-sysroot&quot;<br=
></div><div><br></div><div>^ the value from=C2=A0gcc.bbclass overwrite the =
value se from the recipe</div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../suitesparse/<a href=3D"http://suitesparse_5.10.1.bb" rel=3D"noref=
errer" target=3D"_blank">suitesparse_5.10.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 ++++++------<br>
=C2=A01 file changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/suitesparse/<a href=3D"http://suitesp=
arse_5.10.1.bb" rel=3D"noreferrer" target=3D"_blank">suitesparse_5.10.1.bb<=
/a> b/meta-oe/recipes-devtools/suitesparse/<a href=3D"http://suitesparse_5.=
10.1.bb" rel=3D"noreferrer" target=3D"_blank">suitesparse_5.10.1.bb</a><br>
index 13e6fd066c..7b194790a3 100644<br>
--- a/meta-oe/recipes-devtools/suitesparse/<a href=3D"http://suitesparse_5.=
10.1.bb" rel=3D"noreferrer" target=3D"_blank">suitesparse_5.10.1.bb</a><br>
+++ b/meta-oe/recipes-devtools/suitesparse/<a href=3D"http://suitesparse_5.=
10.1.bb" rel=3D"noreferrer" target=3D"_blank">suitesparse_5.10.1.bb</a><br>
@@ -19,14 +19,14 @@ RPROVIDES:${PN} =3D &quot;mongoose graphblas&quot;<br>
=C2=A0# the command line. To get around this problem, set these variables t=
o only the<br>
=C2=A0# program name and prepend the rest of the value onto the correspondi=
ng FLAGS<br>
=C2=A0# variable.<br>
-CFLAGS:prepend :=3D &quot;${@&quot; &quot;.join(d.getVar(&#39;CC&#39;).spl=
it()[1:])} &quot;<br>
-export CC :=3D &quot;${@d.getVar(&#39;CC&#39;).split()[0]}&quot;<br>
+CFLAGS:prepend =3D &quot;${@&quot; &quot;.join(d.getVar(&#39;CC&#39;).spli=
t()[1:])} &quot;<br>
+export CC =3D &quot;${@d.getVar(&#39;CC&#39;).split()[0]}&quot;<br>
<br>
-CXXFLAGS:prepend :=3D &quot;${@&quot; &quot;.join(d.getVar(&#39;CXX&#39;).=
split()[1:])} &quot;<br>
-export CXX :=3D &quot;${@d.getVar(&#39;CXX&#39;).split()[0]}&quot;<br>
+CXXFLAGS:prepend =3D &quot;${@&quot; &quot;.join(d.getVar(&#39;CXX&#39;).s=
plit()[1:])} &quot;<br>
+export CXX =3D &quot;${@d.getVar(&#39;CXX&#39;).split()[0]}&quot;<br>
<br>
-LDFLAGS:prepend :=3D &quot;${@&quot; &quot;.join(d.getVar(&#39;LD&#39;).sp=
lit()[1:])} &quot;<br>
-export LD :=3D &quot;${@d.getVar(&#39;LD&#39;).split()[0]}&quot;<br>
+LDFLAGS:prepend =3D &quot;${@&quot; &quot;.join(d.getVar(&#39;LD&#39;).spl=
it()[1:])} &quot;<br>
+export LD =3D &quot;${@d.getVar(&#39;LD&#39;).split()[0]}&quot;<br>
<br>
=C2=A0export CMAKE_OPTIONS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0-DCMAKE_INSTALL_PREFIX=3D${D}${prefix} \<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#117918): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/117918" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/117918</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113685233/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113685233/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--00000000000036cdb30637dba90c--

