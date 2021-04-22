Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.10118.1619084740703886091
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 02:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=XCnvy5VP;
 spf=pass (domain: konsulko.com, ip: 209.85.208.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f48.google.com with SMTP id i3so26970176edt.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 02:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=pgYVlTpI39NDosGL1hECc2IOKmDrCCbhFSGsR8BBX+o=;
        b=XCnvy5VPvY68zBLZbX3owRYrx4/nTEEbXNg9vF8cejvFJSyNWY87okvR63yADQ/54D
         JxxBZqS7v3vocu+DUrrWAiQ1kUBuuQlP0U+POGaeZ88KTExJe0RG0cvYak99h3Iam0OS
         b/IyqaMv+G4euz6xSWT6lrtI5JkHRhDVGpT9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=pgYVlTpI39NDosGL1hECc2IOKmDrCCbhFSGsR8BBX+o=;
        b=EByPfdxmxhckJhA2b+lvcR3LQQhikbEJaxeiBCcyySpvpFSJqJw8k42c3LJUXKHrgY
         yYMK5ySaAzeob1s3yVQ0bVY3prG659qsJ5RGFrIHfCqJFApekqCaXhrctIdaQlNlFXbt
         u9mmIwGYgf/xrhLXAyYUm4vntLP/bFllRIY5vp2mQV2zhpWihSaTfVk5uYM0kjHVJ8yx
         4lJ6Aee4yNJEjZYCq3lyD2bk41ZE8sXx42qCQu6b6w2msyU+uRMkC/Jmc7iLtar3LFvj
         A/XANZ+B4gSkFhLdyiPPwA9Sn6MOcFQD6nLOc2S0EZvPmCW78TQS1O4D0GiDQeDG5JLH
         DfcA==
X-Gm-Message-State: AOAM533q/oY2RM6AB/mkWCXiR+omVe9uHxOJNVGiAKsoDm/+YuNQMsAH
	ojjQJAqE7jg734CrXGfxQSaFsAau/OFZvA==
X-Google-Smtp-Source: ABdhPJwzTirp8iAmiutOa3UwbAki1Pziuvs7CzPupKb4EFiA07AJrLyLsERtOKIaNtGq2BJF/uXBfg==
X-Received: by 2002:a05:6402:138f:: with SMTP id b15mr2702576edv.121.1619084738688;
        Thu, 22 Apr 2021 02:45:38 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from [192.168.4.166] ([78.130.197.211])
        by smtp.gmail.com with ESMTPSA id f20sm1478051ejw.36.2021.04.22.02.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 02:45:38 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-argcomplete: Upgrade 1.12.2 -> 1.12.3
To: "zangrc.fnst@fujitsu.com" <zangrc.fnst@fujitsu.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20210421075843.17725-1-leon.anavi@konsulko.com>
 <20210421075843.17725-2-leon.anavi@konsulko.com>
 <TYCPR01MB6448F875405FF6ABEE92272CF5469@TYCPR01MB6448.jpnprd01.prod.outlook.com>
From: "Leon Anavi" <leon.anavi@konsulko.com>
Message-ID: <939a9817-3dc3-b769-768c-d0864fc67930@konsulko.com>
Date: Thu, 22 Apr 2021 12:45:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <TYCPR01MB6448F875405FF6ABEE92272CF5469@TYCPR01MB6448.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi,

On 22.04.21 §Ô. 8:49, zangrc.fnst@fujitsu.com wrote:
> Hello, this update needs to add RDEPENDS of python3-io.

Thank you. My bad. I've just fixed the patch and submitted it again as v2.

Thanks,
Leon

-- 
Leon Anavi
Software Engineer
konsulko.com

