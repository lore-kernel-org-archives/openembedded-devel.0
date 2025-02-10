Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40336C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 16:42:01 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.56361.1739205714323489991
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 08:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dhoMCFEI;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2b86794e3abso1047413fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 08:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739205713; x=1739810513; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9luO5kWPeiykxf6Csh0NKWs790IDlSEvCPAN/DC7a0=;
        b=dhoMCFEIwrD2W/vgbgqumsV+prhXiGSgfO1E+68Z3k4bArnO2WGZAktbz79pKA0YBM
         f1aNHtndx9mIDtbhsFbRPE0zxGqDGuQY0vuyRZ/K3KYNtc9+noTrhBkO+kgkGLHUF3bS
         XusWe/X3f4xtiY054t7gMj2De/oC1k1KH5hvd50+9/ZE1FS4I1mA2XtiV6iNP81Q0bq5
         1KwZKyQ+7dUCA3qxod/NEEQEahNT+x7WjoRrriWn6fk29YVK1pxXE3AHHfkVVUR98gzK
         iqtSQ9zdsEYrTh/HsT8FWPFVjr7Ma1S1HJZTDhOYeSF+val6NGHBYh4PVrJASiuiTwxh
         pPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739205713; x=1739810513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9luO5kWPeiykxf6Csh0NKWs790IDlSEvCPAN/DC7a0=;
        b=gj8tafmBB9uppj+gRaWsevsOz9hAn0SGLhIkK+IS/wypD6yTgzjSjPbnw665SD/9/2
         2dlZWz5xvmr96GTi8fvzGsVxhW/fJlmVeim3FwzwLBA6lAVKBXH0xUsyhje6wiIrAev8
         96CW6xKWsp+iJLxhT8iNE8n2M2P8vB131ObcbCufGrF9u5kMIxc6qYpCd8YVL7qeHJue
         xx9IpTGGDk2Gz35+44W6j//v48jDht9+L0FcDWAadkk+l+Cc5bxULkHUhbtQOyUfF2hr
         U3lMs5CLlU1NCUzogL94bWdHsFy+HSysWSllWBgdIG0yT9JKyUfs+fnWJNOedvlaSW/u
         ANXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhxHZ64NLqcOhi1XlMd/EcJIwGXxUv/nt5ExlJgvC0WJ4hRUUKTTO5M9goAlq/AI8jbjrt1YTJ+qzh1hQ8LismW70=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz8K3EFzy6wzM5QbidUtC4BpcwVg0H2lWKYqnpy2hN0lxYGJuRW
	8Zz+Q872nqPjP7e8qk2SYgfRpTzKSjXG94H8bEuLUiUffeaxxHxzse6jqlG7ITEOOqa86huNFJb
	Chfe3vHIwzWQcdieO62a431i4FAY=
X-Gm-Gg: ASbGnctmSlVdorg5+b6uF4qLOEoHPayyIKrEohu+Hja+Uc1MP7E0LNiCPt76aD0+Oxw
	VxhZ6ZAxrIoOyO9Yj7uPebJX/kF+32V3ZEgzOor6KMHw/bUgJAoRvi7sN+F558itFIItYsABj6f
	5H3mCynUe5wMxgaKk5mC6PEImWYZKqwg==
X-Google-Smtp-Source: AGHT+IHH+fw05kKfDtTKkrvOkI8SR4tCXTyOjwFJ6+KwJYWfLpB4nepnda1cdX4qdAnK+QTz9FB5h+rY334QJTBofWg=
X-Received: by 2002:a05:6870:169d:b0:29e:4340:b1b with SMTP id
 586e51a60fabf-2b83ed06682mr9260457fac.9.1739205713540; Mon, 10 Feb 2025
 08:41:53 -0800 (PST)
MIME-Version: 1.0
References: <20250210075352.3942800-1-quic_ptak@quicinc.com> <70985d7a-1c09-48f9-a04e-049ffb7c4a74@gmail.com>
In-Reply-To: <70985d7a-1c09-48f9-a04e-049ffb7c4a74@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Feb 2025 08:41:27 -0800
X-Gm-Features: AWEUYZmSuqmrYOSL9gQNk7p03MHBEIswuGwiE4jv1uDQpyDnZYJi5QcagqcQnYY
Message-ID: <CAMKF1soKQ+1pceqKqdH=3PW8XaxKpN3YfwGSeieSAah9TGJ5bQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] Disable FASTCV HAL implementation
To: skandigraun@gmail.com
Cc: quic_ptak@quicinc.com, openembedded-devel@lists.openembedded.org, 
	quic_sssanjee@quicinc.com, quic_vkaruchu@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 16:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115407

On Mon, Feb 10, 2025 at 12:45=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> > +#Fastcv based Opencv HAL/Extensions are not supported on all platforms=
, hence disabling it by default
> > +PACKAGECONFIG[fastcv] =3D "-DWITH_FASTCV=3DON,-DWITH_FASTCV=3DOFF,,"
> Is there a dependency missing? Using this new packageconfig fails with
> the following error during do_configuration:

I think we need to download it along with other dependencies in
SRC_URI or provide a separate recipe for fastcv, at times we have
housed dependencies in packageconfig which may come
from other layers as long as they are off by default. In fastcv's case
I think the recipe does not exist in any known layer either.
my intention was to add a note so we remember why we disabled it so
perhaps just adding a comment would be fine.

>
> | -- FASTCV: Downloading fastcv_linux_aarch64_2024_12_11.tgz from
> https://raw.githubusercontent.com/opencv/opencv_3rdparty/dc5d58018f3af915=
a8d209386d2c58c0501c0f2c/fastcv/fastcv_linux_aarch64_2024_12_11.tgz
> | CMake Error at cmake/OpenCVDownload.cmake:210 (message):
> |   Not going to download fastcv_linux_aarch64_2024_12_11.tgz
> | Call Stack (most recent call first):
> |   3rdparty/fastcv/fastcv.cmake:29 (ocv_download)
> |   cmake/OpenCVFindLibsPerf.cmake:188 (download_fastcv)
> |   CMakeLists.txt:800 (include)
> |
> |
> | -- Configuring incomplete, errors occurred!
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115328): https://lists.openembedded.org/g/openembedde=
d-devel/message/115328
> Mute This Topic: https://lists.openembedded.org/mt/111098636/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

