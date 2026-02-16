Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F83E83833
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 20:22:44 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3208.1771273363238135599
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 12:22:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=drtfaphx;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64ad9238d8fso3368115d50.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 12:22:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771273362; cv=none;
        d=google.com; s=arc-20240605;
        b=Dt2UFz+lTvgvLfRmxZHWYgNUpFzFZRT+DSd3LdurX1HRaN3WdANcYMgY6GSgAiOJkl
         oYCpXITJ1mq6IxdJh+9GCPJ1pLwj8qq1ItVR8EIhLfjlvgFfJgW8vGJLqIVN+jancnrM
         COWip+zHDYu5edpajFiOzPH0NOdhJiSOBHLZWwhxVupl8O0aAVorjSP27sYvbYTgZD24
         UnyDnYLpezJzG9rQXyDfyVUkvypHuG1pXm32/lPJ1R2i0bxoCXnpmLyweAooLCe2WcPF
         LZDfuEoftipDMWSKVWopkZsoP4g9Uaf1FWWx5Y6/VkcI7vBt2OD9AqvCQ+mpLGZVA76n
         nBHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3Y4LNbukx+3y0lCzwPoxfq6ZdED3n0o5t6+7OAr764w=;
        fh=CNMsGSehN977JAL4dK6p8b3wwHy8hviO5AFdiTujXNY=;
        b=e45wGPTmHhIn2mBszM1DzJxavd62tHXMB8nnohSZ4ShsPwqW2mBMDpncrk0vp881uz
         Cql5+WYu7AfmKR8jPrhqI9RwNTsNoypIl6GiJGzQE9zeCsza9DXoe+4a5FhoFnP54s4W
         O5/mNeZdz8RxEDYcbPwyhC7lxI+mSm3sbv4/ZmoYIQ8EytLsQpWfH5yxOy+LkhByEb53
         BSMJG+J7Q49WGMX1wEEX74G6s6Crb5g1XeJM5WQJya0KGGqYM93Lvn3yqWXy723v1SYY
         /17R1WXo1OptLkvfMKK9cs6WGKH/J7Hl9FI8kY4Nw2MtNr4gDmXYGNPwRIZ1HF31Ab+L
         BN1w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771273362; x=1771878162; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Y4LNbukx+3y0lCzwPoxfq6ZdED3n0o5t6+7OAr764w=;
        b=drtfaphxyM7nxO5B5mMTGYn0YTei79PUzDH5XIfx4UHidEf+NU0XRbpDntWQNu1sIV
         IOIoBQWqYdU40NszlECu5Law+J9PCyPZoxtfOZnfPEG2AOKhd48u2BC7JBfnXgWn9JKD
         cBSHBrXh+3/RgJgrqihd0XBmHulaMBomjiatjzHOOnj8Ii8qqXamaF0q81TtAk1fp7IR
         9UEOEi1V0QWShwAQaCtX6swkkix3HsT6Bs6Gvc8VZQroTVH5xRT3VjCp/OuRrN6D9Vub
         jRt8Cjy+Ba96XMuoZbEuARZQAWdTf/3DbTkVu/ckGrsvj3Xp2ep8TBrzaZnPEc9TG64Z
         Ce+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771273362; x=1771878162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Y4LNbukx+3y0lCzwPoxfq6ZdED3n0o5t6+7OAr764w=;
        b=itx4GcgVsi8Qe9hE8b9r34/Sm/LDfgv2GqyHZCTzOCgvVYr/Qp2PwEOPs4yFLbq5pI
         CB1ioiVFrKexexo54fA57+bM8oMC1kPuudghP2e9XeO8IY0ntI1C724VnGYVs1HJKd5f
         vxvpn4cqd5MoCQT3z+gPOQOBMm6p5v71lJpx1nvRb/Ok1oDpPB9fgoW/b3YgBTGRJ9Lx
         AkLH2E/EG5f3TjqU1Kv8RsgreQxgc0N7JvfnRy15wpYjFJpe2AdKsKLOo2tK6crnH/eT
         Q4673IsvnJX3jZC2CJrQtllcp6zUGUJqxyA5B7XfFeVgZEeDBbNjvxq3A62LasHxuxmm
         sb+w==
X-Gm-Message-State: AOJu0YxlppDCMtOeBea7abZToJ5lHyOj6JQrRSo+6qzOzmDv4OtO0kM1
	dk4tOJzqcHq1/xUwreBR+5Cf6GjrUiNeYOevAB3zvqN59rJdN8SQyXCOp/TTMECZPSag9gDXeLR
	oY7y/W3l7XS2/nA02flPnA8K4gEMgEM5hycF+
X-Gm-Gg: AZuq6aKfqlFepU+kNzY9w7K5iNB6wQOt8qrt7zNvz/Rj7k1/HAbuRDVl/aHkK5aIbI9
	9elYl/JS5KIqx2FUD23+EHMQCIcoPJhqC2FvVxcyYkRn/wN0rK8uEgdjM7CNi9sgg56//zi6QRY
	UgQkK2kBlJ0Gh4uhkS4cd5/NeMP9ywW7mZ0YCKtiV32SRIKguxkkO+p7L1pZPq9zv7eGi5bD0FX
	/3IRtjEAae9PDfvTrBtnDySaLOF67PKrkEo1ZBsc3qIN3iMNRB22VJnCYQApAlZbgf1+FDd8MMo
	wy22OtTKXKCoQzOyr/TZU6dTQ9Gr2+ZeENgkbMeCdBgV0615MlUxBWvYJlKeSRPycLD0mmIqKYt
	8QJG8uU4+r5g79SVho6NBtnqG
X-Received: by 2002:a05:690e:424d:b0:64a:f285:e673 with SMTP id
 956f58d0204a3-64c19b2f286mr7260789d50.52.1771273362043; Mon, 16 Feb 2026
 12:22:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770970700.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1770970700.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Feb 2026 12:22:30 -0800
X-Gm-Features: AZwV_QjjJTlE1FxkNN9wtM2qKPmYFSE6ZDrgvhFGKV0zKhHbPXd0IijIlz6PTVY
Message-ID: <CAMKF1soLJVcZEOcLzE1MUERuAgSv0nq86xWy2ssP6933t1Mf+w@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/73] Scarthgap pull request
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008b79f4064af6b7e2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 20:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124431

--0000000000008b79f4064af6b7e2
Content-Type: text/plain; charset="UTF-8"

Merged now thanks Anuj

On Mon, Feb 16, 2026, 1:55 AM Anuj Mittal via lists.openembedded.org
<anuj.mittal=oss.qualcomm.com@lists.openembedded.org> wrote:

