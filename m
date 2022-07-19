Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA7AC43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 13:39:29 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.40815.1658237960492701590
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 06:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VPzWLsko;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id v28so9585754qkg.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 06:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:references
         :content-language:from:in-reply-to:content-transfer-encoding;
        bh=OJhf602aFMbRsYUEs1Xwl8NrMqUNhODYksmjdM4bXEA=;
        b=VPzWLskoc9G0hMgZM7+enTDAogWFVQExLrvU+NF80RIMEZ3YyY7fwcHNlPOB23uY6G
         1/b91zPsRFnac4vOEeGFHp8CADR8+XQXpijLoSesM8rvmFDWFe95Z56P6XP89KBW6sYm
         HJFm0nFkfAHBdX4YgDZVsclI8zwqDQmJ/LMC208FyRueA0wc1fFbhR4scihuFGx6EZut
         TL0Ac4v3kDQgcslRe5P6NX+gGdH7Z27hOqes8FeZGZ3YibuVAMKdt0kpVRp/JnMclVop
         XHzQMzDC18TVL2Y4Za71Wd89xnKlPMXQw5vXUG3+g6rhyGdv+oszP4v4zDqO/yyVPImW
         NFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:references:content-language:from:in-reply-to
         :content-transfer-encoding;
        bh=OJhf602aFMbRsYUEs1Xwl8NrMqUNhODYksmjdM4bXEA=;
        b=42VNU/9fktXZrsrvo6seRAJ8m5/sHCa3g3NMEUoenAMkdRYtb0oUJqHe1SpgYQAbPZ
         mly1qYV0KKCwu9YNsidGqO24MevYI2T+uY5V8uWf7ypg8d4cuEoHO+lz9ukcRx/LDmHc
         8JggcyY7b+/qCcNfVYeQfeQcDjYoAxhmtlhliUgKFB+dLsiim8KVVJLInqKEZ+4rfnX/
         yr36+PEUTfO8Shg4AZ+HOrbr+uJ1fk/dAh10R/HjukQdacUSoBWCdOeQgxq4LgwqgSi/
         W9a7tnIuXj/hdzxzgH7DJnlaCw8lmewZ606GD/hvxY8nndt1wNxJTUUU6ThsnTuVu+9i
         4b7Q==
X-Gm-Message-State: AJIora8/tgBoXzseB39VSwxhUofF4D4qikpiu9yBKPkr+Dot+ZBJ8Fnr
	rAmwrjd7fcg6nyBuJo9YUn0=
X-Google-Smtp-Source: 
 AGRyM1sZO47kz9x5QosaH1Hu1WzOKrztG9uM9y7TaaQgGNqrHkX6TW3tA941QGRrqx/ed8DumBToMA==
X-Received: by 2002:a05:620a:f90:b0:6b5:c74f:5d8c with SMTP id
 b16-20020a05620a0f9000b006b5c74f5d8cmr15580614qkn.38.1658237959411;
        Tue, 19 Jul 2022 06:39:19 -0700 (PDT)
Received: from ?IPV6:2607:fea8:95df:9730:a90f:7fcf:f7e0:a30e?
 ([2607:fea8:95df:9730:a90f:7fcf:f7e0:a30e])
        by smtp.gmail.com with ESMTPSA id
 q7-20020a05620a0d8700b006b5905999easm13524874qkl.121.2022.07.19.06.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 06:39:18 -0700 (PDT)
Message-ID: <5135b01f-59ca-f9c8-4cc0-873843ec9545@gmail.com>
Date: Tue, 19 Jul 2022 09:39:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.2
Subject: Re: [oe] [meta-networking] [PATCH] ndisc6: upgrade 1.0.5 -> 1.0.6
To: wangmy <wangmy@fujitsu.com>, openembedded-devel@lists.openembedded.org
References: <1658211328-2951-1-git-send-email-wangmy@fujitsu.com>
 <1658211328-2951-2-git-send-email-wangmy@fujitsu.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1658211328-2951-2-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Jul 2022 13:39:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97899



On 7/19/22 2:15 AM, wangmy wrote:
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   meta-networking/recipes-support/ndisc6/ndisc6_git.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
> index f5467794e6..a65ab758ab 100644
> --- a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
> +++ b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
> @@ -5,8 +5,8 @@ HOMEPAGE = "http://www.remlab.net/ndisc6/"
>   LICENSE = "GPL-2.0-only"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>   
> -PV = "1.0.5"
> -SRCREV = "b706f5f01aa82aa0db678fffd15a1527f330c507"
> +PV = "1.0.6"

perhaps move PV to recipe name. Use it instead of _git.bb

> +SRCREV = "7e314b23329f9c24c4c097b8513673fed7e7158a"
>   SRC_URI = "git://git.remlab.net/git/ndisc6.git;protocol=http;branch=master \
>              file://0001-autogen-Do-not-symlink-gettext.h-from-build-host.patch \
>              "
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97892): https://lists.openembedded.org/g/openembedded-devel/message/97892
> Mute This Topic: https://lists.openembedded.org/mt/92477641/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

