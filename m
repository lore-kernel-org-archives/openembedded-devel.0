Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB58C61DA4
	for <webhook@archiver.kernel.org>; Sat, 18 Feb 2023 20:27:03 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web10.19934.1676752019907188301
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Feb 2023 12:27:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g4OKP1kr;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id k27-20020a0568301bfb00b0068dbf908574so258372otb.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 12:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bGY6b5kXyzvyrRL/h8QMxdCykH5Dy2aGCve7WK2m0ss=;
        b=g4OKP1krXVJMOOseZQZrWR3a0F9O3gPPsm/Fp3h8Bo+TavKhLJSq55vlsMkvB+TYpS
         ZZYvWs4Nzeynmgpb1ikuTnAXtBudUj4IdYzE9Khw8uZmntRuMxwxg6lVayNpJqvA9pMz
         JUez7GiNe5eHmfoLUb+SXcmo08dcmLOJn+P0Q6t2vFaH0HixC+ix6Z/G/No3ZcfoJ/lV
         ClnmaskRmhwFl5ZyT2VwFCHHMuYNtTTjDoE+fX/Xi09/5jdVpAZGYD0JOrOcSme4PnPK
         Notbjtyjs76vSfMNNQ2/3wQfLKC7utJpZPp51QORlFWxtIKkFD9iIZUR9uQEqdDF2YzR
         H4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGY6b5kXyzvyrRL/h8QMxdCykH5Dy2aGCve7WK2m0ss=;
        b=fXW2LgtDkPzYQrJyM6Rvg0s/cixi/JRbCrdDJMHrbkvDo2/v0yZBU0dDd90c3lTFfV
         ujtmzqT/NqesqCekVJHsPuRMBJKRStDKxiy9wNPqDCGUdIdv5cFmIpFfCWVXRw2QGjqE
         LQNkUgilhiBdEWm0NyM26GYtU0s0+HjNlExnUuwFRHLZA/5mLIy/j5pEOmIvNllx5VAZ
         8IPT8JH9iqNmPMATmAZ8W5KvuXAxjQFquldEbCPFzlOBO1bAAJ2Gg9zmInU2sTsNmRI+
         VJ6Rvz8+q9i9khSC4JSRWG1h5rPmlvdfUcd+Ci1vmE67LEQc8WEeQxC0tOmdP5DYtqNe
         lYWw==
X-Gm-Message-State: AO0yUKXq7RvpH0IVVH1cZiOnf8rmaT04qK+KpXBgZZoWObhEZoylKQp+
	1zS1OupeAvzL3dmljyd6dFEeSpx+kIlRYJknD+w=
X-Google-Smtp-Source: AK7set97neS2BA+5fmLoVysoPU5flzOuXkB5zqpj0RJuZVSD/V+ynbqd71YgV7XreWhFjhWIwYxbsvq3Pj0g5PSbVWA=
X-Received: by 2002:a9d:4110:0:b0:68b:ccdb:3855 with SMTP id
 o16-20020a9d4110000000b0068bccdb3855mr272236ote.2.1676752019116; Sat, 18 Feb
 2023 12:26:59 -0800 (PST)
MIME-Version: 1.0
References: <5dab99f6-266d-7c31-e226-98e6e24188bc@gmail.com>
In-Reply-To: <5dab99f6-266d-7c31-e226-98e6e24188bc@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Feb 2023 12:26:32 -0800
Message-ID: <CAMKF1sq_FrYfuPHBKpHsALfjdBKtHvb1JORCj-M-F1ze5QvuBw@mail.gmail.com>
Subject: Re: langdale merge request: Feb 18th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 20:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101147

applied thanks Armin

