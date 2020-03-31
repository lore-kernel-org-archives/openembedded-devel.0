Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web11.4172.1585638303361017985
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2020 00:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c+BUlwDO;
 spf=pass (domain: gmail.com, ip: 209.85.167.67, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f67.google.com with SMTP id t11so3950594lfe.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2020 00:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=8BloZbYR4j84iu6RIKqflADGLsR2Uj8LDdt8CATJZTQ=;
        b=c+BUlwDOz4L6W+hnllyjRCF72jjqM0oXagggM9IwvxGwSWiRMRn3jwp3ChM/w9KIpO
         i2gyDWtm0HzoZHRAC7Vqu2hKM7CwyslsGznoAnFzObPC0z0PROg3y6D8lZPuSuSX/gFo
         JTo7Cj58fW7J6CUbpIpYD+j3bPidVE/x8ERxAl1GmznIPAYgcD65GLdR05Ky9wCgIbr+
         GOKU5e/QQ0qwRGn9gQQHFoyDHPTWUZasf1wQxrfPEGMGoWNh9wwp7VQ9mefeBv9tMBVI
         MaHYo0mj5lRfxdoOD0mHHE51yXy4dKqpTfe5pPX0a8gYzlyfyECT+f8u7uDdWy3Uubzq
         kJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8BloZbYR4j84iu6RIKqflADGLsR2Uj8LDdt8CATJZTQ=;
        b=S908vdXDlBCOOGos6pbzrLpdLlp6+1PJJi0ZdPYkY36u2R8C6FWszMiD10S+m8J2XI
         fyCmagNCejLJOW+qWN6ucf3PfOQuG2oMhPWTkC+Taedqnpzhe7GWVNKJhGDbAURCu/gL
         ekwfcBk7MHqQPuLmjiSgXOacwIKhwcFZl7Z0F1BohGZoweAk/KxM5/JYdoa6bp6VGsAk
         lbrEr7Vck7z0+QbbSEhBA766P2K1KkyXlCRgDMZKc5ahFqGw+QMaVT47amYtWngBayCM
         3J/VWLPbb0/aaErE7RLrJQ7L5SMY0RQyIcZahxBnKu3g4W6U8ToHbqYI5R2TKyoNryW7
         iUBA==
X-Gm-Message-State: AGi0PuaN32Lz0Zzayb0dNysQCGs2uUZrBI6gZs+qeT3zpl5Wu7BuyFWM
	+HRJ389EWEFkai7B7FA5cmal9Pi9
X-Google-Smtp-Source: APiQypIlgprpRO/XmmvS0sFxOhkw0rhMd/gfRFGWw3CAKuV6rjspYrffr7QN5o105C3FHgo/9YMgcw==
X-Received: by 2002:ac2:5211:: with SMTP id a17mr8274207lfl.167.1585638300246;
        Tue, 31 Mar 2020 00:05:00 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id b16sm3939659ljh.20.2020.03.31.00.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 00:04:59 -0700 (PDT)
Subject: Re: [oe] Request to Revert 'recipes: rename distro_features_check to features_check' comit on meta-java zeus branch
To: Alex Kiernan <alex.kiernan@gmail.com>,
 Geoff Parker <Geoffrey.Parker@arthrex.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <BY5PR11MB4307FAE9DC43F1587395B1FEE7C80@BY5PR11MB4307.namprd11.prod.outlook.com>
 <CAO5Uq5S43bAyCv2Z58APL70xWEFXdHi8+UvsXy7PE0rrkt8LGA@mail.gmail.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <a8f619ef-4bba-b3f9-1e69-2f16b2a5f914@gmail.com>
Date: Tue, 31 Mar 2020 09:04:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAO5Uq5S43bAyCv2Z58APL70xWEFXdHi8+UvsXy7PE0rrkt8LGA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/31/20 8:17 AM, Alex Kiernan wrote:
> On Tue, Mar 31, 2020 at 5:46 AM Geoff Parker
> <Geoffrey.Parker@arthrex.com> wrote:
>>
>> Hi Alex,
>>
>> We  moved one of our products to the zeus Yocto 3.0 meta layer branches. It recently stopped building due to this commit on the meta-java zeus branch:
>>
>> commit d2e962a795e8713e5443659669842298453d938f
>> Author: Alex Kiernan <alex.kiernan@gmail.com>
>> Date:   Sat Dec 7 18:07:38 2019 +0000
>>
>>     recipes: rename distro_features_check to features_check
>>
>>     Avoid warning due to the class rename in OE-Core.
>>
>>     Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>>     Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>>
>> Although this change is appropriate for the Yocto 3.1 branches, it breaks our build on Yocto 3.0 zeus because the zeus branch of the openembedded-core layer does not have the features_check class.
>>
>> The following recipes fail to parse:
>>
>>    openjdk-7_99b00-2.6.5.bb
>>    classpath_0.99.bb
>>    cacao_2d6fc614daf9.bb
>>
>> With errors like:
>>
>> ERROR: ParseError at /home/geoff/yocto-ccu/poky/build/../meta-java/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb:7: Could not
>> inherit file classes/features_check.bbclass
>>
>> Can this commit be reverted?
>>
> 
> @OpenEmbedded Devel List this shouldn't have been pulled into zeus as
> it relies on changes in master on oe-core
> 
> 

I've sent:
https://lists.openembedded.org/g/openembedded-devel/message/83557

Anyone know how I can make the new mailing list archive use a sane font 
when displaying patches ?

/Jacob
