Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BA8C7115C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 13:48:20 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.15834.1750859294831759529
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jun 2025 06:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nNLFl5QR;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-71173646662so66152247b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 06:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750859294; x=1751464094; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asMhCHugrroYIgeW2VLNVSgLAradu2pmmXE2pMDS1Dc=;
        b=nNLFl5QRb/38RZXDtwFfRG986LFIILb4SaMWopYmvqUrxzul9LaSlBCgt4qFqhyV8F
         o1HABha4O0ErQWnRsLdBK3a+FK8wpnRoQrmueYIr0b4nhZbiLm4FkwusqOjeFTGvM2x9
         WXrpU9AuTl+Vh5VQST/FlV4oUb++f1m9bnCEHZy8vqLyvIM3Wxuh9EfACtAtiTg7skLe
         cm7tzorAv6Mgmrs/yddt0Nt/fszrbWrKjsANrY98HtMs0MeXOVAt2ICt2oSuCm3i6OaR
         hijnIbfc3jwgsuPK68R82KKawuDMcYBqf7EOCktbEoYwyaHM4gm/LMzRygDYBZSypCJU
         Uftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750859294; x=1751464094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asMhCHugrroYIgeW2VLNVSgLAradu2pmmXE2pMDS1Dc=;
        b=RVN+nUKPYZRJkFmQ+3WAFjfFRilEhWSorCa1CCCC3/ZO+Rmuo0GsC+/HA6G17EP+SR
         8rBmcBb7L9RKnzVaRNXlhHliz5bQYpeoslwFzT4F7i1lGkdk4+MqT2NEJsc1LiVsZwH5
         O9mp3AktzL2HYem7ceVVmxTBahXp/JeyJXX5ITRiOhOs+3tqF8X3wk92RjKW3fy8gGAt
         jd+n+AxlaLMSs1H+87njjYLEJUKzcPC5YRC5WUu3HT4DjF9/iQITpKrxMxXxtoiq1v8p
         Npu2l2XWeETLw8HHnOeqdBask5x+gWxPiUqyKO3FDuUS1vWYRND0nM1wUiooyvNF5euF
         L+1w==
X-Gm-Message-State: AOJu0YzBBmxcFPEgutKKMBDaqQoT+4f53dKpg3/2AwubYp6NRUiIpWg+
	5d3d9OqYed3rlRtb+tWYXS62rFSOJab4pB6j+AL9UpgZniZP/0pemPGoTTUj+Fw2l0y1R9eHV9J
	/6c0RLNYLIDzwbbFDBd9+bFSUIMcnrj8=
X-Gm-Gg: ASbGncvG0oJCXe8clXe5AlaMu9hntbbVRHjA6t6VHAIvH9Qg+P9fWOhjf6ey5Mz+YC5
	qxysMTvB+Evx1Kk7ZI4MGfIzB8b5IinGzw4D0szLA9dGp9F23w6ntptILxyy+IgWyzKuZVWW9X2
	tHLGl7yEHpKRqBMVtxGdnLPZOi+GtB59Ve0VnsX8Y602o=
X-Google-Smtp-Source: AGHT+IFijzN9E6xoZ6w7YecRQRFxrfEHhVWaFKJNC9DH/OCCgoQ76+xhaV/0Awy6co+FZBWAR37Ol9zEfT67LSNvewM=
X-Received: by 2002:a05:690c:62c6:b0:70a:2675:70b3 with SMTP id
 00721157ae682-71406da4491mr42240427b3.17.1750859293694; Wed, 25 Jun 2025
 06:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <375af1c3-1708-43d5-ac50-4a85205afdc2@gmail.com>
In-Reply-To: <375af1c3-1708-43d5-ac50-4a85205afdc2@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Jun 2025 07:47:47 -0600
X-Gm-Features: AX0GCFsPbYSHQ7ADsNSBovZxVARUg8qxK4f5kxOOz49Z3RgWPzjyAQ_R4a0THS8
Message-ID: <CAMKF1sryEBEAvGg-nKdCctPzt0A2O5pX29-rZBtKMN4p9OtChg@mail.gmail.com>
Subject: Re: walnascar merge request: June 23rd
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 13:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118107

merged now thanks.

