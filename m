Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77842C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 15:25:05 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web09.29209.1653319503782087931
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 08:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PCc9UEiJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id t2so8804693qkb.12
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 08:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bnKU2g8DUw42y6/Okps5X4vMtAcd7Z5w3TJBKQwrK3s=;
        b=PCc9UEiJLERUqoCsCZ4i5M5QbfvRCo0hD1VpzZPNJ5M/lo0XE6//qdWJNwbSpGDmOV
         hctindnTzJSHTTbN7mDgl9y0HdPpYd83duenAaLuu2hAvlTFHKRZN/t6Bd7tYXkjuQDT
         v/t8cgNRQ633aC17EfaKmCM/dU2uTZ7DaS9xBpgXz3GA49D20abYycYiLw+wFwNYEnVU
         rPz71ZPYoUOq/yjCR+OK10C9GVXJfyssjAKAYvu2qyxFMhONxkanTw/1HQEDGrgZvgR9
         o5SKuGK7QUuXFcYuP5TtLpjdoHCferR91WVDwTa9hRz95gwkyghPvi+SayiOMecnXynA
         xO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bnKU2g8DUw42y6/Okps5X4vMtAcd7Z5w3TJBKQwrK3s=;
        b=SBYGWYjYmx9NRMrL4URcDkiR1aLPivPnvp0uOOel2OsH2p7yV7iiA/mudIte08j5XQ
         TbjvoEl4fjM+Nnts5FV5UVG6uVHVLPZgJ77/xvbKbEfR94MuB577+0sfZYr6Hlq7liZS
         QtvUgUUMFBMK+lRUmgA9LRE5gFObXFe95/Uj0DxxAueSf214TcmPK1PT9dUaB8FdrPP/
         wuiK/4JU3IYmFsgsuKMlbLC5/tkW+x7joUBz/hTccIFGpK5gI9spoW+pMJsiZSkDRvS0
         p4hAWL05Q3thqeMmKncWSwSP07Kc2jWekPqy4DjsiiuAEnaXY3rt63oQwSx24w3N16oc
         jLuw==
X-Gm-Message-State: AOAM5327wJgJvX8aOMDgobQp8Z+7RQOlniPfKoDBCudsl5734pISnLDc
	OeOqtG9LI9S9xJ7MTf4rlPyQFRLVRZKzp3cj84M=
X-Google-Smtp-Source: 
 ABdhPJzV+Du2u9X8q9IMZuq5wqzLhjjSbLRsYlQQ7Ric44jQIdKBJg5nyQUwjP2wYPGsMsXjRRLWhVnaDtgOKyhzcqk=
X-Received: by 2002:a37:67cc:0:b0:6a3:66a2:aaf6 with SMTP id
 b195-20020a3767cc000000b006a366a2aaf6mr6884092qkc.72.1653319502800; Mon, 23
 May 2022 08:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <d7e11c08-5752-3339-1136-1f994b017f3f@gmail.com>
In-Reply-To: <d7e11c08-5752-3339-1136-1f994b017f3f@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 May 2022 08:24:36 -0700
Message-ID: 
 <CAMKF1so_d=bvwExMukYwBTEQ0frzFfGFijEmjADXjoRvkZ8Vcw@mail.gmail.com>
Subject: Re: kirkstone merge request: May 23rd
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 May 2022 15:25:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97234

merged thanks.

On Mon, May 23, 2022 at 7:42 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 166ef8dbb14ad98b2094a77fcf352f6c63d5abf2:
>
>    minidlna: fix obsolete license warning (2022-05-17 05:57:10 -0700)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 0b78362654262145415df8211052442823b9ec9b:
>
>    bats: upgrade 1.6.0 -> 1.6.1 (2022-05-23 07:39:02 -0700)
>
> ----------------------------------------------------------------
> Diego Sueiro (1):
>        bats: upgrade 1.6.0 -> 1.6.1
>
> Kai Kang (1):
>        conntrack-tools: fix postinst script
>
> Martin Jansa (1):
>        ostree: prevent ostree-native depending on target virtual/kernel
> to provide kernel-module-overlay
>
> Nicolas Dechesne (1):
>        imlib2: update SRC_URI
>
> Richard Neill (1):
>        bats: Add patch to fix false-negatives caused by teardown code
>
>   meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb | 4 ++--
>   meta-oe/recipes-extended/ostree/ostree_2021.6.bb | 2 +-
>   meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 2 +-
>   meta-oe/recipes-test/bats/{bats_1.6.0.bb =>
> bats_1.6.1.bb}              | 9 ++++++---
>   4 files changed, 10 insertions(+), 7 deletions(-)
>   rename meta-oe/recipes-test/bats/{bats_1.6.0.bb => bats_1.6.1.bb} (85%)
>

