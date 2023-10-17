Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A13CDB465
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 01:52:14 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.198598.1697507530488522425
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Oct 2023 18:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AoLLk6Br;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3b2b1ad7ee6so2218854b6e.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Oct 2023 18:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697507530; x=1698112330; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=se8E0rmYwrrxQEEUXYePMToZSrM/rn7Cph6vyAmv5fc=;
        b=AoLLk6Br3xzPWT1alvieHUdxEiZSa0lvBevsFZA+oKnGvkqyvRO443Tn4Bikb+eB4O
         +jeAu5Pib7YkmqA+7/2KG2J+1Zhr1RprLux+J3KB9dWwt4Mg/Jz6kTiB5Wf6TmZqctmo
         4xIsj8YzqY4kPXXOUaU9sus0mEawi4O+VE4S8o+CfovCZTKKZj2xzybPB1XgA7T3HqFa
         +6SEuTPPWSqIBkhlqEBJgEmK8texXOi4plrjOuH7N3zjJQei9HXRmDHN7z5gSpbMWLJU
         KPrZ7ND+f8hHKkl1LmzHWiW9Fby74gXBBEFHGMdZCpByDsroeepNNkscmAYamL+iVlIr
         HtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697507530; x=1698112330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=se8E0rmYwrrxQEEUXYePMToZSrM/rn7Cph6vyAmv5fc=;
        b=rZ+bqYuuMnaFSNyr/j6FyxIC6LWy5rZgev1z4ftkLovS4B7JwOwDCeWZGKnYETjiZY
         qEsXp0wIg+MqZ5cOE1rAYVN9fM/ZWYisH/LojG7ppCBrxGVEUhEatkL6rtqEyTiSwEsh
         IdYIsBtBSUenfXMbjeG7vnLXPQ8z7OoCOxIpaMQ9H/j3s21F13iKsfi8Gxz+sDLRf19T
         eeu+t6Q9uYDEWKXmViBGo0ZVGJLxW7aSnpZaCUYVavxb21pa0+6uD++9DDaMwYHLgQDy
         PAEsW8/PrpKAxKPuTATikoucS77fZwTgR1Rq8+jD5KS5Mr4A+8Yz1ooNdvCIua3asYtt
         yjBA==
X-Gm-Message-State: AOJu0YwQzoc7x97jckV04uTxlKpXqdC6WuI50k9jZRvThg9N8m2j749Y
	g/OYOu9pGHxb7rTAE2YehGTuDAMYYJ95hk342amZOJe8BE1ueA==
X-Google-Smtp-Source: AGHT+IEhjr2kfhCqZy3OnGnPZdlprblfxyoikJzd8BYOye0xUp8UxNd/vsmzUO/OGkyLkklTJMwhBHXYQqus7ykOnDM=
X-Received: by 2002:a05:6870:4997:b0:1ea:85a:db2e with SMTP id
 ho23-20020a056870499700b001ea085adb2emr916718oab.45.1697507529660; Mon, 16
 Oct 2023 18:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231017011718.144753-1-chi.xu@windriver.com>
In-Reply-To: <20231017011718.144753-1-chi.xu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Oct 2023 18:51:43 -0700
Message-ID: <CAMKF1srPUnze5t5win9RhH_XOfC+dcCxafsz_v7dtmkZduCErQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] re2: Add ptest support
To: Chi Xu <chi.xu@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 01:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105546

Thanks for adding ptest, I see that it passes all tests but runs for
longer. Maybe add it to PTESTS_SLOW_META_OE as well.

