Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1708DC04A6A
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 16:02:00 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.164679.1692201710317408398
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 09:01:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jmGxaQvx;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-56ce1bd7fc4so4904623eaf.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 09:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692201709; x=1692806509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtI0VYsqVDzIa9zI4/zZVr889zx0r7+WaXBgZSqdQI8=;
        b=jmGxaQvxizBDjAuefNxkhrHodSc5gEMsyOcKMa7x6Ot1cU1uRU3qyR0rgKVn7SlH4F
         /DTf35E5zKGMNBX7GjVUwk1YIwNTMVW7o09BRuW9xxyZRMuWt1+qQuYKy+SLjgWEaaf4
         gaj/UhFdl6P/oPaL/biQLBg/fIJ2GvsLY0l2Gt3/tUxMcumvzq/fd1lk4z9fyqvhif+t
         UjN+xkcSd4HU5Tj3p+Ak5mf0eGUJPPnob4jQmqE6Y4CLJzyikNjccaYROPMmXUNiVvWY
         fVmYusNVHVv8LkMmmAqrk2N/rPv0hqcPM3LGuIm4w0IZdccXMhP2q3jqEXdDP0VmeRBg
         gw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692201709; x=1692806509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jtI0VYsqVDzIa9zI4/zZVr889zx0r7+WaXBgZSqdQI8=;
        b=W43/2BJq1UADDK7VXg4tge7M4IxLYmk2n+0Sx4DdawL2eoJgB4s/jDUcghBTohmRlA
         DEBfPWb6XhmsuVjeqPlQT/Pg05FP8rQ3xqX6sH2auGDAhd0gr27QdyveqJTxfUVtKLQL
         FP4X4ENi5flJNWVkJlQpz2Iquj2TMNLMpnRePbblU4+/Dn68jnVVlpNglS/mNPUNCpFS
         TpWOOU4ZZvYCXXT0dDEFl3kC52r2G4Nu1O/aOTNsn5rrVczn7MX/Xca/vr8PA9H00q2J
         pwcGgz+uovPExnFuW/JQ5CMkalgQdp1OGQf6+6+jJE6kTVrXIOmu7Snr6WV2o9hyFU4n
         fXvg==
X-Gm-Message-State: AOJu0YzmoZodANNN4VqIq045w1TmUKLMtEQyZU0dh5zVo2E6zbL1Gj3A
	a0fXUNGupgroFuP1HT8zCkJSGiqM54lyiXXXS54=
X-Google-Smtp-Source: AGHT+IGvnutfYr/7yEKKWFAoFvUnxUtyrrX/Guhg7IVrfuerhMsyxz2du4twPTafULpaAR3hEt/+RxGL8vjb/iPmDjE=
X-Received: by 2002:a4a:625b:0:b0:56e:4dea:bc5c with SMTP id
 y27-20020a4a625b000000b0056e4deabc5cmr2254726oog.8.1692201709076; Wed, 16 Aug
 2023 09:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <872ec58d-22cb-494c-72e5-1b9a611b1857@mvista.com>
In-Reply-To: <872ec58d-22cb-494c-72e5-1b9a611b1857@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Aug 2023 09:01:23 -0700
Message-ID: <CAMKF1spOMtEFNVU2-VJwHAT3R8UJmrLCEp2u8XtJh9evw35d9A@mail.gmail.com>
Subject: Re: Kirkstone merge request: Arg 16th
To: akuster <akuster@mvista.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 16:02:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104431

Done. Thanks Armin

On Wed, Aug 16, 2023 at 5:26=E2=80=AFAM akuster <akuster@mvista.com> wrote:
>
> The following changes since commit 594c9cf6d3205c8e40ff772383fd9ab7dd3ed2=
cc:
>
>    redis: upgrade 7.0.11 -> 7.0.12 (2023-08-03 16:50:52 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 529620141e773080a6a7be4615fb7993204af883:
>
>    nodejs: upgrade 16.20.1 -> 16.20.2 (2023-08-11 10:32:04 -0400)
>
> ----------------------------------------------------------------
> Beniamin Sandu (1):
>        lmsensors: do not pull in unneeded perl modules for run-time
> dependencies
>
> Frieder Schrempf (1):
>        python3-can: Add missing runtime dependencies
>
> Polampalli, Archana (1):
>        nodejs: upgrade 16.20.1 -> 16.20.2
>
>   meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 5 +++--
>   meta-oe/recipes-devtools/nodejs/{nodejs_16.20.1.bb =3D>
> nodejs_16.20.2.bb} | 2 +-
>   meta-python/recipes-devtools/python/python3-can_4.0.0.bb | 7 +++++--
>   3 files changed, 9 insertions(+), 5 deletions(-)
>   rename meta-oe/recipes-devtools/nodejs/{nodejs_16.20.1.bb =3D>
> nodejs_16.20.2.bb} (98%)
>

