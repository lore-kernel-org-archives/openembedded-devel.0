Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2C0C4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 14:42:04 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.17175.1668696118813014655
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Nov 2022 06:41:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RjbDy1AF;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id v7-20020a4aa507000000b00496e843fdfeso317444ook.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Nov 2022 06:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ljSyDavJov9UyWYmlnjrETtnk9CGcK70M9ik9dIfBsI=;
        b=RjbDy1AFHFqLE57zEIN9HCcPrEsv9Pd2fCDx8tS0X0eDplu5rpYlDs0NUlqKJyVCVF
         eTyv+5dqOh2UV57W8w/BXORgUwsBvSYLgXdyM0vYC3BXhaH6znduDAvdfNyuZIPV/CxG
         Xa1SKEvRb0GawYHOykYVPLqRHtepe7iWZDpw/ZXDh3zf6JerJ7GRs4hY2NR/Hklb0PrA
         LqdBnTh5OMlotUs8IXQg4LnI/M8nghibtS1lhzU7jj6EkWJnNXn6/8P9jGGZtMzqF3pl
         QFVF8/AnYalsl/vF//d5Z6JbsEt0WIh5oLcR7gVlNQ9mOYMVITx2pmAmSLRn2lj3DB+K
         f0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ljSyDavJov9UyWYmlnjrETtnk9CGcK70M9ik9dIfBsI=;
        b=02XI8zc0YLIMOexyNTAf6n9OQI0u68NXovW7D0QwX5nE8YXFjW/1yraLpUOG0poRZL
         c17DXHpRbYd/4Cx5XE/hEfC5LTSsBDFCVR1D6X3oRnb8VIpxAbA3TFNve/5JgxdeTtuw
         Jkv5W0FqKb4HBQBTY0GZ0b4dKU7CMAx15aiycQ6XkvXnliwCEtPi14zmTbwza/IoW57+
         fw2PhY0wiVojq6NU9AL5WfhrmeDSGgYuTjk8DBQ3feiUAat2n0oYAOaT6jopMXpmZCp4
         hDYcXbSjzkYLwnqMueMpPyyvpMRAJdYWjafPy0wqiufn7asVTgzFJqgrnMvFOWu51XZc
         59Gw==
X-Gm-Message-State: ANoB5pns3glGn6Mg5i9a4s/i1xrg9csdGWn4S86Ks5oc8B+zhbr8I4qN
	QdeMMat98gpb2v3Y8e/rDH4=
X-Google-Smtp-Source: AA0mqf6IfWBp48G3KBhzqQMS8yiTYoxt2DyrYY+QbvXAeNAzEXjlrhcFtJnVmNuq52WI7s6sS4jjZA==
X-Received: by 2002:a4a:d64d:0:b0:49e:e5dd:9ac8 with SMTP id y13-20020a4ad64d000000b0049ee5dd9ac8mr1418470oos.43.1668696118047;
        Thu, 17 Nov 2022 06:41:58 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:f729:3f6d:92d:73af? ([2600:1700:9190:ba10:f729:3f6d:92d:73af])
        by smtp.gmail.com with ESMTPSA id r23-20020a4acb17000000b0047f72b6988fsm356347ooq.45.2022.11.17.06.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 06:41:57 -0800 (PST)
Message-ID: <a513c661-7b83-c16d-6824-1060981979cc@gmail.com>
Date: Thu, 17 Nov 2022 09:41:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe][meta-oe][dunfell][PATCH] flatbuffers: adapt for
 cross-compilation environments
Content-Language: en-US
To: BINDU <bindudaniel1996@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Ivan.Stepic@bmw.de, nisha.m.parrakat@bmw.de,
 Bhabu Bindu <bhabu.bindu@kpit.com>
References: <20221117115119.11222-1-bindudaniel1996@gmail.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20221117115119.11222-1-bindudaniel1996@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Nov 2022 14:42:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99608



On 11/17/22 6:51 AM, BINDU wrote:
> From: Ivan Stepic <Ivan.Stepic@bmw.de>
>
> Flatbuffers contains a library and a schema compiler. The package
> contains cmake files to discover the libraries and the compiler tool.
> Currently, all of these cmake files are installed into the target
> sysroot. However, the compiler utility isn't installed into the sysroot
> (as it is not runnable on the build machine).
>
> When an application that depends on flatbuffers gets built, it uses
> flatbuffers' exported cmake targets to configure the project. One of the
> exported targets is FlatcTarget.cmake which expects to see flatc binary
> in /usr/bin of the sysroot. Since binaries for target don't end up in
> target sysroot, cmake configuration fails.
>
> This patch addresses this problem of flatbuffers' build infrastructure
> in cross-compiling environments. By removing FlatcTarget.cmake for
> target builds from the sysroot we essentially skip this step of
> flatbuffers' configuration.

Are any of the other branches affected by this issue?
- armin
>
> Signed-off-by: Ivan Stepic <Ivan.Stepic@bmw.de>
> Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> ---
>   meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
> index 859d6a0b0..c4f3594f3 100644
> --- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
> +++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
> @@ -24,12 +24,17 @@ BUILD_CXXFLAGS += "-std=c++11 -fPIC"
>   # BUILD_TYPE=Release is required, otherwise flatc is not installed
>   EXTRA_OECMAKE += "\
>       -DCMAKE_BUILD_TYPE=Release \
> -    -DFLATBUFFERS_BUILD_TESTS=OFF \
> +    -DFLATBUFFERS_BUILD_TESTS=OFF \
>       -DFLATBUFFERS_BUILD_SHAREDLIB=ON \
>   "
>   
>   inherit cmake
>   
> +rm_flatc_cmaketarget_for_target() {
> +    rm -f "${SYSROOT_DESTDIR}/${libdir}/cmake/flatbuffers/FlatcTargets.cmake"
> +}
> +SYSROOT_PREPROCESS_FUNCS:class-target += "rm_flatc_cmaketarget_for_target"
> +
>   S = "${WORKDIR}/git"
>   
>   FILES_${PN}-compiler = "${bindir}"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99604): https://lists.openembedded.org/g/openembedded-devel/message/99604
> Mute This Topic: https://lists.openembedded.org/mt/95087923/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


