Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BD7109025E
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 17:14:43 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1396.1773940482117708836
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 10:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GifCI73A;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso1268115e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773940480; x=1774545280; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ihP/RwKBEKgO3JlnPPlltEmaNvxdTXywkHLryCtltq8=;
        b=GifCI73AwD7uXxjpeRT5Wm9OymPs7GfUzB9BTB+2HmqZPRqiysz9BmNPMOAjqIy7j9
         I0ge9CMsPn0nFqoNxaTAYkwWbFXEQJ78GNbsBe6e6XfyGr9+Ccb9sHYDIVT0mqq6dVLW
         d/vvpquVQpX5+n5+ahNFJnfcPkk/LL47BrRYIUlsJu1puntF9LG00P7Gpb410Lxnb/Cm
         77+3I9puEtQwdAGb8ttJA6XlUc0wrQNuiPLqEZe20L4umx9USgJBKXJsBYA2fXdVvX/+
         i9Lwmgguqg52f0458q4CurqlTV8eln5Ka/iU2azrLUSt74ToQriILI5ad2KULBXNi3Yt
         uAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773940480; x=1774545280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ihP/RwKBEKgO3JlnPPlltEmaNvxdTXywkHLryCtltq8=;
        b=aL94ZYl40UM2oJYknXUhsS34BnFarkfEYJx6tEHP7rO/9DUvxYAK0jUjz+P7n80mDa
         pEnmJIHP9OT2bXm/+PZgZUzU5kzGu2KPWfZSgO+wCqQiWsStMVS4v9qotkV/5Mav56dz
         D5sKCpA61do/GXMIHyCAc00T3M4g76FHXgRgNbC/dEfMkFwTvncU8hBUxzbu12pGLEEq
         wgbH3RLPyb0U0r7ynQeVOm2zUFTQ2PLAY67+GjtZjgKdu6iC4CvBa9qJlf2cEB9N4mmw
         YSGv8K/PMQpBw1UQEUdlrYePotZ43nOiKtBb2IqDgr2xNUvcKaXkuRJwHZKboTmOYVqQ
         7bEw==
X-Gm-Message-State: AOJu0YzfioJIWvjF+2YoIs9Tz/IZYjLT0gvTSeAyW26g0Wk3kkDlbBO1
	uF/TT8APklreOUsbmp/eEIRelJ4Sq0peNfgmSAcwoWAGLeSD5ZlOmNFL
X-Gm-Gg: ATEYQzwFCxN/S9XHRWe9Eecj8FrQDLK8md0AedSa1SuRaxoaaAVR5daK4Ut6ccTNrNS
	CBcXs18wCuPyN+lRGbOUnFenGhGPNhZIPFl5T6OtAfaM2H4mmLwbAFpOEA05YthlLNXkWtZfRTP
	PUKE1+NfnEExqdepRFgiksSyT8fW+Lqzft8xVNYgcVFPZDPSXrV4wDTYd9l49t1WrR075ceKtME
	9nqSbTwyo5CmhHpquq7BBJlfGyuy66FH13FGECG5fgkvOa5Ld8L0Kc2d8EiHZNGF/PJp8Gqj3v/
	LH+baWZ+ks9MVRF5iqZtYHgsdtYAQ+1DZfcAXdrXUhTMjDeC0I/I67fZpL8GgWHfEZ2iCn7c1I5
	cnsq51pRA+LbtMbfCL8tgIK329ikdFMmMGHEQQddlDZKXs07alO+jYmWiAyio7ldVuFKIm1vxO4
	hdofhPWkQyFagfJ0v0zcyXlTfJhJULzNg=
X-Received: by 2002:a05:600c:2d94:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-486fe8c5883mr1210725e9.8.1773940480212;
        Thu, 19 Mar 2026 10:14:40 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4bbfb2csm63517905e9.30.2026.03.19.10.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 10:14:39 -0700 (PDT)
Message-ID: <6e6738a7-086c-42e6-bb45-48adfb389212@gmail.com>
Date: Thu, 19 Mar 2026 18:14:39 +0100
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
 <189E46D8B9992270.2964266@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <189E46D8B9992270.2964266@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 17:14:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125410

On 3/19/26 16:13, Gyorgy Sarvari via lists.openembedded.org wrote:
> On 3/19/26 14:52, Gyorgy Sarvari via lists.openembedded.org wrote:
>> On 3/19/26 07:54, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:
>>> Hi Khem
>>>    There is no build fail on my environment.
>>>    I use the default local.conf with target qemux86-64, and oe-core,
>>> meta-oe is the latest commit.
>>> Build Configuration:
>>> BB_VERSION           = "2.16.0"
>>> BUILD_SYS            = "x86_64-linux"
>>> NATIVELSBSTRING      = "universal"
>>> TARGET_SYS           = "x86_64-poky-linux"
>>> MACHINE              = "qemux86-64"
>>> SDKMACHINE           = "x86_64"
>>> DISTRO               = "poky"
>>> DISTRO_VERSION       =
>>> "5.3.99+snapshot-71c5fd2bbdeb00b4200b3b94627ce43500b6b081"
>>> TUNE_FEATURES        = "m64 x86-64-v3"
>>> meta                 = "master:71c5fd2bbdeb00b4200b3b94627ce43500b6b081"
>>> meta-poky
>>> meta-yocto-bsp       = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
>>> meta-oe
>>> meta-filesystems
>>> meta-networking
>>> meta-python
>>> meta-webserver
>>> meta-perl
>>> meta-gnome
>>> meta-multimedia      = "master:f8936cc03a5d69ea3ea2788309f06903da5eecdd" 
>>>
>>>    So I want to ensure the difference from AB environment to check the
>>> issue further.
>>>
>>
>> Something doesn't look right with this recipe/application, it seems to
>> break out of the sandbox(?)
>>
>> I can build it successfully too, without a problem, but look at these
>> do_config logs[1] - it not only tries to download things from the
>> internet, it even succeeds?!
>> The recipe doesn't have network enabled.
>>
>> [1]:
>> https://gist.github.com/OldManYellsAtCloud/511fdbe5a9c185d98f7e4419b0997d2f
>>
>>
> Huhhh... this looks something else. I can access the network in all
> steps (and all recipes) when I run it in my usual Docker image (fairly
> vanilla Debian12 with Python 3.11, that comes with Debian).
> 
> If I run it outside of docker (reasonably up to date EndeavourOS, Python
> 3.14), it fails with network error as expected.
> 
> What setup do you use?
> 

I had some time to look a bit more - please ignore my last email. Most
probably network-disabling never worked in my Docker image, it requires
some extra permissions which is not always present. Possibly your system
has the same?

