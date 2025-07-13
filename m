Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8C4C83F1D
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 22:41:56 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.66193.1752446508197165310
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Jul 2025 15:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jalz4Onh;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e898fb745beso4577407276.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 15:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752446507; x=1753051307; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBaBhwuZKm8mJgHj/82HDgxFSQeFhTgB7G5I3pAG76I=;
        b=jalz4OnhnzEppKMIvsGwq9+/1FfZaHgDhK3ECw+oIeP01d9xZs8QQkVgsyhRcQ5dfO
         5zvtp5G7QJAHk3YcYdMh/SvemyQLgJMnJWxcfU0SNmgcXRe4iporTNlbvPatUxoFrl6j
         htgDOZu+0DgJs1egBbzj6okISQ9hiQs06nGgpqCLmNTMHYwkzdb+XOQKJyBHZSvJlehv
         EnrZZeNzmK5obPzTY/75JMd4yFzgmAgZVwwDi3Y4lGpnmu3PVA8N39KHbUZr8+WUwoNh
         kbTjVikH0miDN2MOfn0wcCphu+jzaQuo+Yiz5L2nIwbIQBvszzFm7N0SRrd+an58qRay
         dV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752446507; x=1753051307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBaBhwuZKm8mJgHj/82HDgxFSQeFhTgB7G5I3pAG76I=;
        b=GLt4tZn9vS1qTXKLef386thCCNJfPz+WNQuqAE8P8HC6BZpT/grMHQFJ5ipD4sY4NF
         ZctMiz2883N/GVNlhxEFngXNRwhAznbdjD4T4tPYmjeAdS0tIR3L5gLVUAMWIKf3jMQZ
         eJWNytbfwXeQRdHhRBbufzCnQTVHbhM04OFAs0/ysIQ8tjarEaFFuayv2fhmYaQGRngY
         Tpoo0MeAgRsIK2mKzR8MPHGgNcGrmLBZupUo02lDK6gejx6BYF07JQA0OL6rS+OVl0L0
         v4v33LvK2U3OEmN+bq4UCg8N0lcb7btjj21S6giDV6WYfFeJaR/kE9UPfydD8SCasWkH
         CDqw==
X-Gm-Message-State: AOJu0YwbEjUZRam2cRc519XO+RyDNV5MyDJo3sqk6NvcVHgqXz3GKx6K
	5CGD9rvgWvWqZ2wZuFXt6VtmrZ7ekYZNnc3cin65g6JD0K2sB5OCWYrmVhlZYWIVdIxcpCH+i2K
	cawkREqutJC6ZV9nOKfCV0RcG0KJ+DRE=
X-Gm-Gg: ASbGncsbC9NNeZltl6jFRXPshEPCUnoXrBijigIcObEQZb02gr2JQIlLt3RlWU/Aqlk
	+ToQQ9oMS/JlD+wrNd5qUh+PxPMJA2ZubfYFBI1tfTwwtk02h1qf7bAxxf99WnMAkJrEi1yDP0c
	B2JDFx3P+iuGv3oCMgTFslnA4m7SPzpScftTaoAy0sMlBq4ahRu2Qv3xbeSLsDRfhkAYVt0xPVF
	7fMbkbL0Kz6puRDig==
X-Google-Smtp-Source: AGHT+IHNNlWhi0FIPUz/Hbb/cUCOlrA2uk6OAWNHBdq57Uq0eY7k8YiR1AvJ0f9Pimo/WMHX/4gFUDih2sIiJBRRJSM=
X-Received: by 2002:a05:690c:d91:b0:712:ca60:c5fd with SMTP id
 00721157ae682-717c1476b73mr229645197b3.1.1752446507137; Sun, 13 Jul 2025
 15:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <7038bb2d-09ba-48d0-9e58-0e7049d10707@gmail.com>
In-Reply-To: <7038bb2d-09ba-48d0-9e58-0e7049d10707@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 13 Jul 2025 15:41:20 -0700
X-Gm-Features: Ac12FXzMJS6_CKv6hvNRC2ekcxPWie3nV-i19rtjJiO1ysPeQBojAh78-ukvaz0
Message-ID: <CAMKF1squoJWRLc-f1HLjq+FhiD+ssf=pnSTwVrFVm947xcofCg@mail.gmail.com>
Subject: Re: scarthgap merge request: July 13th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 22:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118515

merged now thanks.

