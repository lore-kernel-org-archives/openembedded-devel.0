Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web08.3778.1611884071007955994
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 17:34:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L1WP1wFm;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id y205so5206260pfc.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Jan 2021 17:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=maZoS4KL0waAPCZqjoD9BDBqpqgnitokjXARCEYNT1M=;
        b=L1WP1wFmFm+XjS+OzG7d69MF4BFVmvXkCqxaywzJpKmbablNDjOMh3/61q8Buh/oLT
         Sdr6dOeohU3c8S13Q3JTH2Dc566G9jxa00y3T6jKemSTvwu/3SmQ64gFpdDARpz9BZa/
         O3IdifLTYUsEO6uCBXafs+7PDuiGAr6V640gyL9lkOeHqOXrcOEzvCCtSE6hOWx26D9d
         d5g/vM8lXWdURDVejwP0CJakvFOzA1Whc/MloLMK4qBcQ8qUa56ZPspJj2QP1OzPYRko
         bEFUPNjggjKzqcX70vXXLYEzXX8vEQuyr8ys3+R3MuOq1gb7C6YQOLB+4HabXoD0Daae
         DlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=maZoS4KL0waAPCZqjoD9BDBqpqgnitokjXARCEYNT1M=;
        b=dtkgpa7SC+JWmZ1+Egw5D//DQW+XnYqZ6JBMtP9C0KpYyvamyByqV+PiF0tmpbujVB
         1hWuLFpthU4TIrU92VS9hJUdix4RpswKpEAk9d7bu0q3bZ+yusstq16A7Peo/VeMNaO6
         9VerIXJ66s/O8PzK3x6vmN9/0OPS2nQRlg+mgg67Bz5AH2t6UAadflCDxHj/O2iep++w
         gIfJ08BNa5SRykUwOmbkzOz41Fk77Kg3ZtsN50648/j6bR5eGuJECkmpIV0KW0IvC2sc
         F7N7k1/PSrmrSw5aqwkPDNbS4xLU163PhXrb6F5ZyFA57/gw4uvqwC6IlqKrkotW3KKb
         c9QQ==
X-Gm-Message-State: AOAM531zlyPooKYOq8akwFD7bpWg9hZhe1j4wmoC+wpCKOS+caMZZPha
	6L4iFYsf+qd9+I6VwmSgpAiD9Wu0z4shJg==
X-Google-Smtp-Source: ABdhPJxxCYQlAHZArhbztTrc2zr1DyPOz7I5G9ap1zOr5mNWJz8xltnHQWrfatXTmBZq46qYDLSmSQ==
X-Received: by 2002:aa7:93a2:0:b029:1bf:23a3:a945 with SMTP id x2-20020aa793a20000b02901bf23a3a945mr1984017pff.70.1611884070378;
        Thu, 28 Jan 2021 17:34:30 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:41d5:7688:5129:bafc? ([2601:202:4180:a5c0:41d5:7688:5129:bafc])
        by smtp.gmail.com with ESMTPSA id t6sm6996494pfe.177.2021.01.28.17.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 17:34:29 -0800 (PST)
Subject: Re: [oe] [meta-oe][dunfell][PATCH] mariadb: update to 10.4.17 for cve fixes
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210112221203.14501-1-akuster808@gmail.com>
 <CALbNGRSPPUcABa1m8kbiCJ3CS3drkL2BxaejaY20vxLRDOPWEQ@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <085aa92c-3046-40ea-9864-114eb5ef5a45@gmail.com>
Date: Thu, 28 Jan 2021 17:34:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRSPPUcABa1m8kbiCJ3CS3drkL2BxaejaY20vxLRDOPWEQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 1/27/21 1:24 PM, Andreas Müller wrote:
> On Tue, Jan 12, 2021 at 11:12 PM akuster <akuster808@gmail.com> wrote:

I have not seen this issue and IIRC, someone else has reported the
problem too.  I do respond to issues logged OE github.

On my list to look into.

thanks,
Armin
>> Source: mariadb.org
>> MR: 107836, 107837, 107838, 107839, 107840, 107852, 106414, 106414, 107864, 107876, 107888
>> Type: Security Fix
>> Disposition: Backport from mariadb.org
>> ChangeID: 75fb83ced15990b94659af6e107c063d288cb037
>> Description:
>>
>> refresh several patches
>> Drop 0001-Fix-build-breakage-from-lock_guard-error-6161.patch as fix included in update
>>
>> Bugfix only update including these cves:
>>
>> 10.4.13
>> CVE-2020-2752
>> CVE-2020-2812
>> CVE-2020-2814
>> CVE-2020-2760
>> CVE-2020-13249
>>
>> 10.4.15
>> CVE-2020-15180
>>
>> 10.4.16
>> CVE-2020-14812
>> CVE-2020-14765
>> CVE-2020-14776
>> CVE-2020-14789
>> CVE-2020-28912 (MDEV-24040)
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> It seems that this causes:
>
> | mv: cannot stat
> '/home/amuller/tmp/oe-core-glibc/work/aarch64-mortsgna-linux/mariadb/10.4.17-r0/image/lib/security':
> No such file or directory
> | WARNING: /home/amuller/tmp/oe-core-glibc/work/aarch64-mortsgna-linux/mariadb/10.4.17-r0/temp/run.do_install.40640:1
> exit 1 from 'mv
> /home/amuller/tmp/oe-core-glibc/work/aarch64-mortsgna-linux/mariadb/10.4.17-r0/image/lib/security
> /home/amuller/tmp/oe-core-glibc/work/aarch64-mortsgna-linux/mariadb/10.4.17-r0/image//usr/lib'
> |
> ERROR: Task (/home/amuller/data/oe-core/sources/meta-openembedded/meta-oe/recipes-dbs/mysql/mariadb_10.4.17.bb:do_install)
> failed with exit code '1'
>
> Cheers
>
> Andreas

