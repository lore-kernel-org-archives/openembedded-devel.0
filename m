Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D30C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 16:29:43 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web08.416.1667838577361562854
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 08:29:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EgkkO9Fh;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id c129so12733477oia.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPj8GifNYYpSzOAMFln7FZqdyl/8Nq7/vxoFqWiDlEk=;
        b=EgkkO9FhXsDoW8/5R3/S1obhQ/UkytYqujH7jRC/wsPZMVX0O0zDoe7FPSiUoPlQ82
         jlwJI7E12OgpTQ0CcjFXdC74zraAOHWnhfN2D9Tm8Sc5iq0j4f8qS32tcVOY/VjEW+Up
         LRrFE4X2UG9T40DpHmRBbpUTdN06rr/AiENR/66557/rf06kyGvLigDSQOk/ffUjVH6u
         /MlwTgSSDwtNGHX8CZNLu6yo0gdluvNtRP/Ixl3w4/q09lRSdGfQPh+0eHjKwu+BIM8M
         xEZqXTCJuGbipMK8ybPG6ktWssMwGYBoRjsbur8yNnv0cZeR7vuQaz8ZHcIZ7BZ3BXJU
         WZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPj8GifNYYpSzOAMFln7FZqdyl/8Nq7/vxoFqWiDlEk=;
        b=kGM6WAlHc9RN4gHF8/60t82Ic59od3P7+PBXVlKVvZw+xd7t+zuIcx3y72z55r76aa
         k1oxa+0QzU14AqDO+Fuo+Q0EwRjWuHipqnuk7x0orsfjVCRGD6eIdAbaakRhkrsz7WHV
         hn2f5FeH2Tp90YEsRw6BSR8PQVjcshEqCVY9R03YWLSH0t4ovpussCiI3gT3NdGV/1L7
         eQnosG+mnPGhsSEmcYGS4nsPoT6BDYLmtNaswN+1icHsbRR6BFd2i+sePH800oo5hLAz
         hkrR7Nd2jwrXQEpBCJ1+1uBRmQWq4wPB6z467M3juznnejxPhSolZn9f5juBUWTdEvwa
         DrgQ==
X-Gm-Message-State: ACrzQf0iiGTuVZ6sYgrW7qobLoNx7Wo5YVA4e6vymf8bkoc7sOS92pOh
	nJ4vERJy2dudBgQeCeLMMgUCy5COseXn15wGb84=
X-Google-Smtp-Source: AMsMyM64vymAU+9Cdrf+rxLa0xGsFebTK5ASUTopj2WGVXJq3a6QxcLgRFtCazTzfY2BjhI48lqKn5STqkGAILgVHls=
X-Received: by 2002:a05:6808:20a0:b0:359:e4d6:8bd3 with SMTP id
 s32-20020a05680820a000b00359e4d68bd3mr26865966oiw.262.1667838576487; Mon, 07
 Nov 2022 08:29:36 -0800 (PST)
MIME-Version: 1.0
References: <3e7cf342-f958-dfad-cc82-a29528f0dab3@gmail.com>
In-Reply-To: <3e7cf342-f958-dfad-cc82-a29528f0dab3@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Nov 2022 08:29:10 -0800
Message-ID: <CAMKF1sqfp_eyHhXmccWUUn=-p6jKDgCjWkS=h2NTwaJrVq_zwA@mail.gmail.com>
Subject: Re: kirkstone merge request.
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 16:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99473

merged thanks Armin.

On Sat, Nov 5, 2022 at 10:38 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 744a4b6eda88b9a9ca1cf0df6e18be384d9054=
e3:
>
>    frr: Security fix CVE-2022-37032 (2022-10-13 10:59:41 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 50d4a8d2a983a68383ef1ffec2c8e21adf0c1a79:
>
>    re2: fix branch name from master to main (2022-11-02 06:50:29 -0400)
>
> ----------------------------------------------------------------
> Alexander Thoma (1):
>        Fix tigervnc crash due to missing xkbcomp rdepends
>
> Carsten B=C3=A4cker (1):
>        spdlog: Fix CMake flag
>
> Chase Qi (1):
>        kernel-selftest: install kselftest runner
>
> Howard Cochran (1):
>        ufw: Fix "could not find required binary 'iptables'"
>
> Martin Jansa (1):
>        re2: fix branch name from master to main
>
> Philippe Coval (1):
>        pim435: Relocate sources to eclipse
>
>   meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb    | 4 ++--
>   meta-oe/recipes-core/pim435/pim435_git.bb                 | 4 ++--
>   meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb      | 2 +-
>   meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 8 +++++++-
>   meta-oe/recipes-support/re2/re2_2020.11.01.bb             | 2 +-
>   meta-oe/recipes-support/spdlog/spdlog_1.9.2.bb            | 4 ++--
>   6 files changed, 15 insertions(+), 9 deletions(-)
>

