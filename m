Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D40E7717D
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 09:39:22 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.11762.1734082760748953420
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Dec 2024 01:39:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BIplYQkD;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-540215984f0so1668322e87.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Dec 2024 01:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734082759; x=1734687559; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vY1Jt8Lxo5Q1YJUkLvW/zRl2lL3lsNAOuQ3+E0MO0aQ=;
        b=BIplYQkDw+MK9lqjKBsSE3iUrW4IyLsg0+X8Ke4qLkAwMjmalj0QYwccP0R3XLoh8S
         GsK8jaCuQjnU6fPsARddQmfbyMlFEyJam9g9p/49A8zuC9yQ1ivbPYeHQSj9aUJJ7ck9
         UspSjmnxxz3NVzq5USj/9UgYRMjZilFRtY1LjCRZvEbS2FIW7q7j3D3AbzyAS0XqW91z
         eYlnMm9recTmqx8731GYg2C7citwkvliE7nvvdPFXHeMeKwQltcMftV0n/B4impRRemY
         7dRLtUcIiz8mYlTHEauXzEcxZuK17ex77utLO00LeqLoGqJTfPyfyVgzgLFDrvzNzN3f
         F5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734082759; x=1734687559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vY1Jt8Lxo5Q1YJUkLvW/zRl2lL3lsNAOuQ3+E0MO0aQ=;
        b=UfJdNsLVjWMhyd9qVgJzz1cB91Oyp2Zc2xFXkL3JxcdW8P1BEJqXnHUT5IZafc8GPV
         IQ3x9kbwYA6r18vD2FCnNmWrv8cdPDrSemhn/raPy+N5D0bSXIVBUCuFoASndaj+4h2x
         VzeHIzWwTRJkpxrGKA23CJBOzrCZGkpoNi4XR7QhmDR3rif02dK2MfdxBQVl745XmFwa
         R0b72vUGGGQBeC/QChzyzGSRQJ9zbNzXH6EJ7Gxf9qjn/awUF/RP6ZQ6ZNriT2vxqcFG
         rXDZSDboh74KCN3vLWIX0J1EdJWEZ3hN9ngsymUuXhXVk2OSrU7qLVZxe+UunQPmYbzG
         Vzvg==
X-Forwarded-Encrypted: i=1; AJvYcCWn0kh5sGIzg/IemTjQiCv0qe8Y/PuTG0d+Vy5kcDyIXeSoA/T6epNyhXTQt6i0I19wJs4AD2CcNJBMj51C4nM0kPo=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzVjYKJplFRZ3xQioLqFTrdl8IdN4GlValo7evhURoERUwvNQEW
	V7zQA2aWH3W8lxJ3Qu1zxYVXahbqc2s+8T2gfCbn6Yy1yDvrMCzNkuPK/MWo/XOc7PIg68miCao
	GWe69Cjd2v7rCArij2xF5sbWXdCY=
X-Gm-Gg: ASbGncvfBfUp7J+kb2VNPuHUFyWk8F3lZ1idrdP/REgxsy2kVQAwweicQgR0LJdJOO5
	st56YCdOcgnPDoC8FGNaS86JIUhnQVIYYiGDarWXK
X-Google-Smtp-Source: AGHT+IGQYrCmAkq2hMEB6gZhEXAKXhtzG4bIjs85WWQWrlu+gn4Urt+2ESYSoOdAq5po9hteHgKADb9yKZ5C53s1xs4=
X-Received: by 2002:a05:6512:ac3:b0:540:2542:d89a with SMTP id
 2adb3069b0e04-54099b69cb4mr431061e87.52.1734082758409; Fri, 13 Dec 2024
 01:39:18 -0800 (PST)
MIME-Version: 1.0
References: <e36a1a4b-9d1b-e6d8-e865-c4bcfb57a515@gmail.com>
In-Reply-To: <e36a1a4b-9d1b-e6d8-e865-c4bcfb57a515@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 13 Dec 2024 10:39:05 +0100
Message-ID: <CA+chaQdXB-mOeEhCLbpKVOANJxQbPxgWVLwv32Sg1K4csdOcow@mail.gmail.com>
Subject: Re: [oe] sources.openembedded.org status
To: Armin Kuster <akuster808@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Dec 2024 09:39:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114310

It's still being used in default mirrors.bbclass:
https://git.openembedded.org/openembedded-core/tree/meta/classes-global/mir=
rors.bbclass#n59

and today I've noticed that it no longer resolves in DNS, probably
doesn't at least since Nov.

If we agree that it's not going back nor getting any updates since
2019, then we should remove it from mirrors.bbclass (to get those
do_fetch failures a bit faster).

I've asked halstead on #yocto about this:
10:33 < JaMa> halstead: is this expected? it's still used in default
mirrors.bbclass, not sure since when it doesn't resolve: Resolving
              sources.openembedded.org (sources.openembedded.org)...
failed: Name or service not known.
10:36 < JaMa> it did exist back in 2022, but without updates
https://lists.openembedded.org/g/openembedded-devel/message/97961 and
probably
              doesn't work at least since Nov as in
https://lists.openembedded.org/g/openembedded-devel/message/113785 and
one other change like
              that

On Sun, Jul 24, 2022 at 7:13=E2=80=AFPM Armin Kuster <akuster808@gmail.com>=
 wrote:
>
> Hello,
>
> I was looking at the content of sources.openembedded.org and it appears
> the last update was done  back in 2019.  Is sources.openembedded.org
> still a thing? if not, should we shut it down? If we think is has value,
> should we get it updated?
>
> -armin
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97961): https://lists.openembedded.org/g/openembedded=
-devel/message/97961
> Mute This Topic: https://lists.openembedded.org/mt/92588380/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [M=
artin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

