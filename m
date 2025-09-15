Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726F3CA101F
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 05:01:04 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.web10.25268.1757912462344314177
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Sep 2025 22:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pzi0fpGR;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6296f6ce5f1so1325882d50.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Sep 2025 22:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757912461; x=1758517261; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjGRM16IDZRgXCFIEK5pLdltaZHaHMISr9uJVzhb7Kc=;
        b=Pzi0fpGRyNloafqa5VYQzF00ZorB/6GFtC8a0hp135EnCEpklNcxHaifbuGd8RVVpw
         5rXiRpfdRcPYhKrqO3bcEqyzcHSDbP8LbtvOwT5Q0Qg12dx8JDme/NE/vo6oXsi/OoQJ
         d/Ms0Ft7xDl4XdwjCOWZwNCDyHgBdtjockD5/vEOg9TQI/VBw1umt3awF74ntEMgKjyt
         rkbZ8Urzoy8HyBgo0Q/KPQLGX8RFRj8VVyADadpYIO0b8yqHooCyFAPTD5y7S1dwlot3
         uT+fYHfoyV8NBGswk2FrAJzoIEfutosrKVQ1KH6WN+dBd6OSTGClFs0XdU2EKT+YdQEV
         uOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757912461; x=1758517261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjGRM16IDZRgXCFIEK5pLdltaZHaHMISr9uJVzhb7Kc=;
        b=GIX206NQ6LG1Pc8Kxgc8dxPmce9kvn+ESS9DxJaQuvcftl3/VNmA+S2jJRyYRrY11k
         6cKfAQRtSUdTglObFVNQZAGBYOVG0rxhmhPAG0dscl0iL7N5UURu4B5N43EbuwXq2oDv
         oKEZsJo3WtlwqGslVE2aSFnr3CkRiNvAfExluz9HM2gnuec94JQErS+IBdT6dQH4vFU1
         3K7estaUePlq6QQ6vJc1LYAM8jKuqdsuY7hCX8zC5x8oT4Le7cjO8DhmZccNLmrI4ziy
         ZbaPv2O3sky8WaozdxLXPU2k4AxNAP6J9x27fSjCgzfkqUb6viF4XSUW39Xkbu1VBqvY
         +f5Q==
X-Gm-Message-State: AOJu0YySBG1mShJA7i7ZKnmg2lFLwc8Kj4WYFpQtXDRyrMTDfyLLa6/Z
	WfTnIdKZlcMFFLo3nKFp2jTapp9CKEiqsS0VVZHTm2OzGaTw3LEeCxdxjEwuY27HpI4eL/BWZRw
	lPdyxRyit1+NztLQ+HnhRiYW/SQiW7SU=
X-Gm-Gg: ASbGncs0p144c8B1pCLOtAA6VdT9r1lJmecR7H//4XlHXDraBX706nIDdwEO9f8aCb7
	nJTVekIQuTV4XIkx+qQmoUrHx7nwqpstPyjx2SC17HL4ucdUbLr1RuhDUcFzE07YWwa1RYRmUD9
	n68EGDc14YyBCromJyJ+i0hjtpitH5YqFS+RI84dHxkUeB2pxw3+LHNLuLLfN1g+ZETsA2eyZ97
	NxuVlzn1muk5o44QhKVpaDdK0xvhtvQM4sHzTB0hHyqNb9ON3j6J/vPX3CG1dLxGtXG4XZgh0hR
	J3X/WSnATib2B88WmeVAu4MPg+qE53JVchoqFvIRcxnUiD2u95/3CgC0fg==
X-Google-Smtp-Source: AGHT+IFc2ztEfWXSw+UIrS2OL4Q4LybkVZhrdsGNGNE8m3Hcwef813mNSWXCuAlr6TYYmbcGR8lI3Xy+9kR/zlD9KMM=
X-Received: by 2002:a05:690e:2361:b0:5fc:992:6206 with SMTP id
 956f58d0204a3-627237d480bmr7017614d50.29.1757912461221; Sun, 14 Sep 2025
 22:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1757666820.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1757666820.git.anuj.mittal@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Sep 2025 22:00:35 -0700
