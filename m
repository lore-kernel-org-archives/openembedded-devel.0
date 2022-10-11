Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08400C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 04:50:48 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web09.3845.1665463843401604488
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 21:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jUSVPU51;
 spf=pass (domain: gmail.com, ip: 209.85.167.169,
 mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id m130so14755261oif.6
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 21:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CNHzOFzI8E36b1jhxz3wjkSRDY4Dkh2OUwLslHRnoOY=;
        b=jUSVPU51tH3OTRGCF7+Dmnh/K+4ocZKg45najvAVEEMA+6mEQPXiUcOxMZ2UHphTfV
         6qiguoAFTc0QwU2MxId30OyVRODKopOwRXwBCmv3jMT1TeceN+KZINvp04SdUgl5fRYv
         deYOqtWyAhMINt6CeOzkz1H5FXLOnF38/xiA6z1VKhDML5uZhsHcqeaLMJvrgas/Wl0r
         +wbWBIZGuBn/M1ET6q+2lg4SNBBu6e59uRomDAGXQJDuILZi67ifsV4yeo0XK9rGLMTk
         smCf34/5kvBbXLxc2amn7DCWvltfqwIzq/A9+fc5Q7y1383AMOAq61xGiwZfoGVEyZOZ
         aSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CNHzOFzI8E36b1jhxz3wjkSRDY4Dkh2OUwLslHRnoOY=;
        b=zsF+DO7wXTibnjBbZVZxBJ5fwpvz2tz4ZutaX8yhNTO9IdaImOLep/qQJI3sJ/4I2O
         YDqVg7ChuZClzYD5aXdp4AQjo1rKNhsg7iMTLBQkQzoXh+Bu5O+b8+TCyNH5HYlUJwCX
         PAwGqAXSl4bWt/GctWRcL20sMB+gkPMDC0TC5nJVyo2u5LbTHa36lg6BDOYIdxXvjHm9
         1vDLpvWR4VOqgL1w+Ye5hETrTFb9m2o8RX/oCDy+Y1LtAny/7bXiuzv4yQgFDVhgjJso
         AEMzzjB5RNc2MZgTdMUAJi7D9UdhtnrhZgZRHbHGoj3wHY4Kd2Gra8FuB5IoZCnhB2pr
         y93A==
X-Gm-Message-State: ACrzQf3PYBTzSGzN1fG6FLA3N4BaN9luaGT1Wl/EA+3tQZnh8ue8iqAM
	ytopr/+triiVxzuukGil2dw=
X-Google-Smtp-Source: 
 AMsMyM5DFY8h9k8HPNJSApm1Mi8driY+oKdHCf58tpb5gyMhsePFv0146sjTE+kaf6eRNMR8WKIVxQ==
X-Received: by 2002:a05:6808:1187:b0:353:a617:6acd with SMTP id
 j7-20020a056808118700b00353a6176acdmr10956897oil.105.1665463841771;
        Mon, 10 Oct 2022 21:50:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:5b70:d42e:512f:41cc?
 ([2600:1700:9190:ba10:5b70:d42e:512f:41cc])
        by smtp.gmail.com with ESMTPSA id
 w23-20020a4a3557000000b00480549b424asm4008074oog.34.2022.10.10.21.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 21:50:41 -0700 (PDT)
Message-ID: <a887a257-5b32-85e0-34fd-9c9c9542d5d0@gmail.com>
Date: Tue, 11 Oct 2022 00:50:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] cglm: New recipe for cglm-0.8.5
Content-Language: en-US
To: Vincent Davis Jr <vince@underview.tech>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
References: <20221009215337.7867-1-vince@underview.tech>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20221009215337.7867-1-vince@underview.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Oct 2022 04:50:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99136



On 10/9/22 5:53 PM, Vincent Davis Jr wrote:
> Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

The Stable branch policy does not support adding new packages.

-armin
> ---
>   meta-oe/recipes-graphics/cglm/cglm_0.8.5.bb | 25 +++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>   create mode 100644 meta-oe/recipes-graphics/cglm/cglm_0.8.5.bb
>
> diff --git a/meta-oe/recipes-graphics/cglm/cglm_0.8.5.bb b/meta-oe/recipes-graphics/cglm/cglm_0.8.5.bb
> new file mode 100644
> index 000000000..5a437c102
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/cglm/cglm_0.8.5.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "OpenGL Mathematics Library for C"
> +DESCRIPTION = "Highly optimized 2D|3D math library, also known as OpenGL Mathematics (glm) for `C`. \
> +cglm provides lot of utils to help math operations to be fast and quick to write. It is community \
> +friendly, feel free to bring any issues, bugs you faced."
> +HOMEPAGE = "https://github.com/recp/cglm"
> +BUGTRACKER = "https://github.com/recp/cglm/issues"
> +SECTION = "libs"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8dc95c4110ba741c43832734b51b7de7"
> +
> +SRC_URI = "git://github.com/recp/cglm;branch=master;protocol=https"
> +# Tag v0.8.5
> +SRCREV = "7e5d1f435f628b873347eb052b7d6605b0b997f2"
> +
> +S = "${WORKDIR}/git"
> +
> +PACKAGECONFIG[build_tests] = "-Dbuild_tests=true,-Dbuild_tests=false,"
> +
> +PACKAGECONFIG ?= ""
> +
> +inherit meson pkgconfig
> +
> +EXTRA_OEMESON += "--buildtype release"
> +
> +BBCLASSEXTEND = "native"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99111): https://lists.openembedded.org/g/openembedded-devel/message/99111
> Mute This Topic: https://lists.openembedded.org/mt/94225230/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


