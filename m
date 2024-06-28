Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3183AC2BD09
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 18:32:38 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.3571.1719599551550606470
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jun 2024 11:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KWD3UCY0;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-25d75d35ffdso715539fac.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 11:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719599551; x=1720204351; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORT85Tkz360adg2XC20cHIrY4QE6hIz9zGPD3G9hPbw=;
        b=KWD3UCY0KfdM//FXWHT4GcU30zlWmDfuldSg4bfaRt5Cb/sViyH8RTiT0xebxtUSa4
         2j6xPkvdwVvPHT9uVMDbLGWZxN+VKp4uiJAUCtGsOrrAv4vWdorGbi6XtSb0+ErHx5R3
         zaSUKqhQSBtOYhKASZ1OhN+g5aVtfQSUFXzdna4cgFv/cWGsdgTaKlFKRtfWia1cL/3T
         pp+sAiA5HcsxBJUsu6E6T4HUiYjLOmTpt/KSVKFdROLk9nVERhC5aL8daQ/INq2BU02s
         LcYvH6YBblNQuSrXtkQbpPmb2+yVnp0O/nMWZ7dm4NoQoyuSSoKOFWquf/oL07okCdho
         dazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719599551; x=1720204351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ORT85Tkz360adg2XC20cHIrY4QE6hIz9zGPD3G9hPbw=;
        b=OkJxJ6Ad2QOzIqTDcrhDq6JmjViO5Mh//SaXFtBs3dt3B/Mm5AUAZOOC0NY3l5ZCs2
         m/wWkslhz9/Tn4bOtbS6zfoogMg1R5khBzxJk/YnjC5GtmKGfQmGTnDrJfoD9AH/8YFh
         WN33JA8f29UMttAjwIbGTkvtwMX6HySSWeB2fnv8J9jgTn9RrsjEfJljBnTHSHEZ8Fvw
         CGk2da+YU5fPJnr+A+jUaHzEqJOsCvrg6hmX3uGGJWf6rl4v22JKWtJ0HJq5hOnCMfJ6
         X0/uImc4QvVE/+bv/n0+jdFbNgji6q9jWNFiMrbbIf7KCVskpx4xpQ2xizBJkN0YBBVt
         hnvA==
X-Gm-Message-State: AOJu0YwDQ0G2LHZmmqQ4Q0IvibzasfsnK1A5aAN+sZwRuYmp+nADnG7n
	xa5yqp4x10P/VzQKq56nhgk2VCKDXcsI0tSHQQh60G8L/xgUXWqwYuqnv3UytP9M6M3ucwQR3h7
	PAUU3+yaE+yeIpiLfRq55fTV8/mE=
X-Google-Smtp-Source: AGHT+IEYnefLjwRHgzf+R5/XYJYMXRwt/qaNVRLsuN12d/w0udHR+WMa9sp7aPyYBWHqZ0JkB7qDB734xF84CR8XcJA=
X-Received: by 2002:a05:6870:a116:b0:25c:a4cc:db33 with SMTP id
 586e51a60fabf-25d970c1609mr940863fac.14.1719599550694; Fri, 28 Jun 2024
 11:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqpPQAdq7FOratvtZoAGJwL0bo0L=nDHAh4YjSWw6Jg=Q@mail.gmail.com>
 <19910.1719594386814066905@lists.openembedded.org>
In-Reply-To: <19910.1719594386814066905@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jun 2024 11:32:04 -0700
Message-ID: <CAMKF1so61fq2rjQDfdgv-4yj=-pj5Hz1VK+M2P8D+miSxJcOog@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-bleak: upgrade 0.21.1 -> 0.22.2
To: gudnimar@noxmedical.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 18:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111155

On Fri, Jun 28, 2024 at 10:06=E2=80=AFAM Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org
<gudnimar=3Dnoxmedical.com@lists.openembedded.org> wrote:
>
> I will look into this over the weekend (running ptests is a new area for =
me). I'm curious what images you usually use / recommend?
>

you might check if the recipe inherits ptest if it does then check its
enabled in recipe based ptest image infrastructure by perhaps trying
bitbake meta-python-image-ptest-<recipename>
for say meta-python housed recipe once it builds then run bitbake
-ctestimage meta-python-image-ptest-<recipename> and observe the
results.

> I've usually just used this one core-image-minimal from openembedded-core=
 and used oe-init-build-env for the environment and manually added meta-ope=
nembedded/meta-python into bblayers.conf.
>
> I see core-image-ptest exists and looks like a better choice than core-im=
age-minimal
>
> Thanks for the feedback by the way, I really appreciate it.
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111153): https://lists.openembedded.org/g/openembedde=
d-devel/message/111153
> Mute This Topic: https://lists.openembedded.org/mt/106918869/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

