Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D3E2E7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 17:57:05 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.1148.1733939815362087243
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Dec 2024 09:56:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WDxBNvx1;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-29fe7ff65e6so1056197fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 09:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733939814; x=1734544614; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tATQiHJZnzTjEwm/lFVTZb1FKXeqbTWMAbnYozFJ58c=;
        b=WDxBNvx1V4XwVEX5b4kRyLmeo1y38F1odDcO1DvP8d/H11RJEk2PAv7OzPjciwy9h0
         xDqxtO3t7CduHMalhO4YOxKWD1LjnDmewDHtVgnZeLLMx3fMMO4bZjK//2tZ8Ui40Qth
         7xaWNFbPhCnib6FKaNY2kxyUocrT5o8G1luL+jel973NP3Se7B4mqLOlyzaEewapw8Ul
         ISU0sBb9d+lch4T4A9H0vlkB7egYBjaN7cWs1VjTn7+dGj9KK9p1NnvBudxmH/pYFtUg
         glDg4pmNsUGaChx/U9s40RVpq+4X9av1CDtA83soVNXUx2y5B3b9gwgI1KMrVPDrbGwA
         3BRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733939814; x=1734544614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tATQiHJZnzTjEwm/lFVTZb1FKXeqbTWMAbnYozFJ58c=;
        b=a6i0B9feCiprOKvLfPhjUOzGv2Lyyz5VxYul6gSENF5UzHuyQbWu0Ga0GbyC0CA9h0
         jEyv04nH3zo+ZHCVUJUPLp7rCXVjgIELTfO+N1enBeL2Byob7L+p8yDq5LEQQnpX2+um
         G4atfyoA8VOq/1kTvCLCdJLjSC5u1c8FE8WL1T9DZsQvkzELRvwmnoFxte1ZGwCYBQaQ
         nYqKJfOawEdicPTHmL21jxXzoZ4HDJZQ8CQqfYYA2+/j8pB40trdaSo2yS1FJwbzS+E5
         pHMK3lY+oM3YSZbBAxl5dATrB517vjhu6+I5e47nShlZkjF+VIODYC06JxY0t3Sp6dBE
         LT9A==
X-Gm-Message-State: AOJu0YwS0+8fEGiQS8kvqCVJ55a/CxbscDvjiqOJ2hcY5I4k3IeKKtz6
	Fc0IoRcJIVVRCQYv4XhwYu/oE2Ovo9SNeD9WPT2bv4c2R+omwfTbxAQfCjgKqAErTav7NnrWlkM
	ktD63XFk4pbvUEUmA0FdfLtLWuJLtoBJR
X-Gm-Gg: ASbGncvSt0EYGxVEKig62eOM8Q0dAR0kHWmdfBsO7ZMcvYi38kwQ/8OAhQyg0DkuGal
	fMMvxEsJHazYvoDZ/nRoR+KUA69w0WiX4XBtxEAIP/qtQtnR6QHLe6SjtRmULHUqa
X-Google-Smtp-Source: AGHT+IG5wG71Lvh9Jm8AaCr5YJzd8p/38FDYBBi/wYXBoFcV5mGO+UBE9NHRL6Tu9DY2577gcVKFyUVtD4J3kmy5168=
X-Received: by 2002:a05:6870:7f0e:b0:29f:d0bb:618e with SMTP id
 586e51a60fabf-2a012c83acbmr2405273fac.25.1733939814410; Wed, 11 Dec 2024
 09:56:54 -0800 (PST)
MIME-Version: 1.0
References: <b4df4743-842d-457b-9848-dedeea789cc5@gmail.com>
In-Reply-To: <b4df4743-842d-457b-9848-dedeea789cc5@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Dec 2024 09:56:28 -0800
Message-ID: <CAMKF1sqL9fzXNSM=MjXTr=FkHeMJ+_GmDOW3cOZGDOTAMRSocA@mail.gmail.com>
Subject: Re: kirkstone merge request: Dec 11th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 17:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114280

merged now thanks Armin

