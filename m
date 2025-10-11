Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54817CCD187
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 03:04:41 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.web11.4327.1760151878592571296
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Oct 2025 20:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ePBG2jK4;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-63470a6f339so2652294d50.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 20:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760151878; x=1760756678; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvCOTrV3ncl2WsTOKvYZ6jjwM/tfvcXNEX97BtoNIBA=;
        b=ePBG2jK4MVpYY+5hx12SU675vLBQwsZpV6qVg0fVA/mzh3vtVSM35MUVpPEVP/xjw7
         qETIWbErSkX37BTWG7lxXu5nQgvJOcDPR+zoQmlucQUmMVxsTGyRShwxgyXM8nixhmhk
         zk7oLgT0FPlpZiscD0ith/W5AVS7AhmoPrKtcsDyctzHEvhYDP7vm/Nr0ZQe1j5uGgYh
         UnaK0ERAPCwAZfN6puV3MYdEdm7vYTyEIQN49TUqXcTiv8lrFVNo8EfNK9twYeyKFZej
         eitwgTJ5ijCAXwUK0TdSsMbAXkb/mCC1LTznJp9KnHvcYKoY0jrnPYekkp51ngqPml6M
         GaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760151878; x=1760756678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KvCOTrV3ncl2WsTOKvYZ6jjwM/tfvcXNEX97BtoNIBA=;
        b=EddqZTBhzBBq0CaXXf3zDvy2AxxzdkQ3KiydBjx62Czhy8WviJSsgXHBGozwe+PVVD
         XB0ufEyCpAPTY6Eq/t61Y7DZ8ayBN/VJvBkqjUBWkwb5bZ4e21/x41aKFcBckLoDpd/f
         SqP6Qfeho7gwqvgwQVPMjQ4atoJz2dhnTp2B7ITw8Jt1vfWNIzAJZYVfr3lLVsCka4Ef
         SnWhd6wT1IFnb+d7agZcEqW6bOJiC0QSELxCErZ6jbVcXw4DU0PLA5rQftwMHZHOi0uV
         PgkpJpuG5s9JEfvEzRqwhMsanigYAL1TN3K8IqLas66tsZgAqYXhFupwaS2XL39SoShV
         im+A==
X-Gm-Message-State: AOJu0YxK4KbhgfpBCZjJ6a10ml8l/dV/m3pj9JIf/xmgQxPOljNMLZmm
	nLSc+nNavSPwcXj6REYNV0dEq+2gWq4d3eiXhI/Wep8BWaGrmzkbw53jipLmQM7OJAqzvsHyu66
	46cQDfzPY62ziRvVaiDIUgQASl5T8FN8=
X-Gm-Gg: ASbGnctBL1bczJwLK0PfJ9XH2hm73ZK575v6efplzKd0Alp/qJrvYffRiEfi748dzjj
	jg1W7HwDwihPYz/hsonNJ15KsN/UQESYfBeiFQo5jLrFedXGW7Uqh13YGcK0HpSJRQ2KW0wffja
	phOotkUPToz/FH38Ev7F5NorCQpMfI26OYPHJaBoTiXndSXBjxL6KlrtZPXP2AOqsZIk1v+1wZ4
	THw1rc5byq63XOHmzIje4cwCnqpNoWE6pfy00v2
X-Google-Smtp-Source: AGHT+IE4Vfbcb4oq10Ut41ZMLGcnEcuh7XXPaMEevvkC+R5ElTkshz6SAhBpiLO2gvRGKpBOArzRACeBfGn5CnhohqI=
X-Received: by 2002:a05:690c:688d:b0:764:b3c2:826a with SMTP id
 00721157ae682-780e1559023mr248491507b3.16.1760151877600; Fri, 10 Oct 2025
 20:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <186D1A99E7CAB2E7.15959@lists.openembedded.org>
 <186D4D2D26934862.13356@lists.openembedded.org> <3fb55984-0078-468f-8908-e91ccb23a4de@windriver.com>
