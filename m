Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web12.141691.1598041697443700279
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 13:28:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rkJPtiai;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id h2so1400994plr.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2020 13:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Bg/mj1C0MFvGimU37k1OV+3YslTQ0J7maQRN0qLBKhc=;
        b=rkJPtiaiicYDF5u/qla1vvkjX31YTTW2neDmothxIFpYWWXOYu0hvymx0AWcsUk316
         l+PQ5VLofXTtHcS11ztvHWjoaBxcPB9A/L9V63YVt+g50RvBaA9Ki0US90zd7L0FCMeG
         clrYZgO8Bcpbwwd+93bl5AJ62kmmWFZQkHKcTPcSXbKB6ywawMax16xxV+OuSpI8uQWc
         Ml3YPuGcfyijADp3Lt2nYIEyCH2FD+eusHZ6IgxrG1Mr7tQ2aaG3zM4SFVOkS4tz7qG8
         jHABX5LGF7K5RIZcYjvUr4cbBjN0cExIG2Su6DiEFQfD7/jLWOq87+nNCRLUNcVHgkPH
         DSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Bg/mj1C0MFvGimU37k1OV+3YslTQ0J7maQRN0qLBKhc=;
        b=HzplQIu8a7fTFG3+wvMQlwVB1zKM91HbRo0o2t9EBzP9wNpfA5Iyt+3XhVMbgrfTY5
         2mW1N2btRP/6Tnrk085VRY0QCtyHCQYlxTa8lKqNDcQ55dKNCzkDMB60dEIETcVo/wFb
         Z8UEdi+L7aS3fMgNNoeTLCLCMD/GYOTby8mW5/I38vNOdsuDo+JJmfbhJv5skMQ4KlU8
         m8NE5NbUuKfhSZAZq8tEOvaElLDgYYQel16fywhHhVP6nRH6g7rT63OQc40RBkgqbTXl
         l9NWuyVyE2AJPmaaePK9/vTzm/yw0QCeaho68wWtfwfJO4TGTSOVH6TwQ6OQv6d1E31X
         r2ZQ==
X-Gm-Message-State: AOAM531Wrrve1rtvmxsak+9sKgY8vyhrFcChgD7KSbC7hnMiubEogzJZ
	icechsu/nng9eScesrS/ddUEA13spdNEHg==
X-Google-Smtp-Source: ABdhPJwBtoZfL1Vvo4wIgzcr3h4oYNg+PMpi21V1ENb+B5Z7ek4e096O5U2qLXi+BATJVEqhU2D6bA==
X-Received: by 2002:a17:902:8307:: with SMTP id bd7mr3597465plb.159.1598041696521;
        Fri, 21 Aug 2020 13:28:16 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::e8c? ([2601:646:9200:4e0::e8c])
        by smtp.gmail.com with ESMTPSA id 2sm3625187pfv.27.2020.08.21.13.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2020 13:28:15 -0700 (PDT)
Subject: Re: [oe] [PATCH] asio: extend recipe to add native support
To: Bjarne Michelsen <bjarne_michelsen@hotmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20200821165614.52984-1-bjarne_michelsen@hotmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <b7abc274-041d-25e3-5897-b70195e576da@gmail.com>
Date: Fri, 21 Aug 2020 13:28:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200821165614.52984-1-bjarne_michelsen@hotmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/21/20 9:56 AM, Bjarne Michelsen wrote:
> Native support is not required by anything in oe-core, but may be useful
> for some project specfic use cases.
> 
> Signed-off-by: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
> ---
>   meta-oe/recipes-support/asio/asio_1.16.1.bb | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta-oe/recipes-support/asio/asio_1.16.1.bb b/meta-oe/recipes-support/asio/asio_1.16.1.bb
> index f381d12fb..11b9730c9 100644
> --- a/meta-oe/recipes-support/asio/asio_1.16.1.bb
> +++ b/meta-oe/recipes-support/asio/asio_1.16.1.bb
> @@ -25,3 +25,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
>   PACKAGECONFIG ??= "boost"
>   
>   PACKAGECONFIG[boost] = "--with-boost,--without-boost,boost"
> +
> +EXTRA_OECONF_append_class-native += "--with-boost=${STAGING_LIBDIR_NATIVE}"

This should be something like
EXTRA_OECONF_append_class-native = " --with-boost=${STAGING_LIBDIR_NATIVE}"

but I wonder if its needed if we had

PACKAGECONFIG[boost] = 
"--with-boost=${STAGING_LIBDIR},--without-boost,boost"

can you check that out ?
> +
> +BBCLASSEXTEND = "native nativesdk"
> 
> 
> 
> 
