Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E611C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 14:45:41 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.11547.1646318740581935589
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 06:45:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K+qlonHe;
 spf=pass (domain: gmail.com, ip: 209.85.216.44,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so5025670pjl.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 06:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4iMcA6gD0rq7aWB9f+XQgFfwRLy0yA88czPM24dRwjs=;
        b=K+qlonHekgVEPupA1HpjekSoE2f7xGtKJWH+5LO8KjwypVDksIfLNRCd5RlIoWeeX0
         /YS3uyyHXL/RO2vrW1DYmkyUyo7LVDIyOSMXozG1irM6p0Db4DYpPyHAZPkG4j2/BDCo
         z6UckuhsAM9IQ8ThFo+YBTRkhckkLADk0L+d1HDxLwkosNnyai0NvK/s5d4ViBso0YAW
         ULRFhlPrzk0X+zA8cLvBWO/MZ0MP5mzvZ+K0NcQOX7Nde0mG2dmT555CZAAt24qkae1Q
         +y6dk1x87d6kGyhpCgFb5U+lIDeHPp9R28/2I979vtkOBDV4b4RFxnM5DyfSdI/6sBM1
         f9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4iMcA6gD0rq7aWB9f+XQgFfwRLy0yA88czPM24dRwjs=;
        b=6S7jeMV/h5uH7ZKBu9AVW1DYPJ/A77ZsqyYPjFCZcG4+WDuyAXMofeZmxzAfj6cCRP
         eHVz8nNJ70Zke1lDg2i32fvP1a5eUyLk93n9d1CjiJF1Ju0kuxqL/aG9i0wsPjO0y0Rq
         bdUa3xZ+EyTHm6FaEATatTNiZG2OTz2BfEM9f4FUjnhdkj/5+liYgbGTlZatgCJPdFt7
         V5+BGGnD4z9B+Fz78mo4wnVmhToqh7naPFLLDGVezUNx5ycr2Gh3DQk0arP+j7Pkh4iI
         3xdlv557SNsBs9SCnBfGSBb+7gyKi2CQxrDgNoymIbkdiCwiU3zQdjqbY2qVoYo+nmYU
         Xn/g==
X-Gm-Message-State: AOAM531WvJKBiM8PF7qqDiDZMNB4GyMCo1GCft8po5meT6iJnKBBnqtZ
	Y8rWWt7XKsS9zs6mWmy4vJeasVYKzbpvu55tkGg=
X-Google-Smtp-Source: 
 ABdhPJwPmB3HSR9YD5M0YLlKa2kTKYsv95qfcy1wD4JP/l2fkaaC7598wzu5ZPaH9R1oXQXbTPqXk/Or9d4Y77XELk8=
X-Received: by 2002:a17:902:be0c:b0:14f:d9b3:92a9 with SMTP id
 r12-20020a170902be0c00b0014fd9b392a9mr36073022pls.53.1646318740006; Thu, 03
 Mar 2022 06:45:40 -0800 (PST)
MIME-Version: 1.0
References: <20220303073138.1434568-1-f_l_k@t-online.de>
In-Reply-To: <20220303073138.1434568-1-f_l_k@t-online.de>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 3 Mar 2022 15:45:28 +0100
Message-ID: 
 <CALbNGRTM1_J=rZHXisUj6hJZ1Hamcj8A6NWrAiFxhv47sUrZ7g@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gjs: update; customize dependencies
To: Markus Volk <f_l_k@t-online.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 14:45:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95749

On Thu, Mar 3, 2022 at 8:32 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> gjs seems to be the only gnome recipe to be built against gtk4. Align this to the
> rest of the universe.
What about gnome-shell - or why go backwards?
>
> Update mozjs dependency to mozjs-91 since polkit also builds with it.
Glad to see

Cheers

Andreas

