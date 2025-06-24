Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DE9C71157
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 05:34:15 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.1899.1750743249848991625
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 22:34:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jf0SS0pB;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6084dfb4cd5so11541173a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 22:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750743248; x=1751348048; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lImpsb7FHbq2UPSkDu0Vs8pOzp+jGiSjEVN5uDLd7Ro=;
        b=Jf0SS0pB2EjP5rLc3cOBJ7t3vkNHHZa+DfJMlSPq5PquYswssAxK0hWugVmYsjjNCl
         UtK9KQVs4MKOk/kL23rIC7kqnspvImx4f9u3Vce9hpSKMhhgxERgaCOmjrI/WWVC06Fp
         JVAm5LdgaBI/f6qcuWYAHVpLnoc99qzfglh6MvUXhLrdWFXfVdJnC4nm0j0MQKYz9TH2
         1MRu5OSf/GKoQHHwQqzjahAWZXcVMXZPls3u1Qkl1zn35qPwedunS480BJnHHIb8jlDY
         KtX2BXyktBGLFI0LJkSYRXuQN/gE3nysH5B7Fc/7SaL02+6a1cPQUUoKgEClCYgJHZhB
         5h7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750743248; x=1751348048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lImpsb7FHbq2UPSkDu0Vs8pOzp+jGiSjEVN5uDLd7Ro=;
        b=c5WexpOgk8NTdtgmeWU8lS8+6r1nDFga2IoleWEWq1aGSlSVkX2DRd9zSj2WM1pC44
         2o9h25Ukk2q2WQ7yRItt9svAGMxTPOOqUmn0qvTV1Mw8sX75Yf88wWIdQmfVOWIdsWaQ
         +rWr71WNmUF7ajvCNgQtfSLhv4Av/vKkSEKTYTjxBDDSlyHZ7EuCHNsUtWlrJIZZ3Iar
         LAqNUBXK7P0AqlPXF3PdTHpuS8kjAGb5HWnWVDopxcWE2B/x4tTqRhDvA3a43IlMYsbS
         xuIKZ+9VQU1j/c6wI8WnuFHXGDYQGV6tV8y1KCs7BZAbpg5VpLQ6aUMO3+eYy4v0BD0/
         Y55Q==
X-Forwarded-Encrypted: i=1; AJvYcCUujSWzvO6KMwT1ZP35sOngtI6ZOAwvjb0wkIZNaW9HzlRxEMHZ77sArNj5aw1jz4HZBglkJAMgFWiV8hCc51ZB6wc=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx14ByaMokBoqTMsgrMSnaxMDWGnfW8CTrUCXiL6HHN5U2O0+Ef
	MJGHiL3IiHuv+ibUtITtUOBLg93bGUvNCCBaBDgnzP4BNz1r9syLKFRa
X-Gm-Gg: ASbGncvZ8Du2SFNVRG4bkc/HprzcOll7iACVP120kSholPifU8gTbHtfr59Q9dc8DZM
	JkqhcDO0OpEA76pC+5opGZuYkSDAd5r3M68BKE8odxCcz0kTLk3Qoms3SwPB8iUA6q6cyoSNote
	oFJaTUPTznIhdmmdICJOGP6+1/edYWsi2LdwOidXdbBed3KKunfFi+gIDXVsSfNCbl8GRfD3/gs
	ZY439RQYVtgPRVkxLxOm3VH+gkZ+42wVtVuXVzc8ltWLkfdSg+yYHGQZT6AedctpdawE0d+R7lH
	ApOW4ci8zZXhzSHDql2OR3kcgblKtQYbfsrEWNj6kB+czGr4l3Uqt/5qftViqP9ZZVTIaQ==
X-Google-Smtp-Source: AGHT+IGNJArUmmsazQrBIPOroijyXvY80/A1y7d0IVRX46Kk5r3ygrN+lIXaMaO9bAQdHAMDwkeFEQ==
X-Received: by 2002:a17:907:d05:b0:ad8:959c:c567 with SMTP id a640c23a62f3a-ae0a724dc43mr206123066b.10.1750743247385;
        Mon, 23 Jun 2025 22:34:07 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a1505294sm130165666b.83.2025.06.23.22.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 22:34:06 -0700 (PDT)
