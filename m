Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77416C02183
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 17:06:48 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.561.1737047204367244456
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jan 2025 09:06:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JV0N/OWr;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5f6ffbfb338so289150eaf.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jan 2025 09:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737047203; x=1737652003; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcyCx7fhUfAN5JnvzlPEm7ScvtWF6OsY1TLzrQK7580=;
        b=JV0N/OWrYcFhglTj2Gfnp1CXQ1BwguhtAz+yCWaVuNFsY6p3/KclL6leuR249hEW9N
         3BT/LwvqShUPr6V2+OFlUD9w7rzgIUBtEPkmCFbzdLXXJu6qI5idOzeZGe1vWXwUNhFW
         QK2qzaLjQtZtdOLyNo1/b5WXM/F5kmxvy31ReqH4ushU3BZEGcLNh384FZXWljdPRb0Z
         RMgXa3T1We6aa7XfKZjhEICxHruhqAXfEx5o8U0CQ0Ef8LtvIRWOY1tngEwqk0gbjhTP
         1TvKNEwSK/i9BS0Ja9G+7eVFT12XHnyZ5U2MI6XP097KeFI2miA6L4aooPL7eJoe4gM7
         UfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737047203; x=1737652003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcyCx7fhUfAN5JnvzlPEm7ScvtWF6OsY1TLzrQK7580=;
        b=dGRGt5UluLmJvUMF5PjEg7Ocqqrpvi75KuKpILioIIuuhifErBAzLqOSDR62qJXsFH
         +4adn2siP6jCPJS0PI6rM58UciKGoHRi2IrrZyYgzBlW95DOkdOIlPxRGM0N5ufWEECT
         QC4PMM8AZxJlGBRXwRKtmp1kt/4ySJ532W+iLcOyN8aErAjUEa2VsX5Dw7taAFeIq+sr
         JwSWYpK1meisg+QOTzfEIILxOufWvzCNXE8wY/Eaxj+B0m5DguFO8BQzYzjOMlwKAkw2
         dlfAqzldxR0ctu70FAXne/k4MLfj5D+ScnjQ4TIti1WP6TlJ+1eCVzg2E98rmrWFk574
         WgdA==
X-Gm-Message-State: AOJu0Yym9BTcMUBGSBLz0UnAP+Ilw9QiwBxJcs9vpssSN309tbGwsfMy
	FIh6DgDmgNPctmoeFGJxh9TRwzYGTpjUCFLbjIfSThsrriavBlH85GQqaJDq94bZyWTo3tyX9yP
	j6/KJSmHwC1Y1C1fiLp+7P6o9zmg=
X-Gm-Gg: ASbGncuPQQ2CjmqSt0+S1+1iV9KbOmtvRlKTCK6RiyDwgSZYGA5aFQRnNqkVvWbGBRw
	xzb8zHYIwktxSbnWf/4qG0xfOAapCTCNxzY2G1A==
X-Google-Smtp-Source: AGHT+IEZcZFJVDiWB+yJ8IwKCEnJJc2DzuSq72aFdUtEA7/v0C9gR4b3WhaZGdnMwhc2Ynz2sefMC2Sxcr3XJ8SEJSU=
X-Received: by 2002:a05:6870:9c8f:b0:29e:5e83:150e with SMTP id
 586e51a60fabf-2aa069a90e2mr19672844fac.27.1737047203341; Thu, 16 Jan 2025
 09:06:43 -0800 (PST)
MIME-Version: 1.0
References: <05f57241-f78b-441b-a352-39ebf6f8cabf@gmail.com>
 <CAMKF1srwrOi7Lh72+P0xYmGUs0a2GbvigduRYU6TqaijDt92og@mail.gmail.com> <745edda5-7754-4761-aae4-1b87518322fb@gmail.com>
In-Reply-To: <745edda5-7754-4761-aae4-1b87518322fb@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Jan 2025 09:06:17 -0800
X-Gm-Features: AbW1kvazMbyOuUE1jeNJr30Vf4fuZXOd5qlKzCDcD8nKN2_zMo9BpwjX478bdDE
Message-ID: <CAMKF1soTOH3oFf2dcJOTGO5wLJhkwEFvmzGw-KHAStWFVJUbww@mail.gmail.com>
Subject: Re: styhead merge request: Jan 12th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Jan 2025 17:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114916

