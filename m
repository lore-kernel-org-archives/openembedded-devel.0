Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48513.1795411831429810330
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=p/aTIQb3;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-386ab9ab619so1496049eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411831; x=1796016631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UdhGnR2UELt/wxMaO1jrZ4Rwb6d7tz8JkpO/Z93uXrM=;
        b=p/aTIQb3meiB/MkjIT4nIKX4ep/eCk1NuwEnPerN6sSWLnWAn7KtD1Hj6R2ZRxrAzN
         fpXTHj0R3Os3GcfwHUp5aB/FArpgwW3enNpY30pRgjkd4Vh9iQwxAkfzZ2QwFBIX8tvX
         3+vXNGOH+LpPiyvlOUVL7BGGkxzY/IaDXgzVlmb0BHXKtqsGy0AV1lCqBx//1HCWpvjQ
         BV0WpWIZljalPYtqcOaUfgMxgCQCEpnsS42ZVTy7ZSSP0/sAKbYKwh4ZkRoJtJaPdOwc
         8JpeqCp9XdjhN+JmdqCA0BWI+/Of5gKK4C64KLMFZhwqshzgJlTqb8hxNvYWqm0wNChZ
         li+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411831; x=1796016631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UdhGnR2UELt/wxMaO1jrZ4Rwb6d7tz8JkpO/Z93uXrM=;
        b=h1Y8ChjRsMnwbk3I91nlOdvNMN/d/gt9bKXAXql5MW7HFInBgph7nkbNTWBSSF+KkI
         I9NoPGnEwsY9mmmd+zXx905O3RmKOjXyvvQocqpxvfs9ZY9gRzC6FJyn2UHlGlrBiNsf
         pOVU7MI4q5IJsRfEBlX46+c/fdmwUN8nAJAD8aZpLUa/YhTU+5Ihr3QKTePfXI9cb8gb
         kP6WZw0CLSguxtHl/FMLXJghHbSqCKQYJCBGREAq14MQX7Z10foaw7iGqtU2JM2uicbJ
         BSMDAuZ+U4fsAKzgaxnR6NjlBZcYnE3RHvAILChbpx6evksVf2+p4jRv+y5k9UjXNz+U
         YQvg==
X-Gm-Message-State: APuU4Z8O1A+5hGFgQg/uXUClW8lJg27fnpveL0OyfbktbQ2OeTrCFVim
	esAmPuSOt0m73e1LbcuoeTywGpJM2a3NEGMGzDsvOz4YQBUswYkVWxNCdUsgyoBq6NY=
X-Gm-Gg: AZFdTZfuiBCYeUefTt2tGJKtq2X7rezuqy5LyLIibELuwi4/chkJPm5lwrJCyk/JDqT
	I7i6rt+okyMVkKnwOeCCRlPT3Yy0otqrA+aS0cRsOrxbatwAdxT2YpVIfGAHzXOrd7UFRdF9nz5
	raeghRiyUhHbxauUk7wX87fwDWFdsKNxv6I17/e1HtvQ5OMcqOFBgy3tuAydmyWF/Tlhn3uDoNM
	7GtrJrTGy/N+F7PMkPI0nE9zOhqZkRvVohOiJFxxNckmGh8oPIcgAt2nKjw7vmS38nqXxi0G5dV
	tfwkj4uCYr1S03S1KeRaZi8f2aBRarWYfWONds1pZf623Cv3b/PQx9gDvKNtHiPWE+wgCHxxE0B
	mRnJL2jhSzeoe2cjRjw+LChdiE0psNu9q9q3x0kK2CmC7SRi/fs6AXYNYq7XJSoteK7tgQ6k4iW
	w11qMYpDn1Wsdf4a2HeeuQdNb05Urgy9xejj+32mE1EoOblyIytKn0W6/iIpg4+gelU+RRyuVq1
	LOzMW638drVUKk0EfHBWMNUuWq6u2dxhUxSUbW8Nn62GzLR8TqAb19FIR1OQZD+wJPA1bub7qpg
	dqpatALQlz/+KcXhPmJtEWlVciQxfonnBZi9kcpi7dMPSbQpGyDNXdYQwz1D5YCd0zNr1VPQtyQ
	zf3z9FnEm4vAEmeQT86AkIvkXwCtQaGdoHUsD79/yhySrtZqu9W2+ms3O0gApsirRtVp53MTm6T
	ehSixEFIlyFfVhisowqRkHxc1kqmfs+9JsTsE6vXranwdfO3ME9CUWVPpb1gpf1eMnKrl/Zq6r1
	ZjxzXvk1+OuOWGvCnuDIrK4M8C9qt3bj7yQnJn/c9/BvM+nVp4F4HLLsWUhQgYXjYIQR11Hrit8
	DlLe
