Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3829BC3ABDD
	for <webhook@archiver.kernel.org>; Sat, 17 May 2025 20:22:50 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.18654.1747513362657019609
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 May 2025 13:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YIXwAnmN;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2db9e29d3bcso468755fac.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 May 2025 13:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747513362; x=1748118162; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0CBB618Ngraz4sOiDf3fNlYH1MRqTASkA6196ML18S4=;
        b=YIXwAnmN2SLRVVFaUr6AYIfgCoXsOEvCT8XksBFpjk6Wpyg2QTgDh+ZJTmKh+fkAXt
         b2V4XHPM9VVl4jBQsqW000iarnKgB+uiJuSvzZ1nNOo0PNy7+i6g0NZRw3lU6XeKmHt2
         18awVl9ZoaCItkSACxSSnM0J/qtKoFtP2BvxED4uQlxrm+uMFGjDLrYtlYMXGKMi+4/w
         F0cL3tk7+9SwN5gqyLeNV0Uf+PZVsGKYDruE+ZqOouuZYgRiHpkEGGPS1MzcBwZz2MEL
         FavjrHTHMLl3s6qNBSf++7QOfrpSnISB6LIn3kyzJu1+dET/aVzbidF2iQAPyL3gFpIw
         kEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747513362; x=1748118162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0CBB618Ngraz4sOiDf3fNlYH1MRqTASkA6196ML18S4=;
        b=Af/SstlRhUCtFVpL5olGNnNquNDx+YittObIxXegUVYigIucKrGGVK3fcDXG9C01KJ
         q+MwcMHtaduNpLZ5ofI4hGq9ZzmKPIkbbOpQ3j7kZaUVXkqqb3YDKo1OfQnQdfbpLrb2
         4lUNfgfRtGie/ViUzjV2KmYjMu+r7M6uzkFivHNHLsld5Q88GLUpdTfjDISZec3v0cFr
         WlM8P/YsY+2xUZpyVZem5Aj+0ZSKCYX3RggA+FgoUKofgrL9uPxwbFAY3jqdPauYUx63
         77lKTFKoptsFuf9tdImO79OdAHpq0SQlO4RwIuF3SnNVO0xCeTJAIWS9TuzUxrYI7Tve
         N8SA==
X-Gm-Message-State: AOJu0Ywyj5kv2RANF12EhPRG6Da6AZ2YXbieQmenXg5BI9saLAe8WuCV
	9nvF0g+Vkl447EzocKEBoIFr2V1r6N7X04tOVms2+yi6evtOUWN+3QHFYlbykTJwWqrv94UP1NP
	+iD1vxUdvpKLgVFafyUNyfE0gMMgAOuk=
X-Gm-Gg: ASbGncsjoGFiC/I/DkK2x5bRUYFjTTI0G5VjZjM+nXtvQg6Oys+uKY3VhRKdyB6MpoN
	o64BSGAqhs8+lb2HG/HR3Syw/CgFAr0eoIP0baWU5qnE2SR+82nBw3rlKvdeFgWCqdCkONe/+Ee
	oYk5Tjtv0umMa4B3oTZo8NDfhiAUUcpLU=
X-Google-Smtp-Source: AGHT+IGNfQiJyLLh3Z0Cjw59JlVSxCuMppCT6Wc1PozjPixTAc6T9qutI6e8Z0sKfqvKr1L3uql3ElwYO6WCIyTuFyE=
X-Received: by 2002:a05:6808:338c:b0:3f9:2fdc:ee93 with SMTP id
 5614622812f47-404d87b897dmr5153186b6e.30.1747513361584; Sat, 17 May 2025
 13:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <b890ddb1-a925-4b80-997c-15d7486d12b2@gmail.com>
In-Reply-To: <b890ddb1-a925-4b80-997c-15d7486d12b2@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 17 May 2025 13:22:15 -0700
X-Gm-Features: AX0GCFtqefGzfBMXgMDk0OyWZFO7UiNwCMzoxTIIctanw1lcPHM6Zqs-hD4w3_w
Message-ID: <CAMKF1soOrS0OgDLbLSKLRHq5QMuiV2ScAaWRjgjky9Xdj7h=jQ@mail.gmail.com>
Subject: Re: walnascar merge request: May 17th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 May 2025 20:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117446

merged thanks Armin.

