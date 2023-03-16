Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB6DC6FD1F
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 16:36:38 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.17198.1678984588558439404
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Mar 2023 09:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RqRdz8pk;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id eh3so9928045edb.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 09:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678984587;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RLvL9npnln7+ByJ/024aZu55pDtO3Pf80iZBZT4c8YI=;
        b=RqRdz8pkRwWsgEWMIPNpY82Fg+UUldZFc9pqFc0wFmA/24JNpnZrHDmYF1Z3Y/IRsU
         oXt1IFXINvujavtfEm7DfqKhHxGMyWUyw7Tl2EHpDecPSrFJxOlIBQQaXDcwa1wh8JE/
         0Ae/5RtGKeqccGRE6lNbmgX2I9HYGrB8+rO7bIAlJFVImvxtrzQHJ15cqUAnWKN12hhW
         Mx68vWUQbiPVSA70PciHF9Dj79qLUZh6DeBuq51UZN6ZwmYe/vGEMKIi4MJeaAVc8hSt
         xnyNsTL0U9HlrtmbHJXYkJ8N0jy5tSuEYuT+wOaw4LfgQ+uq3sDgu18kn0QQkm0rXyPj
         FhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678984587;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RLvL9npnln7+ByJ/024aZu55pDtO3Pf80iZBZT4c8YI=;
        b=Z+luOkovMSFHIrDnSoh527/TabCfBNnmIOFhHOQ0CHAoZH2U1rs1qDITT2Wzvv+5zJ
         Ag9Wy9pbsi1BTx5UznwVs3KW8NQZG4IBKb30OIz/kIQ0P1axBu0KVSFK5F0v+LzWLki5
         p/Z/bAmDcT6xbaVk+YbcA4LZyO/u1yS0SpII2hINhqfKIH9CKcjvXRmOnHAg7n3BJY85
         pkvIV8OSjMpFq4VrKIdgYFDSU9GSj5w6DDUfDmOVrq5fB1sEfuGDEngEbS1zkCnuAFLg
         l0CuczjTt9UUVqaVoNl3aFoM3BvLwPg46P3k+lf9QAcdQwyu4EbqsXyT7ckt0yM1wBiK
         5f1g==
X-Gm-Message-State: AO0yUKXIN3gVQj+NLvCI6SR6wZVdO8/wnNH7Zhr1GCNNrKYqbbM3DgyC
	+mAxCOEz76+Yga9tpi3KTE4=
X-Google-Smtp-Source: AK7set9rIS4Ax0zpmiHGusiojdXOslcMe4prSluAG6gDwF7SrHf+NXzXReIlvaAzx1nA+vVondHCMQ==
X-Received: by 2002:a17:907:c60a:b0:92f:e40d:1489 with SMTP id ud10-20020a170907c60a00b0092fe40d1489mr4842200ejc.61.1678984586697;
        Thu, 16 Mar 2023 09:36:26 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ja19-20020a170907989300b008cf8c6f5c43sm4013405ejc.83.2023.03.16.09.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 09:36:26 -0700 (PDT)
Message-ID: <3fbc9811-77d2-de5d-7587-edc9eb65e782@gmail.com>
Date: Thu, 16 Mar 2023 17:36:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [oe] [meta-python][PATCH 1/4]
 python_setuptools_build_meta_mesonpy.bbclass: New class
Content-Language: en-US
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230315080429.2722555-1-zboszor@gmail.com>
 <CANx9H-B4=5sY3_0Y2LFZPt1eexFPn7fRq4SfyqJ76+yx=LXEVw@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANx9H-B4=5sY3_0Y2LFZPt1eexFPn7fRq4SfyqJ76+yx=LXEVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 16:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101581

2023. 03. 16. 16:51 keltezéssel, Tim Orling írta:
>
>
> On Wed, Mar 15, 2023 at 1:04 AM Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>
>     Some python modules (e.g. SciPy, scikit-image) use meson-python
>     (a.k.a. mesonpy) in pyproject.toml:
>
>         [build-system]
>         build-backend = 'mesonpy'
>
>     This class, together with python3-meson-python and its dependencies
>     will allow building such modules.
>
>     Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>     ---
>      ...python_setuptools_build_meta_mesonpy.bbclass | 17 +++++++++++++++++
>      1 file changed, 17 insertions(+)
>      create mode 100644 meta-python/classes/python_setuptools_build_meta_mesonpy.bbclass
>
>
> The name of the class is overly long. If you look at the other classes in oe-core, they 
> basically use the build-backend value,
> prefixed with the "python_" namespace, so I would propose just "python_mesonpy.bbclass"

I agree. I will shorten the name of the class.

>
> The python_setuptools_build_meta.bbclass was named as such because the build-backend is 
> "setuptools.build_meta"
> such as in https://github.com/jaraco/zipp/blob/main/pyproject.toml#L3
>
>
>     diff --git a/meta-python/classes/python_setuptools_build_meta_mesonpy.bbclass
>     b/meta-python/classes/python_setuptools_build_meta_mesonpy.bbclass
>     new file mode 100644
>     index 000000000..1d3fdbd7c
>     --- /dev/null
>     +++ b/meta-python/classes/python_setuptools_build_meta_mesonpy.bbclass
>     @@ -0,0 +1,17 @@
>     +#
>     +# Copyright OpenEmbedded Contributors
>     +#
>     +# SPDX-License-Identifier: MIT
>     +#
>     +
>     +inherit setuptools3-base pkgconfig meson-common python3targetconfig python_pep517
>     +
>     +DEPENDS += "python3-setuptools-native python3-wheel-native ${@'' if d.getVar('PN')
>     == 'python3-meson-python-native' else 'python3-meson-python-native'}"
>     +
>     +PEP517_BUILD_OPTS = '--config-setting=setup-args="${MESONOPTS} ${MESON_SOURCEPATH}
>     ${B} ${MESON_CROSS_FILE} ${EXTRA_OEMESON}"'
>     +
>     +export MESONPY_BUILD = "${B}"
>     +
>     +# Python pyx -> c -> so build leaves absolute build paths in the code
>     +INSANE_SKIP:${PN} += "buildpaths"
>     +INSANE_SKIP:${PN}-src += "buildpaths"
>     -- 
>     2.39.2
>
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#101529):
>     https://lists.openembedded.org/g/openembedded-devel/message/101529
>     Mute This Topic: https://lists.openembedded.org/mt/97622993/924729
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
>     [ticotimo@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>


