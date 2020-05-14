Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web10.16.1589477670565644094
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2020 10:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RFB/jVaD;
 spf=pass (domain: gmail.com, ip: 209.85.166.65, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f65.google.com with SMTP id e18so3321220iog.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2020 10:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=u06GxY0V4QKqkLH8hO1WB/Y8pvMbZ+vWfSlaenI+QRg=;
        b=RFB/jVaDGIdymT6pdv9eT7/U9uqH1wJkGVggSr2id/peCmca9W/8P9DQqUniKnqG+B
         2ePd9Z1KSwQCkQAy+10RbkEVzVdSgWTHXJwKTQaQFRTHGjpPiI6Aq9i38khTbFUdrqZM
         Mpn6f1po+84Jl0Mm6bylKLFHNQiCYsdF4lY+vMs5iFDu/+F6HfwfofHJaYFVHPfWC4b+
         Q/MOIkeO8wekVFQpm7RTkzupPxINXo9Bqr4Y2fNrlR0redZJXIH2nGprqM+TTgnvzqhC
         6gijy6YXxPdvj6eoRTQpBwmEJDa9YfBcxtiZxWS8e+Ul9iUDJbxkrAl/LPHGdpLxvGC6
         /LFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u06GxY0V4QKqkLH8hO1WB/Y8pvMbZ+vWfSlaenI+QRg=;
        b=h+sQKhQR3mTkMFAqzYL4z53tJrUn9EakzdnXn81VBEjLN7uSxXLwcd32XLMeVQacRh
         M7ocR5s9qsJtJqJNS/88Ll2MArwjoM8YfbkZXO3cMwGQSUFoTx7p7Jewv3rmLY5tZ9k1
         tGzm7VcEXot9cX+dD68GxxBgU4qk1vC6106uugKd2lOLBqsmU7oltKGmNAlTOXw0TkL2
         rxI3RrWlPrIYCgNiQbhDhuPIrGnEg/fG572L/A3/v2s58WF92WGV6YHoo7TQxtXQ4syI
         z1+rQMIeFcXI/L0UtQgucInWcU+XkiYdF7gUyTEH0T8rpknJLWhDbK2xfBojbEW2ZKb6
         WOZQ==
X-Gm-Message-State: AOAM530HWvwbOerejgg0UL5m3MIrpvkjFkJVQgNRwauTUzLfp1P/AfJg
	53lBFYS3S1ANLjRTLtRUWEM=
X-Google-Smtp-Source: ABdhPJwAgRH0JcOlG7JULlv0R5TeWeR3MePGLye/FVqCy6iaHMW7qMOOTivfdLjvpUaUIDRMHb1W2A==
X-Received: by 2002:a05:6602:2f06:: with SMTP id q6mr2833954iow.135.1589477669794;
        Thu, 14 May 2020 10:34:29 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:c5b6:5bca:e472:ded4? ([2601:646:9200:4e0:c5b6:5bca:e472:ded4])
        by smtp.gmail.com with ESMTPSA id z9sm1344016iln.13.2020.05.14.10.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 10:34:29 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH] cpprest: Disable one more test requiring internet connection
To: Gianfranco <costamagna.gianfranco@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
 Gianfranco Costamagna <locutusofborg@debian.org>
References: <20200513060608.17268-1-costamagnagianfranco@yahoo.it>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <c3f64c6a-3893-d9d4-5457-141ae50afcb2@gmail.com>
Date: Thu, 14 May 2020 10:34:28 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200513060608.17268-1-costamagnagianfranco@yahoo.it>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Gianfranco

Can you rebase it on top of master and resend please

On 5/12/20 11:06 PM, Gianfranco wrote:
> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ---
>   .../cpprest/disable-outside-tests.patch       | 20 +++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch b/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
> index e108e0279..5f1f8a9f9 100644
> --- a/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
> +++ b/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
> @@ -105,3 +105,23 @@ Index: cpprest/Release/tests/functional/http/client/connections_and_errors.cpp
>    
>    } // SUITE(connections_and_errors)
>    
> +--- cpprest-2.10.16.orig/Release/tests/functional/http/client/redirect_tests.cpp
> ++++ cpprest-2.10.16/Release/tests/functional/http/client/redirect_tests.cpp
> +@@ -159,7 +159,7 @@ SUITE(redirect_tests)
> +             VERIFY_NO_THROWS(reply.get());
> +         }
> +     }
> +-
> ++/*
> +     TEST(does_not_follow_https_to_http_by_default)
> +     {
> +         handle_timeout([] {
> +@@ -182,7 +182,7 @@ SUITE(redirect_tests)
> +             );
> +         });
> +     }
> +-
> ++*/
> +     TEST_FIXTURE(uri_address, follows_permanent_redirect)
> +     {
> + #if USING_WINHTTP
> 
> 
> 
> 
