Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB839C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 18:01:52 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web09.504.1638381711208316421
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Dec 2021 10:01:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=olHlShRu;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id o4so25300024pfp.13
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Dec 2021 10:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=YyOeAiGYHqCYTZEo8V0Od/D1z73eYz+sw+dkjcKgzv0=;
        b=olHlShRukPGeYJFozzmdMCEQTjQhHaXhgNKsyHkj7LWHqumFgcBOQsMrK+u1PrcOmD
         QlfNdk33ako9TF2ycuWJ8uEeVwfgfwxNzf1IDWyblbCdvOaQOp1OwVKNgd3UvYYkvQAK
         8FHXjnaMwzgF2M7KTcUyG5UTXP2GeXu9TcKmoWcdDpHMh9wQ+OuZX4zDzksQfedsevuK
         C2bgAQ4nju7gajUPNd55UpSHXkSrCIsoWCoLS/S0JcGavstPIRpkkdKBwQlfKTrMtt0u
         JjvqnKOogkNUT6szT8iNJwMBPvScTTIRfL0GdO3s6HHif6R0n7b+CCMLNfpcfqK4fRes
         FkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=YyOeAiGYHqCYTZEo8V0Od/D1z73eYz+sw+dkjcKgzv0=;
        b=lZw/Cm9YRiYvtMhOY4NOwGL0GztqU+om8FErVjbxPJfscHO2gyOjeHAbq3AUsfpk1k
         umtMk94HFwf/5rKe6cDcE9mIcEFnogwqEzgv4qfLuGxvRrSlot/zV6/v3+58Vd/3CUMC
         G9m9C4aajhzG3YhWWEu37JYAD2RF6G/UMh8JfMmQ74YxZbkGVzIHWxC5OOkSUoOZ40Tf
         kO5lFkRy0Lil6j/nsMDJUVfZj50Gu1nzrXAOZo41oxWnIX//k7t5T7DUIQm4GS9gTHJ8
         4EpKqVVbUzwaOVpOBSMHWAQey+yhF4m07YCzaNE7/FudPMwqROWvNddjLDZ5/5sPThwJ
         RI2Q==
X-Gm-Message-State: AOAM5313IizzVQjhpj0fyw5MziRATC8ZVZaRVDdyTlkBzBklk5e8saPT
	ZdcupD0sMaClmXA50uC1ghM=
X-Google-Smtp-Source: 
 ABdhPJyV4GnchRJ+k7RAOFXRiMX5qHyGuyxLOCy4diK81L9LOi/d48/UgEsMMFvu9XP+OCRLZMliDA==
X-Received: by 2002:a63:495b:: with SMTP id y27mr5820539pgk.601.1638381710487;
        Wed, 01 Dec 2021 10:01:50 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:90e4:2f33:d1c1:9725?
 ([2601:646:9200:a0f0:90e4:2f33:d1c1:9725])
        by smtp.gmail.com with ESMTPSA id j1sm486380pfu.47.2021.12.01.10.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Dec 2021 10:01:50 -0800 (PST)
Message-ID: <13c43175-13ef-63da-5f50-2ba1617fa2a6@gmail.com>
Date: Wed, 1 Dec 2021 10:01:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [oe] [meta-oe][PATCH] vboxguestdrivers: upgrade 6.1.28 -> 6.1.30
Content-Language: en-US
To: Gianfranco <costamagna.gianfranco@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
 Gianfranco Costamagna <locutusofborg@debian.org>
References: <20211201103744.71732-1-costamagnagianfranco@yahoo.it>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211201103744.71732-1-costamagnagianfranco@yahoo.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Dec 2021 18:01:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94163



On 12/1/21 2:37 AM, Gianfranco wrote:
> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ---
>   ...{vboxguestdrivers_6.1.28.bb => vboxguestdrivers_6.1.30.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.28.bb => vboxguestdrivers_6.1.30.bb} (95%)
> 
> diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.30.bb
> similarity index 95%
> rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb
> rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.30.bb
> index 014fe30bb..9bbc9b427 100644
> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb
> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.30.bb
> @@ -16,8 +16,8 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
>       file://0001-utils-fix-build-against-5.15-libc-headers-headers.patch \
>   "
>   
> -SRC_URI[md5sum] = "c6efae8dc115b90c6124e13126794c4f"
> -SRC_URI[sha256sum] = "8d34993d8e9c0cf35e7bd44dd26c8c757f17a3b7d5a64052f945d00fd798ebfe"
> +SRC_URI[md5sum] = "2e408e56e92cf778eb8722dbbcb5c357"
> +SRC_URI[sha256sum] = "3c60a29375549ffc148aaebe859be91b27c19d6fa2deefde1373c4f6da8f18ef"
>   

perhaps drop md5sum next time.

>   S ?= "${WORKDIR}/vbox_module"
>   S:task-patch = "${WORKDIR}/${VBOX_NAME}"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94162): https://lists.openembedded.org/g/openembedded-devel/message/94162
> Mute This Topic: https://lists.openembedded.org/mt/87424452/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

