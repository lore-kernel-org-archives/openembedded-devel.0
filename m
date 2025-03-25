Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7935C3600B
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 16:41:59 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.539.1742920912559453102
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 09:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RqrFYkNQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3f8df49e75fso1434098b6e.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742920912; x=1743525712; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T63yMmTZKgUTc12qG0jMoRbrZwcxynsJf4fwA8w1Yqg=;
        b=RqrFYkNQtUaplIwzrygN2x+sqqEKDAMe77LkzDw31Rnv5chhl970GWvA5c8Mzf62In
         8aL8OmVvOwm3uvkikYa6jc32hcDckXJySN53wSJ9WzEKzTi0DKkqvyIy9ac6FfG8ltnZ
         4lNMwUD+MGVC5P92ptHypXxbhlShh/WEUbMLagNrU86kgWlXmWGdo0hsaakU5qqdNY3l
         x6JAkxd9H50VacXzP0bGwW9DdCd4PIAQY1buMqPCc/4ODTjlQllSwwd8qlPHCSBN3h5p
         rZhX7MvkCrqns4S1BTOHk3/8EahfBFnhd4MnRQ+opFK788W4CS7cXX1tDZuEmReBGkrd
         YSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742920912; x=1743525712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T63yMmTZKgUTc12qG0jMoRbrZwcxynsJf4fwA8w1Yqg=;
        b=ANotIDQ+ngiFdmGQW5GKJjj0LoKnyE6leTnQW6MrN0O9HIJXpecSwO3SzxzGEyzVA8
         /82dGb/y81VoPb2CARozaexfoX9IdC07SqPDddGrQsS7aRfgH6wfggnWtBONuek4hBZv
         T4bNq1rtww7YcaEJnPolBCGzeMF27ympRs/lcjokrJHREzbfyCKTz8Jg/AgGSuMelsJD
         KGjquF4nJynAFjjgDg+Fmb8pDS7y2xZf32WUxLOb+YXxWy0xzWmoF7FPPcWPXy44nPWf
         x8dS01/6tI8L6T6oUlDQJ0Rw3d52CEBz71XRHEWVimTv+jD1mp1qTia7NuVXrx90yRST
         0iog==
X-Gm-Message-State: AOJu0YyaEpGZLnruqDxSRMOKy+UiNOkZFYcMxeuIwKP5EEyIjKfdzZ/5
	U3z617n8nDq9WjUaafnCV+eByfMP3f1hupjJvRzcdYZnLqdYs+XbkkRVpjqjiKA0ixE7vmv5A/P
	AbWh2cb9jjXL7hmsLFVEZclbLP/9svl5F
X-Gm-Gg: ASbGncsu/QDg+NU4neMT8CUupL2VcibXy7ik7SxEtDrGsx8x96q3xn5mkbi6zOmVmwH
	q2gdYNI+0zEei5pkDuR9PNbSsEbpy4Wq2njax7IAYOx1mjXwpqpRapIKuzTCHDmxM2uevTl5KYz
	GUYnw0AErf2kZl5wn5azDJ3ET0vQ==
X-Google-Smtp-Source: AGHT+IGem5ltdxRnMAeDBkZSbi5xY/KC4bOAfJVPs9jSy8QlnvVnL936IUNqIA7Rg5tpVu1Wf/ezeuaVIWIyE8d0PZI=
X-Received: by 2002:a05:6808:7008:b0:3f8:debb:7683 with SMTP id
 5614622812f47-3febf73a82bmr14081066b6e.23.1742920911539; Tue, 25 Mar 2025
 09:41:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250325124524.81338-1-mark.yang@lge.com>
In-Reply-To: <20250325124524.81338-1-mark.yang@lge.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Mar 2025 09:41:25 -0700
X-Gm-Features: AQ5f1Jp1MqynrW8DdGyh3ldAJSTPZKEZoZ01ZtNVl_flG66hCoCVIjDJQNT89y0
Message-ID: <CAMKF1sr3=T-Kojp8RRX5PzC=MW_en87va+r7k0xGa5LDFzAjMw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] jq: fix build with gcc-15.0.1
To: mark.yang@lge.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 16:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116280

seems it is already part of Martin's patch

