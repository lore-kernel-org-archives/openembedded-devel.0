Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5131CCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 12:49:57 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.5269.1761742190026114139
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 05:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FXf197Uw;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47109187c32so39777315e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 05:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761742188; x=1762346988; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WT/whZXrELp2tNUqF1jz0MBOB3ta2Rgqca1EUNVJ9qM=;
        b=FXf197Uwu+TPAwoawaITcEylYuVNq6haod0wucynxhz/dSfoGikalNyLj0kS/t7XZw
         WDZ+sbxH7g66gH2p5HohADZrFMUawySTZJbv/AaxriPQC7PAJUAHHBKDfNEmNkgV7nOc
         I2juDQWFlzcdIaU8mpmHcGYmwKCtuHf8cfP5PdTJQiLYaDAGnVgzyZxqaEv0gZZEJc8q
         +rarcgvAcnagXRC1LUpwhDfx80Odz7yYS6ZKRe9Y8EcSUk6v7HMCNj3LmxNDRE3N9tA7
         wHUyocALRwQ+1r0QOTqdhYk5lPYw+FaDb4o6BTvelyyaizlnO8um4An3A1UbwSdk1JI8
         fITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761742188; x=1762346988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WT/whZXrELp2tNUqF1jz0MBOB3ta2Rgqca1EUNVJ9qM=;
        b=TzxIm4tVLNWUWHnxp7sUcbXkdfvlVy3vD4tjbd8o7IVKwU9MQq3cZzEyoGAe+4IaKF
         Of2kSrtbA7QPmMnncp773l9S/APlBYMH6AkWBc7Hu8Tp9n8ZN6fTKHlkY6GAwCHkM85M
         jNT5JZkfD+SAAeuL7ePtv4oXoMQKs3s7nJv6A1eQ120GjfggEWq5JxIKzhKvt1RGX9RG
         TiA0VWOEClMEvn/UUf8sZb9WMCQpjUWRsg2VrRbt5luJ+K8XeZyEhEGAWKh+h+PTaNhc
         4cfGSnDD+fYrHthkxi8cWvZZVz019m0YoTpc42X19uMGSQ9tMCoqBiRerWmyrwwWM4tl
         GAaA==
X-Forwarded-Encrypted: i=1; AJvYcCWtIHpob2ymasEXiiKMZb1mObhgv3uJwh8iNRgQ99IuBykx+XW5cmgRYkVuljpuuXRSSiXNEv6lFdfSjZai6eXedT0=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy1N08fFvNWAqJ22lyScikbza8nNN5y/CnbRccQm8jmtu/dIi+w
	+MODMxAmwg6A4/YWlGvIBZ86A1GmyimBIk2iLQn0j/Q8Myarjm/7yRu7
X-Gm-Gg: ASbGncs9JrtczagFCAIooUagKvIKnmQDkAg5N6T/RA2rNMQqMrS7gzgwH6okoVE5zaz
	t6yusjt3dp4PUY2PZiNDI/qzjn0SUJURq4IuSNmO/DtOdtbwB5xUJjJrbVm1+xgyDrl/pFxAVL1
	BY9fuXy3JJrUo+TsZoS5CpZeFblxBreDvMB5xOUCt4d+Mqiv12n752AMqY7Kd7ZEeBTSWHsxwaY
	BABx60uEOzj2Mzy0taSHEv2QksfBz7iRslw8ZbYL85ecI7fg3v9IheAxNlPPSGGbiPEzMhXBP1H
	zCt0FpQs+XiH/jL9tE6gQwBPtrZVJjTj/lBoNR26gf0fQLBVq8uFPu4Kt7XQesMlRJ/cFg2g2GW
	2UAoUCDPzGNvraQ5ByKS8kGdX2l01h39sxZHF7tkz44v301mdwzY8nF9u/hZfrHfjpGVVpQIvbV
	jmHBhdQ1S2
X-Google-Smtp-Source: AGHT+IHntCoISrY2pYgr0uvo60MUsf3g2hvz36G7IHbxo0ddd3iO3I2sIAZf0sNuBzXt6iJ/PWH7Yw==
X-Received: by 2002:a05:600c:4589:b0:477:19af:31ad with SMTP id 5b1f17b1804b1-4771e38c1b7mr24606275e9.1.1761742188186;
        Wed, 29 Oct 2025 05:49:48 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3b7cb9sm55972495e9.15.2025.10.29.05.49.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 05:49:47 -0700 (PDT)
Message-ID: <741aa353-6af2-42bf-8982-b8ba62206352@gmail.com>
Date: Wed, 29 Oct 2025 13:49:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [scarthgap][PATCH v2] imagemagick: adds ptest for
 imagemagick recipe
To: emailaddress.ashish@gmail.com, openembedded-devel@lists.openembedded.org
References: <20251028102830.3329011-1-ashishkumar.mishra@bmwtechworks.in>
 <9606.1761741031220377891@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <9606.1761741031220377891@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 12:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121151

On 10/29/25 13:30, Ashish Mishra via lists.openembedded.org wrote:
> Dear Team ,
> Please do let me know if any suggestion on this .
> I will work on the implementation accordingly and share the patch.

There would be 2 notes, about technicalities:
1. Don't forget to include the target layer in the subject of your patch
message (meta-oe, meta-gnome etc...) - there are some who look for
patches by these tags.
2. All patches that are applicable for master branch should go to master
branch first, and to stable branch second. That way the improvement will
be present in later versions too.

>  
> Thanks ,
> Ashish Kumar Mishra
>

