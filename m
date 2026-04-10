Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88EEDE9907E
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 10:37:41 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.153222.1775817456798568144
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2026 03:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=L+C7JGWm;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a2b542cbaaso2133904e87.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 03:37:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775817455; cv=none;
        d=google.com; s=arc-20240605;
        b=gt88aturawkMZ6eRO6ecNK+aENObthLmX7TqoDpxgfcO5Pnf4gU89hi6hr92PhUbSh
         w1fWFb5a19RU0SfYkbNfiySnUoiSMkZkkweAaaxdUOjwUnw7CDx6uvzOcSSe7/+SXr5F
         cogg4z0Pp1F0LXgy7RBPjaT8nUmPKtaXKKtgEdUJq6WQQqvGml9+gGvBxgekXMyrLn4w
         5okVp8Vjd2utSQCua6PQKfhlA7N8jF2J8C1Hi5RbI9vaN2MI2HowkdNjF5tTH+5cmPaU
         eMvo57UCpHIv99BYFJaqxTcK2S27ZkruHi2vJsTFFeL4sEtoriCe3AkTfX0CynBh9Gef
         GjhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/i41PxWJX43lZ6youlxrYt7jz+W8vyUXxR7M7m5Q2cg=;
        fh=xc7Pw1C2r64/D3IAczFTr6Vs+3vKL6I7LfJKgO2Lfwc=;
        b=O1Xp2vWdeKcg06Iw9CXcQXAq4EKPgSeDpRvZZC6gRexbQCgNkFCjzmu4ReLZlzzuIL
         d9cjlm78yCjeeV75XrbFPzUFaWeQBgzgNF529rL20i99XdxC0321WZt+jgahiuZsnj9x
         REujBiHjJC8C9JbF49AkDGRO1Yi3drnRuLauQp7IFyLDKOYb/eLC2+V6DN31ovsh6FOH
         J+BUowBNCE2LXu2BAKFvjZGuM6AH6H6QSWHZpHy+IediQWtcj66PwPknFLZH9rVJVC5A
         VU98Dl136+74hSwbILhfeNJqt7k4PxMsO82nYJ7On3shAVmHORUvztQrPmycV8qutsx9
         fmEA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775817455; x=1776422255; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/i41PxWJX43lZ6youlxrYt7jz+W8vyUXxR7M7m5Q2cg=;
        b=L+C7JGWmlXdRPiYqlTJP8Ky0QzWcBix8ISV7dgzYaFuuQK4qPBfwqF7ryjpIOUvSB7
         bsIxazoQYZDMR3fmnLAs5iWa4sYpwBk1Puo4FzTsW9tDqQMTqf2VOWOdbP5kGT91+u4U
         UpdkxQALMg2QJy+/1fy3AxCeHOMbrZuXlAfb1wQ9je0rSvqhHjFMSNf8W3CpmK4dKvTp
         rOXo1RksQUxMCXjS9+gMBni9S3CdUUqNBy9xELMDA22fg0j2ZbGnPMYI+6tj/+48UP5S
         PFWUhS28eFCzxHM/64ra3DmFpb2pf0UEHB76JWfOywXnodBV7Frhj6p893GHCSN25v7O
         /lXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775817455; x=1776422255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/i41PxWJX43lZ6youlxrYt7jz+W8vyUXxR7M7m5Q2cg=;
        b=Yz4urE58PleBAJmGtBnjCaYvrUKg59tiV1fLdvYIPN4HqAA/P9oTY6M8pu41r3v8ln
         u7O/j83RtpqmCmNxC6eylPw7fvHN6ewh1E5f31Tlj1Vg7WFP0GHlXnl9+VnCiy5fJ4iJ
         b54rRQXgDOlSx1eqjbrFXoZAJZQvxKzorj1W3BEiQWz1V+MXasLgYaIdvxFF0rm2vxXm
         TWbgAH3hWNyTo4Fa5danG6mX+Nw1NYRNIhXoK+gI5oNPwWi6khAo/DsgdBssvJrC02Ti
         ANC0jLC0ib4tYjvB+GnmNFgbbJbSCrFVj15BaaWgGKRJlqjxPWqi0Jo63MrHCBaKp8ix
         LiWA==
X-Gm-Message-State: AOJu0YySKMUnLgHjjjy+Q/m9l7Dj7ADfL63zlya2/6WbjS7pbl0kAL1t
	05WG7a6SJXsuQv6P3ING94JuDnwVavEGGve1TgYIgM/rj+F4UBnYIs8NjXN09cUwHtGdJ+L4r67
	SbYJr6hmkqHoU0RSy5kXbYqPB6UnT7nDiAw==
X-Gm-Gg: AeBDiesSzx1nk7Kq+jYbrpJkhEg201IiV0FaGfxJmXtjUngME8n4gKlBN6s6wIzfl3b
	awpfzWeyLrsIxTXKE/sjbYPqNM0kXB3lypW9dfdYVjI4Vb4oLH0Yzi1oC3eXLcXNSyAGeAzufAd
	ZvJNO7ZBgz34TGw+v1jLZHsIGT90VEnSONfycvM0k5uGVz7g/RetHPFFFeZiup2cSOLqmTaavbd
	2k6mfbok8pPL5wuODfYuGBoRCsrf6KPXpqSNYBA9IIIngFv84FmCMnSAWxLPd2bRcY/i5eTcJ5/
	92nDcjbzKjW/ng1/T0aVsH1E1868mRuV9KdZieRtgU/pfvJxbZ46V06gzAqYC5fZNw==
X-Received: by 2002:a05:6512:3b99:b0:5a2:961a:f7c6 with SMTP id
 2adb3069b0e04-5a3efd97e46mr988175e87.39.1775817454764; Fri, 10 Apr 2026
 03:37:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260410102704.1621-1-wangmy@fujitsu.com>
In-Reply-To: <20260410102704.1621-1-wangmy@fujitsu.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 10 Apr 2026 12:37:20 +0200
X-Gm-Features: AQROBzD0HVX-WCHL04eXxrhLPWsSbqNV7CoruxrsVbMMImmLWrUD862fNtEV_so
Message-ID: <CA+chaQe4OAcr=Wd18C9EYM+9-Y4NVr-Ef9S6saVL=s-UHzvYog@mail.gmail.com>
Subject: Re: [oe] [meta-networking] [PATCH] dovecot: Fix checksum mismatch
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 10:37:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126240

On Fri, Apr 10, 2026 at 12:27=E2=80=AFPM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Update the sha256sum to match the current upstream archive.

Can you please check what changed in the archive and explain it in the
commit message?

You might also need to set downloadfilename in SRC_URI to avoid
reusing old archive from PREMIRROR (and failing because the checksum
won't match).

In the end we should ask upstream not to re-create the existing
releases if it was intentionally modified in the first place.

Cheers,