On Thu, Jan 16, 2025 at 6:23=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
>
>
>
> On 1/12/25 10:54 PM, Khem Raj wrote:
> > Hi Armin,
> >
> > This is not merging into styhead without conflicts
> >
> > CONFLICT (content): Merge conflict in
> > meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
> > Can you take a look and perhaps update your baseline ?
>
> Hmm.. rebase and pushed again.
>

thanks merged now.

> - armin
> >
> > On Sun, Jan 12, 2025 at 5:02=E2=80=AFPM akuster808 <akuster808@gmail.co=
m> wrote:
> >> The following changes since commit 7cd38212e73e0e9f42f4d92defb16dd81f7=
1221d:
> >>
> >>     lvm2: Remove the lvm2-udevrules package (2024-11-25 15:32:56 -0500=
)
> >>
> >> are available in the Git repository at:
> >>
> >>     https://git.openembedded.org/meta-openembedded styhead-next
> >>
> >> for you to fetch changes up to 31a24ab044a24936f50a80828ecd7048bf5b1f5=
e:
> >>
> >>     libmodule-build-tiny-perl: fix QA Issue: TMPDIR [buildpaths]
> >> (2025-01-12 19:57:19 -0500)
> >>
> >> ----------------------------------------------------------------
> >> Benjamin Bouvier (1):
> >>         bridge-utils: add CVE_PRODUCT
> >>
> >> Derek Straka (1):
> >>         nginx: Upgrade mainline release version 1.27.1 -> 1.27.3
> >>
> >> Ghislain Mang=C3=A9 (1):
> >>         wireshark: use inherit_defer for conditional cases
> >>
> >> Hongxu Jia (1):
> >>         ntfs-3g-ntfsprogs: fix CVE-2023-52890
> >>
> >> J. S. (4):
> >>         libhtml-tree-perl: Drop unnecessary SRC_URI md5sum
> >>         libhtml-tree-perl: update HOMEPAGE
> >>         libhtml-tree-perl: fix QA Issue: TMPDIR [buildpaths]
> >>         libmodule-build-tiny-perl: fix QA Issue: TMPDIR [buildpaths]
> >>
> >> Khem Raj (3):
> >>         mariadb: Fix build with clang-20/trunk
> >>         ghex,gnome-chess,gnome-photos: Add missing dep on itstool-nati=
ve
> >>         mpd: Fix build with icu 76+
> >>
> >> Markus Volk (2):
> >>         geary: add itstool-native dependency
> >>         eog: add itstool-native dependency
> >>
> >> Peter Kjellerstedt (1):
> >>         abseil-cpp: Do not leak -Wnon-virtual-dtor into the .pc files
> >>
> >> Peter Marko (15):
> >>         proftpd: set status of CVE-2001-0027
> >>         dash: set CVE_PRODUCT
> >>         ace: ignore CVE-2009-1147
> >>         apache2: ignore CVE-1999-0678 and CVE-1999-1412
> >>         apache2: remove old version references from CVEs
> >>         spice: ignore CVE-2016-0749
> >>         gattlib: mark CVE-2019-6498 as fixed
> >>         monkey: ignore CVE-2013-1771
> >>         redis: ignore CVE-2022-0543
> >>         spice-gtk: mark CVE-2012-4425 as fixed
> >>         apache2: ignore disputed CVE CVE-2007-0086
> >>         memcached: ignore disputed CVE-2022-26635
> >>         emlog: set CVE_PRODUCT
> >>         php: upgrade 8.2.20 -> 8.2.26
> >>         wireshark: upgrade 4.2.8 -> 4.2.9
> >>
> >> Ruiqiang Hao (1):
> >>         mariadb: Ensure compatibility with ARMv9 by updating .arch dir=
ective
> >>
> >> Yoann Congal (1):
> >>         gimp: fix gimptool buildpaths errors
> >>
> >> Yogita Urade (1):
> >>         postgresql: upgrade 16.4 -> 16.5
> >>
> >>    ...0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch | 4=
2
> >> ++++++++++++++
> >>    .../ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb            | 1=
 +
> >>    meta-gnome/recipes-connectivity/geary/geary_46.0.bb             | 1=
 +
> >>    .../gimp/gimp/0001-gimptool-allow-default-CC-override.patch     | 8=
5
> >> +++++++++++++++++++++++++++++
> >>    meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb                    | 2=
1
> >> +++++++
> >>    meta-gnome/recipes-gnome/eog/eog_47.0.bb                        | 1=
 +
> >>    meta-gnome/recipes-gnome/ghex/ghex_46.0.bb                      | 1=
 +
> >>    meta-gnome/recipes-gnome/gnome-chess/gnome-chess_47.0.bb        | 2=
 +-
