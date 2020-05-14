Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web10.69.1589477793638641041
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2020 10:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LWyuSfeO;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id w18so4120187ilm.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2020 10:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=NAPa1eFFv/BZQ43GKsGEBgQ7soFLH3WrxbiHLpnnHv4=;
        b=LWyuSfeO97TgOQuRmGlio9bi+NdF5lcA/bXn4dGjsx3EyQtiJK7yFOwn7v3eW+V+W0
         qjTF7ThXAsB614dLcoNSjIFaGbGV74F1tYXK9GJ5+z5LRa2qw2lpnrvgYa46BXzCksDw
         gTrtJ8/u+2pybdD5suvqu7q1LQqhqDTYV8a/nHdtPUqJWzBALgn0CyTik+4L3jg1aMZS
         2qjW3s9X0qBQcotZZknaF3qECzwGaWK3Mi75qz0s1OkXlfMpfeFSB23VJ8xad0mXNdYV
         rD5JIMoALyWhgO5ER5YUx1N2VeZgqpFu9/h+5JQu3Xmh1w77iljzVnQRpyaepLVLz7nM
         1rpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NAPa1eFFv/BZQ43GKsGEBgQ7soFLH3WrxbiHLpnnHv4=;
        b=VzX9nyTxVcwFmKDF66kc3Dn2LIMyaGdpH6MH0jQ4zDs9Gdzz0FmnHMTmIW8zq1gAAu
         an40COmd3swL7zL9hynW2scIVfiPDwWusThTphaGS/IX9vAhueRJ7SNvr8FpUh49uUgr
         Zbx4yWlo+cOdwf/aDGnUJZscFaziZYqZ9kNU5kIfASMpgWMouMRmCfHhUDApqAJ6/z96
         TgtrYRpoQY+9v5lRDUEcsGt3WaVLWhWLIkC6n8gEAY/oDSE8jS/dV1qk94eEhP58ESZw
         qIJG7L/53TjIDeqbo+AFMweJ8c06T8ALS8K53NojVRylX8OEek+tAjmu5GiomffdANG1
         i0Qg==
X-Gm-Message-State: AOAM532Z4roy0gPzoBbAPDvmpck0Hf5FVw9CtGHMVJvsQ3m8V7YiPGQD
	yppNd3ryQr1a3UEeC+JzaV9mJxviZvo=
X-Google-Smtp-Source: ABdhPJy0wuhh3ZYYsIhqE7YUa7vIp433FeEdmCeqZpqbGdCFVucoxusHx8/JGeF0wMvdDorCcOqItg==
X-Received: by 2002:a05:6e02:be8:: with SMTP id d8mr5485521ilu.32.1589477792760;
        Thu, 14 May 2020 10:36:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:c5b6:5bca:e472:ded4? ([2601:646:9200:4e0:c5b6:5bca:e472:ded4])
        by smtp.gmail.com with ESMTPSA id i13sm1346773ilq.35.2020.05.14.10.36.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 10:36:32 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH] cpprest: Disable one more test requiring internet connection
To: openembedded-devel@lists.openembedded.org
References: <20200513060608.17268-1-costamagnagianfranco@yahoo.it>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <8f015e79-bd5c-beba-241e-38ad92d29e7f@gmail.com>
Date: Thu, 14 May 2020 10:36:31 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200513060608.17268-1-costamagnagianfranco@yahoo.it>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

I think I have it mixed with my branches, no action is needed from you 
its in master now.

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
