Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF474C7115B
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 17:39:31 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.2637.1750441164197520366
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Jun 2025 10:39:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CY/iAjiK;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-70a57a8ffc3so19334697b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 10:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750441163; x=1751045963; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIlFdY7jjwXgUL8ep3R8el+o8aW+S2gX0ahjTiqrndw=;
        b=CY/iAjiKMLPeo8KiepJgW6+NNkTCAucrA4jGZs3SrD9t/Nix6kuQ1fojS/sHbUBKsg
         AE0GJXeTIzUyLYy435r93J1Hw4kgNPmZoguB7Ao+bWqOzpY6g9zn/Ls1Mzx0q5vi/S8n
         /SdcX+mz7UX5zBec9gGDP0aGy8MeuQuV8Sqfoe6pdnWdIczWbXr7Xb3h4LHEoLKqKhdI
         +St2yp6eX/8f0KHWZHju5jL+nbntI/Wd54H37LPjgQ1fIvW/bti/wdbP0j+YRnF46BN1
         MwtaaQLaB+XHuxM6AfZ47EL7PUKHxK0ggXUpxC9URxwJJyMvd/kzh0CYLYJDtbWDNZ7G
         vdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750441163; x=1751045963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIlFdY7jjwXgUL8ep3R8el+o8aW+S2gX0ahjTiqrndw=;
        b=ZM1J/TNXkXh52wAyY2+dc8bBfnxTYkYGf6XMvvnhtSit9Ok4z6JyZ9XKasmhNLj4Id
         vDOXtEXZY+S4bTYNThl6GI3b7ZI8nhDaM6IZo2P1dJhDdFk7WpKnRwpNcKQU18ksWW4S
         ZVFkBbLZGirQkGG8xHWQJsVlQS/w6NdUOQaoUGWIaZ1cjtLlsCrDjeFR81RAeLjMNl04
         O7KCz99Oeo2IYMhVXhrBQsQqWPPsl8ics5R8DfKxb5d/ScWXbhh6t4Yd0taq1ddAtt1X
         H/CT/L4EHNu0l+VUj5mRFepHU8dPcqr2Ntej4X9N58RA4QvHztzx+eXopsQInozyBD+j
         m7nw==
X-Gm-Message-State: AOJu0Yxo3hEReAujKBUlaADcW13tS/U3mZiDkbXK0D0TzXrkkO/GNNkW
	XAwZXOTY49/8ZZPV3PYlC/KVtXwgzrUd6MEmk/bY5Ew11atpqqgUhJuWSvL0SVAKhVXL0p96C5b
	jQDLk3M8BxPTx09uyQZsNHrqOaaeyHes=
X-Gm-Gg: ASbGncvLlmeKLk7EsZont6dHXyfngi5LdnssPd3UI2BPKjC/ceOd3FlJqzLw7qRiba5
	pKQBrJ/dse89pba81ikRb8fTED1+2qKLu0PoYk5x4m+Z50pE7ntSJM19k2FliMQLmwTq7Mumnvi
	qEg0tCIirHpNv+mFc8ZDRcGXU9GF24q2LYbeROqKCuFw==
X-Google-Smtp-Source: AGHT+IF+SGvnbKsbuG7wrLVjtKVHK9BXTGR+Z0/OXAGZG4H28NBhG+VtlZXVB+5ro00VdAiMPOk9dyzmuxFy5MRTbaw=
X-Received: by 2002:a05:690c:5506:10b0:712:d54e:2209 with SMTP id
 00721157ae682-712d54e2895mr3276257b3.14.1750441163206; Fri, 20 Jun 2025
 10:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250620101405.2455812-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250620101405.2455812-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Jun 2025 10:38:56 -0700
X-Gm-Features: AX0GCFtmQIUGf-M2kgwydpGkDXfyj1ZzNh_a9IbbO5V4OixD_Tr6f-fbN10FdSI
Message-ID: <CAMKF1soTE4VvLTHRcAVDkby4UnM2v18hojkie3RQY_zuwgZTPg@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded] [PATCH] suitesparse: Update after
 toolchain selection changes
To: richard.purdie@linuxfoundation.org
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 17:39:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117983

Hi RIchard,

This one looks better than other proposals for this recipe so far, but
I am not able to apply it, would be good to rebase it on master-next
and resend

