Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93562C6FD1D
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 11:46:04 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.5358.1680867956413751117
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Apr 2023 04:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=Ac35c4Jw;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-54c0dd7e2f3so85274527b3.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 04:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680867955; x=1683459955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v2cbQsFHaJ78oE+2Fpe1+LyTiwLeSOzwJCAs7OnNyXQ=;
        b=Ac35c4Jwm+9GaCljcL2AP17FbXW1bsOWxChfwgqlEVcxOlABDwbCyNLxaaEeOjDwGX
         ueY8HVx9pfu6Yz8orjDIj+uMQS7F6dRQANrKPAPNSubp195xSwCWX4+ssevyJwcLaegp
         j8KmTCT8z4OxVOtnHb8374oF8Uc++Vpf/fKlQRX9T1PuaEsrbmNU9pxLZ8ccvje9sEoE
         mAGXo2cc0dKg2wB2QE03y5tNhqxh3oXDHIgHdAZ4Th7r9eQy3kzd4rIPUXVnbAfOu7RZ
         nEjnDSd+W7eNHX/eo1BvGpHjGOex2HOJdNvmESh/BAPHRxMG6//RqTLttHkVV6rAgogt
         csfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680867955; x=1683459955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v2cbQsFHaJ78oE+2Fpe1+LyTiwLeSOzwJCAs7OnNyXQ=;
        b=bryyI+DJKbaagimsWyKuSFNx6IldLgsaNBWKo8yg04ld1zsurBxVn51ntlB4Aqqbw+
         6T4j+ORSA6tlVGtU7O7bDc/BPrkztIVHwGWJd5sWTFWu14WrdaNQVM0NMvoJGx+i8K9d
         kZQ02vTUtth0quTqWIHJwVop33r5s6rHuwP4OzcpKdZ1tMnZzvNr6Zu9K5WIjlJn+raO
         HzHoTd8aT/KViO/kITos43vv998tFvQz3rcjudD9tCWlInG2dAzFc1ZCaMhTfPq4Rdk7
         bTlXhhFsrVheM+/ztDeJsyWrVX88MElrE3W7wilWOLPsWKAwewS0jlxHKvzdzQEtgYDb
         4jdQ==
X-Gm-Message-State: AAQBX9eG0iy462OJUO6FX17Dol4tI3stbteq3Gl5opq5XYgKlDgMhqmj
	GSaGkf8DXXHu5900U6y7NDo=
X-Google-Smtp-Source: AKy350aj9O/FLo8rGxCy1HloHX+tCvC/fz/V8WxZctVNvXFxxMUd692a4EeQMhnlwxkUMip8371/0g==
X-Received: by 2002:a81:8352:0:b0:54d:61e0:c821 with SMTP id t79-20020a818352000000b0054d61e0c821mr1054030ywf.24.1680867955488;
        Fri, 07 Apr 2023 04:45:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:58ca:ec79:9c9b:289b? ([2600:1700:9190:ba10:58ca:ec79:9c9b:289b])
        by smtp.gmail.com with ESMTPSA id l11-20020a0de20b000000b00545a08184edsm957900ywe.125.2023.04.07.04.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 04:45:55 -0700 (PDT)
Message-ID: <1377940a-ba4f-f8a4-2032-7179c72ccb71@gmail.com>
Date: Fri, 7 Apr 2023 07:45:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [oe][meta-oe][kirkstone][PATCH] flatbuffers: adapt for
 cross-compilation environments
Content-Language: en-US
To: BINDU <bindudaniel1996@gmail.com>,
 openembedded-devel@lists.openembedded.org, bhabu.bindu@kpit.com
Cc: Ivan Stepic <Ivan.Stepic@bmw.de>
References: <20230407043845.1314587-1-bindudaniel1996@gmail.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20230407043845.1314587-1-bindudaniel1996@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 11:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101984



On 4/7/23 12:38 AM, BINDU wrote:
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

Does this need to be done in Master as well?

-armin
>
> Signed-off-by: Ivan Stepic <Ivan.Stepic@bmw.de>
> Signed-off-by: Bhabu Bindu <bindudaniel1996@gmail.com>
> ---
>   meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
> index bf74f1229..44478ea0b 100644
> --- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
> +++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
> @@ -25,12 +25,17 @@ BUILD_CXXFLAGS += "-fPIC"
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
>   do_install:append() {
>       install -d ${D}${PYTHON_SITEPACKAGES_DIR}
>       cp -rf ${S}/python/flatbuffers ${D}${PYTHON_SITEPACKAGES_DIR}
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101976): https://lists.openembedded.org/g/openembedded-devel/message/101976
> Mute This Topic: https://lists.openembedded.org/mt/98119685/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