X-Received: by 2002:a05:7301:700d:b0:383:600a:4577 with SMTP id 5a478bee46e88-385702565damr11766641eec.23.1795411830678;
        Sun, 22 Nov 2026 21:30:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 00/42] Recipe upgrades and fixes
Date: Sun, 22 Nov 2026 21:28:44 -0800
Message-ID: <20261123052953.3658549-28-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132815
Content-Type: text/plain; charset="utf-8"

Recipe upgrades plus a few related fixes.

Notable:
- php 8.6.0 is relicensed from PHP-3.01 to BSD-3-Clause and ships libtool as
  separate m4 files; xdebug moves to 3.6.0alpha1, the first release that
  supports PHP 8.6.
- libsmi moves to its revived upstream on gitlab.ibr.cs.tu-bs.de (0.6.0, git
  fetcher). The parallel build fix before it is kept as a separate patch for
  older branches.
- bpftrace 0.27.1 tracks release/0.27.x and fixes its new dwarf_origin test
  fixture for installed and cross built ptests.
- nss 3.134 installs its new mozpkix headers; rsyslog refreshes its musl patch;
  several recipes drop patches that are now upstream or fix their branch=.

Tested in Yoe CI with world builds for qemuarm64, qemuriscv64 and qemux86-64 and
ptest images for qemuarm64 and qemux86-64, each with glibc/systemd and musl/sysvinit.

