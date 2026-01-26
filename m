Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69174C88E4A
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 05:26:03 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13614.1769405156532104648
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jan 2026 21:25:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CAeSlwYa;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79456d5ebf9so9452267b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 21:25:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769405156; cv=none;
        d=google.com; s=arc-20240605;
        b=emVy02EbLUtfwM9akU7tOJPp+VMv5vajQ2LB4L8cBdyYymr5dbKGH8cq1R/lpB7v2J
         Zpa4LBmKcEYOdzY45SmouWFgL6gSTxHGLhJAxJkILR5UKBmjGPTGwvdQF6oG7Kgmfftx
         ob9nJMpurVPhOKpj1MMPu6M+zGLBV030VyP63q6lNxS7xTAQwOh5U+tDoe8pSxhpzW2T
         lTP2NWZjMeefkRqIUken2xQ2sWWZYuKdLunpVSr/SGAo+1qTeWvbfowQngin3CW30fY8
         9JyTaNx0sLQSNJrSdqTta1g5Y3uHXtb/lNw1Lhu9W+6xb0PFjy5HzfMLsUVERgFcrBab
         VzZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wc0jzBN06fqJEsRPDNbaJV7zDsfouq2vPW1DSs24XKo=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=j2yFaj+WqGR23m8+Tw/SeOzPG+GweRHvzqpq3piqPd+MRchqFGdmTbaN4v7IaClIDc
         zhROzXqeYw1lE9cf4D9Hn60YE8+oY2p3ZuhbBMOdMFdfs8rv1KFNe9BH+2tbnNwFXLwT
         SzaCfrfIh7unJDd1lNz/mdCzjYWuKqoq3An4DYqvZHrRsfeBmrBPMqkjYNsmxY1lWftS
         sxEeeN8ybftUgaQuKqSFyc0K80TbfkvfE4qx5aWP0j6I5ZoV5vM22EAJficz/cgK6jDP
         7b38WFk+RkA4WTzD05j0Crknzbb+b8nTgiJtSLiUys5HBpJuX9KzLD9hFDF4vBfeAvf5
         bZQg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769405156; x=1770009956; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wc0jzBN06fqJEsRPDNbaJV7zDsfouq2vPW1DSs24XKo=;
        b=CAeSlwYaEDMdi3ch+VXX6iX4hrbFA6vsHyHW+VjXdOhe++orrQLaiymopnuDC8y53a
         8WttSzL0foF/OIKHk2sLvPNPsTzXsBgwS24v+esp3lJZTmbnyKFrUpEDqwicfCyMF78w
         ncoSjZ1O+K7ikWHADwgL6OIKIXvIvSXXf57pOe7i2vYp8F3PXJtKgSe47IFTc7GSedRF
         dUjIzbb+mujzY+Dc1DfNqIOKz8OQDUOsM8cnf7VvZaa01txZqNXtN5Q7OSkXd9frqXq5
         Zkd5UmhT2DhW/J4v7/0gkg6/MBmcUQ8RlNBdmJ7t7LvXuI3xD8znM0i+1ccObfnAhIyb
         zr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769405156; x=1770009956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wc0jzBN06fqJEsRPDNbaJV7zDsfouq2vPW1DSs24XKo=;
        b=KQaghn/Knh5AGCMEo9SAHDXvgilC4w8Qqb9mCGCcJ3R6KNObJibJx7X0JypU//bLc9
         1b6rjMVSWVowMiaUcgDzlaZnqmgvOFhN4oOxltMT2XXTwnmOz/5Q660TiMmPDb8wUCPw
         TGtAvIn6q17+63ieRUoU9+LCaRfvuJKnQl1W9UKTxC3T87MbHBSIBhgyl2gBspJnYvuE
         BoHK50HKAw0Xe1POO+kqLD5h3gf2NQdQHVNp5773sHglNl/Jju2pjKHJtI6DewakaApo
         I8Qdj0BpKiIRY9lmAS/VrbSbLSUA7b+OBlOsVmZmOtJLV+GS8/eUFkk7SlQsFfvCwgFI
         Ta/g==
X-Gm-Message-State: AOJu0YwoXAv5jZloecEff4gVcWOM+KxbSQaRB60axcdwX5XLKe6pZgvg
	BA1N8w6mu2Nv3kEM4jX29FZBIUX0AuYRPpP7OIiyEwTnWog4U4L5AVBcmBwTqoOjfYjqiLBPWkj
	woDUztvjbN2RfD9v1FiO1iEA53lbypf8PJLb4U7w=
X-Gm-Gg: AZuq6aJ44RXFLWZ001e8/MIkpxG2DnfMkMx+JIuSk220YpajSgOnT7HI/8pjhaMrhU5
	qSU5sUGE3GF16vXNwsAgm+dueUPVTbZdnY/G7PDCaRN0sIKjPZqJnQA8QnJQP/u3wRzNHhr5kfO
	ih7Hd+rbT09HXOEZCcwOg3v7SLG6LC/9BgGPPbv6Y8720jeAglbm1WSj3BZhh6g3KdmpJjBeyFF
	TiurouG50BLVmAK3yjcBGWC3U4iTDq5ATZZYaUcsQkqzY+VLbfAAIatlCorByGE2XMniY9fHDlo
	HOqnIPeMwSQhpGk+AaxG8z/5gdFmPRVVsb45Cq4BIz1iE8h+lrXXhg+XEkIKUbwRK7Detek8mqs
	LerDlUFYyBhYKxY7fwYXjOVzkgP7kHzN88N20/Q==
X-Received: by 2002:a05:690c:f05:b0:78c:6771:77bb with SMTP id
 00721157ae682-7945a820f5bmr21606187b3.14.1769405155363; Sun, 25 Jan 2026
 21:25:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1769137698.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1769137698.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 25 Jan 2026 21:25:29 -0800
