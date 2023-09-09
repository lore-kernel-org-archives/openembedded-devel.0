Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB212EEB58C
	for <webhook@archiver.kernel.org>; Sat,  9 Sep 2023 15:44:29 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.19003.1694274264220192076
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Sep 2023 08:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GTlJi/Ug;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1bbb4bde76dso1964784fac.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Sep 2023 08:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694274263; x=1694879063; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9KY2st2/srbBVjDV6Pq2mWd2WmPlmuzs0+mUnIPS9I=;
        b=GTlJi/UgG2NFE4lSLEzQEbu9ZOXyu7NvjRf/Tt5sKuwos/3HijCgjGYgQUAe6ISyD/
         xdHP7j77wx/u4aZQ9Rh0OTE64mcIUG24oeecO+RpVyP29f8qBv5upe94ExAgV20xTfXu
         bdDopk5WUrjYub+b1gJa0z8WZiDDUKO0A5pftqPzHsjHxQXtUwmpkXElDcGttTTTJQXy
         uORABQFUfkrQVqtvtc+7/w6sW3o4PObKPi5izx4Eid86oqi8R/UsgZP9c/oeyS1xOFN2
         tYZrdQG7bqTXDAyZ4qCCk6S4nOypOLPjkpk2ssAcbJZb0Cif0ahBwFVYm4s59okz4GyS
         jXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694274263; x=1694879063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9KY2st2/srbBVjDV6Pq2mWd2WmPlmuzs0+mUnIPS9I=;
        b=nH01SC8HY8sr0J+ORAscPMBxlDcsN9n75DyDki9BvCqVRo7TbPP1/ZjHPgMDDlwMFu
         MkuYJ6Nfddda+L8IWJorN6UZfGuNp2moY0XGuBMc4ZSXBwRff5CmvSB8V+RGBtjKebtb
         IT3+eeL0VPYdz/koPvj6ekR5s0aRl1dFtcQlWzA4IXggcwkxlEDRv4X2B0SlNiiPiOzO
         tSJwME+gHvw+fNqe6Kb3ve37DI3+VuJ28RSaOZrwN6tb3LUbr+syyVLDEWuk44eEvEoW
         EQb/eDUHblQaBfkOMiTnTJY3kEbD9l+bOpWKNMLCaT2CvCfzlIq7CFL2UePFZrUE+1fK
         v3XA==
X-Gm-Message-State: AOJu0Yx9lisVabWngvrMlWBqtoJH4cVkgOGTnqIKTsRTOX8lTrfRV2EV
	ZTf+LFFzQfFUV98vdfvZgSy1doeYDSKZYXlJ0Xk=
X-Google-Smtp-Source: AGHT+IGL2h0Hjb0d9vuNLHeWKIaOYR4bN/4mhFXH37Vk3K60/iRtn0F7nb6TtfmwihYD0KUQ0ijXvxtSwsKkJTyTglQ=
X-Received: by 2002:a05:6871:294:b0:1b3:eec8:fa90 with SMTP id
 i20-20020a056871029400b001b3eec8fa90mr7077973oae.6.1694274263296; Sat, 09 Sep
 2023 08:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <6bb02cf5-a195-b046-3edc-580d4887db67@gmail.com>
In-Reply-To: <6bb02cf5-a195-b046-3edc-580d4887db67@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 9 Sep 2023 08:43:57 -0700
Message-ID: <CAMKF1soTEJAKCKWW_qsU2OdC9KJuyO8sx7wgaQBL7--GhUEPqg@mail.gmail.com>
Subject: Re: kirkstone merge request: Sept 9th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 Sep 2023 15:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104815

Merged thanks Armin.