On Mon, Jun 23, 2025 at 7:15=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 2169c9afcc0945045bea49f58011080942d4dd=
b4:
>
>    pipewire: Avoid having pipewire-native depend on pipewire (2025-05-17
> 11:56:50 -0600)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded walnascar-next
>
> for you to fetch changes up to 3c6844219a69d9ca8cb0f1579114efe9a9e2a646:
>
>    postgresql: upgrade 17.4 -> 17.5 (2025-06-20 10:46:50 -0400)
>
> ----------------------------------------------------------------
> Chen Qi (1):
>        check-version-mismatch.bbclass: make it work for walnascar
>
> Chris Paterson (3):
>        smarty: Drop allarch
>        spectre-meltdown-checker: Set recipe as machine specific
>        kernel-hardening-checker: Set recipe as machine specific
>
> Clayton Casciato (1):
>        chrony: use inherit_defer for conditional inherit of useradd
>
> J. S. (1):
>        xfce4 update HOMEPAGEs
>
> Jason Schonberg (2):
>        c-ares: upgrade 1.34.3 -> 1.34.4
>        c-ares: update 1.34.4 -> 1.34.5
>
> Martin Jansa (1):
>        python3-posix-ipc: improve build_support
>
> Vijay Anusuri (3):
>        redis: upgrade 7.2.7 -> 7.2.8
>        redis: upgrade 6.2.16 -> 6.2.18
>        jq: upgrade 1.7.1 -> 1.8.0
>
> Wang Mingyu (2):
>        valkey: upgrade 8.1.0 -> 8.1.1
>        postgresql: upgrade 17.4 -> 17.5
>
>   meta-networking/recipes-support/chrony/chrony_4.6.1.bb          | 2 +-
>   meta-oe/classes/check-version-mismatch.bbclass                  | 33
> ++++++++++++++-
>   .../0003-configure.ac-bypass-autoconf-2.69-version-check.patch  | 9 ++-=
--
>   .../files/0004-config_info.c-not-expose-build-info.patch        | 13
> +++---
>   meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch    | 9 ++-=
--
>   .../postgresql/{postgresql_17.4.bb =3D> postgresql_17.5.bb} |  2 +-
>   meta-oe/recipes-devtools/jq/{jq_1.7.1.bb =3D> jq_1.8.0.bb} |  7 +---
>   .../0001-hiredis-use-default-CC-if-it-is-set.patch              | 0
>   ...2-lua-update-Makefile-to-use-environment-build-setting.patch | 0
>   .../0003-hack-to-force-use-of-libc-malloc.patch                 | 0
>   .../0004-src-Do-not-reset-FINAL_LIBS.patch                      | 0
>   ...05-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch | 0
>   .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
>   .../redis/{redis-7.2.7 =3D> redis-7.2.8}/init-redis-server |  0
>   .../redis/{redis-7.2.7 =3D> redis-7.2.8}/redis.conf |  0
>   .../redis/{redis-7.2.7 =3D> redis-7.2.8}/redis.service |  0
>   .../recipes-extended/redis/{redis_6.2.16.bb =3D> redis_6.2.18.bb} |  2 =
+-
>   .../recipes-extended/redis/{redis_7.2.7.bb =3D> redis_7.2.8.bb} |  2 +-
>   .../valkey/{valkey_8.1.0.bb =3D> valkey_8.1.1.bb} |  2 +-
>   .../kernel-hardening-checker/kernel-hardening-checker_0.6.10.bb | 2 +
>   .../spectre-meltdown-checker/spectre-meltdown-checker_0.46.bb   | 2 +-
>   .../c-ares/{c-ares_1.34.3.bb =3D> c-ares_1.34.5.bb} |  2 +-
>   meta-oe/recipes-support/smarty/smarty_5.4.3.bb                  | 4 +-
>   ...1-build_support-use-source-filename-instead-of-foo-for.patch | 50
> +++++++++++++++++++++++
>   ...2-build_support-handle-empty-max_priority-value-as-Non.patch | 49
> +++++++++++++++++++++++
>   ...3-build_support-use-does_build_succeed-in-compile_and_.patch | 62
> +++++++++++++++++++++++++++++
>   meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb  | 5 +++
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
>   .../recipes-panel-plugins/notes/xfce4-notes-plugin_1.11.0.bb    | 2 +-
>   .../recipes-panel-plugins/places/xfce4-places-plugin_1.8.3.bb   | 2 +-
>   .../recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.5.bb | 2 +-
>   .../smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb           | 2 +-
>   .../systemload/xfce4-systemload-plugin_1.3.2.bb                 | 2 +-
>   .../time-out/xfce4-time-out-plugin_1.1.3.bb                     | 2 +-
>   .../recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.2.bb     | 2 +-
>   .../recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.3.bb     | 2 +-
>   .../recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.3.bb | 2 +-
>   .../weather/xfce4-weather-plugin_0.11.1.bb                      | 2 +-
>   meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb   | 2 +-
>   .../archive/thunar-archive-plugin_0.5.2.bb                      | 2 +-
>   .../xfce4-power-manager/xfce4-power-manager_4.20.0.bb           | 2 +-
>   54 files changed, 248 insertions(+), 63 deletions(-)
>   rename meta-oe/recipes-dbs/postgresql/{postgresql_17.4.bb =3D>
> postgresql_17.5.bb} (87%)
>   rename meta-oe/recipes-devtools/jq/{jq_1.7.1.bb =3D> jq_1.8.0.bb} (87%)
>   rename meta-oe/recipes-extended/redis/{redis-7.2.7 =3D>
> redis-7.2.8}/0001-hiredis-use-default-CC-if-it-is-set.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.2.7 =3D>
> redis-7.2.8}/0002-lua-update-Makefile-to-use-environment-build-setting.pa=
tch
> (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.2.7 =3D>
> redis-7.2.8}/0003-hack-to-force-use-of-libc-malloc.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.2.7 =3D>
> redis-7.2.8}/0004-src-Do-not-reset-FINAL_LIBS.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.2.7 =3D>
> redis-7.2.8}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.pat=
ch
> (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.2.7 =3D>
> redis-7.2.8}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.2.7 =3D>
> redis-7.2.8}/init-redis-server (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.2.7 =3D>
> redis-7.2.8}/redis.conf (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.2.7 =3D>
> redis-7.2.8}/redis.service (100%)
>   rename meta-oe/recipes-extended/redis/{redis_6.2.16.bb =3D>
> redis_6.2.18.bb} (96%)
>   rename meta-oe/recipes-extended/redis/{redis_7.2.7.bb =3D>
> redis_7.2.8.bb} (96%)
>   rename meta-oe/recipes-extended/valkey/{valkey_8.1.0.bb =3D>
> valkey_8.1.1.bb} (98%)
>   rename meta-oe/recipes-support/c-ares/{c-ares_1.34.3.bb =3D>
> c-ares_1.34.5.bb} (91%)
>   create mode 100644
> meta-python/recipes-devtools/python/python3-posix-ipc/0001-build_support-=
use-source-filename-instead-of-foo-for.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-posix-ipc/0002-build_support-=
handle-empty-max_priority-value-as-Non.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-posix-ipc/0003-build_support-=
use-does_build_succeed-in-compile_and_.patch
>