X-Gm-Features: AZwV_QhMxXb_W7QD7E-bvU-AEKN2-OWvEh61KBDHeOQoBz68SdZ8yJQ0g6qxcz8
Message-ID: <CAMKF1sp+_GJDJfhD9hfjX0WhiLrPSPBVEBXjsXPt9Yq5ExUR4A@mail.gmail.com>
Subject: Re: [PATCH 00/42] Whinlatter pull request
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bfd17e064943bda9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 05:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123848

--000000000000bfd17e064943bda9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged now thanks Anuj

On Thu, Jan 22, 2026 at 7:11=E2=80=AFPM Anuj Mittal <anuj.mittal@oss.qualco=
mm.com>
wrote:

> Please merge these changes in whinlatter. Tested on autobuilder and
> locally.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1259
>
> The following changes since commit
> c6849e7529727a2c9eca0f9220836bd0d69ce086:
>
>   python3-django: upgrade 5.2.8 -> 5.2.9 (2026-01-06 18:07:59 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib
> stable/whinlatter-next
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/wh=
inlatter-next
>
> Ankur Tyagi (5):
>   php: upgrade 8.4.16 -> 8.4.17
>   mozjs-128: Fix build error with arm and musl
>   libjxl: Fix build error with arm and musl
>   influxdb: ignore CVE-2024-30896
>   frr: upgrade 10.4.1 -> 10.4.2
>
> Dmitry Baryshkov (1):
>   vulkan-cts: upgrade 1.4.4.0 -> 1.4.4.2
>
> Gyorgy Sarvari (16):
>   nodejs: remove extra CVE_PRODUCT
>   smarty: extend CVE_PRODUCT
>   raptor2: set CVE_PRODUCT
>   libcereal: set CVE_PRODUCT
>   asyncmqtt: set CVE_PRODUCT
>   boinc-client: set CVE_PRODUCT
>   boinc-client: mark CVE-2013-2018 patched
>   lmdb: patch CVE-2026-22185
>   xerces-c: set CVE_PRODUCT
>   dante: upgrade 1.4.3 -> 1.4.4
>   tinyproxy: patch CVE-2025-63938
>   python3-scapy: set CVE_PRODUCT
>   nginx: set CVE_PRODUCT
>   softhsm: fix SRC_URI branch
>   ncp: update SRC_URI
>   libowfat: update SRC_URI
>
> Jason Schonberg (1):
>   nginx: upgrade 1.28.0 -> 1.28.1
>
> Jiaying Song (1):
>   minicoredumper: fix 2038 year problem in timestamp handling
>
> Khem Raj (2):
>   vboxguestdrivers: Upgrade to 7.2.4
>   dante: Add _GNU_SOURCE for musl builds
>
> Liu Yiding (2):
>   liblognorm: upgrade 2.0.7 -> 2.0.8
>   libsdl3: upgrade 3.2.28 -> 3.2.30
>
> Peter Marko (4):
>   net-snmp: patch CVE-2025-68615
>   libsodium: patch CVE-2025-69277
>   libcoap: set CVE version suffix
>   nginx: ignore CVE-2025-53859 for 1.28.1
>
> Sanjay Chitroda (1):
>   recipes-core/toybox: Switch SRC_URI to HTTPS for reliable fetch
>
> Wang Mingyu (9):
>   python3-psycopg: upgrade 3.2.12 -> 3.2.13
>   parallel: upgrade 20251022 -> 20251122
>   libsdl3: upgrade 3.2.26 -> 3.2.28
>   usb-modeswitch-data: upgrade 20191128 -> 20251207
>   usb-modeswitch: upgrade 2.6.1 -> 2.6.2
>   microsoft-gsl: upgrade 4.2.0 -> 4.2.1
>   cryptsetup: upgrade 2.8.1 -> 2.8.3
>   libdecor: upgrade 0.2.4 -> 0.2.5
>   libsdl3-image: upgrade 3.2.4 -> 3.2.6
>
>  .../libcoap/libcoap_4.3.5a.bb                 |   2 +
>  .../python/python3-scapy_2.6.1.bb             |   2 +
>  .../dante/{dante_1.4.3.bb =3D> dante_1.4.4.bb}  |   6 +-
>  .../frr/{frr_10.4.1.bb =3D> frr_10.4.2.bb}      |   2 +-
>  .../net-snmp/net-snmp/CVE-2025-68615.patch    |  33 +++++
>  .../net-snmp/net-snmp_5.9.4.bb                |   1 +
>  .../recipes-support/ncp/libowfat_0.32.bb      |   2 +-
>  .../recipes-support/ncp/ncp_1.2.4.bb          |   2 +-
>  .../tinyproxy/tinyproxy/CVE-2025-63938.patch  |  43 ++++++
>  .../tinyproxy/tinyproxy_1.11.2.bb             |   1 +
>  .../asyncmqtt/asyncmqtt_10.2.6.bb             |   2 +
>  meta-oe/recipes-core/toybox/toybox_0.8.13.bb  |   2 +-
>  ...ryptsetup_2.8.1.bb =3D> cryptsetup_2.8.3.bb} |   2 +-
>  .../libsodium/libsodium/CVE-2025-69277.patch  |  61 ++++++++
>  .../libsodium/libsodium_1.0.20.bb             |   2 +
>  .../recipes-dbs/influxdb/influxdb_1.8.10.bb   |   1 +
>  .../lmdb/files/CVE-2026-22185.patch           |  31 +++++
>  meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb       |   1 +
>  ...ft-gsl_4.2.0.bb =3D> microsoft-gsl_4.2.1.bb} |   8 +-
>  .../recipes-devtools/nodejs/nodejs_22.21.1.bb |   2 -
>  .../php/{php_8.4.16.bb =3D> php_8.4.17.bb}      |   2 +-
>  ...pg_3.2.12.bb =3D> python3-psycopg_3.2.13.bb} |   2 +-
>  .../xerces-c/xerces-c_3.3.0.bb                |   2 +
>  .../boinc/boinc-client_7.20.5.bb              |   4 +
>  ...iblognorm_2.0.7.bb =3D> liblognorm_2.0.8.bb} |   3 +-
>  ...001-Cargo.toml-do-not-abort-on-panic.patch |   2 +-
>  ...nfigure-do-not-look-for-llvm-objdump.patch |   2 +-
>  ...o-not-try-to-find-a-suitable-upstrea.patch |   2 +-
>  .../mozjs-128/0004-use-asm-sgidefs.h.patch    |   2 +-
>  ...2.patch =3D> 0005-Add-RISCV32-support.patch} |   2 +-
>  ...x-one-occasionally-reproduced-confi.patch} |   2 +-
>  ...ewrite-cargo-host-linker-in-python3.patch} |   2 +-
>  ...e-stack-unwinder-like-glibc-therefo.patch} |   2 +-
>  ...om-firefox-bugzilla-to-fix-compile-.patch} |   2 +-
>  ...on-isn-t-available-in-ARMv5-or-v6-s.patch} |   2 +-
>  ...ith-icu-uc-to-fix-build-with-ICU-76.patch} |   2 +-
>  ...gc-and-riscv32gc-as-valid-architect.patch} |  38 +++--
>  .../0013-Fix-build-error-with-musl.patch      |  30 ++++
>  .../mozjs/mozjs-128_128.5.2.bb                |  17 +--
>  ...allel_20251022.bb =3D> parallel_20251122.bb} |   2 +-
>  .../{libdecor_0.2.4.bb =3D> libdecor_0.2.5.bb}  |   2 +-
>  ...-image_3.2.4.bb =3D> libsdl3-image_3.2.6.bb} |   2 +-
>  .../{libsdl3_3.2.26.bb =3D> libsdl3_3.2.30.bb}  |   2 +-
>  ...01-decode-fix-build-on-ARMv7-targets.patch |   4 +-
>  ...ing-for-non-NEON-enabled-ARM-targets.patch |  73 +++++-----
>  .../vk-gl-cts/vulkan-cts-sources.inc          |   2 +-
>  ...n-cts_1.4.4.0.bb =3D> vulkan-cts_1.4.4.2.bb} |   2 +-
>  ...8-year-problem-in-timestamp-handling.patch |  55 ++++++++
>  .../minicoredumper/minicoredumper_2.0.7.bb    |   1 +
>  .../libjxl/libjxl_0.11.1.bb                   |   3 +
>  .../recipes-security/softhsm/softhsm_2.6.1.bb |   2 +-
>  .../libcereal/libcereal_1.3.2.bb              |   2 +
>  .../recipes-support/raptor2/raptor2_2.0.16.bb |   2 +
>  .../recipes-support/smarty/smarty_5.6.0.bb    |   2 +-
>  ...128.bb =3D> usb-modeswitch-data_20251207.bb} |   2 +-
>  .../0001-Fix-build-with-gcc-15.patch          |  51 -------
>  ...witch_2.6.1.bb =3D> usb-modeswitch_2.6.2.bb} |   6 +-
>  ...ers_7.2.2.bb =3D> vboxguestdrivers_7.2.4.bb} |   2 +-
>  .../nginx/files/CVE-2025-53859.patch          | 131 ------------------
>  meta-webserver/recipes-httpd/nginx/nginx.inc  |   2 +
>  .../recipes-httpd/nginx/nginx_1.28.0.bb       |   7 -
>  .../recipes-httpd/nginx/nginx_1.28.1.bb       |   7 +
>  62 files changed, 404 insertions(+), 286 deletions(-)
>  rename meta-networking/recipes-protocols/dante/{dante_1.4.3.bb =3D>
> dante_1.4.4.bb} (88%)
>  rename meta-networking/recipes-protocols/frr/{frr_10.4.1.bb =3D>
> frr_10.4.2.bb} (99%)
>  create mode 100644
> meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2025-68615.patch
>  create mode 100644
> meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2025-63938.patch
>  rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.8.1.bb =3D>
> cryptsetup_2.8.3.bb} (98%)
>  create mode 100644
> meta-oe/recipes-crypto/libsodium/libsodium/CVE-2025-69277.patch
>  create mode 100644 meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patch
>  rename meta-oe/recipes-devtools/microsoft-gsl/{microsoft-gsl_4.2.0.bb =
=3D>
> microsoft-gsl_4.2.1.bb} (93%)
>  rename meta-oe/recipes-devtools/php/{php_8.4.16.bb =3D> php_8.4.17.bb}
> (99%)
>  rename meta-oe/recipes-devtools/python/{python3-psycopg_3.2.12.bb =3D>
> python3-psycopg_3.2.13.bb} (85%)
>  rename meta-oe/recipes-extended/liblognorm/{liblognorm_2.0.7.bb =3D>
> liblognorm_2.0.8.bb} (95%)
>  rename meta-oe/recipes-extended/mozjs/mozjs-128/{riscv32.patch =3D>
> 0005-Add-RISCV32-support.patch} (97%)
>  rename
> meta-oe/recipes-extended/mozjs/mozjs-128/{0001-util.configure-fix-one-occ=
asionally-reproduced-confi.patch
> =3D> 0006-util.configure-fix-one-occasionally-reproduced-confi.patch} (96=
%)
>  rename
> meta-oe/recipes-extended/mozjs/mozjs-128/{0001-rewrite-cargo-host-linker-=
in-python3.patch
> =3D> 0007-Rewrite-cargo-host-linker-in-python3.patch} (97%)
>  rename
> meta-oe/recipes-extended/mozjs/mozjs-128/{musl-disable-stackwalk.patch =
=3D>
> 0008-Musl-does-not-have-stack-unwinder-like-glibc-therefo.patch} (94%)
>  rename
> meta-oe/recipes-extended/mozjs/mozjs-128/{0001-add-arm-to-list-of-mozinli=
ne.patch
> =3D> 0009-Backport-patch-from-firefox-bugzilla-to-fix-compile-.patch} (95=
%)
>  rename meta-oe/recipes-extended/mozjs/mozjs-128/{armv5.patch =3D>
> 0010-The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.patch} (93%)
>  rename
> meta-oe/recipes-extended/mozjs/mozjs-128/{0001-Link-with-icu-uc-to-fix-bu=
ild-with-ICU-76.patch
> =3D> 0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch} (92%)
>  rename meta-oe/recipes-extended/mozjs/mozjs-128/{riscv.patch =3D>
> 0012-Recognise-riscv64gc-and-riscv32gc-as-valid-architect.patch} (60%)
>  create mode 100644
> meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-error-with-musl.p=
atch
>  rename meta-oe/recipes-extended/parallel/{parallel_20251022.bb =3D>
> parallel_20251122.bb} (93%)
>  rename meta-oe/recipes-graphics/libdecor/{libdecor_0.2.4.bb =3D>
> libdecor_0.2.5.bb} (94%)
>  rename meta-oe/recipes-graphics/libsdl3/{libsdl3-image_3.2.4.bb =3D>
> libsdl3-image_3.2.6.bb} (87%)
>  rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.2.26.bb =3D>
> libsdl3_3.2.30.bb} (97%)
>  rename meta-oe/recipes-graphics/vk-gl-cts/{vulkan-cts_1.4.4.0.bb =3D>
> vulkan-cts_1.4.4.2.bb} (94%)
>  create mode 100644
> meta-oe/recipes-kernel/minicoredumper/files/0002-Fix-2038-year-problem-in=
-timestamp-handling.patch
>  rename meta-oe/recipes-support/usb-modeswitch/{
> usb-modeswitch-data_20191128.bb =3D> usb-modeswitch-data_20251207.bb} (84=
%)
>  delete mode 100644
> meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-Fix-build-with=
-gcc-15.patch
>  rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch_2.6.1.bb
> =3D> usb-modeswitch_2.6.2.bb} (86%)
>  rename meta-oe/recipes-support/vboxguestdrivers/{
> vboxguestdrivers_7.2.2.bb =3D> vboxguestdrivers_7.2.4.bb} (97%)
>  delete mode 100755
> meta-webserver/recipes-httpd/nginx/files/CVE-2025-53859.patch
>  delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.28.0.bb
>  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.28.1.bb
>
> --
> 2.52.0
>
>

