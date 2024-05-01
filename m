Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480DCC4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 00:05:16 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.980.1714521906864644548
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Apr 2024 17:05:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cBAK4aD2;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-22edbb5dd40so100370fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Apr 2024 17:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714521906; x=1715126706; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMYHkbLIFzwHo0ue9rKlp+KmWnaxQY++pxn8L3L0ZXA=;
        b=cBAK4aD2/zVCE6UIJyR5kxHWFmAOxwRLFxqW/5dcZ7ZpRPNITVLlzTEl35wshUU8H0
         O1rG66MZ8PziJUNDJWfnDiSYatIrAH32IZzIzF5/KO1T+s5bkc7eEgcsxA3419NIG90M
         JC2eVaD9XYPqCLUD5KWAo1fM79SQhZPPmb+9KNNvdJodXEBFbw0K0KV8jvm9vML4JljH
         y5v0KmPnZYVUlJYkEnMuGdaRXI9BNLetpO9OvzTeK5lPMnKhGtcVDlDbZ+xHEqYR9GU+
         ICsHKkhTKPioxmHd9ApW4xFDaz5NaSYNXpENd30gMkOw4+eWe1d3pck4m2iZFsaSoOKr
         zEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714521906; x=1715126706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMYHkbLIFzwHo0ue9rKlp+KmWnaxQY++pxn8L3L0ZXA=;
        b=cxT62wibms7pCobKhHFpVg3ROz7/whLOOk4WHCFuC1EziAHEC0AD0WyTJj7EtTCdPb
         DtG5RCA5MckZrGGqmHlbPa/3p/9CCfowiYyi/3JurAeu1SLPuBIAMXK9qFzylKD3Db0y
         1n+DQmCX6jy1yZvsFVme9rdvYeot+rZqcg07dxddPnqPmIYFs1zLJahMwYWBR0AQxX/H
         31zmIP3W/2BSWhTsN9GeD0wmBohu1zIcVKKWbKiO5MJ9rnRTpAEbXBxlLieJySKl+krf
         jF2wtaZ1H1QQ6FNiFHc6i3Bxp/v8Kbt8WIioKerRF/49npySnzx+xcfhODzkgfRldvRH
         49Lg==
X-Gm-Message-State: AOJu0Yyxe+eJczEe3vJo5NlnH+M6qGMoTFud6pAUKqCe7UZqxDoq/cuh
	UtehLSncF58aUY9C9a2yZQRt+6/RXkJ5RLYdVZtooG+sCKjxrc2ceVQc/x1hux25VEcEkWGAf6N
	XGHEalaAbZ3KMMGf38NHwtrl2D1Q=
X-Google-Smtp-Source: AGHT+IHC7lnNfysWLGPZVgd2EiFrnTHW8fe5yNbi6BX9EEOwJ1Sw5CQS7tQqG9tcOWcFBYDr4AOuHFCyKnQzmPebQF0=
X-Received: by 2002:a05:6870:35cd:b0:22e:bd8d:c04d with SMTP id
 c13-20020a05687035cd00b0022ebd8dc04dmr1806646oak.14.1714521905962; Tue, 30
 Apr 2024 17:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240430214921.2190109-1-peter.marko@siemens.com> <AS1PR10MB5697545E5F326721B30C40BEFD1A2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697545E5F326721B30C40BEFD1A2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Apr 2024 17:04:39 -0700
Message-ID: <CAMKF1sq5pXmiRFVFJsAnWdamfeWNW0oHrmFTUZf6j_91Yi6JJQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nginx: Upgrade stable 1.24.0 -> 1.26.0
To: peter.marko@siemens.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 May 2024 00:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110200

On Tue, Apr 30, 2024 at 2:52=E2=80=AFPM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> Could this be taken to scarthgap, too?
> I know it's a major upgrade, but starting with EOL version is not the bes=
t start for 4-year LTS release.

I will try to get it in if Armin is ok with it and it works its way through=
 CI

>
> Peter
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110199): https://lists.openembedded.org/g/openembedde=
d-devel/message/110199
> Mute This Topic: https://lists.openembedded.org/mt/105830453/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