On Tue, Mar 25, 2025 at 6:50=E2=80=AFAM mark.yang via lists.openembedded.or=
g
<mark.yang=3Dlge.com@lists.openembedded.org> wrote:
>
> From: "mark.yang" <mark.yang@lge.com>
>
> * to fix: http://errors.yoctoproject.org/Errors/Details/848776/
>
> * If upgrade the version of jq, the build will succeed when
>   https://github.com/jqlang/jq/commit/0b82b3841b05faefe0ac18379bdb361b7e4=
e3464 is included.
>
> I'd like to backport it, but It have to backport a lot of patches.
>
> Signed-off-by: mark.yang <mark.yang@lge.com>
> ---
>  .../0001-Fix-gcc-15.0.1-compile-error.patch   | 46 +++++++++++++++++++
>  meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |  1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/0001-Fix-gcc-15.0.1-co=
mpile-error.patch
>
> diff --git a/meta-oe/recipes-devtools/jq/jq/0001-Fix-gcc-15.0.1-compile-e=
rror.patch b/meta-oe/recipes-devtools/jq/jq/0001-Fix-gcc-15.0.1-compile-err=
or.patch
> new file mode 100644
> index 0000000000..fe7c5d2f40
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/jq/jq/0001-Fix-gcc-15.0.1-compile-error.pa=
tch
> @@ -0,0 +1,46 @@
> +From d40319093e517aedc6de610215bf571698a5e60b Mon Sep 17 00:00:00 2001
> +From: "mark.yang" <mark.yang@lge.com>
> +Date: Tue, 25 Mar 2025 15:20:15 +0900
> +Subject: [PATCH] Fix gcc-15.0.1 compile error
> +
> +* to fix: http://errors.yoctoproject.org/Errors/Details/848776/
> +../jq-1.7.1/src/builtin.c:1705:4: error: initialization of 'jv (*)(void)=
' from incompatible pointer type 'jv (*)(jq_state *, jv)' [-Wincompatible-p=
ointer-types]
> + 1705 |   {f_ ## name,  #name, 1},
> +
> +The function pointer in bytecode.h is ambiguously defined.
> +   struct cfunction {
> +     jv (*fptr)();  // function pointer with no parameters
> +     const char* name;
> +     int nargs;
> +   };
> +I think that previous versions of GCC allowed casting between function p=
ointers with
> +no parameters and function pointers with parameters,
> +but GCC 15.0.1 treats this as an error.
> +Changed to void *fptr to make the function pointer not bound to a specif=
ic signature.
> +
> +* If upgrade the version of jq, the build will succeed when
> +  https://github.com/jqlang/jq/commit/0b82b3841b05faefe0ac18379bdb361b7e=
4e3464 is included.
> +
> +I'd like to backport it, but It have to backport a lot of patches.
> +
> +Signed-off-by: mark.yang <mark.yang@lge.com>
> +
> +Upstream-Status: Inappropriate [oe specific]
> +---
> + src/bytecode.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/bytecode.h b/src/bytecode.h
> +index 1501985..c8ab39a 100644
> +--- a/src/bytecode.h
> ++++ b/src/bytecode.h
> +@@ -46,7 +46,7 @@ const struct opcode_description* opcode_describe(opcod=
e op);
> +
> + #define MAX_CFUNCTION_ARGS 10
> + struct cfunction {
> +-  jv (*fptr)();
> ++  void *fptr;
> +   const char* name;
> +   int nargs;
> + };
> +
> diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-de=
vtools/jq/jq_1.7.1.bb
> index 6b12335513..9d762f6660 100644
> --- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
> +++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
> @@ -11,6 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D488f4e0b04c0=
456337fb70d1ac1758ba"
>  GITHUB_BASE_URI =3D "https://github.com/jqlang/${BPN}/releases/"
>  SRC_URI =3D "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.g=
z \
>      file://run-ptest \
> +    file://0001-Fix-gcc-15.0.1-compile-error.patch \
>      "
>  SRC_URI[sha256sum] =3D "478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df=
703873deeee580c2"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116277): https://lists.openembedded.org/g/openembedde=
d-devel/message/116277
> Mute This Topic: https://lists.openembedded.org/mt/111897169/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

