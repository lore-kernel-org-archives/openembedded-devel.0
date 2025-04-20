Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA68CC369C2
	for <webhook@archiver.kernel.org>; Sun, 20 Apr 2025 18:58:11 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.2047.1745175482698572976
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Apr 2025 11:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kP0rWkV9;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4003b22c2f4so2217044b6e.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Apr 2025 11:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745175482; x=1745780282; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVvG/1U65Lq6NYxtmphXNT1pw22InhlN3BjW6DigzA0=;
        b=kP0rWkV90czVp6jvKCuEbFbiZzCdqhJMI3cdeMeii162m3jLGcl+jAYQWgvcVW+JJv
         5pu+jSMrfao+Oi5q8pZe4a0ulQoNbGsFqfCTxJ2jD8sBQUeqQKPdqT/pACxekcL/PN7G
         7AYy+okfC/HT6Mqtlj5nmREr8/oafpD5apsk7tpZzJxtFXMOYhwVKpWzB3+K4imdlyPT
         2QPCM73ECabDuqplxGTK9drb7qO+kiInmCVGii3AFwGzKBCddfKgyNA1qM46rabI2nxV
         OKqoZpnCGR8iuYIfrK/EQS+E3niLr5dYlZx1ltv2p64NAjDSKk3Pd5zsVsmsb695rKlg
         EUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745175482; x=1745780282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVvG/1U65Lq6NYxtmphXNT1pw22InhlN3BjW6DigzA0=;
        b=Rs0CoYQJCI+lyBVPAQrq9qDPzOnqoVEtZMUwdh8mMRBu44pRM7Rc3OHzVi2dwg0GRS
         6N2b85B7X0EAN641fbmMqo2EJR2mMevvvc6wI5+qFaziQ02lmub3v3eN1usTP4F7M/8a
         lqE0PuqXenhhiEoz29UDYdOuTCQLfZp4eFExe0dYjv62QNRRfy4v9XiNqGletTotbFVP
         8zopmzrelJI7+Nrbs75n07oE5w98tXpVr0JxxWWEsdQEqHVUkwY5/q6M7Q9X7ez/ylkp
         aNazg3Oc90xNkFRqAd3CYsSbxo89/DUQ5UFpAJSrNeo1tWfh1Zghlu1Q4Sp8QPSGxIPI
         Ia4A==
X-Gm-Message-State: AOJu0YwQCNhDhlYWqcGFQ542rCvHIz497+9nPqj+zdm/w/A3DFhecRvI
	wYJxvyMXhVfF4imXYhAjpstndy8tjyNDfRKruD3R6mIatoTu2xKTpmJr5NZiIUmjewTfVYJOGR0
	lnjdAj1hA7eXzNoT+2NErCAeDOZI=
X-Gm-Gg: ASbGncvnQ9PLkcpw4/4IsevFTDu25ObcBQtk+l5/1CsdDtVGo+D0MJ5Z8U8m5az58v3
	+kzqZkOfHwdqF3mjY+fs9CnT0gYJjObRK3QRS5yF8fmedS9t17Gb1K+glS6ArhJVr9EUoGa0QI1
	yqfzg/WJBl9Sm+xENkGGXpJUTgHesk4f26UGmhXCfehqNG21Y=
X-Google-Smtp-Source: AGHT+IE/NvK4T7B2zvu2rBag50MxvblquMMGXqUCg/tTHjeAFDeWJ95gfXv85yAOfvtplO3mgKzAJHXlSxM+fJlwfcU=
X-Received: by 2002:a05:6808:4c08:b0:3fc:1f7b:c39f with SMTP id
 5614622812f47-401c0a9bf48mr4266948b6e.18.1745175481798; Sun, 20 Apr 2025
 11:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <f5a909bd-6758-4488-957d-22dd872ae45b@gmail.com>
In-Reply-To: <f5a909bd-6758-4488-957d-22dd872ae45b@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Apr 2025 11:57:35 -0700
X-Gm-Features: ATxdqUFGSmMPOeNDIoWSZUJkUUYgawgn-ZoFUiOFsMHbWpU6SQcg6iksWwmW2_0
Message-ID: <CAMKF1sq1gB65aqSh0yBp5TaFqJp0YoOdakt2J2VW7QFi7NC_+w@mail.gmail.com>
Subject: Re: scarthgap merge request: April 20th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Apr 2025 18:58:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116989

merged now thanks Armin