On Sat, Feb 18, 2023 at 7:30 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit e7c754778edb25f35896137c8b174669392c492a:
>
>    nodejs: upgrade 16.18.1 -> 16.19.0 (2023-02-04 12:16:04 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded langdale-next
>
> for you to fetch changes up to 30f4c2b3ae182513b967185e06bc8409a0ee6092:
>
>    mdns: use git fetcher (2023-02-15 08:02:50 -0500)
>
> ----------------------------------------------------------------
> Chee Yang Lee (1):
>        tinyproxy: fix CVE-2022-40468
>
> Dmitry Baryshkov (1):
>        nss: fix cross-compilation error
>
> Joe Slater (1):
>        phoronix-test-suite: fix CVE-2022-40704
>
> Khem Raj (1):
>        net-snmp: Fix build with clang16
>
> Martin Jansa (2):
>        exiv2: fix SRC_URI
>        mdns: use git fetcher
>
> Narpat Mali (1):
>        net-snmp: CVE-2022-44792 & CVE-2022-44793 Fix NULL Pointer Exception
>
> Randy MacLeod (2):
>        python3-pillow: add ptest support
>        python3-pillow: Add distutils, unixadmin for ptest
>
> Wang Mingyu (5):
>        python3-pillow: upgrade 9.2.0 -> 9.3.0
>        python3-pillow: upgrade 9.3.0 -> 9.4.0
>        apache2: upgrade 2.4.54 -> 2.4.55
>        python3-django: upgrade 4.1 -> 4.1.3
>        python3-django: upgrade 4.1.3 -> 4.1.6
>
> Yi Zhao (1):
>        freeradius: Security fixes for CVE-2022-41860 CVE-2022-41861
>
>   .../recipes-connectivity/freeradius/files/CVE-2022-41860.patch  | 118
> +++++++++++++++++++
>   .../recipes-connectivity/freeradius/files/CVE-2022-41861.patch  | 53
> +++++++++
>   .../recipes-connectivity/freeradius/freeradius_3.0.21.bb        | 2 +
>   .../0001-Create-subroutine-for-cleaning-recent-interfaces.patch | 0
>   .../{files => mdns}/0001-dns-sd-Include-missing-headers.patch |   0
>   .../{files => mdns}/0001-mdns-include-stddef.h-for-NULL.patch |   0
>   .../0002-Create-subroutine-for-tearing-down-an-interface.patch  | 0
>   .../0002-mdns-cross-compilation-fixes-for-bitbake.patch         | 0
>   .../{files => mdns}/0003-Track-interface-socket-family.patch |   0
>   .../{files => mdns}/0004-Use-list-for-changed-interfaces.patch |   0
>   .../mdns/{files => mdns}/0006-Remove-unneeded-function.patch |   0
>   .../mdns/mdns/0006-make-Add-top-level-Makefile.patch            | 175
> ++++++++++++++++++++++++++++
>   .../0008-Mark-deleted-interfaces-as-being-changed.patch         | 0
>   .../{files => mdns}/0009-Fix-possible-NULL-dereference.patch |   0
>   .../{files => mdns}/0010-Handle-errors-from-socket-calls.patch |   0
>   ...011-Change-a-dynamic-allocation-to-file-scope-variable.patch | 0
>   .../recipes-protocols/mdns/{files => mdns}/mdns.service |   0
>   meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb       | 44
> ++++---
>   .../0001-Add-noreturn-attribute-to-netsnmp_pci_error.patch      | 32 +++++
>   .../net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch       | 121
> +++++++++++++++++++
>   meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb    | 2 +
>   .../recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch    | 33
> ++++++
>   meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb   | 1 +
>   .../phoronix-test-suite/files/CVE-2022-40704.patch              | 46
> ++++++++
>   .../phoronix-test-suite/phoronix-test-suite_10.8.4.bb           | 5 +-
>   meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb                   | 2 +-
>   .../nss/nss/0001-nss-fix-support-cross-compiling.patch          | 7 +-
>   .../python/{python3-django_4.1.bb => python3-django_4.1.6.bb} |   2 +-
>   meta-python/recipes-devtools/python/python3-pillow/run-ptest    | 3 +
>   .../python/{python3-pillow_9.2.0.bb => python3-pillow_9.4.0.bb} |  30
> ++++-
>   .../apache2/{apache2_2.4.54.bb => apache2_2.4.55.bb} |   2 +-
>   31 files changed, 653 insertions(+), 25 deletions(-)
>   create mode 100644
> meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41860.patch
>   create mode 100644
> meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41861.patch
>   rename meta-networking/recipes-protocols/mdns/{files =>
> mdns}/0001-Create-subroutine-for-cleaning-recent-interfaces.patch (100%)
>   rename meta-networking/recipes-protocols/mdns/{files =>
> mdns}/0001-dns-sd-Include-missing-headers.patch (100%)
>   rename meta-networking/recipes-protocols/mdns/{files =>
> mdns}/0001-mdns-include-stddef.h-for-NULL.patch (100%)
>   rename meta-networking/recipes-protocols/mdns/{files =>
> mdns}/0002-Create-subroutine-for-tearing-down-an-interface.patch (100%)
>   rename meta-networking/recipes-protocols/mdns/{files =>
> mdns}/0002-mdns-cross-compilation-fixes-for-bitbake.patch (100%)
>   rename meta-networking/recipes-protocols/mdns/{files =>
> mdns}/0003-Track-interface-socket-family.patch (100%)
>   rename meta-networking/recipes-protocols/mdns/{files =>
> mdns}/0004-Use-list-for-changed-interfaces.patch (100%)
>   rename meta-networking/recipes-protocols/mdns/{files =>
> mdns}/0006-Remove-unneeded-function.patch (100%)
>   create mode 100644
> meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
>   rename meta-networking/recipes-protocols/mdns/{files =>
> mdns}/0008-Mark-deleted-interfaces-as-being-changed.patch (100%)
>   rename meta-networking/recipes-protocols/mdns/{files =>
> mdns}/0009-Fix-possible-NULL-dereference.patch (100%)
>   rename meta-networking/recipes-protocols/mdns/{files =>
> mdns}/0010-Handle-errors-from-socket-calls.patch (100%)
>   rename meta-networking/recipes-protocols/mdns/{files =>
> mdns}/0011-Change-a-dynamic-allocation-to-file-scope-variable.patch (100%)
>   rename meta-networking/recipes-protocols/mdns/{files =>
> mdns}/mdns.service (100%)
>   create mode 100644
> meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-noreturn-attribute-to-netsnmp_pci_error.patch
>   create mode 100644
> meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch
>   create mode 100644
> meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch
>   create mode 100644
> meta-oe/recipes-benchmark/phoronix-test-suite/files/CVE-2022-40704.patch
>   rename meta-python/recipes-devtools/python/{python3-django_4.1.bb =>
> python3-django_4.1.6.bb} (58%)
>   create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/run-ptest
>   rename meta-python/recipes-devtools/python/{python3-pillow_9.2.0.bb =>
> python3-pillow_9.4.0.bb} (53%)
>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.54.bb =>
> apache2_2.4.55.bb} (99%)
>

