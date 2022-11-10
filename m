Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05571C433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 12:46:51 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.6842.1668084401211806601
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Nov 2022 04:46:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vr9RMDbI;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id r76so1642206oie.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 04:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ojmN6wtvzOrd+vXRYvG95EEO8eGDt7EB3pWApKqjZSI=;
        b=Vr9RMDbI3zbQ/Dt6HcnovT+ezfUfz4w+J/NsE/RYeINi1XG5fxRL+cRNteDGr7Pneh
         it+TMdCklX3Kc+34zA6hP+BbW48vT5DOzIVOPIkpKDT8W3SC2zg6CblPcmd9Fepsu1aZ
         CGrn1Y+E17j0BHjoZ/6I2Dio2UdCdeV0G/rr7DOFz3vR1iwQfuEsEXuNb29xkZsCz3fG
         CWkOIHdrj+g12t3rEZFQaDXBa7U/k1VTezJVwZwaIIx4cHHUgbIBPC9FV/v261MqbRH2
         uqSVa5LouOYzF5vyT/8gZW38QF28SjQWRJiKXl7w+4M60K8lq8q0ifHy7Q68Te4cGpfG
         Lbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ojmN6wtvzOrd+vXRYvG95EEO8eGDt7EB3pWApKqjZSI=;
        b=q48ULwmMOGa2WxQHitwEObdnj8+aaxXPfRPa8rMA5Hq4puOOgEY0X1dWaFNxvbxREf
         Uamu0kSwu51QM3keesQCqFCXoSgNjqyuHKTXGhB68CzOP/b5dECoVm3EIlTYRwgxSecX
         AxGB5gAmtuKT0R8njHuPNYVs4zdDjHqcp/bflsW7yoJkJ/r0oAMCGrWHd2k+x2HM9+yZ
         GcXlbs4FXFeR/qTdqtFci3kTVXO74Ln1Dd7WWs1keMTNyVe0266wOgtTzVu4mbHTG7Y8
         8t+SC/Z6ox1jQChtSNpB19m0gSqYhYJoKvsDNNRM8wDY/kk7+9p5n8bPKthWrT4RxYNh
         3ajQ==
X-Gm-Message-State: ACrzQf0OQivmM5ASIFpcStcFsm7dEUdonl8W1EiUZVfdSXx5w8/NYENE
	nQwRIsO1GvUUGx8KlESdoBQ=
X-Google-Smtp-Source: AMsMyM70ZnBe+npV3++6oWpGjZkUf16JA3YqhD55+gsSAHaxc9HxbOLVmqyVtzowFzK+P97epuY0KA==
X-Received: by 2002:aca:2804:0:b0:35a:fc6:75fd with SMTP id 4-20020aca2804000000b0035a0fc675fdmr1407954oix.282.1668084400484;
        Thu, 10 Nov 2022 04:46:40 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:7a3c:3b1e:eba5:482? ([2600:1700:9190:ba10:7a3c:3b1e:eba5:482])
        by smtp.gmail.com with ESMTPSA id h24-20020a9d6418000000b0066193df8edasm6244594otl.34.2022.11.10.04.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 04:46:39 -0800 (PST)
Message-ID: <2998df42-333c-3427-63e1-179ef722bf9c@gmail.com>
Date: Thu, 10 Nov 2022 07:46:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [meta-webserver][PATCH] monkey: use git fetcher
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20221109122317.3093006-1-Martin.Jansa@gmail.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20221109122317.3093006-1-Martin.Jansa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 12:46:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99549



On 11/9/22 7:23 AM, Martin Jansa wrote:
> * monkey-project.com doesn't resolve anymore
> * use v1.6.9 tag from github

cool, even better. thanks
- armin
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
> index 5b7e32733c..d3e22757c4 100644
> --- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
> +++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
> @@ -7,12 +7,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
>   
>   SECTION = "net"
>   
> -SRC_URI = "http://monkey-project.com/releases/1.6/monkey-${PV}.tar.gz \
> +SRC_URI = "git://github.com/monkey/monkey;branch=1.6;protocol=https \
>              file://0001-fastcgi-Use-value-instead-of-address-of-sin6_port.patch \
>              file://monkey.service \
>              file://monkey.init"
>   
> -SRC_URI[sha256sum] = "f1122e89cda627123286542b0a18fcaa131cbe9d4f5dd897d9455157289148fb"
> +SRCREV = "7999b487fded645381d387ec0e057e92407b0d2c"
> +S = "${WORKDIR}/git"
>   
>   UPSTREAM_CHECK_URI = "https://github.com/monkey/monkey/releases"
>   UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+).tar.gz"