On Sun, Apr 20, 2025 at 10:29=E2=80=AFAM akuster808 <akuster808@gmail.com> =
wrote:
>
> The following changes since commit 67ad83dd7c2485dae0c90eac345007af6195b8=
4d:
>
>    krb5: fix CVE-2025-24528 (2025-03-27 14:04:21 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded scarthgap-next
>
> for you to fetch changes up to e92d0173a80ea7592c866618ef5293203c50544c:
>
>    lmsensors: Clean stale files for sensord to avoid incorrect GCC
> header dependencies (2025-04-16 20:33:56 -0400)
>
> ----------------------------------------------------------------
> Awais Belal (1):
>        mongodb: update to 4.4.29
>
> Divya Chellam (1):
>        openvpn: upgrade 2.6.12 -> 2.6.14
>
> Haixiao Yan (1):
>        lmsensors: Clean stale files for sensord to avoid incorrect GCC
> header dependencies
>
> Khem Raj (13):
>        wolfssl: Add packageconfig for reproducible build
>        blueman: Fix buildpathe issue with cython generated code
>        botan: Make it reproducible
>        keepalived: Make build reproducible
>        ldns: Fix buildpaths QA issues
>        python3-kivy: Remove buildpaths from comments in generated C sourc=
es
>        python3-pyproj: Fix buildpaths QA Error
>        python3-pyproj: Remove absolute paths from cython generated .c fil=
es
>        python3-pycocotools: Remove absolute paths from comments
>        lprng: Specify target paths for needed utilities
>        fwknop: Specify target locations of gpg and wget
>        e2tools: Fix buildpaths QA warning in config.status in ptest
>        sharutils: Let POSIX_SHELL be overridable from environment
>
> Martin Jansa (1):
>        gcab: fix buildpaths QA issue
>
> Soumya Sambu (1):
>        php: Upgrade 8.2.26 -> 8.2.28
>
> Wang Mingyu (3):
>        nana: Fix buildpaths warning.
>        fetchmail: Fix buildpaths warning.
>        fetchmail: disable rpath to fix buildpaths warning.
>
> Yi Zhao (2):
>        mbedtls: upgrade 2.28.9 -> 2.28.10
>        mbedtls: 3.6.2 -> 3.6.3
>
> alperak (4):
>        rdist: Fix contains reference to TMPDIR [buildpaths] warning
>        perfetto: Fix contains reference to TMPDIR [buildpaths] warning
>        hplip: Fix contains reference to TMPDIR [buildpaths] warning
>        boinc-client: Fix contains reference to TMPDIR [buildpaths] warnin=
g
>
>   meta-filesystems/recipes-utils/e2tools/e2tools_git.bb           | 2 +-
>   .../blueman/0001-meson-DO-not-emit-absolute-path-when-S-B.patch | 38
> +++++++++++++++++++++++
>   meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb   | 1 +
>   .../mbedtls/{mbedtls_2.28.9.bb =3D> mbedtls_2.28.10.bb} |  2 +-
>   .../mbedtls/{mbedtls_3.6.2.bb =3D> mbedtls_3.6.3.bb} |  7 ++---
>   meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb       | 2 +-
>   meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb   | 3 ++
>   ...1-configure.ac-Do-not-emit-compiler-flags-into-object-.patch | 29
> ++++++++++++++++++
>   meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb  | 5 +++
>   meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb   | 2 +-
>   meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb         | 4 ++-
>   .../openvpn/{openvpn_2.6.12.bb =3D> openvpn_2.6.14.bb} |  2 +-
>   .../mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch | 28
> -----------------
>   .../meta-python/recipes-dbs/mongodb/mongodb_git.bb              | 7 ++-=
--
>   meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb               | 5 ++-
>   meta-oe/recipes-crypto/botan/botan_3.2.0.bb                     | 8 ++-=
--
>   meta-oe/recipes-devtools/ldns/ldns_1.8.3.bb                     | 3 +-
>   meta-oe/recipes-devtools/perfetto/perfetto.bb                   | 4 +--
>   meta-oe/recipes-devtools/php/{php_8.2.26.bb =3D> php_8.2.28.bb} |  2 +-
>   meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb           | 4 +++
>   meta-oe/recipes-extended/hplip/hplip_3.22.10.bb                 | 2 +-
>   meta-oe/recipes-extended/lprng/lprng_3.8.C.bb                   | 4 ++-
>   meta-oe/recipes-extended/nana/nana_git.bb                       | 6 +++=
+
>   ...1-gcab-enums.c.etemplate-include-basename-instead-of-f.patch | 37
> +++++++++++++++++++++++
>   meta-oe/recipes-gnome/gcab/gcab_1.6.bb                          | 1 +
>   ...1-libopts.m4-accept-POSIX_SHELL-from-the-environment-d.patch | 47
> +++++++++++++++++++++++++++++
>   meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb           | 3 ++
>   meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb       | 7 +++=
++
>   .../recipes-devtools/python/python3-pycocotools_2.0.7.bb        | 4 +++
>   meta-python/recipes-devtools/python/python3-pyproj/rpath.patch  | 18
> +++++++++++
>   meta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb     | 10
> ++++++
>   31 files changed, 243 insertions(+), 54 deletions(-)
>   create mode 100644
> meta-networking/recipes-connectivity/blueman/blueman/0001-meson-DO-not-em=
it-absolute-path-when-S-B.patch
>   rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.9.bb
> =3D> mbedtls_2.28.10.bb} (98%)
>   rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.2.bb
> =3D> mbedtls_3.6.3.bb} (91%)
>   create mode 100644
> meta-networking/recipes-daemons/keepalived/keepalived/0001-configure.ac-D=
o-not-emit-compiler-flags-into-object-.patch
>   rename meta-networking/recipes-support/openvpn/{openvpn_2.6.12.bb =3D>
> openvpn_2.6.14.bb} (97%)
>   delete mode 100644
> meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_=
mon-Include-missing-cstdint.patch
>   rename meta-oe/recipes-devtools/php/{php_8.2.26.bb =3D> php_8.2.28.bb} =
(99%)
>   create mode 100644
> meta-oe/recipes-gnome/gcab/gcab/0001-gcab-enums.c.etemplate-include-basen=
ame-instead-of-f.patch
>   create mode 100644
> meta-oe/recipes-support/sharutils/sharutils/0001-libopts.m4-accept-POSIX_=
SHELL-from-the-environment-d.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-pyproj/rpath.patch
>

