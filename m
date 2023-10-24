Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E71A8C00A8F
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 17:01:11 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.23616.1698166870658812635
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Oct 2023 10:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nw/cFFX3;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3b40d5ea323so1643538b6e.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 10:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698166870; x=1698771670; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKfbLDCJMLfLqBOkbgMMoAkBDGuzDUe7gK1qhPgb6Fg=;
        b=Nw/cFFX3yd3id0ZXzi6NxE9qxFESABzXHYSbHFCBFXuZmHLX+Avm1FX2He49sk/sgF
         JikuYV67Y2KKhSNQR4UKpIgkLkNTCVgk9kGOWUE71vq4fDphGY15rjcHYHyadei/M1U+
         QS4hGTSVLIhQdpVZHjyvkEmoNtWbDSmLkzc01sektgLjSrCIcvTqUQ4NG/eJO+nwDkVs
         B0nmkt8Y7+y6a3hlUWH+nDuJINzNC+VXEC+0SF4m/gkw8L9wZoP9y+M3CE4tbCv7STx7
         5wisrYWFuXwbCRfUW8qdLtVtjM+wDvZuaerxb6pzpu0f5VRz3vDbHx4dhPsnGAi6/nRN
         kW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698166870; x=1698771670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKfbLDCJMLfLqBOkbgMMoAkBDGuzDUe7gK1qhPgb6Fg=;
        b=DnRiFOmV2IiSf8Irx+hOTwwdwRYqKs4ROFLWAp5rjiGdqDWjuljxAhLPNBRNTR/NJn
         fjnYSCkkSNggDHRfP819kiDLovvzixWFn04S/Uk2nhG6x1X+xwvSP+8ykZRNWGdPDVUb
         LjNnHTsYUqZfjJV59WQj0xnEDhxEaXIPjNzZqCeWqK9z65HbTXxipOWrGe1JyJ2hYr4u
         tvvxBQMAWsBl2M++LGvm2a4l1Sobk3VAhrqbxyh/8GAW2Ym/pODDhxQLcqjrbjlikry0
         srrC5PpdnuhDqMn2V6r8bSsPpzz+hrbLgxxcgwkqNjtfdVEGSw8AYtGxz5DbdMR8nQGR
         sdLg==
X-Gm-Message-State: AOJu0YwFJmlA+poXB6SVYPO09RXzPiVNemM8JGSR82gNmtU/kJswoN/n
	cqouJEbn0Qtu+92K73f5EYhPNBMEZwuqzdPF284=
X-Google-Smtp-Source: AGHT+IEJpjC4z9MfMHK/P7mboiq7NAO4Uz5AgG2Q4Yo5O26UU7lFu+Z/65rQZm1oDWlKS44Zh0PGHWlDHmMnG9EzFfQ=
X-Received: by 2002:aca:1104:0:b0:3a3:95f9:c99b with SMTP id
 4-20020aca1104000000b003a395f9c99bmr13165871oir.35.1698166869743; Tue, 24 Oct
 2023 10:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <21c3c1d1-ecfa-4ac4-8a58-ade5504339fb@gmail.com>
In-Reply-To: <21c3c1d1-ecfa-4ac4-8a58-ade5504339fb@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Oct 2023 10:00:43 -0700
Message-ID: <CAMKF1sojW-GRTAMONtbmWd4zdsmV7PPiAQBOOGrYsT7E17OhmA@mail.gmail.com>
Subject: Re: dunfell merge request: Oct 24th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 17:01:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105723

merged thanks Armin

On Tue, Oct 24, 2023 at 5:57=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 0f10a0d394ddffeeb1db0ea94046d86792d704=
fe:
>
>    php: Fix CVE-2023-3824 (2023-09-30 08:55:03 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to 300be975359fdb3a3b2bf7c6fe15dea7acac575d:
>
>    libssh2: Backport fix for CVE-2020-22218 (2023-10-21 16:31:35 -0400)
>
> ----------------------------------------------------------------
> Vijay Anusuri (1):
>        libssh2: Backport fix for CVE-2020-22218
>
>   meta-oe/recipes-support/libssh2/files/CVE-2020-22218.patch | 39
> ++++++++++++++++++++++++++++++++++
>   meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb           |  1 +
>   2 files changed, 40 insertions(+)
>   create mode 100644
> meta-oe/recipes-support/libssh2/files/CVE-2020-22218.patch
>

