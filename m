Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8474DEB64DD
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 05:25:29 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.41731.1690176327446355896
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jul 2023 22:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=QdeA2ufy;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1bb75afeee3so273297fac.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Jul 2023 22:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690176327; x=1690781127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTbiKpR9xT+mSEj4mlF1wyQQgjSLoVLymKVfbQLcowM=;
        b=QdeA2ufyCrS67iO4Ji/FOrcUuJPbeY3pYXMDAdH2lc2sh9H1ndsTtiZVHjy/uVsg3Z
         HQn3FM4KQYURODhW6g38LoDB6JSEuno6flnsK8FknFt8ZQxkrJV/HMuRK67kh8HwagZk
         5KDZqeu9JWLj2EQ+jJ7+Up7SOj05YwDTR8qxBQvuKtaQ/cxugRCYYtI6FccUXd7y0GBg
         KYJkneM8vEyt3vZ8ELBK5G3XE8NadypxcwfvNTd0RBBwmLSBGA1q5012MWpDPXrODL4o
         lxEOlyGfXnYALAydRnLgFff3Nyqmx5gtwK0ZG+rSyfvpeig/P2R/0viDsvIBZ8hfzxUM
         AcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690176327; x=1690781127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTbiKpR9xT+mSEj4mlF1wyQQgjSLoVLymKVfbQLcowM=;
        b=DXkB5CR1pBFqaLeS2U0F3AOF0Vl+RlODDp7pVd9G7+banFWWkUJOEIl1fpjogQnBgG
         cZXsr90Fs7FOQ1mFA2y7w2dphRuCw20oX7+vqnGW2+jWehFJUCeDaMhd9Kmgy5QVvQv2
         s4Aejx+7Ko4ZA8yQoeM9lPyc9TEW3q9EhgcpWXl9Ha9o8blFAp+k5OalwEQcjNg4aNtD
         bHDc7zmqyCeikfLmseWoldVkTV+/36cQSevATKizpKj3IllmqBZvMAdpm8oLHRMJOnxH
         ttxmXjGM0KKuNhZkXRXmxQFuXAX2M7wjHxS6xps5QtJGfoGKP9j6RqtCMUhBuhs98cZD
         S6Zg==
X-Gm-Message-State: ABy/qLYwJYCkEyzX/BVLJlMU7Pq9F5OqJRath34NoeU/+sdv5Z/H/HU0
	Aeuf1vo9f5fVl2miA5RnJTurTVc6nW/l3HajCinkOojtN08=
X-Google-Smtp-Source: APBJJlExyS+QGdaHUEnrWdq1bdTcYfWZHoAj2uwXJ+d+Iy6/1XsBVX6b6h7AM2170em9JxwFQmsA78CI+wgCdPvXNIY=
X-Received: by 2002:a05:6870:e253:b0:1b0:25b4:4b77 with SMTP id
 d19-20020a056870e25300b001b025b44b77mr11523784oac.14.1690176326529; Sun, 23
 Jul 2023 22:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <549b6ba3-84d8-a884-202d-d0a594e9e174@gmail.com>
In-Reply-To: <549b6ba3-84d8-a884-202d-d0a594e9e174@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Jul 2023 22:25:00 -0700
Message-ID: <CAMKF1so02SUKVrvEG2k1kTb7gi2tRPUayhbYqpEoQedLm+uD-Q@mail.gmail.com>
Subject: Re: Dunfell pull request; July 23rd
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 05:25:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103991

merged thanks Armin

On Sun, Jul 23, 2023 at 8:57=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit b5282ece919f016d91a1043769676efb02b4f0=
fb:
>
>    openldap: fix CVE-2021-27212 Assertion failure in slapd (2023-07-14
> 07:08:54 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to b8b0b06821d4d4df0cce4f07fa31a8ca1dd38f46:
>
>    sysdig: Depend on system libb64 (2023-07-22 07:49:35 -0400)
>
> ----------------------------------------------------------------
> Alexander Thoma (1):
>        Fix tigervnc crash due to missing xkbcomp rdepends
>
> Khem Raj (2):
>        libb64: Add recipe
>        sysdig: Depend on system libb64
>
>   meta-oe/recipes-extended/sysdig/sysdig_git.bb                   | 3 +-
>   meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb            | 2 +-
>   .../libb64/libb64/0001-example-Do-not-run-the-tests.patch       | 27
> ++++++++++
>   .../libb64/libb64/0002-use-BUFSIZ-as-buffer-size.patch          | 57
> +++++++++++++++++++++
>   .../libb64/libb64/0003-fix-integer-overflows.patch              | 77
> +++++++++++++++++++++++++++++
>   .../libb64/libb64/0004-Fix-off-by-one-error.patch               | 26
> ++++++++++
>   .../libb64/libb64/0005-make-overriding-CFLAGS-possible.patch    | 40
> +++++++++++++++
>   .../libb64/0006-do-not-export-the-CHARS_PER_LINE-variable.patch | 27
> ++++++++++
>   ...7-initialize-encoder-decoder-state-in-the-constructors.patch | 44
> +++++++++++++++++
>   meta-oe/recipes-support/libb64/libb64_1.2.1.bb                  | 39
> +++++++++++++++
>   10 files changed, 339 insertions(+), 3 deletions(-)
>   create mode 100644
> meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the-tests.p=
atch
>   create mode 100644
> meta-oe/recipes-support/libb64/libb64/0002-use-BUFSIZ-as-buffer-size.patc=
h
>   create mode 100644
> meta-oe/recipes-support/libb64/libb64/0003-fix-integer-overflows.patch
>   create mode 100644
> meta-oe/recipes-support/libb64/libb64/0004-Fix-off-by-one-error.patch
>   create mode 100644
> meta-oe/recipes-support/libb64/libb64/0005-make-overriding-CFLAGS-possibl=
e.patch
>   create mode 100644
> meta-oe/recipes-support/libb64/libb64/0006-do-not-export-the-CHARS_PER_LI=
NE-variable.patch
>   create mode 100644
> meta-oe/recipes-support/libb64/libb64/0007-initialize-encoder-decoder-sta=
te-in-the-constructors.patch
>   create mode 100644 meta-oe/recipes-support/libb64/libb64_1.2.1.bb
>