On Sat, May 17, 2025 at 10:59=E2=80=AFAM akuster808 <akuster808@gmail.com> =
wrote:
>
> The following changes since commit 0d2d2d193a1619b6dbebaf335f1ef785478049=
e3:
>
>    meta-openemnedded: Add myself as walnascar maintainer (2025-04-16
> 18:20:05 -0700)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded walnascar-next
>
> for you to fetch changes up to 2169c9afcc0945045bea49f58011080942d4ddb4:
>
>    pipewire: Avoid having pipewire-native depend on pipewire (2025-05-17
> 11:56:50 -0600)
>
> ----------------------------------------------------------------
> Changqing Li (6):
>        version-check.conf: add CHECK_VERSION_PV for pn-netperf
>        python3-pyyaml-include: update SRCREV
>        version-check.conf: mute bridge-utils version mismatch warning
>        libuser: correct the package version
>        turbostat: make turbostat's version align with kernel version
>        lvm2: correct PKGV for package libdevmapper
>
> Jason Schonberg (2):
>        c-ares: upgrade 1.34.1 -> 1.34.2
>        c-ares: upgrade 1.34.2 -> 1.34.3
>
> Khem Raj (2):
>        apache2: Scrub -ffile-prefix-map in build.nice file
>        python3-posix-ipc: switch to PEP-517 build backend
>
> Peter Kjellerstedt (2):
>        meta-networking/README.md: Correct the branch for dependent layers
>        pipewire: Avoid having pipewire-native depend on pipewire
>
> Wang Mingyu (2):
>        php: upgrade 8.4.5 -> 8.4.6
>        python3-posix-ipc: upgrade 1.1.1 -> 1.2.0
>
> Yi Zhao (1):
>        catch2: upgrade 3.8.0 -> 3.8.1
>
> Yogita Urade (1):
>        poppler: upgrade 25.01.0 -> 25.04.0
>
>   .../libuser/0001-configure.ac-update-version-to-0.64.patch      | 25
> ++++++++++++++++
>   meta-gnome/recipes-support/libuser/libuser_0.64.bb              | 1 +
>   meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb   | 4 ++-
>   meta-networking/README.md                                       | 6 ++-=
-
>   meta-oe/conf/version-check.conf                                 | 3 ++
>   meta-oe/recipes-devtools/php/php/0003-iconv-fix-detection.patch | 11
> +++----
>   meta-oe/recipes-devtools/php/{php_8.4.5.bb =3D> php_8.4.6.bb} |  2 +-
>   .../recipes-kernel/turbostat/{turbostat_3.4.bb =3D> turbostat.bb} |  7 =
+++++
>   .../c-ares/{c-ares_1.34.1.bb =3D> c-ares_1.34.3.bb} |  2 +-
>   meta-oe/recipes-support/lvm2/lvm2.inc                           | 23
> +++++++++++++++
>   .../poppler/{poppler_25.01.0.bb =3D> poppler_25.04.0.bb} |  2 +-
>   .../recipes-test/catch2/{catch2_3.8.0.bb =3D> catch2_3.8.1.bb} |  2 +-
>   .../0001-Use-default-cc-from-environment-variable.patch         | 45
> -----------------------------
>   .../{python3-posix-ipc_1.1.1.bb =3D> python3-posix-ipc_1.2.0.bb} |  8 +=
+---
>   .../recipes-devtools/python/python3-pyyaml-include_2.2.bb       | 6 +++=
-
>   meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb          | 2 +-
>   16 files changed, 82 insertions(+), 67 deletions(-)
>   create mode 100644
> meta-gnome/recipes-support/libuser/libuser/0001-configure.ac-update-versi=
on-to-0.64.patch
>   rename meta-oe/recipes-devtools/php/{php_8.4.5.bb =3D> php_8.4.6.bb} (9=
9%)
>   rename meta-oe/recipes-kernel/turbostat/{turbostat_3.4.bb =3D>
> turbostat.bb} (94%)
>   rename meta-oe/recipes-support/c-ares/{c-ares_1.34.1.bb =3D>
> c-ares_1.34.3.bb} (91%)
>   rename meta-oe/recipes-support/poppler/{poppler_25.01.0.bb =3D>
> poppler_25.04.0.bb} (96%)
>   rename meta-oe/recipes-test/catch2/{catch2_3.8.0.bb =3D>
> catch2_3.8.1.bb} (92%)
>   delete mode 100644
> meta-python/recipes-devtools/python/python3-posix-ipc/0001-Use-default-cc=
-from-environment-variable.patch
>   rename meta-python/recipes-devtools/python/{python3-posix-ipc_1.1.1.bb
> =3D> python3-posix-ipc_1.2.0.bb} (51%)

