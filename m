Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6C9C433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 20:35:31 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.4297.1633984530350956561
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 13:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jWpA8s4C;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id g9so1643067plo.12
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 13:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=LHTn3Csc8ZvHWvaGPgaPgZ/XIuNH68RK/iWyNNrU6yw=;
        b=jWpA8s4C2yB/zQlDwbzMNINzzoRU9F9u8JcMh4e8q1gsvLfPVN/jrgAUpkWJymiroi
         JrColj/j+JclyfJUTqu4VH+eZoNDMt/nwb9zfKfSkRRsxNtKvLV9tLyNX4IMmLWyHPC2
         GpmjbLk2va+UK+ijLDitfQ0W56YqKyj2Y8MZNGU8FyVPZmc4Ug1Gjl1LBEKwN7/rI+Mw
         WjEzMqKDPTzrYmx53emC69IOu23DlWFsS7IyCMFwZxliDDj3G54gNh8NY4zPoGWQwIFT
         55WG9YrjdYDnOqTeQcXms5HXdXnAswt5eUgY/MYrHL1GTY4/plDDMWlvFyfblqyHjbqJ
         TzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=LHTn3Csc8ZvHWvaGPgaPgZ/XIuNH68RK/iWyNNrU6yw=;
        b=qJ6p6CxPcRCF1BtB8udpeVcidroCq9K8IgaM6qbHyU1fqBGN3USocPFksvUWhia7gA
         5AAZ7JM0J4EPvDRYQNd38+h5+8JJDr/+SA+522aHCZRwrSxA//hUMqYzmGz7dgqc491z
         CXGNw8YKZwtYG1OW3xaxs1caBTKKMzo5bXZiVF/kw/HuRL3QuFIFcLoN2BEGK1/yrniQ
         9RE83Nkynpcmknc0oZzXrIqsqBSkzDiYu3d5SL1ZjpKjQD+Lbgknfw4vZnZZkOFziFxU
         IUhhRwByJfhkHQapOxlsYpE6M6IgFzgCR2YpKu49tBdoYwyeoBDQpsPbmQWCQbKBoVlN
         QUtA==
X-Gm-Message-State: AOAM531G7wgb5477IHFR9ca7jl/RbykDw7fWl1Oqfv+sAL8sJTCM2ZIN
	hOrfTqxBfPj4BaNMhjR0cFiYwQxholcfXA==
X-Google-Smtp-Source: 
 ABdhPJypKLRgrVDkj03Qjxibf5Mxy1incSCbm+S1sy9UhQ9x17YnDhr0SpU00YdTEJG8qRvQzZp4Ew==
X-Received: by 2002:a17:90a:ac0a:: with SMTP id
 o10mr1254231pjq.125.1633984529627;
        Mon, 11 Oct 2021 13:35:29 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:d088:c18a:4e31:cc65?
 ([2601:646:9200:a0f0:d088:c18a:4e31:cc65])
        by smtp.gmail.com with ESMTPSA id c8sm287429pjr.38.2021.10.11.13.35.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 13:35:29 -0700 (PDT)
Message-ID: <33975ace-9fe2-d0e6-266d-6e091cfd484b@gmail.com>
Date: Mon, 11 Oct 2021 13:35:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [oe] [PATCH 13/24] ldns: blacklist due to openssl 3.x
 incompatibility
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
 <20211011184140.653609-13-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211011184140.653609-13-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 20:35:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93240



On 10/11/21 11:41 AM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb b/meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb
> index 2ce669154..858614cee 100644
> --- a/meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb
> +++ b/meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb
> @@ -8,6 +8,7 @@ SRC_URI[md5sum] = "166262a46995d9972aba417fd091acd5"
>   SRC_URI[sha256sum] = "8ac84c16bdca60e710eea75782356f3ac3b55680d40e1530d7cea474ac208229"
>   
>   DEPENDS = "openssl"
> +PNBLACKLIST[ldns] ?= "Needs porting to openssl 3.x"
>   

this also needs to be disabled in 
meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb as well.

>   inherit autotools-brokensep
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93227): https://lists.openembedded.org/g/openembedded-devel/message/93227
> Mute This Topic: https://lists.openembedded.org/mt/86244763/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

