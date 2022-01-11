Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5600BC433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 20:49:44 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.13976.1641934183230066117
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 12:49:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=HoD+mYLQ;
 spf=pass (domain: burtonini.com, ip: 209.85.128.52,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f52.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so2215738wmk.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 12:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oVHFtGkg65C4hqq+vdgr+I/fBF8OCdr/h6e30WOzyr4=;
        b=HoD+mYLQxltkuGkS5Xcgv0lgsZ4qtMVqOmO4d4KcqaPd6RXC4is2ZALcLlOTQ3Us+h
         jJrKbrU0guUdN9CPkgOtC0PL/2w6dxnxtPQwgQlTQH0MDkZDvNWQthUVBdwfC3js1dSK
         fj/tL/LuvOhQ7GebXRGvbv09TR5qcnRNVbLaokSH8TDc6HEwZ7tuKOVm7PGJL0rU2BYk
         /k9PmRl9YdjH66dEGJwYAVRzdPqrWBTBJHIYJHzUjDHlE9hdF6JM3g52zUHsFEtBbmKf
         kluIFijMLRiLyx0ZE6KUAw7SMGqUG0EfMFVDDVE2WYiT871ZDqKfQZb4u8JEvv8hgQZi
         XV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oVHFtGkg65C4hqq+vdgr+I/fBF8OCdr/h6e30WOzyr4=;
        b=IM3tXIUTOX2Ar4KDW1c1Jqkisetn1u3+n6LoWmxtp4p/865s6gVMCHMgsGf6Ypyf4G
         5c88nVbLf79KMvwOysJrmKYnq3+pAPcXVsVjpgOKjzgi0CuxRsWM0f9WmzJ135B3vBZy
         bbUQPVlb119bXZyPqAt3V6JPu7Hq8/ZRbYnTQ8kRUQFc+rbKMvAeURakJgl4MV/HYWXM
         jEzKa6uCokhY7IzQftzzkGyY5q1vvLlQyeq8WX1LJBr0/g7N8AABrZ8OyNpWk5RVks+N
         4lgj0Gn9PV+RH7m7xY3a2EAATsch8UUN0D9GzpR69673bTX7harLffNCWrSlzPW6GNpF
         qfxQ==
X-Gm-Message-State: AOAM533FxAXjNQXJS/ndzmxQJT+5TY/DGoZGMbvUf8zuKZDSCHl6iBNk
	7UHozMRYEw61EY5VIbwW++1poM+HkTze8sHivQyWlBaqsUM=
X-Google-Smtp-Source: 
 ABdhPJxGI0rdvGSNlBePOmNprRoaDZ4ZrX3xE/J4KixAjWt/22fTU+H3N+VX+SfXB0ByAX3RBzQ0F9xbJKionK/p3Vk=
X-Received: by 2002:a05:600c:154f:: with SMTP id
 f15mr4073190wmg.62.1641934181534;
 Tue, 11 Jan 2022 12:49:41 -0800 (PST)
MIME-Version: 1.0
References: <20220111202225.1526283-1-raj.khem@gmail.com>
 <20220111202225.1526283-3-raj.khem@gmail.com>
In-Reply-To: <20220111202225.1526283-3-raj.khem@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 11 Jan 2022 20:49:30 +0000
Message-ID: 
 <CAAnfSTtfcUFcy82GvXQZkNfe2fcPqkJ+82yCX5y16gzkHNRbVA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 3/3] influxdb: Enable network during
 do_compile
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jan 2022 20:49:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94760

On Tue, 11 Jan 2022 at 20:22, Khem Raj <raj.khem@gmail.com> wrote:
> +do_compile[network] = "1"

Can you add a comment making it clear in the recipe why this is here
and that it is a short-term measure?

(ditto for the other patches)

Ross

