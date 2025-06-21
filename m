Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FD3C7115C
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 12:03:53 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.6148.1750507430628373720
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 05:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kgURGMIM;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-73972a54919so2134280b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 05:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750507430; x=1751112230; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qsXMaOrLb9+nessUjZEa382kBN9rgOntn826JokjMg=;
        b=kgURGMIMun0uOVniPexR+WU+XXbSZz4f9ysnN9xopuIqkK+6LMmKoHuLO+quZRgV3s
         Un2bFFibKRjirW8XVaUcrjk6ofYJ3OewRGE/vgL2UY5ExK/pMt3mZKNS7Ky5kwSCw8MP
         mVD0hYtDtxNNJy/sJcma9rwv3m+H8beoS3Ut7RuQ/J1dY2Xx2bn74hoNgYEjYAc0mxBW
         hu0VNpIlZwy7I5GZeqtNcOJGxwWbUqpli8O6eWdrRBxkUN/hFsyO31nlbwhbs2ronCZj
         DYTgEFd05M9M5ZBu/O5s7AzrCH8lH7pFfOyylevIgMdc6hMeN4tfn0LF3vw09k82EBD3
         +Urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750507430; x=1751112230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qsXMaOrLb9+nessUjZEa382kBN9rgOntn826JokjMg=;
        b=MV2jfO8l8gBhg5sILuYbREm2T4j5Qpdi4SsIzPANULSPAMtvInPeFoZ5p8Chrq+Kk7
         ZBA6UcfIuMTyxQsOuw2+cOkjKlJ7qJu9CEPcsdq+QyCJSTeOcVFgQmsT6HF+ivKKvOIW
         wqg9GQROXHcDoVJ2DG4HBbK/NhXKr8c0GtLXueBk5BmTYTa8cmJUv39N2Rb1CdrBrthm
         5iSVntRRjeMq2RDIzl+l34FY0MhlSUCpBIkFEifDWRRzhdSQ7DWVS+TkrEqKq6KnsCBx
         UrQI5DsYQbbFwDQ7didN4Ap6961nUZx5MVwMy7vQcBQIRQSWipestlra6YOS242zpHvs
         ALVA==
X-Gm-Message-State: AOJu0YyNsi6dwRc0F2kiiNVR9Jr5m82x2KxPb4v8e0DlLth0fgBWP7kZ
	2Ui05RJIxNwtkwyKdRtNXmx/LGSBhatswkgYok026bkksZU2nLn76okTxLqqlf7unGTvaovGHza
	REM5Dng4LN6f2b/fvFrta/ZRgdqDVsSM=
X-Gm-Gg: ASbGncsy/cizB/ftZrL09VxcqSiz/R3oP7Hh6m/66Cps9lsw/MdATiiJorghaIKafsH
	k1EsU+oTmgNahtefyVPhk3JITfpE6BSWoxpSlaV14KjFlIheTmt3dWq8r03W7L5ppYpaOjrPmVz
	k6OQtliv/ccgSiyXDRR1PWS8tRXPPg/qkZtPUCGY1q+gc=
X-Google-Smtp-Source: AGHT+IFA0DZNQ2XzOkPOqOsms6CMvwS2LvL5QcfPZdEoqdDrRMtur7zl1fytwnsd1mvcylrEGk+aO0aOZyKeAldUFS0=
X-Received: by 2002:a17:90b:4b49:b0:312:1c83:58e7 with SMTP id
 98e67ed59e1d1-3159d6267bamr8692487a91.1.1750507429965; Sat, 21 Jun 2025
 05:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250621095506.1484044-1-alperyasinak1@gmail.com> <1b4ae87e-8f6f-4297-9e22-3d4d4e9d796a@gmail.com>
In-Reply-To: <1b4ae87e-8f6f-4297-9e22-3d4d4e9d796a@gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Sat, 21 Jun 2025 15:03:38 +0300
X-Gm-Features: AX0GCFtTtLdY5bieVhE1HDP2OvB5qneEOXiBlGZ1c_HGVqYsSQhjJc6JiZHciTM
Message-ID: <CAGpma=6k06tea_ftQtOM4FWbgXidzWQpKLTuKpCNxugh9bYKww@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] influxdb: Allow network access during do_compile
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 12:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118005

Hi, thank you for pointing this out. I was fixing latest UNPACKDIR
changes and after removed the S =3D "${WORKDIR}/git" line in the recipe,
I tried to compile to be make sure and got "connect: network is
unreachable" error. So I fixed with this way. I wasn't aware of the
latest changes in GO.

I tried with poky and meta-openembedded master-next branch without
adding this fix and got the same error.

Gyorgy Sarvari <skandigraun@gmail.com>, 21 Haz 2025 Cmt, 14:31
tarihinde =C5=9Funu yazd=C4=B1:
>
> On 6/21/25 11:55, Alper Ak via lists.openembedded.org wrote:
> > +do_compile[network] =3D "1"
> > +
> >
> This was just removed yesterday[1], it hasn't found its way to the
> master branch yet. It would be better if the original patch trying to
> fix this could be tweaked - if that is possible.
>
> [1]: https://lists.openembedded.org/g/openembedded-devel/message/117947

