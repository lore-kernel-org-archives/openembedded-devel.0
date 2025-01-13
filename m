Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA568E7719A
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 03:54:53 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.9904.1736740484538084612
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jan 2025 19:54:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gz7946NM;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-29e70c9dc72so2040603fac.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jan 2025 19:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736740484; x=1737345284; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdhPb3115Vn6OVpO2RMGbc0CIpZHrFvGuwrm4zvQt3U=;
        b=gz7946NMq557m3m3tA0A41RljhXWaVf2A+nK6wkwN9doyNn7/tOuDyW1kPSiKiKuFo
         gSK4CfXlMBIUpztJqZS/2FX73idkanByOlbRDo8iQY3O1oJ5iDyPmDls7GI1AHkokQSV
         kh0AqWoYQE9jERE1SBgqdM+beHlK8cAG67BftwpX7Oy8jgaIzQF2UQvX8TXevx0qxHbo
         25a4ynJ4mX98B5T98VDAW4v6O+ghbz5sXI0PVCk/hYxevDVjvRqYkkeeLNQoG8vgpTn0
         PpCd5YObHoUiiKf7UQcDJM4ptzZPsFxzbfG5Yi8XcaeYke0UVG3S/THO5mMckuI5AYyn
         JnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736740484; x=1737345284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdhPb3115Vn6OVpO2RMGbc0CIpZHrFvGuwrm4zvQt3U=;
        b=A2NTx+dq8tr3Wwasmc2V04h402z0dBVFg4wHc+IxTy2F78GlzfNHVscodJ1n3MXXLu
         Fu7GhInXNThJtdz2EY22+v7SzjmSbftyDCiSVqQplb5EjYpB1CULpSVVLVbh0vSbrSmQ
         Uf9W0X0YAZglime5rspx3bBUrbiwfIQto9cwHVolC8peGe5PLUvQUgjMfhX/er1yK0SU
         J3s26+miN3shwfJxS2IWwLIZckVAZZwKHGomEbXgJcjjqktY/6VuYvry6rAJWBsOOa0/
         DgR16jhUz43oBbs3rSYefGunW9sazfBjHn0UeGb4zOgOIpvX65k24KZvJVYj3iW7qZJj
         FZOQ==
X-Gm-Message-State: AOJu0Yy0z/YrphrLclfWN2W3gulmXreqW7R1L5x3+KpG+4JUn3s27ORV
	uoFOcvG2PfEjJC4FSsDF0JicBUQGst0u7yrwT7C711NuMD89L7HJRfCkd3p5cPKTMAB385C5keL
	6QnQXbeKMJN0MV3D/brjhh1W3vcs=
X-Gm-Gg: ASbGncuilRfMuBfo4IYtKBK/G8S+5t+T5sCTICxFXW/d342y/gjnjIstiIzIpDPeFaC
	n13vgmHxX5DOOWriZPyhb2oeCbyMx6MNzb5K994TQAvaV6cO/g2s+
X-Google-Smtp-Source: AGHT+IFMHWyB0Q+vqyFLfHMp/CQOJz+nT3cSCC9avlgPwZgXEueWk+Yzokkqbl1wMNsXFnWUhe3o6wJhg7CFudoxveA=
X-Received: by 2002:a05:6870:9c85:b0:29d:c86b:cdec with SMTP id
 586e51a60fabf-2aa06945c02mr12220851fac.29.1736740483759; Sun, 12 Jan 2025
 19:54:43 -0800 (PST)
MIME-Version: 1.0
References: <05f57241-f78b-441b-a352-39ebf6f8cabf@gmail.com>
In-Reply-To: <05f57241-f78b-441b-a352-39ebf6f8cabf@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Jan 2025 19:54:17 -0800
X-Gm-Features: AbW1kvZodDJ6eNldf5bg2aBNoIyXQdPQcs8cuAX5-h3C7ipnfwBteG3uI7UiItw
Message-ID: <CAMKF1srwrOi7Lh72+P0xYmGUs0a2GbvigduRYU6TqaijDt92og@mail.gmail.com>
Subject: Re: styhead merge request: Jan 12th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 03:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114820

