Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web08.7578.1621093784688843061
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 08:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RjEDCiIZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id i20so1585926qtx.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 08:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wnjqAwlRR3BtbQHUQBX3Y4M2Q0myXmj6PbHRq1WgjCI=;
        b=RjEDCiIZy52vZSqzstKXuCAYYUXqYJwGaFXFQBM3DxDLPVO5eXpEB8pF8RliDoZ7Pq
         I7LGCewovH93riCGiBgyqU5vfSPKhN4Ftz7xyo787ZeP5p40wQjPgI5+IjUKXe8VnWoK
         EaM0T3e0+m+qB4hc1DEKm2chjm4KUkQ/brRMoSWP2d3PXhjxx/YVNgdp4ExBidrP0xW0
         3cC9CVrClcCkwwy0eBOXdsyGodnE1xYk1MhSPufL+IVr0W1ir660Yc9ifilbFSVlKZ3K
         nn7Vu71Au/3itfdbYbYyj3ZmQBerCyejYfp9oiRncb+bo1qJvptcjZ1CGFzfULZoiCdT
         SOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wnjqAwlRR3BtbQHUQBX3Y4M2Q0myXmj6PbHRq1WgjCI=;
        b=YN/93Riyqb0/ywlsCphydl9C9Q2EKzZIIlqonmGRA5HpRGHbkFmZhoR3v8bb6wWuZm
         TiwVRPg69GIUWB+0Fmpn8QgLQAyORQRLyhDFZKZVaUv/Vrmqtdd6Fz6ud2CXSbwElvjH
         l2oViNJnmdgKz/z2WBXvBOVqe5USBY5eZ+c7a43Ia7RD6QeHRIV2twCeqK5EuMvduI6G
         M4zKhRcYPTDtg7EQXv+sh3VkQ8EBHLrgAsa+F6WaQrnOQBtRucjlsUwS3gE57w66Gxfe
         q/5GcxLziDHo625I6HznPiEnFEIdsFwlzQjeE8gm31jE2fWsehdkr/ZO/oC78lJr7WrI
         QAGA==
X-Gm-Message-State: AOAM532CnzrwAI1O3uZbR/AetqVgj1hJ6PEaA7pbMxsIYcPPspC9hYgv
	ZyYBFDLBLUEefEsaPaF9QSy8tb4UZIFpZjJnru8=
X-Google-Smtp-Source: ABdhPJzh33QAqH2KIy6LP+IreWuJOZvj6JKGCDtp38AN7RwmLLy3ZDNaSAjn6YbWzonp8zriIWjS1McmHzTJqT+peXo=
X-Received: by 2002:ac8:44b1:: with SMTP id a17mr48875590qto.369.1621093783832;
 Sat, 15 May 2021 08:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210514153705.3040536-1-raj.khem@gmail.com> <CALbNGRQ0O=CGu6rZUA23u0LjRJpkNcWSEEz256zPyLC4pQoNog@mail.gmail.com>
In-Reply-To: <CALbNGRQ0O=CGu6rZUA23u0LjRJpkNcWSEEz256zPyLC4pQoNog@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 15 May 2021 08:49:17 -0700
Message-ID: <CAMKF1sp54BqLyJp9vUyBfuo2DiY=DpE10pos+6G_2Zu8GQYU9Q@mail.gmail.com>
Subject: Re: [meta-gnome][PATCH] nautilus: Exclude from builds
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 15, 2021 at 12:42 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> On Fri, May 14, 2021 at 5:37 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > It does not build with latest meson upgrades from OE-core
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> Please wait with this. I have fixing upgrade under test.
>

No worries, Andreas, once you are ready I will re-enable it right
away, I have pushed a patch to disable it so CI can continue

> Cheers.
>
> Andreas
