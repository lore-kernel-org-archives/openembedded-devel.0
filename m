Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5D0CD5BC9
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 21:27:14 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24861.1779744432837279798
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 May 2026 14:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gyPvJr4C;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-43bf95c1faaso252685fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2026 14:27:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779744432; cv=none;
        d=google.com; s=arc-20240605;
        b=eQljykDS5LNLOTqZFfmf/W63YThDIQPKYuGidVYPRh/Msd7YLqHVx566zHQD4Jva57
         +m9WItbesT2oC+QyWh21JeSeUu0Q+vXTx1NTKwLL6+A0uV0IvJx49ctvP/oG2Ty9GT/2
         RgEyf1f/PZRFmW0JE9423fjS7q6tJBn9PsAokGZ0U5vYKDAtVHZLRn9fEcJGVqcbd1aO
         zqXur/2GA0e7MIOZ/XSWFFwCm0UnQTRsOlCCFNiStUJbUbI7jQ/0qGAMnl1vJybS+5St
         V/Xkwj9bFl1v43qum0CHJwtAi9EUT/BjrpeLAGHKqDi4dfRXvoWgXvs2DT4xbJnzEjky
         BWXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=buZninV8sUA7DVO077wmqW4exvsBLxuRqs0zJ5x0qFg=;
        fh=bJIdVQ+yeFJcFx6VXI73zJ6ORGBr9uZdGk5uM6koSF4=;
        b=N3l3/ord6lap1XmG4kvTZ1CQrKBhXYFzLB7+xKwfq5GAyF5pEG5KFcAX86l8+osaap
         17Wt3N41IOcq5jYUHTRdcTFlObj/v2MGqau4IEhNHLLVubDFrNyC6g76Ct1xB4ffp/nj
         oYvrJJV8Mqdr5aPS39ElDd3Eo9baYQ/fuJh7FqI6jgQQbQzeACmypWNXc9BD34maOZ7q
         DQARTEVfzr6vck2llWPXYvBHeuD27dznUFoedGsQE2kPeN+SAhQSuXRaNl+jNKtsFpCW
         6cFFmf0xlEvKSwoUaFKd1D3QULYcj86CdGLfiiOX9UyyhtaoNoMsPLm7tRf6vtQBsEFC
         i3KQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779744432; x=1780349232; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buZninV8sUA7DVO077wmqW4exvsBLxuRqs0zJ5x0qFg=;
        b=gyPvJr4CxfwBi26x2JDfQQobd1atv2f6ZaivqHKL18o12MzB7xkeIDqBI9ObxbjuKB
         meCPwMO5nNJG9mfhMxTe4ezuSwLIi8iYAckSoVETY4YLveSwci+K6cbENtJyPPbKDBx7
         G42OJ/GGOaj1spQ59aBSvrqZtKXs2CX81SJ5J5eKqYdfUYmGkCQeKyZ6pKYwgUxq/Dxe
         MnDlatUQoR6cUgevupwtW6tgeJW8v2D5p0X0+L60HIVZAjilINwBgcpdqrrzgUOAJdMZ
         TBw7Ga3wFkxp7wt1LTXTpWXKOB2DDlUJsGizuJdn4kWTmmJVCZacGD2ROE5sJaemHgKQ
         8u8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779744432; x=1780349232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=buZninV8sUA7DVO077wmqW4exvsBLxuRqs0zJ5x0qFg=;
        b=RJJeXTu98WSr/6adnq5K2k4SgEm1TRRsbEshq8ZkQB/Fzre1Cgswx4FKG6ONiFAtPM
         ZYVFNZlexsv8v3VJGfzGK9Sgsr+lEMDXXju1z9GcIBf+Q9nm4gx4HtUY7vp2IVYVmLMK
         XCbetG5ue5y2YV3g+N5CqHExW+KTXU38hlAesH0vUlq6IvShXY+7d4TGtS6QrEsnXg5h
         kqNeGIc7MfFWEcFpUySKwEcuQ5Vmw2lar+GOIlUwfwrHxob5H2Qhhi1jYUUeC86uXOCb
         sjvXB6qRLUJrPlarhG0Y39Mmaiyti8mgVv5ko35eYJpenU+hmrI9QGjrIQ4WvJ8k8qWm
         kZ4A==
X-Gm-Message-State: AOJu0YwWq65UGzbC3ymsTOxpsMQGMaAhNoDczGM1oQMDBm2cyEziYW9F
	y05URk+FbBSkctCdIDdsyr67SNMRRn1d1uzt/fnRSA8SKC+HR/8nAYqIcdl08AED5Tr0LFnpsjG
	gLvAvACUokblfsX2SisWmjpH3rING6/w=
X-Gm-Gg: Acq92OEXB7uRthC09T0zHzS8BiLtB3kuhAjJY1fsOtLGLlSqj5vUX8nDDMhNM5hKkXF
	WwWQIxfz6sW7FVjwbi/P2mdeUeWQlrneEGWiKeJUVfwxWxTWfK6ToA5s4vGN2xAwP0WfPU+OIS9
	QlOV5yrYoId1pg5yzdcAZpO6mzkZodt3vpjbV9sF775mMdlqP6bwTXbXUPoLsiiey/UdbAL7C2k
	vpgQETm2qE3F0zY4ngaXqtzPh8MAH3UJGyo5GDxKnJGTMrLmLWszmSmuBUrq8azAIZPlCvY+m+W
	bPHhPtr6FQ==
X-Received: by 2002:a05:6871:2947:b0:434:2c00:fd84 with SMTP id
 586e51a60fabf-43b5aadd362mr9393594fac.10.1779744432017; Mon, 25 May 2026
 14:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260524125709.9164-1-f_l_k@t-online.de> <CADySD0GZTZpc7VpPmGd-k40X7iknMDu_kYQUcwnaP9HpMksUCw@mail.gmail.com>
 <VYDLFT.TSRTXA6REEGG@t-online.de>
In-Reply-To: <VYDLFT.TSRTXA6REEGG@t-online.de>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 26 May 2026 09:27:01 +1200
X-Gm-Features: AVHnY4K1guCLG8Ea8ibQ9023rCPSvnaoX0I0vwhIYRecqug1WYnAkkVE4QCybh4
Message-ID: <CADySD0FYBcrq70RsheUgoHtRnqC=STozsZqUyYv0PdyXcrKeVA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/3] playerctl: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2026 21:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127202

On Tue, May 26, 2026 at 12:14=E2=80=AFAM Markus Volk via
lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org>
wrote:
>
> On Mon, May 25 2026 at 17:12:09 +12:00:00, Ankur Tyagi via lists.openembe=
dded.org <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> Last release and commit was Sep 2021, is upstream still active?
>
>
> You're right. The maintainer hasn't been active for the past five years. =
However, I've been using the =C4=81 playerctl=C4=81 binary for many years n=
ow without problems.
> It has simply done what I expected it to do. Since it offers mpris suppor=
t for a wide range of programs such as browsers, vlc, spotify, xmms, rhythm=
box, mpd, mpv and so on,
> it still has some significance, and most distributions continue to make i=
t available in their standard repositories.
> That=C4=81 s why I thought it might fit in meta-oe, but if you decide it =
doesn=C4=81 t meet the standard, I can of course keep it in meta-wayland.

Thanks for the insights.
I was purely speculating about future "what ifs" due to inactive upstream.
But if it is beneficial to add this recipe and others, especially
Khem, have no concern then I am fine.

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127199): https://lists.openembedded.org/g/openembedde=
d-devel/message/127199
> Mute This Topic: https://lists.openembedded.org/mt/119466180/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

