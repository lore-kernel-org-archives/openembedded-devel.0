Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.2984.1627934712395768157
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Aug 2021 13:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OZlllSbx;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id q2so20942199plr.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Aug 2021 13:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=P/U065vKyI8ubiROxu2WyrCl99/aOE6F3rE0pLEnSvA=;
        b=OZlllSbxgXi+pPCqgRLXWKF5kpKcU8p+2TjKuZluZoL/ta63N3OLlaMvANIC30W2H3
         U8L2Nq3fRrXJH7AkXSK3f1jeDEiaeH+oc9CU//rYBrwi7sD3/Hi6mGIBYkSkxpBD94eU
         ElbbzVIT/T55ud09sI3ZDxPv4ugyb2XCYMAIL2agnCrGXwY1rPpiuk1hX/MfNucc0ltb
         tg3+sZpOrKRob8oc62V3CL1PjYibYK+3USW3idwWRHEf66uwPMsKJDaoOnUnc8U0u3aN
         ggA32xtTkary73010qVJ9MsSalFxWHhWpSnIqdUTcF6/k1m8o78awDqp3No46qnVdh8k
         zA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=P/U065vKyI8ubiROxu2WyrCl99/aOE6F3rE0pLEnSvA=;
        b=bSZs0E6MzSOmShQWPvl6TWm4WX+45GPKMLnLvL/qDo8OtPE2v9q1ddw5dkqsk/tO5l
         PpscAyaWDqN9nOF634/k22uzCpsuUoMRNB48xyyLggpBUQD4BAzSMjGDRxSwx+Ow/dm4
         zYNnLE4/A4Q5jV0UDRR3LldVeepSRnaWgE6K8PJAfVCs7N9LowJ/Es1aQXTOwwUQzqn3
         HmolRdl1XV9DG5xtk3NAyx2ENPaVt15HxxqGQdE4ctbqHq2VgcDcieraGI28l2nvP/O3
         fFGe67dEGXBFY9JfC3eik7CiwL4hzSJNvkUqrw5xvxlY1XdWfs8S0GP1t8r+wKD8Vuyh
         ygjQ==
X-Gm-Message-State: AOAM533KnlslgfQUg8BmsF3AwgawQeEn0I29iPiVtISi+0orYhtXgoBh
	Uo1/GOH2d3VlVEreCTogrvyqx2mNT/Iupg==
X-Google-Smtp-Source: ABdhPJxaMFvngiaAgH22YucF7J2T2q6CH0C3jHVsq+S4BMlho58p47QXwPc3dcWLvA4KX2ZN1AFd3Q==
X-Received: by 2002:a05:6a00:2150:b029:399:711c:826f with SMTP id o16-20020a056a002150b0290399711c826fmr18196774pfk.14.1627934711680;
        Mon, 02 Aug 2021 13:05:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:61bd:9658:157a:c74c? ([2601:646:9200:a0f0:61bd:9658:157a:c74c])
        by smtp.gmail.com with ESMTPSA id 37sm14223263pgt.28.2021.08.02.13.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Aug 2021 13:05:11 -0700 (PDT)
Subject: Re: [oe] Any way to make cryptsetup smaller? I have a small 32M NOR flash and 11M SquashFS rootfs.
To: Brian Hutchinson <b.hutchman@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <CAFZh4h8HhO5EMV8k4y6a8pMFOMO9Wv68zAO+Zy6KJSEUFePRFw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <6c1da27d-dc2b-7a32-ad5d-cade68a796f8@gmail.com>
Date: Mon, 2 Aug 2021 13:05:10 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAFZh4h8HhO5EMV8k4y6a8pMFOMO9Wv68zAO+Zy6KJSEUFePRFw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 8/2/21 11:07 AM, Brian Hutchinson wrote:
> Hi,
> 
> I have a 32M NOR that I boot from and it uses a 11M SquashFS rootfs made 
> from core-image-minimal.  I'd like to add cryptsetup but doing so blows 
> my SquashFS up to 35M.
> 
> I've looked at the recipe and package config and I see things like 
> --enable-static and other settings that look doubtful that I can build 
> cryptsetup package and get it to fit my size constraints.
> 
> All I'm wanting to do is encrypt a filesytem and mount it as ext4.
> 

Can you list all the direct/indirect dependencies that cryptsetup is 
bringing in ? perhaps buildhistory will be handy to get that information

> Regards,
> 
> Brian
> 
> 
> 
> 
