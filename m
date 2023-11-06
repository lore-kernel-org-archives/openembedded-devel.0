Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5730FC4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:29:49 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.50724.1699266587612277333
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 02:29:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=Tlf/wQxc;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-32deb2809daso2576518f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 02:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1699266586; x=1699871386; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZUuMv6r1W2O1GwZ6D53gNXY/1Ipz2cpmL77xzeCRARk=;
        b=Tlf/wQxcrgWwO9MqxBcaw4Yu37Jym/KWvVj2lUdrvx7hZu2tsw8TYTwymm/z0XzFrL
         uiTaUy78ot68LeYIkyuz9I656cOureCg4UsAdKrFq6L7RlplY7DVET+A4f3wAqWmokza
         th1rUnNW+Biqj4gkkRgwtD/anXR+hcJlywQKsuc34I7ry8/tQhIe9B696ARl3S4ABNZY
         rgOBFaIX+Xt1WOTwo7IlJhv1sVJGysFrb0twDss3n+SxuMt90gcTrNu6dpoGzBJvf2Oo
         JxlfzY7t6o/QI8OUaKjD9wWgYTAxw7aNRXriuQfwVHpJAhrsXKTlDuRQsx2Xgfc4q5db
         oFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699266586; x=1699871386;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUuMv6r1W2O1GwZ6D53gNXY/1Ipz2cpmL77xzeCRARk=;
        b=RKOBzmVdOeCn2qWdAxzskhlQ0lUR0kh4pO0zfW8GUp0jB8MmC45XvyQrWtvrtSb43U
         aJlWbOoOEwvPNvAuDGE8m0ydxZxa3u6Dqp6h5GGgkxVaLx+NFVYUbXdFwT8DX2sJ8z1X
         8UiuvGglQgmWbmHjLIHRZVYxdOo4qUUwIK9x5A8YF20k/pp9SjPu+N2ZneWI3YN07qcf
         zC1f3lS9WJGG+aXrPaCjVU90z4NGZbgA93YQuXafZzRe7bwwTSqr0R3johT3g3DEbUvk
         tNmieCbU//cpByht77vEuljjRtHXqhyew5gnGezcslnaZfMDfVmO7ikwWpz5EkZkGEJD
         YsQg==
X-Gm-Message-State: AOJu0YwgAZQKapvIrM0isAbPQW5NWyIDaheqm9cp5yIwCXQIPhOCPAnn
	7iJ1/hEIVTuC1hKW09E3ToO2Ig==
X-Google-Smtp-Source: AGHT+IGEYP3kFbU2BXJ8l/rI/nlsjaWmQXGc2w1563WPi1nlGEZAwRGbZ7i0rZz4/7Ii0lAT1EQRZA==
X-Received: by 2002:a5d:6789:0:b0:32f:ace2:15ac with SMTP id v9-20020a5d6789000000b0032face215acmr7596896wru.59.1699266585675;
        Mon, 06 Nov 2023 02:29:45 -0800 (PST)
Received: from [192.168.0.23] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id f1-20020a056000128100b0032d88e370basm9021465wrx.34.2023.11.06.02.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 02:29:45 -0800 (PST)
Message-ID: <25a84986-1752-41ab-bfce-cbbf48012c43@smile.fr>
Date: Mon, 6 Nov 2023 11:29:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-gnome][PATCH 2/2] libchamplain: Upgrade 0.12.20 ->
 0.12.21
Content-Language: en-US
To: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
References: <20231106102411.58424-1-f_l_k@t-online.de>
 <20231106102411.58424-2-f_l_k@t-online.de>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20231106102411.58424-2-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 10:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106409

Hi Markus,

Le 06/11/2023 à 11:24, Markus Volk a écrit :
> - switch to soup3
> - build vapi
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../{libchamplain_0.12.20.bb => libchamplain_0.12.21.bb}    | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-gnome/recipes-gnome/libchamplain/{libchamplain_0.12.20.bb => libchamplain_0.12.21.bb} (61%)


I see you send a lot of meta-oe upgrade patches (Thanks!)

Just by curiosity, do you use the auto upgrade helper (AUH) output to do this?

Regards,

-- 
Yoann Congal
Smile ECS - Tech Expert

