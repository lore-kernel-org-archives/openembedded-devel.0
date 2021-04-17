Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web09.3679.1618694279692548770
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h6NdENG0;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id p12so21552272pgj.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=vXmACUW78uD+aaOUYlvLJgLmF84b2Y/7l89xiHy9Z1c=;
        b=h6NdENG0bVQ8CkydsdskBLA3DBNBtzmxU0an1N+SslFoChheBmN9kibqUZ26xYNuP1
         92Ma+5RoScfSrkahW99esLEtUdOZoNitj8peyZyTm3nMeS5p0BaqJWw7lW1C37m7mIpi
         DqkFUbdPrmpfjgLWC0HSYylJ+UcL2pF2t+55S5DzfyrkcdCi2EAdPYGaRtAAoYDQ4kmq
         ji34hFNLtDZbtGN5vlu9dwghxA1f447OFJ8anbWRAs1Sn3wVN13AWRLczMyeEuXQlEKa
         +1wN52lNYu5YXFpfkxLNMGRNkI89F8E0tXrH8inGdEkDXzQCvANPWD/Sb43Ow3youlcL
         ZdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=vXmACUW78uD+aaOUYlvLJgLmF84b2Y/7l89xiHy9Z1c=;
        b=nBM1Ac61anNv8ntigRyLAaLMnLCe88h+msJ29pBIzPPGRWI83nMmMiF0XIdHAck5jg
         N5F0wo5GiYHcismgb/EU+kXDQ7sXa3B3McrDdi6YPUvrJwn8xFb3YZhegxQu7HWc+xiS
         HU0CI1e50phbRTgbXISG9z7eYXYVrvDwgG9uCbobcjLjwsIMyAyH6x7leIx9MV45RdJv
         AWeqkJ8dvWjhehuWlB0fupFkMpCX21ZzDDkp4QsdlWxaxo5qJ2qV7Tv+0RiR8uyVQdwg
         VBzaLVdNq0W6Mv34puu4y89jTP/ZtKr92SpTrFIxM2jEi5GJwuUZ+kUqVRtZ0geEstdU
         TUeg==
X-Gm-Message-State: AOAM533U6NUoCQ/acChXBU1CcocfH1rEDlAZ9T3qcMXfMp/l+UcrEm4t
	Qyc/3iCMU2y1X95h/5eNAtHPlc0c89SsjA==
X-Google-Smtp-Source: ABdhPJymNIUK70BwQwjtw+sbvtxOmwzAFTBfaZyjXmlTfy5oVmo6CB4VXD0OZiJc3aOS1kVed6ePFw==
X-Received: by 2002:a63:d841:: with SMTP id k1mr4876415pgj.440.1618694278651;
        Sat, 17 Apr 2021 14:17:58 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57? ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id 18sm8063816pfu.190.2021.04.17.14.17.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Apr 2021 14:17:58 -0700 (PDT)
Subject: Re: [oe] [hardnott 00/50] Patch review April 17th
To: openembedded-devel@lists.openembedded.org
References: <1676C13A37D7C882.13105@lists.openembedded.org>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <8c9ba754-6696-c955-33e9-c94f3694724e@gmail.com>
Date: Sat, 17 Apr 2021 14:17:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1676C13A37D7C882.13105@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

FYI.

One of these patches has one line that exceeded 998 characters so for
the OE tool to send this series broke. I had to modify the commit
message for the offending patch just so I can send this Review request.=C2=
=
=A0
This is the second time I had to do this.=C2=A0

ERROR::::=C2=A0=C2=A0=C2=A0 scripts/send-pull-request produces is like :
patch contains a line longer than 998 characters
and it stops

Please be aware of the patches being sent to the mailing list.=C2=A0

-armin

