Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B115C87FC3
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 16:36:46 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.24243.1724949401262652087
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Aug 2024 09:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fw4aFPFA;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2701a521f63so510711fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 09:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724949400; x=1725554200; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDCJE9iXd6XqdYTk6jR37clZOgQHTJJt86G1Zdq3PB0=;
        b=Fw4aFPFABFxT5WrkGS93Zq7OxTpu1wzwXpR4WoS6Vq1C1w9HW+VG1PajyyAhFVK/pg
         WkFU5+62MH0KvI7/D3u2IKPQn3/PjZxFr0U7I3Y3xWhQnls3SmQysBdqf4DNKDHDuQ+X
         WeCiUOublTcrT5Db3sUzdpyLsv+T9LZdzgh5oJWOiCeoJIygrvmbeb5D9vq2tfz32Pv6
         28sSpH0GzhM222hHagdicGGhPOvUeeEM2azTBcWHsrN4TFSMBbKUiUnIkm2LU16D/jL5
         SSrhJErBBCfhylqzYFVLnQ+4ge6Y/Crf1byFjU4ssJtW66NM4zlACNGRnL4MaWv1Monj
         KWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724949400; x=1725554200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDCJE9iXd6XqdYTk6jR37clZOgQHTJJt86G1Zdq3PB0=;
        b=e5ITTT5TgQaOV0mNmShs2RfPBhuAg6hN9YTQuItAvNAy7MVR/s92dP3z/ScDZfpx3D
         AzZtdomkHu1Y/D2/VHnWb4zwK3XjGdLh64qYwjwnWOaWtZfL1E5oNL1rc1hlVr96ztYU
         EutC+PfNW3opPburcJ4vDJGogoDAblivTNtl+79O+P5+x/0/b+3BBBtOB9KrbgW6P59a
         rQjNesBi3kscT3t0uBi6BOa9n6W4m4hG0epX682GrS240kUnjNhSz+JvgR6T+B/i2RC5
         YI+OzHilJsyb4pPU2BHfkFPUWJXQ7e9eFl0fttzBc4EWdZ4t2+ZC5kKAa9o2r8NIUFkA
         E8nA==
X-Gm-Message-State: AOJu0YwJH86zdvKqJTV7c+YAHHKqggMqZhGBFFPU/y6mAtIVGUnu0hzS
	jCRfQJ9MiiPiEM5eDfcPGmUIWYIC07qpQiNu3Fj9p2Tu0Qi9cadp6jq+x+Jvx9H1G4rHsm9s+yg
	vno6gqS5oPBtSpOm6EFyhm75EhTU=
X-Google-Smtp-Source: AGHT+IFDY66/GAeqGpbS7mlSNpBKvVDKIaR1zldPfNdLWpxvQyRKxuJd3L/8D2XD5he4IgottD6M89E+hBN+LJQdl6w=
X-Received: by 2002:a05:6871:149:b0:261:23f6:78d with SMTP id
 586e51a60fabf-2779031b5f7mr3790150fac.41.1724949400428; Thu, 29 Aug 2024
 09:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240829162046.49426-1-alexandre.truong@smile.fr>
In-Reply-To: <20240829162046.49426-1-alexandre.truong@smile.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Aug 2024 09:36:14 -0700
Message-ID: <CAMKF1sobQkKho_g5ZBXG+qESxf-8bhsyqgfv=uBSh6mG_8hV+g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] pegtl: add ptest support
To: alexandre.truong@smile.fr
Cc: openembedded-devel@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 16:36:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112036

Thanks for adding to ptests, it's quite an important part of the project
Its not clear if the test was run on recipe specific ptest image or
part of some larger general purpose image.

e.g. for MACHINE=3Dqemux86-64

bitbake meta-oe-image-ptest-pegtl

would build it and

bitbake meta-oe-image-ptest-pegtl -ctestimage

would run it.

This is to ensure that recipe includes all the needed rdeps for ptests to r=
un

