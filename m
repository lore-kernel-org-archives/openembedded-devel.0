Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web08.8323.1617806871815284524
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 07:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ai2ba6qP;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id w10so7743703pgh.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Apr 2021 07:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xlSLE8SIB9iB4w/GAv2yGUl18nlO58lz0A+VaZHkRCc=;
        b=ai2ba6qPFZsqOZauiIQtT2fZqMZ2ZfFp2vSPwLmF3tzvTj53lvRjavbIaHv+208jp8
         iPjtKYeFuSdgwQ6vhENxZ/oj/6k0jmGja4EhnQ8rUa5yrMoLOsQxe4nQ9ORo/BB5o+FM
         fA+aUOXuKHorLqmPZRXy1ShIuarJWDYmgBfzjDp7FQ4pFqrxbL+3fo/s7ub2Sp29jElk
         yQF/nOBeUULwsNcazyDb6j25Axivn80WFZMkdmUk6l1ODYzZFTF3L51Le6q5EJSgSyCu
         PZirHg+5etEOGAfv5/O82QXSnrs6Bn+aXexeIxjrVGFiMkDHk2gOv3Tda566UNUVyG2s
         PqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=xlSLE8SIB9iB4w/GAv2yGUl18nlO58lz0A+VaZHkRCc=;
        b=pyrqiH0l9+TiOyKSDW1tN1gcdRFCexcg8AHWmwcJq1HDERxRVAzaPwSuTS1hijOUG3
         uteCzUODuqPj8AdBJzLM/XfI0UWQCv8NZ8jxFbt0PRZsOeL+g2cwMg1E+O1pa1QciuAM
         pFRqRsC0h6UueBA3F6698GlsBT99uK1tdAhvS9sEzr7yoOXbzsLvuyuEwqeQGZx6zqp8
         ak480hxOxmvwnCe0jlIBWtvpC+E7eecpyEmeB3Jc+GgjNvkeqvLq+aj//JbnAt8jm2W2
         ajZ80iDcXs6neFWq8eoA12zL+uZpCUgu+pl0b6umUcguWNOlwgKABXML5q73RACNoZUM
         /mzQ==
X-Gm-Message-State: AOAM533WW4pDj//5pI5eoibGhHLihVjC25cajxfRoxp4NwJo//aw6kkp
	BMfaD/5RuOtC1MwSHFJUOBIb2aevPOgOsg==
X-Google-Smtp-Source: ABdhPJzQG7StcYe0bXYN5a8RkzVutwouqB/IQ6cqFt3UFv2joRqVAzBLsYWriX57d+UrfYF8N8rd4A==
X-Received: by 2002:a62:63c7:0:b029:225:7c19:a8f9 with SMTP id x190-20020a6263c70000b02902257c19a8f9mr3317677pfb.39.1617806871140;
        Wed, 07 Apr 2021 07:47:51 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::7c4e? ([2601:646:9200:a0f0::7c4e])
        by smtp.gmail.com with ESMTPSA id f6sm15521066pgd.61.2021.04.07.07.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 07:47:50 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH v2] bpftool: remove recipe from blacklist
To: "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC at Cisco)"
 <dzagorui@cisco.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20210325161828.41393-1-dzagorui@cisco.com>
 <7f3a1c21-5425-c29b-ebc3-5c6363905b3c@gmail.com>
 <BY5PR11MB4024ED277A4D898134E1544DD9759@BY5PR11MB4024.namprd11.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <ac355829-830d-8a36-b601-6b2ad63409d0@gmail.com>
Date: Wed, 7 Apr 2021 07:47:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <BY5PR11MB4024ED277A4D898134E1544DD9759@BY5PR11MB4024.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

some email agents change the email headers like this. We do have catch 
for some and Its a pain to edit them manually, so ask your IT why its 
happening for your emails. Otherwise send pull requests where this would 
not happen

On 4/7/21 6:32 AM, Denys Zagorui -X (dzagorui - GLOBALLOGIC INC at 
Cisco) wrote:
> I've noticed that this patch
> https://git.openembedded.org/meta-openembedded/commit/?h=hardknott&id=2179569945f07a8ad54b9015dc5fad4300cdbde9
> and another patch
> bpftool: improve reproducibility https://git.openembedded.org/meta-openembedded/commit/?id=120de5e02ae4d48bb75e910caa2b7f4ae4b3d025
> have strange author field
> author  INC@Cisco) <INC@Cisco)>
> I'm wondered how is that happened.
> 
> ________________________________________
> From: Khem Raj <raj.khem@gmail.com>
> Sent: 25 March 2021 20:12
> To: Denys Zagorui -X (dzagorui - GLOBALLOGIC INC at Cisco); openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH v2] bpftool: remove recipe from blacklist
> 
> 
> 
> On 3/25/21 9:18 AM, Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco)
> via lists.openembedded.org wrote:
>> Have not seen build issues for 5.4 and 5.10
>> x86-64 kernels so allow to build it
>>
>> Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
>> ---
>>    meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 4 ++--
>>    meta-oe/recipes-kernel/bpftool/bpftool.bb                  | 1 -
>>    2 files changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>> index c717d45e5..6f7e6fc74 100644
>> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>> @@ -608,12 +608,12 @@ RDEPENDS_packagegroup-meta-oe-kernel ="\
>>        trace-cmd \
>>    "
>>    RDEPENDS_packagegroup-meta-oe-kernel_append_x86 = " intel-speed-select ipmiutil pm-graph turbostat"
>> -RDEPENDS_packagegroup-meta-oe-kernel_append_x86-64 = " intel-speed-select ipmiutil kpatch pm-graph turbostat"
>> +RDEPENDS_packagegroup-meta-oe-kernel_append_x86-64 = " intel-speed-select ipmiutil kpatch pm-graph turbostat bpftool"
>>    RDEPENDS_packagegroup-meta-oe-kernel_append_poerpc64 = " libpfm4"
>>
>>    # Kernel-selftest does not build with 5.8 and its exluded from build too so until its fixed remove it
>>    RDEPENDS_packagegroup-meta-oe-kernel_remove = "kernel-selftest"
>> -RDEPENDS_packagegroup-meta-oe-kernel_remove_libc-musl = "crash intel-speed-select kernel-selftest minicoredumper turbostat"
>> +RDEPENDS_packagegroup-meta-oe-kernel_remove_libc-musl = "bpftool crash intel-speed-select kernel-selftest minicoredumper turbostat"
>>
>>    RDEPENDS_packagegroup-meta-oe-kernel_remove_mipsarch = "makedumpfile"
>>    RDEPENDS_packagegroup-meta-oe-kernel_remove_mips64 = "crash"
>> diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
>> index 1758430bc..e58bdd493 100644
>> --- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
>> +++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
>> @@ -32,4 +32,3 @@ python do_package_prepend() {
>>    }
>>
>>    B = "${WORKDIR}/${BPN}-${PV}"
>> -PNBLACKLIST[bpftool] ?= "Needs forward porting to kernel 5.2+"
>>
> 
> you need to set proper COMPATIBLE_HOST here too.
> 
>>
>>
>> 
>>
