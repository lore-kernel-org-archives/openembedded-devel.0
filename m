Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15DDC636D3
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 11:14:41 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.20828.1675250073568067979
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Feb 2023 03:14:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ObYg6BM5;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id h16so16920155wrz.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Feb 2023 03:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Ta8oH2m2wEUlkgKc6Q6a/4tCpYn/WT8ze49eiusYiY=;
        b=ObYg6BM5ZXSgcMF25JGl6jcOkljPE2WELFkfhyhejY5Q+QwC2LAB6XbrkprGQCuDIL
         Fz6v1HxxnB2yLeuT9F66BHJJ2NQBlUbbZRixvCVZyDhXCElMDoWkPDxLqxS4sa5LZnNY
         e1gGe+pxI+TeZ1M/q3Q8RLdIGgEyoeEI4BK8em0w7AqE7m4NizNERpQvu8vGymk/SXTa
         GMpnoX1VOrWVWy0j0cgWEgaHsELhlKtp0hMSEWHD+d1gSEICBFvipU/qDLPDLAWsZML0
         jc6/qsE2lSPsJsRlwv9EgTf8v0vV35P6UetuTj+1VeEau/D2qHqUgRZQXKRPbSnDUQfm
         1jRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Ta8oH2m2wEUlkgKc6Q6a/4tCpYn/WT8ze49eiusYiY=;
        b=zLHD2bALYDFHCHXseeNuSnAKR8P9G7LG+49FBcpGAzr9t+NPlfxEDXW0VRDoaHkbqC
         OYXHH16j01xu+rhVv4kCNIPFP1dcuyaU33wDiR+0i6z+c/zqAqz2OWiZpoeLzi3wGEQJ
         LL/IlHLqhi+lgOl6YPhCpkWClc95t9plqXoqcpAs74E6UPNdZ8OvIpD2OmstvdsRvtHr
         O4+kh4N0rvljMbo/nEsVHpjwLJ6CoZgzUIMb+kHM7XvcGFnTQRwGNfoKj8UQOspewabp
         0aTCEfolpIZuMEXkevLtffFOzwgMGa/VihyNQfcAcHD55PhZyHCxG+W1Ph1rY24nP0/T
         afSw==
X-Gm-Message-State: AO0yUKWdvwffu0oaGVrc5Gv5RVwlHP18iZ93e/hVQsIIp5Twlbch9S8B
	vzu9ugMlJjjDMctkkta1RbJTh0Fm2A1aiCd+Sl8=
X-Google-Smtp-Source: AK7set8m57JHBHzZcCm5wl+8F3gW7/ZDC0GHNoRWjAnf1KIP27/jmfkGDuSNx8aqSMhtq0tzZRPOiP5IJ6/mM33uwK4=
X-Received: by 2002:a5d:610f:0:b0:2bf:b746:6225 with SMTP id
 v15-20020a5d610f000000b002bfb7466225mr53757wrt.204.1675250071656; Wed, 01 Feb
 2023 03:14:31 -0800 (PST)
MIME-Version: 1.0
References: <20230130050909.133727-1-raj.khem@gmail.com> <20230130050909.133727-12-raj.khem@gmail.com>
In-Reply-To: <20230130050909.133727-12-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 1 Feb 2023 12:14:19 +0100
Message-ID: <CA+chaQc2R=VC7=K-59jH6h4oXNY2czyOm=j435QRS1_c-R6vyQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 12/12] nodejs: Fix build with gcc13
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006e5c7805f3a18de4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Feb 2023 11:14:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100902