Khem Raj (42):
  abseil-cpp: upgrade 20260526.0 -> 20260817.0
  ace: upgrade 8.0.6 -> 8.0.8
  bmap-writer: upgrade 1.0.6 -> 1.0.7
  bpftool-native: upgrade 7.3.4 -> 7.3.5
  bpftrace: upgrade 0.26.1 -> 0.27.1
  cloc: upgrade 2.10 -> 2.12
  cpprest: upgrade 2.10.20 -> 2.10.21
  ctags: upgrade 6.2.20261108.0 -> 6.2.20261122.0
  drm-framebuffer: upgrade 1.0.0 -> 1.1.0
  exiftool: upgrade 13.63 -> 13.64
  fwupd: upgrade 2.1.7 -> 2.1.10
  graphviz: upgrade 16.1.1 -> 16.1.2
  hidapi: upgrade 0.15.0 -> 0.16.0
  hiredis: upgrade 1.5.0 -> 1.5.1
  imagemagick: upgrade 7.1.2-35 -> 7.1.2-36
  imapfilter: upgrade 2.8.6 -> 2.8.7
  imlib2: upgrade 1.12.7 -> 1.13.0
  iperf3: upgrade 3.22 -> 3.22.1
  kmscon: upgrade 10.1.1 -> 10.1.2
  libcbor: upgrade 0.14.0 -> 0.15.0
  libconfig-general-perl: upgrade 2.67 -> 2.69
  libmodplug: upgrade 0.8.9.0 -> 0.8.9.2
  monit: upgrade 6.0.0 -> 6.1.0
  nmap: upgrade 7.991 -> 7.993
  nspr: upgrade 4.40 -> 4.41
  nss: upgrade 3.133 -> 3.134
  nvmetcli: upgrade 0.8 -> 0.9
  opengl-es-cts: upgrade 3.2.14.0 -> 3.2.14.1
  pcsc-lite: upgrade 2.5.3 -> 2.5.4
  php: upgrade 8.5.13 -> 8.6.0
  qcbor: upgrade 1.6.1 -> 1.7.0
  rsyslog: upgrade 8.2606.0 -> 8.2610.0
  smarty: upgrade 5.8.5 -> 5.9.0
  syslog-ng: upgrade 4.12.0 -> 4.13.0
  tmux: upgrade 3.7 -> 3.8
  udisks2: upgrade 2.11.2 -> 2.12.0
  unattended-upgrades: upgrade 2.13 -> 2.14
  valkey: upgrade 9.1.3 -> 9.2.0
  webkitgtk3: upgrade 2.52.6 -> 2.54.3
  libirecovery: upgrade 1.3.1 -> 1.4.0
  libsmi: Fix a parallel build race between bison and flex
  libsmi: upgrade 0.5.0 -> 0.6.0

 ...ker-flags-and-sysroot-to-raw-compile.patch |  24 +-
 ...lderBPF-Fix-HasTerminator-on-LLVM-23.patch |  38 ---
 ...5-CMakeLists-Add-support-for-LLVM-23.patch |  36 ---
 ...d-build-paths-in-split-DWARF-test-pr.patch |  30 +-
 ...e-dwarf_origin-fixture-relative-to-t.patch |  65 ++++
 ...{bpftrace_0.26.1.bb => bpftrace_0.27.1.bb} |   8 +-
 .../{nvmetcli_0.8.bb => nvmetcli_0.9.bb}      |   4 +-
 .../{iperf3_3.22.bb => iperf3_3.22.1.bb}      |   4 +-
 .../fwupd/{fwupd_2.1.7.bb => fwupd_2.1.10.bb} |   2 +-
 .../ace/{ace_8.0.6.bb => ace_8.0.8.bb}        |   4 +-
 ...ecovery_1.3.1.bb => libirecovery_1.4.0.bb} |   2 +-
 ...lude-immintrin.h-instead-of-bmi2intr.patch |  36 ---
 ...20260526.0.bb => abseil-cpp_20260817.0.bb} |   3 +-
 .../cloc/{cloc_2.10.bb => cloc_2.12.bb}       |   2 +-
 ....20261108.0.bb => ctags_6.2.20261122.0.bb} |   2 +-
 .../{exiftool_13.63.bb => exiftool_13.64.bb}  |   2 +-
 ...2.67.bb => libconfig-general-perl_2.69.bb} |   2 +-
 ...re.ac-don-t-include-build-libtool.m4.patch |  15 +-
 .../php/{php_8.5.13.bb => php_8.6.0.bb}       |  18 +-
 ...de-Remove-distro_info-usage-to-check.patch |  12 +-
 ...es_2.13.bb => unattended-upgrades_2.14.bb} |   2 +-
 .../{hiredis_1.5.0.bb => hiredis_1.5.1.bb}    |   2 +-
 .../{libcbor_0.14.0.bb => libcbor_0.15.0.bb}  |   4 +-
 .../qcbor/{qcbor_1.6.1.bb => qcbor_1.7.0.bb}  |   2 +-
 .../rsyslog/disable-omfile-outchannel.patch   |   7 +-
 ...syslog_8.2606.0.bb => rsyslog_8.2610.0.bb} |   2 +-
 .../tmux/{tmux_3.7.bb => tmux_3.8.bb}         |   2 +-
 .../0001-src-Do-not-reset-FINAL_LIBS.patch    |   6 +-
 .../{valkey_9.1.3.bb => valkey_9.2.0.bb}      |   4 +-
 ...ffer_1.0.0.bb => drm-framebuffer_1.1.0.bb} |   4 +-
 ...{graphviz_16.1.1.bb => graphviz_16.1.2.bb} |   2 +-
 .../{imlib2_1.12.7.bb => imlib2_1.13.0.bb}    |   2 +-
 .../{kmscon_10.1.1.bb => kmscon_10.1.2.bb}    |   2 +-
 .../vk-gl-cts/opengl-es-cts-sources.inc       |   2 +-
 ..._3.2.14.0.bb => opengl-es-cts_3.2.14.1.bb} |   2 +-
 ...ative_7.3.4.bb => bpftool-native_7.3.5.bb} |   2 +-
 ...-Drop-register-storage-class-keyword.patch |  38 ---
 ...dplug_0.8.9.0.bb => libmodplug_0.8.9.2.bb} |   5 +-
 ...e.h-header-to-pass-clang-compilation.patch |  68 -----
 ...ing-between-build-ncat-and-build-lua.patch |  11 +-
 .../files/0002-Fix-building-with-libc.patch   |  71 -----
 .../nmap/{nmap_7.991.bb => nmap_7.993.bb}     |   4 +-
 ...p-writer_1.0.6.bb => bmap-writer_1.0.7.bb} |   2 +-
 .../recipes-support/cpprest/cpprest/63.patch  | 180 ------------
 .../recipes-support/cpprest/cpprest/65.patch  |  94 ------
 .../recipes-support/cpprest/cpprest/68.patch  | 153 ----------
 ...-lts.bb => cpprest_2.10.21+cpprest-lts.bb} |   9 +-
 .../{hidapi_0.15.0.bb => hidapi_0.16.0.bb}    |   2 +-
 ...ck_7.1.2-35.bb => imagemagick_7.1.2-36.bb} |   2 +-
 ...mapfilter_2.8.6.bb => imapfilter_2.8.7.bb} |   2 +-
 ...ntifierRef-prototype-in-yang-complex.patch |  53 ----
 .../0001-Fix-build-failure-with-gcc-15.patch  | 154 ----------
 ...1-parser-yang-Define-_DEFAULT_SOURCE.patch |  28 --
 .../libsmi-fix-the-test-dump-files.patch      | 277 ------------------
 .../recipes-support/libsmi/libsmi_0.5.0.bb    |  52 ----
 .../recipes-support/libsmi/libsmi_0.6.0.bb    |  42 +++
 .../monit/{monit_6.0.0.bb => monit_6.1.0.bb}  |   4 +-
 .../nspr/{nspr_4.40.bb => nspr_4.41.bb}       |   2 +-
 .../nss/{nss_3.133.bb => nss_3.134.bb}        |   6 +-
 ...{pcsc-lite_2.5.3.bb => pcsc-lite_2.5.4.bb} |   2 +-
 .../{smarty_5.8.5.bb => smarty_5.9.0.bb}      |   2 +-
 ...yslog-ng_4.12.0.bb => syslog-ng_4.13.0.bb} |   2 +-
 .../{udisks2_2.11.2.bb => udisks2_2.12.0.bb}  |   6 +-
 ...able-to-control-macro-__PAS_ALWAYS_I.patch |  14 +-
 ...-system-include-dirs-from-g-ir-scann.patch |  10 +-
 ...kitgtk3_2.52.6.bb => webkitgtk3_2.54.3.bb} |   3 +-
 66 files changed, 234 insertions(+), 1420 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0004-IRBuilderBPF-Fix-HasTerminator-on-LLVM-23.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0005-CMakeLists-Add-support-for-LLVM-23.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0008-tests-look-up-the-dwarf_origin-fixture-relative-to-t.patch
 rename meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/{bpftrace_0.26.1.bb => bpftrace_0.27.1.bb} (92%)
 rename meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/{nvmetcli_0.8.bb => nvmetcli_0.9.bb} (93%)
 rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.22.bb => iperf3_3.22.1.bb} (90%)
 rename meta-oe/recipes-bsp/fwupd/{fwupd_2.1.7.bb => fwupd_2.1.10.bb} (97%)
 rename meta-oe/recipes-connectivity/ace/{ace_8.0.6.bb => ace_8.0.8.bb} (89%)
 rename meta-oe/recipes-connectivity/libirecovery/{libirecovery_1.3.1.bb => libirecovery_1.4.0.bb} (89%)
 delete mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-raw_hash_set-include-immintrin.h-instead-of-bmi2intr.patch
 rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20260526.0.bb => abseil-cpp_20260817.0.bb} (91%)
 rename meta-oe/recipes-devtools/cloc/{cloc_2.10.bb => cloc_2.12.bb} (91%)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20261108.0.bb => ctags_6.2.20261122.0.bb} (96%)
 rename meta-oe/recipes-devtools/perl/{exiftool_13.63.bb => exiftool_13.64.bb} (94%)
 rename meta-oe/recipes-devtools/perl/{libconfig-general-perl_2.67.bb => libconfig-general-perl_2.69.bb} (87%)
 rename meta-oe/recipes-devtools/php/{php_8.5.13.bb => php_8.6.0.bb} (95%)
 rename meta-oe/recipes-devtools/unattended-upgrades/{unattended-upgrades_2.13.bb => unattended-upgrades_2.14.bb} (95%)
 rename meta-oe/recipes-extended/hiredis/{hiredis_1.5.0.bb => hiredis_1.5.1.bb} (96%)
 rename meta-oe/recipes-extended/libcbor/{libcbor_0.14.0.bb => libcbor_0.15.0.bb} (72%)
 rename meta-oe/recipes-extended/qcbor/{qcbor_1.6.1.bb => qcbor_1.7.0.bb} (93%)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2606.0.bb => rsyslog_8.2610.0.bb} (99%)
 rename meta-oe/recipes-extended/tmux/{tmux_3.7.bb => tmux_3.8.bb} (90%)
 rename meta-oe/recipes-extended/valkey/{valkey_9.1.3.bb => valkey_9.2.0.bb} (95%)
 rename meta-oe/recipes-graphics/drm-framebuffer/{drm-framebuffer_1.0.0.bb => drm-framebuffer_1.1.0.bb} (78%)
 rename meta-oe/recipes-graphics/graphviz/{graphviz_16.1.1.bb => graphviz_16.1.2.bb} (97%)
 rename meta-oe/recipes-graphics/imlib2/{imlib2_1.12.7.bb => imlib2_1.13.0.bb} (96%)
 rename meta-oe/recipes-graphics/kmscon/{kmscon_10.1.1.bb => kmscon_10.1.2.bb} (98%)
 rename meta-oe/recipes-graphics/vk-gl-cts/{opengl-es-cts_3.2.14.0.bb => opengl-es-cts_3.2.14.1.bb} (94%)
 rename meta-oe/recipes-kernel/bpftool/{bpftool-native_7.3.4.bb => bpftool-native_7.3.5.bb} (92%)
 delete mode 100644 meta-oe/recipes-multimedia/libmodplug/libmodplug/0001-fastmix-Drop-register-storage-class-keyword.patch
 rename meta-oe/recipes-multimedia/libmodplug/{libmodplug_0.8.9.0.bb => libmodplug_0.8.9.2.bb} (81%)
 delete mode 100644 meta-oe/recipes-security/nmap/files/0001-Include-time.h-header-to-pass-clang-compilation.patch
 delete mode 100644 meta-oe/recipes-security/nmap/files/0002-Fix-building-with-libc.patch
 rename meta-oe/recipes-security/nmap/{nmap_7.991.bb => nmap_7.993.bb} (92%)
 rename meta-oe/recipes-support/bmap-writer/{bmap-writer_1.0.6.bb => bmap-writer_1.0.7.bb} (94%)
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest/63.patch
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest/65.patch
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest/68.patch
 rename meta-oe/recipes-support/cpprest/{cpprest_2.10.20+cpprest-lts.bb => cpprest_2.10.21+cpprest-lts.bb} (74%)
 rename meta-oe/recipes-support/hidapi/{hidapi_0.15.0.bb => hidapi_0.16.0.bb} (89%)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-35.bb => imagemagick_7.1.2-36.bb} (99%)
 rename meta-oe/recipes-support/imapfilter/{imapfilter_2.8.6.bb => imapfilter_2.8.7.bb} (91%)
 delete mode 100644 meta-oe/recipes-support/libsmi/libsmi/0001-Define-createIdentifierRef-prototype-in-yang-complex.patch
 delete mode 100644 meta-oe/recipes-support/libsmi/libsmi/0001-Fix-build-failure-with-gcc-15.patch
 delete mode 100644 meta-oe/recipes-support/libsmi/libsmi/0001-parser-yang-Define-_DEFAULT_SOURCE.patch
 delete mode 100644 meta-oe/recipes-support/libsmi/libsmi/libsmi-fix-the-test-dump-files.patch
 delete mode 100644 meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
 create mode 100644 meta-oe/recipes-support/libsmi/libsmi_0.6.0.bb
 rename meta-oe/recipes-support/monit/{monit_6.0.0.bb => monit_6.1.0.bb} (92%)
 rename meta-oe/recipes-support/nspr/{nspr_4.40.bb => nspr_4.41.bb} (98%)
 rename meta-oe/recipes-support/nss/{nss_3.133.bb => nss_3.134.bb} (97%)
 rename meta-oe/recipes-support/pcsc-lite/{pcsc-lite_2.5.3.bb => pcsc-lite_2.5.4.bb} (97%)
 rename meta-oe/recipes-support/smarty/{smarty_5.8.5.bb => smarty_5.9.0.bb} (95%)
 rename meta-oe/recipes-support/syslog-ng/{syslog-ng_4.12.0.bb => syslog-ng_4.13.0.bb} (98%)
 rename meta-oe/recipes-support/udisks/{udisks2_2.11.2.bb => udisks2_2.12.0.bb} (87%)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.52.6.bb => webkitgtk3_2.54.3.bb} (98%)

