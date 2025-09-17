Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C99CA0EE8
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 04:39:40 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.web10.14914.1758083975035571952
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 21:39:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eo6wUOnm;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-62a35c99b9fso1565409d50.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 21:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758083974; x=1758688774; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4F6XoVzmwmDWricgkmkL/mUf7MsvPuIivSG21hfwJo=;
        b=eo6wUOnm5dwPAFQcVl8T1W+PvMdJMsEhY6682jHFwNXCen5Bpc3ob4/0g908HdW3E+
         lo7hhrLPA21aGi/RQrytFAaeZT35ohNc8QtOL1iOf6rlI+bf49P2mOeZwqqoqaNKV3xO
         UTjNxRNSEWHKcOlibBxFZf1beTengizflN1l1LBtAajFUgGBoJTK35g9ngK/biKVwELL
         VJtlw2USd7hVytjwFLfA1hn+fVpFfdd/6a1977rAJID/y9xR+c1E9ZqcxA2nWkqD04et
         A/RJcpnBPPChljKvzasCLme0A93AyxlU9P1ITUvb/uAKfCYw0M/lBaacK8u3Z4uFUlJY
         968A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758083974; x=1758688774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4F6XoVzmwmDWricgkmkL/mUf7MsvPuIivSG21hfwJo=;
        b=khw4NI6OZ5ksSOm3Ule67SdAyevzZEzmGEA18T1Chm3/lMqGnwpjSXPToZHJqV1jEr
         qJmM2jNt0q0eYeSSnEnMEy0XoODeKxJE1pxAlTt+D3DupjLEVSdfUmhcAvTzm4Q4on6t
         UZ7J+d7c93zeR9knxqvCqiTqeDNwdAbHyuKrBgbdaQIH0j7GxtAqnuPLP01H4BO4CTqm
         NSbJxNvsqiNRu0tclK1tfpvd74zqiSLUSU7S4pVJ5bsCWC1du61z8EwF2QfUA9n0jxYa
         vmIM5sjHHAUSjMhuHW3sGnzJ8yYWgl0FuhCekYAdc3rgleTECJU4IJNfFmUORWHrMa8T
         65Hg==
X-Gm-Message-State: AOJu0YxKi/DzsLZvlVYFqdU5Z+CiDehbsbrGjlKpWKvVgJe1Jsln32hT
	qOqqmAVaXwnFcx6wQuIgPvtbcyW8Pp46xzibrVc1Zwinc++HGWmdEqeaE5hhCI0vgxE6j/5LoQS
	DP3jdsRAmJRHLWlrOD+A1OTwt9H8EMZE=
X-Gm-Gg: ASbGncuPJ5QUBKRKPkzwRuSuK1mBsYXIUCpSvmEXizDr9fp4Vd4wToI6DL/e9WaK718
	0OozXzg9gThEWTUmSLYxUSjNb+bokxSF+Np5AMxshhSLWNYrt3dnaE5BhwJVrlHWqAFZJjU6ASc
	N4TuOtZHpM9tbkp6oI7pIaVqOJXM9WkM4qbaxjhLT0uxLXMBORZ4dqezbNLA/qM0/WKnzymQcuf
	rCvTAEopEtHCOiQpBX28UEauLjJ45MBmGwxxJoTTGnocA67/HsBmLU203G67nc7wO5lzptrLB8o
	k6y14D7RQH2wexJc5+4fD5Jh
X-Google-Smtp-Source: AGHT+IGnmAH20lUh+P0rYuUNIRj6l9YrrMUCwIC0mAaogSgzqudnHnX0gUogQeGZyNHqgalVsmdLYBY0yx8g4V5lKRA=
X-Received: by 2002:a53:4c02:0:b0:628:2e16:6566 with SMTP id
 956f58d0204a3-633b03c4624mr596741d50.0.1758083973959; Tue, 16 Sep 2025
 21:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250916071900.2264263-1-skandigraun@gmail.com>