--0000000000006e5c7805f3a18de4
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 30, 2023 at 6:09 AM Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../nodejs/nodejs/gcc13.patch                 | 28 +++++++++++++++++++
>  .../recipes-devtools/nodejs/nodejs_18.12.1.bb |  1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
> b/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
> new file mode 100644
> index 0000000000..7268c5e64f
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
> @@ -0,0 +1,28 @@
> +Add missing <cstdint>
> +
> +gcc 13 moved some includes around and as a result <cstdint> is no longer
> transitively included [1]. Explicitly include it for uint{32,64}_t.
> +
> +[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>

You can add:
Upstream-Status: Backport [
https://github.com/nodejs/node/commit/0be1c5728173ea9ac42843058e26b6268568acf0
]


> +
> +--- a/deps/v8/src/base/logging.h
> ++++ b/deps/v8/src/base/logging.h
> +@@ -5,6 +5,7 @@
> + #ifndef V8_BASE_LOGGING_H_
> + #define V8_BASE_LOGGING_H_
> +
> ++#include <cstdint>
> + #include <cstring>
> + #include <sstream>
> + #include <string>
> +--- a/deps/v8/src/inspector/v8-string-conversions.h
> ++++ b/deps/v8/src/inspector/v8-string-conversions.h
> +@@ -5,6 +5,7 @@
> + #ifndef V8_INSPECTOR_V8_STRING_CONVERSIONS_H_
> + #define V8_INSPECTOR_V8_STRING_CONVERSIONS_H_
> +
> ++#include <cstdint>
> + #include <string>
> +
> + // Conversion routines between UT8 and UTF16, used by string-16.{h,cc}.
> You may
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
> b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
> index e96913e563..e96412fecc 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
> @@ -25,6 +25,7 @@ SRC_URI = "
> http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
>             file://system-c-ares.patch \
>             file://0001-liftoff-Correct-function-signatures.patch \
>             file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch \
> +           file://gcc13.patch \
>             "
>
>  SRC_URI:append:class-target = " \
> --
> 2.39.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100856):
> https://lists.openembedded.org/g/openembedded-devel/message/100856
> Mute This Topic: https://lists.openembedded.org/mt/96622215/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000006e5c7805f3a18de4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Jan 30, 2023 at 6:09 AM Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.co=
m" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../nodejs/nodejs/gcc13.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 28 +++++++++++++++++++<br>
=C2=A0.../recipes-devtools/nodejs/<a href=3D"http://nodejs_18.12.1.bb" rel=
=3D"noreferrer" target=3D"_blank">nodejs_18.12.1.bb</a> |=C2=A0 1 +<br>
=C2=A02 files changed, 29 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch=
<br>
<br>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch b/meta-oe/r=
ecipes-devtools/nodejs/nodejs/gcc13.patch<br>
new file mode 100644<br>
index 0000000000..7268c5e64f<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch<br>
@@ -0,0 +1,28 @@<br>
+Add missing &lt;cstdint&gt;<br>
+<br>
+gcc 13 moved some includes around and as a result &lt;cstdint&gt; is no lo=
nger transitively included [1]. Explicitly include it for uint{32,64}_t.<br=
>
+<br>
+[1] <a href=3D"https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-chang=
es" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/gcc-13/porting=
_to.html#header-dep-changes</a><br>
+<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br></blockquote><div><br></div><div>=
You can add:</div><div>Upstream-Status: Backport [<a href=3D"https://github=
.com/nodejs/node/commit/0be1c5728173ea9ac42843058e26b6268568acf0">https://g=
ithub.com/nodejs/node/commit/0be1c5728173ea9ac42843058e26b6268568acf0</a>]<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+--- a/deps/v8/src/base/logging.h<br>
++++ b/deps/v8/src/base/logging.h<br>
+@@ -5,6 +5,7 @@<br>
+ #ifndef V8_BASE_LOGGING_H_<br>
+ #define V8_BASE_LOGGING_H_<br>
+ <br>
++#include &lt;cstdint&gt;<br>
+ #include &lt;cstring&gt;<br>
+ #include &lt;sstream&gt;<br>
+ #include &lt;string&gt;<br>
+--- a/deps/v8/src/inspector/v8-string-conversions.h<br>
++++ b/deps/v8/src/inspector/v8-string-conversions.h<br>
+@@ -5,6 +5,7 @@<br>
+ #ifndef V8_INSPECTOR_V8_STRING_CONVERSIONS_H_<br>
+ #define V8_INSPECTOR_V8_STRING_CONVERSIONS_H_<br>
+ <br>
++#include &lt;cstdint&gt;<br>
+ #include &lt;string&gt;<br>
+ <br>
+ // Conversion routines between UT8 and UTF16, used by string-16.{h,cc}. Y=
ou may<br>
diff --git a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_18.12=
.1.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_18.12.1.bb</a> b/meta-oe=
/recipes-devtools/nodejs/<a href=3D"http://nodejs_18.12.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">nodejs_18.12.1.bb</a><br>
index e96913e563..e96412fecc 100644<br>
--- a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_18.12.1.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_18.12.1.bb</a><br>
+++ b/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_18.12.1.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_18.12.1.bb</a><br>
@@ -25,6 +25,7 @@ SRC_URI =3D &quot;<a href=3D"http://nodejs.org/dist/v$%7B=
PV%7D/node-v$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://n=
odejs.org/dist/v${PV}/node-v${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://system-c-ares.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-liftoff-Correct-funct=
ion-signatures.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-mips-Use-32bit-cast-f=
or-operand-on-mips32.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://gcc13.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI:append:class-target =3D &quot; \<br>
-- <br>
2.39.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#100856): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/100856" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/100856</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96622215/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96622215/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000006e5c7805f3a18de4--

