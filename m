Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A92C02198
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 12:55:49 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.20321.1739537741197609042
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Feb 2025 04:55:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gjn1FRGH;
 spf=pass (domain: mvista.com, ip: 209.85.208.54, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5dee1626093so1097207a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 04:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1739537739; x=1740142539; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a1UPlRNIK7joxOuC+KOz6BRhAXjspG3D/zy3Bu4FnwQ=;
        b=gjn1FRGHU6F0SElmM7ZaeXiOfMXIhsC3Cmr6ObN9PqAUVZqyo9G/y0vnwT+FkYAz4a
         n2qBzr7ydleWBux+Urrg4CMDm5WTlen8BfROOvC/f6WX8OqEzMFHvO9Rvn++zLuurSZI
         KhYYKS6KtrdFTQgHxMr2WfAxQ+egzPf4ZvyRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739537739; x=1740142539;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1UPlRNIK7joxOuC+KOz6BRhAXjspG3D/zy3Bu4FnwQ=;
        b=lrTs7VzD1wXqhF/TFuEirEZuQwC8/x3ryf1N/q2b28gtzFefNBw7dvzb2TfLucBcUt
         JTcnVnc9zKl7E1NOawNIQhjGpN/aLSU7AuW8vIOxN+RhiYIZ5u6usGbnQY1kH+VBPx3C
         8/PVp9ys8/286UHBoZICbuoEmTDto3qGgrx0nVsRkFabw8wCO4VVManNmUcRbggMlT8U
         mCY9jBS09eCzem4yEBuoUDzxIA76ELCEHSvWopyfjiatEQlmDXVkEH8eEijNSOjm5vGl
         UwEmdeVKkiDVebVjOyOurfyRaMZjnSecFCDWMoKRLE63aU/sjHIxcr1fRkjCyqWxAqhw
         yfMA==
X-Gm-Message-State: AOJu0YznMH5fl4lJ/C+ncghcnuk1OE88qEBavOA97Pxpql318/jHwVxD
	/lBiKtWAz7fq9IJvnRtAuhtByFbD5Pp/itLbkYnP3LD6LW8o2kvjpfMOgz1U6n8n3BEiEiDjAYa
	rxRlie4lPQ/7TLXKMTVkswIwcIs2WLhUVNplM3g==
X-Gm-Gg: ASbGncuNo15msP526k07gvy8jloiYegfsnj2ACgknICJz5KT6y4G8I0iim697xz9gDd
	rQtGvLOCuIypbyB/LH2DLuaou06l8BD9FtaH7EJV5FvZF/FUDBJoontYNo4s9J1kSxmf8JE6fMh
	SlYi88xbBL+lf9BgGN4IVj1wPFqNLk7PE=
X-Google-Smtp-Source: AGHT+IFCDi8S1CzJaDCSqenmzAJm9ODsM5wrOgYbX6wOJB/DnBkR/vWxBUM44ftK1GBwyrxzQ+WeUY6rg79SDjBUfIo=
X-Received: by 2002:a05:6402:5244:b0:5dc:80ba:ddb1 with SMTP id
 4fb4d7f45d1cf-5decba8f992mr6492030a12.14.1739537739320; Fri, 14 Feb 2025
 04:55:39 -0800 (PST)
MIME-Version: 1.0
References: <182406EB80987623.18925@lists.openembedded.org>
In-Reply-To: <182406EB80987623.18925@lists.openembedded.org>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Fri, 14 Feb 2025 18:25:27 +0530
X-Gm-Features: AWEUYZnFgX1UsV1ABw6-RssUeYS4PGqAByZDa3zULuU-WDL9F6BQT3WOPQQ1agM
Message-ID: <CANQUz18BcEfW25FA+eLONnsxh53N-HGGhLcit03nDuBE6o+vJg@mail.gmail.com>
Subject: Re: [oe][meta-oe][kirkstone][PATCH RESEND] openjpeg: upgrade 2.5.0 -> 2.5.3
To: vanusuri@mvista.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000007a4f7062e19b106"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 12:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115484

--00000000000007a4f7062e19b106
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This upgrade is for scarthgap branch.
Please ignore this. I will correct the subject to scarthgap and send it
again.

Thanks & Regards,
Vijay

On Fri, Feb 14, 2025 at 2:19=E2=80=AFPM Vijay Anusuri via lists.openembedde=
d.org
<vanusuri=3Dmvista.com@lists.openembedded.org> wrote:

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
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115481):
> https://lists.openembedded.org/g/openembedded-devel/message/115481
> Mute This Topic: https://lists.openembedded.org/mt/111179380/7301997
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000007a4f7062e19b106
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>This upgrade is for scarthgap branch. <br><=
/div>Please ignore this. I will correct the subject to scarthgap and send=
=C2=A0it again.<br><br></div>Thanks &amp;=C2=A0Regards,<br></div>Vijay</div=
><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Fri, Feb 14, 2025 at 2:19=E2=80=AFPM Vijay Anusuri via =
<a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;va=
nusuri=3D<a href=3D"mailto:mvista.com@lists.openembedded.org">mvista.com@li=
sts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvis=
ta.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
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
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#115481): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/115481" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/115481</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111179380/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111179380/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000007a4f7062e19b106--

