Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0930BC77B61
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 12:21:53 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.11058.1681388503998447065
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Apr 2023 05:21:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BsLQnsB5;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-54bfa5e698eso431649907b3.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Apr 2023 05:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681388503; x=1683980503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n/0Drb6qznDp5AXqzI7SVSoOKi7FNTm6P28qAJBMVWo=;
        b=BsLQnsB5EzahEcs92TBD8rq6ZehQCrG4gyqT8GjyfoyORU73+xMv27jvwOBnF+AD/5
         oA45q3bPMb9CquYKnBsY0en+31Qor2vgz+vxplzwaCRxvV0aZG4LyhEfT4Kk7bQNZqIV
         cGPl/vzWwh1/tc1pF9fyVjVXM75uc/KRn4+uZ7jru7AIzQagvppqOtBSCNUJ4sja25ES
         RI9gtZsTpkTB5BRdY5qwQ6PfoGzI43XTxizjaNhAr8oU5Y83VOn1YvCEfCTPQJXECNeQ
         ma5o4tEmWHfv6B/QBK0iPOzcAu/E23XzpZN2ShVCbWDo2CpIWYii5OlCef7alhJu3NTs
         54mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681388503; x=1683980503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n/0Drb6qznDp5AXqzI7SVSoOKi7FNTm6P28qAJBMVWo=;
        b=jHyTOXPSEUUVJma5g6y2f0YuVRRuGX8kwS9mgINWi5xQ7lwmIIWEOBVf5FEL4t5jAM
         LHNApNRKwtMr3/sNU8qor2Z3huZu2zGohVKv/hrAGu19OfdsheIPLvQjlJx2dKj9gi/L
         bDj05c4ljv1SWV2GHSoWRx8HB2RPrwNTI50+QRI66S3XuKmC6dou80iBBIDOB9ll/RRc
         81FXlrTW/2uLhWgI4aDRB7J2x25GpDbgdtcXF927jTYkTei99dkBOv018Tj0zAexK4bX
         SWojBxetftYsJs3I9MTzaKtc0u9wsnUHvoQjPW1Y8lnbbvhv4u678tBw6irqcgYNTQzm
         GmiA==
X-Gm-Message-State: AAQBX9cP2TVsaAMj28uUV3Qp6Nqh3SLYDydxV6Maittovx8gL0PspNmV
	uGeRkzdA4GOxw5DYdD1Gnfk=
X-Google-Smtp-Source: AKy350ZGmHdUIVL05iNOycJzLHgzoK9IG9VaJooeBRQzPqNsJwwFXXLLTXVvJfenfDPF91CTJ+KmfA==
X-Received: by 2002:a81:83d0:0:b0:54f:9e41:df58 with SMTP id t199-20020a8183d0000000b0054f9e41df58mr1571648ywf.26.1681388503096;
        Thu, 13 Apr 2023 05:21:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:c5c3:8225:dea8:e16a? ([2600:1700:9190:ba10:c5c3:8225:dea8:e16a])
        by smtp.gmail.com with ESMTPSA id 68-20020a810b47000000b00545a0818495sm427168ywl.37.2023.04.13.05.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 05:21:42 -0700 (PDT)
Message-ID: <6c1cacf2-256c-fe70-6879-5742f6de9ede@gmail.com>
Date: Thu, 13 Apr 2023 08:21:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [oe][meta-oe][kirkstone][PATCH] flatbuffers: adapt for
 cross-compilation environments
Content-Language: en-US
To: BINDU <bindudaniel1996@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
 Bhabu Bindu <bhabu.bindu@kpit.com>, Ivan Stepic <Ivan.Stepic@bmw.de>
References: <20230407043845.1314587-1-bindudaniel1996@gmail.com>
 <1377940a-ba4f-f8a4-2032-7179c72ccb71@gmail.com>
 <CAFGCuZW+x0DQf6NJ_OzRPyLuaw+uqvLNuwhN_MvT=v9ogZ4uEg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <CAFGCuZW+x0DQf6NJ_OzRPyLuaw+uqvLNuwhN_MvT=v9ogZ4uEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Apr 2023 12:21:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102078



