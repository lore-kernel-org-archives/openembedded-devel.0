Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D57C7EE2A
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 21:18:13 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.27385.1750886283293339953
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jun 2025 14:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gvBkhGMo;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-711a3dda147so4144977b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 14:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750886282; x=1751491082; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cpngQDPr6uDUolKgrdgV4XrZkjjcFMo9138QbqxEE8=;
        b=gvBkhGMo7SCrQIkmAOiEgY6XzvNR5/deOrRoFqtxIRaY5ZUNjGjRzsqESeTruzzNQv
         lOuR8ZzeBmjrK44ZuxvkuQuBIqreAwhcfccDAy1OQX8lp04PFpE9R5FJoI7dV4HmGYIV
         7B6ZKpvNXTEvrmoNi8jY8Ws/5T4iV9KM5c+3tftGUgSN9jsbl1cgxl3v+QXh4dPaqCpv
         DufZ1Dt/WpSjpMXqi9WCzfGAuJPtEjUFTtKLjsHAVReGLa2q0huyaYf7pZ0j+i1Yz9dM
         sESdrZUWt3hrhm7N7uf1cyrgNpUoBzN4mNZSpXgNg9TSdqmT3XklBIDUnVrDVQMMMLGd
         p+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750886282; x=1751491082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cpngQDPr6uDUolKgrdgV4XrZkjjcFMo9138QbqxEE8=;
        b=MXFnUeIeQ8tpA9I6/nB0FuXIq1L2KKL4OyEcV9hc0ANUab9XAGyUAA2W2li3dvkf7V
         FdqknaMzwYnnRtoorOR8nyLJHSR2MmQPCAFjWxQEzaByfPKNclEKsi6jeH31mcaxKEc0
         ojWzPAu3HcX8Z0p0u2rQOsn7sFykEvxmtm8oIvyKpTtjpHh9tfQWPzm+Pxn7nr1TRA2X
         Loj3DtH1bs19AzrQRaNl5b2EWkSAASaSVXzoat0YVIX2WQ36MBwyWNnrzQJAifmhIvni
         gZ+pRfJBM0umcBJR1zg5JDdC2X8o66icMWqfabvRwkuSHwXsqoefySs23VkOy0Ogvnpj
         Kbog==
X-Gm-Message-State: AOJu0YzIzxHO/scqUC4bhq9x0Dcb3vCTF57ouzz8ap2c36CT/EvPVRCz
	nLU68zzVAVOZnAPnqL2HhtkgB10t4lRDnqIywG6qincku9QW8oZfYfPZHSrRXg4Yzg7N+7RoMRx
	QyuimKPSjt/Uve20bwBepLTKjtoQxcpyDT2Q3
X-Gm-Gg: ASbGncsymLBAQQ7l5dVZea6A7ywPYXL5+uJhWvtc8VJM8YJrl/GRuznUNS/eAywDTDp
	B+EfkV+uG3FEIX29ADesrIfu7uQFw0zVsQB7X7Y8f3XP5+bSmf/ZchMdw2lSC8kVeINoNdCHqp9
	4lrt0scXZt3JAT5KnHgsC5gTGDENVc9ZUi2WDQWzPar+Y=
X-Google-Smtp-Source: AGHT+IH2TQo3wE+PFrJ0o/Gsmlv2gliRhO9SAFli1rDH5yK8uiB/b9fKy8lGFlf/7Y0rov5EHl6eYw5sYL7v91c56T4=
X-Received: by 2002:a05:690c:7449:b0:70e:185b:356d with SMTP id
 00721157ae682-71406ca306amr74021057b3.14.1750886282208; Wed, 25 Jun 2025
 14:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <05ecbc8e-911d-41c7-a1eb-598069dbe289@ti.com>
In-Reply-To: <05ecbc8e-911d-41c7-a1eb-598069dbe289@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Jun 2025 15:17:35 -0600
X-Gm-Features: AX0GCFu7WhwkQvtqR77tQOKYf84iExE5UfoCJfOn0VGRfOrsn3IBARi_r2F70BM
Message-ID: <CAMKF1soY9wtM68YCEWGgZ=buu8YZmOzZfHYijrVWquEsMGDKEw@mail.gmail.com>
Subject: Re: protobuf build issue
To: Ryan Eatmon <reatmon@ti.com>
Cc: openembedded-devel@lists.openembedded.org, Qi.Chen@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 21:18:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118112

On Wed, Jun 25, 2025 at 10:27=E2=80=AFAM Ryan Eatmon <reatmon@ti.com> wrote=
:
>
>
> I'm seeing a build issue with protobuf-native due to the recent
> abseil-cpp version change.  The new abseil dropped something that the
> current protobuf version is requiring (at least on native).
>
> I have a patch to update to the latest protobuf 6.31.1 that fixes the iss=
ue.
>
> What are folks thoughts?  Do you want me to send in this patch?  What
> all else will this patch break?  python3-protobuf?

Please send the patch, on top of master-next, there might be
protobuf-c to look into as well.

>
>
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS

