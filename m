Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA532C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 11:09:29 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.13094.1738235363703615963
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 03:09:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sz0/W7CD;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43618283d48so4691655e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 03:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738235362; x=1738840162; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OoPHYJ9ztzdzg2ss+dwzq0dmgN7bUnn9X8LxMhYsGgQ=;
        b=Sz0/W7CD6q2bk5C4sQTh3N7TdxaA8FmaxohUmW8jdQMDLgjkEkvZXxt1jECdZalYsR
         ZSbxxP8CQ2d7gnwo8y/y8Q0hTxeVlzz1LOH6zZbbCse3p2jYIt4tnEfEXr2eGoZkiDP5
         Sf4E9hSLD8QeXM+AstdcXGWP1aWYQW4dgTrtg/OGMHgWd+jYcIoI+ozVDTwAYxIjfr2J
         BHXuGa2K/ajVNT1oTO5uC6KQ1aOkASKAP8Z3rwJBwedoqN4RsifIkvXswnrFrN0UNjHy
         HwzIdNNDcLHYJscrka5oMciRjUKvhrwoaDLkG0qsgJASQRNmbcXHkzCbWFeinHuqQQG1
         E5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738235362; x=1738840162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OoPHYJ9ztzdzg2ss+dwzq0dmgN7bUnn9X8LxMhYsGgQ=;
        b=cZQhARtlZXhdxTS4bdYEWzC/ZWaRLSG0Xke3CcKMtoj5/BzaMiBl+UdyxkaZrVLRHP
         5ffQP8shrwl1Lml234ISrESQAD0rEMumiEDtmM/6UtzyaaNTi5vbwnFLFY4cqV7fLNPe
         n1pJFhAX8knJvAOHippAOkRuWYu6+n2n3fFmN5FjLBz4UHi0TU1fsaw0LA+uqAHtUBCU
         U8o2BclzzDpck1afrdHVu43mNYj76+UjFm6FkvJbdD88g9l/nWc6aInoHNi1FMmsht9a
         u1LF8S3U22nTbfa+hpIx6R3QRuAzmDwQh88s2ldJKBZ3etqUWCjynCFxviozwVKc0wzE
         qHxA==
X-Gm-Message-State: AOJu0YyvRLnlrerlxmxCjZ239bT15X+91gqbEQArkuG1PGsbinez/T8r
	c73XN4QAA2ln+J+Y/s0x+FevTQmvRNXGBTXqMgbFL1w3kMs2gy/aLh87Cg==
X-Gm-Gg: ASbGnctog5ibT7dGN4sG17ZDnpKF7JB5lMn7jOja/tCNFLmfz2oottSOrKTsVRYPx1P
	IbkisS9IZrnoqm+ZfEErSjDwME0xiG//GRl1NZsZ0qPM+9eclC/Wv0oyhp8ec8NmSgT6s73+MrP
	ILSfP3onUdvw58VE/kRge8vO8f8o3p2RugH6cTvPAYDStLBQjDAK2suvk1I410rTkZScPUMb8la
	LmPP115yVU23u1xSd/BQ+grGClI4Ph9wmkjFPQittiekaC8cURJVTk3PUrzxhvRfdv/yBfRrRZ5
	86+nf1zqD5YOIyAKzR9/2zk=
X-Google-Smtp-Source: AGHT+IHSQON1l05gE/12URKo1KQ6EaabLcMD3aZ8CwcESIPsnG11oKLa4wdfJ5Stp5eqUOMYWFGuDw==
X-Received: by 2002:a5d:648b:0:b0:385:fc97:9c63 with SMTP id ffacd0b85a97d-38c51930c8dmr4764923f8f.9.1738235361478;
        Thu, 30 Jan 2025 03:09:21 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b595asm1653072f8f.66.2025.01.30.03.09.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 03:09:21 -0800 (PST)
Message-ID: <714ff79d-329b-4da9-ac74-2b3cf6891eab@gmail.com>
Date: Thu, 30 Jan 2025 12:09:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] can-utils: RRECOMMENDS only ip from iproute2
To: openembedded-devel@lists.openembedded.org
References: <20250130071432.2946804-1-sean@geanix.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250130071432.2946804-1-sean@geanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 11:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115151

>   # busybox ip fails to configure can interfaces, so we need iproute2 to do so.
>   # See details in http://www.armadeus.com/wiki/index.php?title=CAN_bus_Linux_driver.
> -RRECOMMENDS:${PN} += "iproute2"
> +RRECOMMENDS:${PN} += "iproute2-ip"
I wonder if the comment is still true with oe-core master. One of the 
features[1] that made their way to Busybox 1.37 is CAN support for the 
"ip" command. (Unfortunately have no CAN hw at my hand to try , so I 
just keep wondering)

[1]: 
https://git.busybox.net/busybox/commit/?h=1_37_stable&id=f873c63085e3f3745040286999779077ccc03987

