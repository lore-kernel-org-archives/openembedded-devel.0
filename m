Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D4DC433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 17:59:29 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.1357.1637603967669018314
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 09:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dia7rqBu;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id np3so14455140pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 09:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=tH6j3/8w8mw7dLnM8CG7ZVzjDJFPMMLnhmB7xAi+FY8=;
        b=Dia7rqBuf026XW8pf/FqKrO60pF+1Gdq33GZyXhX0/qsodse6hp+vz1LY4sJt3EeLc
         g5xgluFQovJLFr2sXD4V+2nMH1lYGEPY98TUJpP4ikRSXRwd+hymuFvYUq2vRJvGlYUZ
         MT/0f/qhFB8o4hCP7Z6cZVWpne/hcmsxVtGOqp6HmccPcEyJ3MzFndWj2byVeoPCC2UB
         q69izlxyQUF1kvjPUltRfXtJMhmwBLr4hz4lfzB63ruvaUJRvf89UE/2E2Z2FAX5fH7r
         9kZDEkheNoYaFsV9yvKhQmqblplxMmXrw98VHLWMOwPjZqxzdQ3a2e3gK2YCiyZNNaqO
         BbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=tH6j3/8w8mw7dLnM8CG7ZVzjDJFPMMLnhmB7xAi+FY8=;
        b=v5Z3psEqM3hU0FU/6dhdBGd/5+qPdaJQTnukxmSvI5UaxjhmT7XLVSnr3/x2zIEccU
         SEptAjbG382Fl7C1mRtk5jLtXJ0tC+IH0G0wJ/55QyeBDVw6QF9th62DTl/tYO6V1Q2L
         XPi6psepomj2OJUhJ5xOAgi8TQcPNj233rN/VzSF4TOu8mmx6en84fzu+Nwvsm3Gui+V
         qHMRt2I7fchyPETPKcLYMWJozZ0/yGjYRbxuo6ngisWPCHb6J6Dqy15ZqFnvbTHfda07
         DAVN01mIwejxBC6+WKjej1I7Ux2cEs16kQfZsoATKKMBvCID+VxX+f0cDO0sKvo1GmeW
         dP8Q==
X-Gm-Message-State: AOAM531lf2cXko12IGDbQr/sztWupzdeb0d1qW96uLInjMQjd5J+ytPJ
	hA3lfZ/QzjgpeN71Ldvi6LkhNAxr5xDW5g==
X-Google-Smtp-Source: 
 ABdhPJxcktEDF4JAB9Tzl2oAhbRJ4AfN9sGzXgPb0VNgg+1BTjoGR8VADyx7CFFw209TFSiuu8YClw==
X-Received: by 2002:a17:90b:384d:: with SMTP id
 nl13mr35055179pjb.80.1637603967119;
        Mon, 22 Nov 2021 09:59:27 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:59:1c3f:bc2f:7ce1?
 ([2601:646:9200:a0f0:59:1c3f:bc2f:7ce1])
        by smtp.gmail.com with ESMTPSA id
 q13sm10489401pfj.26.2021.11.22.09.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Nov 2021 09:59:26 -0800 (PST)
Message-ID: <5340cb30-03e1-cd78-2827-c70784757118@gmail.com>
Date: Mon, 22 Nov 2021 09:59:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [oe] [meta-networking] [PATCH] libnetfilter-log: upgrade 1.0.1 ->
 1.0.2
Content-Language: en-US
To: wangmy <wangmy@fujitsu.com>, openembedded-devel@lists.openembedded.org
References: <1637593387-99348-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <1637593387-99348-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Nov 2021 17:59:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94103



On 11/22/21 7:03 AM, wangmy wrote:
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   .../{libnetfilter-log_1.0.1.bb => libnetfilter-log_1.0.2.bb}  | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>   rename meta-networking/recipes-filter/libnetfilter/{libnetfilter-log_1.0.1.bb => libnetfilter-log_1.0.2.bb} (88%)
> 
> diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb
> similarity index 88%
> rename from meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb
> rename to meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb
> index 994825cb7e..654448a328 100644
> --- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb
> +++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb
> @@ -5,7 +5,7 @@ SECTION = "libs"
>   LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>   DEPENDS = "libnfnetlink libmnl"
> -SRCREV = "ba196a97e810746e5660fe3f57c87c0ed0f2b324"
> +SRCREV = "b0e4be94c0b8f68d4e912402b93a130063c34e17"
>   PV .= "+git${SRCPV}"

remove the above append to PV.

>   
>   SRC_URI = "git://git.netfilter.org/libnetfilter_log;branch=master"
> @@ -13,3 +13,5 @@ SRC_URI = "git://git.netfilter.org/libnetfilter_log;branch=master"
>   S = "${WORKDIR}/git"
>   
>   inherit autotools pkgconfig
> +
> +PV = "1.0.2"

this is not needed


> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94096): https://lists.openembedded.org/g/openembedded-devel/message/94096
> Mute This Topic: https://lists.openembedded.org/mt/87236685/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