On Wed, Dec 11, 2024 at 5:51=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 4ad41baed6236d499804cbfc4f174042d84fce=
97:
>
>    sound-theme-freedesktop: Update SRC_URI (2024-10-13 11:19:56 -0400)
>
> are available in the Git repository at:
>
>    git://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 7b3fdcdfaab2fc964bbf9eec2cce4e03001fa8cf:
>
>    libgsf: Upgrade 1.14.49 -> 1.14.53 (2024-12-08 15:04:56 -0500)
>
> ----------------------------------------------------------------
> Archana Polampalli (1):
>        apache2: Upgrade 2.4.60 -> 2.4.62
>
> Chen Qi (1):
>        protobuf: fix CVE-2024-7254
>
> Haixiao Yan (3):
>        wireguard-tools: clean the do_fecth warning
>        openvpn: upgrade 2.5.6 -> 2.5.11
>        freeradius: upgrade 3.0.21 -> 3.0.27
>
> Jiaying Song (2):
>        openipmi: upgrade 2.0.32->2.0.36
>        python3-aiohttp: fix
> CVE-2023-49081/CVE-2024-30251/CVE-2024-52304/CVE-2023-49082/CVE-2024-2730=
6
>
> Khem Raj (1):
>        gitpkgv: Fix python deprecation warning
>
> Martin Jansa (5):
>        flatbuffers: fix native build with gcc-14 on host
>        python3-lxml: ignore incompatible-pointer-types issues in native
> build
>        libjs-jquery-cookie: update branch from master to main
>        poco: use main instead of master branch
>        python3-geomet: fix branch parameter
>
> Mingli Yu (1):
>        mbedtls: Upgrade 2.28.8 -> 2.28.9
>
> Peter Marko (3):
>        squid: conditionally set status of CVE-2024-45802
>        nss: patch CVE-2024-6602
>        nss: patch CVE-2024-6609
>
> Ramax Lo (1):
>        vk-gl-cts: Fix branch names
>
> Rohini Sangam (1):
>        freeradius: Security fix for CVE-2024-3596
>
> Yi Zhao (2):
>        open-vm-tools: Security fixes CVE-2023-34059
>        hostapd: Security fix for CVE-2023-52160
>
> Yogita Urade (1):
>        php: upgrade 8.1.29 -> 8.1.30
>
> Zhang Peng (2):
>        frr: fix multiple CVEs
>        libgsf: Upgrade 1.14.49 -> 1.14.53
>
> hongxu (3):
>        indent: fix CVE-2024-0911
>        ntfs-3g-ntfsprogs: fix CVE-2023-52890
>        p7zip: Fix CVE-2023-52169 and CVE-2023-52168
>
>   ...0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch | 42 ++
>   .../ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb            | 1 +
>   .../libgsf/{libgsf_1.14.49.bb =3D> libgsf_1.14.53.bb} |   9 +-
>   .../freeradius/files/0001-Add-autogen.sh.patch                  | 47 ++
>   ...-Enable-and-change-user-and-group-of-freeradius-serve.patch} | 12 +-
>   ...on.patch =3D> 0003-configure.ac-allow-cross-compilation.patch} |  10=
 +-
>   ...libtool-detection.patch =3D> 0004-Fix-libtool-detection.patch} |  33=
 +-
>   ...bcap.patch =3D> 0005-configure.ac-add-option-for-libcap.patch} |  12=
 +-
>   ...ing-host-dirs.patch =3D> 0006-Avoid-searching-host-dirs.patch} |  57=
 +-
>   ...patch =3D> 0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch} |  12=
 +-
>   ...se-jlibtool.patch =3D> 0008-libtool-do-not-use-jlibtool.patch} |  24=
 +-
>   ...r-BUILT_WITH.patch =3D> 0009-Fix-quoting-for-BUILD_WITH.patch} |  13=
 +-
>   ... =3D> 0010-fix-error-for-expansion-of-macro-in-thread.h.patch} |   6=
 +-
>   ...-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch} | 17 +-
>   ...-raddb-certs-Makefile-fix-the-existed-certificate-err.patch} | 10 +-
>   ...-raddb-certs-Makefile-fix-the-occasional-verification.patch} | 17 +-
>   ...-2.7.patch =3D> 0014-Workaround-error-with-autoconf-2.7.patch} |  14=
 +-
>   ...tch =3D> 0015-bootstrap-check-commands-of-openssl-exist.patch} |  10=
 +-
>   ...flags.patch =3D> 0016-version.c-don-t-print-build-flags.patch} |   6=
 +-
