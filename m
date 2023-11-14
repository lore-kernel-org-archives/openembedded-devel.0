Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F07C47DBE
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 23:54:05 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.1315.1700006042181851329
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 15:54:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pyw6EY9x;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3b5aee410f2so2940895b6e.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 15:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700006041; x=1700610841; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pOgksTPkW+/mear3utOu5+MFkdbwuh+1U9HhGbEYxI=;
        b=Pyw6EY9xE87yTfYr+2RGnnKSGPhiH9FMFll8K4a/+feQ2dURbSCJBtxF8UHJ3NLI7H
         r99UMzAKO25RO9+9wRYKex75bzBnS6tXMVam2CHyu9Rw42BtzhCAKBQ7J7JnsXQSTgyS
         YVEfWhmi+dVMEnP4ObygBR0qCGxgoUPo8X/FAaDiCkHR4iHbhdsI0vZ8wfoIfjL9GZMw
         FT9Sw1+t0Rc0L2ZpgncEotM9LbYvtnExbGIT+BnawTTSqsBtATannlVEs6dGRzTU7fmX
         jPF5lZsoFIwSfgeLxk1TRTu8XSxvZMCOx2BLEKhZJkVPbKCKekEBlrWJdxasVi+P0krB
         OlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700006041; x=1700610841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0pOgksTPkW+/mear3utOu5+MFkdbwuh+1U9HhGbEYxI=;
        b=tADNiRlPNz5JydAL5dTG9YFJOUndMoQF8EyLWs6sO1FhMzm4CeR/pN9RXpgBjRb1DN
         20uG35zJVFNwO+W7RJeS9DPuwvsKb9Y0aMDD6AVPLqEmKNdSATGzTONPNQbh+uuL4lbt
         EYpTzLe9JEkB3WxSR5z2VZAlUZqw7nUyCmyGBxW50kCFPyftRYK2nIyuXdywZqkbNncJ
         /kbCX6N5gePGUkDIDdah8V1cal+n4a7XrUrZzGrwM4XgIbF2W2iuShQjGngbEoMKkdx+
         Nde/AtZN7PkmhvV5oEdXII2L4Mvm5NJOCXzbJ3F9XrioNMUzyEC5f4Z42+y4dvPJ9KdS
         dQIw==
X-Gm-Message-State: AOJu0YzoC8wTCBUU8Xxqcg0WdMOviBWxXpDzfzcPx1KAHT1Zjh3oRFUy
	47bmvkSKRaG8ScKfLMTmZvzfMDkTDYNnXPjfSuJSslTonpY=
X-Google-Smtp-Source: AGHT+IFkY10Uu4ZHI8pVUBE6iiLtoO0WCVd8R2pV6lEvhMqEL+Xy3y03gdYeA5/98A8Sss6BxgCrC6rxOB8O9jNBrmU=
X-Received: by 2002:a05:6870:c102:b0:1f5:5da4:9355 with SMTP id
 f2-20020a056870c10200b001f55da49355mr151553oad.57.1700006041207; Tue, 14 Nov
 2023 15:54:01 -0800 (PST)
MIME-Version: 1.0
References: <20231112005941.3689515-1-f_l_k@t-online.de> <169990042605.4418.17328445695395731594.b4-ty@gmail.com>
 <CAMKF1srYX9KmCav5t3fXiyDUwLDGdaLCB17ycbfRQsXPdoEa8g@mail.gmail.com> <DE054S.RM4BNCVSRL3D2@t-online.de>
In-Reply-To: <DE054S.RM4BNCVSRL3D2@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Nov 2023 15:53:34 -0800
Message-ID: <CAMKF1sohGEA=4p_hNJrFjKqX54L+TJj+TEdhshDT0qbFc_Ngiw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] cups-filters: Upgrade 1.28.17 -> 2.0.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 23:54:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106728

Thanks for trying! I can give it a shot on AB

On Tue, Nov 14, 2023 at 3:39=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> On Tue, Nov 14 2023 at 01:11:42 PM -08:00:00, Khem Raj <raj.khem@gmail.co=
m> wrote:
>
> I wonder if its some sort of race condition ?
>
>
> Possible. Unfortunately I cant reproduce but I'll send a patch that might=
 fix it.

