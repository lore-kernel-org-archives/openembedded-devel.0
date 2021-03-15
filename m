Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.10541.1615823287363008917
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 08:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Hua0MmeB;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id kr3-20020a17090b4903b02900c096fc01deso14998193pjb.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Mar 2021 08:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MDK7un3WVXAAjAGYWcR2nI5xtY/3+rybnJPT7EguRs0=;
        b=Hua0MmeBAy5qIpncuYsl9alwLyxzEd34o0+koz4Lsqn8YEddKkN6ELMyS658hZC0im
         DqnCflJBcwOG0vmLrPUjYOCwwyoG2NOnx231pVhrLBLeUTNzUFAwouVsb+ymtLuK6AoF
         jCI3tnX9x7ZKEW7mfx84FaPHo6kAcmKP0Yiu2NExF3j0MXt01HvprEftaXi379MVlP1n
         IXW+yLv7OZqyntiPudM1wg9pyfxbpRyTWKoRmyJaU6TEs1Jbarabcu7ywaiL7Y2cKZ7X
         6AnAz3E0fG45/nt3Vo8x3zqFM3LGurpOuYh8qsAsHzQPVoZKjnXKkQ3JhrQW9uUyitFc
         39ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=MDK7un3WVXAAjAGYWcR2nI5xtY/3+rybnJPT7EguRs0=;
        b=Npp5OhaDGCL6MHQ0A367+UE19TfvKd+TGizRNNyv+ctp6L0ICTJf+AVHcePvBPQQEl
         cKFJvrNKPNb5f/REFtvDgJrx+UfI+/6PSj0ZsP1/7clswY0XSco5YP+y3LqlL4Tb1M+K
         o08O2ef8+6K73gfRZ8k4sSBURJt9lO49fZjGSjwLfID/7Sq3PSc+4zKsOlX/4j/sEkQE
         3OINV9i2G2NAGIsUgirDok6TGblG7jGBbgGnNa/yCdHJNI4ghKhhtTGkPCHL4xi04GTs
         nASsc4jZFb+6eG6qVU0658to2wQH64ToZV8LWX+LFf0XKrAHF11e9k/nu7g1kV7z+Sx1
         /zsg==
X-Gm-Message-State: AOAM533EuQ7B+0kCUt0qTK5vwtUrnByLTEIjNB3gGA6t5xe2EN7MbYna
	7WSKGvOR+RokcZcJXDdOdeU=
X-Google-Smtp-Source: ABdhPJztUFS1uxR1K16vceP1mmbw9AFUnwACfzbe4B6Sa6zhLGVIveJEwS/+hnw1aCKVKBcY8yTyxQ==
X-Received: by 2002:a17:90a:f010:: with SMTP id bt16mr13655487pjb.116.1615823286741;
        Mon, 15 Mar 2021 08:48:06 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:144a:f681:e1b1:a9ac? ([2601:646:9200:a0f0:144a:f681:e1b1:a9ac])
        by smtp.gmail.com with ESMTPSA id q14sm7172080pff.94.2021.03.15.08.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 08:48:06 -0700 (PDT)
Subject: Re: [meta-oe][dunfell PATCH] thin-provisioning-tools: switch branch from master to main
To: "Bajjuri, Praneeth" <praneeth@ti.com>
Cc: Changqing Li <changqing.li@windriver.com>,
 openembedded-devel@lists.openembedded.org,
 Denys Dmytriyenko <denis@denix.org>
References: <20210315011408.6604-1-praneeth@ti.com>
 <938d2927-7eb0-c273-d4a2-6adacb09ecb8@ti.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <0ad669ca-d9e5-bd46-74f3-13e01f7d6e37@gmail.com>
Date: Mon, 15 Mar 2021 08:48:04 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <938d2927-7eb0-c273-d4a2-6adacb09ecb8@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

I think yes, this should help dunfell if backported.

On 3/15/21 8:45 AM, Bajjuri, Praneeth wrote:
> 
> 
> On 3/14/2021 8:14 PM, praneeth@ti.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
> 
> Have observed build errors like the below
> 
> DEBUG: Mirror fetch failure for url 
> git://github.com/jthornber/thin-provisioning-tools;protocol=https 
> (original url: git://github.com/jthornber/thin-provisioning-tools)
> DEBUG: Fetcher failure: Unable to find revision 
> 5e5409f48b5403d2c6dffd9919b35ad77d6fb7b4 in branch master even from 
> upstream
> ERROR: Fetcher failure: Unable to find revision 
> 5e5409f48b5403d2c6dffd9919b35ad77d6fb7b4 in branch master even from 
> upstream
> ERROR: Fetcher failure for URL: 
> 'git://github.com/jthornber/thin-provisioning-tools'. Unable to fetch 
> URL from any source.
> 
> and looked like the switching branch to main was missing on dunfell branch.
> 
> Please advise if this is the right fix.
> 
> 
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> [cherry pick commit 260809cffdaad4fcd42b0977090f2c467a5474ef to dunfell]
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> ---
>>   .../thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb    | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git 
>> a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb 
>> b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb 
>>
>> index 9f89bac22..3f82734ac 100644
>> --- 
>> a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb 
>>
>> +++ 
>> b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb 
>>
>> @@ -7,7 +7,7 @@ SECTION = "devel"
>>   LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>>   S = "${WORKDIR}/git"
>> -SRC_URI = "git://github.com/jthornber/thin-provisioning-tools \
>> +SRC_URI = 
>> "git://github.com/jthornber/thin-provisioning-tools;branch=main \
>>              file://0001-do-not-strip-pdata_tools-at-do_install.patch \
>>              file://use-sh-on-path.patch \
>>   "
>>
