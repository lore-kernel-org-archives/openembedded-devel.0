Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149D6C04FF9
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 20:05:01 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.6250.1695240290876963484
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 13:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SPuUlQYm;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5731fe1d2bfso142054eaf.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 13:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695240290; x=1695845090; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCXQASCwL4ETHHjywtnM/E9GEFEI4RqGwfXbnPJXHTg=;
        b=SPuUlQYmCtSj569V2ienAE4NmgkZ9bCl0GE68KQeGmsSowAcGzwp3sjnwersFyTUO6
         NOJGbH18OM62uQFxxcxsoxEdLhhUjJqqCnLg8FuzqT4c7M/P3kzPqiuuNHysbAxvLKiv
         5JgVFMCJh8lKywkc9bcRgjvsaer5WL1YKsQHhW3ztIOflcKhK6eqeCKNF2MU6tQgboxm
         cInKU2XdOQoq0jfSiuWjp5xd4n3o5vUOeFf12z0Is5Oy88qrv+pNP40OfLvH2oYQo3+q
         en10Q+hJy1OAjiDERDQA08OIff94tQmso+ddFCSCQaWiA62ykVVbR8xBdW5e1ad7C+Z5
         t/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695240290; x=1695845090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCXQASCwL4ETHHjywtnM/E9GEFEI4RqGwfXbnPJXHTg=;
        b=v0xxDoF7tycGhoylQXETKlqwi5AE8n/QVcS8aLOJXZcFoqHJvQrfUfDz7SoKOMnUeT
         buNi2Bf2Oiq+iQHx7k2qqDG3lPL4ym5nAWAiAwukFq/zeThAKDZ9cp+GT8uGhLumyxOv
         JR7RIThusIdJmgtO2UI0k0sCu5Cak4TbJaps7O59dQaDYC1nhPvfy5DUQHXvj1YQAtsx
         aRsIQfVMF/xfeSYD2HBnfistxA/iloA/TqbY1y1IlvIcBrE8ycXf0CdeeO7TcIMWhaER
         P5lIzT/9arDShQ/ZsV2/4BweiMa5S1f5xSAapbRMIbyglOL3dvHm+osJAt5Y2+bSa+pz
         y5Ew==
X-Gm-Message-State: AOJu0YyNKs/JjiCA7FhWq9GhxeTIsb+gpmhsvN/jYFy9WuxczcUgTpfy
	y3oHiBcFSZld5W85cWpqcMkCxvsAbSu8dv6mgYfNpqQKW6s=
X-Google-Smtp-Source: AGHT+IGUDRr2WXBxUzz4eLXSyLnHX/0RHd0IWBYny28QGgG5kms94/69smKYr7C/cFQgzWFAd18grHq+UYFmVrMWRnQ=
X-Received: by 2002:a05:6870:a105:b0:1d0:f5bd:6e9 with SMTP id
 m5-20020a056870a10500b001d0f5bd06e9mr3942558oae.22.1695240290038; Wed, 20 Sep
 2023 13:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230918110305.38374-1-dse@thaumatec.com>
In-Reply-To: <20230918110305.38374-1-dse@thaumatec.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Sep 2023 13:04:23 -0700
Message-ID: <CAMKF1sqGaJqAHp4_6gsvNPqXywGf=Gjv7ML2d=G16ZbLCW8N4g@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH v1 0/2] cockpit: Separate packagekit
 and apps packages
To: Daniel Semkowicz <dse@thaumatec.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 20:05:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105029

I usually see this error with this package

https://errors.yoctoproject.org/Errors/Details/737847/

Can you see if anything pops up to fix it while you are here ?

On Mon, Sep 18, 2023 at 4:03=E2=80=AFAM Daniel Semkowicz <dse@thaumatec.com=
> wrote:
>
> "Packagekit" and "apps" Cockpit modules were included in the main ${PN}
> package. Move them to a separate packages like all other existing Cockpit
> modules. This allows to choose which modules are installed in the system.
>
> Daniel Semkowicz (2):
>   cockpit: Move packagekit to a separate package
>   cockpit: Move apps to a separate package
>
>  meta-webserver/recipes-webadmin/cockpit/cockpit_298.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104924): https://lists.openembedded.org/g/openembedde=
d-devel/message/104924
> Mute This Topic: https://lists.openembedded.org/mt/101430711/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

