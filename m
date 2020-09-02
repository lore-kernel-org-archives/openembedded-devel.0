Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web12.15763.1599073203553941900
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 12:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L2uiQYrb;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id v15so135230pgh.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 12:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=8Ufb8eFGkf1C6o6dTurpU7hpCLz/wCSaZ/3TxB8xVp8=;
        b=L2uiQYrbiZJmbIj/8jMzpte6N7llV358Tn1k0COtTlU2mqz96wm8OqunLM2yhPLbIe
         W0MoSCVm4hwZ1XHXJmkCZGpZhZWDpelVhywX4C22JSFh//pxbwQ1SSFoRITb8xWe6bAo
         /bBrTE30Pzrj8H+3/zP4O3916By/k+YQ83CPUxgGh0Ar7KsbE9jAqqsCOzLGB0QzMgpo
         kTNPLQ2+uWUOJPZXFYyVIJPliBsxDf0fEET9ONcgwiv2Jy/R8YBBlaZ1bfFULbQRJsOm
         ok9++AIHXtt80bY2jzfWo2GzJwpRotjBwUZmiApwuUtWzXt/DylXlTtClmAvIaNqwUzN
         kGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8Ufb8eFGkf1C6o6dTurpU7hpCLz/wCSaZ/3TxB8xVp8=;
        b=hbfHXZduSppoHoP/o4zTBeC0/iMaFK0kHVPVS+t7Zxg/1je9SfQYGiUk6eJwH4fUaN
         yK1UYzNQe7OJVVRg7D5BSiOcc1Vc2Ghgqg75s3cu16o3n7BI9z4mY+cJ3Z6m1yWKGs7U
         Maaz9UYm4HI3KUWwKPp9ds+j1cdSsgy5D0GRf119Bswd0vgvfzLnaK4HDBPbQQrWSsm/
         rJ7R9F3XHqwl1B+cJ3JAzzZk9ekJ1vqKR5GIYKdSqNewCbLCxWbu74nIx0r4d4JGlJmH
         5zotVkFhcI11219Hq7LtTElKLrK045TShW1tceqo7gUxYsX0UL5TFb8b05YzsjPpVtzX
         t19A==
X-Gm-Message-State: AOAM5302PIBDtQJJ/FKykgpA7DCeZRkY64B7+W0bcupzEXIo2IqDHMkf
	8BlltN0H24ykPYNGumyV6Un8QTH2ICQ=
X-Google-Smtp-Source: ABdhPJwhTx0IAJd0my4ysPiNFFUhU/tkbeX/rMQ69j9xRvryyaJGrJyMCn0INYRYxv0Ie9q0t8l7bA==
X-Received: by 2002:aa7:982e:: with SMTP id q14mr4369281pfl.299.1599073202802;
        Wed, 02 Sep 2020 12:00:02 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:3889:a22b:6ae0:235a? ([2601:202:4180:a5c0:3889:a22b:6ae0:235a])
        by smtp.gmail.com with ESMTPSA id k4sm247812pfp.189.2020.09.02.12.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2020 12:00:02 -0700 (PDT)
Subject: Re: [oe] [meta-networking][PATCH 1/3] packagegroup-meta-networking: Remove dhcpcd and kea
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200902184431.1098556-1-raj.khem@gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <bdada2ae-c8f7-3ce1-0d0e-939d8c45eade@gmail.com>
Date: Wed, 2 Sep 2020 12:00:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200902184431.1098556-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/2/20 11:44 AM, Khem Raj wrote:
> They moved out from meta-networking into core

thanks. i forgot to check the pkg grps.


-armin
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-meta-networking.bb  | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
> index 1034ad9786..0e668f7dd3 100644
> --- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
> +++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
> @@ -37,12 +37,10 @@ RDEPENDS_packagegroup-meta-networking-connectivity = "\
>      ${@bb.utils.contains("DISTRO_FEATURES", "bluetooth x11", "blueman", "", d)} \
>      cannelloni \
>      civetweb \
> -    dhcpcd \
>      libdnet \
>      dibbler-client \
>      dibbler-relay \
>      dibbler-server \
> -    kea \
>      relayd \
>      lftp \
>      sethdlc \
>
> 

