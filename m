Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1403FC3DA64
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 15:06:51 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.9714.1722956809488047667
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 08:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c9JaUfit;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5c6661bca43so384165eaf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722956809; x=1723561609; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SajJDlR8nqd2y2j1OkoGjOoslxB/JJ6FsjY5phEIHgc=;
        b=c9JaUfitCltSlVoOXXeB+ir7W+iyImhqu59J/1ibrRsKGgjjAwjapkCFQGkHILlKI9
         Z3X1cMQg/yjUHtlcHY1b3EtWLnJMaKzmJBDZ5rn2gAsDLNslBmVKNXPS0syP+ahVf4AI
         W2vuBbSJU2DdlYSc8WTf/U1WffS2wY7O6TYG4aUgJbZUONfMZHgMs9E7HxEYMX4v1CwT
         xFiSF/1VM6Y/kluyORC7RcIYeZ8OKD7/Dn3GFRK5y17GePfdakIa7wiiPrlYC1V87Z+Q
         zrn6CIPHNpWWQ+7u86vyV/fRo4KF2GLa3upaxH38NHZvJvhHVmjI6gpwEq7tJUlfqS18
         +7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722956809; x=1723561609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SajJDlR8nqd2y2j1OkoGjOoslxB/JJ6FsjY5phEIHgc=;
        b=P/nWcGqf4ypYy57WYQWYJ3xk/0tTEcYwqvZfNbcx1jYcqwrC6NPSE2EKxHxyuZfX3Y
         IwxsRCGZRS0mp8d+bp1RS0cGnojZfE4HDHrvtdWYzc5/J0duBuoCAAjzI/7hY9hqfcIP
         8YuLlbVUTpBj2NZSKKO1/uX9lw3G2rDvND5Thv+lxrOS5NCVg/Q5L5sC9BNwMG3kPzdR
         Fq51PORp5/M3GG9/cKhypZJDWZLpcLeMkmdNBICqXGQiKiFxwapegWmooqr65zritUln
         85uUoelbGW7wlLI8O/puAWgXvWsTODi8/Qz4aoVngL3Kk4LjP8XGiaLjZKaspxy6++6/
         Ktfg==
X-Gm-Message-State: AOJu0Yzh5SLXOxfiFWaX8mXQvv4xxEeozm9aU4edMa3u2DHwricpLp/f
	cnpY2jPP9RQbzqqwYhDZx5QNIbK6pO8RujypHId7jAW/BUVvDmLVGZqoDB4FUAiW207d1No1kNC
	28ziwVUoosyWxxOlvHkI+/CzeWjtpDczG
X-Google-Smtp-Source: AGHT+IE3mF59Ns6x2Oxjpoz2Sc3shTTehzzwjb3swv1nXAuIOxU/kFG3K6yGcyjIeZGD0QAPL4VzQapLVwGzQwv3yuE=
X-Received: by 2002:a05:6870:b61b:b0:254:a753:d1c0 with SMTP id
 586e51a60fabf-26891ece96fmr19351777fac.48.1722956808792; Tue, 06 Aug 2024
 08:06:48 -0700 (PDT)
MIME-Version: 1.0
References: <174ac545-63e3-442e-9009-f106b59303a0@gmail.com>
In-Reply-To: <174ac545-63e3-442e-9009-f106b59303a0@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Aug 2024 08:06:23 -0700
Message-ID: <CAMKF1srV8c8jfHXbcPEkddg7vS1Y+J7e3-8yX62VXt29FtQTfg@mail.gmail.com>
Subject: Re: Kirkstone merge request Aug 3rd
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 15:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111585

it is now merged, thanks Armin

On Sat, Aug 3, 2024 at 8:46=E2=80=AFAM akuster808 <akuster808@gmail.com> wr=
ote:
>
> The following changes since commit 4052c97dc83d0c88fc277d6fc1815e0699020d=
aa:
>
>    xfce4-panel-profiles:fix tar error (2024-07-17 20:10:27 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 52ecd66835dcfd8b4e55c9cb6325908ccea6a4e7:
>
>    nss: fix failed test of nss. (2024-07-30 09:45:11 -0400)
>
> ----------------------------------------------------------------
> Emil Kronborg (1):
>        php-fpm: fix systemd
>
> Haixiao Yan (1):
>        nss: fix failed test of nss.
>
> Poonam Jadhav (1):
>        tcpreplay: Fix CVE-2023-4256
>
> Wang Mingyu (1):
>        php: Fix install conflict when enable multilib.
>
> Wentao Zhang (1):
>        nss: fix failed test of nss.
>
>   meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-4256.patch=
 |  27 ++++++++++++++
>   meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb |   4 ++-
>   meta-oe/recipes-devtools/php/php/php-fpm.service |  57
> +++++++++++++++++++++++++++---
>   meta-oe/recipes-devtools/php/php_8.1.29.bb |  25 +++++++++----
>   .../nss/0001-Bug-1750624-Pin-validation-date-for-PayPalEE-test-ce.patch=
 |  64 ++++++++++++++++++++++++++++++++++
>   .../nss/nss/regenerate_NameConstrain_test_certificates.tar.gz | Bin 0
> -> 10734 bytes
>   meta-oe/recipes-support/nss/nss_3.74.bb |   2 ++
>   7 files changed, 166 insertions(+), 13 deletions(-)
>   create mode 100644
> meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-4256.patch
>   create mode 100644
> meta-oe/recipes-support/nss/nss/0001-Bug-1750624-Pin-validation-date-for-=
PayPalEE-test-ce.patch
>   create mode 100644
> meta-oe/recipes-support/nss/nss/regenerate_NameConstrain_test_certificate=
s.tar.gz
>