>   .../recipes-connectivity/freeradius/files/CVE-2022-41860.patch  | 118
> -----
>   .../recipes-connectivity/freeradius/files/CVE-2022-41861.patch  | 53 --
>   .../freeradius/{freeradius_3.0.21.bb =3D> freeradius_3.0.27.bb} |  37 +=
-
>   .../mbedtls/{mbedtls_2.28.8.bb =3D> mbedtls_2.28.9.bb} |   2 +-
>   meta-networking/recipes-daemons/squid/squid_4.15.bb             | 3 +
>   .../recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb    | 2 +-
>   meta-networking/recipes-protocols/frr/frr/CVE-2024-27913.patch  | 43 ++
>   meta-networking/recipes-protocols/frr/frr/CVE-2024-31948.patch  | 130
> +++++
>   meta-networking/recipes-protocols/frr/frr/CVE-2024-31950.patch  | 69 ++=
+
>   meta-networking/recipes-protocols/frr/frr/CVE-2024-31951.patch  | 111 +=
+++
>   meta-networking/recipes-protocols/frr/frr/CVE-2024-34088.patch  | 84 ++=
+
>   meta-networking/recipes-protocols/frr/frr_8.2.2.bb              | 7 +-
>   .../open-vm-tools/open-vm-tools/CVE-2023-34059.patch            | 188
> +++++++
>   .../recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb       | 1 +
>   .../0001-m4-ax_python_devel.m4-do-not-check-for-distutils.patch | 41 --
>   .../openipmi/files/fix-symlink-install-error-in-cmdlang.patch   | 11 +-
>   .../files/openipmi-remove-host-path-from-la_LDFLAGS.patch       | 49 --
>   .../openipmi/{openipmi_2.0.32.bb =3D> openipmi_2.0.36.bb} |  15 +-
>   .../recipes-support/openvpn/openvpn/CVE-2024-24974.patch        | 49 --
>   .../recipes-support/openvpn/openvpn/CVE-2024-27459.patch        | 99 --=
--
>   .../recipes-support/openvpn/openvpn/CVE-2024-27903.patch        | 119
> -----
>   .../openvpn/{openvpn_2.5.6.bb =3D> openvpn_2.5.11.bb} |   7 +-
>   meta-oe/classes/gitpkgv.bbclass                                 | 2 +-
>   .../recipes-connectivity/hostapd/hostapd/CVE-2023-52160.patch   | 198
> +++++++
>   meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb            | 1 +
>   ...1-C-stl_emulation-span-count_-is-not-const-anymore-722.patch | 27 +
>   meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb       | 4 +-
>   meta-oe/recipes-devtools/php/{php_8.1.29.bb =3D> php_8.1.30.bb} |   2 +=
-
>   ...1-Add-recursion-check-when-parsing-unknown-fields-in-J.patch | 795
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb            | 1 +
>   .../0001-Fix-a-heap-buffer-underread-in-set_buf_break.patch     | 123
> +++++
>   meta-oe/recipes-extended/indent/indent_2.2.12.bb                | 1 +
>   .../files/0001-Fix-two-buffer-overflow-vulnerabilities.patch    | 455
> ++++++++++++++++
>   meta-oe/recipes-extended/p7zip/p7zip_16.02.bb                   | 1 +
>   meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc              | 6 +-
>   meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb      | 2 +-
>   meta-oe/recipes-support/nss/nss/CVE-2024-6602.patch             | 65 ++=
+
>   meta-oe/recipes-support/nss/nss/CVE-2024-6609.patch             | 30 ++
>   meta-oe/recipes-support/nss/nss_3.74.bb                         | 2 +
>   meta-oe/recipes-support/poco/poco_1.11.2.bb                     | 2 +-
>   .../python/python3-aiohttp/CVE-2023-49081.patch                 | 96 ++=
++
>   .../python/python3-aiohttp/CVE-2023-49082.patch                 | 105 +=
+++
>   .../python/python3-aiohttp/CVE-2024-27306.patch                 | 81 ++=
+
>   .../python/python3-aiohttp/CVE-2024-30251.patch                 | 522
> ++++++++++++++++++
>   .../python/python3-aiohttp/CVE-2024-52304.patch                 | 46 ++
>   meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb    | 5 +
>   meta-python/recipes-devtools/python/python3-geomet_0.3.0.bb     | 5 +-
>   meta-python/recipes-devtools/python/python3-lxml_4.8.0.bb       | 2 +
>   .../apache2/{apache2_2.4.60.bb =3D> apache2_2.4.62.bb} |   2 +-
>   68 files changed, 3459 insertions(+), 712 deletions(-)
>   create mode 100644
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.=
c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch
>   rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.49.bb =3D>
> libgsf_1.14.53.bb} (52%)
>   create mode 100644
> meta-networking/recipes-connectivity/freeradius/files/0001-Add-autogen.sh=
.patch
>   rename
> meta-networking/recipes-connectivity/freeradius/files/{freeradius-enble-u=
ser-in-conf.patch
> =3D> 0002-Enable-and-change-user-and-group-of-freeradius-serve.patch} (67=
%)
>   rename
> meta-networking/recipes-connectivity/freeradius/files/{freeradius-configu=
re.ac-allow-cross-compilation.patch
> =3D> 0003-configure.ac-allow-cross-compilation.patch} (85%)
>   rename
> meta-networking/recipes-connectivity/freeradius/files/{freeradius-libtool=
-detection.patch
> =3D> 0004-Fix-libtool-detection.patch} (73%)
>   rename
> meta-networking/recipes-connectivity/freeradius/files/{freeradius-configu=
re.ac-add-option-for-libcap.patch
> =3D> 0005-configure.ac-add-option-for-libcap.patch} (87%)
>   rename
> meta-networking/recipes-connectivity/freeradius/files/{freeradius-avoid-s=
earching-host-dirs.patch
> =3D> 0006-Avoid-searching-host-dirs.patch} (85%)
>   rename
> meta-networking/recipes-connectivity/freeradius/files/{freeradius-rlm_pyt=
hon-add-PY_INC_DIR.patch
> =3D> 0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch} (81%)
>   rename
> meta-networking/recipes-connectivity/freeradius/files/{freeradius-libtool=
-do-not-use-jlibtool.patch
> =3D> 0008-libtool-do-not-use-jlibtool.patch} (91%)
>   rename
> meta-networking/recipes-connectivity/freeradius/files/{freeradius-fix-quo=
ting-for-BUILT_WITH.patch
> =3D> 0009-Fix-quoting-for-BUILD_WITH.patch} (87%)
>   rename
> meta-networking/recipes-connectivity/freeradius/files/{freeradius-fix-err=
or-for-expansion-of-macro.patch
> =3D> 0010-fix-error-for-expansion-of-macro-in-thread.h.patch} (95%)
>   rename
> meta-networking/recipes-connectivity/freeradius/files/{0001-rlm_mschap-Us=
e-includedir-instead-of-hardcoding-usr-.patch
> =3D> 0011-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch} (59=
%)
>   rename
> meta-networking/recipes-connectivity/freeradius/files/{0001-raddb-certs-M=
akefile-fix-the-existed-certificate-err.patch
> =3D> 0012-raddb-certs-Makefile-fix-the-existed-certificate-err.patch} (92=
%)
>   rename
> meta-networking/recipes-connectivity/freeradius/files/{0001-raddb-certs-M=
akefile-fix-the-occasional-verification.patch
> =3D> 0013-raddb-certs-Makefile-fix-the-occasional-verification.patch} (94=
%)
>   rename
> meta-networking/recipes-connectivity/freeradius/files/{0001-workaround-er=
ror-with-autoconf-2.7.patch
> =3D> 0014-Workaround-error-with-autoconf-2.7.patch} (77%)
>   rename
> meta-networking/recipes-connectivity/freeradius/files/{check-openssl-cmds=
-in-script-bootstrap.patch
> =3D> 0015-bootstrap-check-commands-of-openssl-exist.patch} (81%)
>   rename
> meta-networking/recipes-connectivity/freeradius/files/{0001-version.c-don=
-t-print-build-flags.patch
> =3D> 0016-version.c-don-t-print-build-flags.patch} (86%)
>   delete mode 100644
> meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41860.patc=
h
>   delete mode 100644
> meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41861.patc=
h
>   rename
> meta-networking/recipes-connectivity/freeradius/{freeradius_3.0.21.bb =3D=
>
> freeradius_3.0.27.bb} (89%)
>   rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.8.bb
> =3D> mbedtls_2.28.9.bb} (97%)
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2024-27913.patch
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2024-31948.patch
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2024-31950.patch
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2024-31951.patch
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2024-34088.patch
>   create mode 100644
> meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-3405=
9.patch
>   delete mode 100644
> meta-networking/recipes-support/openipmi/files/0001-m4-ax_python_devel.m4=
-do-not-check-for-distutils.patch
>   delete mode 100644
> meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-=
from-la_LDFLAGS.patch
>   rename meta-networking/recipes-support/openipmi/{openipmi_2.0.32.bb =3D=
>
> openipmi_2.0.36.bb} (87%)
>   delete mode 100644
> meta-networking/recipes-support/openvpn/openvpn/CVE-2024-24974.patch
>   delete mode 100644
> meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27459.patch
>   delete mode 100644
> meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27903.patch
>   rename meta-networking/recipes-support/openvpn/{openvpn_2.5.6.bb =3D>
> openvpn_2.5.11.bb} (92%)
>   create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2023-52160.patch
>   create mode 100644
> meta-oe/recipes-devtools/flatbuffers/flatbuffers/0001-C-stl_emulation-spa=
n-count_-is-not-const-anymore-722.patch
>   rename meta-oe/recipes-devtools/php/{php_8.1.29.bb =3D> php_8.1.30.bb} =
(99%)
>   create mode 100644
> meta-oe/recipes-devtools/protobuf/protobuf/0001-Add-recursion-check-when-=
parsing-unknown-fields-in-J.patch
>   create mode 100644
> meta-oe/recipes-extended/indent/indent/0001-Fix-a-heap-buffer-underread-i=
n-set_buf_break.patch
>   create mode 100644
> meta-oe/recipes-extended/p7zip/files/0001-Fix-two-buffer-overflow-vulnera=
bilities.patch
>   create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-6602.patch
>   create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-6609.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2023-49081.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2023-49082.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-27306.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-30251.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-52304.patch
>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.60.bb =3D>
> apache2_2.4.62.bb} (99%)
>

