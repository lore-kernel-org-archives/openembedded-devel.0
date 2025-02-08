Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D55C02199
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 03:01:39 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.2528.1738983693687604602
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Feb 2025 19:01:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dPq+MYHj;
 spf=pass (domain: mvista.com, ip: 209.85.208.50, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dcef27deecso3956569a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Feb 2025 19:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1738983692; x=1739588492; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5ztcZqUi794CxdfBjjtkx70DO//5lWb7c3cTLtm4CM0=;
        b=dPq+MYHjw8vanu6YakxSTLstxEEg+xRLginD8/dtDufE5nvXwktoaKWwn0NOtuwcDl
         M+mIWHewWR9sn+MadWB6UuQG8GvXiO9qchaxepVxiy1ke6HsV9qZg4JJ2QTEaxKa5F1g
         7y5iv4+AsXjZnlwFnVdSG5MFip/5uMSeXMWLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738983692; x=1739588492;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ztcZqUi794CxdfBjjtkx70DO//5lWb7c3cTLtm4CM0=;
        b=aBavk3QK59WknCRnEi5gQZox5NwYi+BwPGQ16pUigVnIg/Zp+VGx6WIxFK8uId6zQZ
         0t8tGsgiofEhvbfzEyPmBBnhGDwCQcoa4Li6/iwI4Ht/b9KKjlaWzwUZ0kPisn2VurQC
         1jbWT4ujJ7rFED2XDqbvFoS2QhireRIq2bj0ziRR3eh98EN8Erx/UplaINhbOmFTjO7a
         uJV5OlbntSU5DCnGq5UWgUY0RqrMWoORpmaOjxpxrlo88Xw3Dr1fklYBtwsZlRie3yf9
         wKTtCCbVrH6TcOi4aiuw0wn30SpK5tAT9kwFy+GBiWdskFXMuEwfekzw/D3oaXKOCW/V
         kr/w==
X-Gm-Message-State: AOJu0YxPEx6iTS+ND90DJEsIxSi+wnatHSQPNgQjHT344bCqlvY2ksPq
	Wr6LpfIJyoPrjEcVtAWWlBK1kWeMaClRU37ELvZbrLPdynPeLYsPzjJKWTkR7a89j5a+fVjDaDB
	us611zLEINQLanjS1WkSwmMCGS5MFxpKR9Tc2JqrQmWz8cDue
X-Gm-Gg: ASbGncsRbLWMNazcxypku8Q6mclhle0RpBvAVvLanDmU/ktLJ9V6Wrz2rwBGWh/eHr9
	8bDk15flfNgLfsnsWlqe5SS03RrOMpWSrWbLJeQbdl1ylbhKCeUajQ6wG1ukrMiDCCJbFOIYM3I
	AFuHGAKPoyGPgpYZq+8CIYusb1DlK7uf4=
X-Google-Smtp-Source: AGHT+IGHZEQTQMKuy3TfgmrWMBdHKg9PL7Cbkd9y389ZiPnx7EbFqrjibiu3Jv6IlYlhvStR9EasnbF39DnBT0Tci5E=
X-Received: by 2002:a05:6402:3907:b0:5da:d76:7b2e with SMTP id
 4fb4d7f45d1cf-5de44e5e879mr6544108a12.0.1738983690958; Fri, 07 Feb 2025
 19:01:30 -0800 (PST)
MIME-Version: 1.0
References: <20250113100435.141849-1-vanusuri@mvista.com>
In-Reply-To: <20250113100435.141849-1-vanusuri@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Sat, 8 Feb 2025 08:31:19 +0530
X-Gm-Features: AWEUYZkwsJvJ-y1Bj1GXCNScFe6IqWl0xGg2y3i_6PJRadzayevJpYEDpoCW0Ds
Message-ID: <CANQUz188mV-Ktx+PpdAs5EzuRSZK378gjEydL3EksLT3Dn5H+w@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH] openjpeg: upgrade 2.5.0 -> 2.5.3
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002b93e9062d98b1e0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Feb 2025 03:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115307

--0000000000002b93e9062d98b1e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Any Update on this ?

Thanks & Regards,
Vijay

