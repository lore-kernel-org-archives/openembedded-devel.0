Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4988C0502C
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 09:30:41 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web09.47462.1661592633966524161
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 02:30:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ybi2KMo3;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: uvv.mail@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id og21so7096237ejc.2
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 02:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=bkSg7hwkMWpw4Fm03PdExmUSDsDzJodUfPwqdnorL8s=;
        b=Ybi2KMo3jMjjvW9oiEvQgqz2C/alzLQiSguYhqzf3F0naUAEqO9RFknJmcaFD1xrFS
         qUj2vy4J5USmzz6w1mW2owdbKn3pBDM5ZY2kJDrskxngj6kFGQJj9UAShroNylRI9I51
         gzHF2boevcKxI9OlD+9K+d0O0VMT5CAg7wxSQW4hbPe1kzCLtJ54SYjfl3N/Jpp8/8wb
         unKH5AWxk/jvgdQzediLa11J9zyjYiT5VZTJU0Dz+lGMtHvpeFu4u/A9tQ6tEgXKMfBb
         SO29MfQV0hx7pfckgheRGPMzJxldPCwehjfdl0PQTxo+Xpru158hKD6byzPkyS8SRyKP
         45Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=bkSg7hwkMWpw4Fm03PdExmUSDsDzJodUfPwqdnorL8s=;
        b=xeud5SGoYQh5vdz77YyLAM2DdVCHz995gMnqgBRueutUvm805jo2kzdIvzL2t6KkNs
         6WeKfAHihAQ8Pv3ZrhR8MVaLgneBL/OJZwTmQeVODpzTFQi/qZNBhQBHHbn4wkX8fWk0
         i6P/+0e+WqA0Ccr/7kQUQfuP0b0uyoRoAnXmkwSBEkTr91AypTCwpHWMpKF3xXWc9kae
         Lb+2Ab7imemIbRur420PCFQO5wIiqpWJqiCWF59F9fng3ApVTQMsRURXSVx7vIYYSrl3
         6qmtTGGoGX4nc7bx7KA03rfiFc/eFww+inCOfPIJ/MxMmetEtXtK8decoJrhaOBSftDa
         xdfA==
X-Gm-Message-State: ACgBeo1vG+luyOY5rIumAjZWV1J57dQjnYJVPtEZUJ5IzsgDp1KPRiJr
	O8tPFH4KKcqrIziPmp6CJf0=
X-Google-Smtp-Source: 
 AA6agR5WDdq8RhoJmI+RrOQM7rpFUO0MLxKd0HBkTNilaDhNClRrkX2PeYMfKg5f5uRjNADkkqbTbw==
X-Received: by 2002:a17:907:1c9b:b0:73d:62e2:f1ec with SMTP id
 nb27-20020a1709071c9b00b0073d62e2f1ecmr7737461ejc.60.1661592632346;
        Sat, 27 Aug 2022 02:30:32 -0700 (PDT)
Received: from [10.135.81.85] ([37.120.204.195])
        by smtp.gmail.com with ESMTPSA id
 r5-20020a17090638c500b0073c0b87ba34sm1825806ejd.198.2022.08.27.02.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Aug 2022 02:30:31 -0700 (PDT)
Message-ID: <15677aeb-e222-0d70-36c3-c806b34b7481@gmail.com>
Date: Sat, 27 Aug 2022 11:30:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [oe] [meta-oe][PATCH v2] protobuf: disable protoc binary for
 target
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
 Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
References: <20220827075947.3579120-1-uvv.mail@gmail.com>
 <CAMKF1soGYkcUSk+xUR_azDas6CcNRDasyKsOrwcP3br3GWNuQg@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: 
 <CAMKF1soGYkcUSk+xUR_azDas6CcNRDasyKsOrwcP3br3GWNuQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Aug 2022 09:30:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98488

On 27.08.2022 11:18, Khem Raj wrote:
> On Sat, Aug 27, 2022 at 1:00 AM Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>> From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
>>
>> When applications want to use protoc during the build, the target binary
>> has to be disabled in order to avoid following error:
>>
>> |   The imported target "protobuf::protoc" references the file
>> |
>> |      "<application build dir>/recipe-sysroot/usr/bin/protoc-<protobuf version>"
>> |
>> |   but this file does not exist.  Possible reasons include:
>> |
>> |   * The file was deleted, renamed, or moved to another location.
>> |
>> |   * An install or uninstall procedure did not complete successfully.
>> |
>> |   * The installation package was faulty and contained
>> |
>> |      "<application build dir>/recipe-sysroot/usr/lib/cmake/protobuf/protobuf-targets.cmake"
>> |
>> |   but not all the files it references.
>>
>> Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
>> ---
>>   meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
>> index 83dabc9f8..e36179363 100644
>> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
>> @@ -34,6 +34,13 @@ EXTRA_OECMAKE += "\
>>       -Dprotobuf_BUILD_EXAMPLES=OFF \
>>   "
>>
>> +# Configuration below allows to cross-compile protobuf applications
>> +# and use native protoc binary in your recipes. In order to use protoc
>> +# on the target, set protobuf_BUILD_PROTOC_BINARIES to ON in your bbappend
>> +EXTRA_OECMAKE:append:class-target = " \
>> +     -Dprotobuf_BUILD_PROTOC_BINARIES=OFF \
>> +"
>> +
> can we make it a packageconfig perhaps ?
>

Makes sense. Any suggestions about the name? So far only something like 
"compiler" comes to mind.

Vyacheslav