In-Reply-To: <3fb55984-0078-468f-8908-e91ccb23a4de@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Oct 2025 20:04:11 -0700
X-Gm-Features: AS18NWDfjtk8Wnrl1JF3gbFPviNjchEJUtzuUA72RtvOiLp7sRVfPDJC7ZRYzr8
Message-ID: <CAMKF1souUxpU1-F=od3V92G0FSUg7e_hqiEnyEKYMjUj7NzLAA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH V2] doxygen: fix reproducibility issue of doxygen-src
To: Changqing Li <changqing.li@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 03:04:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120490

On Fri, Oct 10, 2025 at 7:04=E2=80=AFPM Changqing Li <changqing.li@windrive=
r.com> wrote:
>
> Hi, Khem
>
> I do 2 changes for this patch,  and I noticed this patch is on master-nex=
t, could you please help to update it, sorry to bother  you.
>

Thanks for the note, I have taken v2.

> Changes in V2:
>
> * Add space before #ifndef to avoid it is taken as comment, and missed in=
 commit message
>
> * Remove doxygen-src from OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES
>
> Thanks
>
> Changqing
>
> On 10/11/25 09:58, Changqing Li via lists.openembedded.org wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> [ snip of CMakeLists.txt ]
> BISON_TARGET(constexp
>              ${CMAKE_CURRENT_LIST_DIR}/constexp.y
>              ${GENERATED_SRC}/ce_parse.cpp
>              COMPILE_FLAGS "${YACC_FLAGS}")
> [ end of snip ]
>
> bison embeds full paths in its generated headers, eg:
> bison -o /full/build/path/generated/example.cpp ...
> The header will include:
>  #ifndef YY_FULL_BUILD_PATH_GENERATED_MSCGEN_LANGUAGE_HPP_INCLUDED
>  #define YY_FULL_BUILD_PATH_GENERATED_MSCGEN_LANGUAGE_HPP_INCLUDED
>
> This make doxygen-src not reproducible, fix by replacing full build path
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-oe/conf/layer.conf                            |  1 -
>  meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb | 10 ++++++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index 5b9ceb424e..56aea73b15 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -138,7 +138,6 @@ OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES +=3D " \
>      dhrystone-src \
>      directfb \
>      directfb-dbg \
> -    doxygen-src \
>      edid-decode \
>      edid-decode-dbg \
>      editorconfig-core-c-dev \
> diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb b/meta-oe=
/recipes-devtools/doxygen/doxygen_1.14.0.bb
> index 512a63549e..73594fc09f 100644
> --- a/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
> +++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
> @@ -22,4 +22,14 @@ EXTRA_OECMAKE +=3D "\
>      -DBISON_TARGET_ARG_COMPILE_FLAGS=3D'--no-lines' \
>  "
>
> +do_install:append() {
> +    sed -i -e 's;^#ifndef.*GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED$;#=
ifndef GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED;g' ${B}/generated_src/msc=
gen_language.hpp
> +    sed -i -e 's;^# define.*GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED$;=
# define GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED;g' ${B}/generated_src/m=
scgen_language.hpp
> +    sed -i -e 's;^#endif.*GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED.*$;=
#endif;g' ${B}/generated_src/mscgen_language.hpp
> +
> +    sed -i -e 's;^#ifndef.*GENERATED_SRC_CE_PARSE_HPP_INCLUDED$;#ifndef =
GENERATED_SRC_CE_PARSE_HPP_INCLUDED;g' ${B}/generated_src/ce_parse.hpp
> +    sed -i -e 's;^# define.*GENERATED_SRC_CE_PARSE_HPP_INCLUDED$;# defin=
e GENERATED_SRC_CE_PARSE_HPP_INCLUDED;g' ${B}/generated_src/ce_parse.hpp
> +    sed -i -e 's;^#endif.*GENERATED_SRC_CE_PARSE_HPP_INCLUDED.*$;#endif;=
g' ${B}/generated_src/ce_parse.hpp
> +}
> +
>  BBCLASSEXTEND =3D "native nativesdk"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120487): https://lists.openembedded.org/g/openembedde=
d-devel/message/120487
> Mute This Topic: https://lists.openembedded.org/mt/115699816/3616873
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [c=
hangqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

