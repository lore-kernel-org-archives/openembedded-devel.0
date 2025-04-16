Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A82C9C369C5
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 20:00:56 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.29278.1744833650911649107
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 13:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=md3iT6ao;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3ff0df81fdbso2810324b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 13:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744833650; x=1745438450; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IlSCO5ONFP9RguRTbEppvCykN7VTKOSO3rlrwvdtLqk=;
        b=md3iT6ao34RJzGDBcKTrZZGy2t35RlkZ7quvCmyaxXPKXP94QpsH3U6WrEqfY82ibm
         OMglRrOJCwvrC805pYwVyYZLaCSOLLj1vJtiGwNwQ8nBnwswJozEuxTSjs10ZsW+O4tA
         vBBTgH1Rw4+zazdUc0x4KhZ8Hvs/qWIl0x31+PF+J7lhiGf1OghH6xiXOftvaxu/6xOh
         fJxxOr5jnvybDF4K0+S2y65RH82vMk/R+bYo6VD1tIasbbxdvDOAQ6HFcNauJVVJP4wr
         pfABRhO5KitQX5iMpHa0EFewQ7Q2si3LQFmUAL0R7+xdT7ZiqlF0wgA+JgoIKA7UbIFI
         EQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744833650; x=1745438450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IlSCO5ONFP9RguRTbEppvCykN7VTKOSO3rlrwvdtLqk=;
        b=v0gTrD48BRwoknp6nRD+LIL6pOxA18sjxaA0f+XzgYnJdXLGH4p4ZyjZBPTmCaRswu
         G3mj25aeLSKLrRyMKI2A4Bmg81fzMEKX41WKW9aFeIpWpvBPfNf44qZArtzaeucC7h2S
         6kAtAzXH/ssDMshDsidV2BxLjdbCHdx4keksBAJzmy1bCUr5MTUhKVUjXxNgoUvPszlA
         4HGIue0S+harORcbJ5jX3YAP+dGOIy87Bd98Ap/zNXDevPMWBbnyYyIgdLR78tpUUUXU
         aPP/yaV068noybyuISH6it3yh5p6tMnqx0RCaZ/OlVKSUrbtuooHrT7sGEF+YieIdMoZ
         V6Og==
X-Gm-Message-State: AOJu0YxDqCMkjUXaoP4F2hn0/ayBQewBxFEUGoHqUau8s7OX4+v8mh5L
	Z3THbJcAef2FUV2V49Hj5b2+TG2aykvV33tiuug0WJQs2NsTjpX+KV9N5HRzvPRgol9pXdyQkif
	+8SRcjkVExSUGosILOemC+ubh910=
X-Gm-Gg: ASbGncuqMEByG0CHK8flgsXR8aYvDbRd7uOS/QOu8DMRHd3AltxeP22/wVOIQ4bmY2V
	gasKB7eCO4CmptIf4UJPCbUzmFWIsMP2EV9cZm7AB+D+VCRPtZsDybdJIIISbR1fsMfpnnL4D3z
	hFG9amIArerZOUjgcl4rahnlbyTwPgr0XfLj68DSultKCGFNt4/3Q=
X-Google-Smtp-Source: AGHT+IE4rmaFnbHNStY32pIiEW47QgMBOdSwxbj/gwDFDBh3ooekNZItKI+q6tiIuhUGpyHPLpI1WTqNAGVeff5mQq8=
X-Received: by 2002:a05:6808:191e:b0:3fe:b0ad:f935 with SMTP id
 5614622812f47-400b01c2228mr2159291b6e.4.1744833650035; Wed, 16 Apr 2025
 13:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com> <1744794136-908-23-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1744794136-908-23-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Apr 2025 13:00:23 -0700
X-Gm-Features: ATxdqUGs8m2TuQpGdy8t5DlCd_NhuUV-dtS0FjQphmFvJzz8jDQVjOW5r4ga2Bc
Message-ID: <CAMKF1sqEC=7Ra4Y5g7=tp1o=e8dLL-Fmge=HYZpfmPQU2bEVJQ@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 23/31] python3-pymodbus: upgrade 3.8.6
 -> 3.9.1
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 20:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116912

I have taken Leon's patch instead

On Wed, Apr 16, 2025 at 2:02=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-pymodbus_3.8.6.bb =3D> python3-pymodbus_3.9.1.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-pymodbus_3.8.6.bb =
=3D> python3-pymodbus_3.9.1.bb} (90%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.8.6.b=
b b/meta-python/recipes-devtools/python/python3-pymodbus_3.9.1.bb
> similarity index 90%
> rename from meta-python/recipes-devtools/python/python3-pymodbus_3.8.6.bb
> rename to meta-python/recipes-devtools/python/python3-pymodbus_3.9.1.bb
> index 200e75748d..d969165a54 100644
> --- a/meta-python/recipes-devtools/python/python3-pymodbus_3.8.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.9.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/riptideio/pymodbus/"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Deba8057aa82c058d2042b4b0a0e9c=
c63"
>
> -SRC_URI[sha256sum] =3D "7689b56cc3ad05a594e1486e772abb9d9646c01737935df4=
92db04455680baf6"
> +SRC_URI[sha256sum] =3D "ec6216f218dd7e370fa43692535ee5268adb6b1cf7037dda=
6c78ac92c9a43a84"
>
>  inherit pypi python_setuptools_build_meta
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116888): https://lists.openembedded.org/g/openembedde=
d-devel/message/116888
> Mute This Topic: https://lists.openembedded.org/mt/112291822/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

