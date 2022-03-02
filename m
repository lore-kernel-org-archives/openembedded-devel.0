Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D727FC433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 01:20:45 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web09.2741.1646184045103867711
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 17:20:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l5vuBH+h;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id 185so148107qkh.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 17:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RAWOgbth9bVOzZ0pfCdahyNWsRmFofjCsoKzYntMOys=;
        b=l5vuBH+hiP+Sqoo0G6/Qqqo3UZDfQgTsIMb4JZoBFTmAh80WLXnDOo+Lns55+2YLE2
         oguk/UU31HpIgT7ELnVWBSQT0a+7/xKFMQg2+cojLqB/2Oo0j86Qjn3p6CSp9vovkPmJ
         JDX8pTSEDcKZmaACUx35zcg8ZtMgzi8KQ9V0sVOpf1qCujrDAw1zrvsQfa8cx8lr8TEM
         71QePdcPFk7xh5wg87gqYHh+EHxh194KzaKPBYePAyO3R98fSbxlFAUWXGxdgJLKK9/W
         xDv8t3ZekNFFzNOCW5K5mdW8Vh5yOP2Ozm5fnj5o9/bs8KorTloAk2oXoe6iEF55UV2l
         7ctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RAWOgbth9bVOzZ0pfCdahyNWsRmFofjCsoKzYntMOys=;
        b=DpMHb1HicTel3LK3ny9LkmOmzDYYCK/z35B+ktCku76Z5R1hYJsVjh+VGBD4d5L2kk
         8o3Ge95iI0iXLSOTT2/OFVnl8WrzhM5i/aEU5xrzqG4qN/TqJIL9BOW1bvOeiVcdt5xr
         AlBH/xhNUkERFVIwu76suwOsUcZPlZ/4o/65oT5GGSYDeA/WDcI+Rzt/avMSPJacv+/e
         LSzzYlZTwrcg7Ma16zNv6CCxK7AdRbenDVkdiTw3h93YOeKlAZN5RjySmwn/FThqjUYJ
         t6SGMh8ZJTLRTCxorwX4ok0nBOeLpmw/S1/F9oVH+l95D7HEptRZlaKjUXSQf0jIV0qT
         iJCw==
X-Gm-Message-State: AOAM531erKGZz9nRQ2bR2/pW3G+IZ1G1pFWFu1ljX8d9FjbOFwSa+XCU
	G7jtqyfEITGXOk1U1HMl9V/8LvAwB5DJ7HC0zxg=
X-Google-Smtp-Source: 
 ABdhPJxifxBP3+cAkn4wpoanNwNHl2zpeeyAKCvYefMFabDerVXP7Y493kiBDMDZfiZEXGFpyAIqeBjRBcQbuCqSQyY=
X-Received: by 2002:a05:620a:16d5:b0:60d:d3a7:af9e with SMTP id
 a21-20020a05620a16d500b0060dd3a7af9emr15094106qkn.463.1646184044153; Tue, 01
 Mar 2022 17:20:44 -0800 (PST)
MIME-Version: 1.0
References: <20220301203354.3839755-1-tim.orling@konsulko.com>
In-Reply-To: <20220301203354.3839755-1-tim.orling@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Mar 2022 17:20:18 -0800
Message-ID: 
 <CAMKF1sqeRX6LOeL2NnW7TB6JJc4-hZX2Z2aPivx-gF6_jtFW+w@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/9] python3-poetry-core: add v1.0.8
To: Tim Orling <ticotimo@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 01:20:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95670

with latest core/master-next it needs to set PIP_INSTALL_PACKAGE, i
have added a patch to do so.

On Tue, Mar 1, 2022 at 12:34 PM Tim Orling <ticotimo@gmail.com> wrote:
>
> A PEP 517 build backend implementation developed for Poetry. This project
> is intended to be a light weight, fully compliant, self-contained package
> allowing PEP 517 compatible build frontends to build Poetry managed projects.
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  .../python/python3-poetry-core_1.0.8.bb       | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb b/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb
> new file mode 100644
> index 0000000000..0941af9ff9
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb
> @@ -0,0 +1,56 @@
> +SUMMARY = "Poetry PEP 517 Build Backend"
> +DESCRIPTION = "Poetry PEP 517 Build Backend"
> +HOMEPAGE = "https://github.com/python-poetry/poetry-core"
> +BUGTRACKER = "https://github.com/python-poetry/poetry-core"
> +CHANGELOG = "https://github.com/python-poetry/poetry-core/blob/master/CHANGELOG.md"
> +
> +LICENSE = "Apache-2.0 & BSD-2-Clause & MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=104d5c3c653aeededf4076773aa4c236 \
> +                    file://poetry/core/_vendor/attrs.LICENSE;md5=75bb9823a2778b5a2bd9b793fac93ea2 \
> +                    file://poetry/core/_vendor/jsonschema/COPYING;md5=6554d3a51d7cb0b611891317f3c69057 \
> +                    file://poetry/core/_vendor/jsonschema/LICENSE;md5=2ecb81765361195731a6f72a89e449fd \
> +                    file://poetry/core/_vendor/lark-parser.LICENSE;md5=b37b83a9cf129d92ee65aaa71c01ce72 \
> +                    file://poetry/core/_vendor/packaging/LICENSE;md5=7a6e56c9d54ecd731ab31c52de7942f0 \
> +                    file://poetry/core/_vendor/packaging/LICENSE.APACHE;md5=29256199be2a609aac596980ffc11996 \
> +                    file://poetry/core/_vendor/packaging/LICENSE.BSD;md5=f405810d173a1618433827928768bcd2 \
> +                    file://poetry/core/_vendor/pyparsing.LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a \
> +                    file://poetry/core/_vendor/pyrsistent/LICENSE.mit;md5=1211a1ac6eac40020d0f99c39b4e4270 \
> +                    file://poetry/core/_vendor/six.LICENSE;md5=6a574656da93d9ef05431b45907e35b6 \
> +                    file://poetry/core/_vendor/tomlkit/LICENSE;md5=be329e5ef9c9fe86738c9afe6ef3c11c \
> +                    "
> +
> +SRC_URI[sha256sum] = "951fc7c1f8d710a94cb49019ee3742125039fc659675912ea614ac2aa405b118"
> +
> +inherit pip_install_wheel python3native python3-dir pypi setuptools3-base
> +
> +RDEPENDS:${PN}:append:class-target = "\
> +    python3-compression \
> +    python3-core \
> +    python3-crypt \
> +    python3-io \
> +    python3-json \
> +    python3-logging \
> +    python3-netclient \
> +    python3-pathlib2 \
> +    python3-pprint \
> +    python3-shell \
> +"
> +
> +RDEPENDS:${PN} += "\
> +    python3-pip \
> +    python3-six \
> +"
> +
> +do_configure () {
> +    mkdir -p ${B}/dist
> +    cat > ${B}/build-it.py << EOF
> +from poetry.core.masonry import api
> +api.build_wheel('${B}/dist')
> +EOF
> +}
> +
> +do_compile () {
> +    ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${B}/build-it.py
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95648): https://lists.openembedded.org/g/openembedded-devel/message/95648
> Mute This Topic: https://lists.openembedded.org/mt/89486853/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

