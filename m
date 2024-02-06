Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F54C48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 14:56:07 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.23216.1707231358867295175
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 06:55:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KccvdUsA;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-60412f65124so52434937b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 06:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707231358; x=1707836158; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AJ7SxyDH2Ehf87f3xsgbv8KzExc3L2NKrFLJSjepGUM=;
        b=KccvdUsAIocYAAkLg2lHIhnU+htAqMNvDMiDvHiXDgBuyyyTh1kRTZ1DtGmyHYL2fX
         ulMLVR2Zw4xw7w5g8YI7vsG71v3vjBbXKwWefZPuLPPCb93S0hF4AwNuuZFuxGtsQEYl
         QAPkAIugg5VlIBKGNuqmtTsJXsoVYdaafQWgtV0X57xNdxX1ocoGLi0SJxwSOYhq5NJZ
         kzh+ktGL14OtgcV5uZAJcJb2S6gsF7DzjuHRVTsIWbdQHs3ENk0A6pi8XRKdi9mznE/W
         i8b95EcBNEukv95C9I9gp8t/ZYnt8i0D0Lq5CUBa2S2lr8b3UeLatSR8C9pjXS0dd2pl
         /gMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707231358; x=1707836158;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AJ7SxyDH2Ehf87f3xsgbv8KzExc3L2NKrFLJSjepGUM=;
        b=dg1pKCLKu9hPNtl2jf6XdC2De2Dft0joRwzzF23JY6MZlGSmdpQxfvTbvcFxsizPj9
         2hNrlEoz8H2Gn/9kXkriUcHNTaQDvwSwICs+OOhdsz3NOqoBXa/QysMeUBXpgLVy/EA6
         BiI9TBUUdd5E5j8uYhsvko1kcLJiCkQql8y1yPWPZVHZg72w7jULKo308fj5Tp8qRpmT
         wkeCcrIKR4nnvBhQ1gJmlqyWWVH6zFyj2RVfli9VirHminD1mAHYfEok2qZu6P+lDWSH
         k7pPEKxzzbFkREP7vSTKZUDFMKBkCnt/ykMWA4qtjsnT7Vf0z2xNBjDZgBbG5FWXjBZs
         QwvQ==
X-Gm-Message-State: AOJu0Yy5ylRiMBuarZhfrpILojLrT8SxOGHcflYgss7AARg9TilFsoP6
	h/UiluFjzYdEWcPvgZz/u/GhY7R7o4CPH6ORV42bYmOKn4qSWV6k
X-Google-Smtp-Source: AGHT+IE/oIH1aT0pCrN4iuJs6IvpsmRarP4MxTF1bPDLZOsV17VavtNQtijNAc3IsydVRIBOHx9msg==
X-Received: by 2002:a81:9254:0:b0:604:8433:589e with SMTP id j81-20020a819254000000b006048433589emr671442ywg.23.1707231357937;
        Tue, 06 Feb 2024 06:55:57 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXhFT7j6xTo3pZYw1PDYdSrF59vCG7Ck1EIOqdhApcnbCk2+KRZ9nFWjWgIZ0tdtGjK9SO5t01e/KejjYC6ksLxmUvSCVCsZ5qKV7O9hq/KhFl9acSsa/s3gw==
Received: from [192.168.18.244] (108-243-27-252.lightspeed.tukrga.sbcglobal.net. [108.243.27.252])
        by smtp.gmail.com with ESMTPSA id bd3-20020a05690c010300b006047d63bc78sm271373ywb.72.2024.02.06.06.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 06:55:56 -0800 (PST)
Message-ID: <a8731cbd-857f-49d1-8042-d11e2542c5fe@gmail.com>
Date: Tue, 6 Feb 2024 09:55:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] p7zip: fix CVE-2018-5996 &
 CVE-2016-9296
Content-Language: en-US
To: ranjitsinh.rathod@kpit.com, openembedded-devel@lists.openembedded.org
References: <20240105163246.22192-1-mail2szahir@gmail.com>
 <6815.1707133576223795833@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
In-Reply-To: <6815.1707133576223795833@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 14:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108632



On 2/5/24 6:46 AM, Ranjitsinh Rathod via lists.openembedded.org wrote:
> Hello,
>
> Why this patch is not taken yet? Is there any issues with the patch?

My filters where messed up for this branch.  I wiil process shortly

- armin
>
> Thanks,
> Ranjitsinh
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108566): https://lists.openembedded.org/g/openembedded-devel/message/108566
> Mute This Topic: https://lists.openembedded.org/mt/103548665/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