On Mon, Oct 16, 2023 at 6:17=E2=80=AFPM Chi Xu <chi.xu@eng.windriver.com> w=
rote:
>
> From: Chi Xu <chi.xu@windriver.com>
>
> Test results:
> root@qemux86-64:~# ptest-runner re2 -t 7200
> START: ptest-runner
> 2023-10-16T08:36
> BEGIN: /usr/lib/re2/ptest
> PASS: charclass_test
> PASS: compile_test
> PASS: filtered_re2_test
> PASS: mimics_pcre_test
> PASS: parse_test
> PASS: possible_match_test
> PASS: re2_test
> PASS: re2_arg_test
> PASS: regexp_test
> PASS: required_prefix_test
> PASS: search_test
> PASS: set_test
> PASS: simplify_test
> PASS: string_generator_test
> PASS: dfa_test
> PASS: exhaustive1_test
> PASS: exhaustive2_test
> PASS: exhaustive3_test
> PASS: exhaustive_test
> PASS: random_test
> DURATION: 2085
> END: /usr/lib/re2/ptest
> 2023-10-16T09:11
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> Signed-off-by: Chi Xu <chi.xu@windriver.com>
> ---
>  meta-oe/recipes-support/re2/re2/run-ptest     |  3 +++
>  meta-oe/recipes-support/re2/re2_2023.03.01.bb | 16 +++++++++++++---
>  2 files changed, 16 insertions(+), 3 deletions(-)
>  create mode 100644 meta-oe/recipes-support/re2/re2/run-ptest
>
> diff --git a/meta-oe/recipes-support/re2/re2/run-ptest b/meta-oe/recipes-=
support/re2/re2/run-ptest
> new file mode 100644
> index 000000000..8bd5fd1ef
> --- /dev/null
> +++ b/meta-oe/recipes-support/re2/re2/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +ctest --force-new-ctest-process | sed -u 's/\*\*\*/   /g' | awk '/Test +=
#/{gsub(/Passed/,"PASS"); gsub(/Failed/,"FAIL"); gsub(/Skipped/,"SKIP"); pr=
int $6": "$4; fflush();}'
> diff --git a/meta-oe/recipes-support/re2/re2_2023.03.01.bb b/meta-oe/reci=
pes-support/re2/re2_2023.03.01.bb
> index 78bf695a4..fe210d510 100644
> --- a/meta-oe/recipes-support/re2/re2_2023.03.01.bb
> +++ b/meta-oe/recipes-support/re2/re2_2023.03.01.bb
> @@ -6,17 +6,27 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b5c31eb512b=
df3cb11ffd5713963760"
>  # tag 2023-03-01
>  SRCREV =3D "241e2e430836e80f93d704d1f06cd3e7fe3100f5"
>
> -SRC_URI =3D "git://github.com/google/re2.git;branch=3Dmain;protocol=3Dht=
tps"
> +SRC_URI =3D "git://github.com/google/re2.git;branch=3Dmain;protocol=3Dht=
tps \
> +           ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest'=
, '', d)} \
> +          "
>
>  S =3D "${WORKDIR}/git"
>
> -inherit cmake
> +inherit cmake ptest
> +RDEPENDS:${PN}-ptest +=3D "cmake sed"
>
>  EXTRA_OECMAKE +=3D " \
>         -DBUILD_SHARED_LIBS=3DON \
> -       -DRE2_BUILD_TESTING=3DOFF \
> +        ${@bb.utils.contains('PTEST_ENABLED', '1', '-DRE2_BUILD_TESTING=
=3DON', '-DRE2_BUILD_TESTING=3DOFF', d)} \
>  "
>
> +do_install_ptest () {
> +    cp -r ${B}/*_test ${D}${PTEST_PATH}
> +    cp -r ${B}/CTestTestfile.cmake ${D}${PTEST_PATH}
> +    sed -i -e 's#${B}#${PTEST_PATH}#g' `find ${D}${PTEST_PATH} -name CTe=
stTestfile.cmake`
> +    sed -i -e 's#${S}#${PTEST_PATH}#g' `find ${D}${PTEST_PATH} -name CTe=
stTestfile.cmake`
> +}
> +
>  # ignore .so in /usr/lib64
>  FILES:${PN} =3D "${libdir}"
>  INSANE_SKIP:${PN} +=3D "dev-so"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105545): https://lists.openembedded.org/g/openembedde=
d-devel/message/105545
> Mute This Topic: https://lists.openembedded.org/mt/102010115/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

