Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web11.3039.1588059757279910382
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2020 00:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qjvxnq0g;
 spf=pass (domain: gmail.com, ip: 209.85.167.68, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f68.google.com with SMTP id y3so436916lfy.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2020 00:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=+jHOU3kNwJAcNseaKkkld/ORBovmfSifTLJWbcSBt9s=;
        b=qjvxnq0gugKo94vki4oK+miOl3dlIeDl8Mbeu7zeZU5dutXOjDuEFg10r7XdGSa40W
         +Vs0AxQHVA9j+i+IZbfu3VyBJ6+Uaq8yKjlPrR3WOobVt5wWjBnpECSpaM7m5mT0uTUe
         4wg48adXtVhjVT7W5inCtD99Y4iLpHiR/JJa0xqU7Q3rWX3jQ2UsqvNhKw0hT8JhLZQe
         PLLs4UlByKlrQnHQtlidDEt8POCN3MSXFPfziG8CMyqYQeV57P4CRdt+iqIPs3NJJhHS
         0dpNI8eiPP2u5Zj9vOvIQMrdMtRYgE2CAJ0PFqDdSP6ZRb1p8NN4k0BdVPwcC20DRZO6
         dmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+jHOU3kNwJAcNseaKkkld/ORBovmfSifTLJWbcSBt9s=;
        b=CmzNYReV3SVaqN66/P4cVYWRk5dmddmp/BSppGbmojQrWf3Bq6S3tuwjmGyBFo521c
         pYOpV452uyhX6NWZFHD+qurAMN5+WVWWZT5hnldqU/oYBdmBcCZmHISfvXaJh8Tgci/G
         qoLyjr5z+nzPr/k4IdObnt6DLBVMiNqWMulCGNxmnvX0pTUpapE04h5arLHW5k7vqIMj
         zMvfuuZk8Zc/34rAJMvpwp9PeA7oI0IL5krBrYqR5OxLHctSJPkGKLTgcc207js/PnD8
         JonY0krTeMHhQefJAZTfj+X1ZfPfIez0xpJPjjzHLLBZim9juagKTTi221ivand97AnA
         Et2g==
X-Gm-Message-State: AGi0PuZHInfud/eWAGjlMryGOdlrHq5U+S5MAM6MTipYGoIZRJv8Pe4z
	Micxf7ayxviFRofxC5bdK9awv8cd/Dg=
X-Google-Smtp-Source: APiQypIMfu+1he9t497CEUTEfy4QeFQLfVKiUVb6j87/ek9pr7DybEuadUntFRY/XTVzb7Y+FbXjiQ==
X-Received: by 2002:a19:c515:: with SMTP id w21mr1527234lfe.186.1588059754999;
        Tue, 28 Apr 2020 00:42:34 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id x24sm13332718lfc.6.2020.04.28.00.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 00:42:33 -0700 (PDT)
Subject: Re: [meta-java][PATCH v2] openjdk-8: update to latest ga version 252
To: Richard Leitner <richard.leitner@skidata.com>,
 openembedded-devel@lists.openembedded.org
References: <20200428061402.106880-1-richard.leitner@skidata.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <4b95fde2-c74d-f000-ba03-ff523b95407c@gmail.com>
Date: Tue, 28 Apr 2020 09:42:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428061402.106880-1-richard.leitner@skidata.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Richard,

On 4/28/20 8:14 AM, Richard Leitner wrote:
> This patch also drops the md5 checksums as sha256 checksums are sufficient.
> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
> CHANGES v2:
>   + added missing openjre recipe update
> ---

<cut>

Builds and runs fine on my setup.
Thanks,
Jacob