On 4/17/21 2:05 PM, Armin Kuster via lists.openembedded.org wrote:
> This technically sync's up to current master.
> Please review and have feedback back by Monday.
>
>
> The following changes since commit 94fe80ce8609d62e51cc190595a9f0c2a4a5a=
89e:
>
>   xterm: upgrade 366 -> 367 (2021-04-08 13:13:29 -0700)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded-contrib stable/hardknott-=
nut
>   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable=
/hardknott-nut
>
> Andreas M=C3=BCller (2):
>   catfish: add python3-dbus to RDEPENDS
>   fluidsynth: upgrade 2.1.7 -> 2.2.0
>
> Hongxu Jia (1):
>   debootstrap: 1.0.67 -> 1.0.123
>
> Kamil Dziezyk (1):
>   bats: upgrade 1.1.0 -> 1.3.0
>
> Khem Raj (4):
>   tbb: Fix build with musl
>   core-image-minimal-xfce: Use graphical.target as default
>   vnstat: Disable install parallism to fix a potential install race
>   open-vm-tools: Fix build with gcc 11
>
> Leon Anavi (23):
>   python3-ruamel-yaml: Upgrade 0.17.2 -> 0.17.4
>   python3-croniter: Upgrade 1.0.10 -> 1.0.11
>   python3-decorator: Upgrade 5.0.5 -> 5.0.6
>   python3-grpcio-tools: Upgrade 1.36.1 -> 1.37.0
>   python3-speedtest-cli: Upgrade 2.1.2 -> 2.1.3
>   python3-python-vlc: Upgrade 3.0.11115 -> 3.0.12117
>   python3-robotframework: Upgrade 4.0 -> 4.0.1
>   python3-grpcio: Upgrade 1.36.1 -> 1.37.0
>   python3-cerberus: Upgrade 1.3.2 -> 1.3.3
>   python3-humanize: Upgrade 3.3.0 -> 3.4.0
>   python3-monotonic: Upgrade 1.5 -> 1.6
>   python3-sqlalchemy: Upgrade 1.4.6 -> 1.4.7
>   python3-typed-ast: Upgrade 1.4.2 -> 1.4.3
>   python3-backports-functools-lru-cache: Upgrade 1.6.3 -> 1.6.4
>   python3-xmlschema: Upgrade 1.6.0 -> 1.6.1
>   python3-pyroute2: Upgrade 0.5.17 -> 0.5.18
>   python3-sympy: Upgrade 1.7.1 -> 1.8
>   python3-pandas: Upgrade 1.2.3 -> 1.2.4
>   python3-humanize: Upgrade 3.4.0 -> 3.4.1
>   python3-decorator: Upgrade 5.0.6 -> 5.0.7
>   python3-colorlog: Upgrade 4.8.0 -> 5.0.1
>   python3-google-api-python-client: Upgrade 2.1.0 -> 2.2.0
>   python3-croniter: Upgrade 1.0.11 -> 1.0.12
>
> Martin Jansa (2):
>   opencv: fetch wechat_qrcode files used by dnn PACKAGECONFIG
>   opencv: link sfm module with Glog
>
> Naveen Saini (2):
>   tbb: upgrade 2020.3 -> 2021.2.0
>   ocl-icd: upgrade 2.2.14 -> 2.3.0
>
> Randy MacLeod (1):
>   open-vm-tools: upgrade 11.0.1 -> 11.2.5
>
> Ross Burton (1):
>   fwts: upgrade to 21.03.00
>
> Stefan Ghinea (1):
>   hostapd: fix CVE-2021-30004
>
> Vin=C3=ADcius Ossanes Aquino (2):
>   modemmanager: upgrade 1.14.10 -> 1.16.2
>   libqmi: upgrade 1.26.6 -> 1.28.2
>
> Yi Fan Yu (1):
>   redis: upgrade 6.0.9 -> 6.2.1
>
> persianpros (5):
>   PEP8 double aggressive E701, E70 and E502
>   PEP8 double aggressive E20 and E211
>   PEP8 double aggressive E22, E224, E241, E242 and E27
>   PEP8 double aggressive E301 ~ E306
>   PEP8 double aggressive W291 ~ W293 and W391
>
> wangmy (1):
>   uftrace: Fix error on aarch64 when binutils update to 2.35.1
>
> zhengruoqin (3):
>   python3-absl: upgrade 0.10.0 -> 0.12.0
>   python3-astroid: upgrade 2.5.2 -> 2.5.3
>   python3-bitarray: upgrade 1.9.1 -> 1.9.2
>
>  contrib/oe-stylize.py                         | 121 ++-
>  .../fluidsynth/fluidsynth.inc                 |   4 +-
>  ...te_float-Allow-zero-pointer-for-left.patch |  26 +-
>  ...-Add-resolv_compat.h-for-musl-builds.patch |  72 ++
>  ....-Remove-references-to-deprecated-G_.patch |  94 ---
>  ...0001-pollGtk-Drop-volatile-qualifier.patch |  32 -
>  ...latile-qualifier-exposed-incorrectly.patch |  29 +
>  ...1-utilBacktrace-Ignore-Warray-bounds.patch |  33 -
>  .../0002-add-include-sys-sysmacros.h.patch    |  30 -
>  ...ux-Consider-64bit-time_t-possibility.patch |  42 +-
>  ...-test-for-feature-instead-of-platfor.patch |  24 +-
>  .../0009-Rename-poll.h-to-vm_poll.h.patch     | 726 ++----------------
>  ...11-Use-uintmax_t-for-handling-rlim_t.patch |  25 +-
>  ...ools_11.0.1.bb =3D> open-vm-tools_11.2.5.bb} |  14 +-
>  .../recipes-support/vnstat/vnstat_2.6.bb      |   2 +
>  .../oeqa/selftest/cases/meta_oe_sources.py    |   1 +
>  .../hostapd/hostapd/CVE-2021-30004.patch      | 123 +++
>  .../hostapd/hostapd_2.9.bb                    |   1 +
>  .../{libqmi_1.26.6.bb =3D> libqmi_1.28.2.bb}    |   2 +-
>  ...ager_1.14.10.bb =3D> modemmanager_1.16.2.bb} |   2 +-
>  .../{ocl-icd_git.bb =3D> ocl-icd_2.3.0.bb}      |   3 +-
>  ...t-to-override-usr-sbin-and-usr-share.patch |  41 +
>  ...upport-to-override-usr-bin-arch-test.patch |  47 ++
>  .../debootstrap/debootstrap/devices.tar.gz    | Bin 767 -> 0 bytes
>  .../debootstrap/debootstrap_1.0.123.bb        |  23 +
>  .../debootstrap/debootstrap_1.0.67.bb         |  35 -
>  ...error-on-aarch64-with-binutils2.35.1.patch |  27 +
>  .../recipes-devtools/uftrace/uftrace_0.9.4.bb |   1 +
>  ...06-Define-correct-gregs-for-RISCV32.patch} |  26 +-
>  .../recipes-extended/redis/redis/ilp32.patch  |  29 -
>  ...ile-to-use-environment-build-setting.patch |  66 +-
>  .../redis/redis/oe-use-libc-malloc.patch      |  12 +-
>  .../redis/{redis_6.0.9.bb =3D> redis_6.2.1.bb}  |   5 +-
>  .../opencv/0001-sfm-link-with-Glog_LIBS.patch |  44 ++
>  .../recipes-support/opencv/opencv_4.5.2.bb    |   5 +
>  ...akeLists.txt-exclude-riscv64-riscv32.patch |  42 +
>  ...1-Disable-use-of-_tpause-instruction.patch |  34 +
>  ...nfo-is-glibc-specific-API-mark-it-so.patch |  27 +-
>  .../GLIBC-PREREQ-is-not-defined-on-musl.patch |  22 +-
>  .../tbb/tbb/cross-compile.patch               |  35 -
>  .../tbb/tbb/improve-reproducibility.patch     |  30 -
>  meta-oe/recipes-support/tbb/tbb/tbb.pc        |  11 -
>  .../tbb/{tbb_2020.3.bb =3D> tbb_2021.2.0.bb}    |  53 +-
>  .../bats/{bats_1.1.0.bb =3D> bats_1.3.0.bb}     |  10 +-
>  ...d-correct-printf-qualifier-for-off_t.patch |  20 +-
>  ....h-instead-of-deprecated-sys-poll.h.patch} |  12 +-
>  ...ch =3D> 0003-Remove-Werror-from-build.patch} |  18 +-
>  ...__SWORD_TYPE-if-not-defined-by-libc.patch} |  12 +-
>  ...ZE.patch =3D> 0005-Undefine-PAGE_SIZE.patch} |  10 +-
>  ...t-to-fix-pointer-to-int-cast-issues.patch} |  37 +-
>  .../{fwts_20.07.00.bb =3D> fwts_21.03.00.bb}    |  18 +-
>  ...-absl_0.10.0.bb =3D> python3-absl_0.12.0.bb} |   4 +-
>  ...roid_2.5.2.bb =3D> python3-astroid_2.5.3.bb} |   2 +-
>  ...n3-backports-functools-lru-cache_1.6.4.bb} |   2 +-
>  ...ray_1.9.1.bb =3D> python3-bitarray_1.9.2.bb} |   2 +-
>  ...rus_1.3.2.bb =3D> python3-cerberus_1.3.3.bb} |  14 +-
>  ...log_4.8.0.bb =3D> python3-colorlog_5.0.1.bb} |   4 +-
>  ...r_1.0.10.bb =3D> python3-croniter_1.0.12.bb} |   2 +-
>  ...or_5.0.5.bb =3D> python3-decorator_5.0.7.bb} |   2 +-
>  ...python3-google-api-python-client_2.2.0.bb} |   2 +-
>  ...36.1.bb =3D> python3-grpcio-tools_1.37.0.bb} |   2 +-
>  .../python/python3-grpcio/boring_ssl.patch    |  50 +-
>  ...cio_1.36.1.bb =3D> python3-grpcio_1.37.0.bb} |   2 +-
>  ...ize_3.3.0.bb =3D> python3-humanize_3.4.1.bb} |   3 +-
>  ...otonic_1.5.bb =3D> python3-monotonic_1.6.bb} |  10 +-
>  ...andas_1.2.3.bb =3D> python3-pandas_1.2.4.bb} |   2 +-
>  ...2_0.5.17.bb =3D> python3-pyroute2_0.5.18.bb} |   2 +-
>  ...115.bb =3D> python3-python-vlc_3.0.12117.bb} |   3 +-
>  ...4.0.bb =3D> python3-robotframework_4.0.1.bb} |   2 +-
>  ....17.2.bb =3D> python3-ruamel-yaml_0.17.4.bb} |   2 +-
>  ....1.2.bb =3D> python3-speedtest-cli_2.1.3.bb} |   3 +-
>  ...y_1.4.6.bb =3D> python3-sqlalchemy_1.4.7.bb} |   2 +-
>  ...n3-sympy_1.7.1.bb =3D> python3-sympy_1.8.bb} |   4 +-
>  ...st_1.4.2.bb =3D> python3-typed-ast_1.4.3.bb} |   2 +-
>  ...ma_1.6.0.bb =3D> python3-xmlschema_1.6.1.bb} |   2 +-
>  .../recipes-apps/catfish/catfish_4.16.0.bb    |   2 +-
>  .../images/core-image-minimal-xfce.bb         |   2 +
>  77 files changed, 969 insertions(+), 1318 deletions(-)
>  create mode 100644 meta-networking/recipes-support/open-vm-tools/open-v=
m-tools/0001-Add-resolv_compat.h-for-musl-builds.patch
>  delete mode 100644 meta-networking/recipes-support/open-vm-tools/open-v=
m-tools/0001-GitHub-Issue-367.-Remove-references-to-deprecated-G_.patch
>  delete mode 100644 meta-networking/recipes-support/open-vm-tools/open-v=
m-tools/0001-pollGtk-Drop-volatile-qualifier.patch
>  create mode 100644 meta-networking/recipes-support/open-vm-tools/open-v=
m-tools/0001-pollGtk-Fix-volatile-qualifier-exposed-incorrectly.patch
>  delete mode 100644 meta-networking/recipes-support/open-vm-tools/open-v=
m-tools/0001-utilBacktrace-Ignore-Warray-bounds.patch
>  delete mode 100644 meta-networking/recipes-support/open-vm-tools/open-v=
m-tools/0002-add-include-sys-sysmacros.h.patch
>  rename meta-networking/recipes-support/open-vm-tools/{open-vm-tools_11.=
0.1.bb =3D> open-vm-tools_11.2.5.bb} (91%)
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-202=
1-30004.patch
>  rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.26.6.bb =3D> libqm=
i_1.28.2.bb} (90%)
>  rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.14.10.=
bb =3D> modemmanager_1.16.2.bb} (95%)
>  rename meta-oe/recipes-core/opencl/{ocl-icd_git.bb =3D> ocl-icd_2.3.0.b=
b} (84%)
>  create mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap/000=
1-support-to-override-usr-sbin-and-usr-share.patch
>  create mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap/000=
2-support-to-override-usr-bin-arch-test.patch
>  delete mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap/dev=
ices.tar.gz
>  create mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap_1.0=
.123.bb
>  delete mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap_1.0=
.67.bb
>  create mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-er=
ror-on-aarch64-with-binutils2.35.1.patch
>  rename meta-oe/recipes-extended/redis/redis/{riscv32.patch =3D> 0006-De=
fine-correct-gregs-for-RISCV32.patch} (61%)
>  delete mode 100644 meta-oe/recipes-extended/redis/redis/ilp32.patch
>  rename meta-oe/recipes-extended/redis/{redis_6.0.9.bb =3D> redis_6.2.1.=
bb} (93%)
>  create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-sfm-link-=
with-Glog_LIBS.patch
>  create mode 100644 meta-oe/recipes-support/tbb/tbb/0001-CMakeLists.txt-=
exclude-riscv64-riscv32.patch
>  create mode 100644 meta-oe/recipes-support/tbb/tbb/0001-Disable-use-of-=
_tpause-instruction.patch
>  delete mode 100644 meta-oe/recipes-support/tbb/tbb/cross-compile.patch
>  delete mode 100644 meta-oe/recipes-support/tbb/tbb/improve-reproducibil=
ity.patch
>  delete mode 100644 meta-oe/recipes-support/tbb/tbb/tbb.pc
>  rename meta-oe/recipes-support/tbb/{tbb_2020.3.bb =3D> tbb_2021.2.0.bb}=
 (59%)