On Sat, Sep 9, 2023 at 4:27=E2=80=AFAM akuster808 <akuster808@gmail.com> wr=
ote:
>
> The following changes since commit 529620141e773080a6a7be4615fb7993204af8=
83:
>
>    nodejs: upgrade 16.20.1 -> 16.20.2 (2023-08-11 10:32:04 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to a88cb922f91fda95e8a584cee3092083d5ad3e98:
>
>    hwloc: fix CVE-2022-47022 (2023-09-06 09:13:26 -0400)
>
> ----------------------------------------------------------------
> Chen Qi (1):
>        spice-protocol: fix populate_sdk error when spice is installed
>
> Marine Vovard (1):
>        python3-kivy: Require X11 or Wayland in DISTRO_FEATURES
>
> Martin Jansa (1):
>        libiio: use main branch instead of master
>
> Narpat Mali (4):
>        libqb: upgrade 2.0.6 -> 2.0.8
>        python3-django: fix CVE-2023-36053
>        python3-aiohttp: upgrade 3.8.1 -> 3.8.5
>        frr: Fix CVE-2023-38802 and CVE-2023-41358
>
> Polampalli, Archana (2):
>        php: upgrade 8.1.16 -> 8.1.22
>        nodejs: fix CVE-2022-25883
>
> Robert Joslyn (1):
>        postgresql: Update to 14.9
>
> Soumya Sambu (3):
>        krb5: Fix CVE-2023-36054
>        iperf3: upgrade 3.11 -> 3.14
>        hwloc: fix CVE-2022-47022
>
> Sourav Kumar Pramanik (1):
>        meta-oe-components: Avoid usage of nobranch=3D1
>
> Sourav Pramanik (2):
>        rapidjson: Avoid usage of nobranch=3D1
>        nlohmann-json: Avoid usage of nobranch=3D1
>
> Wang Mingyu (3):
>        tcpdump: upgrade 4.99.1 -> 4.99.2
>        tcpdump: upgrade 4.99.2 -> 4.99.3
>        tcpdump: upgrade 4.99.3 -> 4.99.4
>
> Yogita Urade (1):
>        poppler: fix CVE-2023-34872
>
>   meta-gnome/recipes-connectivity/geary/geary_40.0.bb             | 2 +-
>   meta-networking/recipes-connectivity/libdnet/libdnet_1.14.bb    | 2 +-
>   meta-networking/recipes-protocols/frr/frr/CVE-2023-38802.patch  | 136
> ++++++++++++++
>   meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch  | 105
> +++++++++++
>   meta-networking/recipes-protocols/frr/frr_8.2.2.bb              | 2 +
>   meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb  | 2 +
>   .../tcpdump/{tcpdump_4.99.1.bb =3D> tcpdump_4.99.4.bb} |   3 +-
>   .../dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb   | 2 +-
>   .../recipes-benchmark/iperf3/{iperf3_3.11.bb =3D> iperf3_3.14.bb} |   4=
 +-
>   meta-oe/recipes-connectivity/krb5/krb5/CVE-2023-36054.patch     | 68
> +++++++
>   meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb                | 1 +
>   .../postgresql/files/0001-Add-support-for-RISC-V.patch          | 10 +-
>   .../postgresql/files/0001-Improve-reproducibility.patch         | 6 +-
>   ...1-Properly-NULL-terminate-GSS-receive-buffer-on-error-.patch | 50
> ------
>   .../files/0001-config_info.c-not-expose-build-info.patch        | 18 +-
>   .../0001-configure.ac-bypass-autoconf-2.69-version-check.patch  | 6 +-
>   .../files/0001-postgresql-fix-ptest-failure-of-sysviews.patch   | 11 +-
>   meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch        | 235
> -------------------------
>   meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch        | 118
> -------------
>   meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch    | 10 +-
>   meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch     | 38 --=
--
>   .../postgresql/{postgresql_14.5.bb =3D> postgresql_14.9.bb} |   8 +-
>   meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb  | 2 +-
>   meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-25883.patch     | 262
> +++++++++++++++++++++++++++
>   meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb               | 1 +
>   meta-oe/recipes-devtools/php/{php_8.1.16.bb =3D> php_8.1.22.bb} |   2 +=
-
>   meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb             | 2 +-
>   meta-oe/recipes-extended/hwloc/files/CVE-2022-47022.patch       | 77
> ++++++++
>   meta-oe/recipes-extended/hwloc/hwloc_1.11.13.bb                 | 4 +-
>   .../recipes-extended/libqb/{libqb_2.0.6.bb =3D> libqb_2.0.8.bb} |   2 +=
-
>   meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb              | 2 +-
>   meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb               | 2 +-
>   meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb                     | 2 +-
>   meta-oe/recipes-support/glog/glog_0.5.0.bb                      | 2 +-
>   meta-oe/recipes-support/libiio/libiio_git.bb                    | 2 +-
>   meta-oe/recipes-support/libmxml/libmxml_3.3.bb                  | 2 +-
>   meta-oe/recipes-support/poppler/poppler/CVE-2023-34872.patch    | 46 ++=
+++
>   meta-oe/recipes-support/poppler/poppler_22.04.0.bb              | 1 +
>   .../{python3-aiohttp_3.8.1.bb =3D> python3-aiohttp_3.8.5.bb} |   4 +-
>   .../recipes-devtools/python/python3-django/CVE-2023-36053.patch | 263
> ++++++++++++++++++++++++++++
>   meta-python/recipes-devtools/python/python3-django_2.2.28.bb    | 4 +-
>   meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb      | 4 +-
>   42 files changed, 1022 insertions(+), 501 deletions(-)
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2023-38802.patch
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch
>   rename meta-networking/recipes-support/tcpdump/{tcpdump_4.99.1.bb =3D>
> tcpdump_4.99.4.bb} (90%)
>   rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.11.bb =3D>
> iperf3_3.14.bb} (89%)
>   create mode 100644
> meta-oe/recipes-connectivity/krb5/krb5/CVE-2023-36054.patch
>   delete mode 100644
> meta-oe/recipes-dbs/postgresql/files/0001-Properly-NULL-terminate-GSS-rec=
eive-buffer-on-error-.patch
>   delete mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch
>   delete mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch
>   delete mode 100644
> meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch
>   rename meta-oe/recipes-dbs/postgresql/{postgresql_14.5.bb =3D>
> postgresql_14.9.bb} (54%)
>   create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-25883.patch
>   rename meta-oe/recipes-devtools/php/{php_8.1.16.bb =3D> php_8.1.22.bb} =
(99%)
>   create mode 100644
> meta-oe/recipes-extended/hwloc/files/CVE-2022-47022.patch
>   rename meta-oe/recipes-extended/libqb/{libqb_2.0.6.bb =3D>
> libqb_2.0.8.bb} (93%)
>   create mode 100644
> meta-oe/recipes-support/poppler/poppler/CVE-2023-34872.patch
>   rename meta-python/recipes-devtools/python/{python3-aiohttp_3.8.1.bb
> =3D> python3-aiohttp_3.8.5.bb} (80%)
>   create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2023-36053.patch
>

