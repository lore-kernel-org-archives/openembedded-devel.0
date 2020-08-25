Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.8300.1598335560138097828
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 23:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WwA+rwB0;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id w25so12352535ljo.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2020 23:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=o14H91faUk+yieiSGBaFeFGP0TENC/Acu/hiKPsIFdM=;
        b=WwA+rwB0lpgwQyK+ADxsKduEwxq4hTXJTnabQw69V7tChjcsXj45Mm4NNTTfugXWHH
         afJjbAVdMFp6v4OUs7ZUOt8KjYmTrU1t0iwKWahXCqeqRt72HN/NKy81/rtlho1jCwXc
         lYnSRDm2D/tu2kTiI09JttTMdsjy6tExiduX7UZlJlyt2zp0jUrJMScpexbLAdv8wxBd
         1Bxye8ERup2XG92175+IhVNdrKuERsEtgrxiy5zICeOnLDpBkU0KArTyuvnEYJt/VfQy
         oiuKtPP5uJ1WZs+Q2IhQfAxr1eG/IRYa9pnYzqMNRCGJRHugZifHF7SOldt33OE4DcRH
         CmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=o14H91faUk+yieiSGBaFeFGP0TENC/Acu/hiKPsIFdM=;
        b=g18IbDvmfJbVZVk3zLZ3xEGdPVPEJkdF/Znlx4dZBwpWbuqU5MrqdZu6xouzLYpaBL
         oojXP7PR66GM7f7yYK4416W1XzO7rYCX9uLKQaEK4xoSx9CVTviVL/a9uo7IiHcOBtC5
         chTyG+xdQ7vABdDF3HuzRfyWqfVF3BF8VIml7Ta5er/+eCZr1xIGeaRzL06g/d1FFaDz
         vFEbQ2UL9J8es5Kg5LxqkyXInhogNYiUMjwUKXELWhZOARBZ79SgbxqE+G/TELW+SDx/
         OhQ0ZKbjx5yyAy3AL60t+LUd06cZKApfNcuNCFuP3bMUkvLWO0/pk38fYg8vvWru2NRy
         108g==
X-Gm-Message-State: AOAM532xqBhcuCY+rdDYLWw9MkpbrNct4/hunYuNaDNpQ/XjANuL6bHy
	E2jFHXaR0RmlzjI8xJLW2D8Gfr1SQK3vBQ==
X-Google-Smtp-Source: ABdhPJzy6K4GZhccj/aYd7S754eNfgEoO0aEppZAkqkq7TiB4FM2qdQ0RKlU5zpibY+ME78wkHhwug==
X-Received: by 2002:a2e:8ed4:: with SMTP id e20mr4429481ljl.403.1598335557749;
        Mon, 24 Aug 2020 23:05:57 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id f23sm2593999ljk.74.2020.08.24.23.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2020 23:05:57 -0700 (PDT)
Subject: Re: [oe] [meta-java] Changes from master-next merged to master
To: Richard Leitner <richard.leitner@skidata.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <20200824062225.GD65616@pcleri>
 <30416287-890a-4fd1-2262-21b2a9b68ffd@gmail.com>
 <20200824083345.GG65616@pcleri>
 <CANNYZj9BA_nPnJCHDAUcxtzz9Lz3zn8WSPh7jeKJY9omCTHRaA@mail.gmail.com>
 <20200824091401.GB2286@pcleri>
 <CANNYZj_+KTOwyvBhrDQ7NuecOBFe=Poh8Khc_ntDU4M5iGL=Gg@mail.gmail.com>
 <20200824093831.GC2286@pcleri>
 <CANNYZj_LT1m2gSbhL+Di1PaFGzSYGmPVYsEus0YnSx19sOZ8jw@mail.gmail.com>
 <162E2BC2BA50B6B6.12673@lists.openembedded.org>
 <CANNYZj8fWMk1Ya+G-HbC2VVbC4HWV6x=4T=ni_cdW5-qNG1YnA@mail.gmail.com>
 <20200825055800.GA37583@pcleri>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <1e7c4c2f-d332-de8d-42d4-83614b6266ec@gmail.com>
Date: Tue, 25 Aug 2020 08:05:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200825055800.GA37583@pcleri>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/25/20 7:58 AM, Richard Leitner wrote:
> On Mon, Aug 24, 2020 at 09:36:42PM +0200, Alexander Kanavin wrote:
>> I think the site and the downloads are now properly back.
> 
> Thanks for the info and sorry for my misunderstanding regarding the
> java.net site.
> 
> So you are able to build 8u265 with the current master?
> 

I can build master now. Must have been temporary server problems as you 
stated. Sorry for the noise.

Regards
Jacob
