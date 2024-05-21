Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7047C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 19:49:09 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.5358.1716319991167820421
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 12:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=djGjRq+b;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: fntoth@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a59cc765c29so26938066b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 12:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716319989; x=1716924789; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ts4ZJeXIxKGbDwMLw7IQvI4i34Rksk5UiKVvWSaVprc=;
        b=djGjRq+bVMWeFvsGT9zKkimVIGNxdiKwF48Mf5uSsm3Tk0E+6REs1V1FJbjHlNNX+c
         ivUjxrVvRmTwxu6nZAZNrh8Kaw98HpW9Twfied/fd1aByGaJ8JKZdba1qlZRLEOuOYnd
         NhkeG4QjGcocqhw7ivI3mAgJ+GDUzfQxH949ONDspCmODWL83g01e6/TUpUABURjerBG
         bbl1gJ+zFfF8c0P5el7R/oF7DYcqfAKjrMspSKpEuUZj94Vd2CrnY/ayAVNE9bztUb8R
         0R17VjhnyK9JxF46/kHVn28j6Zn3mxdwvSN4u8V98FZkdECvwhT1jSD5BJK21sXme1c9
         VJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716319989; x=1716924789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ts4ZJeXIxKGbDwMLw7IQvI4i34Rksk5UiKVvWSaVprc=;
        b=mitgypeA2WqLc8+uWz/Xqalb30Mm6zK3MkewBE6ATY3y3L/p3njw1tQln5+Py7Z7z/
         7Qyg2IOqaLVTMdSs/P94hAH/cjhwLHc95DzltHZKJ5Pr9vuOpX6qxE/vR3mDdx2IfJjC
         dYqXh/jPTiP5ruSmTeC/mnVIS1bxHARm8mwd52yPPaL6zSaX4U2YshwrIkb9zSO2i7TP
         jC505i+d6YLyCYvxz/uVAVJuiLIEcbpBuLSDgSXF6TGUvkri7ZAaZF9YKpKMa0BZQTk6
         TuVKkPAAelb7Pmv8jOJdgkmMRZvDDMJPJot7LTzLtwRLZmme5RCVnPBEFveeqRKAEcII
         MSng==
X-Gm-Message-State: AOJu0YxEwg3j9K2F3IpHzJKM0VueaeKjV19mT4xAmsNN97nPg3W0r05d
	374xeYxQoCqXAic6cCMjCZPsHwrv0HyZoPZr90J4vwuqr8yTjYX/
X-Google-Smtp-Source: AGHT+IHR0sOScReCaBf/GarIw6ELu7wra/sFi8noQEKbAY87lKHYe9kXqu9TC6q06d7pdcVBbTF8mQ==
X-Received: by 2002:a17:907:9449:b0:a59:bdb7:73f5 with SMTP id a640c23a62f3a-a5a2d6668camr2610514766b.52.1716319989219;
        Tue, 21 May 2024 12:33:09 -0700 (PDT)
Received: from ?IPV6:2a02:a466:68ed:1:4f75:c4c5:7b77:e5d8? (2a02-a466-68ed-1-4f75-c4c5-7b77-e5d8.fixed6.kpn.net. [2a02:a466:68ed:1:4f75:c4c5:7b77:e5d8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d4b2sm1635279066b.27.2024.05.21.12.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 12:33:08 -0700 (PDT)
Message-ID: <db7616fd-ae00-4f88-80c0-35e063f400f7@gmail.com>
Date: Tue, 21 May 2024 21:33:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] nodejs-oe-cache: fix offline install of dependencies
To: Geoff Parker <geoffhp@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
 akuster808 <akuster808@gmail.com>
References: <CAMKF1so10fduO3FksorrkVw6wUGNLWXqZM5gjf1ucEkZvNbdbg@mail.gmail.com>
 <25272.1715583428346104272@lists.openembedded.org>
 <CAMKF1sqtpdSbdNKGsvsJOd2q7xRs6UoU1rCfHUYVUbTjK2Bhow@mail.gmail.com>
 <CAHNuFG+VTPkL3zqaMh8a46atjC21GcgQgJ7GTix9BNsMzm88rA@mail.gmail.com>
From: "Ferry Toth" <fntoth@gmail.com>
In-Reply-To: <CAHNuFG+VTPkL3zqaMh8a46atjC21GcgQgJ7GTix9BNsMzm88rA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 19:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110475

Hi,

Op 14-05-2024 om 19:39 schreef Geoff Parker:
> Thanks Khem for the link to openembedded-contrib and information on
> how scarthgap updates
> are staged. However,  I'm not seeing the nodejs-os-cache commit in the
> stable/scarthgap-nut
> branch which is needed to fix nodejs builds on scarthgap also. Are
> recent fixes in
> meta-openembedded master backported also?
> 
> cc: Armin
> 
> On Mon, May 13, 2024 at 9:48 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Sun, May 12, 2024 at 11:57 PM Geoff Parker via
>> lists.openembedded.org <geoffhp=gmail.com@lists.openembedded.org>
>> wrote:
>>>
>>> When is the expected next update to the scarthgap branch? I've watched the patch move from  master-next  to  master, but there does not seem to be a visible scarthgap-next branch to watch.

Indeed

>> Usually there is a monthly release update to stable branches that
>> Armin queues up in contrib repo e.g.
>>
>> https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/scarthgap-nut

Not there yet

>> eventually when this branch is gone through some level of testing, it
>> is proposed to upstream
>> branch via scarthgap-next in main repo.

I am guessing this patch is badly needed to get many nodejs modules to 
build.

Tested-by: Ferry Toth <fntoth@gmail.com> [scarthgap, nodejs-module-libiio]

>>>
>>>
>>>
>>>
>>> 
>>>