On Mon, Jan 13, 2025 at 3:34=E2=80=AFPM <vanusuri@mvista.com> wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Includes fix for CVE-2024-56826 and CVE-2024-56827
>
> ChangeLog:
> https://github.com/uclouvain/openjpeg/blob/v2.5.3/NEWS.md
>
> * Refresh 0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  ...sk-cmake-to-export-binaries-they-don-t-make-.patch} | 10 +++++-----
>  .../openjpeg/{openjpeg_2.5.0.bb =3D> openjpeg_2.5.3.bb}  |  4 ++--
>  2 files changed, 7 insertions(+), 7 deletions(-)
>  rename
> meta-oe/recipes-graphics/openjpeg/openjpeg/{0002-Do-not-ask-cmake-to-expo=
rt-binaries-they-don-t-make-.patch
> =3D> 0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch} (75=
%)
>  rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.5.0.bb =3D>
> openjpeg_2.5.3.bb} (82%)
>
> diff --git
> a/meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-cmake-to-exp=
ort-binaries-they-don-t-make-.patch
> b/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Do-not-ask-cmake-to-exp=
ort-binaries-they-don-t-make-.patch
> similarity index 75%
> rename from
> meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-cmake-to-expor=
t-binaries-they-don-t-make-.patch
> rename to
> meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Do-not-ask-cmake-to-expor=
t-binaries-they-don-t-make-.patch
> index 0ba13cf88..2e25ecc7e 100644
> ---
> a/meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-cmake-to-exp=
ort-binaries-they-don-t-make-.patch
> +++
> b/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Do-not-ask-cmake-to-exp=
ort-binaries-they-don-t-make-.patch
> @@ -1,4 +1,4 @@
> -From 4681de07e21f17aa28710d3a51fabe7da60463f9 Mon Sep 17 00:00:00 2001
> +From 805ce4d40c5aaae12aa73452ff07babe8eb43a62 Mon Sep 17 00:00:00 2001
>  From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
>  Date: Fri, 28 Sep 2018 00:38:50 +0200
>  Subject: [PATCH] Do not ask cmake to export binaries - they don't make i=
t
> @@ -15,17 +15,17 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gma=
il.com
> >
>   1 file changed, 1 deletion(-)
>
>  diff --git a/src/bin/jp2/CMakeLists.txt b/src/bin/jp2/CMakeLists.txt
> -index 4324c36d..2c11fe02 100644
> +index 26156bcb..9eff04aa 100644
>  --- a/src/bin/jp2/CMakeLists.txt
>  +++ b/src/bin/jp2/CMakeLists.txt
> -@@ -66,7 +66,6 @@ foreach(exe opj_decompress opj_compress opj_dump)
> +@@ -64,7 +64,6 @@ foreach(exe opj_decompress opj_compress opj_dump)
>     endif()
>     # Install exe
>     install(TARGETS ${exe}
>  -    EXPORT OpenJPEGTargets
> -     DESTINATION ${OPENJPEG_INSTALL_BIN_DIR} COMPONENT Applications
> +     DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT Applications
>     )
>     if(OPJ_USE_DSYMUTIL)
>  --
> -2.14.4
> +2.25.1
>
> diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb
> b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
> similarity index 82%
> rename from meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb
> rename to meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
> index f2d74078e..231bf8457 100644
> --- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb
> +++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
> @@ -6,9 +6,9 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dc648878b4840d7babaade1303e7f108c"
>  DEPENDS =3D "libpng tiff lcms zlib"
>
>  SRC_URI =3D "git://
> github.com/uclouvain/openjpeg.git;branch=3Dmaster;protocol=3Dhttps \
> -
>  file://0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
> +
>  file://0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
>             "
> -SRCREV =3D "a5891555eb49ed7cc26b2901ea680acda136d811"
> +SRCREV =3D "210a8a5690d0da66f02d49420d7176a21ef409dc"
>  S =3D "${WORKDIR}/git"
>
>  inherit cmake
> --
> 2.25.1
>
>