On Fri, Jun 20, 2025 at 3:14=E2=80=AFAM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> The toolchain selection changes mean CC is not set until after the recipe
> is parsed, breaking the manipulations made by this recipe.
>
> Replace it with code to inherit the cmake class, which correctly
> configures cmake to use the right compiler/compiler flags.
>
> We need to patch the makefiles to avoid those options being added
> incorrectly.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../suitesparse/makefile-quoting.patch        | 32 +++++++++++++++++++
>  .../suitesparse/suitesparse_5.10.1.bb         |  7 ++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/make=
file-quoting.patch
>
> diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse/makefile-qu=
oting.patch b/meta-oe/recipes-devtools/suitesparse/suitesparse/makefile-quo=
ting.patch
> new file mode 100644
> index 0000000000..6bd2ffbb55
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/suitesparse/suitesparse/makefile-quoting.p=
atch
> @@ -0,0 +1,32 @@
> +OE's CC and CXX contain spaces and extra options which is incompatible w=
ith
> +cmake way of handling them. Remove passing the compiler options this way=
 in
> +favour of our normal cmake toolchain files added elsewhere.
> +
> +Upstream-Status: Pending
> +
> +Index: git/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/Makefile
> ++++ git/Makefile
> +@@ -282,7 +282,7 @@ metis: include/metis.h
> + # hardcoded below.
> + include/metis.h:
> + ifeq (,$(MY_METIS_LIB))
> +-      - ( cd metis-5.1.0 && $(MAKE) config shared=3D1 prefix=3D$(SUITES=
PARSE) cc=3D$(CC) )
> ++      - ( cd metis-5.1.0 && $(MAKE) config shared=3D1 prefix=3D$(SUITES=
PARSE) )
> +       - ( cd metis-5.1.0 && $(MAKE) )
> +       - ( cd metis-5.1.0 && $(MAKE) install )
> +       - $(SO_INSTALL_NAME) $(SUITESPARSE)/lib/libmetis.dylib \
> +Index: git/SuiteSparse_config/SuiteSparse_config.mk
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/SuiteSparse_config/SuiteSparse_config.mk
> ++++ git/SuiteSparse_config/SuiteSparse_config.mk
> +@@ -146,7 +146,7 @@ SUITESPARSE_VERSION =3D 5.10.1
> +         endif
> +     endif
> +
> +-    CMAKE_OPTIONS +=3D -DCMAKE_CXX_COMPILER=3D$(CXX) -DCMAKE_C_COMPILER=
=3D$(CC)
> ++    #CMAKE_OPTIONS +=3D -DCMAKE_CXX_COMPILER=3D$(CXX) -DCMAKE_C_COMPILE=
R=3D$(CC)
> +
> +     #------------------------------------------------------------------=
---------
> +     # CFLAGS for the C/C++ compiler
> diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb b=
/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
> index b113145808..29f114a9dc 100644
> --- a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
> +++ b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
> @@ -4,6 +4,7 @@ SRC_URI =3D "git://github.com/DrTimothyAldenDavis/SuiteSp=
arse;protocol=3Dhttps;branc
>             file://0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.pa=
tch \
>             file://0002-Preserve-links-when-installing-libmetis.patch \
>             file://0003-Add-version-information-to-libmetis.patch \
> +           file://makefile-quoting.patch \
>             "
>  SRCREV =3D "538273cfd53720a10e34a3d80d3779b607e1ac26"
>
> @@ -14,11 +15,17 @@ DEPENDS =3D "cmake-native lapack gmp mpfr chrpath-nat=
ive"
>  PROVIDES =3D "mongoose graphblas"
>  RPROVIDES:${PN} =3D "mongoose graphblas"
>
> +inherit cmake
> +
> +B =3D "${S}"
> +
>  export CMAKE_OPTIONS =3D " \
>      -DCMAKE_INSTALL_PREFIX=3D${D}${prefix} \
>      -DCMAKE_INSTALL_LIBDIR=3D${baselib} \
>  "
>
> +OECMAKE_SOURCEPATH =3D "${S}/Mongoose ${S}/metis-5.1.0 ${S}/GraphBLAS"
> +
>  do_compile () {
>         oe_runmake library
>  }
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117967): https://lists.openembedded.org/g/openembedde=
d-devel/message/117967
> Mute This Topic: https://lists.openembedded.org/mt/113739884/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

