Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26BAC433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 19:04:14 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.1012.1637003054294911941
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 11:04:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ebZvj+Oo;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so43938pjc.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 11:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=4eEh1acYZxNewOZDfWZdpzaJWuiHldBDyHASDDAQYOM=;
        b=ebZvj+OoCSNZQsRQ+Az88M1nlII2iqV/BQiZf3KnM8hw+lGzLSzR8mm+oESQcU7kVl
         KeMR2NpUf8x3+XL+cJywl8tsvSesjlXqfbMsNQDbjcLQCBe+RqrS/jFzXvhPA7LPIDsa
         QAqYkw0tAqxp+aV1wQsDz9krm7OK4NiZFSxFqSobhKlfqbEZAblfkf6tJ3TrqRnHrQAu
         qpfwlbFmYOkhmA20RaGer9XE9cCSa+nmqwb5CXKvmtAoTW3qi7ZYwatEZAOKZoZHcqDm
         RX5j3RRTATzfVyOjxa7VV/lVIBnCvycPx/uojQtAv+b8hofYXmc1umDAbVuijPe0X+0y
         II+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=4eEh1acYZxNewOZDfWZdpzaJWuiHldBDyHASDDAQYOM=;
        b=mkVKXOhzt+Ug7gOf4QKhvvXqGkIB9hF4SJgxKO4OAakWwaeJa6uVQB7alDVw89kSsN
         buq6GIfjsEj1nunH87etWVpoQEAuh5hokT85kvxiMFb9yRkTqUNeneHOUFF8RP8H5nMh
         vW1xd/w2vxYCbNIuklGWnTfirfOg/LMOwLPZGFDlee92zHtAtEM+Gku56a+3jvyGXaF5
         JkE07flBWDT2z+jotwMh/gcuxaqFDm82R327/llRH/TpQ9+x58eqRbf9dMqOJwvXrkR5
         bKlAElJk/IvPVfo1hYZha5TkWbCrKGgFZLA/4/LxenZMvM7Qkns0uB5dD2S/vZ/59jYq
         HnzQ==
X-Gm-Message-State: AOAM533QbNVr9xYbyCttCfgStJCzkr15P4yPoAiO9CT5OsRvc1r+omgo
	VjcQUb9/SEv5qVxDO4CXUvY=
X-Google-Smtp-Source: 
 ABdhPJxh+ID2r8wN8KTQIYWE62l8twJl23uOCPRhQ+rVB5114hCLoR81+qhk+a2UDLVVs63Va1k5cA==
X-Received: by 2002:a17:90b:1bc3:: with SMTP id
 oa3mr1048800pjb.52.1637003053627;
        Mon, 15 Nov 2021 11:04:13 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:bc73:9bbe:f6ac:7062?
 ([2601:646:9200:a0f0:bc73:9bbe:f6ac:7062])
        by smtp.gmail.com with ESMTPSA id
 x207sm4433126pgx.78.2021.11.15.11.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 11:04:13 -0800 (PST)
Message-ID: <fd8411de-1c9e-07ba-7de9-1b9df8ec3fad@gmail.com>
Date: Mon, 15 Nov 2021 11:04:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-cchardet: Add recipe
Content-Language: en-US
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20211115185652.27542-1-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211115185652.27542-1-leon.anavi@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Nov 2021 19:04:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93959

Can you also add the new recipes to apropriate test packagegroups in 
meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb

On 11/15/21 10:56 AM, Leon Anavi wrote:
> Universal character encoding detector, release 2.1.7:
> 
> - support Python 3.9
> - drop support for Python 3.5
> 
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>   .../recipes-devtools/python/python3-cchardet_2.1.7.bb     | 8 ++++++++
>   1 file changed, 8 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb b/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb
> new file mode 100644
> index 000000000..ebd8130ab
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb
> @@ -0,0 +1,8 @@
> +SUMMARY = "Universal character encoding detector"
> +HOMEPAGE = "https://github.com/PyYoshi/cChardet"
> +LICENSE = "MPLv1.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=6ecda54f6f525388d71d6b3cd92f7474"
> +
> +SRC_URI[sha256sum] = "c428b6336545053c2589f6caf24ea32276c6664cb86db817e03a94c60afa0eaf"
> +
> +inherit pypi setuptools3
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93958): https://lists.openembedded.org/g/openembedded-devel/message/93958
> Mute This Topic: https://lists.openembedded.org/mt/87077160/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