--0000000000002b93e9062d98b1e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Team,</div><div><br></div><div>Any Update on this =
?<br><br></div><div>Thanks &amp; Regards,<br></div><div>Vijay<br></div></di=
v><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Mon, Jan 13, 2025 at 3:34=E2=80=AFPM &lt;<a href=3D"ma=
ilto:vanusuri@mvista.com">vanusuri@mvista.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">From: Vijay Anusuri &lt;<a hre=
f=3D"mailto:vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&=
gt;<br>
<br>
Includes fix for CVE-2024-56826 and CVE-2024-56827<br>
<br>
ChangeLog:<br>
<a href=3D"https://github.com/uclouvain/openjpeg/blob/v2.5.3/NEWS.md" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/uclouvain/openjpeg/blo=
b/v2.5.3/NEWS.md</a><br>
<br>
* Refresh 0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch<b=
r>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0...sk-cmake-to-export-binaries-they-don-t-make-.patch} | 10 +++++----=
-<br>
=C2=A0.../openjpeg/{<a href=3D"http://openjpeg_2.5.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">openjpeg_2.5.0.bb</a> =3D&gt; <a href=3D"http://openjpeg=
_2.5.3.bb" rel=3D"noreferrer" target=3D"_blank">openjpeg_2.5.3.bb</a>}=C2=
=A0 |=C2=A0 4 ++--<br>
=C2=A02 files changed, 7 insertions(+), 7 deletions(-)<br>
=C2=A0rename meta-oe/recipes-graphics/openjpeg/openjpeg/{0002-Do-not-ask-cm=
ake-to-export-binaries-they-don-t-make-.patch =3D&gt; 0001-Do-not-ask-cmake=
-to-export-binaries-they-don-t-make-.patch} (75%)<br>
=C2=A0rename meta-oe/recipes-graphics/openjpeg/{<a href=3D"http://openjpeg_=
2.5.0.bb" rel=3D"noreferrer" target=3D"_blank">openjpeg_2.5.0.bb</a> =3D&gt=
; <a href=3D"http://openjpeg_2.5.3.bb" rel=3D"noreferrer" target=3D"_blank"=
>openjpeg_2.5.3.bb</a>} (82%)<br>
<br>
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-cma=
ke-to-export-binaries-they-don-t-make-.patch b/meta-oe/recipes-graphics/ope=
njpeg/openjpeg/0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.pa=
tch<br>
similarity index 75%<br>
rename from meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-cmak=
e-to-export-binaries-they-don-t-make-.patch<br>
rename to meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Do-not-ask-cmake-=
to-export-binaries-they-don-t-make-.patch<br>
index 0ba13cf88..2e25ecc7e 100644<br>
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-cmake-to-e=
xport-binaries-they-don-t-make-.patch<br>
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Do-not-ask-cmake-to-e=
xport-binaries-they-don-t-make-.patch<br>
@@ -1,4 +1,4 @@<br>
-From 4681de07e21f17aa28710d3a51fabe7da60463f9 Mon Sep 17 00:00:00 2001<br>
+From 805ce4d40c5aaae12aa73452ff07babe8eb43a62 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D &lt;<a href=3D"mail=
to:schnitzeltony@gmail.com" target=3D"_blank">schnitzeltony@gmail.com</a>&g=
t;<br>
=C2=A0Date: Fri, 28 Sep 2018 00:38:50 +0200<br>
=C2=A0Subject: [PATCH] Do not ask cmake to export binaries - they don&#39;t=
 make it<br>
@@ -15,17 +15,17 @@ Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailt=
o:schnitzeltony@gmail.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt=
;<br>
=C2=A0 1 file changed, 1 deletion(-)<br>
<br>
=C2=A0diff --git a/src/bin/jp2/CMakeLists.txt b/src/bin/jp2/CMakeLists.txt<=
br>
-index 4324c36d..2c11fe02 100644<br>
+index 26156bcb..9eff04aa 100644<br>
=C2=A0--- a/src/bin/jp2/CMakeLists.txt<br>
=C2=A0+++ b/src/bin/jp2/CMakeLists.txt<br>
-@@ -66,7 +66,6 @@ foreach(exe opj_decompress opj_compress opj_dump)<br>
+@@ -64,7 +64,6 @@ foreach(exe opj_decompress opj_compress opj_dump)<br>
=C2=A0 =C2=A0 endif()<br>
=C2=A0 =C2=A0 # Install exe<br>
=C2=A0 =C2=A0 install(TARGETS ${exe}<br>
=C2=A0-=C2=A0 =C2=A0 EXPORT OpenJPEGTargets<br>
-=C2=A0 =C2=A0 =C2=A0DESTINATION ${OPENJPEG_INSTALL_BIN_DIR} COMPONENT Appl=
ications<br>
+=C2=A0 =C2=A0 =C2=A0DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT Applicat=
ions<br>
=C2=A0 =C2=A0 )<br>
=C2=A0 =C2=A0 if(OPJ_USE_DSYMUTIL)<br>
=C2=A0-- <br>
-2.14.4<br>
+2.25.1<br>
<br>
diff --git a/meta-oe/recipes-graphics/openjpeg/<a href=3D"http://openjpeg_2=
.5.0.bb" rel=3D"noreferrer" target=3D"_blank">openjpeg_2.5.0.bb</a> b/meta-=
oe/recipes-graphics/openjpeg/<a href=3D"http://openjpeg_2.5.3.bb" rel=3D"no=
referrer" target=3D"_blank">openjpeg_2.5.3.bb</a><br>
similarity index 82%<br>
rename from meta-oe/recipes-graphics/openjpeg/<a href=3D"http://openjpeg_2.=
5.0.bb" rel=3D"noreferrer" target=3D"_blank">openjpeg_2.5.0.bb</a><br>
rename to meta-oe/recipes-graphics/openjpeg/<a href=3D"http://openjpeg_2.5.=
3.bb" rel=3D"noreferrer" target=3D"_blank">openjpeg_2.5.3.bb</a><br>
index f2d74078e..231bf8457 100644<br>
--- a/meta-oe/recipes-graphics/openjpeg/<a href=3D"http://openjpeg_2.5.0.bb=
" rel=3D"noreferrer" target=3D"_blank">openjpeg_2.5.0.bb</a><br>
+++ b/meta-oe/recipes-graphics/openjpeg/<a href=3D"http://openjpeg_2.5.3.bb=
" rel=3D"noreferrer" target=3D"_blank">openjpeg_2.5.3.bb</a><br>
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc648878b484=
0d7babaade1303e7f108c&quot;<br>
=C2=A0DEPENDS =3D &quot;libpng tiff lcms zlib&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/uclouvain/openjp=
eg.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blan=
k">github.com/uclouvain/openjpeg.git;branch=3Dmaster;protocol=3Dhttps</a> \=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Do-not-ask-cmake-to-e=
xport-binaries-they-don-t-make-.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Do-not-ask-cmake-to-e=
xport-binaries-they-don-t-make-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRCREV =3D &quot;a5891555eb49ed7cc26b2901ea680acda136d811&quot;<br>
+SRCREV =3D &quot;210a8a5690d0da66f02d49420d7176a21ef409dc&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit cmake<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--0000000000002b93e9062d98b1e0--

