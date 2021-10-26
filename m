Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD232C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 18:04:35 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web09.295.1635271474587611038
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 11:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EZgPDmeK;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id 187so209817pfc.10
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 11:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2gkE/6YSkV55laGbA9aPRRLrOMAJpMjJBkdz+fBItUI=;
        b=EZgPDmeKKEwbw3TAm+QT2LZUdE4swbhJG2ZbgT/Om7GPxj5or0qRDZeS1NFtLmOX5b
         ZHbpjUSfcnpSGM7omfR/r5bw6yXXqCVYRJ7e/fE3ihdoN0r4YhVLGOgjG4ZPSw2nlu4D
         GW4xgW0h5Gccn1kwy+99L6UmpoNM79AB0220zogAFtD8CuycDr2d+JcG7FaveppW2Jsh
         mz9OamYlN7XzzN9oK+1saxPHTVTM8/831ZnCutbS4dsqzSWiVHAU5XhJVcHF3UJ7OByF
         vfVNr9yMbVYkbZ/EGaJHe63fht+/MeNL7fi/AQ96fnjhLS4u07ipNZi2b2tuB/E3o9FT
         GrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2gkE/6YSkV55laGbA9aPRRLrOMAJpMjJBkdz+fBItUI=;
        b=3EUb+74fKwrSwrp0zCwOmyoIZTnphg3tF3Cd4EEvaSGbzC1wLbIHbnk+wZxniAQkFv
         kiycv550NL23EEq7pksFOxDJAy+2jgFXzCmlYwB7+h5jwNvOxznUaDNUMI6pXvMqBuwi
         W364X7xL+1gjJRUylm3b/yG5T8g56tnMpvGkaa+yG8lUK2YwLhVEZfPP0XrYC+Xm3wJK
         5GuukkHhpGwsxFa9t63tpjuklY9gEdLMQaqlfxvyXPjFlwuiYXfoup+g8hxnVsFfzXYB
         dKwz3bNnv6GFLjx1ihuntFwKbq9haIsEWT71CJ0iXx5Gk2rFPvaMI9Pon/ECNK7iFqEW
         pVnw==
X-Gm-Message-State: AOAM533/Z1NC++xEBt+eortWZ9LrRMZyRfWV9vd2slmlw/0Pu9T+XYxN
	tgm1OR/NZJt10oy6s5Xp8/Jn5TeVK+Yv+gKvAzE=
X-Google-Smtp-Source: 
 ABdhPJwVVo1j0lcLVOrHgkavhpIXdySYXSqpngjyOcHDkKetF98r5YywIeZDjlV3dVzTp8rR9xpwLtUBMjtw5KvySvA=
X-Received: by 2002:a05:6a00:23d3:b0:44c:a67f:49af with SMTP id
 g19-20020a056a0023d300b0044ca67f49afmr27262459pfc.50.1635271474024; Tue, 26
 Oct 2021 11:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211026173936.3020832-1-raj.khem@gmail.com>
In-Reply-To: <20211026173936.3020832-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 26 Oct 2021 20:04:21 +0200
Message-ID: 
 <CALbNGRRogP8M9AFa68gZRzeVKDMUFQ0m9VjPcRuxh7fLbA=NuQ@mail.gmail.com>
Subject: Re: [meta-gnome][PATCH v2] gimp: Disable vector icons on mips/rv32
 using clang
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 18:04:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93606

On Tue, Oct 26, 2021 at 7:39 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> The infamous segfaults are back when building with clang
Haven't looked into this but last time it was a race. So my fix has
broken or did never work 100%.

Just to remember: I don't think this is related to clang or target: It
is sporadic. So either be prepared to add more here or disable vector
for all and hope gimp 3 comes soon - they use a different build system
then.

Cheers,

Andreas