> Please merge these changes in scarthgap. Tested locally with
> qemuarm/qemuarm64/qemux86-64 and on autobuilder.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1305
>
> The following changes since commit
> 7a5075cef77b5f7af454e9868e1d0019f2fd1394:
>
>   gnome-keyring: set CVE_PRODUCT (2026-01-26 11:16:37 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap
>
> Anil Dongare (2):
>   php 8.2.29: Fix CVE-2025-14178
>   php 8.2.29: Fix CVE-2025-14180
>
> Gyorgy Sarvari (52):
>   sox: patch CVE-2017-11332
>   sox: patch CVE-2017-11358
>   sox: patch CVE-2017-11359
>   sox: patch CVE-2017-15370
>   sox: patch CVE-2017-15371
>   sox: patch CVE-2017-15372
>   sox: patch CVE-2017-15642
>   sox: patch CVE-2017-18189
>   sox: mark CVE-2019-1010004 as patched
>   sox: patch CVE-2019-13590
>   sox: patch CVE-2019-8354
>   tigervnc: sync xserver component with oe-core
>   tigervnc: ignore CVE-2014-8241
>   tigervnc: ignore CVE-2023-6377
>   tigervnc: ignore CVE-2023-6478
>   tigervnc: ignore CVE-2025-26594...26601
>   fontforge: patch CVE-2025-15279
>   fontforge: patch CVE-2025-15275
>   fontforge: patch CVE-2025-15269
>   fontforge: patch CVE-2025-15270
>   ez-ipupdate: patch CVE-2003-0887
>   freerdp: ignore CVE-2025-68118
>   gimp: ignore CVE-2025-14423
>   gnome-settings-daemon: ignore CVE-2024-38394
>   imagemagick: patch CVE-2025-66628
>   libcupsfilters: patch CVE-2025-64503
>   mongodb: upgrade 4.4.29 -> 4.4.30
>   mongodb: ignore CVE-2025-14911
>   netdata: ignore CVE-2024-32019
>   proftpd: ignore CVE-2021-47865
>   python3-aiohttp: patch CVE-2025-69225
>   python3-aiohttp: patch CVE-2025-69226
>   python3-aiohttp: patch CVE-2025-69228
>   python3-django: patch CVE-2025-64460
>   raptor2: patch CVE-2024-57822 and CVE-2024-57823
>   python3-tornado: mark CVE-2025-67725 patched
>   python3-virtualenv: patch CVE-2026-22702
>   gnome-desktop: upgrade 44.0 -> 44.4
>   gtksourceview5: upgrade 5.12.0 -> 5.12.1
>   gnuchess: upgrade 6.2.9 -> 6.2.11
>   gnome-calculator: upgrade 46.0 -> 46.2
>   gdm: upgrade 46.0 -> 46.2
>   mutter: upgrade 46.1 -> 46.9
>   mutter: fix profiler PACKAGECONFIG
>   gnome-bluetooth: upgrade 46.0 -> 46.2
>   gnome-shell-extensions: upgrade 46.1 -> 46.4
>   nautilus: upgrade 45.1 -> 45.2.1
>   gnome-tweaks: upgrade 40.0 -> 40.10
>   tigervnc: mark CVE-2024-0408 and CVE-2024-0409 patched
>   python3-django: upgrade 4.2.27 -> 4.2.28
>   gnome-commander: upgrade 1.16.1 -> 1.16.2
>   nodejs: upgrade 20.18.2 -> 20.20.0
>
> Hitendra Prajapati (1):
>   wireshark: fix for CVE-2026-0959
>
> Hongxu Jia (1):
>   nodejs: fix gcc compile failed for 32 bit arm target
>
> Jan Vermaete (1):
>   python3-protobuf: added python3-ctypes as RDEPENDS
>
> Jason Schonberg (2):
>   libmodule-build-tiny-perl: fix reference to TMPDIR
>   Use https when accessing archive.xfce.org
>
> Khem Raj (1):
>   libgweather4: Upgrade to 4.4.4
>
> Markus Volk (1):
>   gnome-disk-utility: update 46.0 -> 46.1
>
> Peter Marko (3):
>   python3-m2crypto: workaround for swig issue with sys/types.h
>   python3-protobuf: patch CVE-2026-0994
>   gdm: add missing json-glib dependency
>
> Tero Kinnunen (1):
>   python3-watchdog: Remove obsolete dependencies
>
> Wang Mingyu (7):
>   tracker: upgrade 3.7.1 -> 3.7.2
>   tracker: upgrade 3.7.2 -> 3.7.3
>   tracker-miners: upgrade 3.7.1 -> 3.7.2
>   tracker-miners: upgrade 3.7.2 -> 3.7.3
>   gnome-keyring: upgrade 46.1 -> 46.2
>   eog: upgrade 45.3 -> 45.4
>   gnome-text-editor: upgrade 46.1 -> 46.3
>
> alperak (1):
>   python3-eventlet: switch to PEP-517 build backend
>
>  meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb  |   3 +-
>  .../eog/{eog_45.3.bb => eog_45.4.bb}          |   2 +-
>  .../gdm/{gdm_46.0.bb => gdm_46.2.bb}          |   3 +-
>  ...etooth_46.0.bb => gnome-bluetooth_46.2.bb} |   2 +-
>  ...lator_46.0.bb => gnome-calculator_46.2.bb} |   2 +-
>  ...ve-register-storage-class-classifier.patch | 149 -------------
>  .../{gnuchess_6.2.9.bb => gnuchess_6.2.11.bb} |   7 +-
>  ...001-Build-fix-needed-with-taglib-2.0.patch |  37 ----
>  ...er_1.16.1.bb => gnome-commander_1.16.2.bb} |   3 +-
>  ...-desktop_44.0.bb => gnome-desktop_44.4.bb} |   2 +-
>  ...ity_46.0.bb => gnome-disk-utility_46.1.bb} |   2 +-
>  ...-keyring_46.1.bb => gnome-keyring_46.2.bb} |   2 +-
>  .../gnome-settings-daemon_46.0.bb             |   2 +
>  ...46.1.bb => gnome-shell-extensions_46.4.bb} |   2 +-
>  ...itor_46.1.bb => gnome-text-editor_46.3.bb} |   2 +-
>  ...eson-fix-invalid-positional-argument.patch |  33 ---
>  ...e-tweaks_40.0.bb => gnome-tweaks_40.10.bb} |   3 +-
>  ...ew5_5.12.0.bb => gtksourceview5_5.12.1.bb} |   2 +-
>  ...eather4_4.4.2.bb => libgweather4_4.4.4.bb} |   8 +-
>  ...-Dont-use-system-sysprof-dbus-folder.patch |  35 +++
>  .../mutter/{mutter_46.1.bb => mutter_46.9.bb} |   4 +-
>  .../{nautilus_45.1.bb => nautilus_45.2.1.bb}  |   7 +-
>  ...to-a-fixed-path-instead-of-a-host-pa.patch |  15 +-
>  .../0001-fix-reproducibility.patch            | 105 +++++----
>  ...iners_3.7.1.bb => tracker-miners_3.7.3.bb} |   2 +-
>  .../{tracker_3.7.1.bb => tracker_3.7.3.bb}    |   2 +-
>  .../sox/sox/CVE-2017-11332.patch              |  28 +++
>  .../sox/sox/CVE-2017-11358.patch              |  29 +++
>  .../sox/sox/CVE-2017-11359.patch              |  30 +++
>  .../sox/sox/CVE-2017-15370.patch              |  29 +++
>  .../sox/sox/CVE-2017-15371.patch              |  40 ++++
>  .../sox/sox/CVE-2017-15372.patch              | 100 +++++++++
>  .../sox/sox/CVE-2017-15642.patch              |  35 +++
>  .../sox/sox/CVE-2017-18189.patch              |  34 +++
>  .../sox/sox/CVE-2019-13590.patch              |  34 +++
>  .../sox/sox/CVE-2019-8354.patch               |  29 +++
>  .../recipes-multimedia/sox/sox_14.4.2.bb      |  10 +
>  .../ez-ipupdate/ez-ipupdate_3.0.11b7.bb       |   7 +
>  .../ez-ipupdate/files/CVE-2003-0887.patch     | 158 ++++++++++++++
>  .../recipes-daemons/proftpd/proftpd_1.3.7f.bb |   1 +
>  .../wireshark/files/CVE-2026-0959.patch       |  65 ++++++
>  .../wireshark/wireshark_4.2.14.bb             |   1 +
>  .../recipes-dbs/mongodb/mongodb_git.bb        |   7 +-
>  .../oe-npm-cache                              |   0
>  ....18.bb => nodejs-oe-cache-native_20.20.bb} |   0
>  ...e-running-gyp-files-for-bundled-deps.patch |  46 ----
>  ...ert-stop-using-deprecated-ares_query.patch | 164 +++++++++++++++
>  ...4-Do-not-use-mminimal-toc-with-clang.patch |  27 ++-
>  .../0001-src-fix-build-with-GCC-15.patch      |  33 ---
>  .../nodejs/nodejs/182d9c05e78.patch           | 182 ----------------
>  .../nodejs/zlib-fix-pointer-alignment.patch   |  64 ------
>  .../{nodejs_20.18.2.bb => nodejs_20.20.0.bb}  |  13 +-
>  .../php/php/CVE-2025-14178.patch              |  65 ++++++
>  .../php/php/CVE-2025-14180.patch              |  69 ++++++
>  meta-oe/recipes-devtools/php/php_8.2.29.bb    |   2 +
>  .../fontforge/fontforge/CVE-2025-15269.patch  |  35 +++
>  .../fontforge/fontforge/CVE-2025-15270.patch  |  44 ++++
>  .../fontforge/fontforge/CVE-2025-15275.patch  |  33 +++
>  .../fontforge/CVE-2025-15279-1.patch          |  41 ++++
>  .../fontforge/CVE-2025-15279-2.patch          |  34 +++
>  .../fontforge/fontforge_20230101.bb           |   8 +-
>  ...ncrease-supported-Xorg-version-to-1..patch |  29 +++
>  ...server21.1.1.patch-Add-Xorg-21-patch.patch |  95 +++++++++
>  .../files/0001-xvnc-adapt-for-1.21.patch      |  46 ++++
>  .../tigervnc/tigervnc_1.11.0.bb               |  47 +++--
>  .../cups/libcupsfilters/CVE-2025-64503.patch  |  45 ++++
>  .../cups/libcupsfilters_2.0.0.bb              |  12 +-
>  .../recipes-support/freerdp/freerdp_2.11.7.bb |   1 +
>  .../imagemagick/CVE-2025-66628.patch          |  27 +++
>  .../imagemagick/imagemagick_7.1.1.bb          |   1 +
>  .../raptor2/raptor2/CVE-2024-57822.patch      |  44 ++++
>  .../raptor2/raptor2/CVE-2024-57823.patch      |  31 +++
>  .../recipes-support/raptor2/raptor2_2.0.16.bb |   2 +
>  .../libmodule-build-tiny-perl_0.047.bb        |   7 +
>  .../python3-aiohttp/CVE-2025-69225.patch      |  49 +++++
>  .../python3-aiohttp/CVE-2025-69226.patch      | 134 ++++++++++++
>  .../python3-aiohttp/CVE-2025-69228.patch      |  48 +++++
>  .../python/python3-aiohttp_3.9.5.bb           |   7 +-
>  .../0001-lower-setuptools-requirements.patch  |   0
>  .../CVE-2025-64460.patch                      | 199 ++++++++++++++++++
>  ...ngo_4.2.27.bb => python3-django_4.2.28.bb} |   2 +-
>  .../python/python3-django_5.0.14.bb           |   1 +
>  .../python/python3-eventlet_0.36.1.bb         |   4 +-
>  .../python/python3-m2crypto_0.40.1.bb         |   5 +
>  .../python3-protobuf/CVE-2026-0994.patch      |  47 +++++
>  .../python/python3-protobuf_4.25.8.bb         |   3 +
>  .../python3-tornado/CVE-2025-67726.patch      |   2 +-
>  .../python3-virtualenv/CVE-2026-22702.patch   |  60 ++++++
>  .../python/python3-virtualenv_20.25.3.bb      |   1 +
>  .../python/python3-watchdog_4.0.0.bb          |   9 +-
>  .../netdata/netdata_1.44.3.bb                 |   2 +
>  meta-xfce/classes/thunar-plugin.bbclass       |   2 +-
>  meta-xfce/classes/xfce-app.bbclass            |   2 +-
>  meta-xfce/classes/xfce-panel-plugin.bbclass   |   2 +-
>  meta-xfce/classes/xfce.bbclass                |   2 +-
>  .../xfce4-panel-profiles_1.0.14.bb            |   2 +-
>  .../xfwm4-themes/xfwm4-themes_4.10.0.bb       |   2 +-
>  .../vala/xfce4-vala_4.10.3.bb                 |   2 +-
>  .../diskperf/xfce4-diskperf-plugin_2.7.0.bb   |   2 +-
>  .../netload/xfce4-netload-plugin_1.4.1.bb     |   2 +-
>  .../xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb |   2 +-
>  101 files changed, 2210 insertions(+), 703 deletions(-)
>  rename meta-gnome/recipes-gnome/eog/{eog_45.3.bb => eog_45.4.bb} (88%)
>  rename meta-gnome/recipes-gnome/gdm/{gdm_46.0.bb => gdm_46.2.bb} (94%)
>  rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_46.0.bb
> => gnome-bluetooth_46.2.bb} (91%)
>  rename meta-gnome/recipes-gnome/gnome-calculator/{
> gnome-calculator_46.0.bb => gnome-calculator_46.2.bb} (88%)
>  delete mode 100644
> meta-gnome/recipes-gnome/gnome-chess/gnuchess/0001-Remove-register-storage-class-classifier.patch
>  rename meta-gnome/recipes-gnome/gnome-chess/{gnuchess_6.2.9.bb =>
> gnuchess_6.2.11.bb} (55%)
>  delete mode 100644
> meta-gnome/recipes-gnome/gnome-commander/gnome-commander/0001-Build-fix-needed-with-taglib-2.0.patch
>  rename meta-gnome/recipes-gnome/gnome-commander/{
> gnome-commander_1.16.1.bb => gnome-commander_1.16.2.bb} (86%)
>  rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop_44.0.bb =>
> gnome-desktop_44.4.bb} (92%)
>  rename meta-gnome/recipes-gnome/gnome-disk-utility/{
> gnome-disk-utility_46.0.bb => gnome-disk-utility_46.1.bb} (91%)
>  rename meta-gnome/recipes-gnome/gnome-keyring/{gnome-keyring_46.1.bb =>
> gnome-keyring_46.2.bb} (94%)
>  rename meta-gnome/recipes-gnome/gnome-shell/{
> gnome-shell-extensions_46.1.bb => gnome-shell-extensions_46.4.bb} (84%)
>  rename meta-gnome/recipes-gnome/gnome-text-editor/{
> gnome-text-editor_46.1.bb => gnome-text-editor_46.3.bb} (83%)
>  delete mode 100644
> meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch
>  rename meta-gnome/recipes-gnome/gnome-tweaks/{gnome-tweaks_40.0.bb =>
> gnome-tweaks_40.10.bb} (84%)
>  rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview5_5.12.0.bb
> => gtksourceview5_5.12.1.bb} (91%)
>  rename meta-gnome/recipes-gnome/libgweather/{libgweather4_4.4.2.bb =>
> libgweather4_4.4.4.bb} (75%)
>  create mode 100644
> meta-gnome/recipes-gnome/mutter/files/0001-Dont-use-system-sysprof-dbus-folder.patch
>  rename meta-gnome/recipes-gnome/mutter/{mutter_46.1.bb => mutter_46.9.bb}
> (95%)
>  rename meta-gnome/recipes-gnome/nautilus/{nautilus_45.1.bb =>
> nautilus_45.2.1.bb} (81%)
>  rename meta-gnome/recipes-gnome/tracker/{tracker-miners_3.7.1.bb =>
> tracker-miners_3.7.3.bb} (97%)
>  rename meta-gnome/recipes-gnome/tracker/{tracker_3.7.1.bb =>
> tracker_3.7.3.bb} (94%)
>  create mode 100644
> meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11332.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11358.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11359.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15370.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15371.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15372.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15642.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-18189.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/sox/sox/CVE-2019-13590.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/sox/sox/CVE-2019-8354.patch
>  create mode 100644
> meta-networking/recipes-connectivity/ez-ipupdate/files/CVE-2003-0887.patch
>  create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2026-0959.patch
>  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-20.18 =>
> nodejs-oe-cache-20.20}/oe-npm-cache (100%)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_20.18.bb
> => nodejs-oe-cache-native_20.20.bb} (100%)
>  delete mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
>  create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/0001-Revert-stop-using-deprecated-ares_query.patch
>  delete mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/0001-src-fix-build-with-GCC-15.patch
>  delete mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/182d9c05e78.patch
>  delete mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-pointer-alignment.patch
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_20.18.2.bb =>
> nodejs_20.20.0.bb} (95%)
>  create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14178.patch
>  create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14180.patch
>  create mode 100644
> meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch
>  create mode 100644
> meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15270.patch
>  create mode 100644
> meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch
>  create mode 100644
> meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-1.patch
>  create mode 100644
> meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-2.patch
>  create mode 100644
> meta-oe/recipes-graphics/tigervnc/files/0001-xorg-version.h-Increase-supported-Xorg-version-to-1..patch
>  create mode 100644
> meta-oe/recipes-graphics/tigervnc/files/0001-xserver21.1.1.patch-Add-Xorg-21-patch.patch
>  create mode 100644
> meta-oe/recipes-graphics/tigervnc/files/0001-xvnc-adapt-for-1.21.patch
>  create mode 100644
> meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-64503.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-66628.patch
>  create mode 100644
> meta-oe/recipes-support/raptor2/raptor2/CVE-2024-57822.patch
>  create mode 100644
> meta-oe/recipes-support/raptor2/raptor2/CVE-2024-57823.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69225.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69226.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69228.patch
>  rename meta-python/recipes-devtools/python/{python3-django-4.2.27 =>
> python3-django-4.2.28}/0001-lower-setuptools-requirements.patch (100%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-64460.patch
>  rename meta-python/recipes-devtools/python/{python3-django_4.2.27.bb =>
> python3-django_4.2.28.bb} (82%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-protobuf/CVE-2026-0994.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-22702.patch
>
> --
> 2.53.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124412):
> https://lists.openembedded.org/g/openembedded-devel/message/124412
> Mute This Topic: https://lists.openembedded.org/mt/117836487/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000008b79f4064af6b7e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Merged now thanks Anuj=C2=A0</div><br><div class=3D"gmail=
_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 Feb 16, 2026, 1:55 AM Anuj Mittal via <a href=3D"http://lists.openembedded=
.org">lists.openembedded.org</a> &lt;anuj.mittal=3D<a href=3D"mailto:oss.qu=
alcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.openembedded.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">P=
lease merge these changes in scarthgap. Tested locally with<br>
qemuarm/qemuarm64/qemux86-64 and on autobuilder.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1305" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilde=
r.yoctoproject.org/valkyrie/#/builders/81/builds/1305</a><br>
<br>
The following changes since commit 7a5075cef77b5f7af454e9868e1d0019f2fd1394=
:<br>
<br>
=C2=A0 gnome-keyring: set CVE_PRODUCT (2026-01-26 11:16:37 +0530)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer noreferrer" target=3D"_blank">https://git.openembedded.org=
/meta-openembedded-contrib</a> anujm/scarthgap<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Danujm/scarthgap" rel=3D"noreferrer noreferrer" target=3D"_blank">htt=
ps://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/scarthga=
p</a><br>
<br>
Anil Dongare (2):<br>
=C2=A0 php 8.2.29: Fix CVE-2025-14178<br>
=C2=A0 php 8.2.29: Fix CVE-2025-14180<br>
<br>
Gyorgy Sarvari (52):<br>
=C2=A0 sox: patch CVE-2017-11332<br>
=C2=A0 sox: patch CVE-2017-11358<br>
=C2=A0 sox: patch CVE-2017-11359<br>
=C2=A0 sox: patch CVE-2017-15370<br>
=C2=A0 sox: patch CVE-2017-15371<br>
=C2=A0 sox: patch CVE-2017-15372<br>
=C2=A0 sox: patch CVE-2017-15642<br>
=C2=A0 sox: patch CVE-2017-18189<br>
=C2=A0 sox: mark CVE-2019-1010004 as patched<br>
=C2=A0 sox: patch CVE-2019-13590<br>
=C2=A0 sox: patch CVE-2019-8354<br>
=C2=A0 tigervnc: sync xserver component with oe-core<br>
=C2=A0 tigervnc: ignore CVE-2014-8241<br>
=C2=A0 tigervnc: ignore CVE-2023-6377<br>
=C2=A0 tigervnc: ignore CVE-2023-6478<br>
=C2=A0 tigervnc: ignore CVE-2025-26594...26601<br>
=C2=A0 fontforge: patch CVE-2025-15279<br>
=C2=A0 fontforge: patch CVE-2025-15275<br>
=C2=A0 fontforge: patch CVE-2025-15269<br>
=C2=A0 fontforge: patch CVE-2025-15270<br>
=C2=A0 ez-ipupdate: patch CVE-2003-0887<br>
=C2=A0 freerdp: ignore CVE-2025-68118<br>
=C2=A0 gimp: ignore CVE-2025-14423<br>
=C2=A0 gnome-settings-daemon: ignore CVE-2024-38394<br>
=C2=A0 imagemagick: patch CVE-2025-66628<br>
=C2=A0 libcupsfilters: patch CVE-2025-64503<br>
=C2=A0 mongodb: upgrade 4.4.29 -&gt; 4.4.30<br>
=C2=A0 mongodb: ignore CVE-2025-14911<br>
=C2=A0 netdata: ignore CVE-2024-32019<br>
=C2=A0 proftpd: ignore CVE-2021-47865<br>
=C2=A0 python3-aiohttp: patch CVE-2025-69225<br>
=C2=A0 python3-aiohttp: patch CVE-2025-69226<br>
=C2=A0 python3-aiohttp: patch CVE-2025-69228<br>
=C2=A0 python3-django: patch CVE-2025-64460<br>
=C2=A0 raptor2: patch CVE-2024-57822 and CVE-2024-57823<br>
=C2=A0 python3-tornado: mark CVE-2025-67725 patched<br>
=C2=A0 python3-virtualenv: patch CVE-2026-22702<br>
=C2=A0 gnome-desktop: upgrade 44.0 -&gt; 44.4<br>
=C2=A0 gtksourceview5: upgrade 5.12.0 -&gt; 5.12.1<br>
=C2=A0 gnuchess: upgrade 6.2.9 -&gt; 6.2.11<br>
=C2=A0 gnome-calculator: upgrade 46.0 -&gt; 46.2<br>
=C2=A0 gdm: upgrade 46.0 -&gt; 46.2<br>
=C2=A0 mutter: upgrade 46.1 -&gt; 46.9<br>
=C2=A0 mutter: fix profiler PACKAGECONFIG<br>
=C2=A0 gnome-bluetooth: upgrade 46.0 -&gt; 46.2<br>
=C2=A0 gnome-shell-extensions: upgrade 46.1 -&gt; 46.4<br>
=C2=A0 nautilus: upgrade 45.1 -&gt; 45.2.1<br>
=C2=A0 gnome-tweaks: upgrade 40.0 -&gt; 40.10<br>
=C2=A0 tigervnc: mark CVE-2024-0408 and CVE-2024-0409 patched<br>
=C2=A0 python3-django: upgrade 4.2.27 -&gt; 4.2.28<br>
=C2=A0 gnome-commander: upgrade 1.16.1 -&gt; 1.16.2<br>
=C2=A0 nodejs: upgrade 20.18.2 -&gt; 20.20.0<br>
<br>
Hitendra Prajapati (1):<br>
=C2=A0 wireshark: fix for CVE-2026-0959<br>
<br>
Hongxu Jia (1):<br>
=C2=A0 nodejs: fix gcc compile failed for 32 bit arm target<br>
<br>
Jan Vermaete (1):<br>
=C2=A0 python3-protobuf: added python3-ctypes as RDEPENDS<br>
<br>
Jason Schonberg (2):<br>
=C2=A0 libmodule-build-tiny-perl: fix reference to TMPDIR<br>
=C2=A0 Use https when accessing <a href=3D"http://archive.xfce.org" rel=3D"=
noreferrer noreferrer" target=3D"_blank">archive.xfce.org</a><br>
<br>
Khem Raj (1):<br>
=C2=A0 libgweather4: Upgrade to 4.4.4<br>
<br>
Markus Volk (1):<br>
=C2=A0 gnome-disk-utility: update 46.0 -&gt; 46.1<br>
<br>
Peter Marko (3):<br>
=C2=A0 python3-m2crypto: workaround for swig issue with sys/types.h<br>
=C2=A0 python3-protobuf: patch CVE-2026-0994<br>
=C2=A0 gdm: add missing json-glib dependency<br>
<br>
Tero Kinnunen (1):<br>
=C2=A0 python3-watchdog: Remove obsolete dependencies<br>
<br>
Wang Mingyu (7):<br>
=C2=A0 tracker: upgrade 3.7.1 -&gt; 3.7.2<br>
=C2=A0 tracker: upgrade 3.7.2 -&gt; 3.7.3<br>
=C2=A0 tracker-miners: upgrade 3.7.1 -&gt; 3.7.2<br>
=C2=A0 tracker-miners: upgrade 3.7.2 -&gt; 3.7.3<br>
=C2=A0 gnome-keyring: upgrade 46.1 -&gt; 46.2<br>
=C2=A0 eog: upgrade 45.3 -&gt; 45.4<br>
=C2=A0 gnome-text-editor: upgrade 46.1 -&gt; 46.3<br>
<br>
alperak (1):<br>
=C2=A0 python3-eventlet: switch to PEP-517 build backend<br>
<br>
=C2=A0meta-gnome/recipes-gimp/gimp/<a href=3D"http://gimp_2.10.38.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">gimp_2.10.38.bb</a>=C2=A0 |=C2=
=A0 =C2=A03 +-<br>
=C2=A0.../eog/{<a href=3D"http://eog_45.3.bb" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">eog_45.3.bb</a> =3D&gt; <a href=3D"http://eog_45.4.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">eog_45.4.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../gdm/{<a href=3D"http://gdm_46.0.bb" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">gdm_46.0.bb</a> =3D&gt; <a href=3D"http://gdm_46.2.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">gdm_46.2.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0...<a href=3D"http://etooth_46.0.bb" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">etooth_46.0.bb</a> =3D&gt; <a href=3D"http://gnome-bluetoot=
h_46.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gnome-bluetooth_=
46.2.bb</a>} |=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://lator_46.0.bb" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">lator_46.0.bb</a> =3D&gt; <a href=3D"http://gnome-calculator=
_46.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gnome-calculator_=
46.2.bb</a>} |=C2=A0 =C2=A02 +-<br>
=C2=A0...ve-register-storage-class-classifier.patch | 149 -------------<br>
=C2=A0.../{<a href=3D"http://gnuchess_6.2.9.bb" rel=3D"noreferrer noreferre=
r" target=3D"_blank">gnuchess_6.2.9.bb</a> =3D&gt; <a href=3D"http://gnuche=
ss_6.2.11.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gnuchess_6.2.=
11.bb</a>} |=C2=A0 =C2=A07 +-<br>
=C2=A0...001-Build-fix-needed-with-taglib-2.0.patch |=C2=A0 37 ----<br>
=C2=A0...<a href=3D"http://er_1.16.1.bb" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">er_1.16.1.bb</a> =3D&gt; <a href=3D"http://gnome-commander_1.=
16.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gnome-commander_1.=
16.2.bb</a>} |=C2=A0 =C2=A03 +-<br>
=C2=A0...-<a href=3D"http://desktop_44.0.bb" rel=3D"noreferrer noreferrer" =
target=3D"_blank">desktop_44.0.bb</a> =3D&gt; <a href=3D"http://gnome-deskt=
op_44.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gnome-desktop_4=
4.4.bb</a>} |=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://ity_46.0.bb" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">ity_46.0.bb</a> =3D&gt; <a href=3D"http://gnome-disk-utility_4=
6.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gnome-disk-utility_=
46.1.bb</a>} |=C2=A0 =C2=A02 +-<br>
=C2=A0...-<a href=3D"http://keyring_46.1.bb" rel=3D"noreferrer noreferrer" =
target=3D"_blank">keyring_46.1.bb</a> =3D&gt; <a href=3D"http://gnome-keyri=
ng_46.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gnome-keyring_4=
6.2.bb</a>} |=C2=A0 =C2=A02 +-<br>
=C2=A0.../<a href=3D"http://gnome-settings-daemon_46.0.bb" rel=3D"noreferre=
r noreferrer" target=3D"_blank">gnome-settings-daemon_46.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0...<a href=3D"http://46.1.bb" rel=3D"noreferrer noreferrer" target=3D=
"_blank">46.1.bb</a> =3D&gt; <a href=3D"http://gnome-shell-extensions_46.4.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gnome-shell-extensions_=
46.4.bb</a>} |=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://itor_46.1.bb" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">itor_46.1.bb</a> =3D&gt; <a href=3D"http://gnome-text-editor_=
46.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gnome-text-editor_=
46.3.bb</a>} |=C2=A0 =C2=A02 +-<br>
=C2=A0...eson-fix-invalid-positional-argument.patch |=C2=A0 33 ---<br>
=C2=A0...<a href=3D"http://e-tweaks_40.0.bb" rel=3D"noreferrer noreferrer" =
target=3D"_blank">e-tweaks_40.0.bb</a> =3D&gt; <a href=3D"http://gnome-twea=
ks_40.10.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gnome-tweaks_4=
0.10.bb</a>} |=C2=A0 =C2=A03 +-<br>
=C2=A0...<a href=3D"http://ew5_5.12.0.bb" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">ew5_5.12.0.bb</a> =3D&gt; <a href=3D"http://gtksourceview5_5=
.12.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gtksourceview5_5.=
12.1.bb</a>} |=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://eather4_4.4.2.bb" rel=3D"noreferrer noreferrer" =
target=3D"_blank">eather4_4.4.2.bb</a> =3D&gt; <a href=3D"http://libgweathe=
r4_4.4.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libgweather4_4=
.4.4.bb</a>} |=C2=A0 =C2=A08 +-<br>
=C2=A0...-Dont-use-system-sysprof-dbus-folder.patch |=C2=A0 35 +++<br>
=C2=A0.../mutter/{<a href=3D"http://mutter_46.1.bb" rel=3D"noreferrer noref=
errer" target=3D"_blank">mutter_46.1.bb</a> =3D&gt; <a href=3D"http://mutte=
r_46.9.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">mutter_46.9.bb</=
a>} |=C2=A0 =C2=A04 +-<br>
=C2=A0.../{<a href=3D"http://nautilus_45.1.bb" rel=3D"noreferrer noreferrer=
" target=3D"_blank">nautilus_45.1.bb</a> =3D&gt; <a href=3D"http://nautilus=
_45.2.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">nautilus_45.2.1=
.bb</a>}=C2=A0 |=C2=A0 =C2=A07 +-<br>
=C2=A0...to-a-fixed-path-instead-of-a-host-pa.patch |=C2=A0 15 +-<br>
=C2=A0.../0001-fix-reproducibility.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 105 +++++----<br>
=C2=A0...<a href=3D"http://iners_3.7.1.bb" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">iners_3.7.1.bb</a> =3D&gt; <a href=3D"http://tracker-miners=
_3.7.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">tracker-miners_3=
.7.3.bb</a>} |=C2=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://tracker_3.7.1.bb" rel=3D"noreferrer noreferrer=
" target=3D"_blank">tracker_3.7.1.bb</a> =3D&gt; <a href=3D"http://tracker_=
3.7.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">tracker_3.7.3.bb<=
/a>}=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../sox/sox/CVE-2017-11332.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 28 +++<br>
=C2=A0.../sox/sox/CVE-2017-11358.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 29 +++<br>
=C2=A0.../sox/sox/CVE-2017-11359.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 30 +++<br>
=C2=A0.../sox/sox/CVE-2017-15370.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 29 +++<br>
=C2=A0.../sox/sox/CVE-2017-15371.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 40 ++++<br>
=C2=A0.../sox/sox/CVE-2017-15372.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 100 +++++++++<br>
=C2=A0.../sox/sox/CVE-2017-15642.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 35 +++<br>
=C2=A0.../sox/sox/CVE-2017-18189.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 34 +++<br>
=C2=A0.../sox/sox/CVE-2019-13590.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 34 +++<br>
=C2=A0.../sox/sox/CVE-2019-8354.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 29 +++<br>
=C2=A0.../recipes-multimedia/sox/<a href=3D"http://sox_14.4.2.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">sox_14.4.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 10 +<br>
=C2=A0.../ez-ipupdate/<a href=3D"http://ez-ipupdate_3.0.11b7.bb" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">ez-ipupdate_3.0.11b7.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +<br>
=C2=A0.../ez-ipupdate/files/CVE-2003-0887.patch=C2=A0 =C2=A0 =C2=A0| 158 ++=
++++++++++++<br>
=C2=A0.../recipes-daemons/proftpd/<a href=3D"http://proftpd_1.3.7f.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">proftpd_1.3.7f.bb</a> |=C2=A0 =
=C2=A01 +<br>
=C2=A0.../wireshark/files/CVE-2026-0959.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 65 ++++++<br>
=C2=A0.../wireshark/<a href=3D"http://wireshark_4.2.14.bb" rel=3D"noreferre=
r noreferrer" target=3D"_blank">wireshark_4.2.14.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../recipes-dbs/mongodb/<a href=3D"http://mongodb_git.bb" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">mongodb_git.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A07 +-<br>
=C2=A0.../oe-npm-cache=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0....<a href=3D"http://18.bb" rel=3D"noreferrer noreferrer" target=3D"=
_blank">18.bb</a> =3D&gt; <a href=3D"http://nodejs-oe-cache-native_20.20.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">nodejs-oe-cache-native_20=
.20.bb</a>} |=C2=A0 =C2=A00<br>
=C2=A0...e-running-gyp-files-for-bundled-deps.patch |=C2=A0 46 ----<br>
=C2=A0...ert-stop-using-deprecated-ares_query.patch | 164 +++++++++++++++<b=
r>
=C2=A0...4-Do-not-use-mminimal-toc-with-clang.patch |=C2=A0 27 ++-<br>
=C2=A0.../0001-src-fix-build-with-GCC-15.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
33 ---<br>
=C2=A0.../nodejs/nodejs/182d9c05e78.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 182 ----------------<br>
=C2=A0.../nodejs/zlib-fix-pointer-alignment.patch=C2=A0 =C2=A0|=C2=A0 64 --=
----<br>
=C2=A0.../{<a href=3D"http://nodejs_20.18.2.bb" rel=3D"noreferrer noreferre=
r" target=3D"_blank">nodejs_20.18.2.bb</a> =3D&gt; <a href=3D"http://nodejs=
_20.20.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">nodejs_20.20.0=
.bb</a>}=C2=A0 |=C2=A0 13 +-<br>
=C2=A0.../php/php/CVE-2025-14178.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 65 ++++++<br>
=C2=A0.../php/php/CVE-2025-14180.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 69 ++++++<br>
=C2=A0meta-oe/recipes-devtools/php/<a href=3D"http://php_8.2.29.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">php_8.2.29.bb</a>=C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +<br>
=C2=A0.../fontforge/fontforge/CVE-2025-15269.patch=C2=A0 |=C2=A0 35 +++<br>
=C2=A0.../fontforge/fontforge/CVE-2025-15270.patch=C2=A0 |=C2=A0 44 ++++<br=
>
=C2=A0.../fontforge/fontforge/CVE-2025-15275.patch=C2=A0 |=C2=A0 33 +++<br>
=C2=A0.../fontforge/CVE-2025-15279-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 41 ++++<br>
=C2=A0.../fontforge/CVE-2025-15279-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 34 +++<br>
=C2=A0.../fontforge/<a href=3D"http://fontforge_20230101.bb" rel=3D"norefer=
rer noreferrer" target=3D"_blank">fontforge_20230101.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0...ncrease-supported-Xorg-version-to-1..patch |=C2=A0 29 +++<br>
=C2=A0...server21.1.1.patch-Add-Xorg-21-patch.patch |=C2=A0 95 +++++++++<br=
>
=C2=A0.../files/0001-xvnc-adapt-for-1.21.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
46 ++++<br>
=C2=A0.../tigervnc/<a href=3D"http://tigervnc_1.11.0.bb" rel=3D"noreferrer =
noreferrer" target=3D"_blank">tigervnc_1.11.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 47 +++--<br>
=C2=A0.../cups/libcupsfilters/CVE-2025-64503.patch=C2=A0 |=C2=A0 45 ++++<br=
>
=C2=A0.../cups/<a href=3D"http://libcupsfilters_2.0.0.bb" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">libcupsfilters_2.0.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +-<br>
=C2=A0.../recipes-support/freerdp/<a href=3D"http://freerdp_2.11.7.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">freerdp_2.11.7.bb</a> |=C2=A0 =
=C2=A01 +<br>
=C2=A0.../imagemagick/CVE-2025-66628.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 27 +++<br>
=C2=A0.../imagemagick/<a href=3D"http://imagemagick_7.1.1.bb" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">imagemagick_7.1.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../raptor2/raptor2/CVE-2024-57822.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
44 ++++<br>
=C2=A0.../raptor2/raptor2/CVE-2024-57823.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
31 +++<br>
=C2=A0.../recipes-support/raptor2/<a href=3D"http://raptor2_2.0.16.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">raptor2_2.0.16.bb</a> |=C2=A0 =
=C2=A02 +<br>
=C2=A0.../<a href=3D"http://libmodule-build-tiny-perl_0.047.bb" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">libmodule-build-tiny-perl_0.047.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
=C2=A0.../python3-aiohttp/CVE-2025-69225.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
49 +++++<br>
=C2=A0.../python3-aiohttp/CVE-2025-69226.patch=C2=A0 =C2=A0 =C2=A0 | 134 ++=
++++++++++<br>
=C2=A0.../python3-aiohttp/CVE-2025-69228.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
48 +++++<br>
=C2=A0.../python/<a href=3D"http://python3-aiohttp_3.9.5.bb" rel=3D"norefer=
rer noreferrer" target=3D"_blank">python3-aiohttp_3.9.5.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +-<br>
=C2=A0.../0001-lower-setuptools-requirements.patch=C2=A0 |=C2=A0 =C2=A00<br=
>
=C2=A0.../CVE-2025-64460.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 199 ++++++++++++++++++<br>
=C2=A0...<a href=3D"http://ngo_4.2.27.bb" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">ngo_4.2.27.bb</a> =3D&gt; <a href=3D"http://python3-django_4=
.2.28.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-django_4.=
2.28.bb</a>} |=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-django_5.0.14.bb" rel=3D"norefer=
rer noreferrer" target=3D"_blank">python3-django_5.0.14.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../python/<a href=3D"http://python3-eventlet_0.36.1.bb" rel=3D"noref=
errer noreferrer" target=3D"_blank">python3-eventlet_0.36.1.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0.../python/<a href=3D"http://python3-m2crypto_0.40.1.bb" rel=3D"noref=
errer noreferrer" target=3D"_blank">python3-m2crypto_0.40.1.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
=C2=A0.../python3-protobuf/CVE-2026-0994.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
47 +++++<br>
=C2=A0.../python/<a href=3D"http://python3-protobuf_4.25.8.bb" rel=3D"noref=
errer noreferrer" target=3D"_blank">python3-protobuf_4.25.8.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0.../python3-tornado/CVE-2025-67726.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../python3-virtualenv/CVE-2026-22702.patch=C2=A0 =C2=A0|=C2=A0 60 ++=
++++<br>
=C2=A0.../python/<a href=3D"http://python3-virtualenv_20.25.3.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">python3-virtualenv_20.25.3.bb</a>=C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../python/<a href=3D"http://python3-watchdog_4.0.0.bb" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">python3-watchdog_4.0.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +-<br>
=C2=A0.../netdata/<a href=3D"http://netdata_1.44.3.bb" rel=3D"noreferrer no=
referrer" target=3D"_blank">netdata_1.44.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0meta-xfce/classes/thunar-plugin.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0meta-xfce/classes/xfce-app.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta-xfce/classes/xfce-panel-plugin.bbclass=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +-<br>
=C2=A0meta-xfce/classes/xfce.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../<a href=3D"http://xfce4-panel-profiles_1.0.14.bb" rel=3D"noreferr=
er noreferrer" target=3D"_blank">xfce4-panel-profiles_1.0.14.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../xfwm4-themes/<a href=3D"http://xfwm4-themes_4.10.0.bb" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">xfwm4-themes_4.10.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../vala/<a href=3D"http://xfce4-vala_4.10.3.bb" rel=3D"noreferrer no=
referrer" target=3D"_blank">xfce4-vala_4.10.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../diskperf/<a href=3D"http://xfce4-diskperf-plugin_2.7.0.bb" rel=3D=
"noreferrer noreferrer" target=3D"_blank">xfce4-diskperf-plugin_2.7.0.bb</a=
>=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../netload/<a href=3D"http://xfce4-netload-plugin_1.4.1.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">xfce4-netload-plugin_1.4.1.bb</a>=
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../xfce4-dev-tools/<a href=3D"http://xfce4-dev-tools_4.18.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">xfce4-dev-tools_4.18.0.bb</a> =
|=C2=A0 =C2=A02 +-<br>
=C2=A0101 files changed, 2210 insertions(+), 703 deletions(-)<br>
=C2=A0rename meta-gnome/recipes-gnome/eog/{<a href=3D"http://eog_45.3.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">eog_45.3.bb</a> =3D&gt; <a h=
ref=3D"http://eog_45.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">=
eog_45.4.bb</a>} (88%)<br>
=C2=A0rename meta-gnome/recipes-gnome/gdm/{<a href=3D"http://gdm_46.0.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">gdm_46.0.bb</a> =3D&gt; <a h=
ref=3D"http://gdm_46.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">=
gdm_46.2.bb</a>} (94%)<br>
=C2=A0rename meta-gnome/recipes-gnome/gnome-bluetooth/{<a href=3D"http://gn=
ome-bluetooth_46.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gnom=
e-bluetooth_46.0.bb</a> =3D&gt; <a href=3D"http://gnome-bluetooth_46.2.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">gnome-bluetooth_46.2.bb</a>=
} (91%)<br>
=C2=A0rename meta-gnome/recipes-gnome/gnome-calculator/{<a href=3D"http://g=
nome-calculator_46.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gn=
ome-calculator_46.0.bb</a> =3D&gt; <a href=3D"http://gnome-calculator_46.2.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gnome-calculator_46.2.b=
b</a>} (88%)<br>
=C2=A0delete mode 100644 meta-gnome/recipes-gnome/gnome-chess/gnuchess/0001=
-Remove-register-storage-class-classifier.patch<br>
=C2=A0rename meta-gnome/recipes-gnome/gnome-chess/{<a href=3D"http://gnuche=
ss_6.2.9.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gnuchess_6.2.9=
.bb</a> =3D&gt; <a href=3D"http://gnuchess_6.2.11.bb" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">gnuchess_6.2.11.bb</a>} (55%)<br>
=C2=A0delete mode 100644 meta-gnome/recipes-gnome/gnome-commander/gnome-com=
mander/0001-Build-fix-needed-with-taglib-2.0.patch<br>
=C2=A0rename meta-gnome/recipes-gnome/gnome-commander/{<a href=3D"http://gn=
ome-commander_1.16.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gn=
ome-commander_1.16.1.bb</a> =3D&gt; <a href=3D"http://gnome-commander_1.16.=
2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gnome-commander_1.16.=
2.bb</a>} (86%)<br>
=C2=A0rename meta-gnome/recipes-gnome/gnome-desktop/{<a href=3D"http://gnom=
e-desktop_44.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gnome-de=
sktop_44.0.bb</a> =3D&gt; <a href=3D"http://gnome-desktop_44.4.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">gnome-desktop_44.4.bb</a>} (92%)<br=
>
=C2=A0rename meta-gnome/recipes-gnome/gnome-disk-utility/{<a href=3D"http:/=
/gnome-disk-utility_46.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank=
">gnome-disk-utility_46.0.bb</a> =3D&gt; <a href=3D"http://gnome-disk-utili=
ty_46.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gnome-disk-util=
ity_46.1.bb</a>} (91%)<br>
=C2=A0rename meta-gnome/recipes-gnome/gnome-keyring/{<a href=3D"http://gnom=
e-keyring_46.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gnome-ke=
yring_46.1.bb</a> =3D&gt; <a href=3D"http://gnome-keyring_46.2.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">gnome-keyring_46.2.bb</a>} (94%)<br=
>
=C2=A0rename meta-gnome/recipes-gnome/gnome-shell/{<a href=3D"http://gnome-=
shell-extensions_46.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">g=
nome-shell-extensions_46.1.bb</a> =3D&gt; <a href=3D"http://gnome-shell-ext=
ensions_46.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gnome-shel=
l-extensions_46.4.bb</a>} (84%)<br>
=C2=A0rename meta-gnome/recipes-gnome/gnome-text-editor/{<a href=3D"http://=
gnome-text-editor_46.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">=
gnome-text-editor_46.1.bb</a> =3D&gt; <a href=3D"http://gnome-text-editor_4=
6.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gnome-text-editor_4=
6.3.bb</a>} (83%)<br>
=C2=A0delete mode 100644 meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks=
/0002-meson-fix-invalid-positional-argument.patch<br>
=C2=A0rename meta-gnome/recipes-gnome/gnome-tweaks/{<a href=3D"http://gnome=
-tweaks_40.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gnome-twea=
ks_40.0.bb</a> =3D&gt; <a href=3D"http://gnome-tweaks_40.10.bb" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">gnome-tweaks_40.10.bb</a>} (84%)<br>
=C2=A0rename meta-gnome/recipes-gnome/gtksourceview/{<a href=3D"http://gtks=
ourceview5_5.12.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gtkso=
urceview5_5.12.0.bb</a> =3D&gt; <a href=3D"http://gtksourceview5_5.12.1.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">gtksourceview5_5.12.1.bb</=
a>} (91%)<br>
=C2=A0rename meta-gnome/recipes-gnome/libgweather/{<a href=3D"http://libgwe=
ather4_4.4.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libgweathe=
r4_4.4.2.bb</a> =3D&gt; <a href=3D"http://libgweather4_4.4.4.bb" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">libgweather4_4.4.4.bb</a>} (75%)<br>
=C2=A0create mode 100644 meta-gnome/recipes-gnome/mutter/files/0001-Dont-us=
e-system-sysprof-dbus-folder.patch<br>
=C2=A0rename meta-gnome/recipes-gnome/mutter/{<a href=3D"http://mutter_46.1=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">mutter_46.1.bb</a> =3D=
&gt; <a href=3D"http://mutter_46.9.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">mutter_46.9.bb</a>} (95%)<br>
=C2=A0rename meta-gnome/recipes-gnome/nautilus/{<a href=3D"http://nautilus_=
45.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">nautilus_45.1.bb</=
a> =3D&gt; <a href=3D"http://nautilus_45.2.1.bb" rel=3D"noreferrer noreferr=
er" target=3D"_blank">nautilus_45.2.1.bb</a>} (81%)<br>
=C2=A0rename meta-gnome/recipes-gnome/tracker/{<a href=3D"http://tracker-mi=
ners_3.7.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">tracker-mine=
rs_3.7.1.bb</a> =3D&gt; <a href=3D"http://tracker-miners_3.7.3.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">tracker-miners_3.7.3.bb</a>} (97%)<=
br>
=C2=A0rename meta-gnome/recipes-gnome/tracker/{<a href=3D"http://tracker_3.=
7.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">tracker_3.7.1.bb</a=
> =3D&gt; <a href=3D"http://tracker_3.7.3.bb" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">tracker_3.7.3.bb</a>} (94%)<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-201=
7-11332.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-201=
7-11358.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-201=
7-11359.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-201=
7-15370.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-201=
7-15371.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-201=
7-15372.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-201=
7-15642.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-201=
7-18189.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-201=
9-13590.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-201=
9-8354.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/ez-ipupdate/f=
iles/CVE-2003-0887.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/wireshark/files/CV=
E-2026-0959.patch<br>
=C2=A0rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-20.18 =3D&gt;=
 nodejs-oe-cache-20.20}/oe-npm-cache (100%)<br>
=C2=A0rename meta-oe/recipes-devtools/nodejs/{<a href=3D"http://nodejs-oe-c=
ache-native_20.18.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">nodej=
s-oe-cache-native_20.18.bb</a> =3D&gt; <a href=3D"http://nodejs-oe-cache-na=
tive_20.20.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">nodejs-oe-ca=
che-native_20.20.bb</a>} (100%)<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Disabl=
e-running-gyp-files-for-bundled-deps.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Revert=
-stop-using-deprecated-ares_query.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-src-fi=
x-build-with-GCC-15.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/182d9c05e78=
.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-po=
inter-alignment.patch<br>
=C2=A0rename meta-oe/recipes-devtools/nodejs/{<a href=3D"http://nodejs_20.1=
8.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">nodejs_20.18.2.bb</=
a> =3D&gt; <a href=3D"http://nodejs_20.20.0.bb" rel=3D"noreferrer noreferre=
r" target=3D"_blank">nodejs_20.20.0.bb</a>} (95%)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14178.pa=
tch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14180.pa=
tch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2=
025-15269.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2=
025-15270.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2=
025-15275.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2=
025-15279-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2=
025-15279-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0001-xorg-=
version.h-Increase-supported-Xorg-version-to-1..patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0001-xserv=
er21.1.1.patch-Add-Xorg-21-patch.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0001-xvnc-=
adapt-for-1.21.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-printing/cups/libcupsfilters/CVE-2=
025-64503.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2025-66628.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/raptor2/raptor2/CVE-2024-5=
7822.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/raptor2/raptor2/CVE-2024-5=
7823.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2025-69225.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2025-69226.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2025-69228.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{python3-django-4.2.27 =3D=
&gt; python3-django-4.2.28}/0001-lower-setuptools-requirements.patch (100%)=
<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
-5.0.14/CVE-2025-64460.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_4.2.27.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-=
django_4.2.27.bb</a> =3D&gt; <a href=3D"http://python3-django_4.2.28.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">python3-django_4.2.28.bb</a>}=
 (82%)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-protob=
uf/CVE-2026-0994.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-virtua=
lenv/CVE-2026-22702.patch<br>
<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#124412): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/124412" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/124412</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117836487/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/117836487/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008b79f4064af6b7e2--

