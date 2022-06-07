Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA17C43334
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 14:08:21 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web12.12974.1654610894978854220
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jun 2022 07:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VeOXSqbm;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id u8so12400662qvj.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jun 2022 07:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pLl2XnClSPlsf/GzorGusR2r/AKRkk+zc71STY2bvgs=;
        b=VeOXSqbmF+y+Cd6EdoldPE0G8Mr/PmTE3YMlC7EFYPQ8ZZKg5pPSUHGt72FhDZ0yO3
         HyEy6LMR/wrrDHmDTiqG/ns88U+lY4yATKWebkL5WkD63KmBnbDrNEnHg7xktHYQFLlr
         Jdcp+UmaHdt6qqScZl4xAHYkjhH92MGPrOLzexnvP2ZQ3jNaKz3IbMuoJtzrjYx10Aet
         F7f1l5CMNMFoVVFm8m9gtUvoNZkZT3QjJ3m9ISP4E0qCVvVG7jVzOga0g+eElxbhnZ8T
         HThe5IXagN1MqU+/gpFcYEm0/RN+e53dkpGgfMcVyfx13qoTzFRxI7BQePrA3KzGkI6o
         k9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pLl2XnClSPlsf/GzorGusR2r/AKRkk+zc71STY2bvgs=;
        b=eORdOICCvlRwYFaAXnNsfhBlUWsil//Z3iXDySvsHHVsk9w+1dHAiKCwz2d1Sne9lF
         VMexph52qGFBuzMWexQblQKOIAKX/f4lnD8JjbM7iEmRkSUw9uj2FL8sjPUaCBGUQJHP
         8c/i+W+1YXsamK1KUUAJHbBfs+/yoQuEv3XHBdF3M+h+tTWI3PfEeFeLoInAjrOcuIm5
         QY6KBLqrvP2bH3yrPwQuX+i2D16SIsJswtaWmuFMwYK1g4cjEO1rNno6YcaoMCJoEL8g
         Df7iM9FsHCM/O/6Rg712qDvW8xzFgBxz7MfpZLMwvf+VqBaktdbV9byR9TwrqjE/rvau
         5f4g==
X-Gm-Message-State: AOAM531L0r2Rs+m/1sjc34/3zK1w1Npf5IixOu4d2+ReU2mJVwXUlAbe
	h3hMbUcrgK/vmhhEjq5YHkj0KkvedmqKhxlJS5w=
X-Google-Smtp-Source: 
 ABdhPJy56ihvObnWHaHMijS54Qzjqbv3GpcsxY2/XUfiT6mXSC4S8maQ/gaTMef08mnw2qdgmnKiSTEUe+5Gk/mPick=
X-Received: by 2002:ad4:5bc8:0:b0:464:6079:d9d1 with SMTP id
 t8-20020ad45bc8000000b004646079d9d1mr29214439qvt.24.1654610893845; Tue, 07
 Jun 2022 07:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <bce48b99-5e94-d704-5c55-2bd6d2418c19@gmail.com>
In-Reply-To: <bce48b99-5e94-d704-5c55-2bd6d2418c19@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Jun 2022 07:07:47 -0700
Message-ID: 
 <CAMKF1sq-nZ9txYLfiuAR10agkR__gbNGSTUVows8CVpZFrryBA@mail.gmail.com>
Subject: Re: kirkstone merge request: June 6th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jun 2022 14:08:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97440

merged thanks.

