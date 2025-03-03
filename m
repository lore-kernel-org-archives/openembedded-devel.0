Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 057A0C282C6
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 19:27:29 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.4010.1741030040027108138
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Mar 2025 11:27:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NmZ4cWv3;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2c1c44c3f8dso712568fac.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Mar 2025 11:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741030039; x=1741634839; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mDRQ0czjftwgJoFOsu8O3lznXLXkr2YcRaRgSl7IRp8=;
        b=NmZ4cWv3ljh+ivrefyMcyerpwfGSGHtcHr4ZCBcZkQ8a18gz4XPDcvIYuaOXllsjNk
         Hwp4DU/LlM/XujusZbdeP0FsTJs1cbSfBxzY3D9LAyBfJPnGKuceb7BLnoTbqENhhd2N
         LmgvWFrIxeJV2aw4zUuNWixniJdWcJmcPc8SD1z3C2T8fruX7EKL2kh3kSmIdI88JoxJ
         BJED71KvRz+PCjrzPV1NK2Z0qxG8SRpMxHy6WI3t5yQ8u47dbhLEqrUj/G0HgPubS0ui
         beHBUFznWIa1m2aoSlnsYotQZQXTptfAbky7vHEvFxF2oC+tcg1tG7OTgT5/624ywqyE
         T9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741030039; x=1741634839;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDRQ0czjftwgJoFOsu8O3lznXLXkr2YcRaRgSl7IRp8=;
        b=fOrLySdC3AvtEr2YeFPPwAWGt9IlnzvcaYJKQX9oGF3kbAcK7jHVpE1EntLtiKrnKh
         x14edYZAZZVNsFwhoVp4VcTbjUybQ+ll6dc/76ag69eYOWxzYz1gXfgpVqgdIDC641Q4
         2/TRiDSXgnWMTsqCFEPA5qqTRbMk9EXinVB714PKLsqNWTbH0O3iSTScPktHKdquaa6H
         Lg8fr4Wj9TEzM3rXCYrJBkrfFD6dbmMF/GkJmjVr4phMNNgXXi9xbXMUM7yt4b1MSIDV
         Q26AD0NjCcgTyozmIysFJnyfG+gpqpyq0+d2LH7popRdZuN21wnZixeayj8C1i81MnDv
         6PTA==
X-Gm-Message-State: AOJu0YxFzrWKj52Cz/OkKsg5sqhyMRmjxTyd9KkZFoH1FHYKs1PSyL7r
	BcQ1u12jGchmKPax8DrnqReTYcCtvwSQh8HaK7CvTpw+d2wWv6B+OfTOIovQDCRa/te97PZVbt8
	rU7CPjCJIWcZ/1S4PHTn2e7jkn1U=
X-Gm-Gg: ASbGncvmA/VtlXf5p3TUtN5Q7WL8XLgx3frpOy2TujE47P515+4JvP1GgAdR2KQ62DG
	feyxUPGt/ZfXvHhlPlhF+aH0PXzAa0dkk8rPolU3CTMUve6ulOfESLi66FGUN4o9lVedqsi2Q/7
	cYVoCfjdJKyeOse+CsAGbBgGcf20A=
X-Google-Smtp-Source: AGHT+IFEx5Kaskixzwzd8xOPvZ08OOrJHsBrAvMaehoor+PkqBcBw+XJAvXQ65PmdPAmu7WgoZmO4JQ7PlxNgIhaKMc=
X-Received: by 2002:a05:6870:538b:b0:29e:1e77:71a2 with SMTP id
 586e51a60fabf-2c1783c243emr7160160fac.3.1741030039070; Mon, 03 Mar 2025
 11:27:19 -0800 (PST)
MIME-Version: 1.0
References: <20250303191621.2421906-1-martin.jansa@gmail.com>
In-Reply-To: <20250303191621.2421906-1-martin.jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Mar 2025 11:27:07 -0800
X-Gm-Features: AQ5f1Jr9MtRL5g0Yrn_OMQVbUj5mzZSIdoXGT0hGSl0OOJ5UvzR9IfOfHelQbgc
Message-ID: <CAMKF1spURmMC9G5-3NwGrtsfoeE=HxbCN20G2-FPU+1xoPO80w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] thin-provisioning-tools: use
 STAGING_LIBDIR_NATIVE variable for LIBCLANG_PATH
To: martin.jansa@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Robert Yang <liezhi.yang@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000005b186062f7525e7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Mar 2025 19:27:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115731

