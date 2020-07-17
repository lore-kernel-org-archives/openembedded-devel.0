Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.561.1595003003553342119
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jul 2020 09:23:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HynSoShT;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id y22so8431097oie.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2020 09:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Krp+rb/BKG4wfJIdZYd7WYtE8imyi2iyzJRnGIdxtYw=;
        b=HynSoShTAUoCqB7SnZjXUlbuEbGwB7cuvqpWq/IwY7Fb1auiMgBXzbxgQL5YmuB9em
         D01tKZzy6bGNND5bbBVEYD+bRmdVy7hfYGibLUGGh+NUFY0QxAV2QtoWzNIWQiyoPo+J
         IMRGBKOqGIIurbCcKRah+Y+Dg9difi9JzUVE/lf9L2vvIZ6oh8ryoqPFi7W1ZJzw/pvV
         U0Z0PX9GPwXJquDDnE/ue2UQ9CrX7mrmcJCRq8FCK17POHxEqh/QgrypKwURYSY2mtqP
         sKXzPFnmoOwzh24Tzi4q50ntxoNF0/LclcWxSAuLcjSX7e+pSZWp5k+a9Fvs9/vtPZlL
         XWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=Krp+rb/BKG4wfJIdZYd7WYtE8imyi2iyzJRnGIdxtYw=;
        b=Q1lVfCYvff8c0EPioumJqhdtfpnjKy4xF6dPmaiTKfbOKQA2wsIaJy0oPDFHhEEUhQ
         n4cChelsXnAJuZlTqc46d7stqWAVXZ8ZR5MxahF94y8kZUhL7ur+qNiLlEhBHaPBATps
         OkzYLUDGnbA//Wcpd/N30mOsY2ygvR+Px3fBsjg5k4AR5t33UXeqDXcdHR74TEVpiexB
         hqU3KnzR9Z/+tzCZjJuTJTG18nB7ie18b/OiR76/G0WnF8tVJ5Lrq5hAznmLP07ZpDiU
         qU3XofRqE6bXmfOvv2np84sIZc+m8VohxoAJ/oYlEgpt89r8RliYdurNZgHsd9pt6OOA
         icUg==
X-Gm-Message-State: AOAM530REL7Or8k94yAIewlPizaPh2HtpwLghLcXwx/Q8utXKzjBwIIT
	Ex087ab+d9qafJBG8Sxh/aU=
X-Google-Smtp-Source: ABdhPJw9vQ9X5PWYEDNtZBj24hMoTYp8MBAAkdr5lvwbaRLo1ibx7VaQKw8aJ+OBPCn9XmGxBdLBNQ==
X-Received: by 2002:aca:2312:: with SMTP id e18mr7789904oie.135.1595003002881;
        Fri, 17 Jul 2020 09:23:22 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:b082:650f:a46e:c68d? ([2601:202:4180:a5c0:b082:650f:a46e:c68d])
        by smtp.gmail.com with ESMTPSA id x5sm1871064oic.21.2020.07.17.09.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2020 09:23:22 -0700 (PDT)
Subject: Re: [meta-python][RFC] Organizing meta-python recipes into logical/functional groups
To: Trevor Gamblin <trevor.gamblin@windriver.com>,
 openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: "timothy.t.orling@intel.com" <timothy.t.orling@intel.com>,
 Khem Raj <raj.khem@gmail.com>
References: <b1d1487b-0691-3429-48dc-a3fc3345c25f@windriver.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <89d4c21c-5ce0-3c68-3252-48c916beb140@gmail.com>
Date: Fri, 17 Jul 2020 09:23:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b1d1487b-0691-3429-48dc-a3fc3345c25f@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 7/16/20 1:39 PM, Trevor Gamblin wrote:
> From #oe on IRC:
>
> <armpit> tgamblin, regarding meta-python... any thoughts of organizing
> some  recipes into functional buckets? ie recipe-crypto
> <armpit> rather then all under -devtools
> <tgamblin> armpit: I think that makes sense. What do you think
> moto-timo? What would our categories be?
> <armpit> the last set of py packages made me think they could have
> been categorized  into their own bucket.
>
> I think this is a good idea. While it isn't hard to find where a
> particular recipe lives, it could be much better organized. We already
> have the following in the layer:
>
> recipes-core
> recipes-connectivity
> recipes-extended
> recipes-devtools (where most of the recipes actually are)
>
> Some ideas for bucket names (other suggestions are welcome):
>
> recipes-automation
> recipes-crypto
> recipes-frameworks
> recipes-graphics
> recipes-multimedia
> recipes-support
> recipes-testing
> recipes-webdev
>
> Any additional thoughts on making this change?

not from me :) 
-armin
>
> Trevor
>

