Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431C7C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 22:57:13 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.556.1634684231816110038
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 15:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bEqyLNX5;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id i1so1457046qtr.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 15:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UG/3FIOAzmnWPn0NLsGmjvze4uqGvszVLbQb6y9Ja98=;
        b=bEqyLNX55sGNu/PDmIpOKJWPNnBQihcn5mDLFc3NZQboOyHyHZWeyqIcoo3XQL8hGh
         NKkV54t9qeOkIOLTn+dNCs684nKzsUc9q8Atkp6YmpagjqvoS1r1teNztjfdupiNXE5A
         GdjJkYTcWASnnBqgQGxWH7HdB4c+WIW/Lrgh3uw7qL+jR49vE526GBKrnT+09OOn7E7W
         Elh49XRdnkOGqAvlOMUv+H1k4ONR7xujP4TzUtM+sj2P4L/ZYqrTHNyYXo3pRx2pYQ26
         UA58lJsKpMAVBa17KOUKiE54Z7rFfbsFXfd76C5hz3HKQoED82esxCq8N4+tat5lW+8C
         7dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UG/3FIOAzmnWPn0NLsGmjvze4uqGvszVLbQb6y9Ja98=;
        b=HnIN+x2DQczkKpTUAiyiB29Ib2TFY/1mPSy7aFN7+CwJpnDvGGggiwn1AXRFziKGTP
         8NPqfmk269CHJQ+M/HHqxdCnJz/1myV14r7XCTMZWqkiuDiNooeat0//BNvO4GVWMh2Y
         /sJ7HArbJrVS6D/myQ0+txZ4IZphQ6d+kScrf9Y6VTdGhuSdnrNXgScl3s4dvodhE0aG
         lgTC6pJwp1dxQf9AYWcij/z/nK+03E0KRXAZG3My60xSea6d8ZH7wDLI6FwR6KEYvjzD
         W3yiMgc5kQN618YQM6NWIUwZixzQjGf/Mvpikc6RuIhaqi3oVms2Lwhi5QfJ7deEzOVV
         Mmjg==
X-Gm-Message-State: AOAM530vxyjsjq1Pff41PMW4GyvnSES8gZNmhrrYtmjebfFJVUj/JUOf
	vbzEvPgsKRq6RUkG0z50XMMcIrQmSFxIdS3CPm8=
X-Google-Smtp-Source: 
 ABdhPJyKGZJ8moH24MG026bpgw0dd+XHma0YvYJ2gnPPU6Loyjs/WknCZcsi/JthBlM+crtubxulZMkss8z6gYtwrGE=
X-Received: by 2002:a05:622a:190e:: with SMTP id
 w14mr3263823qtc.112.1634684230953;
 Tue, 19 Oct 2021 15:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <1a982ca4-a237-d4c7-bc1d-ae3669f3dd0f@gmail.com>
In-Reply-To: <1a982ca4-a237-d4c7-bc1d-ae3669f3dd0f@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Oct 2021 15:56:44 -0700
Message-ID: 
 <CAMKF1sqPtbpNm8zcVeYZQvymGct1V2AYAZTvOA7gkbnNzNRrZg@mail.gmail.com>
Subject: Re: dunfell-next merge request Oct 19th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 22:57:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93473

merged thanks

On Tue, Oct 19, 2021 at 8:21 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 3cf22d15885cf0e3e16078705e9a20f3d21f12db:
>
>   tcpdump: Update CVE-2020-8037 tag (2021-10-01 14:49:10 -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to 814eec96c2a29172da57a425a3609f8b6fcc6afe:
>
>   gattlib: Place pkgconfig file in correct package (2021-10-14 13:57:41
> -0700)
>
> ----------------------------------------------------------------
> Konrad Weihmann (1):
>       gattlib: remove includedir from base package
>
> Richard Purdie (1):
>       gattlib: Place pkgconfig file in correct package
>
>  meta-oe/recipes-connectivity/gattlib/gattlib_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

