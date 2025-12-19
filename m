Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ABB8D711CF
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 00:27:35 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6777.1766104051483582934
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 16:27:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MPj6c5Op;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78c5b5c1eccso18163717b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 16:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766104050; x=1766708850; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2aVfKMTbncsfrsYsKf3A5xt+6vj48Q0g1KvqnI5w+Is=;
        b=MPj6c5OpMfenR6V1R/SbDab/2VonlLsesdD7dITzo8tWFSn9sBpd2ApKZgeZGQissG
         s9rkkVh0c93r5aLTrarbx7jIe4A9oStiGfCfASXtAEu7SjrwsFnISq9FdzWbfr/0C2QO
         lcEsAE8+ttqhmFdydC6TfCyO7d3mXtjhRo5swGSsRsjodr2o0efb0Fm7nx24qXiIGINF
         MG3xeA/sUWjNMKbO0MXN+KWt16LXsg16FTTuQC9Wf4JhWaBbrUC2i+EfJyxOpRgjr0Nb
         YJ/1IS256T2lSzqLkNmGxT3KrOatkIMLU4z+MZBwbllEEmK/gSrXwUlDTLTGjFPIdJca
         tPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766104050; x=1766708850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aVfKMTbncsfrsYsKf3A5xt+6vj48Q0g1KvqnI5w+Is=;
        b=DRkyTtXkdY2UoHnxh/Fe5gGxEN9L24vgpo/psY1RYBUVi/VeMXmY85Tx/OagXkK9HD
         Weiep27qSd9J8AZ00RyaLgab8JImeR3LNzlU9gxH7beDccsMmU3U39eCSaoiGRTuFdSY
         fQMpd7YnuWopVf4Sk3IJ2s6z8A8fXndtZELtUBhiTgUkWgtEmodcAWfeIS5TSMaP+fRt
         ssnup5cVc/eO7uMyXvppZZlruSB1NAC/8Bz3OsT9MnJiULaKEG+eV3n+PVWTL/mWH5n/
         x4POkmMfywGreigwYQrnYc9hh9tLGQDVtdojHYDadwB5P5Rt5GBh/G3SU1C+R+xvGqux
         CmZA==
X-Gm-Message-State: AOJu0Ywv0GqPPak1mG3iDKkM9sG2DyH3OqSzeR5bw3zXjMpaVb7zydhV
	SSCumm1/HaBKY8kXMD9ePABu2mZX9tR2/6Ho2M9TLt9VGnej3QQb7E39MzipubsIZpTzrNYd1Eq
	okFmTyDO5Q4PrXR5YPTmTOS9ktFi/HmI=
X-Gm-Gg: AY/fxX5gf8Wu+4HiJqCF39o4Mob+ovuxRlNcRbixtrYkeZ0UMnjQ7JOqF8Gj23mBPyw
	MPZq0V0BR6uMyWKNUb+JudUb41jEMrQocZRjVryCXoTyorirZr8ImxIGciHk0csbA/GHSiw/blN
	luEjrtRhXa0ixhAddKvoHBs+b5suRRCGpzFGlXX1e/6uXNQOzaQDuZylqw/3Ua6NCP9OV3CpGHz
	GpCKEF44FNyvdPQ0EPMDIcBUqA5codgNOxtopDkskkwHAaEDj14zwsWe9gyn7rsqAZKw/jyPv2q
	4iJd+n3ho637zYef1pd5AqDID/m+FeZnHOrvJvdDRvdwQpKeC73ddgb41sSZC3ghCgVyDgfwtco
	odn4jOdmXa09w
X-Google-Smtp-Source: AGHT+IEyYJrRgbNXP8rgcgaUH8soR/xeH+eu4CEiLb1vo5YId042/949QEpwqjXVPlXEtliL7AxgrLgoHTAsCLwANuo=
X-Received: by 2002:a05:690c:e3ed:b0:786:5d0a:c273 with SMTP id
 00721157ae682-78fa5b378bfmr41016327b3.23.1766104050356; Thu, 18 Dec 2025
 16:27:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1766102578.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1766102578.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Dec 2025 20:27:04 -0400
X-Gm-Features: AQt7F2r01SlF9r3qSnfXnu71wXxgWh2SYyjDawevJAh89qLaOjtac9HKLYGvyTI
Message-ID: <CAMKF1sox2LQBbNB7zKzJ77opEuhMQgMcAOfL0pw+FXueJ0WjAA@mail.gmail.com>
Subject: Re: [PATCH 00/56] Whinlatter pull request
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008ed6490646432454"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Dec 2025 00:27:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122771

--0000000000008ed6490646432454
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LGTM, merged now

Thanks
-Khem

On Thu, Dec 18, 2025 at 8:11=E2=80=AFPM Anuj Mittal <anuj.mittal@oss.qualco=
mm.com>
wrote:

> Please merge these changes in whinlatter.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1187
>
> I've dropped some patches sent to the list for whinlatter that included
> major version upgrades or changes to behaviour (pcre -> pcre2).
>
> The following changes since commit
> 09c7f76c196876a4366f220b360f4bdb93ab95c0:
>
>   libunix-statgrab: Put LD export in do_configure (2025-11-23 00:12:01
> -0800)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib
> stable/whinlatter-next
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/wh=
inlatter-next
>
> Alper Ak (1):
>   proj: Fix do_package QA issue for unshipped bash-completion files
>
> Ankur Tyagi (2):
>   python3-django: upgrade 5.2.7 -> 5.2.8
>   python3-django: upgrade 4.2.25 -> 4.2.26
>
> Changqing Li (5):
>   hdf5: fix do_package failure when multilib enabled
>   hdf5: inherit pkgconfig
>   version-check.conf: mute version mismatch warning for flite
>   version-check.conf: mute version mismatch warning for bpftrace
>   libmng: correct version of libmng
>
> Gyorgy Sarvari (8):
>   libao: ignore CVE-2017-11548
>   cockpit: set correct CVE_PRODUCT
>   tigervnc: ignore CVE-2014-8241
>   breakpad: correct SRC_URI branch
>   gssdp: upgrade 1.6.3 -> 1.6.4
>   gupnp: upgrade 1.6.6 -> 1.6.9
>   gupnp-av: upgrade 0.14.1 -> 0.14.4
>   gupnp-tools: upgrade 0.12.1 -> 0.12.2
>
> Jason Schonberg (3):
>   xdebug: upgrade 3.4.6 -> 3.4.7
>   php: upgrade 8.4.14 -> 8.4.15
>   gsoap: upgrade 2.8.135 -> 2.8.137
>
> Khem Raj (5):
>   wxwidgets: Upgrade to 3.2.8.1 bugfix release
>   fuse3: Add missing rdep on file for ptests
>   fuse3: Fix build with clang on riscv32
>   e2tools: Fix buildpaths in ptests
>   libplist: Fix buildpaths in ptests
>
> Leon Anavi (3):
>   python3-polyline: Upgrade 2.0.3 -> 2.0.4
>   python3-cloudpickle: Upgrade 3.1.1 -> 3.1.2
>   python3-huey: Upgrade 2.5.4 -> 2.5.5
>
> Liu Yiding (2):
>   lvm2: upgrade 2.03.36 -> 2.03.37
>   pgpool2: 4.6.3 -> 4.6.4
>
> Mingli Yu (3):
>   mariadb: Upgrade 11.4.8 -> 11.4.9
>   openipmi: Pass BUILD_CFLAGS to BUILD_CC
>   bpftool-native: Empty DEBUG_PREFIX_MAP_EXTRA
>
> Peter Marko (1):
>   libcoap: upgrade 4.3.5 -> 4.3.5a
>
> Valeria Petrov (1):
>   apache2: upgrade 2.4.65 -> 2.4.66
>
> Viswanath Kraleti (1):
>   gflags: switch Git branch from master to main
>
> Wang Mingyu (19):
>   debootstrap: upgrade 1.0.141 -> 1.0.142
>   libgphoto2: upgrade 2.5.32 -> 2.5.33
>   asyncmqtt: upgrade 10.2.5 -> 10.2.6
>   libnice: upgrade 0.1.22 -> 0.1.23
>   psqlodbc: upgrade 17.00.0006 -> 17.00.0007
>   fcgi: upgrade 2.4.6 -> 2.4.7
>   swagger-ui: upgrade 5.30.2 -> 5.30.3
>   openvpn: upgrade 2.6.15 -> 2.6.16
>   libdaq: upgrade 3.0.22 -> 3.0.23
>   postfix: upgrade 3.10.5 -> 3.10.6
>   nautilus: upgrade 49.1 -> 49.2
>   python3-gpt-image: upgrade 0.9.0 -> 0.9.1
>   python3-moteus: upgrade 0.3.95 -> 0.3.96
>   python3-rich-argparse: upgrade 1.7.1 -> 1.7.2
>   python3-eventlet: upgrade 0.40.3 -> 0.40.4
>   python3-gmpy2: upgrade 2.2.1 -> 2.2.2
>   python3-pybcj: upgrade 1.0.6 -> 1.0.7
>   python3-pymodbus: upgrade 3.11.3 -> 3.11.4
>   python3-sqlparse: upgrade 0.5.3 -> 0.5.4
>
> Yi Zhao (1):
>   crash: add zlib-native to depends for crash-cross
>
> yuyu (1):
>   trace-cmd: Update SRC_URI to use HTTPS protocol
>
>  .../recipes-utils/e2tools/e2tools_0.1.2.bb    |  16 +-
>  .../{nautilus_49.1.bb =3D> nautilus_49.2.bb}    |   2 +-
>  ...mplate-use-basename-instead-of-filen.patch |  32 --
>  .../gupnp/{gssdp_1.6.3.bb =3D> gssdp_1.6.4.bb}  |   5 +-
>  .../0001-all-Drop-xmlRecoverMemory.patch      |  44 ---
>  ...{gupnp-av_0.14.1.bb =3D> gupnp-av_0.14.4.bb} |   8 +-
>  ...-tools_0.12.1.bb =3D> gupnp-tools_0.12.2.bb} |   2 +-
>  ...mplate-use-basename-instead-of-filen.patch |  32 --
>  .../gupnp/{gupnp_1.6.6.bb =3D> gupnp_1.6.9.bb}  |   5 +-
>  .../recipes-multimedia/libao/libao_1.2.0.bb   |   2 +
>  .../{libdaq_3.0.22.bb =3D> libdaq_3.0.23.bb}    |   2 +-
>  .../{postfix_3.10.5.bb =3D> postfix_3.10.6.bb}  |   2 +-
>  .../{libcoap_4.3.5.bb =3D> libcoap_4.3.5a.bb}   |   6 +-
>  ...ile.am-Pass-BUILD_CFLAGS-to-BUILD_CC.patch |  35 ++
>  .../openipmi/openipmi_2.0.37.bb               |   1 +
>  .../{openvpn_2.6.15.bb =3D> openvpn_2.6.16.bb}  |   2 +-
>  ...h.h-to-ensure-isnan-and-isinf-are-de.patch |  40 ---
>  ...e-time-calculations-always-long-long.patch | 336 ------------------
>  .../{pgpool2_4.6.3.bb =3D> pgpool2_4.6.4.bb}    |   4 +-
>  meta-oe/conf/version-check.conf               |   2 +
>  ...syncmqtt_10.2.5.bb =3D> asyncmqtt_10.2.6.bb} |   2 +-
>  ...ive_11.4.8.bb =3D> mariadb-native_11.4.9.bb} |   0
>  meta-oe/recipes-dbs/mysql/mariadb.inc         |   3 +-
>  ...lity-with-ARMv9-by-updating-.arch-di.patch |  41 ---
>  .../{mariadb_11.4.8.bb =3D> mariadb_11.4.9.bb}  |   0
>  ...xpected-output-file-for-descrec-test.patch |  72 ----
>  .../psqlodbc-fix-for-ptest-support.patch      |  17 +-
>  ...c_17.00.0006.bb =3D> psqlodbc_17.00.0007.bb} |  13 +-
>  .../breakpad/breakpad_2023.06.01.bb           |   2 +-
>  ...trap_1.0.141.bb =3D> debootstrap_1.0.142.bb} |   2 +-
>  .../php/{php_8.4.14.bb =3D> php_8.4.15.bb}      |   2 +-
>  .../libimobiledevice/libplist_2.6.0.bb        |  10 +-
>  ...xwidgets_3.2.8.bb =3D> wxwidgets_3.2.8.1.bb} |   4 +-
>  ...gphoto2_2.5.32.bb =3D> libgphoto2_2.5.33.bb} |   2 +-
>  ...0001-configura.ac-update-the-version.patch |  32 ++
>  .../recipes-graphics/libmng/libmng_2.0.3.bb   |   3 +-
>  .../tigervnc/tigervnc_1.15.0.bb               |   2 +
>  .../bpftool/bpftool-native_6.16.bb            |   2 +
>  meta-oe/recipes-kernel/crash/crash_8.0.6.bb   |   2 +
>  .../trace-cmd/trace-cmd_3.1.5.bb              |   2 +-
>  meta-oe/recipes-navigation/proj/proj_9.7.0.bb |   4 +-
>  meta-oe/recipes-support/fuse/fuse3_3.16.2.bb  |   4 +
>  .../recipes-support/gflags/gflags_2.2.2.bb    |   2 +-
>  .../{gsoap_2.8.135.bb =3D> gsoap_2.8.137.bb}    |   2 +-
>  meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |   9 +-
>  .../{libnice_0.1.22.bb =3D> libnice_0.1.23.bb}  |   6 +-
>  meta-oe/recipes-support/lvm2/lvm2.inc         |   4 +-
>  ..._3.1.1.bb =3D> python3-cloudpickle_3.1.2.bb} |   9 +-
>  ...ngo_4.2.25.bb =3D> python3-django_4.2.26.bb} |   4 +-
>  ...jango_5.2.7.bb =3D> python3-django_5.2.8.bb} |   2 +-
>  ...t_0.40.3.bb =3D> python3-eventlet_0.40.4.bb} |   2 +-
>  ...-gmpy2_2.2.1.bb =3D> python3-gmpy2_2.2.2.bb} |   2 +-
>  ...n3-huey_2.5.4.bb =3D> python3-huey_2.5.5.bb} |   2 +-
>  ...eus_0.3.95.bb =3D> python3-moteus_0.3.96.bb} |   2 +-
>  ...ine_2.0.3.bb =3D> python3-polyline_2.0.4.bb} |   2 +-
>  ...-pybcj_1.0.6.bb =3D> python3-pybcj_1.0.7.bb} |   2 +-
>  ...s_3.11.3.bb =3D> python3-pymodbus_3.11.4.bb} |   2 +-
>  ....7.1.bb =3D> python3-rich-argparse_1.7.2.bb} |   2 +-
>  ...rse_0.5.3.bb =3D> python3-sqlparse_0.5.4.bb} |   2 +-
>  ...ge_0.9.0.bb =3D> python3-gpt-image_0.9.1.bb} |   4 +-
>  ...gger-ui_5.30.2.bb =3D> swagger-ui_5.30.3.bb} |   2 +-
>  .../{apache2_2.4.65.bb =3D> apache2_2.4.66.bb}  |   2 +-
>  .../{xdebug_3.4.6.bb =3D> xdebug_3.4.7.bb}      |   2 +-
>  .../fcgi/{fcgi_2.4.6.bb =3D> fcgi_2.4.7.bb}     |   2 +-
>  .../recipes-webadmin/cockpit/cockpit_349.bb   |   2 +
>  65 files changed, 182 insertions(+), 687 deletions(-)
>  rename meta-gnome/recipes-gnome/nautilus/{nautilus_49.1.bb =3D>
> nautilus_49.2.bb} (93%)
>  delete mode 100644
> meta-multimedia/recipes-connectivity/gupnp/gssdp/0001-gssdp-enums.c.templ=
ate-use-basename-instead-of-filen.patch
>  rename meta-multimedia/recipes-connectivity/gupnp/{gssdp_1.6.3.bb =3D>
> gssdp_1.6.4.bb} (82%)
>  delete mode 100644
> meta-multimedia/recipes-connectivity/gupnp/gupnp-av/0001-all-Drop-xmlReco=
verMemory.patch
>  rename meta-multimedia/recipes-connectivity/gupnp/{gupnp-av_0.14.1.bb =
=3D>
> gupnp-av_0.14.4.bb} (51%)
>  rename meta-multimedia/recipes-connectivity/gupnp/{gupnp-tools_0.12.1.bb
> =3D> gupnp-tools_0.12.2.bb} (84%)
>  delete mode 100644
> meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-gupnp-enums.c.templ=
ate-use-basename-instead-of-filen.patch
>  rename meta-multimedia/recipes-connectivity/gupnp/{gupnp_1.6.6.bb =3D>
> gupnp_1.6.9.bb} (83%)
>  rename meta-networking/recipes-connectivity/daq/{libdaq_3.0.22.bb =3D>
> libdaq_3.0.23.bb} (92%)
>  rename meta-networking/recipes-daemons/postfix/{postfix_3.10.5.bb =3D>
> postfix_3.10.6.bb} (99%)
>  rename meta-networking/recipes-devtools/libcoap/{libcoap_4.3.5.bb =3D>
> libcoap_4.3.5a.bb} (90%)
>  create mode 100644
> meta-networking/recipes-support/openipmi/files/0001-Makefile.am-Pass-BUIL=
D_CFLAGS-to-BUILD_CC.patch
>  rename meta-networking/recipes-support/openvpn/{openvpn_2.6.15.bb =3D>
> openvpn_2.6.16.bb} (98%)
>  delete mode 100644
> meta-networking/recipes-support/pgpool2/pgpool2/0001-snprintf-Add-math.h-=
to-ensure-isnan-and-isinf-are-de.patch
>  delete mode 100644
> meta-networking/recipes-support/pgpool2/pgpool2/v1-0001-Make-time-calcula=
tions-always-long-long.patch
>  rename meta-networking/recipes-support/pgpool2/{pgpool2_4.6.3.bb =3D>
> pgpool2_4.6.4.bb} (89%)
>  rename meta-oe/recipes-connectivity/asyncmqtt/{asyncmqtt_10.2.5.bb =3D>
> asyncmqtt_10.2.6.bb} (87%)
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.8.bb =3D>
> mariadb-native_11.4.9.bb} (100%)
>  delete mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by=
-updating-.arch-di.patch
>  rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.8.bb =3D> mariadb_11.4.9.=
bb}
> (100%)
>  delete mode 100644
> meta-oe/recipes-dbs/psqlodbc/files/add-expected-output-file-for-descrec-t=
est.patch
>  rename meta-oe/recipes-dbs/psqlodbc/{psqlodbc_17.00.0006.bb =3D>
> psqlodbc_17.00.0007.bb} (87%)
>  rename meta-oe/recipes-devtools/debootstrap/{debootstrap_1.0.141.bb =3D>
> debootstrap_1.0.142.bb} (89%)
>  rename meta-oe/recipes-devtools/php/{php_8.4.14.bb =3D> php_8.4.15.bb}
> (99%)
>  rename meta-oe/recipes-extended/wxwidgets/{wxwidgets_3.2.8.bb =3D>
> wxwidgets_3.2.8.1.bb} (98%)
>  rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.32.bb =3D>
> libgphoto2_2.5.33.bb} (93%)
>  create mode 100644
> meta-oe/recipes-graphics/libmng/libmng/0001-configura.ac-update-the-versi=
on.patch
>  rename meta-oe/recipes-support/gsoap/{gsoap_2.8.135.bb =3D>
> gsoap_2.8.137.bb} (93%)
>  rename meta-oe/recipes-support/libnice/{libnice_0.1.22.bb =3D>
> libnice_0.1.23.bb} (88%)
>  rename meta-python/recipes-devtools/python/{python3-cloudpickle_3.1.1.bb
> =3D> python3-cloudpickle_3.1.2.bb} (55%)
>  rename meta-python/recipes-devtools/python/{python3-django_4.2.25.bb =3D=
>
> python3-django_4.2.26.bb} (70%)
>  rename meta-python/recipes-devtools/python/{python3-django_5.2.7.bb =3D>
> python3-django_5.2.8.bb} (60%)
>  rename meta-python/recipes-devtools/python/{python3-eventlet_0.40.3.bb
> =3D> python3-eventlet_0.40.4.bb} (83%)
>  rename meta-python/recipes-devtools/python/{python3-gmpy2_2.2.1.bb =3D>
> python3-gmpy2_2.2.2.bb} (82%)
>  rename meta-python/recipes-devtools/python/{python3-huey_2.5.4.bb =3D>
> python3-huey_2.5.5.bb} (78%)
>  rename meta-python/recipes-devtools/python/{python3-moteus_0.3.95.bb =3D=
>
> python3-moteus_0.3.96.bb} (82%)
>  rename meta-python/recipes-devtools/python/{python3-polyline_2.0.3.bb =
=3D>
> python3-polyline_2.0.4.bb} (80%)
>  rename meta-python/recipes-devtools/python/{python3-pybcj_1.0.6.bb =3D>
> python3-pybcj_1.0.7.bb} (85%)
>  rename meta-python/recipes-devtools/python/{python3-pymodbus_3.11.3.bb
> =3D> python3-pymodbus_3.11.4.bb} (90%)
>  rename meta-python/recipes-devtools/python/{
> python3-rich-argparse_1.7.1.bb =3D> python3-rich-argparse_1.7.2.bb} (81%)
>  rename meta-python/recipes-devtools/python/{python3-sqlparse_0.5.3.bb =
=3D>
> python3-sqlparse_0.5.4.bb} (82%)
>  rename meta-python/recipes-extended/python3-gpt-image/{
> python3-gpt-image_0.9.0.bb =3D> python3-gpt-image_0.9.1.bb} (78%)
>  rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.30.2.bb
> =3D> swagger-ui_5.30.3.bb} (94%)
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.65.bb =3D>
> apache2_2.4.66.bb} (99%)
>  rename meta-webserver/recipes-php/xdebug/{xdebug_3.4.6.bb =3D>
> xdebug_3.4.7.bb} (91%)
>  rename meta-webserver/recipes-support/fcgi/{fcgi_2.4.6.bb =3D>
> fcgi_2.4.7.bb} (87%)
>
> --
> 2.52.0
>
>