On 4/13/23 3:02 AM, BINDU wrote:
> Hello @akuster808@gmail.com <mailto:akuster808@gmail.com> ,
>
> This is fixed in a different way in master, so this doesn't need to be 
> be done for master.

thanks for checking.

- armin
>
>
>
> On Fri, 7 Apr, 2023, 5:15 pm akuster808, <akuster808@gmail.com> wrote:
>
>
>
>     On 4/7/23 12:38 AM, BINDU wrote:
>     > Flatbuffers contains a library and a schema compiler. The package
>     > contains cmake files to discover the libraries and the compiler
>     tool.
>     > Currently, all of these cmake files are installed into the target
>     > sysroot. However, the compiler utility isn't installed into the
>     sysroot
>     > (as it is not runnable on the build machine).
>     >
>     > When an application that depends on flatbuffers gets built, it uses
>     > flatbuffers' exported cmake targets to configure the project.
>     One of the
>     > exported targets is FlatcTarget.cmake which expects to see flatc
>     binary
>     > in /usr/bin of the sysroot. Since binaries for target don't end
>     up in
>     > target sysroot, cmake configuration fails.
>     >
>     > This patch addresses this problem of flatbuffers' build
>     infrastructure
>     > in cross-compiling environments. By removing FlatcTarget.cmake for
>     > target builds from the sysroot we essentially skip this step of
>     > flatbuffers' configuration.
>
>     Does this need to be done in Master as well?
>
>     -armin
>     >
>     > Signed-off-by: Ivan Stepic <Ivan.Stepic@bmw.de>
>     > Signed-off-by: Bhabu Bindu <bindudaniel1996@gmail.com>
>     > ---
>     >   meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
>     <http://flatbuffers_2.0.0.bb> | 7 ++++++-
>     >   1 file changed, 6 insertions(+), 1 deletion(-)
>     >
>     > diff --git
>     a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
>     <http://flatbuffers_2.0.0.bb>
>     b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
>     <http://flatbuffers_2.0.0.bb>
>     > index bf74f1229..44478ea0b 100644
>     > --- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
>     <http://flatbuffers_2.0.0.bb>
>     > +++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
>     <http://flatbuffers_2.0.0.bb>
>     > @@ -25,12 +25,17 @@ BUILD_CXXFLAGS += "-fPIC"
>     >   # BUILD_TYPE=Release is required, otherwise flatc is not installed
>     >   EXTRA_OECMAKE += "\
>     >       -DCMAKE_BUILD_TYPE=Release \
>     > -    -DFLATBUFFERS_BUILD_TESTS=OFF \
>     > +    -DFLATBUFFERS_BUILD_TESTS=OFF \
>     >       -DFLATBUFFERS_BUILD_SHAREDLIB=ON \
>     >   "
>     >
>     >   inherit cmake
>     >
>     > +rm_flatc_cmaketarget_for_target() {
>     > +    rm -f
>     "${SYSROOT_DESTDIR}/${libdir}/cmake/flatbuffers/FlatcTargets.cmake"
>     > +}
>     > +SYSROOT_PREPROCESS_FUNCS:class-target +=
>     "rm_flatc_cmaketarget_for_target"
>     > +
>     >   do_install:append() {
>     >       install -d ${D}${PYTHON_SITEPACKAGES_DIR}
>     >       cp -rf ${S}/python/flatbuffers ${D}${PYTHON_SITEPACKAGES_DIR}
>     >
>     > -=-=-=-=-=-=-=-=-=-=-=-
>     > Links: You receive all messages sent to this group.
>     > View/Reply Online (#101976):
>     https://lists.openembedded.org/g/openembedded-devel/message/101976
>     > Mute This Topic: https://lists.openembedded.org/mt/98119685/3616698
>     > Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     > Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     [akuster808@gmail.com]
>     > -=-=-=-=-=-=-=-=-=-=-=-
>     >
>


