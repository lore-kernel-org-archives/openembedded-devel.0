Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B5EC61DA4
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 17:35:28 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.13617.1678037724077109718
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Mar 2023 09:35:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qDNPexF5;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1755e639b65so9061025fac.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Mar 2023 09:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678037723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0BLjtlchCTkIghlFE6yf60PGa6eaZrWYM3oUGjoRN0=;
        b=qDNPexF5JmiHFKdu01uDcPCtZRXUjsHRXDOl1yeOVtFtoD6zN3FUhXttfS0jBEb8eH
         oOxeAwoJjxPPekjzI1PiXHj8f2WtSPUaBB1HQWiSfBhICjWvAv4WXAcO6+/6dg5x1Osj
         hjgAKZonkf2RreRYj7b1uTzpcsSAC8x+VOy9jgM5p4/KUEisHsrlFtzOEkkNF5ZcG7gg
         vY+PansVa+gs0pASPRsdjGrDuqtwx8nVd8a7+ZbefE3HV0xq4OH01BkT0s0Va2J2DsRM
         KBSxrM/B5CLTiL5I7iisyEXsdaYeLLvgpaSPqJkmQcNgMt6s3Y5N+2xyhL+h9Fezb5TR
         ul2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678037723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0BLjtlchCTkIghlFE6yf60PGa6eaZrWYM3oUGjoRN0=;
        b=qolAweIhBfc57I/1YRXNSwd3+mEJJAH/h1f0TbDIrDWQtSKBOy5pxnWLrMwlQSrhJI
         IgtfIMx93jlFqx9TBmVpv/jSFduNnuPTW6IAdgPQtDrdW85ovqIeyhi9zraxY07KeT2p
         iuRhO+OO4NFqcfh/TQwCZqTbUe7dk6Pqm0U7dgTygp2bx1/9sts+rB2QqBuLXm5TDhSJ
         d05rGwjrrgf+5goV0ngyJyoADuri8/QdLkeIxijPpRfQK6j3/g13oVRulOpu/73WAVls
         Xq573HutBrcv535yXR+G96p/PRmARfgOP5DPx4Gvx77b9nrdrXqIngkcRysdROQrpLKt
         P2Iw==
X-Gm-Message-State: AO0yUKWprVSvfcXztdJULBB97v10sEGWeCHnvuPcGb6H2MBp3g5NVRPy
	ChyhqbAK5OL/2TIvMmMvQlZwGaamXcMRtlA/KAQ=
X-Google-Smtp-Source: AK7set/MTwjjPxPbEupMzYphro6uCGjAqLjbWgdme7HHRvBeILwo3CJLq8zK2wkRXAoRbBXq4mFekCZganUqZEoo7R4=
X-Received: by 2002:a05:6870:d346:b0:176:42a5:a544 with SMTP id
 h6-20020a056870d34600b0017642a5a544mr2223806oag.2.1678037723293; Sun, 05 Mar
 2023 09:35:23 -0800 (PST)
MIME-Version: 1.0
References: <4fa9e7b0-618f-ce8f-dae2-ab075d0d7217@gmail.com>
In-Reply-To: <4fa9e7b0-618f-ce8f-dae2-ab075d0d7217@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 5 Mar 2023 09:34:57 -0800
Message-ID: <CAMKF1sqF6Pim9bJG9wPyJOBEMvFa+Yjkw2V=Xc=gtor14bUbDA@mail.gmail.com>
Subject: Re: langdale merge request March 5th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Mar 2023 17:35:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101387

merged thx Armin

On Sun, Mar 5, 2023 at 4:32=E2=80=AFAM akuster808 <akuster808@gmail.com> wr=
ote:
>
> The following changes since commit 30f4c2b3ae182513b967185e06bc8409a0ee60=
92:
>
>    mdns: use git fetcher (2023-02-15 08:02:50 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded langdale-next
>
> for you to fetch changes up to b5b732876da1885ecbab2aa45f80d7a3086c5262:
>
>    mpd: Upgrade to 0.23.12 release (2023-03-04 07:24:09 -0500)
>
> ----------------------------------------------------------------
> Geoff Parker (1):
>        python3-pillow: add tk to RDEPENDS ptest pkg only if x11 in
> DISTRO_FEATURES
>
> Khem Raj (2):
>        ncmpc: Upgrade to 0.47
>        mpd: Upgrade to 0.23.12 release
>
> Yogita Urade (1):
>        multipath-tools: fix CVE-2022-41974
>
>   .../musicpd/{mpd_0.23.9.bb =3D> mpd_0.23.12.bb} |   2 +-
>   ...1-SearchPage-use-regular-integer-to-fix-Wenum-constexp.patch | 37
> +++++++
>   .../recipes-multimedia/musicpd/{ncmpc_0.46.bb =3D> ncmpc_0.47.bb} |   3=
 +-
>   .../recipes-support/multipath-tools/files/CVE-2022-41974.patch  | 164
> ++++++++++++++++++++++++++++
>   .../recipes-support/multipath-tools/multipath-tools_0.8.4.bb    | 1 +
>   meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb     | 2 +-
>   6 files changed, 206 insertions(+), 3 deletions(-)
>   rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.23.9.bb =3D>
> mpd_0.23.12.bb} (98%)
>   create mode 100644
> meta-multimedia/recipes-multimedia/musicpd/ncmpc/0001-SearchPage-use-regu=
lar-integer-to-fix-Wenum-constexp.patch
>   rename meta-multimedia/recipes-multimedia/musicpd/{ncmpc_0.46.bb =3D>
> ncmpc_0.47.bb} (92%)
>   create mode 100644
> meta-oe/recipes-support/multipath-tools/files/CVE-2022-41974.patch

