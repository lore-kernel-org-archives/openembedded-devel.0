Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A3CC19F32
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 16:33:41 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.15164.1740674016941761526
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Feb 2025 08:33:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eMUT9CS/;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3f419eea844so578490b6e.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 08:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740674016; x=1741278816; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/9eBczNIHmlcvJ+SvD2qncXI2Bd+2JlEJ2p24SVZ2ZA=;
        b=eMUT9CS/mOkTelo3B+BIprDefTiVA9DgsNwMZk7vQfjGQMkHfKL7jYPs8yW6iKVAKe
         JgULUS3qR0SPsqyW4Fiu1RtPwnx21ZLhPM8dMiJtW27BxPytxrDSd7/3bUamWAvNIS/C
         jmxkKWjGI6wJ6PUCaoTK68Ft0qfpSb25Zv4Kr7mrCuN2Juxel/s4cx3kl378RvO0Ovgm
         fSH5IQsVrRY8ILjZATdY0ix35ETRInFVE+V1+eTlzD2KzcTH8zanbyL4PKeoDQbFwknM
         JAeTFVIOLrEnq1yILC/oe5FDSz9iLgO4Yly3n702GV/MVz4oSAOZPnC79zn4P+bckKWz
         yCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740674016; x=1741278816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9eBczNIHmlcvJ+SvD2qncXI2Bd+2JlEJ2p24SVZ2ZA=;
        b=FQhDwFY0spk6CYEUKezLnbr3lE6fyG6BCc6wHfg/pMgj6DWf+/HXiJDXppl1Kg8gC0
         KdjEjr1L+OwmTQrnFI9cJqC4HU/FFc19/4zuSGCcI3imkWx5AZPmpX19v1LjUYq1AR5Q
         sUIi4Kgo1b9QhOL7LUiYaoec650kNXVOz295Vzyl4eA5OP8Zfp1gCzCnijh8Ze2BSdsM
         V1rG6el3unlXk4kn+BbkGWCZBtVVLurSfXHR7qyEY/r2phZz2Ri+oWhRwrnMnt3/Wc5z
         VFE4VfrmDTiQ4wJhGI+y6OAUVSmG+XOTBRqAX0AcL72bsebEwu49P311NYwyMebL6mFa
         3ARg==
X-Gm-Message-State: AOJu0YwI51cS2UziGyKGcbLvQYZGk8uMuJ0Oxj8smDMYgWofSyQayCKt
	+j9q6YU/CZUNuQfTQFmiYcB3cg+6nHhrBTKSyTvvzxp2QWcp32I/cHA8RZw7LCgkkXIGnBGEgf2
	HpRA/4G2H+6p8qLPmTXGWRuj4y/A=
X-Gm-Gg: ASbGnctcsffypBVF1DQmPSV454o9OZzsvBYWgve0eLnb5w/BRs5MvOUlIOIxE2GbJrI
	raHqX9sHOO8FeDF5krg2Po9F2QtB+dm4W3FPLBUgtOBOTvDH4JBAzckFyB0CRhciBy+18OdW/tJ
	h3TpDNcOOrGYiHeUn6kmPLvw771IHrcI9HlGsYplUCTQ==
X-Google-Smtp-Source: AGHT+IHA1cx59r+qspw5E4QsRJ6i5zTQzWIDBx+jsEK5jpCWZ8X+JrzPEhzxiYznvxNLdjI2gOJBXrJzlK/YNTl5gEw=
X-Received: by 2002:a05:6808:10c9:b0:3f4:11b3:6215 with SMTP id
 5614622812f47-3f425a8f4f5mr17915650b6e.23.1740674016080; Thu, 27 Feb 2025
 08:33:36 -0800 (PST)
MIME-Version: 1.0
References: <20250227120412.1465709-1-skandigraun@gmail.com>
In-Reply-To: <20250227120412.1465709-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Feb 2025 08:33:25 -0800
X-Gm-Features: AQ5f1JpMyYtF7FbEdPHcEuCFG4e2zuRzVpTkqNJQBNOrFREs1WezNpsDWQJ8vfE
Message-ID: <CAMKF1sreKdR6d2x35f80pKGo6nxQKPj4dR4v8AGiEFLVZrth3Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] thin-provisioning-tools: add target and
 sysroot to bindgen flags
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000065fe0e062f224046"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 16:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115693

