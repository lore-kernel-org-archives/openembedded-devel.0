Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BDA2C352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 18:33:03 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.23990.1670437975547629537
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Dec 2022 10:32:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jzJZel2D;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-14449b7814bso17353261fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 10:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DWJwL9ApdwxiI4wggtPrzznbIEbANaBuoJMVgP8MKK4=;
        b=jzJZel2DAvaRCy/7LqyNmthAEwZtvt6zLOgMShJ+p9ffUVlFXZrSsGt5kX8Rkis9w+
         GhLMtQ2pckgIxrlh/kw32El0vCCbJ0aGRbFXXOiCXTJ8L9sX+Ca2bP9QR1VcyX+dXtk0
         VLOmgP4T5w+joZv0bQvt3Kp4PBrY6Wsw+YmaK+nLEbBqOjd0d+Uh7p4aMvNqYdVbU3bg
         urfEHfMo01bHoiJyOWGHIa/NyT9orVd9MRocaGRakbnB6ceTOyaVHZpwEcHC/tdiXGIz
         Q1dp75o2hHJlXyhD44vqRfleDyiblCq33FiKEbuBj3xDEE/QCygB4OmXqpHlfFn8qGv7
         agFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DWJwL9ApdwxiI4wggtPrzznbIEbANaBuoJMVgP8MKK4=;
        b=pBIyE+EK3PBVb3ykqE9Q0JIcLA2atY1Vzqd2eVqSb3oWb7eGWUJt0GQUIGmWO6W/zp
         RAOT/6qJs+Tk0Zwx0YlJ1s3UnggYkHWKSAM8LnDGos7ftu4s5jZslX85b2WjTdSm0ZjQ
         JKkcMkPGzBFSkH+Z4xOs+xJuE//5vCk8tlUOkPJ7J0EkumBmtHlTJQJOjzz99QvLNu3D
         EdC4KjIpH49u1zQdE4r1QGhvY0v+4N7vjE1whSy7YLmqZpoBURlWn/uxBcOgUHk/81Mj
         RyymrGPV/GMMzJmHoXaWC8COLiqYFuLWSaUpEkYT8rz47/Mja+BhSqp08RSp9gBsuLaF
         DHow==
X-Gm-Message-State: ANoB5plwRaWKkgn09NfpaNqdm4P8QnN6ABe1/tz97zlEEBSybfzpM38W
	egMKm9MYLjGLQoXnpA4hCHlzx1B7CNk=
X-Google-Smtp-Source: AA0mqf6Xq/Vaouh4T8x2EiFFraQkGHxxmhkixt0xZ20xRLhAu5CGZlCWKiYBTUCLQTzWmFrozJ8Ssw==
X-Received: by 2002:a05:6870:a2cd:b0:137:3adf:af1e with SMTP id w13-20020a056870a2cd00b001373adfaf1emr556002oak.28.1670437974785;
        Wed, 07 Dec 2022 10:32:54 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:f05f:3481:d22e:56a2? ([2600:1700:9190:ba10:f05f:3481:d22e:56a2])
        by smtp.gmail.com with ESMTPSA id s11-20020a056870ea8b00b00143d4709a38sm12565760oap.55.2022.12.07.10.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 10:32:54 -0800 (PST)
Message-ID: <d89c3a17-c188-6452-13ab-ee2f91e2c9b6@gmail.com>
Date: Wed, 7 Dec 2022 13:32:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe][meta-oe][kirkstone][PATCH] protobuf: upgrade 3.19.4 ->
 3.19.6
Content-Language: en-US
To: He Zhe <zhe.he@windriver.com>, openembedded-devel@lists.openembedded.org
References: <20221207114011.28123-1-zhe.he@windriver.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20221207114011.28123-1-zhe.he@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 18:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99982



On 12/7/22 6:40 AM, He Zhe wrote:
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>   .../protobuf/{protobuf_3.19.4.bb => protobuf_3.19.6.bb}         | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-oe/recipes-devtools/protobuf/{protobuf_3.19.4.bb => protobuf_3.19.6.bb} (98%)

Is this a bug fix only update?

-armin
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb
> similarity index 98%
> rename from meta-oe/recipes-devtools/protobuf/protobuf_3.19.4.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb
> index 566233084..8e5005471 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.4.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
>   DEPENDS = "zlib"
>   DEPENDS:append:class-target = " protobuf-native"
>   
> -SRCREV = "22d0e265de7d2b3d2e9a00d071313502e7d4cccf"
> +SRCREV = "c9297981b7c35ad9c2bf258e7c8d786a04d13378"
>   
>   SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=3.19.x;protocol=https \
>              file://run-ptest \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99974): https://lists.openembedded.org/g/openembedded-devel/message/99974
> Mute This Topic: https://lists.openembedded.org/mt/95513566/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