> >>    meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb      | 1=
 +
> >>    .../mpd/0001-meson.build-support-building-with-ICU-76.patch     | 5=
2
> >> ++++++++++++++++++
> >>    meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.15.bb       | 1=
 +
> >>    meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb       | 2=
 +
> >>    .../recipes-support/bridge-utils/bridge-utils_1.7.1.bb          | 2=
 +
> >>    meta-networking/recipes-support/memcached/memcached_1.6.17.bb   | 2=
 +
> >>    meta-networking/recipes-support/spice/spice-gtk_0.42.bb         | 2=
 +
> >>    meta-networking/recipes-support/spice/spice_git.bb              | 1=
 +
> >>    .../wireshark/{wireshark_4.2.7.bb =3D> wireshark_4.2.9.bb} |  4 +-
> >>    meta-oe/recipes-connectivity/ace/ace_6.5.19.bb                  | 2=
 +
> >>    meta-oe/recipes-connectivity/gattlib/gattlib_git.bb             | 2=
 +
> >>    meta-oe/recipes-core/emlog/emlog.inc                            | 2=
 +
> >>    meta-oe/recipes-dbs/mysql/mariadb.inc                           | 2=
 +
> >>    ...1-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch | 4=
4
> >> +++++++++++++++
> >>    ...1-Use-a-lambda-function-as-deleter-prototype-in-unique.patch | 2=
6
> >> +++++++++
> >>    .../0003-configure.ac-bypass-autoconf-2.69-version-check.patch  | 6=
 +-
> >>    .../postgresql/{postgresql_16.4.bb =3D> postgresql_16.5.bb} |  2 +-
> >>    ...5-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch | 3=
0
> >> ++++++++++
> >>    meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb    | 1=
 +
> >>    .../php/php/0001-ext-opcache-config.m4-enable-opcache.patch     | 4=
 +-
> >>    .../php/php/0002-build-php.m4-don-t-unset-cache-variables.patch | 2=
 +-
> >>    .../0003-php-remove-host-specific-info-from-header-file.patch   | 2=
 +-
> >>    .../php/0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch    | 4=
 +-
> >>    .../php/php/0008-ext-imap-config.m4-fix-include-paths.patch     | 4=
 +-
> >>    .../php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch   | 3=
 +-
> >>    meta-oe/recipes-devtools/php/php/0010-iconv-fix-detection.patch | 2=
 +-
> >>    meta-oe/recipes-devtools/php/{php_8.2.20.bb =3D> php_8.2.26.bb} |  =
2 +-
> >>    meta-oe/recipes-extended/redis/redis_7.2.5.bb                   | 1=
 +
> >>    meta-oe/recipes-shells/dash/dash_0.5.12.bb                      | 2=
 +
> >>    meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb        | 1=
0 +++-
> >>    .../recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb   | 7=
 +++
> >>    meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb          | 1=
7
> >> +++---
> >>    meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb             | 1=
 +
> >>    .../recipes-httpd/nginx/{nginx_1.27.1.bb =3D> nginx_1.27.3.bb} |  4=
 +-
> >>    42 files changed, 374 insertions(+), 29 deletions(-)
> >>    create mode 100644
> >> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unis=
tr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch
> >>    create mode 100644
> >> meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-overr=
ide.patch
> >>    create mode 100644
> >> meta-multimedia/recipes-multimedia/musicpd/mpd/0001-meson.build-suppor=
t-building-with-ICU-76.patch
> >>    rename meta-networking/recipes-support/wireshark/{wireshark_4.2.7.b=
b
> >> =3D> wireshark_4.2.9.bb} (95%)
> >>    create mode 100644
> >> meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9=
-by-updating-.arch-di.patch
> >>    create mode 100644
> >> meta-oe/recipes-dbs/mysql/mariadb/0001-Use-a-lambda-function-as-delete=
r-prototype-in-unique.patch
> >>    rename meta-oe/recipes-dbs/postgresql/{postgresql_16.4.bb =3D>
> >> postgresql_16.5.bb} (86%)
> >>    create mode 100644
> >> meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0005-Don-t-match-Wnon-v=
irtual-dtor-in-the-flags-are-neede.patch
> >>    rename meta-oe/recipes-devtools/php/{php_8.2.20.bb =3D> php_8.2.26.=
bb} (99%)
> >>    rename meta-webserver/recipes-httpd/nginx/{nginx_1.27.1.bb =3D>
> >> nginx_1.27.3.bb} (53%)
> >>
>

