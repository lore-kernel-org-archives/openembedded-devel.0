Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B71C433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 20:36:48 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.4234.1633984607721227745
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 13:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VJ/TEQu4;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso860408pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 13:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=PJTtdhgFQX5Kl++o8EwXSs9Cw2Vyohsfh+odb1uFMpw=;
        b=VJ/TEQu465pqiBeVbDg5Q716c45TfHJP1Iyte7cwbRAhCHXQZuN3SXyCN4slxaSfDb
         h4q8+R62ia/Q/7mto5y8OVJQM0ZSi51goA4TBGmsrmJuMu6ThtnyYftyt1Xoeh6Ivb+U
         t5TczVG/GPzyPQz4C6qWoIrHUu9NxIkOn5Ac0gGp9TCDcGAdUj5eScNa8EUs3w0aMWfe
         Od3bxhfLsgyoVnwTa3dOFtGw5r3LPvn1fyWOjFGLaKVSdDT25qQKu77/pqIH5/2mQ7kA
         CFU03ul2JRk7ofWKB4Xb3/ADzeZ6F1wxuQ1tlyC4ye9ZRLyUhkXnqBfdiicJXtZj5xhx
         EWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=PJTtdhgFQX5Kl++o8EwXSs9Cw2Vyohsfh+odb1uFMpw=;
        b=jkyvcF48wwSOGVbedvupvxw5EuPQQq6gCduKscFt/jor9IB0GQTSISwPZc2rt9ucu9
         oiO1fMqw+LgV7NOiaJNKm5wxFI8jgU3ciMkShXdYlO9wiww9VI+rCERDIVGvJIcIyfEn
         4OAaX84QXaHi0MrP8V6smZDnAL07HNo1YJdPnqRTFkZhLnmuMaw+K0TItbQx7imbzqSq
         98PcfaovVJCJxD1U+V3y5EhmJKaYe9iJxYEYE6zDg3FsFT7MWqp5Uj6QJhHT/PwQEwKl
         PN5jfqdyFeUQ0fALU174ROO2Sk5sq+pnyw+FxMrvU/K/rODUeatQsgFmtlvHkVjXIOLu
         sJHQ==
X-Gm-Message-State: AOAM532twvINLX5cy0RwUgw++T5DF818b+384EH+jHOpkB8AYvvW05v8
	Mhd2DwATBAN9x5FJbNllzLm5eOqajlCTcA==
X-Google-Smtp-Source: 
 ABdhPJzXD3krgICY1vpye5FndlofVuTGXjWEQN+kgjKnoICVjywB25hS9z1NYRud5W+YJK6krybD4w==
X-Received: by 2002:a17:902:6b07:b0:13e:d5ba:3d8f with SMTP id
 o7-20020a1709026b0700b0013ed5ba3d8fmr26537965plk.32.1633984607246;
        Mon, 11 Oct 2021 13:36:47 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:d088:c18a:4e31:cc65?
 ([2601:646:9200:a0f0:d088:c18a:4e31:cc65])
        by smtp.gmail.com with ESMTPSA id
 q18sm9641123pfj.46.2021.10.11.13.36.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 13:36:46 -0700 (PDT)
Message-ID: <cafb97fa-5840-e6ef-1226-5642ec52dfd7@gmail.com>
Date: Mon, 11 Oct 2021 13:36:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [oe] [PATCH 17/24] boinc-client: blacklist due to openssl 3.x
 incompatibility
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
 <20211011184140.653609-17-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211011184140.653609-17-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 20:36:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93241

Needs to be disabled in 
meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb as well.

On 10/11/21 11:41 AM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   meta-oe/recipes-extended/boinc/boinc-client_7.16.16.bb | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.16.16.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.16.16.bb
> index 0acd09995..79aaad9d8 100644
> --- a/meta-oe/recipes-extended/boinc/boinc-client_7.16.16.bb
> +++ b/meta-oe/recipes-extended/boinc/boinc-client_7.16.16.bb
> @@ -16,6 +16,7 @@ global warming, discover sources of gravitational waves, and many other types \
>   of scientific and mathematical research."
>   
>   HOMEPAGE = "http://boinc.berkeley.edu/"
> +PNBLACKLIST[boinc-client] ?= "Needs porting to openssl 3.x"
>   LICENSE = "LGPLv2+ & GPLv3"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
>                       file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93231): https://lists.openembedded.org/g/openembedded-devel/message/93231
> Mute This Topic: https://lists.openembedded.org/mt/86244768/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

