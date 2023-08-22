Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CC8EE49AB
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 20:02:26 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.6187.1692734543067976463
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Aug 2023 13:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=oiKYahSm;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3a7e68f4214so3562265b6e.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Aug 2023 13:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692734542; x=1693339342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C++Een4xQXzLKIhLP62fiGIzTyKqpGtlbV7dtFOTMYE=;
        b=oiKYahSm5878inM3SLx38+26+Mbt6pgNmlivQuHCr8H7mXz3lBg5cYsnAOu42O4wjB
         J8d2rxYv4mHeEM1KkpnC3V4FnzDftRdCZWkELy7YckHt2vMJr45BriueMUw8wf3KMfS+
         AR3dc2S5EsDCW92AHSSlrekHTkE4Ms4x3Wbn+2/uSvaGdqzvMjpSWlwSLAcB3rulgKSk
         DuGdIl6NH1u+ZqfCCoHQxK36QpXtv1s0xU+2t+4m9OUhFTk4+wBUJRHikcZ+oabRi9kh
         ieOeDwdGZ95h44Tp3P70KpmknRXHsKtCHfceRiBrQ0vnzMmPhvEXGfA7V1HqVB73Xx6o
         YzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692734542; x=1693339342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C++Een4xQXzLKIhLP62fiGIzTyKqpGtlbV7dtFOTMYE=;
        b=HlA523rHGip44QsAO4K5j291PR8TV++zj1wUHm/5ochzSpD3Q3GIf4SlncxxRp8J+K
         zXnxnsHQr9fxAqY82Gok+WLCjktbTSoNLFzGakWjE6/xIOcMkwVxgNMyZfW0p3WQhYPf
         ATemvTGs4GWlMZPJOs4wqeuRaZBTTnAl1sfLwmCfq4ntsCUq2HFaDvgX8hGj8KzFkXlJ
         SbsJ+R7t76NSlvkokJmAIxUbttI8kbbg3VE52ArXZ4tamL23X9rd8Iuk8ZPWUaxuH9WM
         s11eDcDt4eBGNETVRB9Ird0+5ldIoLTG4AhFpCmNW6VW3Xr+1dAmS/3pINI5UyE4tGYp
         IWrg==
X-Gm-Message-State: AOJu0YxXGucTdaWL8Y+Z1FtoA5H1z0NSeCLuynR77n73j+28DakGUwP5
	4XqSxT8iE/jFWDNs7ZE07LyhMu0u5bM9kzLBLHKbHHMBPno=
X-Google-Smtp-Source: AGHT+IH1g/qFn9QN9UflvbomT9SJMK4q/6BnqKhu/bOFlBHEihpgoyNS/FzVjqeWCBdJVU2Z3HAWozwc5scgyESd7K8=
X-Received: by 2002:a05:6808:b04:b0:3a7:b5ea:f5e7 with SMTP id
 s4-20020a0568080b0400b003a7b5eaf5e7mr12220006oij.39.1692734542200; Tue, 22
 Aug 2023 13:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230817092034.26410-1-frieder@fris.de> <b5fdfa09-af2c-46dc-98ea-d50a134bf05b@kontron.de>
In-Reply-To: <b5fdfa09-af2c-46dc-98ea-d50a134bf05b@kontron.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Aug 2023 13:01:55 -0700
Message-ID: <CAMKF1spyx3hDVzuTuyZOThS+jmLSpqrs4eOREe0yu2MNiA99yg@mail.gmail.com>
Subject: Re: [meta-python][PATCH v2] python3-can: Update runtime dependencies
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: openembedded-devel@lists.openembedded.org, 
	Frieder Schrempf <frieder@fris.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Aug 2023 20:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104521

On Tue, Aug 22, 2023 at 12:12=E2=80=AFAM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> Hi Khem,
>
> On 17.08.23 11:20, Frieder Schrempf wrote:
> > From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >
> > According to the setup.py of v4.2.2 [1] the following runtime
> > dependencies are currently missing. Add them.
> >
> > * packaging
> > * setuptools
> >
> > Also the aenum dependency was droppen in v4.0.0 [2], so let's
> > remove it.
> >
> > [1] https://github.com/hardbyte/python-can/blob/4.2.2/setup.py
> > [2] https://github.com/hardbyte/python-can/commit/13625ea2cc18e3283b811=
1bec7e139ed9b6c7f48
> >
> > Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> > ---
> > Changes in v2:
> > * Drop unused aenum dependency
> > * Update subject and commit message
> > ---
>
> I've sent this v2 a few minutes after the v1, but I see v1 was applied
> on master-next. It's not a big deal but I still want to ask if there is
> anything I can improve to avoid this in the future?
>

Usually, I look out for v2 intently if v1 has some issues if I have
picked it and it might be timing that I missed it.
please send the incremental changes as a separate patch so we can
address issues that are still remaining.

> Thanks
> Frieder

