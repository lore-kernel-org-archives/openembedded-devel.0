Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE23C433F5
	for <webhook@archiver.kernel.org>; Sat, 22 Jan 2022 21:14:45 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.1770.1642886085016333370
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Jan 2022 13:14:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ocbm/Q9j;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 s2-20020a17090ad48200b001b501977b23so11838653pju.2
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Jan 2022 13:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ftQTPGrWR6btanrMJYAiP+85HqD1xdXbKYwZVET6dSI=;
        b=Ocbm/Q9jjv1+6EalETqMk13zcPlPcADyZdqlm1c4ExUuumk8apKhyh8sNCuEGBz/re
         nLzBcth/Ahc6Vb5y1qJM12QXCZiS8sWlcXEy/57M8+Bl5MAZYEY2gbllw2rULmHZ93Jr
         Zt0cfkZAKqy4OSNqJ/M+sKCAJOW8L4k3JGxZRzgjEyKgDOw4uFnkAv0s/4iP95DM2MRU
         6QwTu5fJRqM8AbhuNylMTg1nFkgcZnHEnjAKDAOYshXZJSR8hbHIZohlXJgES7UeGuEK
         wxnaKU13iY+D+XEQ+hbvyqsuib39T10X7ZVFAftkM03nFxgcVwwl0c3h8cRsyu2laZmo
         MerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ftQTPGrWR6btanrMJYAiP+85HqD1xdXbKYwZVET6dSI=;
        b=43cO3SZEjXWe/8ePWjAiXTfEzw/8w3ZjvlzUtzzlHEmAmcxtxD3tsOcmusF1+3r4I4
         ES1HF59nK4LE6ArCltdQq5ZxjzzlZI2QOqw1DHyu5dj4soGDo7Pn+6f/EOpQpbnfWU05
         dDVT9s6Sw29KF9LDqc60F5guqJJD7WIQa4iaWYOEMFanHx+8tvmEc7i/bZ46y2XsQAwd
         mSkjvVVd9Ub91SRO655CKrYFeVmoyya/3xvoCA4pmIFW3YwUudB7yUZQOcrtHhlrXY5y
         xRH8bVP07Acg5N4QPMlyKJxgzQndwBvYM7aDxwlvkTEUGJtVFFliDZ6V2RQyvrd00T9C
         SG1A==
X-Gm-Message-State: AOAM531i1OUmwULJEHZNt0Tje95bNTMmnYulcM7JEJm4vHMz3RrPT3wu
	6QgqXHJhEeuHz1ij3zd5vLcDZv/AoFW1lg4wF6k=
X-Google-Smtp-Source: 
 ABdhPJxbZiYieKvBDxVXlSPL72vEPinpTiC0GF2LcnmipnArEmXqiaMPCmKfHtkb100jOp9TTBdDinMN3uvc8Vz8OcY=
X-Received: by 2002:a17:902:d505:b0:14b:ce9:800e with SMTP id
 b5-20020a170902d50500b0014b0ce9800emr8659500plg.1.1642886084489; Sat, 22 Jan
 2022 13:14:44 -0800 (PST)
MIME-Version: 1.0
References: <20220120202643.3827177-1-f_l_k@t-online.de>
In-Reply-To: <20220120202643.3827177-1-f_l_k@t-online.de>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 22 Jan 2022 22:14:31 +0100
Message-ID: 
 <CALbNGRTuhn_6dUdf=Q8b9kGThgSJ+BuDhvCYbs25PSPBDt5VNg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 1/2] geary: initial add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Jan 2022 21:14:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95006

On Sat, Jan 22, 2022 at 8:29 PM Markus Volk <f_l_k@t-online.de> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../recipes-connectivity/geary/geary_40.0.bb  | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 meta-gnome/recipes-connectivity/geary/geary_40.0.bb
>
This is on my TODO for so long - did not find the time. Thanks!

Andreas

