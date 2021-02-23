Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.248.1614101005361946662
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 09:23:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AiVtFleD;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id t11so35711407ejx.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Feb 2021 09:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wO1SKy7ZEby2Ii95KCmfoZe6SpCchgrBmwCAg5gWG+s=;
        b=AiVtFleDk6wzc80yT3JQvR76u0qB93evT7QswaYtcPfFgZT3d3iZ3NCwV4AExJoCC/
         F4sEC+MPTuQxYBmaH2qCsF0oI5D4wvwjqwPJP6eB6SWrJ0r90o4TPCHNst5nPlzmP948
         QCLxGXc8MvAOijdrx+IWp6E06zjZ73t2J6eDvkc3svHB/EjAw/RMcMmn2JC06PJyQleh
         WOhZIStmdu/THsmYzsEWScXi2WRXmeo6QyEgWagjx5/9YoWUqwxHMPN2u6t4F1Ad97Tr
         0rST12+0yBjMIWyZNEIFLtwYdAOYX75KGF99WUvyvlchn7z5XwDYgroX2j4Xwee1lenA
         JAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wO1SKy7ZEby2Ii95KCmfoZe6SpCchgrBmwCAg5gWG+s=;
        b=ksR/Oct2OlsW5jqLvpyWiqFkfbES+OCrgvdwW3wP0bFMTluzKQ0aV2boBbreyQA6lq
         k68qYbwocX79Tp6T/TalptZejLb/9Fxi5iFUrcZ5966Da/cdjqiPxAv4t++oRkviPOAv
         AvHqdtSXbvyXpGtB3DItpke2u51bYFxHjA8OS8RH0IbsxOQABb0vlTFRXDun38jAVhkY
         EE9R2nBi9s6YMRSfJKpQLPcBjZ2g/XUo30y5pnwpA0uEDe0dpbsoHWybqoABzaiymdqL
         +IuLhMyBtlBLuZxN3DuRgqTKnERbCpmUjG+mJ97KKss9qm+okEIqb+joKKGldlYGeYVz
         1lww==
X-Gm-Message-State: AOAM531Skdrdd2/rQebr3PJjEAGkoyfSlpM0fMIZqCpviwqwN/hp5yO2
	ttWt3Vjp6HZrkSOIaI22art56Y3BNcCXTUP1mcs=
X-Google-Smtp-Source: ABdhPJxc0e0B784ZLmwkMhgLgYRL5N+15d9SCi+lmCEcnp0UBqW3xbU9JV3qvfRt4jpMJ7zsXIl4dOOWN60H83RIMck=
X-Received: by 2002:a17:906:5902:: with SMTP id h2mr26584987ejq.137.1614101003796;
 Tue, 23 Feb 2021 09:23:23 -0800 (PST)
MIME-Version: 1.0
References: <20210219125845.29016-1-anbelski@linux.microsoft.com>
In-Reply-To: <20210219125845.29016-1-anbelski@linux.microsoft.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 23 Feb 2021 18:23:12 +0100
Message-ID: <CA+chaQet99T0kZVYCr53BODYUAh0Ra4d-yo6cH8redOpteL6Sg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] abseil-cpp: Relax build requirements
To: Anatol Belski <anbelski@linux.microsoft.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f682f805bc042cc5"

--000000000000f682f805bc042cc5
Content-Type: text/plain; charset="UTF-8"

You should remove abseil-cpp from the _remove in the packagegroup as well,
see:

meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb:RDEPENDS_packagegroup-meta-oe-devtools_remove_aarch64
= "${@bb.utils.contains("TUNE_FEATURES", "crypto", "", "abseil-cpp", d)}
concurrencykit"
meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb:RDEPENDS_packagegroup-meta-oe-devtools_remove_x86-64
= "${@bb.utils.contains("TUNE_FEATURES", "corei7", "", "abseil-cpp", d)}"

Please send follow-up patch.

On Fri, Feb 19, 2021 at 1:59 PM Anatol Belski <anbelski@linux.microsoft.com>
wrote:

> While better hardware acceleration is definitely advantageous, there is no
> hard requirement defined by the upstream. Removing this will allow
> builds targeting older hardware where DEFAULTTUNE can't be changed. If
> found useful, this can also be backported to lower branches.
>
> Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
> ---
>  .../abseil-cpp/abseil-cpp_git.bb              | 24 -------------------
>  1 file changed, 24 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> index cc7bf01d73..7d935d523b 100644
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> @@ -34,27 +34,3 @@ ALLOW_EMPTY_${PN} = "1"
>  FILES_${PN} = "${libdir}/libabsl_*.so ${libdir}/cmake"
>  FILES_${PN}-dev = "${includedir}"
>
> -python () {
> -    arch = d.getVar("TARGET_ARCH")
> -
> -    if arch == "aarch64":
> -        tunes = d.getVar("TUNE_FEATURES")
> -        if not tunes:
> -            raise bb.parse.SkipRecipe("%s-%s Needs support for crypto on
> armv8" % (pkgn, pkgv))
> -            return
> -        pkgn = d.getVar("PN")
> -        pkgv = d.getVar("PV")
> -        if "crypto" not in tunes:
> -            raise bb.parse.SkipRecipe("%s-%s Needs support for crypto on
> armv8" % (pkgn, pkgv))
> -
> -    if arch == "x86_64":
> -        tunes = d.getVar("TUNE_FEATURES")
> -        if not tunes:
> -           raise bb.parse.SkipRecipe("%s-%s Needs support for corei7 on
> x86_64" % (pkgn, pkgv))
> -           return
> -        pkgn = d.getVar("PN")
> -        pkgv = d.getVar("PV")
> -        if "corei7" not in tunes:
> -            raise bb.parse.SkipRecipe("%s-%s Needs support for corei7 on
> x86_64" % (pkgn, pkgv))
> -
> -}
> --
> 2.17.1
>
>
> 
>
>

--000000000000f682f805bc042cc5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You should remove abseil-cpp from the _remove in the packa=
gegroup as well, see:<div><br><div>meta-oe/recipes-core/packagegroups/packa=
gegroup-meta-oe.bb:RDEPENDS_packagegroup-meta-oe-devtools_remove_aarch64 =
=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;, &quot;crypto&quo=
t;, &quot;&quot;, &quot;abseil-cpp&quot;, d)} concurrencykit&quot;<br>meta-=
oe/recipes-core/packagegroups/packagegroup-meta-oe.bb:RDEPENDS_packagegroup=
-meta-oe-devtools_remove_x86-64 =3D &quot;${@bb.utils.contains(&quot;TUNE_F=
EATURES&quot;, &quot;corei7&quot;, &quot;&quot;, &quot;abseil-cpp&quot;, d)=
}&quot;<br></div></div><div><br></div><div>Please send follow-up patch.</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Fri, Feb 19, 2021 at 1:59 PM Anatol Belski &lt;<a href=3D"mailto:anbel=
ski@linux.microsoft.com">anbelski@linux.microsoft.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">While better hardware =
acceleration is definitely advantageous, there is no<br>
hard requirement defined by the upstream. Removing this will allow<br>
builds targeting older hardware where DEFAULTTUNE can&#39;t be changed. If=
<br>
found useful, this can also be backported to lower branches.<br>
<br>
Signed-off-by: Anatol Belski &lt;<a href=3D"mailto:anbelski@linux.microsof=
t.com" target=3D"_blank">anbelski@linux.microsoft.com</a>&gt;<br>
---<br>
=C2=A0.../abseil-cpp/<a href=3D"http://abseil-cpp_git.bb" rel=3D"noreferre=
r" target=3D"_blank">abseil-cpp_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 24 -------------------<br>
=C2=A01 file changed, 24 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/abseil-cpp/<a href=3D"http://abseil-=
cpp_git.bb" rel=3D"noreferrer" target=3D"_blank">abseil-cpp_git.bb</a> b/me=
ta-oe/recipes-devtools/abseil-cpp/<a href=3D"http://abseil-cpp_git.bb" rel=
=3D"noreferrer" target=3D"_blank">abseil-cpp_git.bb</a><br>
index cc7bf01d73..7d935d523b 100644<br>
--- a/meta-oe/recipes-devtools/abseil-cpp/<a href=3D"http://abseil-cpp_git=
.bb" rel=3D"noreferrer" target=3D"_blank">abseil-cpp_git.bb</a><br>
+++ b/meta-oe/recipes-devtools/abseil-cpp/<a href=3D"http://abseil-cpp_git=
.bb" rel=3D"noreferrer" target=3D"_blank">abseil-cpp_git.bb</a><br>
@@ -34,27 +34,3 @@ ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
=C2=A0FILES_${PN} =3D &quot;${libdir}/libabsl_*.so ${libdir}/cmake&quot;<b=
r>
=C2=A0FILES_${PN}-dev =3D &quot;${includedir}&quot;<br>
<br>
-python () {<br>
-=C2=A0 =C2=A0 arch =3D d.getVar(&quot;TARGET_ARCH&quot;)<br>
-<br>
-=C2=A0 =C2=A0 if arch =3D=3D &quot;aarch64&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tunes =3D d.getVar(&quot;TUNE_FEATURES&quot;)=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not tunes:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(&quot=
;%s-%s Needs support for crypto on armv8&quot; % (pkgn, pkgv))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgn =3D d.getVar(&quot;PN&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgv =3D d.getVar(&quot;PV&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;crypto&quot; not in tunes:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(&quot=
;%s-%s Needs support for crypto on armv8&quot; % (pkgn, pkgv))<br>
-<br>
-=C2=A0 =C2=A0 if arch =3D=3D &quot;x86_64&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tunes =3D d.getVar(&quot;TUNE_FEATURES&quot;)=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not tunes:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise bb.parse.SkipRecipe(&quot;=
%s-%s Needs support for corei7 on x86_64&quot; % (pkgn, pkgv))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgn =3D d.getVar(&quot;PN&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgv =3D d.getVar(&quot;PV&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;corei7&quot; not in tunes:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(&quot=
;%s-%s Needs support for corei7 on x86_64&quot; % (pkgn, pkgv))<br>
-<br>
-}<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000f682f805bc042cc5--