X-Gm-Features: Ac12FXxvdChpKm8eOHDZcf-MDYqZORpFnhfLXlmusdJZeSOtIjuVV8BvTRD59PQ
Message-ID: <CAMKF1sr1MnqxbmbkAf98jsz8QLLckW8GRV4M_NHJEYr-fjVVsw@mail.gmail.com>
Subject: Re: [scarthgap][PATCH 00/24] Scarthgap pull request
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Sep 2025 05:01:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119402

Merged now, Thanks Anuj

On Fri, Sep 12, 2025 at 2:06=E2=80=AFAM Anuj Mittal <anuj.mittal@intel.com>=
 wrote:
>
> Please merge these changes. Tested using qemux86-64 and qemuarm64.
>
> The following changes since commit c29a18fa39ede952f3f6108ec007c1906e2d9a=
0d:
>
>   mbedtls: drop tag parameter from SRC_URI. (2025-08-18 08:35:05 -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>   https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/s=
carthgap
>
> Alexandre Truong (1):
>   hunspell-dictionaries: switch branch from master to main
>
> Changqing Li (1):
>   luajit: fix several CVEs
>
> Deepak Rathore (1):
>   protobuf 4.25.8: Mark CVE-2024-7254 as patched
>
> Gyorgy Sarvari (1):
>   poppler: fix typos in CVE-2025-52886-0001.patch
>
> Hitendra Prajapati (1):
>   libssh: fix CVE-2025-4877
>
> Jan Vermaete (1):
>   python3-werkzeug: added python3-difflib as RDEPENDS
>
> Jiaying Song (1):
>   v4l-utils: Fix QA and build errors related to _TIME_BITS on 32-bit
>
> Martin Jansa (1):
>   abseil-cpp: fix build with gcc-15 on host
>
> Martin Schwan (1):
>   linuxptp: Add systemd instance specifier for ptp4l dependency
>
> Michael Opdenacker (1):
>   kernel-hardening-checker: backport recipe
>
> Peter Marko (1):
>   nginx: patch CVE-2025-53859
>
> Praveen Kumar (1):
>   php: upgrade 8.2.28 -> 8.2.29
>
> Randolph Sapp (1):
>   vulkan-cts: allow vulkan versions > 1.3
>
> Roland Kovacs (1):
>   jq: add Upstream-Status and CVE tags into .patch files
>
> Yogita Urade (2):
>   poppler: fix CVE-2025-50420
>   postgresql: upgrade 16.9 -> 16.10
>
> Zhang Peng (8):
>   gnuplot: fix CVE-2025-3359
>   gnuplot: fix CVE-2025-31176
>   gnuplot: fix CVE-2025-31177
>   gnuplot: fix CVE-2025-31178
>   gnuplot: fix CVE-2025-31179
>   gnuplot: fix CVE-2025-31180
>   gnuplot: fix CVE-2025-31181
>   iperf3: fix CVE-2025-54349
>
>  .../iperf3/iperf3/CVE-2025-54349.patch        |  97 +++++++++++
>  .../recipes-benchmark/iperf3/iperf3_3.18.bb   |   1 +
>  .../linuxptp/systemd/phc2sys@.service.in      |   4 +-
>  ...c-bypass-autoconf-2.69-version-check.patch |   4 +-
>  ...postgresql_16.9.bb =3D> postgresql_16.10.bb} |   4 +-
>  ...r-internal-Explicitly-include-cstdin.patch |  34 ++++
>  .../abseil-cpp/abseil-cpp_20240116.3.bb       |   1 +
>  .../jq/jq/CVE-2024-23337.patch                |   3 +
>  .../jq/jq/CVE-2024-53427.patch                |   3 +
>  .../jq/jq/CVE-2025-48060.patch                |   3 +
>  .../luajit/luajit/CVE-2024-25176.patch        |  32 ++++
>  .../luajit/luajit/CVE-2024-25177.patch        |  47 +++++
>  .../luajit/luajit/CVE-2024-25178.patch        | 162 ++++++++++++++++++
>  meta-oe/recipes-devtools/luajit/luajit_git.bb |   3 +
>  .../php/{php_8.2.28.bb =3D> php_8.2.29.bb}      |   2 +-
>  .../protobuf/protobuf_4.25.8.bb               |   2 +
>  .../gnuplot/gnuplot/CVE-2025-31176.patch      |  86 ++++++++++
>  .../gnuplot/gnuplot/CVE-2025-31177.patch      |  40 +++++
>  .../gnuplot/gnuplot/CVE-2025-31178.patch      |  95 ++++++++++
>  .../gnuplot/gnuplot/CVE-2025-31179.patch      |  35 ++++
>  .../gnuplot/gnuplot/CVE-2025-31180.patch      |  43 +++++
>  .../gnuplot/gnuplot/CVE-2025-31181.patch      |  43 +++++
>  .../gnuplot/gnuplot/CVE-2025-3359.patch       |  67 ++++++++
>  .../recipes-extended/gnuplot/gnuplot_5.4.3.bb |   7 +
>  ...e-CTS-with-unknown-versions-of-Vulka.patch |  41 +++++
>  .../vk-gl-cts/vulkan-cts_1.3.7.3.bb           |   1 +
>  ...on.build-fix-arm-_TIME_BITS-64-error.patch |  38 ++++
>  .../v4l2apps/v4l-utils_1.26.1.bb              |   5 +-
>  ...ject.toml-fix-up-license-information.patch |  31 ++++
>  ...-relax-setuptool-version-requirement.patch |  29 ++++
>  .../kernel-hardening-checker_0.6.10.2.bb      |  41 +++++
>  .../hunspell/hunspell-dictionaries.bb         |   2 +-
>  .../libssh/libssh/CVE-2025-4877.patch         |  57 ++++++
>  .../recipes-support/libssh/libssh_0.10.6.bb   |   1 +
>  .../poppler/poppler/CVE-2025-50420.patch      |  38 ++++
>  .../poppler/poppler/CVE-2025-52886-0001.patch | 144 ++++++++--------
>  .../poppler/poppler_23.04.0.bb                |   1 +
>  .../python/python3-werkzeug_3.0.6.bb          |   1 +
>  .../nginx/files/CVE-2025-53859.patch          | 131 ++++++++++++++
>  meta-webserver/recipes-httpd/nginx/nginx.inc  |   1 +
>  40 files changed, 1293 insertions(+), 87 deletions(-)
>  create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-5434=
9.patch
>  rename meta-oe/recipes-dbs/postgresql/{postgresql_16.9.bb =3D> postgresq=
l_16.10.bb} (75%)
>  create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-P=
R-1739-container-internal-Explicitly-include-cstdin.patch
>  create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25176=
.patch
>  create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25177=
.patch
>  create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25178=
.patch
>  rename meta-oe/recipes-devtools/php/{php_8.2.28.bb =3D> php_8.2.29.bb} (=
99%)
>  create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-311=
76.patch
>  create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-311=
77.patch
>  create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-311=
78.patch
>  create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-311=
79.patch
>  create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-311=
80.patch
>  create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-311=
81.patch
>  create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-335=
9.patch
>  create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts/0001-Al=
low-running-the-CTS-with-unknown-versions-of-Vulka.patch
>  create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-me=
son.build-fix-arm-_TIME_BITS-64-error.patch
>  create mode 100644 meta-oe/recipes-security/kernel-hardening-checker/fil=
es/0001-pyproject.toml-fix-up-license-information.patch
>  create mode 100644 meta-oe/recipes-security/kernel-hardening-checker/fil=
es/0002-pyproject.toml-relax-setuptool-version-requirement.patch
>  create mode 100644 meta-oe/recipes-security/kernel-hardening-checker/ker=
nel-hardening-checker_0.6.10.2.bb
>  create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-4877.p=
atch
>  create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-5042=
0.patch
>  create mode 100755 meta-webserver/recipes-httpd/nginx/files/CVE-2025-538=
59.patch
>