In-Reply-To: <20250916071900.2264263-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Sep 2025 21:39:07 -0700
X-Gm-Features: AS18NWBrIr2u77yTF_VgT6MfbDfvUdb4oKOygz0j0DZBOJJis-tZ2A7Da90fyGU
Message-ID: <CAMKF1sowDSPUzqtOtrtwY_CQDp3GYSLj=kV=bwayik1bSCUu6A@mail.gmail.com>
Subject: Re: [oe] Walnascar pull request Sep 16th
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 04:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119475

Thanks Gyorgy, merged thanks.

On Tue, Sep 16, 2025 at 12:19=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Please find below a summary of updates for the Walnascar branch.
> The changes were tested with a full world build on x86, x86-64, arm and a=
arch platforms.
>
> The following changes since commit dca497d728792e3cb655c78455c2d649af312c=
e8:
>
>   ][PATCH] ufs-utils: fix crash for ufs-utils list_bsg (2025-07-27 14:35:=
10 -0400)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded-contrib stable/walnascar-n=
ut
>
> for you to fetch changes up to 80ab58cc404959ae2f0e8b2e68935b3bfd8e8cfe:
>
>   readme: update maintainer (2025-09-16 08:37:07 +0200)
>
> ----------------------------------------------------------------
> Bo Sun (1):
>       thin-provisioning-tools: fix bindgen build error with clang on octe=
ontx2
>
> Changqing Li (2):
>       libwnck3: fix build failure for lib32-libwnck3
>       libwnck: fix build failure for lib32-libwnck
>
> Chen Qi (3):
>       protobuf: upgrade from 5.29.4 to 5.29.5
>       python3-protobuf: upgrade from 5.29.4 to 5.29.5
>       libnwck/libnwck3: use time_t to avoid build failure
>
> Gijs Peskens (1):
>       php: fix removal of --with-zlib-dir configure option
>
> Gyorgy Sarvari (6):
>       metacity: fix compilation on 32-bit systems
>       pgpool2: fix compiling for 32-bit arches
>       libgdata: fix compiling for 32-bit targets
>       libchamplain: don't compile for 32-bit targets
>       ledmon: fix building on 32-bit x86
>       readme: update maintainer
>
> Hitendra Prajapati (1):
>       openjpeg: fix for CVE-2025-54874
>
> Jason Schonberg (6):
>       php: upgrade 8.4.6 -> 8.4.8
>       php: upgrade 8.4.8 -> 8.4.10
>       c-ares: backport a patch for a memory leak
>       pgpool2: upgrade 4.5.1 -> 4.5.2
>       pgpool2: upgrade 4.5.2 -> 4.5.3
>       pgpool2: upgrade 4.5.3 -> 4.5.4
>
> Jef Driesen (1):
>       lcov: Add missing RDEPENDS for nativesdk
>
> Jeroen Hofstee (1):
>       php: sort PACKAGECONFIG options
>
> Jiaying Song (7):
>       v4l-utils: Fix QA and build errors related to _TIME_BITS on 32-bit
>       debootstrap: correct the SRC_URI
>       logcheck: correct the SRC_URI
>       passwdqc: correct the SRC_URI
>       libconfig: switch source to GitHub repository
>       yaffs2-utils: correct the SRC_URI
>       softhsm: switch source to GitHub repository
>
> Jinfeng Wang (1):
>       iperf3: Fix CVE-2025-54349
>
> Khem Raj (2):
>       jq: Add tzdata to ptest rdeps
>       gtkwave: Add libtirpc to depends
>
> Koen Kooi (1):
>       libwnck: update to 43.2 and fix build errors
>
> Marc Ferland (2):
>       freerdp3: add bindir to SYSROOT_DIRS
>       libvncserver: fix generated LibVNCServerTargets.cmake
>
> Martin Jansa (1):
>       libiodbc: use gnu17 and ignore incompatible-pointer-types to allow =
building with gcc-15
>
> Peter Marko (7):
>       corosync: fix upstream version check
>       corosync: upgrade 3.1.6 -> 3.1.9
>       corosync: patch CVE-2025-30472
>       libbpf: patch CVE-2025-29481
>       fontforge: patch CVE-2024-25081 and CVE-2024-25082
>       fcgi: patch CVE-2025-23016
>       nginx: patch CVE-2025-53859
>
> Richard Leitner (1):
>       python3-moteus: upgrade 0.3.88 -> 0.3.89
>
> Robert Yang (1):
>       CVE-2025-53643.patch: Add CVE ID
>
> Wang Mingyu (3):
>       apache2: upgrade 2.4.63 -> 2.4.64
>       libssh: upgrade 0.11.1 -> 0.11.2
>       jq: upgrade 1.8.0 -> 1.8.1
>
> Yi Zhao (1):
>       valkey: upgrade 8.1.1 -> 8.1.3
>
> Yoann Congal (3):
>       python3-evdev: upgrade 1.9.1 -> 1.9.2
>       python3-evdev: add missing uinput header
>       python3-evdev: add ptest
>
> Yogita Urade (2):
>       poppler: upgrade 25.06.0 -> 25.08.0
>       postgresql: upgrade 17.5 -> 17.6
>
> Zhang Peng (1):
>       wxwidgets: fix CVE-2024-58249
>
>  README.md                                          |    2 +-
>  meta-filesystems/README.md                         |    2 +-
>  .../recipes-filesystems/yaffs2/yaffs2-utils_git.bb |    2 +-
>  meta-gnome/README.md                               |    2 +-
>  .../libchamplain/libchamplain_0.12.21.bb           |   11 +
>  .../0001-Drop-usage-of-deprecated-GTimeVal.patch   | 1134 ++++++++++++++=
++++++
>  .../recipes-gnome/libgdata/libgdata_0.18.1.bb      |    2 +
>  ...ssue-caused-by-OE-core-changes-to-startup.patch |   50 +
>  ...t.c-fix-Wincompatible-pointer-types-error.patch |   42 +
>  .../ef0e40d59c32d7ebeb94d242436e3144cefc174a.patch |   40 +
>  .../libwnck/{libwnck3_43.0.bb =3D> libwnck3_43.2.bb} |    4 +-
>  meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb |    2 +
>  ..._sn_startup_sequence_get_last_active_time.patch |  188 ++++
>  .../recipes-gnome/metacity/metacity_3.52.0.bb      |    3 +-
>  meta-initramfs/README.md                           |    2 +-
>  meta-multimedia/README.md                          |    2 +-
>  meta-networking/README.md                          |    2 +-
>  .../corosync/corosync/CVE-2025-30472.patch         |   69 ++
>  .../{corosync_3.1.6.bb =3D> corosync_3.1.9.bb}       |   17 +-
>  .../0001-fix-compiling-on-32-bit-systems.patch     |   83 ++
>  ...d-math.h-to-ensure-isnan-and-isinf-are-de.patch |   40 +
>  .../pgpool2/{pgpool2_4.5.1.bb =3D> pgpool2_4.5.4.bb} |    6 +-
>  .../thin-provisioning-tools_1.1.0.bb               |    5 +-
>  .../iperf3/iperf3/CVE-2025-54349.patch             |   98 ++
>  meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb    |    1 +
>  .../ledmon/ledmon/Correct-get_uint64.patch         |   44 +
>  meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb          |    3 +-
>  ...ure.ac-bypass-autoconf-2.69-version-check.patch |    6 +-
>  .../{postgresql_17.5.bb =3D> postgresql_17.6.bb}     |    4 +-
>  .../debootstrap/debootstrap_1.0.140.bb             |    2 +-
>  .../jq/{jq_1.8.0.bb =3D> jq_1.8.1.bb}                |    8 +-
>  .../php/{php_8.4.6.bb =3D> php_8.4.10.bb}            |   26 +-
>  .../{protobuf_5.29.4.bb =3D> protobuf_5.29.5.bb}     |    2 +-
>  .../recipes-extended/libconfig/libconfig_1.7.3.bb  |    6 +-
>  .../valkey/valkey/init-valkey-server               |    0
>  .../valkey/{valkey_8.1.1.bb =3D> valkey_8.1.3.bb}    |    4 +-
>  .../wxwidgets/wxwidgets/CVE-2024-58249.patch       |  178 +++
>  .../recipes-extended/wxwidgets/wxwidgets_3.2.6.bb  |    1 +
>  .../fontforge/CVE-2024-25081_CVE-2024-25082.patch  |  181 ++++
>  .../fontforge/fontforge_20230101.bb                |    1 +
>  .../recipes-graphics/gtkwave/gtkwave_3.3.121.bb    |    1 +
>  .../libvncserver/libvncserver_0.9.14.bb            |    4 +-
>  .../openjpeg/openjpeg/CVE-2025-54874.patch         |   44 +
>  .../recipes-graphics/openjpeg/openjpeg_2.5.3.bb    |    1 +
>  .../libbpf/files/CVE-2025-29481.patch              |  102 ++
>  meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb      |    1 +
>  ...3-meson.build-fix-arm-_TIME_BITS-64-error.patch |   38 +
>  .../v4l2apps/v4l-utils_1.28.1.bb                   |    5 +-
>  .../recipes-security/passwdqc/passwdqc_2.0.3.bb    |    2 +-
>  meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb  |    5 +-
>  .../c-ares/c-ares/0001-ares_uri-memory-leak.patch  |   21 +
>  meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb    |    1 +
>  meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb  |    1 +
>  meta-oe/recipes-support/lcov/lcov_1.16.bb          |    6 +
>  .../recipes-support/libiodbc/libiodbc_3.52.16.bb   |    6 +
>  .../libssh/{libssh_0.11.1.bb =3D> libssh_0.11.2.bb}  |    4 +-
>  .../{poppler_25.06.0.bb =3D> poppler_25.08.0.bb}     |    2 +-
>  meta-perl/README.md                                |    2 +-
>  .../recipes-extended/logcheck/logcheck_1.4.3.bb    |    2 +-
>  meta-python/README.md                              |    2 +-
>  .../include/ptest-packagelists-meta-python.inc     |    1 +
>  .../python/python3-aiohttp/CVE-2025-53643.patch    |    2 +
>  ...roducibility-option-for-building-ecodes.c.patch |  116 --
>  ...thon3-evdev_1.9.1.bb =3D> python3-evdev_1.9.2.bb} |    9 +-
>  ...3-moteus_0.3.88.bb =3D> python3-moteus_0.3.89.bb} |    2 +-
>  ...otobuf_5.29.4.bb =3D> python3-protobuf_5.29.5.bb} |    2 +-
>  meta-webserver/README.md                           |    2 +-
>  .../{apache2_2.4.63.bb =3D> apache2_2.4.64.bb}       |    2 +-
>  .../recipes-httpd/nginx/files/CVE-2025-53859.patch |  131 +++
>  meta-webserver/recipes-httpd/nginx/nginx.inc       |    1 +
>  .../recipes-support/fcgi/fcgi/CVE-2025-23016.patch |   40 +
>  meta-webserver/recipes-support/fcgi/fcgi_git.bb    |    1 +
>  meta-xfce/README.md                                |    2 +-
>  73 files changed, 2643 insertions(+), 193 deletions(-)
>  create mode 100644 meta-gnome/recipes-gnome/libgdata/libgdata/0001-Drop-=
usage-of-deprecated-GTimeVal.patch
>  create mode 100644 meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build=
-issue-caused-by-OE-core-changes-to-startup.patch
>  create mode 100644 meta-gnome/recipes-gnome/libwnck/files/0001-tasklist.=
c-fix-Wincompatible-pointer-types-error.patch
>  create mode 100644 meta-gnome/recipes-gnome/libwnck/files/ef0e40d59c32d7=
ebeb94d242436e3144cefc174a.patch
>  rename meta-gnome/recipes-gnome/libwnck/{libwnck3_43.0.bb =3D> libwnck3_=
43.2.bb} (75%)
>  create mode 100644 meta-gnome/recipes-gnome/metacity/metacity/screen_avo=
id_sn_startup_sequence_get_last_active_time.patch
>  create mode 100644 meta-networking/recipes-extended/corosync/corosync/CV=
E-2025-30472.patch
>  rename meta-networking/recipes-extended/corosync/{corosync_3.1.6.bb =3D>=
 corosync_3.1.9.bb} (84%)
