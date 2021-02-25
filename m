Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web08.5829.1614219248693043290
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 18:14:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pk/9Ql6k;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id f33so4236938otf.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Feb 2021 18:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NRQcBrxpNrESmc2OF/nPp4PN/pY4rGSbIdl/X9lqxPY=;
        b=Pk/9Ql6kx793uO1CFmwo/qe6MKVk51CSI6KbgT0UugrDT7J8hNfQx3IsoPnNvhXQjo
         Ho935M3uMZre0VPBL4As3fT5j9Vvl0pfaMVc91zqS7tSCIKdXyH+2MUoqdt3+VgaUT0v
         Q2HA9INNvZWAfnRq5swHsbB1h6SVKC5HWyi0b5RIP6g4culXjgc63Lm70ARAdBJV+Uyy
         4lSIyvsyLAmBmMXNXln69vP6b4Ah+WELH4/rb854uyk+hdSuJJjOB1J/88L6U8ETBH/R
         6unixoV+JnbGOLUsdxH8XYl6Ri6zj4K1l70naY5VNMcEUAFgjAlcTVcQrkKSJ9aQPFfN
         vXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=NRQcBrxpNrESmc2OF/nPp4PN/pY4rGSbIdl/X9lqxPY=;
        b=Vt+i6+xYfoqEFVowVKiyU+pc1qwas/3IjukvEDuiufsud9Y6oV9fIAgJyY9e8CtdFL
         2jPHPzQYjT1j/oem2CjCmqzdUFjce9Ab0oG3fqAtZLMwmkFbArlRZzV3MsOIlIArxRGg
         RILdVjdHaqWdUWt0NKdbwLF9GeWmHc2N04F/OvagFStnBImrT/E/8gVC2YsgVhkdH8qa
         v/yVvZekNPcXxSaH95a/QLi58zm8FArFrIz6MSDjNa04P+VIrnRO5W5dgobVTsX8azek
         sgaq9otMUaovXUdjxu40oGMhApK1VpcovETKMhydKqNBlMF8F05BrFqG1h1TlVp+1vA9
         xXpw==
X-Gm-Message-State: AOAM530WPNrOmbVRgLdKzprpfYv2KL+G547Ljitiu08iOYRuc+6RZUf1
	ZzPq2YHhnuI94tVUDpylARk6mIMCIuSFzg==
X-Google-Smtp-Source: ABdhPJwD7gAsJNLr+PtMX5r9TBYKxNYgIA1g0XIubkTlt33HtQrtDSXTtGYnBvBjxVLy5PqyMsEhyw==
X-Received: by 2002:a9d:6b99:: with SMTP id b25mr513846otq.30.1614219247558;
        Wed, 24 Feb 2021 18:14:07 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:d93a:4e4e:9a91:e737? ([2601:646:9200:a0f0:d93a:4e4e:9a91:e737])
        by smtp.gmail.com with ESMTPSA id 43sm805259otv.69.2021.02.24.18.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Feb 2021 18:14:07 -0800 (PST)
Subject: Re: [oe] [meta-oe][PATCH 1/2] libssh2: remove the recipe since it moved to oe-core
To: Randy MacLeod <randy.macleod@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <1666DA5E5611EB4D.10310@lists.openembedded.org>
 <019de890-4401-e038-38e1-69271c007766@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <37b7dd52-ed2f-3e65-9011-a4a9cc24bee5@gmail.com>
Date: Wed, 24 Feb 2021 18:14:05 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <019de890-4401-e038-38e1-69271c007766@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 2/24/21 5:50 PM, Randy MacLeod wrote:
> On 2021-02-24 8:46 p.m., Randy MacLeod wrote:
>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>> ---
>>   ...nviroment-to-decide-if-a-test-is-bui.patch |  46 ------
>>   ...ditionally-undefine-backend-m4-macro.patch |  30 ----
>>   .../libssh2/files/CVE-2019-17498.patch        | 131 ------------------
>>   .../recipes-support/libssh2/files/run-ptest   |   8 --
>>   .../recipes-support/libssh2/libssh2_1.9.0.bb  |  53 -------
>>   5 files changed, 268 deletions(-)
>>   delete mode 100644 
>> meta-oe/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch 
>>
>>   delete mode 100644 
>> meta-oe/recipes-support/libssh2/files/0001-configure-Conditionally-undefine-backend-m4-macro.patch 
>>
>>   delete mode 100644 
>> meta-oe/recipes-support/libssh2/files/CVE-2019-17498.patch
>>   delete mode 100644 meta-oe/recipes-support/libssh2/files/run-ptest
>>   delete mode 100644 meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
>>
> 
> This and libgit2 are only in oe-core/master-next at the moment.
> 

Thanks, yes I observed that

> 
> 
> 
> 