>  rename meta-oe/recipes-test/bats/{bats_1.1.0.bb =3D> bats_1.3.0.bb} (75=
%)
>  rename meta-oe/recipes-test/fwts/fwts/{0001-Include-poll.h-instead-of-d=
eprecated-sys-poll.h.patch =3D> 0002-Include-poll.h-instead-of-deprecated-s=
ys-poll.h.patch} (81%)
>  rename meta-oe/recipes-test/fwts/fwts/{0001-Remove-Werror-from-build.pa=
tch =3D> 0003-Remove-Werror-from-build.patch} (74%)
>  rename meta-oe/recipes-test/fwts/fwts/{0002-Define-__SWORD_TYPE-if-not-=
defined-by-libc.patch =3D> 0004-Define-__SWORD_TYPE-if-not-defined-by-libc.=
patch} (79%)
>  rename meta-oe/recipes-test/fwts/fwts/{0003-Undefine-PAGE_SIZE.patch =
=3D> 0005-Undefine-PAGE_SIZE.patch} (83%)
>  rename meta-oe/recipes-test/fwts/fwts/{0003-use-intptr_t-to-fix-pointer=
-to-int-cast-issues.patch =3D> 0006-use-intptr_t-to-fix-pointer-to-int-cast=
-issues.patch} (64%)
>  rename meta-oe/recipes-test/fwts/{fwts_20.07.00.bb =3D> fwts_21.03.00.b=
b} (65%)
>  rename meta-python/recipes-devtools/python/{python3-absl_0.10.0.bb =3D>=
 python3-absl_0.12.0.bb} (67%)
