Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40787E77188
	for <webhook@archiver.kernel.org>; Tue, 31 Dec 2024 20:20:41 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web11.2332.1735676436480288688
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Dec 2024 12:20:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EDmF91Ap;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5f4d935084aso3395699eaf.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Dec 2024 12:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735676436; x=1736281236; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7yVyOBHsKu42zMIiDXxvUSuvCeQ0rF/Kw3WmFBLwSE=;
        b=EDmF91Ap6fEd5X3IBF/ndJBty3JUQE8Jxqjern+m6BtSb1imk4+qZISOVPmUbhlFqB
         sRLH2CB/FWVms/0PAFTrV7Q5FjIuDIzfmzqcoJjS/0RDcsMMe1L52ACUYkrT6EYRoUPc
         z6rii9sZDcSPLrO03cc2In+jFLg2BsCBHrnPHBLcMcW8qkA0NbgroTw9qKByLV6SJuJt
         dFIGwWIO8RnEB+8zkzNy+7WaNEjlRhOHcqRJ4LIdFYvFXyzrGDyQDpAqfX6SGwnGFucI
         bWHZ60zd/CBSUdtNxx2vF11fOj8PhMu2r44klp47ajntVRJF/tSmaYutQPcuGT7fZ/zu
         DT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735676436; x=1736281236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O7yVyOBHsKu42zMIiDXxvUSuvCeQ0rF/Kw3WmFBLwSE=;
        b=pkw67kqSOZ/gxHFudWU3Zf6UHNWMk+UO9Dv7ZMYSoI/iL3o9GuxVpP1KtnaT1Bdc1D
         GZegOEDRI3569YZI5WYIKIqx6s1uovA011C6HYYQu3degRFxa3ppotfhXUeNnuWsOhCj
         o5EuODoXsBP5A9hswNYlcYQjrObknfZZ/dUcq4DuXPDEdfV2aq6KeFLWQNS5895VP5Q/
         t/EbMTanVqqafCG7wZ5P4EH3VMH9WY48z+ssdBzWsvBsuhsWZtrIdzeN5xmO1fnvAaLd
         POjKZKOsU7Vo8RLdgGn0sk/ajpSxh1s7oGl2FoFNTU/FJ1d/DKmFQ1DZz+iYblE5QMjo
         Ya+g==
X-Gm-Message-State: AOJu0Yxz1xa+jkxXU8MzSNfvT4stheybA9AnSCv/yt+0ace4pbw2PMuN
	RWsdrJh0ZFuk08S2HcQ13klL1ghEh43QBIbt0XKqGJriRfZyMy/ltgvZE3KnBVLicH+2zLFnC1E
	4g+XOjTFMfsHGvVtbG3iMfrmFTLU=
X-Gm-Gg: ASbGncsJPFPTfR9EhmS25dt5JQvOTiZOWqiE0aO6vk7HhfySDtb8gkFAV/pJHCsjhB0
	iojrTMqun4sNfKWKV6iuFlnj58upaxr1F6bZn
X-Google-Smtp-Source: AGHT+IG3eySkb2aGHW0pr9WT7xTLjuLkzvu0NsPnWig079vG7xLq0S/mraQ5eXpUzruHXUFQYOYb8+k0faQQjNqsspo=
X-Received: by 2002:a05:6871:d113:b0:288:49a5:7562 with SMTP id
 586e51a60fabf-2a7fb5552fbmr21200373fac.41.1735676435613; Tue, 31 Dec 2024
 12:20:35 -0800 (PST)
MIME-Version: 1.0
References: <43576444-0a8a-4a50-baf9-5260bf0f2b33@gmail.com>
In-Reply-To: <43576444-0a8a-4a50-baf9-5260bf0f2b33@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 Dec 2024 12:20:09 -0800
Message-ID: <CAMKF1sq_NXuNZ8mi2DTJxyR8U4VfOS7ea6WYM1Kr-qt_6h+xmA@mail.gmail.com>
Subject: Re: scarthgap merge request: Dec 31st
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Dec 2024 20:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114607

merged thanks Armin

