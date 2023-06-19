Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60332EB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 17:33:55 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.13653.1687196027781349160
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 10:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=AHW+TMKe;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5608bb16496so16663eaf.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 10:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687196027; x=1689788027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRtp4J7ajWZUC72SdlLCCF7DwmbsxsVQOJuBLkyL/Aw=;
        b=AHW+TMKe9+NbZYAfQUJeBdZ06P2uPa73lflR9mJVWQ1J64cz9BHyhqfGqBeG3wmwwN
         IbCnrAA/9i1naYNKdYTF5IZt1CLk3hUxOk4Oq9wITkkA6W4pA4c4Z6PYkgnJ8qJFsGPk
         smkFfkqXENV0OlTk+kVB0dxjmDqYWt7a5M1akwsYGBQpGw5Nds8kwASZj6wkX2EJUJga
         SOyfNSjj+Y1PAp0T0HM3Rjp+WWVpXUKPqu1aBEq7l5UX8SNpzuNib0ix9Ut/OpJ4E76z
         YRyj+HXyKJnC7s2soF2HFwkAv3G7VDBhaBf3hpfUZ7ShRLMQpQZdKfRWpBRunLFiKUQw
         6Zng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687196027; x=1689788027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tRtp4J7ajWZUC72SdlLCCF7DwmbsxsVQOJuBLkyL/Aw=;
        b=XZSXZpx4KoUVOuV9gSVCdDBMOb0XLh47Vz51Fd4x8VFUVl4uvFhjIe0QQbDIX6LPYU
         mvCdbh77/318RWTXMvMEbOzsmjvvoJit80pKrZEDoDkZ8oQZB2dl1YlJQJHFnlPIMX/1
         7KM8CF9dt6F1H/GCvnidjbigqq05rtQgWYI27isc1n3ABFq/K/E9UmgHj56D54uUbo0l
         AsQ9uJZ7IEyOQ3iwj1P37pdnL5+lEat4qh5njyF2ZXr9TTiu38N4Nf7Oo9EpW28hi/B2
         bYfu4/xwP86dj2ooPg0xL15dtVOtvsI2HKYrxpt9mO+u3EsztOjXJvqD/uIAJsy2n8Co
         jzQg==
X-Gm-Message-State: AC+VfDyl976gP7VJZeClgQc7p13qE6YIb+TPAOQy1lz0BY7FfYEesOK7
	CDoLqJahaERsvrfUtOBVHo4ZuCJbPk+GPWVj6WU=
X-Google-Smtp-Source: ACHHUZ46Urm1A2JMQqBIQc57Ia987LE7N/juVYcY4sh4eFbCRHMelbiihbHB7cOTX6xHb6Sa+/3wYvo3SWrt1zLJHuI=
X-Received: by 2002:a4a:e6cd:0:b0:55d:beb5:c789 with SMTP id
 v13-20020a4ae6cd000000b0055dbeb5c789mr4403595oot.0.1687196026954; Mon, 19 Jun
 2023 10:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <8f1fd184-4efb-e493-f561-f472a4f955ac@gmail.com>
In-Reply-To: <8f1fd184-4efb-e493-f561-f472a4f955ac@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Jun 2023 10:33:20 -0700
Message-ID: <CAMKF1spAzNLYQ1PNX0fBAnMhp4qioNP7xWqTdEpmEBnks8ZZbA@mail.gmail.com>
Subject: Re: mickledore merge request: June 19th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 17:33:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103439

Merged, Thanks Armin

