Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.1720.1588274838967055561
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2020 12:27:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QyIXjKrN;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: robert.berger.oe.devel@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id o27so3216199wra.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2020 12:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6k/o3yRc0C3M4RGDiB3E+QXR/FK5MWIRocnE0NKXpzM=;
        b=QyIXjKrN+ZbiwbJckgZmYrVBJT0Q2WgniiADktDRrLuLxL2zg/qs2lotmOJHXgDPwu
         xS2aY3ZL6BJWDwfTdRxA5mm/nDloYsCr3XWBglxSDop96PydwGRi8XpG88uhOYpARBdO
         lrcEhy5xPkejYV0xjO11+84krRXq01i9DO9OGzhEWFQwptcbr+5Bf0zO1keVmb1EK+0j
         WRiODEHBmOFWdwgFA0Qh7FdGbeno2qLJUGHqsbG5WOHLdWfS5Foy3p1xmzX+dZpx/Yk/
         AirhHOFbgR+3QmylV96UCQnugcslM8w0HYJmIqA04T4vNLyAK3aaZRKlXxTPfjM5C2v8
         IiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6k/o3yRc0C3M4RGDiB3E+QXR/FK5MWIRocnE0NKXpzM=;
        b=OcxK2rko7vaAHeIMifJGISEt5pwLJeEEMtdsyp1oLkWAF8aQnVOHkE5rEoovl1OFVA
         hTnpGnIQ/I64Q4EfV7tgdvyR2MKRYafgFNtcpMWn0KbMcG2BLxtvgUiEVmoxsdSCwm+O
         kHfWo/7Hnr+6tiUEQL8wrjWrqSWltJ/n51Rf7uSON60PrFO1o+ozb+1hCHvzzoDJ8j6V
         89E5ILdybzK7qEb4tek8Ug2Xec0JExHtOur8o1Sj63LJ9AOV9pj1/9rPciXnOPUeK2nW
         nz/5nFOOjtE5VByLwz551h5sYji/5YTWSsmkywTxIkC1b2y1h3B0spqz5oFsEJybZm0B
         /VWA==
X-Gm-Message-State: AGi0PuYzDPC42oLeEweKyP60JUlt5FAG9uBTeJFNCOfidIx2ZHL8anH5
	WrtJR92jyfQh38sUTRioD70pbyqo
X-Google-Smtp-Source: APiQypKOi5GqgFBaMndXIAUDX11rLGl970Qcm8kAuQLZrdnXhrtg1XKgTB9dOrUdNqnc470Ee7nLyQ==
X-Received: by 2002:adf:ab18:: with SMTP id q24mr119812wrc.214.1588274834974;
        Thu, 30 Apr 2020 12:27:14 -0700 (PDT)
Return-Path: <robert.berger.oe.devel@gmail.com>
Received: from [192.168.42.52] (ppp-94-65-43-120.home.otenet.gr. [94.65.43.120])
        by smtp.gmail.com with ESMTPSA id o3sm996207wru.68.2020.04.30.12.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 12:27:14 -0700 (PDT)
Subject: Re: [meta-java] host gcc-9, icetea-7 gcc-9 but how older gcc versions?
To: Robert Berger <oecore.mailinglist@gmail.com>,
 Richard Leitner <richard.leitner@skidata.com>
Cc: openembedded-devel@lists.openembedded.org
References: <7946cd8c-4a94-5e5a-7bdc-64963af21006@gmail.com>
 <20200429100259.GA249641@pcleri>
 <92bb1785-280d-ba90-9366-e2a7793d36d5@gmail.com>
 <20200429130233.GB249641@pcleri>
 <1550debd-8a7f-9a1a-0e12-9566b69405b4@gmail.com>
From: "Robert Berger" <robert.berger.oe.devel@gmail.com>
Message-ID: <cbc9dc58-61a7-8133-698c-6570f85f85f6@gmail.com>
Date: Thu, 30 Apr 2020 22:27:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1550debd-8a7f-9a1a-0e12-9566b69405b4@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

I started to have a look into the icetea-native issue again and hope I 
will be able to come up with some patch, which fixes it host-gcc dependent.

The idea is to use a hacked version of this[1] and add it to [2].

Like this I should be able to retrieve the host gcc version dynamically 
and be able to add and remove CFLAGS e.g. depending on the major version 
of the host gcc.

Regards,

Robert

[1] 
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/lib/oe/utils.py?h=dunfell#n377

[2] 
http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/tree/classes/openjdk-build-helper.bbclass?h=g0hl1n/jdk8-fix