On Tue, Dec 31, 2024 at 4:15=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit b8d1a14f7f3b76457c36752202ea7ae5881b66=
54:
>
>    freeradius: upgrade 3.2.3 -> 3.2.5 (2024-11-24 17:38:31 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded scarthgap-next
>
> for you to fetch changes up to 3c293e14492f01e22a64004e2330fb620c27578a:
>
>    python3-tornado: Upgrade 6.4 -> 6.4.2 (2024-12-27 09:24:53 -0500)
>
> ----------------------------------------------------------------
> AmateurECE (1):
>        pipewire: Add glib-2.0-native dep for bluez5
>
> Chen Qi (1):
>        protobuf: fix CVE-2024-7254
>
> Fabrice Aeschbacher (1):
>        mosquitto: upgrade 2.0.18 -> 2.0.19
>
> Jiaying Song (1):
>        xmlsec1: Switch SRC_URI to use github release
>
> Khem Raj (2):
>        ndisc: Remove buildpaths from binaries
>        ndisc6: Fix reproducible build
>
> Leon Anavi (1):
>        sip: Upgrade 6.8.3 -> 6.8.6
>
> Libo Chen (1):
>        grpc: Fix CVE-2024-7246
>
> Soumya Sambu (2):
>        python3-werkzeug: upgrade 3.0.3 -> 3.0.6
>        python3-tornado: Upgrade 6.4 -> 6.4.2
>
> Wang Mingyu (2):
>        redis: upgrade 7.2.4 -> 7.2.5
>        mosquitto: upgrade 2.0.19 -> 2.0.20
>
> Yi Zhao (2):
>        hostapd: Security fix for CVE-2023-52160
>        redis: upgrade 7.2.5 -> 7.2.6
>
> Yogita Urade (2):
>        php: upgrade 8.2.20 -> 8.2.24
>        postgresql: upgrade 16.4 -> 16.5
>
> Zhang Peng (6):
>        frr: fix CVE-2024-34088
>        frr: fix CVE-2024-31950
>        frr: fix CVE-2024-31951
>        frr: fix CVE-2024-31948
>        frr: fix CVE-2024-31949
>        libgsf: upgrade 1.14.52 -> 1.14.53
>
> hongxu (1):
>        p7zip: fix CVE-2023-52169 and CVE-2023-52168
>
>   .../libgsf/{libgsf_1.14.52.bb =3D> libgsf_1.14.53.bb} |   4 +-
>   meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.5.bb   | 2 +-
>   meta-networking/recipes-connectivity/mosquitto/files/1571.patch | 22 -
>   meta-networking/recipes-connectivity/mosquitto/files/2894.patch | 25 -
>   .../mosquitto/{mosquitto_2.0.18.bb =3D> mosquitto_2.0.20.bb} |   4 +-
>   meta-networking/recipes-protocols/frr/frr/CVE-2024-31948.patch  | 130
> +++++
>   meta-networking/recipes-protocols/frr/frr/CVE-2024-31949.patch  | 163
> ++++++
>   meta-networking/recipes-protocols/frr/frr/CVE-2024-31950.patch  | 68 ++=
+
>   meta-networking/recipes-protocols/frr/frr/CVE-2024-31951.patch  | 110 +=
+++
>   meta-networking/recipes-protocols/frr/frr/CVE-2024-34088.patch  | 83 ++=
+
>   meta-networking/recipes-protocols/frr/frr_9.1.bb                | 5 +
>   ...1-Remove-use-of-variables-indicating-buildtime-informa.patch | 85 ++=
+
>   meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb          | 5 +
>   .../recipes-connectivity/hostapd/hostapd/CVE-2023-52160.patch   | 198
> +++++++
>   meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb            | 1 +
>   .../0003-configure.ac-bypass-autoconf-2.69-version-check.patch  | 6 +-
>   .../postgresql/{postgresql_16.4.bb =3D> postgresql_16.5.bb} |   2 +-
>   meta-oe/recipes-devtools/grpc/grpc/CVE-2024-7246.patch          | 420
> +++++++++++++++
>   meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb                    | 1 +
>   .../php/php/0001-ext-opcache-config.m4-enable-opcache.patch     | 15 +-
>   meta-oe/recipes-devtools/php/{php_8.2.20.bb =3D> php_8.2.24.bb} |   2 +=
-
>   ...1-Add-recursion-check-when-parsing-unknown-fields-in-J.patch | 794
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-devtools/protobuf/protobuf_4.25.3.bb            | 1 +
>   meta-oe/recipes-devtools/sip/{sip_6.8.3.bb =3D> sip_6.8.6.bb} |   8 +-
>   .../files/0001-Fix-two-buffer-overflow-vulnerabilities.patch    | 455
> ++++++++++++++++
>   meta-oe/recipes-extended/p7zip/p7zip_16.02.bb                   | 1 +
>   .../0001-hiredis-use-default-CC-if-it-is-set.patch}             | 7 +-
>   ...-lua-update-Makefile-to-use-environment-build-setting.patch} | 6 +-
>   .../0003-hack-to-force-use-of-libc-malloc.patch}                | 7 +-
>   .../0004-src-Do-not-reset-FINAL_LIBS.patch}                     | 4 +-
>   ...5-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch} | 6 +-
>   .../0006-Define-correct-gregs-for-RISCV32.patch                 | 4 +-
>   .../redis/{redis-7.2.4 =3D> redis-7.2.6}/init-redis-server |   0
>   .../redis/{redis-7.2.4 =3D> redis-7.2.6}/redis.conf |   0
>   .../redis/{redis-7.2.4 =3D> redis-7.2.6}/redis.service |   0
>   .../recipes-extended/redis/{redis_7.2.4.bb =3D> redis_7.2.6.bb} |  17 +=
-
>   meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb                | 2 +-
>   .../python/{python3-tornado_6.4.bb =3D> python3-tornado_6.4.2.bb} |   4=
 +-
