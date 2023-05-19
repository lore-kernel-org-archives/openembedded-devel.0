Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376EAC77B73
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 00:10:45 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.7990.1684455035746490109
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 May 2023 17:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=SKvVKuWQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3941c3ba27dso194988b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 17:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684455035; x=1687047035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkELzmIm6EnQ0wJpvQYGAuLbd/92eQ8+HTCOmPDVyxs=;
        b=SKvVKuWQO9UVd6z2OqH5DkFxDB5dzWgPs+TKtEa/YMXsB3SIT2lB8BgmNrRFRnaG76
         x8tnYlNrj8BNbGApgV75/SRNlghoBqWWTFKQN7kDI0iBR4OdHhO5aJRWYuzAm+nGtUaZ
         +bOQ92aCiB7DWDIh/9pEs3gbZLnUDC9IrNN1aoPPiqCMw1PRej62ynvuk/sIkR+1PTL4
         K3VYcO/4CR2sNdTi+9IMNSgLAF+u99T0s/Myy2jpZjaPaZ4PcOhx1GkWcIiKwbrr4zG6
         oS2TrXpbbtK8lMiVW4DvICiWKK6SML3pMN/1pwxbnpfHDoGumHl208WIYjhPRXJHUYFT
         lKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684455035; x=1687047035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dkELzmIm6EnQ0wJpvQYGAuLbd/92eQ8+HTCOmPDVyxs=;
        b=BWC41YG2n0y8H7V9nF7VSpV6iPbmlhQbpnfszQinyo5qEiTysZbCgHD6UepahaWyRm
         KRQO2OAqmuHPpFD1wZA+ou70Q2scwJ7yjeLYvnRUrjqWDFMFPS3FLufMuC1Ziq/yKutn
         NQd0Zq+WtNDSlgRemxd5hJ39RT6AMbm6UB33T8gWmdZTrZCnyADzLc/YDBsmLNH9iMAV
         /3Upp67b/IP8RE3z2nu3VH8ny8GVtIiQg7mQdATAV7jyGMwxF4/XjMqipQisCCER2yW1
         57ZQmoJXseXUQ2JzG8dIYf1AWTz9rZMKPHssP6JWT6mlVrGMh+XZKW/V3LXnopsOPfQL
         +mow==
X-Gm-Message-State: AC+VfDw7QEAEPTMwI6JDaxByzJ7HkMB2oukpRtOGGTzu8JIjTFqq2eFi
	q4B/LFKX8bS9cJzlyhqMBUyIxN3lmTvcCOY110eTwWnr
X-Google-Smtp-Source: ACHHUZ4ew4pV+HT84cov6hZk9scRmI25pwC5yAOxFTuy/+7GF50deL4ssBdwBtSn8SVkRZqtY3ix6yEhN61MP+yCKx0=
X-Received: by 2002:aca:c1d6:0:b0:392:246d:def8 with SMTP id
 r205-20020acac1d6000000b00392246ddef8mr1904218oif.15.1684455034807; Thu, 18
 May 2023 17:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230518204107.11647-1-alexander@amelkin.msk.ru> <27030.1684442805942276634@lists.openembedded.org>
In-Reply-To: <27030.1684442805942276634@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 May 2023 17:10:08 -0700
Message-ID: <CAMKF1sqb8dVmxyoMT4cQTc9XVTtf1PpKin5Dmx=6u_oVRAFOGA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ipmitool: Update links
To: Alexander Amelkin <alexander@amelkin.msk.ru>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 00:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102667

it still doesn't work. Maybe send a github PR

On Thu, May 18, 2023 at 1:46=E2=80=AFPM Alexander Amelkin
<alexander@amelkin.msk.ru> wrote:
>
> This last one one has been directly send by `git format-patch` and `git s=
end-email`, without any modification.
> Please tell me if it works for you.
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102666): https://lists.openembedded.org/g/openembedde=
d-devel/message/102666
> Mute This Topic: https://lists.openembedded.org/mt/98903374/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

