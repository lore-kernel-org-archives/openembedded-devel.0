Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CB2C6FA8F
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 16:14:19 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.1084.1693325659291715929
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Aug 2023 09:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KU90g/mr;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3a812843f0fso2679979b6e.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Aug 2023 09:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693325658; x=1693930458;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ED0on65Ws4r1lS2Cg2v3e6npl2P6Cy+hqiejA83Pqn0=;
        b=KU90g/mr9Mk1bJWN2Z8nhbc40r6BgpHv4+CBqMGLhQ3UboqSsAliC+svbmwNzJH+m7
         QRUjjhvNlPRKeaONpW0BJzlwCIJarSkbe+TA7lOuIVcn7qgsvZIxphEKxEc1OLnXzMzm
         pet7d2PFy+o/65fGJf04KtJ/i/HUeZ+WgXuB7hvjfbpduC686RgmGh4kOk7xhL3GKTN3
         K4QuqEIGsm9FYdtoYVpPCMUKxjO72QjurYhE9648Peua93uqkXPD/RhB84Xwb11ZqGOt
         yrI2d28coXxvfqlZXnAvQwvgzI/zPLERZhfqYaF+SqFb8dSuzXVR61Br4gMtkLv4kN65
         S9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693325658; x=1693930458;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ED0on65Ws4r1lS2Cg2v3e6npl2P6Cy+hqiejA83Pqn0=;
        b=EGV3VRl6eUKvMr/lSfiJqfhllDo8z828othKRzHe0Qq1CNfGxYKTyp6EP2dv27KNE/
         S19mbj9Fdac4GiwKwKXSiOzFBOHTu4rvk5bl6+O1sqaB2ToUqQVILa0tWijxaS6sBQ3g
         RzNnJLnwkfFZ9wDlDvqxJ6+zkGfNggi2+vhM3SLwfnhCArMi0h5gYUG1ov9E9spJ+ClD
         hwolbV6J2v24BhRZk7YQPaO9n3L9Bc8q+6u8pY8BOPtkFMAgkEVJAA2C9+W8Inqe3gS5
         F2wOXdt6RfonD9O8QlSMGNeD1CB/AnGi5Hl675g6cAn6NZpK0hXA3f7M2giiaCO2XmOg
         rX9w==
X-Gm-Message-State: AOJu0YwG4NR9gq872hmVcx7VpmuSlm7UCqYTNJwtE2T9WrpXmywbZVt+
	ZEi9eIDUJihWFKMJl++Q4xmbdwHlwdWM/g8g4pAEy3pG
X-Google-Smtp-Source: AGHT+IF0kXB28INHpvVaHXHXxeFz4S5LdzvBGOgO2fj8M9yNc0yFO1tmm25wMULiAuuIWbtOEbwp0jTwUIo5j3NRWw4=
X-Received: by 2002:a54:4e8e:0:b0:3a7:52b9:cbfe with SMTP id
 c14-20020a544e8e000000b003a752b9cbfemr12778581oiy.32.1693325658352; Tue, 29
 Aug 2023 09:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230829095438.2747087-1-mingli.yu@windriver.com>
In-Reply-To: <20230829095438.2747087-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Aug 2023 09:14:03 -0700
Message-ID: <CAMKF1sokrpgNY1dhBk6Hu7rOn+J7eu7kvWaR9qfGOnP-a7tjbg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] thrift: Remove buildpaths
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005af5b10604121ae2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Aug 2023 16:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104641

