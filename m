Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53AD8C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 22:29:36 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.2947.1713997775428209215
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Apr 2024 15:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hWV6sQKF;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6ed3587b93bso257261a34.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 15:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713997774; x=1714602574; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWfQMOgfGbLhhuokoSt+3v0V5c1v5qPjS0+ZlMBzrqQ=;
        b=hWV6sQKFr4qTVOsFoLboCLG/dpiFE2oNYdEcn5DElscHgzg28UB2MFF8IPM0jLbxSo
         dVD+OVIsY/igbP0/jFV+14fzDeu2dAqK3EcKoEvSI1rAb5F/aZUWpGSQtrZE/wDJorvp
         fhC5jMZlKUUdGmWKI+oqDmyaYMUErN3VDc1WPKUIa3NojJyhI8LiZZw7FZVkNShgnUVt
         aHxqOoV/DwUefVkSbTzfXULPja5T7Cno13tnYyJ6ltmCDH3LCnfEwTi3eAUCH2xeltwT
         HJDSwnBSNtKH/AAuDGHJM88J7d852AfVaFWgDlnILQspwgphbRkFy2PAKNXK4UcRecVa
         6jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713997774; x=1714602574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWfQMOgfGbLhhuokoSt+3v0V5c1v5qPjS0+ZlMBzrqQ=;
        b=L3T3m3s9b5vVzYlpZ8YaMjGqXQrg3xuU7cmpDHxTjQ5a/WUtug6B7zNCMS8kvvutt2
         JkgtxEnxcNBqJFoDEQicwdbMetE0BebTH7TYLkCQEirbP432c1sMUxv9uDbhEKm9f+2o
         RvYR4zVSFIW2eKBxiDDcxFxOirV7vjYTS45AT6QYLMXVcqjWcDtxRLPpaAJ/jI7tUOgw
         dcrBvNgz3kJrMTN2v72C+/wKfifTR+VpxOLcMnJoyH7iUxVWFJ5PtV5dUF1/DwUAvy+P
         CZLZvl+otjRkpTGkKpmkmcdMdd9PLe/8Tt6MnuOFuvtahzCJyHmecv6Svfp7cAtO8Ow6
         BMNg==
X-Forwarded-Encrypted: i=1; AJvYcCUiN9hhFY154jSqFTZgqWnyCWXvE8OZhjy2DlsxMxYc6CYuwvEcrjGQaEQLK/fYlDpUbFW6b8UapZUbo0r7HjaYnJP5dDQzcquHe6gnZkBm3NAByMKF5m2gwA==
X-Gm-Message-State: AOJu0Yy4q/k27BrwrMukeTesJdQCmH55/0Ub7WfdmbS58FA0Yemarr56
	OlkEKnkFbONY+9YKrXKsbE8fnw/ZnQijM9Fo8fsiIXkM4+9w32mVS0WbcUqFaclx27cCvYpuKel
	qJ9lmGgu2lr1tVpEwlw5W8RJiZTQ=
X-Google-Smtp-Source: AGHT+IGCUOLzQGEzk/ysZLPTnByf/7fQuWFiKjVs/llxGf+ra5Gt/7gUHeTrS0iRXNOMpLcbj0biZ4GmrN6CGBOh67c=
X-Received: by 2002:a05:6870:a119:b0:22e:d324:b888 with SMTP id
 m25-20020a056870a11900b0022ed324b888mr4117829oae.56.1713997774406; Wed, 24
 Apr 2024 15:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240424132329.2706-1-f_l_k@t-online.de> <CAMKF1so6r93QEzxrMV_j5EieO_vvbLkC0PgfBSmrh2K2SqqoQA@mail.gmail.com>
 <GZCGCS.7L0JATLUHBTN3@t-online.de> <CD0238CE-938F-4B4D-B0A0-E795F6B0A587@arm.com>
 <17C942CD035C6224.31749@lists.openembedded.org> <3LGGCS.ZNNW2XQJHNC8@t-online.de>
In-Reply-To: <3LGGCS.ZNNW2XQJHNC8@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Apr 2024 00:29:07 +0200
Message-ID: <CAMKF1srDYA92ZwwYKiSzxLSCOba9WjycyySbwwPw_-AfD1mcwQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 1/3] gupnp: dont package source
To: Markus Volk <f_l_k@t-online.de>
Cc: Ross Burton <Ross.Burton@arm.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 22:29:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110141

On Wed, Apr 24, 2024 at 6:31=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> On Wed, Apr 24 2024 at 06:03:18 PM +02:00:00, Markus Volk <f_l_k@t-online=
.de> wrote:
>
> I guess build will break
>
>
> No it doesn't, using @basename@ fixes the issue.
>
> Now it looks like:
> /* enumerations from "gupnp-error.h" */
> #include "gupnp-error.h"
>
> I'll send this to upstream first. Lets see if this would work for all

you are on right path see a similar fix I did in past

https://gitlab.gnome.org/GNOME/gnome-online-accounts/-/merge_requests/125/c=
ommits

