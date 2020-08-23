Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.180940.1598212109006204652
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2020 12:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VNDrTR9h;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: robert.berger.oe.devel@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id s20so1390661wmj.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2020 12:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/mvWgMX9Uq75gHG5P8S48YD3zNaJ92U3pvpowN7yruI=;
        b=VNDrTR9hRThNCjABWcm73QiV1JcRkCUpyFvn6ym1rbrddZcTSOxqnAdicUPp2ChZrF
         LeEnbeYi+e5uG0eLdr703lXvZG5XL3te8smW6lXZCVoa8ZoOtJGvKUoBYlgXriQ/+38A
         3eK4zBKXFUXjdGyIjn3p8izn5hgbmscAQOuksIgX9PS22M8bjJfEcXbBW3MvO4hVMh+5
         sCmsuF++07pqTOyNmr4Zktxdgp9vFr9X1p8eNToY0Aq793UFINHgk5o9hie7Z48evz93
         Ok+sFCB8XTKbWqDqsKQ4GW28x8FCV9uGcnt+LmouKEwdUfOTyFL2AiknH7thMynNl+15
         rVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/mvWgMX9Uq75gHG5P8S48YD3zNaJ92U3pvpowN7yruI=;
        b=FJ9/W9vqc+Zmdj5NSYndfUq57uBvb/Ze32mAmvlt++GtwesByEr8uVZhO0isdxVw7j
         sL/voZ1pY8xYJZt13byDF6Ybk1/yf4zkfsTdg/sbxi7yz9ngVEtmG+lIsxPeZpM6Lxkq
         5z5yRCJ3n6jlT+sEDrcNFHjXCVBy6mzCUiFUM8x8S/4FRIherqbnAHfVOHMjISwCSiTj
         HRLIt71JA1Keoma9QAeGmhWWgAhY3lAOnlXAuaoiP1ZHAGBHJUblY5bGcABEmvZ9Z3ld
         dr2Ot79u5hDXu+wAUbUpAECygxUWnmDe/nQBEOKy2vULmWYXd8jJ7EW0vAHMkPlZmSZD
         yZsA==
X-Gm-Message-State: AOAM531JHE8EKpDLrbLo+tjerYM+LRSaCxhHX7pn02bqyuqbIiHYMqT2
	ZSP/L+Vr8HJpEUzpokTio0MYD/Ev7bk=
X-Google-Smtp-Source: ABdhPJyB5s8SUuxFXwYHc5E8XldIHXTKfOPwTTKSrf8SWxStjmyeYBARbcjSg1SnQYNtVEetYkjkXg==
X-Received: by 2002:a1c:e288:: with SMTP id z130mr2619908wmg.32.1598212106998;
        Sun, 23 Aug 2020 12:48:26 -0700 (PDT)
Return-Path: <robert.berger.oe.devel@gmail.com>
Received: from [192.168.42.52] (ppp-2-86-237-227.home.otenet.gr. [2.86.237.227])
        by smtp.gmail.com with ESMTPSA id h13sm17922132wrx.17.2020.08.23.12.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2020 12:48:26 -0700 (PDT)
Subject: Re: [oe] [PATCH] openjdk-8: Convert do_unpack postfunc to _append
To: =?UTF-8?Q?Jonatan_P=c3=a5lsson?= <jonatan.p@gmail.com>
Cc: Richard Leitner <richard.leitner@skidata.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <16285DBF18FAF8F7.27500@lists.openembedded.org>
 <CAKm+giMq=wbHhLn4WDM0xfnv4J2GJEQYfUzKts3vJukgBm2cYw@mail.gmail.com>
 <20200820101218.GC51054@pcleri>
 <CAKm+giO7SSxDfhXR2-=VGe+O_gyH3Zwoar+FwdyZ_iMC4cZ7aQ@mail.gmail.com>
From: "Robert Berger" <robert.berger.oe.devel@gmail.com>
Message-ID: <089cbef0-2017-d58f-94e4-55d2aae9a98c@gmail.com>
Date: Sun, 23 Aug 2020 22:48:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKm+giO7SSxDfhXR2-=VGe+O_gyH3Zwoar+FwdyZ_iMC4cZ7aQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Jonatan,

I am the author of this patch[1] which I guess fixes your issue as well. 
I didn't check yet if it's happy with the new functionality of the 
archiver class in dunfell.

[1] 
http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/commit/?h=master-next&id=b8e62679d99f57a5af4f2c59ac36bea5c7087d4f

You use do_unpack_append() while I use do_patch_prepend(). Otherwise 
it's pretty much the same.

Do you see any reason why do_unpack_append() might be preferable over 
do_patch_prepend()?

Regards,

Robert



