Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C1BC433FE
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 16:12:48 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.1427.1652285566510710399
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 09:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NaIF3IHP;
 spf=pass (domain: gmail.com, ip: 209.85.222.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id 185so2627860qke.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 09:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nEcVwTCQggN+BLqd+XV9gE+xPmEHhthR7OWTuBCGoH8=;
        b=NaIF3IHPm5iZKuOqeh5AjsGcMxRgNKO1xOUYiiacjZ2gUQ0CwX3VZGbzZtQwCu4UbX
         CgJiSp04fjOYhvF4VRt5/+Eo0APkyxngSfZuRdSeu96l9zTekHhNRcO0chTVePkUuib1
         8gVyw7uop/ZNlO4ALpFMdSyRupWYq7s1UBZnxytp+Z7z3tKZ8U8Oh6DPl0YItymJV8Ht
         tKik23lexa3J6IRqvok255D3GAf8TQvseNxa/h1By/NrZe4zQjGZO4queJLNVvICN6Ht
         6SURowaEcaKsVIaoOU68QXdbswtCpvYTTNsHePv260dntv/Lh6DwOy3IclcqAiuz8OJc
         aCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nEcVwTCQggN+BLqd+XV9gE+xPmEHhthR7OWTuBCGoH8=;
        b=rtkcg4vko8n7sq5dMWOiPMpKBreJY2L8l1caxuqEs6Iz1IfidqdaAaNK11Oe0dRie2
         3GXPnlIrB0eirTdZhXsnGYO+oNnS5ypdJY9rSSD223YecI+VCrNA2/yEC1n29yMXiGZJ
         QP/Dz/XqsiQ0JJQGHopZW8T91W4V/HpSaVuIFgaBicp3EeqMlCCByu5md6dhVncuTrun
         y+fQtw70khm2BUBx6rE5Eg7CTYpdu8+aC079f5d9oW6dFUtbSgkjD7zTCuLj7k7e8aXg
         HPe1qOXi+loXmVz/T2lxJfXr7fE974sJs8dOp9ftRvJ9T4giDZQSK6uvdG8weIOJdw6S
         tCpg==
X-Gm-Message-State: AOAM531enCOsR46Fyjidrv43JlVcHr+6dmK2ghMli+C5bNs3sFYPbLZ1
	qlaRCOgHkAZXqyCzulOo+VFG5gA+KhLi/KnbY1A=
X-Google-Smtp-Source: 
 ABdhPJzlxSFUczSl1FHLsr1S1yPkqgeSbqL5cMF9bKM3f0q8Dx3BlSCAdDvRZulqxizREcXJaPwG25MNJQ8b6qCRy0U=
X-Received: by 2002:a05:620a:44d0:b0:6a0:3f5a:d810 with SMTP id
 y16-20020a05620a44d000b006a03f5ad810mr20071004qkp.72.1652285565451; Wed, 11
 May 2022 09:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220511160154.1351-1-lravindran@linux.microsoft.com>
 <28886.1652285044429729902@lists.openembedded.org>
In-Reply-To: <28886.1652285044429729902@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 May 2022 09:12:19 -0700
Message-ID: 
 <CAMKF1sqCYZ5rOnuSQPdeuPDbwtjsD5Sf6D_3zVnDCHvp4t1HKg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] Upgrade fluentbit recipe from version 1.3.5
 to 1.9.3
To: Lekshmi Ravindran <lravindran@linux.microsoft.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 May 2022 16:12:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97044

On Wed, May 11, 2022 at 9:04 AM Lekshmi Ravindran
<lravindran@linux.microsoft.com> wrote:
>
> Please note that the previous patch files have been removed for now.  It =
was not clear which all are still relevant and not obsolete in the latest v=
ersion. Kindly reply to this message if any of the removed patches are iden=
tified as must haves, I'll be happy to backport them.
>

We have many combinations that get tested e.g. with systemd w/o
systemd, with usrmerge in DISTRO_FEATURE and without, building with
clang or gcc, using musl or glibc and finally
many target architectures. While I agree we should be using latest
version and perhaps dropping patches which are no longer needed but I
think dropping all of them might be a bit too much
so it would be good to state what combinations have been tested with
this and perhaps we should limit the recipe to just that combination
for now.

> Ideally, any additional patches should be upstreamed to fluentbit project=
 and upgrade the version here so that we can maintain the closest to fluent=
bit project and avoid double maintenance.
>

yes we need help in upstreaming the patches as well.

> Thanks,
> Lekshmi
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97043): https://lists.openembedded.org/g/openembedded=
-devel/message/97043
> Mute This Topic: https://lists.openembedded.org/mt/91039194/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

