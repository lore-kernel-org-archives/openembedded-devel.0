Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA06C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 23:43:23 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.9335.1702510997673943951
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 15:43:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IaAoHll/;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-20311257937so1407694fac.0
        for <Openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 15:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702510997; x=1703115797; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oieU2qEggzNBZ1pYdweEeff7L49JjxjhSmKwZtJ3+ww=;
        b=IaAoHll/ayJBV0WdFpc78KYc77bk7gmHnOQKlhVwufnCcxnFsIni+Ns2NmjzxIN4dn
         CIAVWEYbLU9xbMvbXGYSC85MCE0MiU6ECi4QneWKBjt4Wc5Duzu562T2Mj0yqKFoXQHn
         rGkR//PHoS6y5vsBaM63gP69csiqpBCOBt9oB2uuX+cD9WtqZiIhbjmUipGHgC4Hctgk
         +7IsUMC836FgWUHZmtFZS/BtAaVbs58/MxM2BQ3DGiL219o9UAgbfYckytd9wRczMS2B
         KNLE13FPj2BaHn0oYk6mV3G3NP8bAB1EkZ5nG7ToMcXgSNDYgarSjaueQvrFao46xSV4
         QGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702510997; x=1703115797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oieU2qEggzNBZ1pYdweEeff7L49JjxjhSmKwZtJ3+ww=;
        b=Mnr8RhCBWftdP4RjvHhyL54sWDd5FP9EpDPYbJujMhChEzH6s341YaxHKz4KEAR1HE
         MFbIgiJilzgnRMESlJ+CGI0cxXu6p63g6czL5I3avYm9sLfp+S7yT+2MeWW2dEHqPQp2
         zovsGgWBOdTdHT83NY6Ki9o2ZThbyNUwUHvhay9HhIhPRZzicqAJoP7RG1v23omWOG1S
         07Ibrh5WxK+8ajJa/5CDRLMpQCG3ANoCtciHMbbxdSHyPT5Yu3erTRWGbddX9rL00lVF
         R5cdU0a0b13fKBHoSsFJCCvl7yigfWsnHZNF2aHktN9D8aycCwuHDQ09oPc4x27D9Chb
         T04g==
X-Gm-Message-State: AOJu0YxMYYAroXFXPcI4LPtecA997h/JZIXQliUaOp1wn4pQatDFWBof
	49ZP8RUOKfFJIXr+xSsVJIaJIPL4H0Qv5/CC5VQ=
X-Google-Smtp-Source: AGHT+IGeMrcPB2ae7z0HY/lB57E7VvttOno70PVj1sHNWVA+0EyAuvPwEnRqkfOd5qnhydP7PFlHZoxqI9cWOGwOg50=
X-Received: by 2002:a05:6871:3316:b0:1fa:3e47:5a8e with SMTP id
 nf22-20020a056871331600b001fa3e475a8emr10510612oac.5.1702510996872; Wed, 13
 Dec 2023 15:43:16 -0800 (PST)
MIME-Version: 1.0
References: <20231212093804.1012506-1-liezhi.yang@windriver.com>
 <170245126382.133993.15578168101766633828.b4-ty@gmail.com>
 <45C353E1-7C45-4BC4-A5A4-1697BA14E6E4@arm.com> <CAMKF1sr=8nggCC00K7_5KnHLy40zp+Zebr92WRxVDV9S09v95g@mail.gmail.com>
In-Reply-To: <CAMKF1sr=8nggCC00K7_5KnHLy40zp+Zebr92WRxVDV9S09v95g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Dec 2023 15:42:50 -0800
Message-ID: <CAMKF1sqNpgCAruQ_bXy4JOSgbTm0DxB_d7VCXio4L8M_1JfG2g@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] minifi-cpp: Fix do_configure error builder aarch64
To: Ross Burton <ross.burton@arm.com>
Cc: "liezhi.yang@windriver.com" <liezhi.yang@windriver.com>, 
	openembedded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 23:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107401

Robert, can you test and send improvements that Ross is suggesting here.

On Wed, Dec 13, 2023 at 7:55=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
>
>
> On Wed, Dec 13, 2023 at 3:31=E2=80=AFAM Ross Burton <Ross.Burton@arm.com>=
 wrote:
>>
>> On 13 Dec 2023, at 07:07, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
>> >
>> >
>> > On Tue, 12 Dec 2023 17:38:04 +0800, liezhi.yang@windriver.com wrote:
>> >> Fixed do_configure error when build on aarch64 host:
>> >> error: cannot guess build type; you must specify one
>> >>
>> >>
>> >
>> > Applied, thanks!
>> >
>> > [1/1] minifi-cpp: Fix do_configure error builder aarch64
>> >      commit: adecc463a3c090e5a9c54875a42047a427384f71
>>
>> I stand by my comment that patching the config.guess is the wrong thing =
when we explicitly have a command whose job is to install updated config.gu=
ess files.
>
>
> This is vendored code but I think overwriting config.guess might be bette=
r way still.
>
>>
>>
>> Ross