--0000000000008ed6490646432454
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">LGTM, merged now<div><br></div><div>Thanks</div><div>-Khem=
</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Dec 18, 2025 at 8:11=E2=80=AFPM Anuj =
Mittal &lt;<a href=3D"mailto:anuj.mittal@oss.qualcomm.com">anuj.mittal@oss.=
qualcomm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Please merge these changes in whinlatter. <br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1187" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1187</a><br>
<br>
I&#39;ve dropped some patches sent to the list for whinlatter that included=
<br>
major version upgrades or changes to behaviour (pcre -&gt; pcre2).<br>
<br>
The following changes since commit 09c7f76c196876a4366f220b360f4bdb93ab95c0=
:<br>
<br>
=C2=A0 libunix-statgrab: Put LD export in do_configure (2025-11-23 00:12:01=
 -0800)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> stable/whinlatter-next<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Dstable/whinlatter-next" rel=3D"noreferrer" target=3D"_blank">https:/=
/git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/whinlatter-=
next</a><br>
<br>
Alper Ak (1):<br>
=C2=A0 proj: Fix do_package QA issue for unshipped bash-completion files<br=
>
<br>
Ankur Tyagi (2):<br>
=C2=A0 python3-django: upgrade 5.2.7 -&gt; 5.2.8<br>
=C2=A0 python3-django: upgrade 4.2.25 -&gt; 4.2.26<br>
<br>
Changqing Li (5):<br>
=C2=A0 hdf5: fix do_package failure when multilib enabled<br>
=C2=A0 hdf5: inherit pkgconfig<br>
=C2=A0 version-check.conf: mute version mismatch warning for flite<br>
=C2=A0 version-check.conf: mute version mismatch warning for bpftrace<br>
=C2=A0 libmng: correct version of libmng<br>
<br>
Gyorgy Sarvari (8):<br>
=C2=A0 libao: ignore CVE-2017-11548<br>
=C2=A0 cockpit: set correct CVE_PRODUCT<br>
=C2=A0 tigervnc: ignore CVE-2014-8241<br>
=C2=A0 breakpad: correct SRC_URI branch<br>
=C2=A0 gssdp: upgrade 1.6.3 -&gt; 1.6.4<br>
=C2=A0 gupnp: upgrade 1.6.6 -&gt; 1.6.9<br>
=C2=A0 gupnp-av: upgrade 0.14.1 -&gt; 0.14.4<br>
=C2=A0 gupnp-tools: upgrade 0.12.1 -&gt; 0.12.2<br>
<br>
Jason Schonberg (3):<br>
=C2=A0 xdebug: upgrade 3.4.6 -&gt; 3.4.7<br>
=C2=A0 php: upgrade 8.4.14 -&gt; 8.4.15<br>
=C2=A0 gsoap: upgrade 2.8.135 -&gt; 2.8.137<br>
<br>
Khem Raj (5):<br>
=C2=A0 wxwidgets: Upgrade to 3.2.8.1 bugfix release<br>
=C2=A0 fuse3: Add missing rdep on file for ptests<br>
=C2=A0 fuse3: Fix build with clang on riscv32<br>
=C2=A0 e2tools: Fix buildpaths in ptests<br>
=C2=A0 libplist: Fix buildpaths in ptests<br>
<br>
Leon Anavi (3):<br>
=C2=A0 python3-polyline: Upgrade 2.0.3 -&gt; 2.0.4<br>
=C2=A0 python3-cloudpickle: Upgrade 3.1.1 -&gt; 3.1.2<br>
=C2=A0 python3-huey: Upgrade 2.5.4 -&gt; 2.5.5<br>
<br>
Liu Yiding (2):<br>
=C2=A0 lvm2: upgrade 2.03.36 -&gt; 2.03.37<br>
=C2=A0 pgpool2: 4.6.3 -&gt; 4.6.4<br>
<br>
Mingli Yu (3):<br>
=C2=A0 mariadb: Upgrade 11.4.8 -&gt; 11.4.9<br>
=C2=A0 openipmi: Pass BUILD_CFLAGS to BUILD_CC<br>
=C2=A0 bpftool-native: Empty DEBUG_PREFIX_MAP_EXTRA<br>
<br>
Peter Marko (1):<br>
=C2=A0 libcoap: upgrade 4.3.5 -&gt; 4.3.5a<br>
<br>
Valeria Petrov (1):<br>
=C2=A0 apache2: upgrade 2.4.65 -&gt; 2.4.66<br>
<br>
Viswanath Kraleti (1):<br>
=C2=A0 gflags: switch Git branch from master to main<br>
<br>
Wang Mingyu (19):<br>
=C2=A0 debootstrap: upgrade 1.0.141 -&gt; 1.0.142<br>
=C2=A0 libgphoto2: upgrade 2.5.32 -&gt; 2.5.33<br>
=C2=A0 asyncmqtt: upgrade 10.2.5 -&gt; 10.2.6<br>
=C2=A0 libnice: upgrade 0.1.22 -&gt; 0.1.23<br>
=C2=A0 psqlodbc: upgrade 17.00.0006 -&gt; 17.00.0007<br>
=C2=A0 fcgi: upgrade 2.4.6 -&gt; 2.4.7<br>
=C2=A0 swagger-ui: upgrade 5.30.2 -&gt; 5.30.3<br>
=C2=A0 openvpn: upgrade 2.6.15 -&gt; 2.6.16<br>
=C2=A0 libdaq: upgrade 3.0.22 -&gt; 3.0.23<br>
=C2=A0 postfix: upgrade 3.10.5 -&gt; 3.10.6<br>
=C2=A0 nautilus: upgrade 49.1 -&gt; 49.2<br>
=C2=A0 python3-gpt-image: upgrade 0.9.0 -&gt; 0.9.1<br>
=C2=A0 python3-moteus: upgrade 0.3.95 -&gt; 0.3.96<br>
=C2=A0 python3-rich-argparse: upgrade 1.7.1 -&gt; 1.7.2<br>
=C2=A0 python3-eventlet: upgrade 0.40.3 -&gt; 0.40.4<br>
=C2=A0 python3-gmpy2: upgrade 2.2.1 -&gt; 2.2.2<br>
=C2=A0 python3-pybcj: upgrade 1.0.6 -&gt; 1.0.7<br>
=C2=A0 python3-pymodbus: upgrade 3.11.3 -&gt; 3.11.4<br>
=C2=A0 python3-sqlparse: upgrade 0.5.3 -&gt; 0.5.4<br>
<br>
Yi Zhao (1):<br>
=C2=A0 crash: add zlib-native to depends for crash-cross<br>
<br>
yuyu (1):<br>
=C2=A0 trace-cmd: Update SRC_URI to use HTTPS protocol<br>
<br>
=C2=A0.../recipes-utils/e2tools/<a href=3D"http://e2tools_0.1.2.bb" rel=3D"=
noreferrer" target=3D"_blank">e2tools_0.1.2.bb</a>=C2=A0 =C2=A0 |=C2=A0 16 =
+-<br>
=C2=A0.../{<a href=3D"http://nautilus_49.1.bb" rel=3D"noreferrer" target=3D=
"_blank">nautilus_49.1.bb</a> =3D&gt; <a href=3D"http://nautilus_49.2.bb" r=
el=3D"noreferrer" target=3D"_blank">nautilus_49.2.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0...mplate-use-basename-instead-of-filen.patch |=C2=A0 32 --<br>
=C2=A0.../gupnp/{<a href=3D"http://gssdp_1.6.3.bb" rel=3D"noreferrer" targe=
t=3D"_blank">gssdp_1.6.3.bb</a> =3D&gt; <a href=3D"http://gssdp_1.6.4.bb" r=
el=3D"noreferrer" target=3D"_blank">gssdp_1.6.4.bb</a>}=C2=A0 |=C2=A0 =C2=
=A05 +-<br>
=C2=A0.../0001-all-Drop-xmlRecoverMemory.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
44 ---<br>
=C2=A0...{<a href=3D"http://gupnp-av_0.14.1.bb" rel=3D"noreferrer" target=
=3D"_blank">gupnp-av_0.14.1.bb</a> =3D&gt; <a href=3D"http://gupnp-av_0.14.=
4.bb" rel=3D"noreferrer" target=3D"_blank">gupnp-av_0.14.4.bb</a>} |=C2=A0 =
=C2=A08 +-<br>
=C2=A0...-<a href=3D"http://tools_0.12.1.bb" rel=3D"noreferrer" target=3D"_=
blank">tools_0.12.1.bb</a> =3D&gt; <a href=3D"http://gupnp-tools_0.12.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">gupnp-tools_0.12.2.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...mplate-use-basename-instead-of-filen.patch |=C2=A0 32 --<br>
=C2=A0.../gupnp/{<a href=3D"http://gupnp_1.6.6.bb" rel=3D"noreferrer" targe=
t=3D"_blank">gupnp_1.6.6.bb</a> =3D&gt; <a href=3D"http://gupnp_1.6.9.bb" r=
el=3D"noreferrer" target=3D"_blank">gupnp_1.6.9.bb</a>}=C2=A0 |=C2=A0 =C2=
=A05 +-<br>
=C2=A0.../recipes-multimedia/libao/<a href=3D"http://libao_1.2.0.bb" rel=3D=
"noreferrer" target=3D"_blank">libao_1.2.0.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
=C2=A0.../{<a href=3D"http://libdaq_3.0.22.bb" rel=3D"noreferrer" target=3D=
"_blank">libdaq_3.0.22.bb</a> =3D&gt; <a href=3D"http://libdaq_3.0.23.bb" r=
el=3D"noreferrer" target=3D"_blank">libdaq_3.0.23.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://postfix_3.10.5.bb" rel=3D"noreferrer" target=
=3D"_blank">postfix_3.10.5.bb</a> =3D&gt; <a href=3D"http://postfix_3.10.6.=
bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.10.6.bb</a>}=C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://libcoap_4.3.5.bb" rel=3D"noreferrer" target=3D=
"_blank">libcoap_4.3.5.bb</a> =3D&gt; <a href=3D"http://libcoap_4.3.5a.bb" =
rel=3D"noreferrer" target=3D"_blank">libcoap_4.3.5a.bb</a>}=C2=A0 =C2=A0|=
=C2=A0 =C2=A06 +-<br>
=C2=A0...ile.am-Pass-BUILD_CFLAGS-to-BUILD_CC.patch |=C2=A0 35 ++<br>
=C2=A0.../openipmi/<a href=3D"http://openipmi_2.0.37.bb" rel=3D"noreferrer"=
 target=3D"_blank">openipmi_2.0.37.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../{<a href=3D"http://openvpn_2.6.15.bb" rel=3D"noreferrer" target=
=3D"_blank">openvpn_2.6.15.bb</a> =3D&gt; <a href=3D"http://openvpn_2.6.16.=
bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.6.16.bb</a>}=C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0...h.h-to-ensure-isnan-and-isinf-are-de.patch |=C2=A0 40 ---<br>
=C2=A0...e-time-calculations-always-long-long.patch | 336 -----------------=
-<br>
=C2=A0.../{<a href=3D"http://pgpool2_4.6.3.bb" rel=3D"noreferrer" target=3D=
"_blank">pgpool2_4.6.3.bb</a> =3D&gt; <a href=3D"http://pgpool2_4.6.4.bb" r=
el=3D"noreferrer" target=3D"_blank">pgpool2_4.6.4.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A04 +-<br>
=C2=A0meta-oe/conf/version-check.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0...<a href=3D"http://syncmqtt_10.2.5.bb" rel=3D"noreferrer" target=3D=
"_blank">syncmqtt_10.2.5.bb</a> =3D&gt; <a href=3D"http://asyncmqtt_10.2.6.=
bb" rel=3D"noreferrer" target=3D"_blank">asyncmqtt_10.2.6.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://ive_11.4.8.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ive_11.4.8.bb</a> =3D&gt; <a href=3D"http://mariadb-native_11.4.9.bb" r=
el=3D"noreferrer" target=3D"_blank">mariadb-native_11.4.9.bb</a>} |=C2=A0 =
=C2=A00<br>
=C2=A0meta-oe/recipes-dbs/mysql/mariadb.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A03 +-<br>
=C2=A0...lity-with-ARMv9-by-updating-.arch-di.patch |=C2=A0 41 ---<br>
=C2=A0.../{<a href=3D"http://mariadb_11.4.8.bb" rel=3D"noreferrer" target=
=3D"_blank">mariadb_11.4.8.bb</a> =3D&gt; <a href=3D"http://mariadb_11.4.9.=
bb" rel=3D"noreferrer" target=3D"_blank">mariadb_11.4.9.bb</a>}=C2=A0 |=C2=
=A0 =C2=A00<br>
=C2=A0...xpected-output-file-for-descrec-test.patch |=C2=A0 72 ----<br>
=C2=A0.../psqlodbc-fix-for-ptest-support.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
17 +-<br>
=C2=A0...<a href=3D"http://c_17.00.0006.bb" rel=3D"noreferrer" target=3D"_b=
lank">c_17.00.0006.bb</a> =3D&gt; <a href=3D"http://psqlodbc_17.00.0007.bb"=
 rel=3D"noreferrer" target=3D"_blank">psqlodbc_17.00.0007.bb</a>} |=C2=A0 1=
3 +-<br>
=C2=A0.../breakpad/<a href=3D"http://breakpad_2023.06.01.bb" rel=3D"norefer=
rer" target=3D"_blank">breakpad_2023.06.01.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://trap_1.0.141.bb" rel=3D"noreferrer" target=3D"_b=
lank">trap_1.0.141.bb</a> =3D&gt; <a href=3D"http://debootstrap_1.0.142.bb"=
 rel=3D"noreferrer" target=3D"_blank">debootstrap_1.0.142.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../php/{<a href=3D"http://php_8.4.14.bb" rel=3D"noreferrer" target=
=3D"_blank">php_8.4.14.bb</a> =3D&gt; <a href=3D"http://php_8.4.15.bb" rel=
=3D"noreferrer" target=3D"_blank">php_8.4.15.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0.../libimobiledevice/<a href=3D"http://libplist_2.6.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">libplist_2.6.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 10 +-<br>
=C2=A0...<a href=3D"http://xwidgets_3.2.8.bb" rel=3D"noreferrer" target=3D"=
_blank">xwidgets_3.2.8.bb</a> =3D&gt; <a href=3D"http://wxwidgets_3.2.8.1.b=
b" rel=3D"noreferrer" target=3D"_blank">wxwidgets_3.2.8.1.bb</a>} |=C2=A0 =
=C2=A04 +-<br>
=C2=A0...<a href=3D"http://gphoto2_2.5.32.bb" rel=3D"noreferrer" target=3D"=
_blank">gphoto2_2.5.32.bb</a> =3D&gt; <a href=3D"http://libgphoto2_2.5.33.b=
b" rel=3D"noreferrer" target=3D"_blank">libgphoto2_2.5.33.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...0001-configura.ac-update-the-version.patch |=C2=A0 32 ++<br>
=C2=A0.../recipes-graphics/libmng/<a href=3D"http://libmng_2.0.3.bb" rel=3D=
"noreferrer" target=3D"_blank">libmng_2.0.3.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A03 +-<br>
=C2=A0.../tigervnc/<a href=3D"http://tigervnc_1.15.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">tigervnc_1.15.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../bpftool/<a href=3D"http://bpftool-native_6.16.bb" rel=3D"noreferr=
er" target=3D"_blank">bpftool-native_6.16.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0meta-oe/recipes-kernel/crash/<a href=3D"http://crash_8.0.6.bb" rel=3D=
"noreferrer" target=3D"_blank">crash_8.0.6.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
=C2=A0.../trace-cmd/<a href=3D"http://trace-cmd_3.1.5.bb" rel=3D"noreferrer=
" target=3D"_blank">trace-cmd_3.1.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta-oe/recipes-navigation/proj/<a href=3D"http://proj_9.7.0.bb" rel=
=3D"noreferrer" target=3D"_blank">proj_9.7.0.bb</a> |=C2=A0 =C2=A04 +-<br>
=C2=A0meta-oe/recipes-support/fuse/<a href=3D"http://fuse3_3.16.2.bb" rel=
=3D"noreferrer" target=3D"_blank">fuse3_3.16.2.bb</a>=C2=A0 |=C2=A0 =C2=A04=
 +<br>
=C2=A0.../recipes-support/gflags/<a href=3D"http://gflags_2.2.2.bb" rel=3D"=
noreferrer" target=3D"_blank">gflags_2.2.2.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0.../{<a href=3D"http://gsoap_2.8.135.bb" rel=3D"noreferrer" target=3D=
"_blank">gsoap_2.8.135.bb</a> =3D&gt; <a href=3D"http://gsoap_2.8.137.bb" r=
el=3D"noreferrer" target=3D"_blank">gsoap_2.8.137.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0meta-oe/recipes-support/hdf5/<a href=3D"http://hdf5_2.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank">hdf5_2.0.0.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=A0=
9 +-<br>
=C2=A0.../{<a href=3D"http://libnice_0.1.22.bb" rel=3D"noreferrer" target=
=3D"_blank">libnice_0.1.22.bb</a> =3D&gt; <a href=3D"http://libnice_0.1.23.=
bb" rel=3D"noreferrer" target=3D"_blank">libnice_0.1.23.bb</a>}=C2=A0 |=C2=
=A0 =C2=A06 +-<br>
=C2=A0meta-oe/recipes-support/lvm2/lvm2.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0..._<a href=3D"http://3.1.1.bb" rel=3D"noreferrer" target=3D"_blank">=
3.1.1.bb</a> =3D&gt; <a href=3D"http://python3-cloudpickle_3.1.2.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-cloudpickle_3.1.2.bb</a>} |=C2=A0 =
=C2=A09 +-<br>
=C2=A0...<a href=3D"http://ngo_4.2.25.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ngo_4.2.25.bb</a> =3D&gt; <a href=3D"http://python3-django_4.2.26.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-django_4.2.26.bb</a>} |=C2=A0 =
=C2=A04 +-<br>
=C2=A0...<a href=3D"http://jango_5.2.7.bb" rel=3D"noreferrer" target=3D"_bl=
ank">jango_5.2.7.bb</a> =3D&gt; <a href=3D"http://python3-django_5.2.8.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-django_5.2.8.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://t_0.40.3.bb" rel=3D"noreferrer" target=3D"_blank=
">t_0.40.3.bb</a> =3D&gt; <a href=3D"http://python3-eventlet_0.40.4.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-eventlet_0.40.4.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...-<a href=3D"http://gmpy2_2.2.1.bb" rel=3D"noreferrer" target=3D"_b=
lank">gmpy2_2.2.1.bb</a> =3D&gt; <a href=3D"http://python3-gmpy2_2.2.2.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-gmpy2_2.2.2.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://n3-huey_2.5.4.bb" rel=3D"noreferrer" target=3D"_=
blank">n3-huey_2.5.4.bb</a> =3D&gt; <a href=3D"http://python3-huey_2.5.5.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-huey_2.5.5.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://eus_0.3.95.bb" rel=3D"noreferrer" target=3D"_bla=
nk">eus_0.3.95.bb</a> =3D&gt; <a href=3D"http://python3-moteus_0.3.96.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-moteus_0.3.96.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://ine_2.0.3.bb" rel=3D"noreferrer" target=3D"_blan=
k">ine_2.0.3.bb</a> =3D&gt; <a href=3D"http://python3-polyline_2.0.4.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-polyline_2.0.4.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...-<a href=3D"http://pybcj_1.0.6.bb" rel=3D"noreferrer" target=3D"_b=
lank">pybcj_1.0.6.bb</a> =3D&gt; <a href=3D"http://python3-pybcj_1.0.7.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-pybcj_1.0.7.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://s_3.11.3.bb" rel=3D"noreferrer" target=3D"_blank=
">s_3.11.3.bb</a> =3D&gt; <a href=3D"http://python3-pymodbus_3.11.4.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-pymodbus_3.11.4.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0....<a href=3D"http://7.1.bb" rel=3D"noreferrer" target=3D"_blank">7.=
1.bb</a> =3D&gt; <a href=3D"http://python3-rich-argparse_1.7.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-rich-argparse_1.7.2.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://rse_0.5.3.bb" rel=3D"noreferrer" target=3D"_blan=
k">rse_0.5.3.bb</a> =3D&gt; <a href=3D"http://python3-sqlparse_0.5.4.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-sqlparse_0.5.4.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://ge_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank=
">ge_0.9.0.bb</a> =3D&gt; <a href=3D"http://python3-gpt-image_0.9.1.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-gpt-image_0.9.1.bb</a>} |=C2=A0 =
=C2=A04 +-<br>
=C2=A0...<a href=3D"http://gger-ui_5.30.2.bb" rel=3D"noreferrer" target=3D"=
_blank">gger-ui_5.30.2.bb</a> =3D&gt; <a href=3D"http://swagger-ui_5.30.3.b=
b" rel=3D"noreferrer" target=3D"_blank">swagger-ui_5.30.3.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://apache2_2.4.65.bb" rel=3D"noreferrer" target=
=3D"_blank">apache2_2.4.65.bb</a> =3D&gt; <a href=3D"http://apache2_2.4.66.=
bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.66.bb</a>}=C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://xdebug_3.4.6.bb" rel=3D"noreferrer" target=3D"=
_blank">xdebug_3.4.6.bb</a> =3D&gt; <a href=3D"http://xdebug_3.4.7.bb" rel=
=3D"noreferrer" target=3D"_blank">xdebug_3.4.7.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A02 +-<br>
=C2=A0.../fcgi/{<a href=3D"http://fcgi_2.4.6.bb" rel=3D"noreferrer" target=
=3D"_blank">fcgi_2.4.6.bb</a> =3D&gt; <a href=3D"http://fcgi_2.4.7.bb" rel=
=3D"noreferrer" target=3D"_blank">fcgi_2.4.7.bb</a>}=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0.../recipes-webadmin/cockpit/<a href=3D"http://cockpit_349.bb" rel=3D=
"noreferrer" target=3D"_blank">cockpit_349.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
=C2=A065 files changed, 182 insertions(+), 687 deletions(-)<br>
=C2=A0rename meta-gnome/recipes-gnome/nautilus/{<a href=3D"http://nautilus_=
49.1.bb" rel=3D"noreferrer" target=3D"_blank">nautilus_49.1.bb</a> =3D&gt; =
<a href=3D"http://nautilus_49.2.bb" rel=3D"noreferrer" target=3D"_blank">na=
utilus_49.2.bb</a>} (93%)<br>
=C2=A0delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp/0=
001-gssdp-enums.c.template-use-basename-instead-of-filen.patch<br>
=C2=A0rename meta-multimedia/recipes-connectivity/gupnp/{<a href=3D"http://=
gssdp_1.6.3.bb" rel=3D"noreferrer" target=3D"_blank">gssdp_1.6.3.bb</a> =3D=
&gt; <a href=3D"http://gssdp_1.6.4.bb" rel=3D"noreferrer" target=3D"_blank"=
>gssdp_1.6.4.bb</a>} (82%)<br>
=C2=A0delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-a=
v/0001-all-Drop-xmlRecoverMemory.patch<br>
=C2=A0rename meta-multimedia/recipes-connectivity/gupnp/{<a href=3D"http://=
gupnp-av_0.14.1.bb" rel=3D"noreferrer" target=3D"_blank">gupnp-av_0.14.1.bb=
</a> =3D&gt; <a href=3D"http://gupnp-av_0.14.4.bb" rel=3D"noreferrer" targe=
t=3D"_blank">gupnp-av_0.14.4.bb</a>} (51%)<br>
=C2=A0rename meta-multimedia/recipes-connectivity/gupnp/{<a href=3D"http://=
gupnp-tools_0.12.1.bb" rel=3D"noreferrer" target=3D"_blank">gupnp-tools_0.1=
2.1.bb</a> =3D&gt; <a href=3D"http://gupnp-tools_0.12.2.bb" rel=3D"noreferr=
er" target=3D"_blank">gupnp-tools_0.12.2.bb</a>} (84%)<br>
=C2=A0delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp/0=
001-gupnp-enums.c.template-use-basename-instead-of-filen.patch<br>
=C2=A0rename meta-multimedia/recipes-connectivity/gupnp/{<a href=3D"http://=
gupnp_1.6.6.bb" rel=3D"noreferrer" target=3D"_blank">gupnp_1.6.6.bb</a> =3D=
&gt; <a href=3D"http://gupnp_1.6.9.bb" rel=3D"noreferrer" target=3D"_blank"=
>gupnp_1.6.9.bb</a>} (83%)<br>
=C2=A0rename meta-networking/recipes-connectivity/daq/{<a href=3D"http://li=
bdaq_3.0.22.bb" rel=3D"noreferrer" target=3D"_blank">libdaq_3.0.22.bb</a> =
=3D&gt; <a href=3D"http://libdaq_3.0.23.bb" rel=3D"noreferrer" target=3D"_b=
lank">libdaq_3.0.23.bb</a>} (92%)<br>
=C2=A0rename meta-networking/recipes-daemons/postfix/{<a href=3D"http://pos=
tfix_3.10.5.bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.10.5.bb</a> =
=3D&gt; <a href=3D"http://postfix_3.10.6.bb" rel=3D"noreferrer" target=3D"_=
blank">postfix_3.10.6.bb</a>} (99%)<br>
=C2=A0rename meta-networking/recipes-devtools/libcoap/{<a href=3D"http://li=
bcoap_4.3.5.bb" rel=3D"noreferrer" target=3D"_blank">libcoap_4.3.5.bb</a> =
=3D&gt; <a href=3D"http://libcoap_4.3.5a.bb" rel=3D"noreferrer" target=3D"_=
blank">libcoap_4.3.5a.bb</a>} (90%)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/openipmi/files/000=
1-Makefile.am-Pass-BUILD_CFLAGS-to-BUILD_CC.patch<br>
=C2=A0rename meta-networking/recipes-support/openvpn/{<a href=3D"http://ope=
nvpn_2.6.15.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.6.15.bb</a> =
=3D&gt; <a href=3D"http://openvpn_2.6.16.bb" rel=3D"noreferrer" target=3D"_=
blank">openvpn_2.6.16.bb</a>} (98%)<br>
=C2=A0delete mode 100644 meta-networking/recipes-support/pgpool2/pgpool2/00=
01-snprintf-Add-math.h-to-ensure-isnan-and-isinf-are-de.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-support/pgpool2/pgpool2/v1=
-0001-Make-time-calculations-always-long-long.patch<br>
=C2=A0rename meta-networking/recipes-support/pgpool2/{<a href=3D"http://pgp=
ool2_4.6.3.bb" rel=3D"noreferrer" target=3D"_blank">pgpool2_4.6.3.bb</a> =
=3D&gt; <a href=3D"http://pgpool2_4.6.4.bb" rel=3D"noreferrer" target=3D"_b=
lank">pgpool2_4.6.4.bb</a>} (89%)<br>
=C2=A0rename meta-oe/recipes-connectivity/asyncmqtt/{<a href=3D"http://asyn=
cmqtt_10.2.5.bb" rel=3D"noreferrer" target=3D"_blank">asyncmqtt_10.2.5.bb</=
a> =3D&gt; <a href=3D"http://asyncmqtt_10.2.6.bb" rel=3D"noreferrer" target=
=3D"_blank">asyncmqtt_10.2.6.bb</a>} (87%)<br>
=C2=A0rename meta-oe/recipes-dbs/mysql/{<a href=3D"http://mariadb-native_11=
.4.8.bb" rel=3D"noreferrer" target=3D"_blank">mariadb-native_11.4.8.bb</a> =
=3D&gt; <a href=3D"http://mariadb-native_11.4.9.bb" rel=3D"noreferrer" targ=
et=3D"_blank">mariadb-native_11.4.9.bb</a>} (100%)<br>
=C2=A0delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-comp=
atibility-with-ARMv9-by-updating-.arch-di.patch<br>
=C2=A0rename meta-oe/recipes-dbs/mysql/{<a href=3D"http://mariadb_11.4.8.bb=
" rel=3D"noreferrer" target=3D"_blank">mariadb_11.4.8.bb</a> =3D&gt; <a hre=
f=3D"http://mariadb_11.4.9.bb" rel=3D"noreferrer" target=3D"_blank">mariadb=
_11.4.9.bb</a>} (100%)<br>
=C2=A0delete mode 100644 meta-oe/recipes-dbs/psqlodbc/files/add-expected-ou=
tput-file-for-descrec-test.patch<br>
=C2=A0rename meta-oe/recipes-dbs/psqlodbc/{<a href=3D"http://psqlodbc_17.00=
.0006.bb" rel=3D"noreferrer" target=3D"_blank">psqlodbc_17.00.0006.bb</a> =
=3D&gt; <a href=3D"http://psqlodbc_17.00.0007.bb" rel=3D"noreferrer" target=
=3D"_blank">psqlodbc_17.00.0007.bb</a>} (87%)<br>
=C2=A0rename meta-oe/recipes-devtools/debootstrap/{<a href=3D"http://deboot=
strap_1.0.141.bb" rel=3D"noreferrer" target=3D"_blank">debootstrap_1.0.141.=
bb</a> =3D&gt; <a href=3D"http://debootstrap_1.0.142.bb" rel=3D"noreferrer"=
 target=3D"_blank">debootstrap_1.0.142.bb</a>} (89%)<br>
=C2=A0rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_8.4.14.bb"=
 rel=3D"noreferrer" target=3D"_blank">php_8.4.14.bb</a> =3D&gt; <a href=3D"=
http://php_8.4.15.bb" rel=3D"noreferrer" target=3D"_blank">php_8.4.15.bb</a=
>} (99%)<br>
=C2=A0rename meta-oe/recipes-extended/wxwidgets/{<a href=3D"http://wxwidget=
s_3.2.8.bb" rel=3D"noreferrer" target=3D"_blank">wxwidgets_3.2.8.bb</a> =3D=
&gt; <a href=3D"http://wxwidgets_3.2.8.1.bb" rel=3D"noreferrer" target=3D"_=
blank">wxwidgets_3.2.8.1.bb</a>} (98%)<br>
=C2=A0rename meta-oe/recipes-graphics/gphoto2/{<a href=3D"http://libgphoto2=
_2.5.32.bb" rel=3D"noreferrer" target=3D"_blank">libgphoto2_2.5.32.bb</a> =
=3D&gt; <a href=3D"http://libgphoto2_2.5.33.bb" rel=3D"noreferrer" target=
=3D"_blank">libgphoto2_2.5.33.bb</a>} (93%)<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/libmng/libmng/0001-config=
ura.ac-update-the-version.patch<br>
=C2=A0rename meta-oe/recipes-support/gsoap/{<a href=3D"http://gsoap_2.8.135=
.bb" rel=3D"noreferrer" target=3D"_blank">gsoap_2.8.135.bb</a> =3D&gt; <a h=
ref=3D"http://gsoap_2.8.137.bb" rel=3D"noreferrer" target=3D"_blank">gsoap_=
2.8.137.bb</a>} (93%)<br>
=C2=A0rename meta-oe/recipes-support/libnice/{<a href=3D"http://libnice_0.1=
.22.bb" rel=3D"noreferrer" target=3D"_blank">libnice_0.1.22.bb</a> =3D&gt; =
<a href=3D"http://libnice_0.1.23.bb" rel=3D"noreferrer" target=3D"_blank">l=
ibnice_0.1.23.bb</a>} (88%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-cloudpickle_3.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cloudpi=
ckle_3.1.1.bb</a> =3D&gt; <a href=3D"http://python3-cloudpickle_3.1.2.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-cloudpickle_3.1.2.bb</a>} (55%)=
<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_4.2.25.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_4.2.=
25.bb</a> =3D&gt; <a href=3D"http://python3-django_4.2.26.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-django_4.2.26.bb</a>} (70%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_5.2.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_5.2.7=
.bb</a> =3D&gt; <a href=3D"http://python3-django_5.2.8.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-django_5.2.8.bb</a>} (60%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-eventlet_0.40.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-eventlet_=
0.40.3.bb</a> =3D&gt; <a href=3D"http://python3-eventlet_0.40.4.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-eventlet_0.40.4.bb</a>} (83%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-gmpy2_2.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-gmpy2_2.2.1.b=
b</a> =3D&gt; <a href=3D"http://python3-gmpy2_2.2.2.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-gmpy2_2.2.2.bb</a>} (82%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-huey_2.5.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-huey_2.5.4.bb<=
/a> =3D&gt; <a href=3D"http://python3-huey_2.5.5.bb" rel=3D"noreferrer" tar=
get=3D"_blank">python3-huey_2.5.5.bb</a>} (78%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-moteus_0.3.95.bb" rel=3D"noreferrer" target=3D"_blank">python3-moteus_0.3.=
95.bb</a> =3D&gt; <a href=3D"http://python3-moteus_0.3.96.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-moteus_0.3.96.bb</a>} (82%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-polyline_2.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-polyline_2=
.0.3.bb</a> =3D&gt; <a href=3D"http://python3-polyline_2.0.4.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-polyline_2.0.4.bb</a>} (80%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-pybcj_1.0.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-pybcj_1.0.6.b=
b</a> =3D&gt; <a href=3D"http://python3-pybcj_1.0.7.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-pybcj_1.0.7.bb</a>} (85%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-pymodbus_3.11.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pymodbus_=
3.11.3.bb</a> =3D&gt; <a href=3D"http://python3-pymodbus_3.11.4.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-pymodbus_3.11.4.bb</a>} (90%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-rich-argparse_1.7.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-rich-=
argparse_1.7.1.bb</a> =3D&gt; <a href=3D"http://python3-rich-argparse_1.7.2=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-rich-argparse_1.7.2.bb</a=
>} (81%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-sqlparse_0.5.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-sqlparse_0=
.5.3.bb</a> =3D&gt; <a href=3D"http://python3-sqlparse_0.5.4.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-sqlparse_0.5.4.bb</a>} (82%)<br>
=C2=A0rename meta-python/recipes-extended/python3-gpt-image/{<a href=3D"htt=
p://python3-gpt-image_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-gpt-image_0.9.0.bb</a> =3D&gt; <a href=3D"http://python3-gpt-image_0.9.1.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-gpt-image_0.9.1.bb</a>} (7=
8%)<br>
=C2=A0rename meta-webserver/recipes-devtools/swagger-ui/{<a href=3D"http://=
swagger-ui_5.30.2.bb" rel=3D"noreferrer" target=3D"_blank">swagger-ui_5.30.=
2.bb</a> =3D&gt; <a href=3D"http://swagger-ui_5.30.3.bb" rel=3D"noreferrer"=
 target=3D"_blank">swagger-ui_5.30.3.bb</a>} (94%)<br>
=C2=A0rename meta-webserver/recipes-httpd/apache2/{<a href=3D"http://apache=
2_2.4.65.bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.65.bb</a> =3D=
&gt; <a href=3D"http://apache2_2.4.66.bb" rel=3D"noreferrer" target=3D"_bla=
nk">apache2_2.4.66.bb</a>} (99%)<br>
=C2=A0rename meta-webserver/recipes-php/xdebug/{<a href=3D"http://xdebug_3.=
4.6.bb" rel=3D"noreferrer" target=3D"_blank">xdebug_3.4.6.bb</a> =3D&gt; <a=
 href=3D"http://xdebug_3.4.7.bb" rel=3D"noreferrer" target=3D"_blank">xdebu=
g_3.4.7.bb</a>} (91%)<br>
=C2=A0rename meta-webserver/recipes-support/fcgi/{<a href=3D"http://fcgi_2.=
4.6.bb" rel=3D"noreferrer" target=3D"_blank">fcgi_2.4.6.bb</a> =3D&gt; <a h=
ref=3D"http://fcgi_2.4.7.bb" rel=3D"noreferrer" target=3D"_blank">fcgi_2.4.=
7.bb</a>} (87%)<br>
<br>
-- <br>
2.52.0<br>
<br>
</blockquote></div>

--0000000000008ed6490646432454--