Hi Armin,

This is not merging into styhead without conflicts

CONFLICT (content): Merge conflict in
meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
Can you take a look and perhaps update your baseline ?

On Sun, Jan 12, 2025 at 5:02=E2=80=AFPM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 7cd38212e73e0e9f42f4d92defb16dd81f7122=
1d:
>
>    lvm2: Remove the lvm2-udevrules package (2024-11-25 15:32:56 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded styhead-next
>
> for you to fetch changes up to 31a24ab044a24936f50a80828ecd7048bf5b1f5e:
>
>    libmodule-build-tiny-perl: fix QA Issue: TMPDIR [buildpaths]
> (2025-01-12 19:57:19 -0500)
>
> ----------------------------------------------------------------
> Benjamin Bouvier (1):
>        bridge-utils: add CVE_PRODUCT
>
> Derek Straka (1):
>        nginx: Upgrade mainline release version 1.27.1 -> 1.27.3
>
> Ghislain Mang=C3=A9 (1):
>        wireshark: use inherit_defer for conditional cases
>
> Hongxu Jia (1):
>        ntfs-3g-ntfsprogs: fix CVE-2023-52890
>
> J. S. (4):
>        libhtml-tree-perl: Drop unnecessary SRC_URI md5sum
>        libhtml-tree-perl: update HOMEPAGE
>        libhtml-tree-perl: fix QA Issue: TMPDIR [buildpaths]
>        libmodule-build-tiny-perl: fix QA Issue: TMPDIR [buildpaths]
>
> Khem Raj (3):
>        mariadb: Fix build with clang-20/trunk
>        ghex,gnome-chess,gnome-photos: Add missing dep on itstool-native
>        mpd: Fix build with icu 76+
>
> Markus Volk (2):
>        geary: add itstool-native dependency
>        eog: add itstool-native dependency
>
> Peter Kjellerstedt (1):
>        abseil-cpp: Do not leak -Wnon-virtual-dtor into the .pc files
>
> Peter Marko (15):
>        proftpd: set status of CVE-2001-0027
>        dash: set CVE_PRODUCT
>        ace: ignore CVE-2009-1147
>        apache2: ignore CVE-1999-0678 and CVE-1999-1412
>        apache2: remove old version references from CVEs
>        spice: ignore CVE-2016-0749
>        gattlib: mark CVE-2019-6498 as fixed
>        monkey: ignore CVE-2013-1771
>        redis: ignore CVE-2022-0543
>        spice-gtk: mark CVE-2012-4425 as fixed
>        apache2: ignore disputed CVE CVE-2007-0086
>        memcached: ignore disputed CVE-2022-26635
>        emlog: set CVE_PRODUCT
>        php: upgrade 8.2.20 -> 8.2.26
>        wireshark: upgrade 4.2.8 -> 4.2.9
>
> Ruiqiang Hao (1):
>        mariadb: Ensure compatibility with ARMv9 by updating .arch directi=
ve
>
> Yoann Congal (1):
>        gimp: fix gimptool buildpaths errors
>
> Yogita Urade (1):
>        postgresql: upgrade 16.4 -> 16.5
>
>   ...0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch | 42
> ++++++++++++++
>   .../ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb            | 1 +
>   meta-gnome/recipes-connectivity/geary/geary_46.0.bb             | 1 +
>   .../gimp/gimp/0001-gimptool-allow-default-CC-override.patch     | 85
> +++++++++++++++++++++++++++++
>   meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb                    | 21
> +++++++
>   meta-gnome/recipes-gnome/eog/eog_47.0.bb                        | 1 +
>   meta-gnome/recipes-gnome/ghex/ghex_46.0.bb                      | 1 +
>   meta-gnome/recipes-gnome/gnome-chess/gnome-chess_47.0.bb        | 2 +-
>   meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb      | 1 +
>   .../mpd/0001-meson.build-support-building-with-ICU-76.patch     | 52
> ++++++++++++++++++
>   meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.15.bb       | 1 +
>   meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb       | 2 +
>   .../recipes-support/bridge-utils/bridge-utils_1.7.1.bb          | 2 +
>   meta-networking/recipes-support/memcached/memcached_1.6.17.bb   | 2 +
>   meta-networking/recipes-support/spice/spice-gtk_0.42.bb         | 2 +
>   meta-networking/recipes-support/spice/spice_git.bb              | 1 +
>   .../wireshark/{wireshark_4.2.7.bb =3D> wireshark_4.2.9.bb} |  4 +-
>   meta-oe/recipes-connectivity/ace/ace_6.5.19.bb                  | 2 +
>   meta-oe/recipes-connectivity/gattlib/gattlib_git.bb             | 2 +
>   meta-oe/recipes-core/emlog/emlog.inc                            | 2 +
>   meta-oe/recipes-dbs/mysql/mariadb.inc                           | 2 +
>   ...1-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch | 44
> +++++++++++++++
>   ...1-Use-a-lambda-function-as-deleter-prototype-in-unique.patch | 26
> +++++++++
>   .../0003-configure.ac-bypass-autoconf-2.69-version-check.patch  | 6 +-
>   .../postgresql/{postgresql_16.4.bb =3D> postgresql_16.5.bb} |  2 +-
>   ...5-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch | 30
> ++++++++++
>   meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb    | 1 +
>   .../php/php/0001-ext-opcache-config.m4-enable-opcache.patch     | 4 +-
>   .../php/php/0002-build-php.m4-don-t-unset-cache-variables.patch | 2 +-
>   .../0003-php-remove-host-specific-info-from-header-file.patch   | 2 +-
>   .../php/0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch    | 4 +-
>   .../php/php/0008-ext-imap-config.m4-fix-include-paths.patch     | 4 +-
>   .../php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch   | 3 +-
>   meta-oe/recipes-devtools/php/php/0010-iconv-fix-detection.patch | 2 +-
>   meta-oe/recipes-devtools/php/{php_8.2.20.bb =3D> php_8.2.26.bb} |  2 +-
>   meta-oe/recipes-extended/redis/redis_7.2.5.bb                   | 1 +
>   meta-oe/recipes-shells/dash/dash_0.5.12.bb                      | 2 +
>   meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb        | 10 ++=
+-
>   .../recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb   | 7 +++
>   meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb          | 17
> +++---
>   meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb             | 1 +
>   .../recipes-httpd/nginx/{nginx_1.27.1.bb =3D> nginx_1.27.3.bb} |  4 +-
>   42 files changed, 374 insertions(+), 29 deletions(-)
>   create mode 100644
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.=
c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch
>   create mode 100644
> meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-override=
.patch
>   create mode 100644
> meta-multimedia/recipes-multimedia/musicpd/mpd/0001-meson.build-support-b=
uilding-with-ICU-76.patch
>   rename meta-networking/recipes-support/wireshark/{wireshark_4.2.7.bb
> =3D> wireshark_4.2.9.bb} (95%)
>   create mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by=
-updating-.arch-di.patch
>   create mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/0001-Use-a-lambda-function-as-deleter-p=
rototype-in-unique.patch
>   rename meta-oe/recipes-dbs/postgresql/{postgresql_16.4.bb =3D>
> postgresql_16.5.bb} (86%)
>   create mode 100644
> meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0005-Don-t-match-Wnon-virt=
ual-dtor-in-the-flags-are-neede.patch
>   rename meta-oe/recipes-devtools/php/{php_8.2.20.bb =3D> php_8.2.26.bb} =
(99%)
>   rename meta-webserver/recipes-httpd/nginx/{nginx_1.27.1.bb =3D>
> nginx_1.27.3.bb} (53%)
>