--000000000000bfd17e064943bda9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged now thanks Anuj</div><br><div class=3D"gmail_quote =
gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 22=
, 2026 at 7:11=E2=80=AFPM Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@oss=
.qualcomm.com">anuj.mittal@oss.qualcomm.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Please merge these changes in wh=
inlatter. Tested on autobuilder and<br>
locally.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1259" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1259</a><br>
<br>
The following changes since commit c6849e7529727a2c9eca0f9220836bd0d69ce086=
:<br>
<br>
=C2=A0 python3-django: upgrade 5.2.8 -&gt; 5.2.9 (2026-01-06 18:07:59 +0530=
)<br>
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
Ankur Tyagi (5):<br>
=C2=A0 php: upgrade 8.4.16 -&gt; 8.4.17<br>
=C2=A0 mozjs-128: Fix build error with arm and musl<br>
=C2=A0 libjxl: Fix build error with arm and musl<br>
=C2=A0 influxdb: ignore CVE-2024-30896<br>
=C2=A0 frr: upgrade 10.4.1 -&gt; 10.4.2<br>
<br>
Dmitry Baryshkov (1):<br>
=C2=A0 vulkan-cts: upgrade 1.4.4.0 -&gt; 1.4.4.2<br>
<br>
Gyorgy Sarvari (16):<br>
=C2=A0 nodejs: remove extra CVE_PRODUCT<br>
=C2=A0 smarty: extend CVE_PRODUCT<br>
=C2=A0 raptor2: set CVE_PRODUCT<br>
=C2=A0 libcereal: set CVE_PRODUCT<br>
=C2=A0 asyncmqtt: set CVE_PRODUCT<br>
=C2=A0 boinc-client: set CVE_PRODUCT<br>
=C2=A0 boinc-client: mark CVE-2013-2018 patched<br>
=C2=A0 lmdb: patch CVE-2026-22185<br>
=C2=A0 xerces-c: set CVE_PRODUCT<br>
=C2=A0 dante: upgrade 1.4.3 -&gt; 1.4.4<br>
=C2=A0 tinyproxy: patch CVE-2025-63938<br>
=C2=A0 python3-scapy: set CVE_PRODUCT<br>
=C2=A0 nginx: set CVE_PRODUCT<br>
=C2=A0 softhsm: fix SRC_URI branch<br>
=C2=A0 ncp: update SRC_URI<br>
=C2=A0 libowfat: update SRC_URI<br>
<br>
Jason Schonberg (1):<br>
=C2=A0 nginx: upgrade 1.28.0 -&gt; 1.28.1<br>
<br>
Jiaying Song (1):<br>
=C2=A0 minicoredumper: fix 2038 year problem in timestamp handling<br>
<br>
Khem Raj (2):<br>
=C2=A0 vboxguestdrivers: Upgrade to 7.2.4<br>
=C2=A0 dante: Add _GNU_SOURCE for musl builds<br>
<br>
Liu Yiding (2):<br>
=C2=A0 liblognorm: upgrade 2.0.7 -&gt; 2.0.8<br>
=C2=A0 libsdl3: upgrade 3.2.28 -&gt; 3.2.30<br>
<br>
Peter Marko (4):<br>
=C2=A0 net-snmp: patch CVE-2025-68615<br>
=C2=A0 libsodium: patch CVE-2025-69277<br>
=C2=A0 libcoap: set CVE version suffix<br>
=C2=A0 nginx: ignore CVE-2025-53859 for 1.28.1<br>
<br>
Sanjay Chitroda (1):<br>
=C2=A0 recipes-core/toybox: Switch SRC_URI to HTTPS for reliable fetch<br>
<br>
Wang Mingyu (9):<br>
=C2=A0 python3-psycopg: upgrade 3.2.12 -&gt; 3.2.13<br>
=C2=A0 parallel: upgrade 20251022 -&gt; 20251122<br>
=C2=A0 libsdl3: upgrade 3.2.26 -&gt; 3.2.28<br>
=C2=A0 usb-modeswitch-data: upgrade 20191128 -&gt; 20251207<br>
=C2=A0 usb-modeswitch: upgrade 2.6.1 -&gt; 2.6.2<br>
=C2=A0 microsoft-gsl: upgrade 4.2.0 -&gt; 4.2.1<br>
=C2=A0 cryptsetup: upgrade 2.8.1 -&gt; 2.8.3<br>
=C2=A0 libdecor: upgrade 0.2.4 -&gt; 0.2.5<br>
=C2=A0 libsdl3-image: upgrade 3.2.4 -&gt; 3.2.6<br>
<br>
=C2=A0.../libcoap/<a href=3D"http://libcoap_4.3.5a.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libcoap_4.3.5a.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../python/<a href=3D"http://python3-scapy_2.6.1.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-scapy_2.6.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../dante/{<a href=3D"http://dante_1.4.3.bb" rel=3D"noreferrer" targe=
t=3D"_blank">dante_1.4.3.bb</a> =3D&gt; <a href=3D"http://dante_1.4.4.bb" r=
el=3D"noreferrer" target=3D"_blank">dante_1.4.4.bb</a>}=C2=A0 |=C2=A0 =C2=
=A06 +-<br>
=C2=A0.../frr/{<a href=3D"http://frr_10.4.1.bb" rel=3D"noreferrer" target=
=3D"_blank">frr_10.4.1.bb</a> =3D&gt; <a href=3D"http://frr_10.4.2.bb" rel=
=3D"noreferrer" target=3D"_blank">frr_10.4.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0.../net-snmp/net-snmp/CVE-2025-68615.patch=C2=A0 =C2=A0 |=C2=A0 33 ++=
+++<br>
=C2=A0.../net-snmp/<a href=3D"http://net-snmp_5.9.4.bb" rel=3D"noreferrer" =
target=3D"_blank">net-snmp_5.9.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../recipes-support/ncp/<a href=3D"http://libowfat_0.32.bb" rel=3D"no=
referrer" target=3D"_blank">libowfat_0.32.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../recipes-support/ncp/<a href=3D"http://ncp_1.2.4.bb" rel=3D"norefe=
rrer" target=3D"_blank">ncp_1.2.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A02 +-<br>
=C2=A0.../tinyproxy/tinyproxy/CVE-2025-63938.patch=C2=A0 |=C2=A0 43 ++++++<=
br>
=C2=A0.../tinyproxy/<a href=3D"http://tinyproxy_1.11.2.bb" rel=3D"noreferre=
r" target=3D"_blank">tinyproxy_1.11.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../asyncmqtt/<a href=3D"http://asyncmqtt_10.2.6.bb" rel=3D"noreferre=
r" target=3D"_blank">asyncmqtt_10.2.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0meta-oe/recipes-core/toybox/<a href=3D"http://toybox_0.8.13.bb" rel=
=3D"noreferrer" target=3D"_blank">toybox_0.8.13.bb</a>=C2=A0 |=C2=A0 =C2=A0=
2 +-<br>
=C2=A0...<a href=3D"http://ryptsetup_2.8.1.bb" rel=3D"noreferrer" target=3D=
"_blank">ryptsetup_2.8.1.bb</a> =3D&gt; <a href=3D"http://cryptsetup_2.8.3.=
bb" rel=3D"noreferrer" target=3D"_blank">cryptsetup_2.8.3.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../libsodium/libsodium/CVE-2025-69277.patch=C2=A0 |=C2=A0 61 +++++++=
+<br>
=C2=A0.../libsodium/<a href=3D"http://libsodium_1.0.20.bb" rel=3D"noreferre=
r" target=3D"_blank">libsodium_1.0.20.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../recipes-dbs/influxdb/<a href=3D"http://influxdb_1.8.10.bb" rel=3D=
"noreferrer" target=3D"_blank">influxdb_1.8.10.bb</a>=C2=A0 =C2=A0|=C2=A0 =
=C2=A01 +<br>
=C2=A0.../lmdb/files/CVE-2026-22185.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 31 +++++<br>
=C2=A0meta-oe/recipes-dbs/lmdb/<a href=3D"http://lmdb_0.9.31.bb" rel=3D"nor=
eferrer" target=3D"_blank">lmdb_0.9.31.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A0...<a href=3D"http://ft-gsl_4.2.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">ft-gsl_4.2.0.bb</a> =3D&gt; <a href=3D"http://microsoft-gsl_4.2.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">microsoft-gsl_4.2.1.bb</a>} |=C2=A0 =
=C2=A08 +-<br>
=C2=A0.../recipes-devtools/nodejs/<a href=3D"http://nodejs_22.21.1.bb" rel=
=3D"noreferrer" target=3D"_blank">nodejs_22.21.1.bb</a> |=C2=A0 =C2=A02 -<b=
r>
=C2=A0.../php/{<a href=3D"http://php_8.4.16.bb" rel=3D"noreferrer" target=
=3D"_blank">php_8.4.16.bb</a> =3D&gt; <a href=3D"http://php_8.4.17.bb" rel=
=3D"noreferrer" target=3D"_blank">php_8.4.17.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://pg_3.2.12.bb" rel=3D"noreferrer" target=3D"_blan=
k">pg_3.2.12.bb</a> =3D&gt; <a href=3D"http://python3-psycopg_3.2.13.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-psycopg_3.2.13.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../xerces-c/<a href=3D"http://xerces-c_3.3.0.bb" rel=3D"noreferrer" =
target=3D"_blank">xerces-c_3.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../boinc/<a href=3D"http://boinc-client_7.20.5.bb" rel=3D"noreferrer=
" target=3D"_blank">boinc-client_7.20.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0...<a href=3D"http://iblognorm_2.0.7.bb" rel=3D"noreferrer" target=3D=
"_blank">iblognorm_2.0.7.bb</a> =3D&gt; <a href=3D"http://liblognorm_2.0.8.=
bb" rel=3D"noreferrer" target=3D"_blank">liblognorm_2.0.8.bb</a>} |=C2=A0 =
=C2=A03 +-<br>
=C2=A0...001-Cargo.toml-do-not-abort-on-panic.patch |=C2=A0 =C2=A02 +-<br>
=C2=A0...nfigure-do-not-look-for-llvm-objdump.patch |=C2=A0 =C2=A02 +-<br>
=C2=A0...o-not-try-to-find-a-suitable-upstrea.patch |=C2=A0 =C2=A02 +-<br>
=C2=A0.../mozjs-128/0004-use-asm-sgidefs.h.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0...2.patch =3D&gt; 0005-Add-RISCV32-support.patch} |=C2=A0 =C2=A02 +-=
<br>
=C2=A0...x-one-occasionally-reproduced-confi.patch} |=C2=A0 =C2=A02 +-<br>
=C2=A0...ewrite-cargo-host-linker-in-python3.patch} |=C2=A0 =C2=A02 +-<br>
=C2=A0...e-stack-unwinder-like-glibc-therefo.patch} |=C2=A0 =C2=A02 +-<br>
=C2=A0...om-firefox-bugzilla-to-fix-compile-.patch} |=C2=A0 =C2=A02 +-<br>
=C2=A0...on-isn-t-available-in-ARMv5-or-v6-s.patch} |=C2=A0 =C2=A02 +-<br>
=C2=A0...ith-icu-uc-to-fix-build-with-ICU-76.patch} |=C2=A0 =C2=A02 +-<br>
=C2=A0...gc-and-riscv32gc-as-valid-architect.patch} |=C2=A0 38 +++--<br>
=C2=A0.../0013-Fix-build-error-with-musl.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
30 ++++<br>
=C2=A0.../mozjs/<a href=3D"http://mozjs-128_128.5.2.bb" rel=3D"noreferrer" =
target=3D"_blank">mozjs-128_128.5.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 17 +--<br>
=C2=A0...<a href=3D"http://allel_20251022.bb" rel=3D"noreferrer" target=3D"=
_blank">allel_20251022.bb</a> =3D&gt; <a href=3D"http://parallel_20251122.b=
b" rel=3D"noreferrer" target=3D"_blank">parallel_20251122.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://libdecor_0.2.4.bb" rel=3D"noreferrer" target=
=3D"_blank">libdecor_0.2.4.bb</a> =3D&gt; <a href=3D"http://libdecor_0.2.5.=
bb" rel=3D"noreferrer" target=3D"_blank">libdecor_0.2.5.bb</a>}=C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0...-<a href=3D"http://image_3.2.4.bb" rel=3D"noreferrer" target=3D"_b=
lank">image_3.2.4.bb</a> =3D&gt; <a href=3D"http://libsdl3-image_3.2.6.bb" =
rel=3D"noreferrer" target=3D"_blank">libsdl3-image_3.2.6.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://libsdl3_3.2.26.bb" rel=3D"noreferrer" target=
=3D"_blank">libsdl3_3.2.26.bb</a> =3D&gt; <a href=3D"http://libsdl3_3.2.30.=
bb" rel=3D"noreferrer" target=3D"_blank">libsdl3_3.2.30.bb</a>}=C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0...01-decode-fix-build-on-ARMv7-targets.patch |=C2=A0 =C2=A04 +-<br>
=C2=A0...ing-for-non-NEON-enabled-ARM-targets.patch |=C2=A0 73 +++++-----<b=
r>
=C2=A0.../vk-gl-cts/vulkan-cts-sources.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://n-cts_1.4.4.0.bb" rel=3D"noreferrer" target=3D"_=
blank">n-cts_1.4.4.0.bb</a> =3D&gt; <a href=3D"http://vulkan-cts_1.4.4.2.bb=
" rel=3D"noreferrer" target=3D"_blank">vulkan-cts_1.4.4.2.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...8-year-problem-in-timestamp-handling.patch |=C2=A0 55 ++++++++<br>
=C2=A0.../minicoredumper/<a href=3D"http://minicoredumper_2.0.7.bb" rel=3D"=
noreferrer" target=3D"_blank">minicoredumper_2.0.7.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 =C2=A01 +<br>
=C2=A0.../libjxl/<a href=3D"http://libjxl_0.11.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libjxl_0.11.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0.../recipes-security/softhsm/<a href=3D"http://softhsm_2.6.1.bb" rel=
=3D"noreferrer" target=3D"_blank">softhsm_2.6.1.bb</a> |=C2=A0 =C2=A02 +-<b=
r>
=C2=A0.../libcereal/<a href=3D"http://libcereal_1.3.2.bb" rel=3D"noreferrer=
" target=3D"_blank">libcereal_1.3.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../recipes-support/raptor2/<a href=3D"http://raptor2_2.0.16.bb" rel=
=3D"noreferrer" target=3D"_blank">raptor2_2.0.16.bb</a> |=C2=A0 =C2=A02 +<b=
r>
=C2=A0.../recipes-support/smarty/<a href=3D"http://smarty_5.6.0.bb" rel=3D"=
noreferrer" target=3D"_blank">smarty_5.6.0.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0...<a href=3D"http://128.bb" rel=3D"noreferrer" target=3D"_blank">128=
.bb</a> =3D&gt; <a href=3D"http://usb-modeswitch-data_20251207.bb" rel=3D"n=
oreferrer" target=3D"_blank">usb-modeswitch-data_20251207.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../0001-Fix-build-with-gcc-15.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 51 -------<br>
=C2=A0...<a href=3D"http://witch_2.6.1.bb" rel=3D"noreferrer" target=3D"_bl=
ank">witch_2.6.1.bb</a> =3D&gt; <a href=3D"http://usb-modeswitch_2.6.2.bb" =
rel=3D"noreferrer" target=3D"_blank">usb-modeswitch_2.6.2.bb</a>} |=C2=A0 =
=C2=A06 +-<br>
=C2=A0...<a href=3D"http://ers_7.2.2.bb" rel=3D"noreferrer" target=3D"_blan=
k">ers_7.2.2.bb</a> =3D&gt; <a href=3D"http://vboxguestdrivers_7.2.4.bb" re=
l=3D"noreferrer" target=3D"_blank">vboxguestdrivers_7.2.4.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../nginx/files/CVE-2025-53859.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 131 ------------------<br>
=C2=A0meta-webserver/recipes-httpd/nginx/nginx.inc=C2=A0 |=C2=A0 =C2=A02 +<=
br>
=C2=A0.../recipes-httpd/nginx/<a href=3D"http://nginx_1.28.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">nginx_1.28.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A07 -<br>
=C2=A0.../recipes-httpd/nginx/<a href=3D"http://nginx_1.28.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">nginx_1.28.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A07 +<br>
=C2=A062 files changed, 404 insertions(+), 286 deletions(-)<br>
=C2=A0rename meta-networking/recipes-protocols/dante/{<a href=3D"http://dan=
te_1.4.3.bb" rel=3D"noreferrer" target=3D"_blank">dante_1.4.3.bb</a> =3D&gt=
; <a href=3D"http://dante_1.4.4.bb" rel=3D"noreferrer" target=3D"_blank">da=
nte_1.4.4.bb</a>} (88%)<br>
=C2=A0rename meta-networking/recipes-protocols/frr/{<a href=3D"http://frr_1=
0.4.1.bb" rel=3D"noreferrer" target=3D"_blank">frr_10.4.1.bb</a> =3D&gt; <a=
 href=3D"http://frr_10.4.2.bb" rel=3D"noreferrer" target=3D"_blank">frr_10.=
4.2.bb</a>} (99%)<br>
=C2=A0create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snm=
p/CVE-2025-68615.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/tinyproxy/tinyprox=
y/CVE-2025-63938.patch<br>
=C2=A0rename meta-oe/recipes-crypto/cryptsetup/{<a href=3D"http://cryptsetu=
p_2.8.1.bb" rel=3D"noreferrer" target=3D"_blank">cryptsetup_2.8.1.bb</a> =
=3D&gt; <a href=3D"http://cryptsetup_2.8.3.bb" rel=3D"noreferrer" target=3D=
"_blank">cryptsetup_2.8.3.bb</a>} (98%)<br>
=C2=A0create mode 100644 meta-oe/recipes-crypto/libsodium/libsodium/CVE-202=
5-69277.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patc=
h<br>
=C2=A0rename meta-oe/recipes-devtools/microsoft-gsl/{<a href=3D"http://micr=
osoft-gsl_4.2.0.bb" rel=3D"noreferrer" target=3D"_blank">microsoft-gsl_4.2.=
0.bb</a> =3D&gt; <a href=3D"http://microsoft-gsl_4.2.1.bb" rel=3D"noreferre=
r" target=3D"_blank">microsoft-gsl_4.2.1.bb</a>} (93%)<br>
=C2=A0rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_8.4.16.bb"=
 rel=3D"noreferrer" target=3D"_blank">php_8.4.16.bb</a> =3D&gt; <a href=3D"=
http://php_8.4.17.bb" rel=3D"noreferrer" target=3D"_blank">php_8.4.17.bb</a=
>} (99%)<br>
=C2=A0rename meta-oe/recipes-devtools/python/{<a href=3D"http://python3-psy=
copg_3.2.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-psycopg_3.2.12=
.bb</a> =3D&gt; <a href=3D"http://python3-psycopg_3.2.13.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-psycopg_3.2.13.bb</a>} (85%)<br>
=C2=A0rename meta-oe/recipes-extended/liblognorm/{<a href=3D"http://liblogn=
orm_2.0.7.bb" rel=3D"noreferrer" target=3D"_blank">liblognorm_2.0.7.bb</a> =
=3D&gt; <a href=3D"http://liblognorm_2.0.8.bb" rel=3D"noreferrer" target=3D=
"_blank">liblognorm_2.0.8.bb</a>} (95%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/mozjs-128/{riscv32.patch =3D&gt=
; 0005-Add-RISCV32-support.patch} (97%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/mozjs-128/{0001-util.configure-=
fix-one-occasionally-reproduced-confi.patch =3D&gt; 0006-util.configure-fix=
-one-occasionally-reproduced-confi.patch} (96%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/mozjs-128/{0001-rewrite-cargo-h=
ost-linker-in-python3.patch =3D&gt; 0007-Rewrite-cargo-host-linker-in-pytho=
n3.patch} (97%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/mozjs-128/{musl-disable-stackwa=
lk.patch =3D&gt; 0008-Musl-does-not-have-stack-unwinder-like-glibc-therefo.=
patch} (94%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/mozjs-128/{0001-add-arm-to-list=
-of-mozinline.patch =3D&gt; 0009-Backport-patch-from-firefox-bugzilla-to-fi=
x-compile-.patch} (95%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/mozjs-128/{armv5.patch =3D&gt; =
0010-The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.patch} (93%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/mozjs-128/{0001-Link-with-icu-u=
c-to-fix-build-with-ICU-76.patch =3D&gt; 0011-Link-with-icu-uc-to-fix-build=
-with-ICU-76.patch} (92%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/mozjs-128/{riscv.patch =3D&gt; =
0012-Recognise-riscv64gc-and-riscv32gc-as-valid-architect.patch} (60%)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-=
build-error-with-musl.patch<br>
=C2=A0rename meta-oe/recipes-extended/parallel/{<a href=3D"http://parallel_=
20251022.bb" rel=3D"noreferrer" target=3D"_blank">parallel_20251022.bb</a> =
=3D&gt; <a href=3D"http://parallel_20251122.bb" rel=3D"noreferrer" target=
=3D"_blank">parallel_20251122.bb</a>} (93%)<br>
=C2=A0rename meta-oe/recipes-graphics/libdecor/{<a href=3D"http://libdecor_=
0.2.4.bb" rel=3D"noreferrer" target=3D"_blank">libdecor_0.2.4.bb</a> =3D&gt=
; <a href=3D"http://libdecor_0.2.5.bb" rel=3D"noreferrer" target=3D"_blank"=
>libdecor_0.2.5.bb</a>} (94%)<br>
=C2=A0rename meta-oe/recipes-graphics/libsdl3/{<a href=3D"http://libsdl3-im=
age_3.2.4.bb" rel=3D"noreferrer" target=3D"_blank">libsdl3-image_3.2.4.bb</=
a> =3D&gt; <a href=3D"http://libsdl3-image_3.2.6.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libsdl3-image_3.2.6.bb</a>} (87%)<br>
=C2=A0rename meta-oe/recipes-graphics/libsdl3/{<a href=3D"http://libsdl3_3.=
2.26.bb" rel=3D"noreferrer" target=3D"_blank">libsdl3_3.2.26.bb</a> =3D&gt;=
 <a href=3D"http://libsdl3_3.2.30.bb" rel=3D"noreferrer" target=3D"_blank">=
libsdl3_3.2.30.bb</a>} (97%)<br>
=C2=A0rename meta-oe/recipes-graphics/vk-gl-cts/{<a href=3D"http://vulkan-c=
ts_1.4.4.0.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-cts_1.4.4.0.bb</=
a> =3D&gt; <a href=3D"http://vulkan-cts_1.4.4.2.bb" rel=3D"noreferrer" targ=
et=3D"_blank">vulkan-cts_1.4.4.2.bb</a>} (94%)<br>
=C2=A0create mode 100644 meta-oe/recipes-kernel/minicoredumper/files/0002-F=
ix-2038-year-problem-in-timestamp-handling.patch<br>
=C2=A0rename meta-oe/recipes-support/usb-modeswitch/{<a href=3D"http://usb-=
modeswitch-data_20191128.bb" rel=3D"noreferrer" target=3D"_blank">usb-modes=
witch-data_20191128.bb</a> =3D&gt; <a href=3D"http://usb-modeswitch-data_20=
251207.bb" rel=3D"noreferrer" target=3D"_blank">usb-modeswitch-data_2025120=
7.bb</a>} (84%)<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswi=
tch/0001-Fix-build-with-gcc-15.patch<br>
=C2=A0rename meta-oe/recipes-support/usb-modeswitch/{<a href=3D"http://usb-=
modeswitch_2.6.1.bb" rel=3D"noreferrer" target=3D"_blank">usb-modeswitch_2.=
6.1.bb</a> =3D&gt; <a href=3D"http://usb-modeswitch_2.6.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">usb-modeswitch_2.6.2.bb</a>} (86%)<br>
=C2=A0rename meta-oe/recipes-support/vboxguestdrivers/{<a href=3D"http://vb=
oxguestdrivers_7.2.2.bb" rel=3D"noreferrer" target=3D"_blank">vboxguestdriv=
ers_7.2.2.bb</a> =3D&gt; <a href=3D"http://vboxguestdrivers_7.2.4.bb" rel=
=3D"noreferrer" target=3D"_blank">vboxguestdrivers_7.2.4.bb</a>} (97%)<br>
=C2=A0delete mode 100755 meta-webserver/recipes-httpd/nginx/files/CVE-2025-=
53859.patch<br>
=C2=A0delete mode 100644 meta-webserver/recipes-httpd/nginx/<a href=3D"http=
://nginx_1.28.0.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.28.0.bb</a=
><br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/<a href=3D"http=
://nginx_1.28.1.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.28.1.bb</a=
><br>
<br>
-- <br>
2.52.0<br>
<br>
</blockquote></div>

--000000000000bfd17e064943bda9--