--0000000000005af5b10604121ae2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2023 at 2:54 AM Yu, Mingli <mingli.yu@eng.windriver.com>
wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> Fixes:
>   WARNING: thrift-0.18.1-r0 do_package_qa: QA Issue: File
> /usr/lib64/cmake/thrift/thriftnbTargets.cmake in package thrift-dev
> contains reference to TMPDIR
>   File /usr/lib64/cmake/thrift/thrift_c_glibTargets.cmake in package
> thrift-dev contains reference to TMPDIR
>   File /usr/lib64/cmake/thrift/thrift_c_glib_zlibTargets.cmake in package
> thrift-dev contains reference to TMPDIR [buildpaths]
>   WARNING: thrift-0.18.1-r0 do_package_qa: QA Issue: File
> /usr/src/debug/thrift/0.18.1-r0/compiler/cpp/thrift/thrifty.hh in package
> thrift-src contains reference to TMPDIR
>   File /usr/src/debug/thrift/0.18.1-r0/compiler/cpp/thrift/thrifty.cc in
> package thrift-src contains reference to TMPDIR
>   File /usr/src/debug/thrift/0.18.1-r0/compiler/cpp/thrift/thriftl.cc in
> package thrift-src contains reference to TMPDIR [buildpaths]
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta-oe/recipes-connectivity/thrift/thrift_0.18.1.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.18.1.bb
> b/meta-oe/recipes-connectivity/thrift/thrift_0.18.1.bb
> index ea5a3972d..2809e24ad 100644
> --- a/meta-oe/recipes-connectivity/thrift/thrift_0.18.1.bb
> +++ b/meta-oe/recipes-connectivity/thrift/thrift_0.18.1.bb
> @@ -35,6 +35,8 @@ EXTRA_OECMAKE =3D " \
>      -DWITH_OPENSSL=3DON \
>      -DWITH_QT5=3DOFF \
>      -DWITH_ZLIB=3DON \
> +    -DFLEX_TARGET_ARG_COMPILE_FLAGS=3D'--noline' \
> +    -DBISON_TARGET_ARG_COMPILE_FLAGS=3D'--no-lines' \
>  "
>
>  PACKAGECONFIG ??=3D "glib libevent"
> @@ -46,6 +48,10 @@ PACKAGECONFIG[python] =3D
> "-DWITH_PYTHON=3DON,-DWITH_PYTHON=3DOFF,python"
>
>  do_install:append () {
>      ln -sf thrift ${D}/${bindir}/thrift-compiler
> +    # remove absolute paths
> +    sed -i -e 's|${RECIPE_SYSROOT}||g'
> ${D}${libdir}/cmake/thrift/thriftnbTargets.cmake
> +    sed -i -e 's|${RECIPE_SYSROOT}||g'
> ${D}${libdir}/cmake/thrift/thrift_c_glibTargets.cmake
> +    sed -i -e 's|${RECIPE_SYSROOT}||g'
> ${D}${libdir}/cmake/thrift/thrift_c_glib_zlibTargets.cmake


Are these still working ok on target it would be good to check that while
you are here. I know they don=E2=80=99t work before this patch perhaps


>  }
>
>  LEAD_SONAME =3D "libthrift.so.${PV}"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104638):
> https://lists.openembedded.org/g/openembedded-devel/message/104638
> Mute This Topic: https://lists.openembedded.org/mt/101028035/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005af5b10604121ae2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Aug 29, 2023 at 2:54 AM Yu, Mingli &lt;<a href=3D"m=
ailto:mingli.yu@eng.windriver.com">mingli.yu@eng.windriver.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">From: Mingli Yu &lt;<a href=3D"m=
ailto:mingli.yu@windriver.com" target=3D"_blank">mingli.yu@windriver.com</a=
>&gt;<br>
<br>
Fixes:<br>
=C2=A0 WARNING: thrift-0.18.1-r0 do_package_qa: QA Issue: File /usr/lib64/c=
make/thrift/thriftnbTargets.cmake in package thrift-dev contains reference =
to TMPDIR<br>
=C2=A0 File /usr/lib64/cmake/thrift/thrift_c_glibTargets.cmake in package t=
hrift-dev contains reference to TMPDIR<br>
=C2=A0 File /usr/lib64/cmake/thrift/thrift_c_glib_zlibTargets.cmake in pack=
age thrift-dev contains reference to TMPDIR [buildpaths]<br>
=C2=A0 WARNING: thrift-0.18.1-r0 do_package_qa: QA Issue: File /usr/src/deb=
ug/thrift/0.18.1-r0/compiler/cpp/thrift/thrifty.hh in package thrift-src co=
ntains reference to TMPDIR<br>
=C2=A0 File /usr/src/debug/thrift/0.18.1-r0/compiler/cpp/thrift/thrifty.cc =
in package thrift-src contains reference to TMPDIR<br>
=C2=A0 File /usr/src/debug/thrift/0.18.1-r0/compiler/cpp/thrift/thriftl.cc =
in package thrift-src contains reference to TMPDIR [buildpaths]<br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" tar=
get=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-connectivity/thrift/<a href=3D"http://thrift_0.18.1.b=
b" rel=3D"noreferrer" target=3D"_blank">thrift_0.18.1.bb</a> | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-connectivity/thrift/<a href=3D"http://thrift_0=
.18.1.bb" rel=3D"noreferrer" target=3D"_blank">thrift_0.18.1.bb</a> b/meta-=
oe/recipes-connectivity/thrift/<a href=3D"http://thrift_0.18.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">thrift_0.18.1.bb</a><br>
index ea5a3972d..2809e24ad 100644<br>
--- a/meta-oe/recipes-connectivity/thrift/<a href=3D"http://thrift_0.18.1.b=
b" rel=3D"noreferrer" target=3D"_blank">thrift_0.18.1.bb</a><br>
+++ b/meta-oe/recipes-connectivity/thrift/<a href=3D"http://thrift_0.18.1.b=
b" rel=3D"noreferrer" target=3D"_blank">thrift_0.18.1.bb</a><br>
@@ -35,6 +35,8 @@ EXTRA_OECMAKE =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0-DWITH_OPENSSL=3DON \<br>
=C2=A0 =C2=A0 =C2=A0-DWITH_QT5=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0-DWITH_ZLIB=3DON \<br>
+=C2=A0 =C2=A0 -DFLEX_TARGET_ARG_COMPILE_FLAGS=3D&#39;--noline&#39; \<br>
+=C2=A0 =C2=A0 -DBISON_TARGET_ARG_COMPILE_FLAGS=3D&#39;--no-lines&#39; \<br=
>
=C2=A0&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;glib libevent&quot;<br>
@@ -46,6 +48,10 @@ PACKAGECONFIG[python] =3D &quot;-DWITH_PYTHON=3DON,-DWIT=
H_PYTHON=3DOFF,python&quot;<br>
<br>
=C2=A0do_install:append () {<br>
=C2=A0 =C2=A0 =C2=A0ln -sf thrift ${D}/${bindir}/thrift-compiler<br>
+=C2=A0 =C2=A0 # remove absolute paths<br>
+=C2=A0 =C2=A0 sed -i -e &#39;s|${RECIPE_SYSROOT}||g&#39; ${D}${libdir}/cma=
ke/thrift/thriftnbTargets.cmake<br>
+=C2=A0 =C2=A0 sed -i -e &#39;s|${RECIPE_SYSROOT}||g&#39; ${D}${libdir}/cma=
ke/thrift/thrift_c_glibTargets.cmake<br>
+=C2=A0 =C2=A0 sed -i -e &#39;s|${RECIPE_SYSROOT}||g&#39; ${D}${libdir}/cma=
ke/thrift/thrift_c_glib_zlibTargets.cmake</blockquote><div dir=3D"auto"><br=
></div><div dir=3D"auto">Are these still working ok on target it would be g=
ood to check that while you are here. I know they don=E2=80=99t work before=
 this patch perhaps=C2=A0</div><div dir=3D"auto"><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex" dir=3D"auto"><br>
=C2=A0}<br>
<br>
=C2=A0LEAD_SONAME =3D &quot;libthrift.so.${PV}&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#104638): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104638" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/104638</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101028035/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101028035/1997914</a><br>
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

--0000000000005af5b10604121ae2--

