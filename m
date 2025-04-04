Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E5DC3600C
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 01:59:29 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.2300.1743731965369462824
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 18:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g/NyAUiS;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-601c469cce3so399438eaf.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 18:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743731964; x=1744336764; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKZ07u2cutntLJy3NgTeiwMpa91C1nhpl7xnFDuDIw8=;
        b=g/NyAUiSR7VI87/yOpa0XwcTHg95609eMlVcUm8lmlSFB3zHHuzKhBRKmU++QCfnu8
         HObT4muT8BBg/cAsIdGGKrC9iIArjA9WCXW7+4yoPKayr9l48LzoP9S6yTPr6vVeXWQZ
         EuvuJocLVkvEIBRi5mPzg/4IgwBFlJEFYndY9yGQf5zm0MuVgVy6kvJeCgKdakXMPxgj
         WwWdFjJOkzfRdwwE9szSFqkYiEOgyN6Zx1BnBJDsc2ZK0s1ngkgNlY/2slGVrBTwKCSF
         oixh2/yv51syDRjIWKsZiV6OHHUwj2GYHxFgGYSL2TJjELwRPBMWrQG6NUWcFdwXas8Q
         fLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743731964; x=1744336764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kKZ07u2cutntLJy3NgTeiwMpa91C1nhpl7xnFDuDIw8=;
        b=SGqBEsj44bxJ9CMSamWB7b0ZWvIJ3XsF+uGeMH0gObF2+oRd0aE+KDf6n47eF9qkE+
         OlyN5J6TTrrH/P6FJgryDAL4vZlOwBTqmrDbAsjXjG9HPixkOl9cqsw3TMArxuP4LjDb
         KvV0SlCTBDoao9yZwRTB0+j9jh+P1EuFB3GfPKPKpO6WQP6xm21ed7DKT03oV0ntj4Ty
         xnkDk/GJ1x/p6+o/TQ6KMchtBdOUDe0aIVt/5jyWOZtsv2tkcd+jZwg/fcjRchJCHX3d
         lB+1b6OCh1ruWWov2GTXPzrGE4+uEjm2E3ptxWjhMFBW/nE4J9Q4zu7//XX5+ekBML7m
         tAzw==
X-Forwarded-Encrypted: i=1; AJvYcCVus0nsatBQ9YMVz+h3P4QIhMXYroj9hCgHduZsnjhdPGjlPB2tSrnv3EGQdoDlQS2xD58sTGzxgQGs+Um3s6X4QpY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyMy7TBjTG+RuNhXajdCfxMnYuxcQHjmOkiGp2dFgiCVogEiFag
	nQ8bXd8KBmrCoNYv2G1pXa6tm+hpAix0QilLH8+ZU7c57kPeeLeeh8EF7fhPN9RdqIDLZqh0pkM
	4OLGpQeLiQeSHgIKhrgYnb2GVGAE=
X-Gm-Gg: ASbGncsqItJlaCLSVxx4QcYv6zjvhluT1Sc2zd6/zaRD6EVD4sJaITLp7G6yRHeDVEK
	kv+Sf/QVE0GfRRBaxMRoeXvTDLQ7jTh60M+S7iU/vHAoLRRDFUSlXf6sFZdbwMbcr2uLrngNtTm
	Ab1EoxQ3oU0/FFbXH98UWyprYkzw==
X-Google-Smtp-Source: AGHT+IH5fp6uGeM+4SwHd1ajm/yeVHTWuxF30qdxzbWOtxUYMgE3eXdad2kJ6F3AynvLv/pnF1GoS/zUKHcEZtepuvc=
X-Received: by 2002:a05:6820:2715:b0:603:fada:ac47 with SMTP id
 006d021491bc7-604155cfbc3mr683835eaf.1.1743731964563; Thu, 03 Apr 2025
 18:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <ab95bf2efed9124921b16e39ef0086d787bf4469.camel@linuxfoundation.org>
 <20250404014746.249819-1-schonm@gmail.com>
In-Reply-To: <20250404014746.249819-1-schonm@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Apr 2025 18:58:58 -0700
X-Gm-Features: AQ5f1JqjyPVNc9d5l9mhJRXBjqsFwN6bcxEIinooo4q9K3670dFYCr3ooWZ7Mao
Message-ID: <CAMKF1spQo+=imoz5+gj7h0+ciY6on5nceLPZv61wp_P_pqZ0ug@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded] [PATCH] recipes: Fix variable assignment whitespace
To: schonm@gmail.com
Cc: richard.purdie@linuxfoundation.org, martin.jansa@gmail.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 01:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116558

On Thu, Apr 3, 2025 at 6:47=E2=80=AFPM J. S. via lists.openembedded.org
<schonm=3Dgmail.com@lists.openembedded.org> wrote:
>
> I am seeing some problems with the warnings about whitespace around assig=
nments while using master-next of poky.
>
> In the case below, it's warning about an export statement.  But certainly=
 in bash, putting a space around the equal sign of an export statement will=
 make the export fail.

Certainly but here its parsed through bitbake which then creates the
shell context.

>
> --
>
> WARNING: /home/jason/yocto/meta-openembedded/meta-perl/recipes-perl/libco=
mpress/libcompress-raw-zlib-perl_2.213.bb: /home/jason/yocto/meta-openembed=
ded/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.213.bb:2=
1 has a lack of whitespace around the assignment: 'export BUILD_ZLIB=3D"0"'
>
> --
>
> Cheers,
> Jason Schonberg
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116557): https://lists.openembedded.org/g/openembedde=
d-devel/message/116557
> Mute This Topic: https://lists.openembedded.org/mt/111570451/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