On Sun, Jul 13, 2025 at 11:27=E2=80=AFAM akuster808 <akuster808@gmail.com> =
wrote:
>
> The following changes since commit 727811eaf256b88fd135be99559f2cbf14c82f=
ce:
>
>    imagemagick: guard sed operations in do_install for optional files
> (2025-06-23 17:03:24 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded scarthgap-next
>
> for you to fetch changes up to e8fd97d86af86cdcc5a6eb3f301cbaf6a2084943:
>
>    xfce4 update HOMEPAGEs (2025-07-10 20:29:57 -0400)
>
> ----------------------------------------------------------------
> Archana Polampalli (1):
>        tcpreplay: fix CVE-2024-22654
>
> Changqing Li (3):
>        libblockdev: fix CVE-2025-6019
>        udisks2: Hardening measure of CVE-2025-6019
>        phpmyadmin: upgrade 5.2.1 -> 5.2.2
>
> Chen Qi (2):
>        protobuf: upgrade from 4.25.3 to 4.25.8
>        python3-protobuf: upgrade from 4.25.3 to 4.25.8
>
> Guocai He (3):
>        python3-pylint: correct the SRC_URI
>        libconfig: correct the SRC_URI
>        logcheck: correct the SRC_URI
>
> Hitendra Prajapati (1):
>        libssh: fix CVE-2025-5318
>
> J. S. (1):
>        xfce4 update HOMEPAGEs
>
> Martin Jansa (1):
>        python3-h5py: backport fixes for incompatible-pointer-types issues
>
> Roland Kovacs (1):
>        jq-1.7.1: Backport multiple CVE fixes
>
> Vijay Anusuri (1):
>        wireshark: upgrade 4.2.9 -> 4.2.12
>
>   .../tcpreplay/tcpreplay/CVE-2024-22654-0001.patch               | 90 ++=
++
>   .../tcpreplay/tcpreplay/CVE-2024-22654-0002.patch               | 35 ++
>   meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb    | 2 +
>   .../wireshark/{wireshark_4.2.9.bb =3D> wireshark_4.2.12.bb} |   8 +-
>   meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch             | 233
> ++++++++
>   meta-oe/recipes-devtools/jq/jq/CVE-2024-53427.patch             | 79 ++=
+
>   meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch             | 45 ++
>   meta-oe/recipes-devtools/jq/jq_1.7.1.bb                         | 3 +
>   ...1-Add-recursion-check-when-parsing-unknown-fields-in-J.patch | 794
> ----------------------------
>   .../protobuf/{protobuf_4.25.3.bb =3D> protobuf_4.25.8.bb} |   3 +-
>   meta-oe/recipes-extended/libblockdev/files/CVE-2025-6019.patch  | 31 ++
>   meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb       | 1 +
>   meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb           | 2 +-
>   meta-oe/recipes-support/libssh/libssh/CVE-2025-5318.patch       | 31 ++
>   meta-oe/recipes-support/libssh/libssh_0.10.6.bb                 | 1 +
>   meta-oe/recipes-support/udisks/udisks2/CVE-2025-6019.patch      | 51 ++
>   meta-oe/recipes-support/udisks/udisks2_2.10.1.bb                | 1 +
>   meta-perl/recipes-extended/logcheck/logcheck_1.4.3.bb           | 2 +-
>   .../0001-Properly-cast-arguments-to-H5Lunpack_elink_val.patch   | 25 +
>   .../python3-h5py/0002-Use-libc.stdint-instead-of-numpy.patch    | 25 +
>   meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb      | 8 +-
>   .../{python3-protobuf_4.25.3.bb =3D> python3-protobuf_4.25.8.bb} |   2 =
+-
>   meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb     | 2 +-
>   .../phpmyadmin/{phpmyadmin_5.2.1.bb =3D> phpmyadmin_5.2.2.bb} |   4 +-
>   .../xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb                  | 2 +-
>   .../recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.5.bb | 2 +-
>   .../calculator/xfce4-calculator-plugin_0.7.2.bb                 | 2 +-
>   .../recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.2.bb | 2 +-
>   .../recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.8.bb | 2 +-
>   .../cpugraph/xfce4-cpugraph-plugin_1.2.8.bb                     | 2 +-
>   .../datetime/xfce4-datetime-plugin_0.8.3.bb                     | 2 +-
>   .../diskperf/xfce4-diskperf-plugin_2.7.0.bb                     | 2 +-
>   meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.6.0.bb | 2 +-
>   .../recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.3.bb | 2 +-
>   .../recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.2.0.bb   | 2 +-
>   .../mailwatch/xfce4-mailwatch-plugin_1.3.1.bb                   | 2 +-
>   .../recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.5.bb     | 2 +-
>   .../recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.1.bb | 2 +-
>   .../recipes-panel-plugins/notes/xfce4-notes-plugin_1.10.0.bb    | 2 +-
>   .../recipes-panel-plugins/places/xfce4-places-plugin_1.8.3.bb   | 2 +-
>   .../recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.4.bb | 2 +-
>   .../smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb           | 2 +-
>   .../systemload/xfce4-systemload-plugin_1.3.2.bb                 | 2 +-
>   .../time-out/xfce4-time-out-plugin_1.1.3.bb                     | 2 +-
>   .../recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.2.bb     | 2 +-
>   .../recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.3.bb     | 2 +-
>   .../recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.3.bb | 2 +-
>   .../weather/xfce4-weather-plugin_0.11.1.bb                      | 2 +-
>   meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb   | 2 +-
>   .../archive/thunar-archive-plugin_0.5.2.bb                      | 2 +-
>   .../xfce4-power-manager/xfce4-power-manager_4.18.1.bb           | 2 +-
>   51 files changed, 697 insertions(+), 835 deletions(-)
>   create mode 100644
> meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2024-22654-0001.p=
atch
>   create mode 100644
> meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2024-22654-0002.p=
atch
>   rename meta-networking/recipes-support/wireshark/{wireshark_4.2.9.bb
> =3D> wireshark_4.2.12.bb} (92%)
>   create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch
>   create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2024-53427.patch
>   create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch
>   delete mode 100644
> meta-oe/recipes-devtools/protobuf/protobuf/0001-Add-recursion-check-when-=
parsing-unknown-fields-in-J.patch
>   rename meta-oe/recipes-devtools/protobuf/{protobuf_4.25.3.bb =3D>
> protobuf_4.25.8.bb} (97%)
>   create mode 100644
> meta-oe/recipes-extended/libblockdev/files/CVE-2025-6019.patch
>   create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2025-5318.patch
>   create mode 100644
> meta-oe/recipes-support/udisks/udisks2/CVE-2025-6019.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-h5py/0001-Properly-cast-argum=
ents-to-H5Lunpack_elink_val.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-h5py/0002-Use-libc.stdint-ins=
tead-of-numpy.patch
>   rename meta-python/recipes-devtools/python/{python3-protobuf_4.25.3.bb
> =3D> python3-protobuf_4.25.8.bb} (93%)
>   rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_5.2.1.bb =3D>
> phpmyadmin_5.2.2.bb} (91%)

