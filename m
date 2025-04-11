Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B54BBC36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 06:01:38 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.18942.1744351294503796546
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 23:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K1THqQad;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-72c0b4a038fso1000733a34.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 23:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744351294; x=1744956094; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UznpebMjRxhtY45b0a6bc5m9OUu+VKA4sOKp5/pk1GY=;
        b=K1THqQadDAZP1XO4QKNrpgxis1gIkylCQtpQFaZz3GAOUurtzpnLEYPRKAcNAMosCs
         6OU0YBBUzxUSuodGbso+qkWrnggCxYBuF3frQv6FOmLvCcxzEKfg9Mn9vzDf40WPSiW6
         Wj9Na1CyAI/WpEqzLihtHfx0OQspsqKXyVIUpEqAHmjFXDwr0NLZrZA4VS1lQMftkII+
         bLP9ZPLtnkSqQ7NgMsxVpqKwyavbUWUyEgmTOfGqlmatmMI346o/MhvZeKgqPoZFcYb2
         diE1hA0SIeXHB+Y/0aOPx7AkEHZegBvHYSM2/VLud0pZiSkWsNZWmAbjRVHyuujcrt21
         4qow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744351294; x=1744956094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UznpebMjRxhtY45b0a6bc5m9OUu+VKA4sOKp5/pk1GY=;
        b=BH95wOnuOFQI4cGEjkYNFEnLDjj4UROZUaF4kj3+Yhqb/ATuBWNYgXCKvuXinqO2z2
         J7gyqTD8+ORO9pqp+Emz/ILdUGj2fGwHkDb3wYRvKOIMdJxryZ1WZO0jS1nv6xEToT7S
         x58/NQeVXUYGEwSG62v2FT64GX4GgVSIcWmqGroOwjDJwVSX+qPWHSXwM6myT+6pMzp5
         fHCL+RrAvZp93Pl4nuXyYjXaxpj7NSPbWYraQkGJ+BgoNoRd73gAdDTe6wKWzxWeHqEh
         hK21RqKuPlWF+QOl06Z3gYIp6V9dtDIv4gZD9hJ/gVB6ACjj2NwLv85NkHtFPhsN7Ui/
         OnEA==
X-Gm-Message-State: AOJu0YxXh2Uh6kV8RIIv/lOCCHv468CXwGTAhHUOp0TOLwHJNFuyzVnw
	feLpaBjG41gQKGreVF3UQK33GtvXzCMDDAB7lqGOPZjQH0Nllvf2cLYQ2sw7QdTgJpUc41qczTq
	jVdTH0OQd8BXiahoUp105y7Sy4S8cl6p3
X-Gm-Gg: ASbGncvR0SINbAsR0ACnlZsZO9kwv8YTgPEIrfs2C38Z4DzwbaUT6PsxX46AOPlPCNV
	Ial9LWahv+PuPvOuZ6P22txBX+c018eYUyYGKxH7SO8nvcDeDRVhOLrcUysLU5uB/iPfrdvHPzc
	n3vquC1yNh8BkFnx8cwEQp
X-Google-Smtp-Source: AGHT+IHY2N6rqqT0SjVvSV/TFJkDbWBzpBcJ5LF5XZUot3gsPMgAvBJRbWOgCcXTQ+6QNyidjJ1295ktOGl/sNL7bYM=
X-Received: by 2002:a05:6830:6002:b0:72a:1d92:d968 with SMTP id
 46e09a7af769-72e8639fa44mr1004103a34.19.1744351293637; Thu, 10 Apr 2025
 23:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250411052327.2144966-1-changqing.li@windriver.com> <20250411052327.2144966-3-changqing.li@windriver.com>
In-Reply-To: <20250411052327.2144966-3-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Apr 2025 23:01:06 -0700
X-Gm-Features: ATxdqUEpSSPKP4n0lBLj4_z2Ku5FJdvxL5qa2Mje9Mfs7e4OkXc6UpSHcy3YHo8
Message-ID: <CAMKF1sp0HE=rUgh6JqekZBS8z=7e2+hE-xpHE=kWO0VeRq74EQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] turbostat: update the PV
To: changqing.li@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 06:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116796

On Thu, Apr 10, 2025 at 10:23=E2=80=AFPM Changqing Li via
lists.openembedded.org
<changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Current PV 3.4 is the kernel version when the recipe is newly added.
> Because current kernel version is changed, and turbostat has its own
> version, update PV to use this one.
> [snip of turbostat.c]
> void print_version()
> {
>     fprintf(outf, "turbostat version 2024.07.26 - Len Brown <lenb@kernel.=
org>\n");
> }

I wonder if we should keep it in sync with kernel version its coming from

> [snip]
>
> $turbostat --version
> turbostat version 2024.07.26 - Len Brown <lenb@kernel.org>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../turbostat/{turbostat_3.4.bb =3D> turbostat_2024.07.26.bb}       | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-oe/recipes-kernel/turbostat/{turbostat_3.4.bb =3D> turbostat=
_2024.07.26.bb} (100%)
>
> diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb b/meta-oe/=
recipes-kernel/turbostat/turbostat_2024.07.26.bb
> similarity index 100%
> rename from meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
> rename to meta-oe/recipes-kernel/turbostat/turbostat_2024.07.26.bb
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116793): https://lists.openembedded.org/g/openembedde=
d-devel/message/116793
> Mute This Topic: https://lists.openembedded.org/mt/112205591/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

