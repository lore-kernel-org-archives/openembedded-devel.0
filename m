Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.6532.1612620052809697860
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 06:00:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=N3/C8blT;
 spf=pass (domain: konsulko.com, ip: 209.85.208.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f44.google.com with SMTP id s11so12796122edd.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 06:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=42028DR4sI3CxnwJ064JpqybVfK9J2kEbRlkQPyz/Xo=;
        b=N3/C8blTAx0gP8wF3acpuIREUFY+J66sbDmWEPyV1vemZR9BHIK7b9Z8qclCxOq2EL
         92LPR+H0vp/if1a6g1SZ1ZQoOyfwLvjb+9opWYXV1K5iNU84d+Yczv4ud62ixeLll+qg
         kc9r7Xec2+ZxH/ZPEYhbwdVj6mvPLoJwn+nAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=42028DR4sI3CxnwJ064JpqybVfK9J2kEbRlkQPyz/Xo=;
        b=A3Zk3Ihb6ehzUaH5LRmuypNxQOyrmMxTx4AtCwmMqf0Uc6fNLNly1cLlvKht9qXcxj
         8L0kTqKoq/8+3kKjrrZJYW6srks36i/c2XtCrrDKhRNZSbxZiv7uLZbEGCOAK+uFOwb6
         XT7cxcTp5438pNMVBqP81qgg62ziYLATHV8iLbEiSNY3DgRAgaLWHdemGW0EXfXybg8r
         kbuRK9f0TsabxBxnUwALQeB8rvnXCmSJNhgSBNIFb390rTh8oVpl/5WojfQHaU2ggs7x
         db6VW/cEcVl82DQ0vykcLw9a++Q5Nz+mZJoXsMBj9MbT8EO56At2/yWtQulaDeZlYFqR
         axgA==
X-Gm-Message-State: AOAM531lEcyVRuH6uHgHIY87XtusOACxNvh3a1AfnCHcdXeO5J/14V35
	/ohbhuUVCSSc39l4UJUUQ55OMmYG23++9A==
X-Google-Smtp-Source: ABdhPJzqGCCY1OxN3bFf60OsZROAyjXERS3ELinfkI/gRKrbJP1YMdUKVxnQqZvL6JLzVeeTnkjIiA==
X-Received: by 2002:a05:6402:1013:: with SMTP id c19mr8450490edu.298.1612620050947;
        Sat, 06 Feb 2021 06:00:50 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from [192.168.4.166] ([78.130.197.211])
        by smtp.gmail.com with ESMTPSA id t9sm5247947ejc.51.2021.02.06.06.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Feb 2021 06:00:50 -0800 (PST)
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-h5py: Upgrade 2.10.0 -> 3.1.0
To: Trevor Gamblin <trevor.gamblin@windriver.com>,
 Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210203153822.25077-1-leon.anavi@konsulko.com>
 <20210203153822.25077-5-leon.anavi@konsulko.com>
 <705cccd4-b386-75b7-374d-5f89484df713@windriver.com>
 <CAMKF1soqp025hB2_m9eGiJ0832VPokhPxHb-iCV8vX_HVaKSdw@mail.gmail.com>
 <c2d93155-0eb1-063c-80a5-d51d03bb1c03@windriver.com>
From: "Leon Anavi" <leon.anavi@konsulko.com>
Message-ID: <7d8982a6-7b76-53f9-70d4-6eeb204f9489@konsulko.com>
Date: Sat, 6 Feb 2021 16:00:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c2d93155-0eb1-063c-80a5-d51d03bb1c03@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Khem, Trevor,

On 5.02.21 г. 21:56 ч., Trevor Gamblin wrote:
>> hey Trevor can you see the musl failure I am seeing ?
>> we should hold it until thats fixed.
> Alright, let's hold off then. Need to add musl builds to my pipeline...
>
I have an idea what I did wrong related to numpy versions. I will have a 
look.

Khem, btw which version of numpy did you have on your musl test setup 
when it failed?

Best regards,
Leon


-- 
Leon Anavi
Software Engineer
konsulko.com

