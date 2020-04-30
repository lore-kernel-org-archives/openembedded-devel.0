Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.9693.1588261431284455269
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2020 08:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gnrnD/j6;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id x18so7529802wrq.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2020 08:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YcutllWi+6eX+aibcUQVkpm02msHK3Dg0pVKP+fGFGA=;
        b=gnrnD/j6XXI+KlmnRNA/Dlv+aHiu2Y2SZ5EqatDYUdt18sge4GB8XWfgzT7dMNDe33
         rKI+yKBibkPK0t3vJ6awjZuQOTr5LEdjaBjf+3Fjtmr4dFCSOQhucZv4t1tJ9CakdlVg
         0smq1N8U98s2OY+/xL0bnZ8LuJ4G101AYxdghgDRSjKG6eE9RH55IqfBmTGpVZIb9r2F
         mp77kBEeGJPSgFSPpfXjxmSXQZvVa9ODaaisx3cMhgPgfI+w0lkjQi6eqT6Te6md+v0x
         l3YAZWiWbLuh1yipjLpb+GyuQwyBcRETjInhEg3a3Ka4nJ8PXToSPMaI7zzWjwcidKY8
         XJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YcutllWi+6eX+aibcUQVkpm02msHK3Dg0pVKP+fGFGA=;
        b=T9G6X1PGkekk7RrGWe8aASe9watKlsZpCQaJdcFLSqhU1sVYn1bna//LtYJ60d/sjU
         Jp3lfiDr1zd4NAmbGp5jOf+1fwL/75pD196VWt+/LghIilAe3Qa7gdLNZAmHBHR0e4u5
         pNLDZe+TkZMjYPDr3zR5l5qzIUMVJ4TdHFE9uuqUeRaVApPMCuizxgOcslhgpKJa5fqu
         log2ODgTNN5L6xTP+KlMpQwradHJn6/me3n2+GmZaNcFvaY3JOzQSU42jnBFZDFnxJC9
         f/lh7Bcogf8ij/Wf5lSQrBg9POO8kpMuMfuHYYDNiFjR5ESzQTIpGwwJYTkw556RTlMR
         QpCQ==
X-Gm-Message-State: AGi0PuZyLniZTs9wz1Vsr2CZIbMSCi8Kj5zBIeYi7FtnHIxPAQrSBXFk
	cJ1MWKehWtiUGxUm9QnpQi6V5DBV
X-Google-Smtp-Source: APiQypJPrTjc4gPTR5gqqxoKOsg1QNRVWETnNNyW+wIX7ScHF6hzAwNi52EjYnYY4v1I7Kryel7WFA==
X-Received: by 2002:a5d:6ccb:: with SMTP id c11mr4729998wrc.416.1588261428459;
        Thu, 30 Apr 2020 08:43:48 -0700 (PDT)
Return-Path: <oecore.mailinglist@gmail.com>
Received: from [192.168.42.52] (ppp-94-65-43-120.home.otenet.gr. [94.65.43.120])
        by smtp.gmail.com with ESMTPSA id 91sm204836wra.37.2020.04.30.08.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 08:43:47 -0700 (PDT)
Subject: Re: [meta-java] host gcc-9, icetea-7 gcc-9 but how older gcc versions?
To: Richard Leitner <richard.leitner@skidata.com>,
 "robert.berger.oe.devel" <robert.berger.oe.devel@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <7946cd8c-4a94-5e5a-7bdc-64963af21006@gmail.com>
 <20200429100259.GA249641@pcleri>
 <92bb1785-280d-ba90-9366-e2a7793d36d5@gmail.com>
 <20200429130233.GB249641@pcleri>
From: "Robert Berger" <oecore.mailinglist@gmail.com>
Message-ID: <1550debd-8a7f-9a1a-0e12-9566b69405b4@gmail.com>
Date: Thu, 30 Apr 2020 18:43:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429130233.GB249641@pcleri>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Is this supposed to work with host gcc 9?

This was the first test I did and it bombed.

I used all upstream unmodified dunfell branches plus your branch.

pokyuser@2f9b1db70cea:/workdir/build$ gcc --version
gcc (Ubuntu 9.2.1-17ubuntu1~16.04) 9.2.1 20191102
Copyright (C) 2019 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

pokyuser@2f9b1db70cea:/workdir/build$

Build Configuration:
BB_VERSION           = "1.46.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "ubuntu-16.04"
TARGET_SYS           = "x86_64-resy-linux"
MACHINE              = "container-x86-64"
DISTRO               = "resy-container"
DISTRO_VERSION       = "3.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta
meta-poky
meta-yocto-bsp       = 
"2020-04-30-dunfell-3.1:5e44568d90cb9148253098f60a6aeb32c0e5cf5f"
meta-resy            = "dunfell:572324800b1a33a30d6eba67ac343cbc67e9737a"
meta-oe
meta-python          = 
"2020-04-30-dunfell-3.1:17fd382f3467e20308924499b7531ae8b789f056"
meta-virtualization  = 
"2020-04-30-dunfell-3.1:e319e746bffc4360229b2c926b8c5c9492ee52a7"
meta-filesystems
meta-networking      = 
"2020-04-30-dunfell-3.1:17fd382f3467e20308924499b7531ae8b789f056"
meta-java            = 
"2020-04-30-g0hl1n/jdk8-fix_local:49b1405f5429a1470f28823d726fcb1b67d3bce3"

...

ERROR: Task 
(/workdir/sources/poky/../meta-java/recipes-core/icedtea/icedtea7-native_2.1.3.bb:do_compile) 
failed with exit code '1'

here is the error:

https://pastebin.com/x4c1Kduw

Regards,

Robert