--00000000000065fe0e062f224046
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 4:04=E2=80=AFAM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> BUILD_CFLAGS doesn't contain information about the recipe sysroot nor
> about the target
> system - and in case these are not specified for bindgen, then it builds
> against
> the build system's headers, using the build system's arch.
>
> Specify these attributes in BINDGEN_EXTRA_CLANG_ARGS to use the correct
> headers.
>
> Fixes the following do_compile error:
>
> |   /usr/include/linux/types.h:5:10: fatal error: 'asm/types.h' file not
> found
> |   thread 'main' panicked at
> /yocto/sandbox/build/tmp/work/cortexa72-poky-linux/thin-provisioning-tool=
s/1.1.0/sources-unpack/cargo_home/bitbake/devicemapper-sys-0.3.0/build.rs:2=
4
> :10:
> |   Could not generate dm.h bindings:
> ClangDiagnostic("/usr/include/linux/types.h:5:10: fatal error:
> 'asm/types.h' file not found\n")


Good catch I forgot about target vs build here once we point it to target
sysroot we should not need build flags perhaps passing TOOLCHAIN_OPTIONS
would suffice

>
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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
> index bb4b53c28b..72543e60f4 100644
> ---
> a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-to=
ols/
> thin-provisioning-tools_1.1.0.bb
> +++
> b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-to=
ols/
> thin-provisioning-tools_1.1.0.bb
> @@ -21,7 +21,7 @@ inherit pkgconfig
>  DEPENDS +=3D "udev libdevmapper libdevmapper-native clang-native"
>
>  export LIBCLANG_PATH =3D "${WORKDIR}/recipe-sysroot-native${libdir}"
> -export BINDGEN_EXTRA_CLANG_ARGS =3D "${BUILD_CFLAGS}"
> +export BINDGEN_EXTRA_CLANG_ARGS =3D "${BUILD_CFLAGS}
> --sysroot=3D${RECIPE_SYSROOT} --target=3D${TARGET_SYS}"
>
>  require ${BPN}-crates.inc
>  require ${BPN}-git-crates.inc
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115688):
> https://lists.openembedded.org/g/openembedded-devel/message/115688
> Mute This Topic: https://lists.openembedded.org/mt/111413493/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000065fe0e062f224046
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 27, 2025 at 4:04=E2=80=AFAM=
 Gyorgy Sarvari via <a href=3D"http://lists.openembedded.org">lists.openemb=
edded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists.openembed=
ded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">BUILD_CFLAGS doesn&#39;t contain information about th=
e recipe sysroot nor about the target<br>
system - and in case these are not specified for bindgen, then it builds ag=
ainst<br>
the build system&#39;s headers, using the build system&#39;s arch.<br>
<br>
Specify these attributes in BINDGEN_EXTRA_CLANG_ARGS to use the correct hea=
ders.<br>
<br>
Fixes the following do_compile error:<br>
<br>
|=C2=A0 =C2=A0/usr/include/linux/types.h:5:10: fatal error: &#39;asm/types.=
h&#39; file not found<br>
|=C2=A0 =C2=A0thread &#39;main&#39; panicked at /yocto/sandbox/build/tmp/wo=
rk/cortexa72-poky-linux/thin-provisioning-tools/1.1.0/sources-unpack/cargo_=
home/bitbake/devicemapper-sys-0.3.0/build.rs:24:10:<br>
|=C2=A0 =C2=A0Could not generate dm.h bindings: ClangDiagnostic(&quot;/usr/=
include/linux/types.h:5:10: fatal error: &#39;asm/types.h&#39; file not fou=
nd\n&quot;)</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Good =
catch I forgot about target vs build here once we point it to target sysroo=
t we should not need build flags perhaps passing TOOLCHAIN_OPTIONS would su=
ffice=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
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
index bb4b53c28b..72543e60f4 100644<br>
--- a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-=
tools/<a href=3D"http://thin-provisioning-tools_1.1.0.bb" rel=3D"noreferrer=
" target=3D"_blank">thin-provisioning-tools_1.1.0.bb</a><br>
+++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-=
tools/<a href=3D"http://thin-provisioning-tools_1.1.0.bb" rel=3D"noreferrer=
" target=3D"_blank">thin-provisioning-tools_1.1.0.bb</a><br>
@@ -21,7 +21,7 @@ inherit pkgconfig<br>
=C2=A0DEPENDS +=3D &quot;udev libdevmapper libdevmapper-native clang-native=
&quot;<br>
<br>
=C2=A0export LIBCLANG_PATH =3D &quot;${WORKDIR}/recipe-sysroot-native${libd=
ir}&quot;<br>
-export BINDGEN_EXTRA_CLANG_ARGS =3D &quot;${BUILD_CFLAGS}&quot;<br>
+export BINDGEN_EXTRA_CLANG_ARGS =3D &quot;${BUILD_CFLAGS} --sysroot=3D${RE=
CIPE_SYSROOT} --target=3D${TARGET_SYS}&quot;<br>
<br>
=C2=A0require ${BPN}-crates.inc<br>
=C2=A0require ${BPN}-git-crates.inc<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#115688): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/115688" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/115688</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111413493/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111413493/1997914</a><br>
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

--00000000000065fe0e062f224046--

