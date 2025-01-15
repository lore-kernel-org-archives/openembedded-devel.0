Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A83E77188
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 02:08:45 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.11943.1736906920385737671
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 18:08:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=in+TZ1T4;
 spf=pass (domain: mvista.com, ip: 209.85.208.42, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d90a5581fcso10604258a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 18:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1736906919; x=1737511719; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UXhIpNDEbd0ZMpBLGpbuzRpSvA60+0J9Yjrq1wUEDPI=;
        b=in+TZ1T41TTMhYlEZUTZ5rhm8C3NncmHPEnoF16MixkeuhhqXuU9AZikX3piD5b+tm
         4s1CrkjQoYO/7iOZ0nyTSBtG7j/dyU9Vcg4wtXag40R68fig3szLMn0TaCcOWP9kiaAc
         SNMUfPBdSudGVYozwxzRCGWjsaOIMBVhQ1Qjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736906919; x=1737511719;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXhIpNDEbd0ZMpBLGpbuzRpSvA60+0J9Yjrq1wUEDPI=;
        b=HOQP5DEKKFcq9bLUG1xYal69QeQVm4GTq3ngAQxcr5YHsGnNekumtWgEJt4sp/4KHj
         6GAegBJ3BU1t0uAnNikpaxLEzFRLUffjoyK+VpXobS/gI6ML802MdJI220w76c9g+lEb
         plYg4uUlZsCzXLSrV4wTIMWm0DkFfU4zDy7U3EDNwiL5ALM8gaoQKiG9lbanBzjy9CVv
         FbsZOTogiqWGe09K3s+9v5OeLSLXjig12WEC35zxYCfv8UdFV8lwzryXeAQ1sbcFqtZq
         XGIWRl3Sno0bcOhhP2cu1ghXbr2ZUf81zhUUhqxEcJNdNNuylOapqCx8gs9wfwOeVngy
         BZvQ==
X-Gm-Message-State: AOJu0YzSz0vzZR7oUGwOjw8f0xwBhru4USEJwO3hL4f2TM8TxOYKwQtJ
	qGyKm62+sVZBUaIjKM1gxSIMNGk9Z71CdEbdukwQAjVXsFGN2uS6v/7N6I81Vp6stdJmw4fJRgF
	pRFhNSZz3x2vf/T8ljejSmf2WvKhZ7mzpLNOGUg==
X-Gm-Gg: ASbGncspkSCv+jqIRno4NrI/yfMFb7ZWehvBGbJA4M6SZvu2JV9TugGfcmE4WRMyGih
	0xgaSBpSbBXbTnxCbSph4oHBjAVHOT5hpkxFrkN20evhUN0hjohmJkzjGrPQDvkEMOQs2nw==
X-Google-Smtp-Source: AGHT+IG0p9UvTY+iwibnSSaSscINos1z/bLRlxCx6D2tQ48QCFwlkk1UyZnFTNDuzy7MnDDfF7klzUs0Gm93AFHHfQs=
X-Received: by 2002:a05:6402:3550:b0:5d9:8877:895a with SMTP id
 4fb4d7f45d1cf-5d988778a53mr22781925a12.17.1736906918311; Tue, 14 Jan 2025
 18:08:38 -0800 (PST)
MIME-Version: 1.0
References: <20250114061146.3313761-1-peng.zhang1.cn@windriver.com>
In-Reply-To: <20250114061146.3313761-1-peng.zhang1.cn@windriver.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Wed, 15 Jan 2025 07:38:26 +0530
X-Gm-Features: AbW1kvZXs7MURknAchCDsW8z56NV411PuNyGegmZeVpmV68FCUnzNP1QyN22f5I
Message-ID: <CANQUz1-zm5dyHjMBCHo4Wi11T6djscsHAGdQFUMTPLPe76yCzw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] openjpeg: Upgrade v2.5.0 to v2.5.3
To: peng.zhang1.cn@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000dfd47c062bb527c0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 02:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114879

