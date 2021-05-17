Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.21455.1621267873830379729
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 May 2021 09:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U8VZs0Qh;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id k15so4960861pgb.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 May 2021 09:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=D0HVwHd4pFVwnl7yAwtcH/15b826jUBq6pcp3r/ikPw=;
        b=U8VZs0QhXuGDJMmmueNB7bqvK0w8KvJNnftgqzUgd4nKHk7mVhok9m+zMCY1q58Cfn
         URB4hu2s9SCTbRMyPWu8sGqaNgfB14AKMYoUZZZT7xZ42hJ3Wa3OvIhQdWlhlkGqpz2y
         DIeev55s+D9xY9/eKM8W1h16xi/4V2URnqUqgRHoiYduZBZKKOmvJA2RJfNcerpQUxrK
         i4oOTUCexoPDjVQmCkbuRECxJ+/jqbU+LsoCqU4m1R+VItcKNN9fqUAekNb23jycqgwY
         zdlPSUfsBeDwxftP5xCTqqt94sY5nSdaxrdqVFS+Y+lUfHUUUHyO5g4KghCQjqSPFnPf
         /SqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D0HVwHd4pFVwnl7yAwtcH/15b826jUBq6pcp3r/ikPw=;
        b=KHIfN9u6vQSHm0qc5wkiZ8g/epAFk5UYBHonrJjMIFMRj0euSRNvo0OgbS3VYb9kl/
         cMchGzukIkFARp0hRxdXR0jwIjQ3gQjXDHOj5zjGR5ExPRdMllKOa5SoNUqPYik6aBh7
         VXp7G87WU8QFBtHvpwc9Fx6Dxc4ksg9SouzHFaStAF3vgw59FiQaLKZGVrt21Vvymknx
         +W6WRmhcOHJxWJ/CZm+eizGUd9dfOTEUFjm7MM1T5mpQOdrAvIgQo28t6ggXt/WsC7io
         IAteEWKZSZf4Zo30gwIkTuKqqLPFqddwtQ1gs+LikQ5haAHYGaxVBJMFc795RLcTZg1T
         ZBoA==
X-Gm-Message-State: AOAM530Q+8EnUI8YhfuN3dQfxr4+RfP8mNK8zigRhpDIzdjyVAZgQDln
	zsm0GqKlzUhgEESFI0/iV0kYA/L9/rKnVQ==
X-Google-Smtp-Source: ABdhPJxQb5PWmoDJVWF3FMEEQvPYv9KZ22K86TfBXvnK1xmgcjVW3mCpTUifuw92L+W07Wv3FQrgaQ==
X-Received: by 2002:a05:6a00:84f:b029:2be:3b80:e9eb with SMTP id q15-20020a056a00084fb02902be3b80e9ebmr256943pfk.39.1621267872606;
        Mon, 17 May 2021 09:11:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:db81:2f56:60e4:2c64? ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id l126sm11053885pga.41.2021.05.17.09.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 09:11:12 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-javaobj-py3: Upgrade 0.4.2 -> 0.4.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210517111129.11619-1-leon.anavi@konsulko.com>
 <20210517111129.11619-2-leon.anavi@konsulko.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <540fd538-94d3-2f18-1bd4-740fe943da9b@gmail.com>
Date: Mon, 17 May 2021 09:11:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210517111129.11619-2-leon.anavi@konsulko.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/17/21 4:11 AM, Leon Anavi wrote:
> Upgrade to release 0.4.3:
> 
> - Added support for TC_NULL as array sub-type in _read_field_value
> - javaobj can now read GZipped files directly (trick done in
>    load(), which is also the underlying method used by loads())
> - Fixed a type issue in BlockData/str content comparison
> 
> License-Update: License remains Apache License Version 2.0
> 

thats ok, but does not explain why checksum changed

> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>   ...hon3-javaobj-py3_0.4.2.bb => python3-javaobj-py3_0.4.3.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-javaobj-py3_0.4.2.bb => python3-javaobj-py3_0.4.3.bb} (75%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.2.bb b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.3.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.2.bb
> rename to meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.3.bb
> index 2f24219812..eb93e71733 100644
> --- a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.3.bb
> @@ -5,9 +5,9 @@ DESCRIPTION = "python-javaobj is a python library that provides functions\
>    representation is a standard data interchange format in Java world."
>   HOMEPAGE = "https://github.com/tcalmant/python-javaobj"
>   LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   
> -SRC_URI[sha256sum] = "ed3b1ffcfd39f165729cb53587cca02ab0bfa4c332c837a92d5ffe6aef5c8010"
> +SRC_URI[sha256sum] = "38f74db3a57e9998a9774e3614afb95cb396f139f29b3fdb130c5af554435259"
>   
>   inherit pypi setuptools3
>   
> 
> 
> 
> 
> 
