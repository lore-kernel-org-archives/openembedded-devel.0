Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE1EC433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 17:42:34 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.196.1643132553618695910
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 09:42:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Jag/tX5x;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id 71so9416047qkf.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 09:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3cD4h02sPe8rYYg0EPL2YoHU780uUAIi1DZRkC5AO7w=;
        b=Jag/tX5xwMGgtVc1T5zlT7GBwjY4bG36zNy1TLRkB6nxEEjt7Xr5arZV/bVbv+Zuep
         JEh20692yHhSkzUkQ9AyBqBFHu7K3hULqfDoqtihRsT8vYMGJzqLAKIZJm1RuViPJHPu
         6vF/0pbeXLghc0fY3iwqqB8/2E2yDyFRRw2NEH3UWCFBjvVibhwkAt6DmunqaEvedbQO
         mJYaU5U+HgCTM3YiGDVFLK4au6tfmeXEn/HGjwkkOenZ9HZcy1vc3mdMsgsC7YjLo2+b
         pyzQlcEASt00Ndgv1ArSFvMf/B6Shn1jwtjpiaoip0dgSYj/CcfxFQ5CHhm2Yv84rCdq
         JGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3cD4h02sPe8rYYg0EPL2YoHU780uUAIi1DZRkC5AO7w=;
        b=LXIYbevEdqdT2kp8U9I2NS+4CoTyZbSLmeUhBjwraoHMqxxBmO8YcDwfCDGDM3FAt1
         Y70OQ6+xWeT77Vy37zfOr3dwDVjXIL78dF3TKHlvU+Fmm4BrUFF7UV/6lcfVBoztXsla
         atCK+PNc+t+devSpmyTzN6bkvBKtga4WgwbaEmlO2iii+CzEFcd4N6EEmgmvKeGzQEsT
         VsyQ/5KIkwoIh/Zv35sBstX4esDPM66VCVirqwZ8g5pAfCOj+/2mirSRjmdIWqeioWGV
         NHBTOXd98Ks9E0PbMcd6CSF5z7tHbfmEwb2m2BYluHjsn8wM6953dj9d6uwAlVbGu8Ns
         kd2Q==
X-Gm-Message-State: AOAM530OiW9nZ0Byo5FysaQq9Vt5BTAPhLfPC3D0mzJWgmywFjtE8+43
	99QQC9SwXsFQKZqEb7G+wsKcOTWivOs3qDgt9qQ=
X-Google-Smtp-Source: 
 ABdhPJwwho/7HeJpleTmSW9kfSs7lUfPWvvGSI0UDhTM4RB43zonXsL8KegqOOPDMxha7zZq090Wd7P8G9/nMuZFSH4=
X-Received: by 2002:a37:5541:: with SMTP id
 j62mr15138003qkb.180.1643132552502;
 Tue, 25 Jan 2022 09:42:32 -0800 (PST)
MIME-Version: 1.0
References: <20220125062503.19073-1-f_l_k@t-online.de>
 <04bbefe7-9181-e639-2fda-f5ef3075b770@gmail.com>
 <e60579ea-3442-c494-0b06-ecda7998072b@t-online.de>
In-Reply-To: <e60579ea-3442-c494-0b06-ecda7998072b@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Jan 2022 09:42:06 -0800
Message-ID: 
 <CAMKF1soiodtJ5oWpVYbTQ-t-AWXUeaZ3jjDP3dmqBa6nZpcqLg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] folks: disable tests; fix dependencies
To: Markus Volk <f_l_k@t-online.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 17:42:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95081

On Tue, Jan 25, 2022 at 9:41 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> but wouldn't it still fail if DISTRO_FEATURE ptest is available until
> python3-dbusmock-native could be built?

yes. But we will get that in oe-core soon

>
> Am 25.01.22 um 18:21 schrieb Khem Raj:
> > this could also be a packageconfig, which is enabled when ptest is in
> > DISTRO_FEATURE
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95080): https://lists.openembedded.org/g/openembedded-devel/message/95080
> Mute This Topic: https://lists.openembedded.org/mt/88666737/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

