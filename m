Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B3BC4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 15:05:41 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.56867.1699283139226681727
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 07:05:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=OsEkc+eH;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40850b244beso35238255e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 07:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1699283137; x=1699887937; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AGxcxvwuYjgaMyG5wFLKTzMFErA1FK/KpvitbDmvudg=;
        b=OsEkc+eHKAb0ToYDx8OTxhTE9y96DZNn7W5vxD+qcgyoUYBhfonceRRltyorDN5Lug
         Dz3vxdFKoEsHBdtDBM3b999c0DOM7hKz4Ga+v1px9Btg2akSaDhiguYMGe3L3w1zwzDz
         jmfMJJMIyo8/BwZeuJ0PRrGdQ732/8c1PzuLVJvSRaKKk1GNk7QXAcVow1JTrlhfkSL0
         +eIxC3IOU7cU2hmPiE9jU2TgTCnee+VxlgnShCmPuIaXuu7oILcj28ZCyWuryJhGqrUM
         A0vWvIhl7OA7aU83R2ipgatzgV90ymmWFoy0YgTjIPwooIz99KzAoRGKoCKX2XrDfU0Q
         lUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699283137; x=1699887937;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGxcxvwuYjgaMyG5wFLKTzMFErA1FK/KpvitbDmvudg=;
        b=gN5vGV0V8rC2J8jMLZGIHFMYm9t+ZZ72ESi6/cYg1LQfxdXF/1KHK49fJfviOmQkfP
         MHr8ZEW+y1aiLDWZwDwKuoKD8pyAt8TVeOAP4KPyTIViZsPlXGMFBVd4zxEXss6KPKat
         vwsmG/R95vKMiv9SU8avtl6f8i0g8exQpWrDnAsgAHdGk/to20g4UFX6EvYA+gb2Vix9
         oOLYx35QXk1ThqeRvQ5Yjvg45gUgBw+qF1lTBp9jKnV+QsYm+M6LdMQKgQ4ysMec2DY6
         VKZ1/8YB3p8rX1M2D1ZtfRVebWV5QRdL50dPNowt8Zb/4i6oM6VqSjFJ5jk7G8Mge/Sq
         8pkA==
X-Gm-Message-State: AOJu0YxJJwyma/AvY92Cn3An38fOZv90Rj83lA3hXav9tABCGGfEM3Df
	TcGkk4irZgsoyeyYXXFcVsEm2g==
X-Google-Smtp-Source: AGHT+IHCEayAQLZ7KxCu/nUzkOXfCSpKlNilqctnaYqvnVci1o7s326tPlmLTnSUFkuZgwDjXVkNEw==
X-Received: by 2002:a05:600c:4f89:b0:408:fc62:f825 with SMTP id n9-20020a05600c4f8900b00408fc62f825mr26141776wmq.21.1699283137343;
        Mon, 06 Nov 2023 07:05:37 -0800 (PST)
Received: from [192.168.0.23] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c470900b003feea62440bsm12361436wmo.43.2023.11.06.07.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 07:05:37 -0800 (PST)
Message-ID: <ad58afbe-072e-4350-ac4e-87b5078b93fc@smile.fr>
Date: Mon, 6 Nov 2023 16:05:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-gnome][PATCH 2/2] libchamplain: Upgrade 0.12.20 ->
 0.12.21
Content-Language: en-US
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
References: <20231106102411.58424-1-f_l_k@t-online.de>
 <20231106102411.58424-2-f_l_k@t-online.de>
 <25a84986-1752-41ab-bfce-cbbf48012c43@smile.fr>
 <N67P3S.FPIQZBXVEJXA1@t-online.de>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <N67P3S.FPIQZBXVEJXA1@t-online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 15:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106415

Le 06/11/2023 à 11:44, Markus Volk a écrit :
> On Mon, Nov 6 2023 at 11:29:44 AM +01:00:00, Yoann Congal <yoann.congal@smile.fr> wrote:
>> Just by curiosity, do you use the auto upgrade helper (AUH) output to do this?
> 
> Hi Yoann,
> I'm not doing automated updates because I always want to have a look at the NEWS file and possible changes in the buildsystem . Usually I also verify that updates don't break runtime for me before sending them out.
> But I found the AUHupdate report quite useful to see what needs to be done.

Yes, unattended upgrade does not seem realistic...
Glad to see the AUH used :-)

Thanks!
-- 
Yoann Congal
Smile ECS - Tech Expert

