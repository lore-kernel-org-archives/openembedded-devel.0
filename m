Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09441C43334
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 16:30:03 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.9797.1657816195159422821
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jul 2022 09:29:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iMFVarqd;
 spf=pass (domain: gmail.com, ip: 209.85.216.52,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 t5-20020a17090a6a0500b001ef965b262eso3595592pjj.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jul 2022 09:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=Uh4vREVupLdj/jQVdrnvctTAZR/g2qLVZ0IXrIPxQQ8=;
        b=iMFVarqdwARYvsoQchM1Q7g8RnhZJG0jSXFJHTTrCNn/dJKtqgQWcDrJOfBE6CS5R4
         nx3ynNDglCdmA7zH4Y0HmWERfcdEYmHdc8ikzbKvmbbUdL9zFChPcJn9wiBJFSIzpgR1
         zJszoGuniA8KOHvX+KDTEkk8R9f6idbHnUERe2nCq3oqIB1zv5CN62tKmGpjF1EHOOxb
         5LF1Q7RZA7WY11CfPUkrK7ZY4S3lrE52FsNYLnKt6oYn9S8pDsQI4hyXmy55hIskq+iZ
         h/oX4GjJt7dhJd87JCXnheHPCu4vOmPt+GxvbrVWogipvLAHOLspV/ylyVLlQLz+qguk
         cz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Uh4vREVupLdj/jQVdrnvctTAZR/g2qLVZ0IXrIPxQQ8=;
        b=A7aOykHfkDu+fucm/T2ztRvTie5MH/r9uA7H7JkaclzPo3/O8N9ke3jCkSeSnSDDdG
         7KSLEJ4U9q+1e/KZY1vUk4yBBhRstRTsdDNGg94q9EhWxhaCbikfkflB+ha0wQ18kRVd
         FkCWV/Ja9DleolYUmPTY+T1mQnWAOcDr3ji0PCxIA+01IuTEt1wB3ljwpYkiXaQWpIB1
         FoGhIJPgDtk78oZf0GPb601eMwPTEXYY/Q/InSU3I8zwrADbAc6gxPu4GWmqr0Y0DdVA
         767pqwOt7voUGafQsPEqbBLRC/4HPV+JpNDkZ2dvnSxgA3MDqUL1oIYE8cHamxBZel0c
         nZtQ==
X-Gm-Message-State: AJIora8HV8kzXY/u0aXS/Ma88ocMZMpJvyp+ZYOQYRUMjtMyERt/4cur
	gqzFPUz0jrX/EtFKK9LDRA6QGydD9yM=
X-Google-Smtp-Source: 
 AGRyM1s5rS0l4JEeVExJ9RJ0yCYARtdfj5clMnKEArD5Ijm2aaMw0f74+i8N4ymOCU9osar++33wHA==
X-Received: by 2002:a17:902:ebc9:b0:16b:e585:c24f with SMTP id
 p9-20020a170902ebc900b0016be585c24fmr9242976plg.33.1657816193722;
        Thu, 14 Jul 2022 09:29:53 -0700 (PDT)
Received: from [192.168.18.39] (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 e29-20020aa7981d000000b0052a8128699fsm1923012pfl.207.2022.07.14.09.29.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 09:29:49 -0700 (PDT)
Message-ID: <127230c7-9aa6-aff2-59ed-8a5c51b274c4@gmail.com>
Date: Thu, 14 Jul 2022 09:27:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [oe] [meta-oe][master][kirkstone][PATCH] protobuf-c: update to
 1.4.1 fix CVE-2022-33070
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20220712012947.381745-1-wentao.zhang@windriver.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20220712012947.381745-1-wentao.zhang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Jul 2022 16:30:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97831

pick this up from master

On 7/11/22 18:29, Wentao Zhang wrote:
> From: Wentao Zhang <wzhang4@ala-lpd-susbld2.wrs.com>
>
> Signed-off-by: Wentao Zhang <wzhang4@ala-lpd-susbld2.wrs.com>
> ---
>   .../protobuf/{protobuf-c_1.4.0.bb => protobuf-c_1.4.1.bb}     | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-oe/recipes-devtools/protobuf/{protobuf-c_1.4.0.bb => protobuf-c_1.4.1.bb} (90%)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
> similarity index 90%
> rename from meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
> index b3423ba84..d724287d6 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
> @@ -8,12 +8,12 @@ has been split out into the protobuf-c-rpc project."
>   HOMEPAGE = "https://github.com/protobuf-c/protobuf-c"
>   SECTION = "console/tools"
>   LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=cb901168715f4782a2b06c3ddaefa558"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=9f725889e0d77383e26cb42b0b62cea2"
>   
>   DEPENDS = "protobuf-native protobuf"
>   
>   SRC_URI = "git://github.com/protobuf-c/protobuf-c.git;branch=master;protocol=https"
> -SRCREV = "f224ab2eeb648a818eb20687d7150a285442c907"
> +SRCREV = "abc67a11c6db271bedbb9f58be85d6f4e2ea8389"
>   
>   S = "${WORKDIR}/git"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97812): https://lists.openembedded.org/g/openembedded-devel/message/97812
> Mute This Topic: https://lists.openembedded.org/mt/92324722/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


