Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3CCC3DA64
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 15:06:31 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.9708.1722956786485615398
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 08:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hYtiyZ+0;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-26827ec5235so376001fac.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722956786; x=1723561586; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juBMqujSMMNAYsjx8NT3YpGXLOllqCe9WAyxrhFzLGc=;
        b=hYtiyZ+0z+hcCZSUM9iGOO/xgmE3uYeCR0QLKToki+vhNa9R3ja85Fx42qgkb4aiQh
         kftJ6Xw3HBlJgELU5t5B5ISgBI8OciWhOtWiRnv36DwW8DSZIE0iOfStfOfJvnin6Uxz
         FEuyiUXeXkKnQcoilX0yHJIQjCX01Uq4ad3fnff2R+BLd1CcO6y2+AEqI0y2/F3rnxvC
         phBgB59UTty0gLm6vzXCFucTV357kfyjGDbEjzErm/mKbEHBXBjU6rgW9jjuqZ5h9FHU
         0PQWE5hDVivlDw1tZm7GpLSAaDhzOuHxQceaHv1HTfLqbf6pjcN3B8jfBO2mchNtBCQB
         EIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722956786; x=1723561586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juBMqujSMMNAYsjx8NT3YpGXLOllqCe9WAyxrhFzLGc=;
        b=bPLodAIc38eHXwsJj0p6OqjWR1/i338OIFAermeipWNVYTgTHcIuTR5ek4/0w9eNmF
         WlJg9VljUphVZk8KN+ldF9xbRKELLzMQx/QveVjMf6bBjuv/ixtQqX9a/1eifxIKuNWs
         a0hNybdZTODbcWrKw3KBDz8sSbWd1qkOAIXtxjLk+iANcvApTdHeKtQhVduq0aLDFFkZ
         hZg5JlYsYdAZSuQB1eMP9GpqJFgCGyMXhva2V8pzkTOLJ+MVIsbkbIjkNATkOUNcp0Vf
         Q1sLwxh/VNIfsyDju4dD0D9/yE4KKw9hsJJK3BUBSdiqg3d2ltLya4QxXC2nNmr1DTuZ
         Wjug==
X-Gm-Message-State: AOJu0YyFAcCJhIpQJAIJwZzblzLaGaMCQieJYiEQgAW6db6wOz2pWs8G
	832Uyi7TmJjlVkCk2hQC3IcPDJgG+o5frKpHkcogDnjX3Kd6lke81uclPSs4bHLGelz21FX0GzF
	AaFeEf4iVMnuKLiXjm8AHSiH4nWE=
X-Google-Smtp-Source: AGHT+IEIfJP7xRyG3fsvlDI2peGBkue1MqKGbWTpz3/gwgywxxpW9H8xfMv9fj68nIA20nnaL1D/+GW7hYe/c/4Z0P4=
X-Received: by 2002:a05:6871:5d3:b0:260:71c4:f33a with SMTP id
 586e51a60fabf-26891ea94cfmr19488898fac.39.1722956785576; Tue, 06 Aug 2024
 08:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <94a40b8b-36f1-4af0-a452-f3c8f58ec389@gmail.com>
In-Reply-To: <94a40b8b-36f1-4af0-a452-f3c8f58ec389@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Aug 2024 08:05:59 -0700
Message-ID: <CAMKF1sr=34CMzY8TaZv17iwG=LDdF4D-dmaPyBWFtSXvFnS2Fw@mail.gmail.com>
Subject: Re: scarthgap merge request: Aug 6th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 15:06:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111584

merged now, thanks Armin

