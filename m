Return-Path: <alb3rt0.m3rciai@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D3E7C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 12:58:57 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.11011.1744981128379822080
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 05:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cbejTVCV;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alb3rt0.m3rciai@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so2904902a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 05:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744981127; x=1745585927; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KxfBZGREBeFJF1QQ0Rbrqpz+x4ZRZBk5bAK1kJ6YVhw=;
        b=cbejTVCVW4YFGA2B8caHoPXerfU701W3sWa2tENePhNBpgyVH4NY8AETr2ol3CzwjQ
         AbK1jNavQyujZumT8KZenHsSl+weWBAwt7a1NxN9iUge9ENLbMT7jurQUoegqvrjnVK7
         KsKrghiijED+NBB5eYZYY/sHn89f2tw4t6bxAUh2J058riO+VT/eOqls6uwQtpDj3lh+
         6bthuDzzDuLKVnXTyHqPs3O726dMbJbKffNK27BgbJtqJAMJGjNlscgsKmX8Yefkya9E
         wfibDAv7y2D+bJt3wkgJ28fPGkRxPSyxY8J9MR7rbpwiEMAVL+4C9G9cwjPDGcC9PMm+
         MEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744981127; x=1745585927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxfBZGREBeFJF1QQ0Rbrqpz+x4ZRZBk5bAK1kJ6YVhw=;
        b=d4Swnpp9pbuumdHLCDu2d6FeCVX37q3t7StEPv/MobtTD9aTkHrZV9Z7ST2iT6ksM0
         7FDR/M6+vk4Kxw76qs+TRC7ihCB8nG40HJGXwboWsJSWeH+X9LcvE+HyTe18ZsvyhSKq
         lXaampmxXyNdWRyNIUo4LAIddSXwt/3hSwP++F9bJ4f5lEQEWQWr2CDqK8hd2TGItuRZ
         /EQ7Ig8pszTf0p2PDSUzNsTaPa3++c/xaGJcdFH/jYCAAuiv+NuRsoQFBtQSg3D8urgY
         9VdFfnqOXYpSK38t5hXT2W6udkJaSRfKK0IHGue7kFUghxOzMDkCmxH4CvuLqJVi/xJg
         Jh6A==
X-Forwarded-Encrypted: i=1; AJvYcCWAvtAdSEZF8x9KGa69FVy8xlAkL1R+JCIAOiiq8EKnqfqHfYouBEssgguOF/9g6wNbAg3iPq/k5Dyy9KnxdDiA1H0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyK6V484F8esTV46/BhNvTCtdI7Ly77miGqQOYBp6IFHx7pNah3
	SK3OzQzCqMU69bytMGfWZCkaLbBb/c5NV3EA+9y8n4NIpTPJuvCb
X-Gm-Gg: ASbGncuQcCZAA8AO3oi/3cfQk8XkEf6bOCPuzmmD37CbeYRw7j0mZ1pJOhvEhE01Hen
	vGk8ElWWUM5iDfuMI3zQruOucEfIV502e1/k0KW354Gfjjv+wHfVFd5/hFUSWldZZZK7IGr2zoy
	uxln55b22Uvdk9/kmQnscsg9BAomqXKhPWIMtpdTX1Wyc7XQNwC541xB+cAMLiHA/euEmtX3Z9J
	G0k0hDHbbA28jaz96y8TVdyEJjwEOxG/Jxg0VwD0I4rFH+KCMnVtx+104m8MKZJ0y2s1HoCEgyW
	lNJzeHCxPutYXICshOwJ8Ow49FH6Y3fSv1TrXdhefYYcTSkA0YxApzj1DenFRfZ2twY4doYlbz6
	XjawXRZMdkbfGwcQDuNqudXTMSJCQ7lb6+qooQf0Wyr+j
X-Google-Smtp-Source: AGHT+IEF9Ep+uDCvvvPHdMYSfkZFEr9Q3hsuVUcyw2os/dGiosxDWcXjKyASkHX2/IFhOC6eoe4U7Q==
X-Received: by 2002:a05:6402:3547:b0:5e5:e836:71f3 with SMTP id 4fb4d7f45d1cf-5f6285ebe82mr1608624a12.29.1744981126602;
        Fri, 18 Apr 2025 05:58:46 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-87-1-132-66.retail.telecomitalia.it. [87.1.132.66])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f6258342fbsm967243a12.49.2025.04.18.05.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:58:45 -0700 (PDT)
Date: Fri, 18 Apr 2025 14:58:42 +0200
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Jeroen Hofstee <jhofstee@victronenergy.com>
Cc: akuster808@gmail.com, openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][scarthgap] can-utils: Upgrade 2023.03 -> 2025.01
Message-ID: <aAJMgtMTzrAcKl1q@alb3rt0-ThinkPad-P15-Gen-1>
References: <aAISd7n7umT8UHQ9@alb3rt0-ThinkPad-P15-Gen-1>
 <4e0908d4-2ace-4f30-b1c0-4af5393b55d5@victronenergy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e0908d4-2ace-4f30-b1c0-4af5393b55d5@victronenergy.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 12:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116968

On Fri, Apr 18, 2025 at 01:52:47PM +0200, Jeroen Hofstee wrote:

Hello Jeroen,

> Hello Alberto,
> 
> On 4/18/25 10:51, Alberto Merciai via lists.openembedded.org wrote:
> > Hello,
> > 
> > I notice that master already include can-utils_2025.01 however scarthgap
> > is not.
> > 
> > Is there any specific reason why we don't update to can-utils_2025.01 in
> > scarthgap branch?
> > 
> > I found that using 2023.03 on scarthgap the following command will always show the
> > same msec:
> > candump -tA can0
> > due to that cast:
> > https://github.com/linux-can/can-utils/blob/cfe41963f3425e9adb01a70cfaddedf5e5982720/candump.c#L237
> > 
> > Let me know, If not I can share you changes for that.
> 
> Below patch should fix the timestamps.
> 
> https://github.com/victronenergy/meta-openembedded/commit/46106ae5ce38a35cffa86c68a862c05dc1273397

Thanks for that

> 
> I can send it, if needed.

I don't know which is the approach we want to use there.

I propose 2025.01 update to scarthgap branch however seems to be safer
to patch it keeping 2023.03, what do you think?

What we notice is that for kernel 6.6.x candump has this regression that
was not inside 5.10.

Regards,
Alberto

