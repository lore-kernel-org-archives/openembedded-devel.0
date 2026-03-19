Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D36109023B
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 15:13:21 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13508.1773933199510769919
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 08:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NNE+qNpT;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so704278f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 08:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773933198; x=1774537998; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WavG0wsbgpG3gNEL8R8zxCNuDt9OvDW8zvh5S3fAUEs=;
        b=NNE+qNpTsZYwhTPsusza+Rvrf29FW8/IxOsfHZ3WS4e/fVhMf9e3V9WHMid4aE/Req
         KNX+1dj1WY5FqvkiMFiRrAcpUsR10nwpuI+tz4LH8nboxcitH6DdOU9nOjqti+GPVOZu
         KbeNSC/v9OODh5C/inRk8Rz1aTt/DEyaTAK2TbWRYizK76ut+5E6knh1f8xH6KxP4ghY
         YsQydzd5Au1ZWBKJYIoUSc3VBmWQkEpVAfeC0MFPMP0+HaZ8LMoV9fZwsokTJuWh3r52
         Q4dF+HSM+djny0SpJaZjzr6/04xhdDD3338lrZ8CNqOFc9+skIcz3G/u+H1Dr0S2XmZ2
         fMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773933198; x=1774537998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WavG0wsbgpG3gNEL8R8zxCNuDt9OvDW8zvh5S3fAUEs=;
        b=kxbM8Od9lQGQTllYNQkTKqC6tBLoD3SOzxaaMwS37YGDVBS3h/TwjoFbLRSSIeaCZS
         Pr/w+6wqyWN8tlY/WZ1aqzdfN0urzT12KeSHfdLB6hMhH1zkJEZpvF5vOp1IHTy2uwpV
         SbKOr3KkvJraVaXA7n1iv5VKZsFvNui+Y+S9VpyocYGPfOVzjpkMRZdwzk4YkmXBElxW
         4+vLWJqHF8A84FkmjgvynaPSpGDFS+fFZPahVAPqzxifthsJivlte6zCT1lfSq8xqM7Q
         GGuvkx4wPPXbgqrNxE+HB5wTWoFc1bwMRlB+ck3yJf0tm8V7DS8ZdmIztIGfFnUuVmmO
         2CJA==
X-Gm-Message-State: AOJu0YxwzRNNX2dmAvtnIIAR7AUlgVapwoE8MMGj3w1cEZmAjrMB8nCE
	1+HIJtiR0BBHM0L2stNqu3PemQezSM+L9RfhKYvTEDIm1X8kjM39YfC4
X-Gm-Gg: ATEYQzwV7mxKn9tlMznd98adUpRw4isBtJQvpVs3cPutVUbeuqL0fYB7ebo1XtllJyQ
	ZZVVdOmm6l6rAPg98mvfZeZ2KMOH+152vkfYBWcLOuIlvJqGEob87SW9B+qV04AuK67cOaCja0x
	yqN6IckCJmyLWKJMi9NEbxAAryRgANF+DOPXWvege/BctJVPsgmK6nb5sLdgImtbOAmhdoeNzb2
	bUzG1SrHZRpmxot5N0eYWSCcX+Q5OnyyeMCPwy9j7AWXXaYEpzC5UjKjeKcSxPBjfzkceuAooqJ
	n3t7r7UdaH5OazvBgoXUIDHU4uWFwnL7HaJlaFUJ3MYhKWDNuOkO3VzvUqsbmcclDKfaWJJKXWd
	UWKv2fNkXMXREaxtXn7Z5wQXianbrEmzSLRJ+ePSTO/0ALnH/2Q7QOkMDLFfpPEoT/VFigAGzFD
	1cSQLxYj1vn9mQ7T5hmvY/BKMnUcBwkQ4=
X-Received: by 2002:a5d:5f82:0:b0:439:b440:b8b5 with SMTP id ffacd0b85a97d-43b527c7746mr13783515f8f.43.1773933197623;
        Thu, 19 Mar 2026 08:13:17 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51805291sm16852685f8f.0.2026.03.19.08.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 08:13:17 -0700 (PDT)
Message-ID: <ceeeaa49-fa24-4481-ab88-328589ebdd50@gmail.com>
Date: Thu, 19 Mar 2026 16:13:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][PATCH] sysdig: upgrade 0.28.0 -> 0.39.0
To: liuyd.fnst@fujitsu.com, Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20260313032649.4383-1-liuyd.fnst@fujitsu.com>
 <CAMKF1spaPcV+r8EMNrwiJCWhB9-YbG2c6=Vdsztw2vR9-oLLTw@mail.gmail.com>
 <OS7PR01MB144441C4000FF5BABC2824D779B4FA@OS7PR01MB14444.jpnprd01.prod.outlook.com>
 <189E42746E482DF9.1764087@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <189E42746E482DF9.1764087@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 15:13:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125403

On 3/19/26 14:52, Gyorgy Sarvari via lists.openembedded.org wrote:
> On 3/19/26 07:54, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:
>> Hi Khem
>>    There is no build fail on my environment.
>>    I use the default local.conf with target qemux86-64, and oe-core,
>> meta-oe is the latest commit.
>> Build Configuration:
>> BB_VERSION           = "2.16.0"
>> BUILD_SYS            = "x86_64-linux"
>> NATIVELSBSTRING      = "universal"
>> TARGET_SYS           = "x86_64-poky-linux"
>> MACHINE              = "qemux86-64"
>> SDKMACHINE           = "x86_64"
>> DISTRO               = "poky"
>> DISTRO_VERSION       =
>> "5.3.99+snapshot-71c5fd2bbdeb00b4200b3b94627ce43500b6b081"
>> TUNE_FEATURES        = "m64 x86-64-v3"
>> meta                 = "master:71c5fd2bbdeb00b4200b3b94627ce43500b6b081"
>> meta-poky
>> meta-yocto-bsp       = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
>> meta-oe
>> meta-filesystems
>> meta-networking
>> meta-python
>> meta-webserver
>> meta-perl
>> meta-gnome
>> meta-multimedia      = "master:f8936cc03a5d69ea3ea2788309f06903da5eecdd" 
>>
>>    So I want to ensure the difference from AB environment to check the
>> issue further.
>>
> 
> Something doesn't look right with this recipe/application, it seems to
> break out of the sandbox(?)
> 
> I can build it successfully too, without a problem, but look at these
> do_config logs[1] - it not only tries to download things from the
> internet, it even succeeds?!
> The recipe doesn't have network enabled.
> 
> [1]:
> https://gist.github.com/OldManYellsAtCloud/511fdbe5a9c185d98f7e4419b0997d2f
> 
> 
Huhhh... this looks something else. I can access the network in all
steps (and all recipes) when I run it in my usual Docker image (fairly
vanilla Debian12 with Python 3.11, that comes with Debian).

If I run it outside of docker (reasonably up to date EndeavourOS, Python
3.14), it fails with network error as expected.

What setup do you use?