On Thu, Aug 29, 2024 at 9:21=E2=80=AFAM Alexandre Truong via
lists.openembedded.org
<alexandre.truong=3Dsmile.fr@lists.openembedded.org> wrote:
>
> From: Alexandre Truong <alexandre.truong@smile.fr>
>
> Test added to the fast-list.
>
> Result of ptest-runner:
>
> root@qemux86-64:~# ptest-runner pegtl
> START: ptest-runner
> 2024-08-29T13:57
> BEGIN: /usr/lib/pegtl/ptest
> PASS: src/test/pegtl/pegtl-test-action_enable
> PASS: src/test/pegtl/pegtl-test-action_match
> PASS: src/test/pegtl/pegtl-test-actions_one
> [...]
> PASS: src/test/pegtl/pegtl-test-utf8_general
> PASS: src/test/pegtl/pegtl-test-visit
> PASS: All 128 tests passed
> DURATION: 4
> END: /usr/lib/pegtl/ptest
> 2024-08-29T13:57
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> NB: two tests are being skipped with a exception raised as support is dis=
abled
>
> Exception support disabled, skipping test...
> PASS: src/test/pegtl/pegtl-test-internal_file_mapper
> Exception support disabled, skipping test...
> PASS: src/test/pegtl/pegtl-test-internal_file_opener
>
> Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  .../include/ptest-packagelists-meta-oe.inc    |  1 +
>  .../recipes-extended/pegtl/pegtl/run-ptest    | 23 +++++++++++++++++++
>  meta-oe/recipes-extended/pegtl/pegtl_3.2.7.bb | 15 ++++++++++--
>  3 files changed, 37 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/pegtl/pegtl/run-ptest
>
> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-o=
e/conf/include/ptest-packagelists-meta-oe.inc
> index 01bf975a15..0ea43f5972 100644
> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> @@ -33,6 +33,7 @@ PTESTS_FAST_META_OE =3D "\
>      nodejs \
>      onig \
>      oprofile \
> +    pegtl \
>      protobuf \
>      pv \
>      python3-pefile \
> diff --git a/meta-oe/recipes-extended/pegtl/pegtl/run-ptest b/meta-oe/rec=
ipes-extended/pegtl/pegtl/run-ptest
> new file mode 100644
> index 0000000000..e819628c9f
> --- /dev/null
> +++ b/meta-oe/recipes-extended/pegtl/pegtl/run-ptest
> @@ -0,0 +1,23 @@
> +#!/bin/sh
> +
> +fail_count=3D0
> +all_count=3D0
> +
> +for test_suite in src/test/pegtl/pegtl-test-*
> +do
> +    if "./$test_suite"
> +    then
> +        echo "PASS: $test_suite"
> +    else
> +        echo "FAIL: $test_suite"
> +        fail_count=3D$((fail_count + 1))
> +    fi
> +    all_count=3D$((all_count + 1))
> +done
> +
> +if [ $fail_count -eq 0 ]
> +then
> +    echo "PASS: All $all_count tests passed"
> +else
> +    echo "FAIL: $fail_count of $all_count tests failed"
> +fi
> diff --git a/meta-oe/recipes-extended/pegtl/pegtl_3.2.7.bb b/meta-oe/reci=
pes-extended/pegtl/pegtl_3.2.7.bb
> index 237828dbfc..2e32e3e788 100644
> --- a/meta-oe/recipes-extended/pegtl/pegtl_3.2.7.bb
> +++ b/meta-oe/recipes-extended/pegtl/pegtl_3.2.7.bb
> @@ -3,11 +3,22 @@ HOMEPAGE=3D"https://github.com/taocpp/PEGTL"
>  LICENSE=3D"MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddccf35ef30bf912bb07b01d469965=
293"
>
> -SRC_URI =3D "git://github.com/taocpp/PEGTL.git;protocol=3Dhttps;branch=
=3D3.x"
> +SRC_URI =3D " \
> +       git://github.com/taocpp/PEGTL.git;protocol=3Dhttps;branch=3D3.x \
> +       file://run-ptest \
> +"
> +
>  SRCREV =3D "cf639f7f4ee125f68e1ccfba8d99ebc0de57b9fe"
>
> -inherit cmake
> +inherit cmake ptest
>
>  S =3D "${WORKDIR}/git"
>
> +do_install_ptest () {
> +    install -d ${D}${PTEST_PATH}/src/test/pegtl/data
> +    install -m 0755 ${B}/src/test/pegtl/pegtl-test-* ${D}${PTEST_PATH}/s=
rc/test/pegtl
> +    install ${S}/src/test/pegtl/file_*.txt ${D}${PTEST_PATH}/src/test/pe=
gtl
> +    install ${S}/src/test/pegtl/data/*.json ${D}${PTEST_PATH}/src/test/p=
egtl/data
> +}
> +
>  CXXFLAGS +=3D " -Wno-error=3Dtype-limits"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112035): https://lists.openembedded.org/g/openembedde=
d-devel/message/112035
> Mute This Topic: https://lists.openembedded.org/mt/108164523/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