On Mon, Jun 19, 2023 at 4:10=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 928658212611ea457a5eacec48f0760e03269a=
24:
>
>    gnulib: Update recipe name to 2018-12-18 (2023-05-31 10:50:50 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded mickledore-next
>
> for you to fetch changes up to 5a01ab461c9bcabcbb2298236602373948f8f073:
>
>    wireshark: CVE-2023-2952 XRA dissector infinite loop (2023-06-17
> 13:15:57 -0400)
>
> ----------------------------------------------------------------
> Chen Qi (1):
>        redis: use the files path correctly
>
> Hitendra Prajapati (3):
>        wireshark: Fix CVE-2023-2855 & CVE-2023-2856
>        wireshark: Fix CVE-2023-2858 & CVE-2023-2879
>        wireshark: CVE-2023-2952 XRA dissector infinite loop
>
> Joe Slater (1):
>        libgpiod: modify test 'gpioset: toggle (continuous)'
>
> Khem Raj (2):
>        fftw: Check for TOOLCHAIN_OPTIONS to be non-empty before sed ops
>        system-config-printer: Delete __pycache__ files
>
> Ross Burton (5):
>        glade: add autoconf-archive-native DEPENDS
>        libgxim: add autoconf-archive-native DEPENDS
>        libblockdev: clean up DEPENDS
>        imsettings: add missing DEPENDS on autoconf-archive-native
>        system-config-printer: clean up DEPENDS
>
> Urade, Yogita t.mo (1):
>        c-ares: fix CVE-2023-32067
>
> Xiangyu Chen (2):
>        libbpf: installing uapi headers for native package
>        meta-oe: add pahole to NON_MULTILIB_RECIPES
>
>   .../system-config-printer/system-config-printer_1.5.18.bb       | 13 ++=
+-
>   .../recipes-support/wireshark/files/CVE-2023-2855.patch         | 108
> ++++++++++++++++++++++++++++
>   .../recipes-support/wireshark/files/CVE-2023-2856.patch         | 69
> ++++++++++++++++++
>   .../recipes-support/wireshark/files/CVE-2023-2858.patch         | 95
> ++++++++++++++++++++++++
>   .../recipes-support/wireshark/files/CVE-2023-2879.patch         | 37
> ++++++++++
>   .../recipes-support/wireshark/files/CVE-2023-2952.patch         | 98
> +++++++++++++++++++++++++
>   meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb   | 5 ++
>   meta-oe/conf/layer.conf                                         | 2 +-
>   meta-oe/recipes-devtools/glade/glade_3.22.2.bb                  | 1 +
>   meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb        | 6 +-
>   meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb               | 2 +-
>   .../0001-src-Do-not-reset-FINAL_LIBS.patch                      | 0
>   .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
>   .../redis/{redis-7 =3D> redis-7.0.11}/GNU_SOURCE-7.patch |   0
>   .../hiredis-use-default-CC-if-it-is-set.patch                   | 0
>   .../redis/{redis-7 =3D> redis-7.0.11}/init-redis-server |   0
>   .../lua-update-Makefile-to-use-environment-build-setting.patch  | 0
>   .../redis/{redis-7 =3D> redis-7.0.11}/oe-use-libc-malloc.patch |   0
>   .../recipes-extended/redis/{redis-7 =3D> redis-7.0.11}/redis.conf |   0
>   .../redis/{redis-7 =3D> redis-7.0.11}/redis.service |   0
>   meta-oe/recipes-extended/redis/redis_7.0.11.bb                  | 2 -
>   meta-oe/recipes-kernel/libbpf/libbpf_1.1.0.bb                   | 5 ++
>   meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch      | 87
> ++++++++++++++++++++++
>   meta-oe/recipes-support/c-ares/c-ares_1.19.0.bb                 | 4 +-
>   meta-oe/recipes-support/fftw/fftw_3.3.10.bb                     | 2 +-
>   .../libgpiod/libgpiod-2.0/gpio-tools-test-bats-modify.patch     | 67
> +++++++++++++++++
>   meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb                | 2 +
>   meta-xfce/recipes-extended/imsettings/imsettings_1.8.3.bb       | 2 +-
>   28 files changed, 596 insertions(+), 11 deletions(-)
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-2855.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-2856.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-2858.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-2879.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-2952.patch
>   rename meta-oe/recipes-extended/redis/{redis-7 =3D>
> redis-7.0.11}/0001-src-Do-not-reset-FINAL_LIBS.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7 =3D>
> redis-7.0.11}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7 =3D>
> redis-7.0.11}/GNU_SOURCE-7.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7 =3D>
> redis-7.0.11}/hiredis-use-default-CC-if-it-is-set.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7 =3D>
> redis-7.0.11}/init-redis-server (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7 =3D>
> redis-7.0.11}/lua-update-Makefile-to-use-environment-build-setting.patch
> (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7 =3D>
> redis-7.0.11}/oe-use-libc-malloc.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7 =3D>
> redis-7.0.11}/redis.conf (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7 =3D>
> redis-7.0.11}/redis.service (100%)
>   create mode 100644
> meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch
>   create mode 100644
> meta-oe/recipes-support/libgpiod/libgpiod-2.0/gpio-tools-test-bats-modify=
.patch
>