>  rename meta-python/recipes-devtools/python/{python3-astroid_2.5.2.bb =
=3D> python3-astroid_2.5.3.bb} (89%)
>  rename meta-python/recipes-devtools/python/{python3-backports-functools=
-lru-cache_1.6.3.bb =3D> python3-backports-functools-lru-cache_1.6.4.bb} (8=
8%)
>  rename meta-python/recipes-devtools/python/{python3-bitarray_1.9.1.bb =
=3D> python3-bitarray_1.9.2.bb} (77%)
>  rename meta-python/recipes-devtools/python/{python3-cerberus_1.3.2.bb =
=3D> python3-cerberus_1.3.3.bb} (66%)
>  rename meta-python/recipes-devtools/python/{python3-colorlog_4.8.0.bb =
=3D> python3-colorlog_5.0.1.bb} (54%)
>  rename meta-python/recipes-devtools/python/{python3-croniter_1.0.10.bb =
=
=3D> python3-croniter_1.0.12.bb} (78%)
>  rename meta-python/recipes-devtools/python/{python3-decorator_5.0.5.bb =
=
=3D> python3-decorator_5.0.7.bb} (86%)
>  rename meta-python/recipes-devtools/python/{python3-google-api-python-c=
lient_2.1.0.bb =3D> python3-google-api-python-client_2.2.0.bb} (78%)
>  rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.36.1=
.bb =3D> python3-grpcio-tools_1.37.0.bb} (85%)
>  rename meta-python/recipes-devtools/python/{python3-grpcio_1.36.1.bb =
=3D> python3-grpcio_1.37.0.bb} (94%)
>  rename meta-python/recipes-devtools/python/{python3-humanize_3.3.0.bb =
=3D> python3-humanize_3.4.1.bb} (75%)
>  rename meta-python/recipes-devtools/python/{python3-monotonic_1.5.bb =
=3D> python3-monotonic_1.6.bb} (63%)
>  rename meta-python/recipes-devtools/python/{python3-pandas_1.2.3.bb =3D=
> python3-pandas_1.2.4.bb} (88%)
>  rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.17.bb =
=
=3D> python3-pyroute2_0.5.18.bb} (90%)
>  rename meta-python/recipes-devtools/python/{python3-python-vlc_3.0.1111=
5.bb =3D> python3-python-vlc_3.0.12117.bb} (65%)
>  rename meta-python/recipes-devtools/python/{python3-robotframework_4.0.=
bb =3D> python3-robotframework_4.0.1.bb} (91%)
>  rename meta-python/recipes-devtools/python/{python3-ruamel-yaml_0.17.2.=
bb =3D> python3-ruamel-yaml_0.17.4.bb} (83%)
>  rename meta-python/recipes-devtools/python/{python3-speedtest-cli_2.1.2=
.bb =3D> python3-speedtest-cli_2.1.3.bb} (67%)
>  rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.6.bb=
 =3D> python3-sqlalchemy_1.4.7.bb} (85%)
>  rename meta-python/recipes-devtools/python/{python3-sympy_1.7.1.bb =3D>=
 python3-sympy_1.8.bb} (68%)
>  rename meta-python/recipes-devtools/python/{python3-typed-ast_1.4.2.bb =
=
=3D> python3-typed-ast_1.4.3.bb} (78%)
>  rename meta-python/recipes-devtools/python/{python3-xmlschema_1.6.0.bb =
=
=3D> python3-xmlschema_1.6.1.bb} (83%)
>
>
>=20
>