On Mon, Jun 6, 2022 at 10:05 PM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 0b78362654262145415df8211052442823b9ec9b:
>
>    bats: upgrade 1.6.0 -> 1.6.1 (2022-05-23 07:39:02 -0700)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to fcc7d7eae82be4c180f2e8fa3db90a8ab3be07b7:
>
>    python3-matplotlib: add missing dependency (2022-06-03 07:02:48 -0700)
>
> ----------------------------------------------------------------
> Adrian Fiergolski (1):
>        python3-matplotlib: add missing dependency
>
> Adrian Freihofer (1):
>        conntrack-tools: fix postinst script
>
> Armin Kuster (2):
>        mariadb: update to 10.7.4
>        mariadb: Fix i386 Clang builds
>
> Bartosz Golaszewski (1):
>        python3-speedtest-cli: fix RDEPENDS
>
> Denys Dmytriyenko (1):
>        devmem2: the source and patches moved to github repo
>
> Gianfranco (2):
>        sdbus-c++-libsystemd: Bump SRCREV to last commit of 250-stable branch
>        libmtp: Add doxygen-native dependency in case documentation build
> is enabled in PACKAGECONFIG. This fixes a FTBFS due to missing dependency.
>
> Joerg Vehlow (1):
>        jq: Fix typo OE_EXTRACONF -> EXTRA_OECONF
>
> Julien STEPHAN (1):
>        libcamera: fix packaging
>
> Kai Kang (3):
>        python3-wxgtk4: backport patch to fix svg issue
>        libportal: add distro features check
>        graphviz: rrecommends on liberation-fonts
>
> Khem Raj (4):
>        unattended-upgrades: Disable auto-detecting modules
>        sdbus-c++: Link with libatomic on mips/ppc32
>        sdbus-c++: Link with libatomic for rv32
>        sdbus-c++-libsystemd: Fix patch fuzz
>
> wangmy (3):
>        php: upgrade 8.1.4 -> 8.1.5
>        php: upgrade 8.1.5 -> 8.1.6
>        postgresql: upgrade 14.2 -> 14.3
>
>   meta-gnome/recipes-gnome/libportal/libportal_0.6.bb             | 4 +-
>   meta-multimedia/recipes-multimedia/libcamera/libcamera.bb       | 4 +-
>   .../recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb     | 1 +
>   meta-oe/recipes-connectivity/libmtp/libmtp_1.1.19.bb            | 2 +-
>   .../0005-src-basic-missing.h-check-for-missing-strndupa.patch   | 4 +-
>   meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb    | 2 +-
>   meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb               | 6 +
>   .../{mariadb-native_10.7.3.bb => mariadb-native_10.7.4.bb} |   0
>   meta-oe/recipes-dbs/mysql/mariadb.inc                           | 5 +-
>   meta-oe/recipes-dbs/mysql/mariadb/clang-64bit-atomics.patch     | 178
> ------
>   .../recipes-dbs/mysql/{mariadb_10.7.3.bb => mariadb_10.7.4.bb} |   0
>   .../0001-configure.ac-bypass-autoconf-2.69-version-check.patch  | 6 +-
>   .../postgresql/{postgresql_14.2.bb => postgresql_14.3.bb} |   2 +-
>   meta-oe/recipes-devtools/jq/jq_git.bb                           | 2 +-
>   meta-oe/recipes-devtools/php/{php_8.1.4.bb => php_8.1.6.bb} |   2 +-
>   .../files/0001-setup.py-Disable-autodection-of-modules.patch    | 28 +
>   .../unattended-upgrades/unattended-upgrades_2.6.bb              | 1 +
>   meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb            | 2 +
>   meta-oe/recipes-support/devmem2/devmem2.bb                      | 30 -
>   ...1-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch | 70 ---
>   .../0001-devmem2-support-different-page-sizes-at-run-time.patch | 35 --
>   meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch  | 91 ---
>   meta-oe/recipes-support/devmem2/devmem2_2.0.bb                  | 19 +
>   meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb | 1 +
>   .../recipes-devtools/python/python3-speedtest-cli_2.1.3.bb      | 6 +-
>   ...1-Update-Cython-version-to-fix-NanoSVG-issues-with-Pyt.patch | 861
> ++++++++++++++++++++++++++++
>   .../recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb     | 1 +
>   27 files changed, 943 insertions(+), 420 deletions(-)
>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.7.3.bb =>
> mariadb-native_10.7.4.bb} (100%)
>   delete mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/clang-64bit-atomics.patch
>   rename meta-oe/recipes-dbs/mysql/{mariadb_10.7.3.bb =>
> mariadb_10.7.4.bb} (100%)
>   rename meta-oe/recipes-dbs/postgresql/{postgresql_14.2.bb =>
> postgresql_14.3.bb} (80%)
>   rename meta-oe/recipes-devtools/php/{php_8.1.4.bb => php_8.1.6.bb} (99%)
>   create mode 100644
> meta-oe/recipes-devtools/unattended-upgrades/files/0001-setup.py-Disable-autodection-of-modules.patch
>   delete mode 100644 meta-oe/recipes-support/devmem2/devmem2.bb
>   delete mode 100644
> meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch
>   delete mode 100644
> meta-oe/recipes-support/devmem2/devmem2/0001-devmem2-support-different-page-sizes-at-run-time.patch
>   delete mode 100644
> meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch
>   create mode 100644 meta-oe/recipes-support/devmem2/devmem2_2.0.bb
>   create mode 100644
> meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-Update-Cython-version-to-fix-NanoSVG-issues-with-Pyt.patch
>

