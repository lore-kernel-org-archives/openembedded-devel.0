Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3D4C25B76
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 09:40:46 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.79324.1717407637394908130
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Jun 2024 02:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=EN1rdTRd;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.171, mailfrom: brgl@bgdev.pl)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e719bab882so44342901fa.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 02:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717407635; x=1718012435; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmvydlRyP+2HwEYiSXgt9ia0vJ7Wxue0gwnQXHHdgIs=;
        b=EN1rdTRdCuVxZfgV3Yk5NJlo7mAkvngj+QqhYYOjlKE7djXtvhhUd0wMoyLIuAcwhl
         cAGTBcmsdh0dnhgwyWYhZP9kk4h/5dystYjOfhG8GA7YLwpIXgpE2JRvCsWb5kepuguZ
         458SvVZynXlNcos2/8areRaRQPZ/eMUvCDVEUq2oVg0ohCTzZ1OjJGrCqMV4FbEc0x3D
         TznbwzjBkYi0McUfKrQEQhl2XD7H6m+/vxT4Xg1D1r+3WYgRAoHqXbckqvNkY7ApBODq
         3HzPjxETIxcJsNv4JCLMoH2v3flLpoIntzOLUY7GjkWXJiDvI7rJoi3/lwQcVb1l7h9R
         dmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717407635; x=1718012435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nmvydlRyP+2HwEYiSXgt9ia0vJ7Wxue0gwnQXHHdgIs=;
        b=A51Wdl/wX2aCiFEZ2nM36MG11soetgc5MxeZSWyryHDxdIvtS9txFFckpdvVlpxtal
         asQ+yDYZuliNhxksvByT1J2OFP776de6WpV08xabQBK98Xgk++WMewoAKfHwubOv7MNr
         f6VkIVtc+qt1P/AlaK2LRuZs5y1Srgzc7SJ1CnMDHJAgJUTESxaKHjDcVlpeuIpcFPOe
         wpfGpcHYKJq53qze2PZoDSgScRQ068tsO7CviATqYPSeb9t/to65b7NG1BvlxiS3BqDS
         Ptw2/Tz6ZNYhutnV5uzgSDGj2m2qxP39pqJF+EIjfjvfmpznPpW7v4SH2k8UA3ZjzJMi
         xcJA==
X-Gm-Message-State: AOJu0Yzk6s2K8bRcmv0Dxyd1BLapt7PGtvJyDgQ7yeRd4848JP/L0cNR
	ZzrMkZxsbscy/C2RMBUN4iwr+k7LZOI1+7VdZFTZ0X4otjN+ITbEnUninwszK8bR5fLdqBDq0W8
	NEQbfBlJhHqO4QmhviyHxXs2pzelBm3uKk8EGkg==
X-Google-Smtp-Source: AGHT+IHrRed/Y6uiQ3pRSXGXRuFlQnIDNKyaZQb+oBc3j399eDIzHIoe/HpNxoJD3DgVA4NZOT7wka5oInWAsMZIJnU=
X-Received: by 2002:a05:651c:2209:b0:2ea:8abf:3a62 with SMTP id
 38308e7fff4ca-2ea951d7010mr63630151fa.51.1717407635499; Mon, 03 Jun 2024
 02:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240601142247.4047887-1-raj.khem@gmail.com>
In-Reply-To: <20240601142247.4047887-1-raj.khem@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Jun 2024 11:40:24 +0200
Message-ID: <CAMRc=Mcc9-DK0f+tOD=4Pfh2n+r657j5ExSBhMFwHKp=pDB28A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libgpiod: Migrate to catch2 v3
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 09:40:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110671

On Sat, Jun 1, 2024 at 4:22=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

