Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE5FC3DA4A
	for <webhook@archiver.kernel.org>; Sat,  3 Aug 2024 16:51:43 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.11987.1722703900646437239
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Aug 2024 09:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LTzNoF+w;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-690af536546so563557b3.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Aug 2024 09:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722703900; x=1723308700; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r40YW9t/zofRjN7Ia5iSaApDbC2ciYBxbWcryivQEno=;
        b=LTzNoF+w+tSp0CZ2spMOjHEt3yN2V5Zrd8sCIm6rVUmg4E/SMRvmNdGDvHUt+lWCa3
         J/YbkJQl0O4oZ6QyUZn+IjM8eIAlJJJlkfiPif3eNvD44adz7n4JPBGe21MDXeqJmQt0
         fkK+LEC470lXSfoZzeNAwkL6vqZas2mxoLa/PQ/Mv0+4tLGZYJBHOeKqifJgbqo67xll
         Vo1ayIz1qDxmXhMgGx6JCFHAMH836xiMEkfj4YET/8SyHQ2zeBNpBvzToxcHfEP3gUiK
         Cjm87T4hwFXXh3wywKthLP4g7pKdd1VSwiX/J5WrZli0quWhb9r7XRyWN5mkSlMMLnUf
         Baxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722703900; x=1723308700;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r40YW9t/zofRjN7Ia5iSaApDbC2ciYBxbWcryivQEno=;
        b=bnJClKfoAOAbfeaLaY7Tk0li/o1Pbe+bHuG3IE2hv9vl/RDWBv2iKMn9gCSAO2xpq3
         qXkNz+iQZLAfA+bItYrsXiZl2Zkig6i0VNnF4l7e7Kz/5MKKYXcB5rNf2XsEKR0yJ4dY
         GFRCM0Hhg8ctrUr6KGbXTPZcldDbjdczxF+1C/4n1SKHpOA0O2P0z5elXAnM8qZSVOq9
         mEJaCY9W1xoVVx6PPrOAoZbCFx5ocP+cU6ITxijADW43NVp+rZ4igjCtg5mm8kG5AJ0z
         2K17Ke2jRVGmDzYgYNnXiSo9xg8Xci9/UoRQMFqhR64Z6GUR470HjvJvjhMEnnfcz89E
         KcIg==
X-Gm-Message-State: AOJu0YyR7L7ZnusAovs+Ro7tELk7bFzKK4PAvBeXclqSUC9i8Bqditxe
	lhLNxhfyHlB1fnLEpeajCuCazvayuv5x6xzhjkFN/AAmXxn9EN0I
X-Google-Smtp-Source: AGHT+IFaZ4y+XQEHV+py+kAX6UzpIE+RAtjEZi94ohK47l92NuO3aX/h4KI+CWHvkx20E2QoJ28CTA==
X-Received: by 2002:a0d:e743:0:b0:62c:c5e1:ff1a with SMTP id 00721157ae682-689638f37f9mr61835007b3.45.1722703899762;
        Sat, 03 Aug 2024 09:51:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:233c:fb4:252a:b2a5? ([2600:1700:45dd:7000:233c:fb4:252a:b2a5])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-68a12d131adsm6230107b3.84.2024.08.03.09.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Aug 2024 09:51:39 -0700 (PDT)
Message-ID: <4453e069-6679-42ae-b3bb-cdd223bf9da1@gmail.com>
Date: Sat, 3 Aug 2024 12:51:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pydantic-core:
 upgrade 2.16.3 -> 2.18.1
To: Frank de Brabander <debrabander@gmail.com>, dev@g0hl1n.net
Cc: openembedded-devel@lists.openembedded.org, tim.orling@konsulko.com
References: <gf7b52p53drjd6yb3ldr7gmki7gzwc7mzkjque6qdp2wrswm7u@akaiwyp6pxqj>
 <20240731080716.1205-1-debrabander@gmail.com>
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
In-Reply-To: <20240731080716.1205-1-debrabander@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Aug 2024 16:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111504



On 7/31/24 4:07 AM, Frank de Brabander wrote:
> I was unaware of this discussion when I created the fix for master.
> Note that I've silenced the TMPDIR QA message, this still needs a
> proper fix in master as well.
>
> This indeed needs to be fixed in scarthgap as well, since the
> incompatible versions do break some code. My two cents for the available
> options:
>
>   - Revert pydantic upgrade (from 2.7.0 back to 2.6.4)
>   - Update pydantic-core to 2.18.1
>   - Use master (pydantic 2.7.3 and pydantic-core 2.18.4)
>
> Would only downgrade if this is the *only* allowed option according to
> the LTS branch policy. Version 2.7.x includes new features compared to
> 2.6.4. Removing these with a downgrade would violate the LTS patch policy
> of not merging "ABI/API breakage".

We have had this type of situation with a pkg (A) update in master and 
then new lts was branched. We found out other later additional pkgs 
needed to updated to work with pkg (A). pydantic update was in Master 
before scarthgap was branched.
>
> Option 2 or 3 are my preferred choices and they fall within the
> "fixes for bugs" category of the LTS patch policy. Option 2 is the smallest
> change to fix the problem, but option 3 includes some additional upstream
> fixes with the update from 2.7.0 to 2.7.3.

Master should be failing so if Master gets a revert of pydantic back to 
2.6.4, then Scarthgap will follow. Is this an option? - Armin
>
>
> Regards,
> Frank