--000000000000dfd47c062bb527c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zhang peng,

Already a patch has been submitted for the upgrade .

https://lists.openembedded.org/g/openembedded-devel/message/114828

https://patchwork.yoctoproject.org/project/oe/patch/20250113100435.141849-1=
-vanusuri@mvista.com/

Thanks & Regards,

Vijay





On Tue, Jan 14, 2025 at 11:42=E2=80=AFAM Zhang, Peng (Paul) (CN) via
lists.openembedded.org <peng.zhang1.cn=3Dwindriver.com@lists.openembedded.o=
rg>
wrote:

> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>
> This upgrade includes fix for CVE-2024-56826 and CVE-2024-56827.
>
> Changlog:
> https://github.com/uclouvain/openjpeg/blob/v2.5.3/NEWS.md
>
> * Refresh  0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patc=
h
>
> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> ---
>  ...t-ask-cmake-to-export-binaries-they-don-t-make-.patch} | 8 ++++----
>  .../openjpeg/{openjpeg_2.5.0.bb =3D> openjpeg_2.5.3.bb}     | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
>  rename
> meta-oe/recipes-graphics/openjpeg/openjpeg/{0002-Do-not-ask-cmake-to-expo=
rt-binaries-they-don-t-make-.patch
> =3D> 0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch} (82=
%)
>  rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.5.0.bb =3D>
> openjpeg_2.5.3.bb} (82%)
>
> diff --git
> a/meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-cmake-to-exp=
ort-binaries-they-don-t-make-.patch
> b/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Do-not-ask-cmake-to-exp=
ort-binaries-they-don-t-make-.patch
> similarity index 82%
> rename from
> meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-cmake-to-expor=
t-binaries-they-don-t-make-.patch
> rename to
> meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Do-not-ask-cmake-to-expor=
t-binaries-they-don-t-make-.patch
> index 0ba13cf88..47e4aebb4 100644
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
> @@ -15,7 +15,7 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail=
.com>
>   1 file changed, 1 deletion(-)
>
>  diff --git a/src/bin/jp2/CMakeLists.txt b/src/bin/jp2/CMakeLists.txt
> -index 4324c36d..2c11fe02 100644
> +index 26156bcb..9eff04aa 100644
>  --- a/src/bin/jp2/CMakeLists.txt
>  +++ b/src/bin/jp2/CMakeLists.txt
>  @@ -66,7 +66,6 @@ foreach(exe opj_decompress opj_compress opj_dump)
> @@ -23,9 +23,9 @@ index 4324c36d..2c11fe02 100644
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
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114845):
> https://lists.openembedded.org/g/openembedded-devel/message/114845
> Mute This Topic: https://lists.openembedded.org/mt/110603420/7301997
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000dfd47c062bb527c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Zhang peng,<br><br></div>Already a patch has been =
submitted for the upgrade .<br><br><pre class=3D"gmail-bz_comment_text" id=
=3D"gmail-comment_text_3"><a href=3D"https://lists.openembedded.org/g/opene=
mbedded-devel/message/114828">https://lists.openembedded.org/g/openembedded=
-devel/message/114828</a><br><br><a href=3D"https://patchwork.yoctoproject.=
org/project/oe/patch/20250113100435.141849-1-vanusuri@mvista.com/">https://=
patchwork.yoctoproject.org/project/oe/patch/20250113100435.141849-1-vanusur=
i@mvista.com/</a><br><br></pre><pre class=3D"gmail-bz_comment_text" id=3D"g=
mail-comment_text_3"><font face=3D"arial,sans-serif">Thanks &amp; Regards,<=
br></font></pre><pre class=3D"gmail-bz_comment_text" id=3D"gmail-comment_te=
xt_3"><font face=3D"arial,sans-serif">Vijay<br></font></pre><br><br><br></d=
iv><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, Jan 14, 2025 at 11:42=E2=80=AFAM Zhang, Peng (Pa=
ul) (CN) via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a> &lt;<a href=3D"http://peng.zhang1.cn">peng.zhang1.cn</a>=3D<a href=
=3D"mailto:windriver.com@lists.openembedded.org">windriver.com@lists.openem=
bedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Zhang Peng &lt;<a href=3D"mailto:peng.zhang1.cn@windriver.=
com" target=3D"_blank">peng.zhang1.cn@windriver.com</a>&gt;<br>
<br>
This upgrade includes fix for CVE-2024-56826 and CVE-2024-56827.<br>
<br>
Changlog:<br>
<a href=3D"https://github.com/uclouvain/openjpeg/blob/v2.5.3/NEWS.md" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/uclouvain/openjpeg/blo=
b/v2.5.3/NEWS.md</a><br>
<br>
* Refresh=C2=A0 0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.p=
atch<br>
<br>
Signed-off-by: Zhang Peng &lt;<a href=3D"mailto:peng.zhang1.cn@windriver.co=
m" target=3D"_blank">peng.zhang1.cn@windriver.com</a>&gt;<br>
---<br>
=C2=A0...t-ask-cmake-to-export-binaries-they-don-t-make-.patch} | 8 ++++---=
-<br>
=C2=A0.../openjpeg/{<a href=3D"http://openjpeg_2.5.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">openjpeg_2.5.0.bb</a> =3D&gt; <a href=3D"http://openjpeg=
_2.5.3.bb" rel=3D"noreferrer" target=3D"_blank">openjpeg_2.5.3.bb</a>}=C2=
=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A02 files changed, 6 insertions(+), 6 deletions(-)<br>
=C2=A0rename meta-oe/recipes-graphics/openjpeg/openjpeg/{0002-Do-not-ask-cm=
ake-to-export-binaries-they-don-t-make-.patch =3D&gt; 0001-Do-not-ask-cmake=
-to-export-binaries-they-don-t-make-.patch} (82%)<br>
=C2=A0rename meta-oe/recipes-graphics/openjpeg/{<a href=3D"http://openjpeg_=
2.5.0.bb" rel=3D"noreferrer" target=3D"_blank">openjpeg_2.5.0.bb</a> =3D&gt=
; <a href=3D"http://openjpeg_2.5.3.bb" rel=3D"noreferrer" target=3D"_blank"=
>openjpeg_2.5.3.bb</a>} (82%)<br>
<br>
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-cma=
ke-to-export-binaries-they-don-t-make-.patch b/meta-oe/recipes-graphics/ope=
njpeg/openjpeg/0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.pa=
tch<br>
similarity index 82%<br>
rename from meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-cmak=
e-to-export-binaries-they-don-t-make-.patch<br>
rename to meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Do-not-ask-cmake-=
to-export-binaries-they-don-t-make-.patch<br>
index 0ba13cf88..47e4aebb4 100644<br>
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
@@ -15,7 +15,7 @@ Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:=
schnitzeltony@gmail.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<=
br>
=C2=A0 1 file changed, 1 deletion(-)<br>
<br>
=C2=A0diff --git a/src/bin/jp2/CMakeLists.txt b/src/bin/jp2/CMakeLists.txt<=
br>
-index 4324c36d..2c11fe02 100644<br>
+index 26156bcb..9eff04aa 100644<br>
=C2=A0--- a/src/bin/jp2/CMakeLists.txt<br>
=C2=A0+++ b/src/bin/jp2/CMakeLists.txt<br>
=C2=A0@@ -66,7 +66,6 @@ foreach(exe opj_decompress opj_compress opj_dump)<b=
r>
@@ -23,9 +23,9 @@ index 4324c36d..2c11fe02 100644<br>
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
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#114845): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/114845" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/114845</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110603420/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/110603420/7301997</a><br>
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

--000000000000dfd47c062bb527c0--