On Tue, Aug 6, 2024 at 5:09=E2=80=AFAM akuster808 <akuster808@gmail.com> wr=
ote:
>
> The following changes since commit 80e01188fa822d87d301ee71973c462d7a8654=
93:
>
>    nftables: change ptest output format (2024-07-23 15:24:57 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded scarthgap-next
>
> for you to fetch changes up to 2338409efc51cf2022ff5610a9fb689251706e2b:
>
>    python3-pydantic-core: Fix build with python 3.12.4 (2024-08-03
> 12:25:17 -0400)
>
> ----------------------------------------------------------------
> Barry Grussling (1):
>        postgresql: Break perl RDEPENDS
>
> Benjamin Sz=C5=91ke (1):
>        tree: fix broken links
>
> Chen Qi (1):
>        python3-protobuf: remove useless and problematic .pth file
>
> Etienne Cordonnier (2):
>        uutils-coreutils: upgrade 0.0.25 -> 0.0.26
>        uutils-coreutils: upgrade 0.0.26 -> 0.0.27
>
> Khem Raj (1):
>        python3-pydantic-core: Fix build with python 3.12.4
>
> Poonam Jadhav (1):
>        tcpreplay: Fix CVE-2023-4256
>
> Siddharth Doshi (1):
>        apache2: Upgrade 2.4.60 -> 2.4.62
>
> Soumya Sambu (2):
>        python3-sqlparse: Fix CVE-2024-4340
>        python3-werkzeug: upgrade 3.0.1 -> 3.0.3
>
> Wang Mingyu (1):
>        python3-email-validator: upgrade 2.1.0 -> 2.1.1
>
> Yogita Urade (2):
>        graphviz: fix CVE-2023-46045
>        hdf5: upgrade to 1.14.4
>
> Zhang Peng (1):
>        hiredis: remove ANSI color from ptest result
>
>   .../recipes-support/tcpreplay/tcpreplay/CVE-2023-4256.patch     | 27 ++=
+
>   meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb    | 1 +
>   .../recipes-core/uutils-coreutils/uutils-coreutils-crates.inc   | 288
> +++++++++++++++++-----------
>   .../{uutils-coreutils_0.0.25.bb =3D> uutils-coreutils_0.0.27.bb} |   2 =
+-
>   meta-oe/recipes-dbs/postgresql/postgresql.inc                   | 10 +-
>   meta-oe/recipes-extended/hiredis/hiredis/run-ptest              | 12 +-
>   .../graphviz/graphviz/CVE-2023-46045-0001.patch                 | 37 ++=
++
>   .../graphviz/graphviz/CVE-2023-46045-0002.patch                 | 38 ++=
++
>   .../graphviz/graphviz/CVE-2023-46045-0003.patch                 | 33 ++=
++
>   meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb             | 3 +
>   .../hdf5/files/0001-cmake-remove-build-flags.patch              | 41 +-=
--
>   .../recipes-support/hdf5/{hdf5_1.14.2.bb =3D> hdf5_1.14.4-3.bb} |  13 +=
-
>   meta-oe/recipes-support/tree/tree_2.1.1.bb                      | 4 +-
>   ...mail-validator_2.1.0.bb =3D> python3-email-validator_2.1.1.bb} |   4=
 +-
>   meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb  | 8 +
>   .../0001-Fix-generate_self_schema-for-Python-3.12-1299.patch    | 29 ++=
+
>   .../recipes-devtools/python/python3-pydantic-core_2.16.3.bb     | 3 +-
>   .../python/python3-sqlparse/CVE-2024-4340.patch                 | 48 ++=
+++
>   meta-python/recipes-devtools/python/python3-sqlparse_0.4.4.bb   | 1 +
>   .../{python3-werkzeug_3.0.1.bb =3D> python3-werkzeug_3.0.3.bb} |   4 +-
>   .../apache2/{apache2_2.4.60.bb =3D> apache2_2.4.62.bb} |   2 +-
>   21 files changed, 437 insertions(+), 171 deletions(-)
>   create mode 100644
> meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-4256.patch
>   rename
> meta-oe/recipes-core/uutils-coreutils/{uutils-coreutils_0.0.25.bb =3D>
> uutils-coreutils_0.0.27.bb} (98%)
>   create mode 100644
> meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-0001.patch
>   create mode 100644
> meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-0002.patch
>   create mode 100644
> meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-0003.patch
>   rename meta-oe/recipes-support/hdf5/{hdf5_1.14.2.bb =3D>
> hdf5_1.14.4-3.bb} (84%)
>   rename
> meta-python/recipes-devtools/python/{python3-email-validator_2.1.0.bb =3D=
>
> python3-email-validator_2.1.1.bb} (59%)
>   create mode 100644
> meta-python/recipes-devtools/python/python3-pydantic-core/0001-Fix-genera=
te_self_schema-for-Python-3.12-1299.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-sqlparse/CVE-2024-4340.patch
>   rename meta-python/recipes-devtools/python/{python3-werkzeug_3.0.1.bb
> =3D> python3-werkzeug_3.0.3.bb} (83%)
>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.60.bb =3D>
> apache2_2.4.62.bb} (99%)

