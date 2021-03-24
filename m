Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.299.1616600832994437333
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 08:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T+F3LkC8;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id m11so475877pfc.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 08:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7phmlaOi4Gx1BOcwvlrtKSFtgTg7/z1tn7CVk2+hRes=;
        b=T+F3LkC8NrgpISAL/l0wTe8oDrmBEpxGbcmoCH7UBdlAa6gN/jVTyj56CcVwaoEXzf
         h3m36gvSxrEC9GnS8xQ2iTg+KkrCk2bL4JuSZ72oG0rNj397H6NFtHw5wBc09nbHDLPL
         FmjR+zFfuKrUHT8slWchd7VlXdB8IniFX544PGleRPnGv7wEjQ5phgjBGj+iAFRFV0DT
         umZFJmXAvtpll0LejtZnaDodfmtbXGwA6CptPYlqMQhLkqOm3OSZMNFOMJIiylAhEk1d
         BImlyyd3X7yVZd/sy6UtfYXl1nipf3TKIiNeUjKyppr6YNP2zg5bN2BryjCMc6PVS1F3
         k8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=7phmlaOi4Gx1BOcwvlrtKSFtgTg7/z1tn7CVk2+hRes=;
        b=niEdnn2WJGAn7zySSt+QABAnDk356cYvSuDABt6EAJSJhi0ktgUqg4t4z2EkiWv0qu
         4urxPGJeKbIEv08QLCneXttrpSuaoROBG2CsvJqn7vKfUTTLxBot/0bjrcsYTZ1/mNcC
         jHtvSnY1C4IEIzoVunH0ApvCOKLyRKl7CBUDLnRgHJVW/cH5iuY/OgjESjKiNqWCKgDD
         c7dyk6PZciHQYEYaHq/yip/9a1dMbNnbGgAjxxA9d1QNHnk3uOU+8w1AEtOzZfuvU0nz
         bVrL45Zkmf21Lzjq7zb4bEOn0REa7+ZrCjps6ho90rIyLCwribnk+8KHmif8UJsksyiP
         TQ5A==
X-Gm-Message-State: AOAM532gAr93a22Vqg/EFJB8l8agyaARir0Kfjeu8TURzqF8SM8LO5y+
	zJxf9yeQpjIfOmGLKNTbG7F2kphSnqqLTA==
X-Google-Smtp-Source: ABdhPJxAWVu71wYynua7+GMhjm1qQRhRnL6pOt4oqqCYPYScMjzEW8oBZWBjAxZF/rrah4697UGlvg==
X-Received: by 2002:aa7:956d:0:b029:1f1:5ba6:2a58 with SMTP id x13-20020aa7956d0000b02901f15ba62a58mr3820142pfq.63.1616600832086;
        Wed, 24 Mar 2021 08:47:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::e7f0? ([2601:646:9200:a0f0::e7f0])
        by smtp.gmail.com with ESMTPSA id h13sm2815243pjv.52.2021.03.24.08.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 08:47:11 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH] abseil-cpp: Relax build requirements
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Anatol Belski <anbelski@linux.microsoft.com>,
 openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20210219125845.29016-1-anbelski@linux.microsoft.com>
 <166670501E1BA6E4.11921@lists.openembedded.org>
 <CA+chaQeNoPZANexNTBE2EdWBQyiV+pGvsMrEO5HQrT0g3ena+g@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <a0d78d2c-1abb-b6cc-3abd-6f00be404457@gmail.com>
Date: Wed, 24 Mar 2021 08:47:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQeNoPZANexNTBE2EdWBQyiV+pGvsMrEO5HQrT0g3ena+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/24/21 5:13 AM, Martin Jansa wrote:
> On Tue, Feb 23, 2021 at 6:23 PM Martin Jansa via lists.openembedded.org 
> <http://lists.openembedded.org> 
> <Martin.Jansa=gmail.com@lists.openembedded.org 
> <mailto:gmail.com@lists.openembedded.org>> wrote:
> 
>     You should remove abseil-cpp from the _remove in the packagegroup as
>     well, see:
> 
>     meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb:RDEPENDS_packagegroup-meta-oe-devtools_remove_aarch64
>     = "${@bb.utils.contains("TUNE_FEATURES", "crypto", "", "abseil-cpp",
>     d)} concurrencykit"
>     meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb:RDEPENDS_packagegroup-meta-oe-devtools_remove_x86-64
>     = "${@bb.utils.contains("TUNE_FEATURES", "corei7", "", "abseil-cpp",
>     d)}"
> 
>     Please send follow-up patch.
> 
> 
> Still no follow-up patch, I'll send it myself.
> 

Thanks Martin

> 
> 
> 