>  create mode 100644 meta-networking/recipes-support/pgpool2/pgpool2/0001-=
fix-compiling-on-32-bit-systems.patch
>  create mode 100644 meta-networking/recipes-support/pgpool2/pgpool2/0001-=
snprintf-Add-math.h-to-ensure-isnan-and-isinf-are-de.patch
>  rename meta-networking/recipes-support/pgpool2/{pgpool2_4.5.1.bb =3D> pg=
pool2_4.5.4.bb} (85%)
>  create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-5434=
9.patch
>  create mode 100644 meta-oe/recipes-bsp/ledmon/ledmon/Correct-get_uint64.=
patch
>  rename meta-oe/recipes-dbs/postgresql/{postgresql_17.5.bb =3D> postgresq=
l_17.6.bb} (76%)
>  rename meta-oe/recipes-devtools/jq/{jq_1.8.0.bb =3D> jq_1.8.1.bb} (88%)
>  rename meta-oe/recipes-devtools/php/{php_8.4.6.bb =3D> php_8.4.10.bb} (9=
8%)
>  rename meta-oe/recipes-devtools/protobuf/{protobuf_5.29.4.bb =3D> protob=
uf_5.29.5.bb} (99%)
>  mode change 100755 =3D> 100644 meta-oe/recipes-extended/valkey/valkey/in=
it-valkey-server
>  rename meta-oe/recipes-extended/valkey/{valkey_8.1.1.bb =3D> valkey_8.1.=
3.bb} (96%)
>  create mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/CVE-2024=
-58249.patch
>  create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2024=
-25081_CVE-2024-25082.patch
>  create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-5=
4874.patch
>  create mode 100644 meta-oe/recipes-kernel/libbpf/files/CVE-2025-29481.pa=
tch
>  create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-me=
son.build-fix-arm-_TIME_BITS-64-error.patch
>  create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0001-ares_uri-m=
emory-leak.patch
>  rename meta-oe/recipes-support/libssh/{libssh_0.11.1.bb =3D> libssh_0.11=
.2.bb} (94%)
>  rename meta-oe/recipes-support/poppler/{poppler_25.06.0.bb =3D> poppler_=
25.08.0.bb} (96%)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-evdev/000=
1-Add-a-reproducibility-option-for-building-ecodes.c.patch
>  rename meta-python/recipes-devtools/python/{python3-evdev_1.9.1.bb =3D> =
python3-evdev_1.9.2.bb} (62%)
>  rename meta-python/recipes-devtools/python/{python3-moteus_0.3.88.bb =3D=
> python3-moteus_0.3.89.bb} (82%)
>  rename meta-python/recipes-devtools/python/{python3-protobuf_5.29.4.bb =
=3D> python3-protobuf_5.29.5.bb} (95%)
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.63.bb =3D> apac=
he2_2.4.64.bb} (99%)
>  create mode 100755 meta-webserver/recipes-httpd/nginx/files/CVE-2025-538=
59.patch
>  create mode 100644 meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-230=
16.patch
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119419): https://lists.openembedded.org/g/openembedde=
d-devel/message/119419
> Mute This Topic: https://lists.openembedded.org/mt/115269320/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

