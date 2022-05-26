Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D044C433EF
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 04:05:50 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.15890.1653537942334152259
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 May 2022 21:05:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n1xPzzNF;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id e2so807628qvq.13
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 May 2022 21:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5H9ZJQk4v3GbRsrYi/FdcmpdhTpKh31aShfQjTtXgWM=;
        b=n1xPzzNFo28R+ihvDg6BESiplg6JrFeD/wFyaF28LLakOsqGlmpl6dblU/g57CzHaK
         NfDOzqEbNh0brI/mkBKBfNIJBZWVBDU/ZZJQ3WupgeA/PSE+m/vGa+DKlgKPU6D+0XY6
         47a/B6aTrAkqxMLw4zeN+9eIRuvwCyo5nErWZiwO0sjkxQA9o1MpRLpP25nUzNHO9qZZ
         e38oUrDGhAGJ2OvPLQEvxIQYs06+S4WULl9NHoCobm2psRMNWAGSqOYZaD5n1Dwwmjj8
         apSPGj2L7npq8d0Olo24vtK7AHlb7th1grOjE/vkzfewwlqQyrkcf02CrzDpWigg7PJK
         3Oow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5H9ZJQk4v3GbRsrYi/FdcmpdhTpKh31aShfQjTtXgWM=;
        b=5nwKbvs9lSHjmGpCz2FxdVWibEBF0QltZMIDV7mzPbmo2PJWs/dIra7ujs453g+KRo
         0xCvm+KNWLihxfsLJdQdMBKl+Ykgakr0/vU09JXDrvjS1jKOcd93SLi0RHpqseidcQxS
         et8vZGyYNx7Gf38CSZ9lblQApokWixiRdyUqDOf/wjwaawq5X+oSVyqn4D1VC/L/Zo0R
         Y10i0/ZnsaA1o0b8hniSRIBnVUDK5mxKRJY2LsI9+oM3mpnCfNnyolLJx2OXfikkc9q6
         7gi8Fh0b+0z8l05ZZ2RUaFgY+ISXm96mbDln9TRHO5NaTGIDMV75TPZ5am5PDbor1z0K
         fqTw==
X-Gm-Message-State: AOAM533pQTzl+CcUy9OyPAq4NHzdJi4ZIt5E0KTUth/qy5hHDU7ezC1k
	cgMrFUtA6nOGhCiRVKLV0hAB0jyb7+q7nuuEC+w=
X-Google-Smtp-Source: 
 ABdhPJyeeCybN3aYy3aXi7AlGXmx3Rqs0XSzc+mTJAW7eUAtz4/JQh8yktZaoHd9Kb+0migaMZbQGuSMrmDh+3q5WLE=
X-Received: by 2002:a05:6214:500b:b0:461:e282:181 with SMTP id
 jo11-20020a056214500b00b00461e2820181mr29005731qvb.24.1653537941331; Wed, 25
 May 2022 21:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <5ddded5e-ce0b-2ab1-d72f-8e7842420fe2@gmail.com>
In-Reply-To: <5ddded5e-ce0b-2ab1-d72f-8e7842420fe2@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 May 2022 21:05:14 -0700
Message-ID: 
 <CAMKF1sq+asPKOhdA-i+-=rE-aj7mXuvY9oBCpj5O7fzCQphZZw@mail.gmail.com>
Subject: Re: Honister merge request: May 25th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 May 2022 04:05:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97276

merged thanks

On Wed, May 25, 2022 at 7:20 PM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 9a0caf5b09e14a28a54c3f8524d97530aeb8152c:
>
>    zabbix: Fix sereval CVEs (2022-04-16 09:48:15 -0700)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded honister-next
>
> for you to fetch changes up to 0e6c34f82ca4d43cbca3754c5fe37c5b3bdd0f37:
>
>    ostree: prevent ostree-native depending on target virtual/kernel to
> provide kernel-module-overlay (2022-05-23 07:43:39 -0700)
>
> ----------------------------------------------------------------
> Martin Jansa (1):
>        ostree: prevent ostree-native depending on target virtual/kernel
> to provide kernel-module-overlay
>
> Nicolas Dechesne (1):
>        imlib2: update SRC_URI
>
>   meta-oe/recipes-extended/ostree/ostree_2021.3.bb | 2 +-
>   meta-oe/recipes-graphics/imlib2/imlib2_git.bb    | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>