--00000000000005b186062f7525e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 11:16=E2=80=AFAM Martin Jansa via lists.openembedded=
.org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> * hardcoding:
>   ${WORKDIR}/recipe-sysroot-native${libdir}
>   is just wrong when there is a better variable
>
> * This path won't be correct for multilib builds where target ${libdir}
>   might be e.g. /usr/lib32 while native libdir is /usr/lib.
>
> * use STAGING_LIBDIR_NATIVE variable which uses correct ${libdir_native}
>
> * fixes:
>   error: failed to run custom build command for `devicemapper-sys v0.3.0`
>
>   Caused by:
>     process didn't exit successfully:
> `lib32-thin-provisioning-tools/1.1.0/build/target/release/build/devicemap=
per-sys-88de590bc55acb43/build-script-build`
> (exit status: 101)
>     --- stderr
>     thread 'main' panicked at
> lib32-thin-provisioning-tools/1.1.0/sources-unpack/cargo_home/bitbake/bin=
dgen-0.69.4/lib.rs:622
> :31:
>     Unable to find libclang: "couldn't find any valid shared libraries
> matching: ['libclang.so', 'libclang-*.so', 'libclang.so.*',
> 'libclang-*.so.*'], set the `LIBCLANG_PATH` environment variable to a pat=
h
> where one of these files can be found (invalid: [])"
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  .../thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git
> a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-to=
ols/
> thin-provisioning-tools_1.1.0.bb
> b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-to=
ols/
> thin-provisioning-tools_1.1.0.bb
> index d0241c7016..1981a35934 100644
> ---
> a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-to=
ols/
> thin-provisioning-tools_1.1.0.bb
> +++
> b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-to=
ols/
> thin-provisioning-tools_1.1.0.bb
> @@ -20,7 +20,7 @@ inherit pkgconfig
>
>  DEPENDS +=3D "udev libdevmapper libdevmapper-native clang-native"
>
> -export LIBCLANG_PATH =3D "${WORKDIR}/recipe-sysroot-native${libdir}"
> +export LIBCLANG_PATH =3D "${STAGING_LIBDIR_NATIVE}"


Ah yes I had a hunch it will fail some usecases that=E2=80=99s for patch


>  export BINDGEN_EXTRA_CLANG_ARGS =3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}
> --target=3D${TARGET_SYS}"
>
>  require ${BPN}-crates.inc
> --
> 2.48.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115729):
> https://lists.openembedded.org/g/openembedded-devel/message/115729
> Mute This Topic: https://lists.openembedded.org/mt/111495180/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000005b186062f7525e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 3, 2025 at 11:16=E2=80=AFAM=
 Martin Jansa via <a href=3D"http://lists.openembedded.org">lists.openembed=
ded.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.com@lists.openembedd=
ed.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">* hardcoding:<br>
=C2=A0 ${WORKDIR}/recipe-sysroot-native${libdir}<br>
=C2=A0 is just wrong when there is a better variable<br>
<br>
* This path won&#39;t be correct for multilib builds where target ${libdir}=
<br>
=C2=A0 might be e.g. /usr/lib32 while native libdir is /usr/lib.<br>
<br>
* use STAGING_LIBDIR_NATIVE variable which uses correct ${libdir_native}<br=
>
<br>
* fixes:<br>
=C2=A0 error: failed to run custom build command for `devicemapper-sys v0.3=
.0`<br>
<br>
=C2=A0 Caused by:<br>
=C2=A0 =C2=A0 process didn&#39;t exit successfully: `lib32-thin-provisionin=
g-tools/1.1.0/build/target/release/build/devicemapper-sys-88de590bc55acb43/=
build-script-build` (exit status: 101)<br>
=C2=A0 =C2=A0 --- stderr<br>
=C2=A0 =C2=A0 thread &#39;main&#39; panicked at lib32-thin-provisioning-too=
ls/1.1.0/sources-unpack/cargo_home/bitbake/bindgen-0.69.4/lib.rs:622:31:<br=
>
=C2=A0 =C2=A0 Unable to find libclang: &quot;couldn&#39;t find any valid sh=
ared libraries matching: [&#39;libclang.so&#39;, &#39;libclang-*.so&#39;, &=
#39;libclang.so.*&#39;, &#39;libclang-*.so.*&#39;], set the `LIBCLANG_PATH`=
 environment variable to a path where one of these files can be found (inva=
lid: [])&quot;<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../thin-provisioning-tools/<a href=3D"http://thin-provisioning-tools=
_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">thin-provisioning-tools_1.1=
.0.bb</a>=C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provis=
ioning-tools/<a href=3D"http://thin-provisioning-tools_1.1.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">thin-provisioning-tools_1.1.0.bb</a> b/meta-oe/d=
ynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/<a href=
=3D"http://thin-provisioning-tools_1.1.0.bb" rel=3D"noreferrer" target=3D"_=
blank">thin-provisioning-tools_1.1.0.bb</a><br>
index d0241c7016..1981a35934 100644<br>
--- a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-=
tools/<a href=3D"http://thin-provisioning-tools_1.1.0.bb" rel=3D"noreferrer=
" target=3D"_blank">thin-provisioning-tools_1.1.0.bb</a><br>
+++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-=
tools/<a href=3D"http://thin-provisioning-tools_1.1.0.bb" rel=3D"noreferrer=
" target=3D"_blank">thin-provisioning-tools_1.1.0.bb</a><br>
@@ -20,7 +20,7 @@ inherit pkgconfig<br>
<br>
=C2=A0DEPENDS +=3D &quot;udev libdevmapper libdevmapper-native clang-native=
&quot;<br>
<br>
-export LIBCLANG_PATH =3D &quot;${WORKDIR}/recipe-sysroot-native${libdir}&q=
uot;<br>
+export LIBCLANG_PATH =3D &quot;${STAGING_LIBDIR_NATIVE}&quot;</blockquote>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Ah yes I had a hunch it will =
fail some usecases that=E2=80=99s for patch</div><div dir=3D"auto"><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
=C2=A0export BINDGEN_EXTRA_CLANG_ARGS =3D &quot;${HOST_CC_ARCH}${TOOLCHAIN_=
OPTIONS} --target=3D${TARGET_SYS}&quot;<br>
<br>
=C2=A0require ${BPN}-crates.inc<br>
-- <br>
2.48.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#115729): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/115729" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/115729</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111495180/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111495180/1997914</a><br>
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

--00000000000005b186062f7525e7--

