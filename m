Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 090AAC433F5
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 22:34:06 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.83985.1638311645196142523
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Nov 2021 14:34:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ouYKZyGz;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 71so21415575pgb.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Nov 2021 14:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=RF+hSqI12/eK4c3SPfXuMqe8LDh+iTatKZYVdhs3EGE=;
        b=ouYKZyGz1A6CFsSJ3SubcsbWlOneNebtCS7mNo84c8ugiEpF1kgNDC3zzYzexc42VY
         kpSsObmECAKgS1WHwDesnEJEnKfhW8AAmpdKVeM9qYhWO7sHqDF6wWZaqM9LgBrLuKQx
         D1L02bEBRgK5TyuIrdIVYLOXpw2GyUxGgaSjL+2NvcTKH5kngS34T5QNSiNTrMd//yU1
         B7QH7duxw/pAZtmDzBCO8ye1f89PPW1K2SPB/WXhQVvuMQnKjL0o3QFtWSDVNMZQlltI
         4G5qJOGF9+MVcpBjUhHU+fzqwJ+erdr6w8L+1jIo52aBbKAJ4v41VGeShMAvw+eI6MrA
         /TlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=RF+hSqI12/eK4c3SPfXuMqe8LDh+iTatKZYVdhs3EGE=;
        b=d52qTqqo9m8Yu3Xx+eO05uzzrj/nZSA//ShsNLzFQWp09VoVQDs4WT4iaw479MVd5J
         b4oV6rfnN6zuVawRd61S6a5JlhH+ZA+tXcqdiElX2TkmqcOmnqLDnfLIHndXJRQjzuOg
         L2F77a55thlnPEUYMLcA0XVRzlPlpFcWoIiVG9yD3QdPgEjOYOYgFSrnS2bMZB0Mv0Uc
         rCZOYd6VizHwQgXylz46AOzHYOYQXKCCUNie6j5OLegoMctt3iCAZlwMy+TiHfzn1WI5
         x7VWKaoeEeukx/+R7BWA87KhAH1OIyEl0/D7KuTfpIO0mVzvBhr29KK8RTda9IZAIWAX
         h+sQ==
X-Gm-Message-State: AOAM530FW17ZCOFis5Hf3liHKV15ncdiP86p/y3it/EZfynqvVLkIPCD
	QUBL6Blj20Bg8sYiVUNbfN6xhrNwdBk=
X-Google-Smtp-Source: 
 ABdhPJxkmjYDaMCRD6r57tnsA0ATVf+V8qIU4bCfkucNpszv3sNYwQs9C27ZUrEdjeqCsx8hduL22w==
X-Received: by 2002:a65:6a4a:: with SMTP id o10mr1622052pgu.357.1638311644554;
        Tue, 30 Nov 2021 14:34:04 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:7839:c9c5:3df1:81ad?
 ([2601:202:4180:a5c0:7839:c9c5:3df1:81ad])
        by smtp.gmail.com with ESMTPSA id
 h13sm15683765pgg.16.2021.11.30.14.34.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Nov 2021 14:34:03 -0800 (PST)
Subject: Re: [oe] [meta-networking][hardknott][gatesgarth][PATCH] ifenslave:
 Add branch=main
To: Jeremy Puhlman <jpuhlman@mvista.com>,
 openembedded-devel@lists.openembedded.org
References: <20211130193715.32154-1-jpuhlman@mvista.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <888231dc-1302-2dc6-aada-51c5b6132824@gmail.com>
Date: Tue, 30 Nov 2021 14:34:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211130193715.32154-1-jpuhlman@mvista.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Nov 2021 22:34:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94152



On 11/30/21 11:37 AM, Jeremy Puhlman wrote:
> master branch has been removed upstream
>
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>

thanks. I have a fix already staging in stable hardknott testing.

-armin

> ---
>  meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb b/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb
> index 0db9e8a0a..5e547a462 100644
> --- a/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb
> +++ b/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb
> @@ -9,7 +9,7 @@ inherit manpages
>  MAN_PKG = "${PN}"
>  
>  SRCREV = "c26e9310f552e69d0d44eb48746e02c9ae4b4f6f"
> -SRC_URI = "git://salsa.debian.org/debian/ifenslave.git;protocol=https"
> +SRC_URI = "git://salsa.debian.org/debian/ifenslave.git;protocol=https;branch=main"
>  
>  S = "${WORKDIR}/git"
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94150): https://lists.openembedded.org/g/openembedded-devel/message/94150
> Mute This Topic: https://lists.openembedded.org/mt/87411068/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