>   .../{python3-werkzeug_3.0.3.bb =3D> python3-werkzeug_3.0.6.bb} |   2 +-
>   39 files changed, 2572 insertions(+), 97 deletions(-)
>   rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.52.bb =3D>
> libgsf_1.14.53.bb} (72%)
>   delete mode 100644
> meta-networking/recipes-connectivity/mosquitto/files/1571.patch
>   delete mode 100644
> meta-networking/recipes-connectivity/mosquitto/files/2894.patch
>   rename
> meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.18.bb =3D>
> mosquitto_2.0.20.bb} (95%)
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2024-31948.patch
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2024-31949.patch
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2024-31950.patch
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2024-31951.patch
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2024-34088.patch
>   create mode 100644
> meta-networking/recipes-support/ndisc6/ndisc6/0001-Remove-use-of-variable=
s-indicating-buildtime-informa.patch
>   create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2023-52160.patch
>   rename meta-oe/recipes-dbs/postgresql/{postgresql_16.4.bb =3D>
> postgresql_16.5.bb} (86%)
>   create mode 100644 meta-oe/recipes-devtools/grpc/grpc/CVE-2024-7246.pat=
ch
>   rename meta-oe/recipes-devtools/php/{php_8.2.20.bb =3D> php_8.2.24.bb} =
(99%)
>   create mode 100644
> meta-oe/recipes-devtools/protobuf/protobuf/0001-Add-recursion-check-when-=
parsing-unknown-fields-in-J.patch
>   rename meta-oe/recipes-devtools/sip/{sip_6.8.3.bb =3D> sip_6.8.6.bb} (6=
4%)
>   create mode 100644
> meta-oe/recipes-extended/p7zip/files/0001-Fix-two-buffer-overflow-vulnera=
bilities.patch
>   rename
> meta-oe/recipes-extended/redis/{redis-7.2.4/hiredis-use-default-CC-if-it-=
is-set.patch
> =3D> redis-7.2.6/0001-hiredis-use-default-CC-if-it-is-set.patch} (95%)
>   rename
> meta-oe/recipes-extended/redis/{redis-7.2.4/lua-update-Makefile-to-use-en=
vironment-build-setting.patch
> =3D>
> redis-7.2.6/0002-lua-update-Makefile-to-use-environment-build-setting.pat=
ch}
> (97%)
>   rename
> meta-oe/recipes-extended/redis/{redis-7.2.4/oe-use-libc-malloc.patch =3D>
> redis-7.2.6/0003-hack-to-force-use-of-libc-malloc.patch} (94%)
>   rename
> meta-oe/recipes-extended/redis/{redis-7.2.4/0001-src-Do-not-reset-FINAL_L=
IBS.patch
> =3D> redis-7.2.6/0004-src-Do-not-reset-FINAL_LIBS.patch} (92%)
>   rename meta-oe/recipes-extended/redis/{redis-7.2.4/GNU_SOURCE-7.patch
> =3D>
> redis-7.2.6/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patc=
h}
> (88%)
>   rename meta-oe/recipes-extended/redis/{redis-7.2.4 =3D>
> redis-7.2.6}/0006-Define-correct-gregs-for-RISCV32.patch (97%)
>   rename meta-oe/recipes-extended/redis/{redis-7.2.4 =3D>
> redis-7.2.6}/init-redis-server (100%)
>   mode change 100755 =3D> 100644
>   rename meta-oe/recipes-extended/redis/{redis-7.2.4 =3D>
> redis-7.2.6}/redis.conf (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.2.4 =3D>
> redis-7.2.6}/redis.service (100%)
>   rename meta-oe/recipes-extended/redis/{redis_7.2.4.bb =3D>
> redis_7.2.6.bb} (81%)
>   rename meta-python/recipes-devtools/python/{python3-tornado_6.4.bb =3D>
> python3-tornado_6.4.2.bb} (90%)
>   rename meta-python/recipes-devtools/python/{python3-werkzeug_3.0.3.bb
> =3D> python3-werkzeug_3.0.6.bb} (90%)
>

