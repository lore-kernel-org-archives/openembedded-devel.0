Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70392C77B6E
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 06:21:29 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web11.2971.1681453281227334638
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Apr 2023 23:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=x3iWvndT;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.222.45, mailfrom: brgl@bgdev.pl)
Received: by mail-ua1-f45.google.com with SMTP id p91so25193133uap.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Apr 2023 23:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681453280; x=1684045280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SKJ60N8X2I5mRcgxA4dpAvCu3pddJviFMlRii60bJs=;
        b=x3iWvndThOqvU/joljEW8yYr0o+0Q/kyjy+jsw8Q3kFoSXbXAR9e+YSsjRXMAdPx7V
         NYrGCVkniSa2FSABwfda1LClPHiEpmmMGAnq64RlA5tsafB/HkqwNqIWpfCZzuneJeEv
         yiV97xRnpkrWvDBYh8Q78NWDtQuxUcQSGLim/ygFCGPRzd0GPgXeKie4My0znI60wkeo
         xhIbPm5mPpclCdfEpxNJXoZA+DwUMDmvOD8RnHwg+dvvinXuXU2pdrzI2PIg4Fgv5e6j
         9iW1SebtH8cp9yDEF2vYm9OILCgwdyktyWAtp1ajcwZ+9YuopnY98FJ34dr67FPDFrH+
         8AwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681453280; x=1684045280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9SKJ60N8X2I5mRcgxA4dpAvCu3pddJviFMlRii60bJs=;
        b=Pds92jyM0H3nyX+VwCUybs+1F+G8oBr052W9NYwNqg3BYCt6DgOPHxKj0/Z1oE0bDs
         4nsLDTtBu9LzyBdZAPluX7M6Q8zEhC4yA/0+1PY3axu0jRIVtvI2bUPTYqYkog/giHgN
         8dMksY3u2dG0qBy0l0AO2WRsjeEeXiVB92NsURUEs2I7zpH7J4hc/90fAg6U3fwG5C3N
         2zQj/eWvXDGbJn/5o3OFf4XZknwY8HmZzMFCAzVv+tv1+JAlFtKLeY9yjYGFtPY0HvR0
         YIPzkugedqsxRk9x8WngUpYuyUjb6EehDhnBbaFiU7gUAaTdy2mj2A+5JrBLz24Qx4Zk
         pCQQ==
X-Gm-Message-State: AAQBX9cVmx53Ro9EsnO5lszoSiESCziyiyqKsSnGSAN3wP40ipxbZ3Qr
	/vtPWnnkeIzI295HnIRVKfdwKpqOUX21pa8HKPB7kQ==
X-Google-Smtp-Source: AKy350b9erHHOWgqKnSlAx9yF1A9TV9HTNZ48lKyK1ntpZzwC+8CtcuYuzviL8Y5+n2uFxVzMQTrG2hZMIadNl9sv00=
X-Received: by 2002:a1f:2941:0:b0:43b:af47:ba56 with SMTP id
 p62-20020a1f2941000000b0043baf47ba56mr2450788vkp.2.1681453280044; Thu, 13 Apr
 2023 23:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230411131518.401912-1-brgl@bgdev.pl> <20230411131518.401912-4-brgl@bgdev.pl>
 <CAMKF1spb_w1q6dy2GApO=UyoGm67jnuOfPG55dKbh78Dk6cPCg@mail.gmail.com>
In-Reply-To: <CAMKF1spb_w1q6dy2GApO=UyoGm67jnuOfPG55dKbh78Dk6cPCg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 14 Apr 2023 08:21:09 +0200
Message-ID: <CAMRc=Md6AsrBea7NE6odvAxG0bJ7j4Nm3+k48Xij-KPwO=Ps6w@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 4/4] libgpiod: update to v2.0.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 06:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102086

On Fri, Apr 14, 2023 at 3:19=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> still seeing these errors
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2659/st=
eps/14/logs/stdio
>

Seems like this is from python3-gpiod. Can I see the recipe logs somewhere?

Bart

