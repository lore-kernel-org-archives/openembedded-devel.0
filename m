Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.3032.1588660633515752663
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 May 2020 23:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qv6MdxLA;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: robert.berger.oe.devel@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id j5so476850wrq.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 May 2020 23:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n9fi6J7fXMoxNZ4RjPnlaFE8xI5cz47lTh/k2BCQUXc=;
        b=Qv6MdxLA+sNDNTrUQYMhjsmCE/blkqox8ZYnAgEqHl3b0w8ea4PQNET5ucQO39Tebu
         UYgF+/8xYCXAJsVfV1sCF09ToizJCAne5bG3qcj1wULSvDSYlIEaN3sO5TTGzzhGP5dd
         v29IdpewCchcERUMNYvo2hJOBOGiZwwspOsabdp338gzLH7B1oWkQUycbGusR6skASw1
         AwUxhTfmIWqsLh1wpuZM8MYtprEG48/TRyqDxfYbiYUH5i81HPvqYxfEkjPymL24EZk+
         ph9En4LPGBJ4anqtTZGvPJUTUVw9zuSVBi1njmXYXHmS6slJPb3Of3j8qlgsJ6/Gslvf
         Hf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n9fi6J7fXMoxNZ4RjPnlaFE8xI5cz47lTh/k2BCQUXc=;
        b=aVUaceZvwGWNmEu5JFgaRNU+WlWj8AFyOS3AWB6+amRGjg1cT2dCpMhjPGBbIedD2p
         ioW4b0WNwBnCk8skK8reiPHLLzPkfCFThwXvONijStp+9mP4+i9Wvoi6GAGfI2GFS5A4
         wB8/N72tuY7pFPzVtb0MHmV3PGZJUSzXQ4enj5LzI+erAgysiGbj7ZBiklikw7AHRKEj
         zNQinI4trogV16ZWMsJkfXqDluKCCYSCxp73h1exwlgwJ9g4XS0Bpg34B8eBDXH3sP4y
         2ogXRuJM26SEx9Rtm47WhhaBdJS/nhsY81U/fTa0DT+UpkQdaUg1jBbYYAKRIpZCKRZ7
         MKqg==
X-Gm-Message-State: AGi0Pubh1Oxzi3qhM3hUjgnpItlZsHeJ6/53So0C8+98qvJn1NgjnEr4
	x9rI3F7KQ5VGXBnIS/qM1IWTUOVb
X-Google-Smtp-Source: APiQypIgzNN/fiSgnPjoWr3PeXOdMeI0OC6NsNpuBLmqC3Ni4FuOnBil0rtjAAlLiGdiewkGCuPXyw==
X-Received: by 2002:adf:dfcd:: with SMTP id q13mr777707wrn.22.1588660631555;
        Mon, 04 May 2020 23:37:11 -0700 (PDT)
Return-Path: <robert.berger.oe.devel@gmail.com>
Received: from [192.168.42.52] (ppp-94-65-43-120.home.otenet.gr. [94.65.43.120])
        by smtp.gmail.com with ESMTPSA id g186sm2174668wme.7.2020.05.04.23.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2020 23:37:10 -0700 (PDT)
Subject: Re: [oe] [meta-java] host gcc-9, icetea-7 gcc-9 but how older gcc versions?
To: Richard Leitner <richard.leitner@skidata.com>,
 Robert Berger <oecore.mailinglist@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <7946cd8c-4a94-5e5a-7bdc-64963af21006@gmail.com>
 <20200429100259.GA249641@pcleri>
 <92bb1785-280d-ba90-9366-e2a7793d36d5@gmail.com>
 <20200429130233.GB249641@pcleri>
 <1550debd-8a7f-9a1a-0e12-9566b69405b4@gmail.com>
 <cbc9dc58-61a7-8133-698c-6570f85f85f6@gmail.com>
 <20200430211745.GC410632@pcleri>
 <160AE28F2E93B445.19580@lists.openembedded.org>
 <0237cfe6-4162-a253-4799-678177dca1ab@gmail.com>
 <1110be9f-444f-5b6c-f16c-e638493b31e1@gmail.com>
 <20200505053517.GA4964@pcleri>
From: "Robert Berger" <robert.berger.oe.devel@gmail.com>
Message-ID: <a9143deb-fbb1-8dcd-8d2b-44d934adf966@gmail.com>
Date: Tue, 5 May 2020 09:37:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505053517.GA4964@pcleri>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 05/05/2020 08:35, Richard Leitner wrote:
> My fix covered only openjdk-8 and not icedtea7-native. I've overlooked
> that somehow ;-)
> 
> Therefore it would be great if you can provide a patch to the
> mailinglist for fixing the issue.
> 
> Thanks for your patience!

Stay tuned. I am currently busy, but I hope I will be able to send out 
my proposed patch this or next week.

I assume something similar might be needed for gcc-10 as well.

> 
> regards;rl
> 

Regards,

Robert