Message-ID: <b8604adf-3c3c-416c-b4f7-fe16a0e35f67@gmail.com>
Date: Tue, 24 Jun 2025 07:34:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] xmlsec1: avoid hardcoded ${RECIPE_SYSROOT}
 in xmlsec1-gnutls.pc
To: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Cc: "Yang, Liezhi" <Liezhi.Yang@windriver.com>,
 "Li, Changqing" <Changqing.Li@windriver.com>
References: <20250620041131.2424118-1-jiaying.song.cn@windriver.com>
 <1a7945c4-9a7d-4587-8a85-915bae147202@gmail.com>
 <IA4PR11MB9420B5C05331D3EE22BFE977B879A@IA4PR11MB9420.namprd11.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <IA4PR11MB9420B5C05331D3EE22BFE977B879A@IA4PR11MB9420.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Jun 2025 05:34:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118095

On 6/23/25 04:17, Song, Jiaying (CN) wrote:
> Hi,
>
> Thanks for your questions.
>
> The issue can be reproduced by explicitly enabling p11-kit in the gnutls PACKAGECONFIG.  For example, by adding the following line to your local.conf:
>
> PACKAGECONFIG:append:pn-gnutls = " p11-kit"

Thanks a lot, I managed to reproduce it based on your instructions.

>
> This configuration is needed on platforms that require certificate management or use smartcard/token-based cryptographic modules supported by p11-kit.
>
> The reason this problem does not appear in default Poky builds is that p11-kit is not enabled in gnutls by default.  Therefore, the build sysroot path does not get pulled into the generated .pc files, avoiding the QA error.
>
> Thanks,
> Jiaying.
>
>> -----Original Message-----
>> From: Gyorgy Sarvari <skandigraun@gmail.com>
>> Sent: Friday, June 20, 2025 7:59 PM
>> To: Song, Jiaying (CN) <Jiaying.Song.CN@windriver.com>; openembedded-
>> devel@lists.openembedded.org
>> Cc: Yang, Liezhi <Liezhi.Yang@windriver.com>; Li, Changqing
>> <Changqing.Li@windriver.com>
>> Subject: Re: [oe] [meta-oe][PATCH] xmlsec1: avoid hardcoded
>> ${RECIPE_SYSROOT} in xmlsec1-gnutls.pc
>>
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender and
>> know the content is safe.
>>
>> On 6/20/25 06:11, Song, Jiaying (CN) via lists.openembedded.org wrote:
>>> From: Jiaying Song <jiaying.song.cn@windriver.com>
>>>
>>> Fix do_package_qa error by removing ${RECIPE_SYSROOT} from the installed
>> xmlsec1-gnutls.pc file.
>>> This ensures the generated .pc file does not leak build-time paths, complying
>> with QA checks.
>>> Fixes QA error:
>>> ERROR: xmlsec1-1.3.7-r0.wr2500 do_package_qa: QA Issue: File
>>> /usr/lib/pkgconfig/xmlsec1-gnutls.pc in package xmlsec1-dev contains
>>> reference to TMPDIR [buildpaths]
>> How could this be reproduced? Does it need some special config or
>> environment?
>>
>> I tried to build it in both master and walnascar for qemux86-64, and it was
>> successful, QA checks passed. I used the default recipe, where gnutls is part of
>> PACKAGECONFIG, and also when PACKAGECONFIG only contained "gnutls".
>> xmlsec1-gnutls.pc was also generated and installed.
>>
>>> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
>>> ---
>>>  meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb | 7 +++++--
>>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
>>> b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
>>> index 2fdfd55f24..0f4ae205b1 100644
>>> --- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
>>> +++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
>>> @@ -54,8 +54,11 @@ do_compile_ptest () {  }
>>>
>>>  do_install:append() {
>>> -    for i in ${bindir}/xmlsec1-config ${libdir}/xmlsec1Conf.sh \
>>> -        ${libdir}/pkgconfig/xmlsec1-openssl.pc; do
>>> +    for i in \
>>> +        ${bindir}/xmlsec1-config \
>>> +        ${libdir}/xmlsec1Conf.sh \
>>> +        ${libdir}/pkgconfig/xmlsec1-openssl.pc \
>>> +        ${libdir}/pkgconfig/xmlsec1-gnutls.pc; do
>>>          sed -i -e "s@${RECIPE_SYSROOT}@@g" ${D}$i
>>>      done
>>>  }
>>>


