Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1F7CD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:13:38 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.35358.1725272010237404728
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QY7giZPE;
 spf=pass (domain: smile.fr, ip: 209.85.218.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-a86984e035aso496337966b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Sep 2024 03:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1725272009; x=1725876809; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ziyfah++uZ3Zf9k5PnMsMltsWzNX/ff4RI+YxXAXIBM=;
        b=QY7giZPEb7fuSsvv+9CV7GcMB3/s3h7NJlwt8pQ3lQ67I1eUquzPtxW44aqL1oYJQ/
         q42AljofrrhKLTEXjO4Ig+N+actP09DIk2GnvT29bKsl5FJ/giOCmO8+43f/KGytdSAF
         BL/9QC08U9fNspofCvLhMZf6yUeFil8rVS+vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725272009; x=1725876809;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ziyfah++uZ3Zf9k5PnMsMltsWzNX/ff4RI+YxXAXIBM=;
        b=tbV2XVyTGulz6YTfB1SY+sU6oJXyjK4VpKjVxXQsR/mwwIFgkrtimY36soVcwFnPnn
         LXPQwDXyJIkfMeIEKa2ndJfPnBnQDoDk7APH9g9wr6wyjc0b8wgA3apmOm6W0D1QTQ7u
         E0LzEWxElExSEs2zwnLZ1r7Kk4P1W/aTlTNHoyz3UUY9ZIpy9aisIvHYEr0X9gG78IdH
         /b83Sdmr7oXcOie9dKXbRpVdQV3gaeuF7f+AGht1q6076ISrGuSnexXF1vnW1Pq8FuXd
         44kIXMCndxaz6DqgYmx/EmheUL9+ijOy1V0KEw7Vb5hFkvqQKb7R8ERj2XNZPvZuv3j4
         6eOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWo4r5i5IAiwT52FLbyDn1EWs1FZ2gul6zswROoNFl0pCF5p1MfxAyOIUcW4xG6tG/zYOvJFABUzMsHEGtJC37bWs=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw80piXVuXiIDd4LPd2iPKBGU2sc+D1+754VzTk7SPJpjAvar24
	5S1uUgoXQ7eLWrfTpU6NtQz6JAzF0K2D1e6sSf5eUc3vrf+UAGvsyn4Azs+4IBg=
X-Google-Smtp-Source: AGHT+IHQR9cQqIo1wCPzsfy3rhWDw5rQpr1raT0/FIhsu1VhI+cDSu+inePkQKqjeuvKOx5YB2GCbA==
X-Received: by 2002:a17:907:5c1:b0:a86:7bda:d996 with SMTP id a640c23a62f3a-a89a368d0d2mr777326266b.35.1725272008100;
        Mon, 02 Sep 2024 03:13:28 -0700 (PDT)
Received: from [192.168.0.22] (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891db563sm537301866b.185.2024.09.02.03.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 03:13:27 -0700 (PDT)
Message-ID: <2cd0f5f1-a7d6-45f1-8edf-46d03dab6657@smile.fr>
Date: Mon, 2 Sep 2024 12:13:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] README.md: discourage use of GitHub pull
 request system
To: dbaryshkov@gmail.com, openembedded-devel@lists.openembedded.org
References: <20240902093432.2865221-1-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20240902093432.2865221-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Sep 2024 10:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112070

Hi,

Le 02/09/2024 à 11:34, Dmitry Baryshkov via lists.openembedded.org a écrit :
> Sending patches via GH results in the reviews of a lesser quality.
> Discourage its usage and point out that developers should use emails
> only.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  meta-oe/README.md | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta-oe/README.md b/meta-oe/README.md
> index 676a2c89252a..0e9d43c10f91 100644
> --- a/meta-oe/README.md
> +++ b/meta-oe/README.md
> @@ -24,6 +24,10 @@ When sending single patches, please use something like:
>  You are encouraged to fork the mirror on GitHub https://github.com/openembedded/meta-openembedded
>  to share your patches, this is preferred for patch sets consisting of more than one patch.
>  
> +Note, it is discouraged to send patches via GitHub pull request system. Such
> +patches get less attention from developers and can be mishandled or not
> +reviewed properly. Please use emails instead.
> +

Doesn't that contradict the paragraph just above? For context, it says:
> You are encouraged to fork the mirror on GitHub https://github.com/openembedded/meta-openembedded
> to share your patches, this is preferred for patch sets consisting of more than one patch.

For example, I actually felt encouraged to use the Github PR system for some contributions (with more than one patch). But maybe that was wrong... :/

Regards,


>  Other services like GitLab, repo.or.cz or self-hosted setups are of course accepted as well,
>  'git fetch <remote>' works the same on all of them. We recommend GitHub because it is free, easy
>  to use, has been proven to be reliable and has a really good web GUI.
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112069): https://lists.openembedded.org/g/openembedded-devel/message/112069
> Mute This Topic: https://lists.openembedded.org/mt/108223947/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [yoann.congal@smile.fr]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Yoann Congal
Smile ECS - Tech Expert

