Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8099.1795739764330623297
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=oXTJyHmJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f020d0169eso37574265ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739764; x=1796344564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=moPMFfiNDiVJV/AFqXLelSIY8NzUx0V7lQBM7am7PVE=;
        b=oXTJyHmJ8LdVbn9Zds9uAJZdN7W3i0AvFiru1w7mx44gIzwGaUqeXSZq+nKcbifL6t
         y3vJ93xl8gz3z/QtcyB3prFYBpCImobTEgu8lY5K3NYVplmAE62PsBH9XCMMhYvq0RuR
         0BOKvyhd5CYBKrBjNP01FyeBkBU+zgiqyUaGg9L5NXfAzVFFqc1gsOSE8XBB1tpv0E5H
         S35X6pjt8OO3/mf9vVoKrrzh5NRdTnSN5KW2Ly6fzOHcg0MvFHNQ08I2xeIpr8PdJEQ4
         MBoFMwdYM3AgE2VodgQhfUOXfzX1qyYxbWAIR2+zHxT6JFrkyHBidxSIkUI/aq4peUzU
         X7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739764; x=1796344564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=moPMFfiNDiVJV/AFqXLelSIY8NzUx0V7lQBM7am7PVE=;
        b=aCqsLIO0sOSDrHixzBNGf6mEpHGOt4oQYtfuQg0+bHwSWAGD3I5wJOOiLA3eszf6aY
         vfgP+c8KFSpD9H2ElmfGY8blzgQOlNPG/iyZJD8BCm2wwi4hvx9iuVwudQMRR6GzYIvK
         jaFnOtNFKZPlB5yrj2kQ/Fn6eILfe+NNmEh7+Nzra2WLnSn3A0gG3sYEJriajoNu/aw9
         +M/V9oqcACWfxC0puod9CjKwKYndeLV3tYux6+J5gp83KJacWAPft4mQc1Fo/SzKD7P0
         gOmHBAYAPndLSE3K1VqN+qINwrR0NOEY6e0nAJOXid0B0lzWb5wunjLawBaXH16NQg8y
         6qhw==
X-Gm-Message-State: APuU4Z/98GjDXaw3LeEEfcJWKjxRkmhw4FEvm1xkPvpC9ot/an9E2XL6
	GqGTyAZJEs5m0HicbpwYVLaINWgAV/ITjKSK1gEZnmdI/Co1GYdEGZx5mX8fBXd+
X-Gm-Gg: AZFdTZcuNEkigClkyStQhJ/J/cQd2bT9A6hBfT1iWBnxrRAdS2LIr4PzB+NyWQ3ibsy
	r0p7DH6HJheOroQkJpqZmH07c7iphLRaw5hG4qOlNwATR77IFlgEjtPxFaJIUY+9teyRrXczo8C
	m97H+C5F8ieBHXN/87ln3DJbtcvEnXIg8Ig3C7yFlVexM7wg7uqeS3qltpqcCPzGUCMeYRFF071
	Qp4/nb6whETVDkGr6Wqzflmc8iXU6+l806byJ3CF4zOhXvNJlZYJER+11G7y3pMdxgwC0i+AGPA
	3Kx15uvCzYD9W/7p6dG4TinGO8YYN7+yDJ4wpykgDB1d17bndUwi0Bh504X7b7JJI7CvaFZQZuz
	pYXDqTXuWAtDStzXJgtV4DBoPpz6avhWOafpO4Jre34RVchjznCwKLbn6d+HVtH5r/MEXa4xuG1
	3VEEh50VZdmHbsbYUny98R4k4IJ3ySy8/7socwyyNbGw7njU29elqgTdK8gjEzRgEjnYdZhD4D+
	SFu4ioYTNdG4aMvKcCFvb+PxePQVNwj/4RHYboAwF2sEssP/5hdee3azXbvLPUTqGz6hOWA51W5
	OH9ftcB7XhX9BivPDtzwRYyhdFjKgHzzN/PezlMcq4nl5ZPT21hrHBfAdCle+OL2DH1npn9891q
	sUtIyT88uYeE+VZ2kDw3UVrjMlPewUPvrrg5ubZCwfZw1CRLq04lhSVAiiyjXEPBYj3OQVstHg9
	0lvuXcrpnztw43l8k5kSKp9HOcQ2KmhZrd3m7G3gOg1dy0eIdIXSo5ydMcQDCkVZ3KQUh+xinq/
	FwURc8E/PB1X71KAyIfB+jpHoQ6GrWIMF5Rb4O3kgRjvlVJz3urGZfj0LYrd55uUDvXPFsB/lRV
	OQVl
X-Received: by 2002:a17:903:2c50:b0:2e9:460e:ca57 with SMTP id d9443c01a7336-2f03f17d214mr224563955ad.15.1795739763499;
        Thu, 26 Nov 2026 16:36:03 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 00/39] Source fixes, upgrades and build fixes
Date: Thu, 26 Nov 2026 16:35:04 -0800
Message-ID: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133170
Content-Type: text/plain; charset="utf-8"

Move recipes whose download location went away (pagure, codeberg,
gitlab, GitHub releases) or now needs https, same-series upgrades, and
build and ptest fixes (cjson CMake package paths, sdbus-c++ awaitable
test crash, kernel-selftest net tests, tomlplusplus and platformdirs
ptests).

Security fixes: cryptsetup 2.8.9 (CVE-2021-4122), flatpak 1.18.6
(CVE-2026-133842, CVE-2026-133845), hdf5 2.3.0 (CVE-2026-19023 to
CVE-2026-19028, CVE-2026-120689, CVE-2026-120754 to CVE-2026-120758)
and psqlodbc (CVE-2026-136499, CVE-2026-136515).

mosquitto 2.1.4 in the meta-networking series needs the cjson fix.

Built for qemux86-64 with glibc and, for the musl and ptest fixes, musl.

Khem Raj (39):
  libnewt: Fetch from gitlab.com/newt-ui/newt
  mailcap: Fetch from github.com/InfrastructureServices/mailcap
  volume-key: Fetch the release tarball from Debian
  phoronix-test-suite: Fetch from GitHub releases
  libubox: Fetch over https
  ttf-liberation-sans-narrow: Upgrade to 1.07.6
  trace-cmd: Fetch from the main trace-cmd repository
  cjson: Install CMake package files with relative paths
  cjson: Fetch by tag and add upstream version check
  cryptsetup: upgrade 2.8.8 -> 2.8.9
  flatpak: upgrade 1.18.4 -> 1.18.6
  fluentbit: upgrade 5.2.0 -> 5.2.1
  fwts: upgrade 26.09.00 -> 26.11.00
  geos: upgrade 3.15.0 -> 3.15.1
  grpc: upgrade 1.85.2 -> 1.85.4
  hdf5: upgrade 2.2.0 -> 2.3.0
  jwt-cpp: upgrade 0.7.2 -> 0.7.3
  kpatch: upgrade 0.9.1 -> 0.9.11
  libstatgrab: upgrade 0.92.1 -> 0.92.2
  libtorrent-rasterbar: upgrade 2.1.2 -> 2.1.3
  nvme-cli: upgrade 3.2 -> 3.3
  p8platform: upgrade 2.1.0.1 -> 2.2.0
  pam-plugin-ldapdb: upgrade 2.0.0 -> 2.0.1
  parallel: upgrade 20261022 -> 20261122
  proj: upgrade 9.8.1 -> 9.9.0
  psqlodbc: upgrade 18.00.0006 -> 18.00.0007
  python3-drgn: upgrade 0.2.0 -> 0.3.0
  redis: upgrade 8.10.3 -> 8.12.0
  simpleiot: upgrade 0.36.1 -> 0.36.2
  libunibreak: Add recipe
  taisei: upgrade 1.4.4 -> 1.4.6
  tomlplusplus: upgrade 3.4.0 -> 3.5.1
  valijson: upgrade 1.1.4 -> 1.1.5
  ctre: upgrade 3.9.0 -> 3.11.0
  safec: upgrade 3.9.1 -> 3.16
  minini: upgrade 1.2.b -> 1.5
  sdbus-c++: Fix intermittent segfault in the awaitable integration
    tests
  kernel-selftest: Depend on clang-native for the net BPF objects
  libraqm: Extend to native

 ...ed-const-qualifiers-in-char-pointer-.patch |  56 --
 ...necessary-recursion-in-vfs_mkparents.patch |  71 ---
 .../{taisei_1.4.4.bb => taisei_1.4.6.bb}      |  11 +-
 .../phoronix-test-suite_10.8.4.bb             |   2 +-
 .../{nvme-cli_3.2.bb => nvme-cli_3.3.bb}      |   9 +-
 ...2.1.2.bb => libtorrent-rasterbar_2.1.3.bb} |   3 +-
 ...snprintf_s-Increase-Buffer-Size-by-1.patch |  41 --
 .../safec/{safec_3.9.1.bb => safec_3.16.bb}   |   6 +-
 ...aitable-test-tasks-only-after-final-.patch | 104 ++++
 .../recipes-core/sdbus-c++/sdbus-c++_2.3.1.bb |   1 +
 ...ryptsetup_2.8.8.bb => cryptsetup_2.8.9.bb} |   5 +-
 ...c_18.00.0006.bb => psqlodbc_18.00.0007.bb} |   3 +-
 ...ake-Install-to-relative-destinations.patch | 122 ++++
 .../recipes-devtools/cjson/cjson_1.7.19.bb    |   5 +-
 .../grpc/{grpc_1.85.2.bb => grpc_1.85.4.bb}   |   4 +-
 .../{jwt-cpp_0.7.2.bb => jwt-cpp_0.7.3.bb}    |   3 +-
 .../recipes-devtools/libubox/libubox_git.bb   |   2 +-
 .../tomlplusplus/files/run-ptest              |  12 +-
 .../tomlplusplus/tomlplusplus_git.bb          |  15 +-
 .../{valijson_1.1.4.bb => valijson_1.1.5.bb}  |   3 +-
 .../{flatpak_1.18.4.bb => flatpak_1.18.6.bb}  |   2 +-
 ...{fluentbit_5.2.0.bb => fluentbit_5.2.1.bb} |   4 +-
 ...atgrab_0.92.1.bb => libstatgrab_0.92.2.bb} |   8 +-
 .../recipes-extended/newt/libnewt_0.52.25.bb  |  10 +-
 ...{p8platform_git.bb => p8platform_2.2.0.bb} |   8 +-
 ...nclude-sys-time.h-for-struct-timeval.patch |  32 -
 ...db_2.0.0.bb => pam-plugin-ldapdb_2.0.1.bb} |   6 +-
 ...allel_20261022.bb => parallel_20261122.bb} |   5 +-
 ...-hiredis-use-default-CC-if-it-is-set.patch |   0
 ...ile-to-use-environment-build-setting.patch |  15 +-
 ...003-hack-to-force-use-of-libc-malloc.patch |   0
 .../0004-src-Do-not-reset-FINAL_LIBS.patch    |   0
 ...RCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch |   0
 ...-not-build-the-test-modules-from-all.patch |   0
 .../init-redis-server                         |   0
 .../{redis-8.10.3 => redis-8.12.0}/redis.conf |   0
 .../redis.service                             |   0
 .../{redis_8.10.3.bb => redis_8.12.0.bb}      |  10 +-
 ...impleiot_0.36.1.bb => simpleiot_0.36.2.bb} |   2 +-
 .../volume_key/volume-key_0.3.12.bb           |   7 +-
 .../libraqm/libraqm_0.11.0.bb                 |   4 +
 ...b => ttf-liberation-sans-narrow_1.07.6.bb} |   9 +-
 ...n3-drgn_0.2.0.bb => python3-drgn_0.3.0.bb} |   2 +-
 .../kernel-selftest/kernel-selftest.bb        |   2 +
 meta-oe/recipes-kernel/kpatch/kpatch.inc      |   5 +-
 ...-build-add-cross-compilation-support.patch | 105 ----
 ...uild-allow-overriding-of-distro-name.patch |  48 +-
 .../{kpatch_git.bb => kpatch_0.9.11.bb}       |   5 +-
 .../trace-cmd/trace-cmd_3.1.5.bb              |   9 +-
 .../geos/{geos_3.15.0.bb => geos_3.15.1.bb}   |   5 +-
 .../proj/{proj_9.8.1.bb => proj_9.9.0.bb}     |   2 +-
 .../ctre/{ctre_3.9.0.bb => ctre_3.11.0.bb}    |   4 +-
 .../files/0001-cmake-remove-build-flags.patch |  19 +-
 ...ffix-shared-from-shared-library-name.patch |   7 +-
 .../hdf5/files/CVE-2026-120689.patch          |  60 --
 .../CVE-2026-120754-CVE-2026-120755.patch     | 172 ------
 .../hdf5/files/CVE-2026-120756.patch          |  45 --
 .../hdf5/files/CVE-2026-120757.patch          |  63 --
 .../hdf5/files/CVE-2026-120758.patch          | 143 -----
 .../files/CVE-2026-19023-CVE-2026-19024.patch | 176 ------
 .../hdf5/files/CVE-2026-19025.patch           | 112 ----
 ...-19026-CVE-2026-19027-CVE-2026-19028.patch | 579 ------------------
 .../hdf5/{hdf5_2.2.0.bb => hdf5_2.3.0.bb}     |  10 +-
 .../libunibreak/libunibreak_8.0.1.bb          |  15 +
 .../recipes-support/mailcap/mailcap_2.1.54.bb |   8 +-
 ...pe-used-in-prototype-for-ini_putbool.patch |  23 +
 .../minini/{minini_1.2.b.bb => minini_1.5.bb} |  21 +-
 .../{fwts_26.09.00.bb => fwts_26.11.00.bb}    |   2 +-
 68 files changed, 433 insertions(+), 1809 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-misc-fix-discarded-const-qualifiers-in-char-pointer-.patch
 delete mode 100644 meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-vfs-avoid-unnecessary-recursion-in-vfs_mkparents.patch
 rename meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/{taisei_1.4.4.bb => taisei_1.4.6.bb} (81%)
 rename meta-oe/recipes-bsp/nvme-cli/{nvme-cli_3.2.bb => nvme-cli_3.3.bb} (92%)
 rename meta-oe/recipes-connectivity/libtorrent-rasterbar/{libtorrent-rasterbar_2.1.2.bb => libtorrent-rasterbar_2.1.3.bb} (91%)
 delete mode 100644 meta-oe/recipes-core/safec/safec/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch
 rename meta-oe/recipes-core/safec/{safec_3.9.1.bb => safec_3.16.bb} (84%)
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++/0004-test-complete-awaitable-test-tasks-only-after-final-.patch
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.8.8.bb => cryptsetup_2.8.9.bb} (96%)
 rename meta-oe/recipes-dbs/psqlodbc/{psqlodbc_18.00.0006.bb => psqlodbc_18.00.0007.bb} (95%)
 create mode 100644 meta-oe/recipes-devtools/cjson/cjson/0001-CMake-Install-to-relative-destinations.patch
 rename meta-oe/recipes-devtools/grpc/{grpc_1.85.2.bb => grpc_1.85.4.bb} (96%)
 rename meta-oe/recipes-devtools/jwt-cpp/{jwt-cpp_0.7.2.bb => jwt-cpp_0.7.3.bb} (82%)
 rename meta-oe/recipes-devtools/valijson/{valijson_1.1.4.bb => valijson_1.1.5.bb} (87%)
 rename meta-oe/recipes-extended/flatpak/{flatpak_1.18.4.bb => flatpak_1.18.6.bb} (98%)
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_5.2.0.bb => fluentbit_5.2.1.bb} (98%)
 rename meta-oe/recipes-extended/libstatgrab/{libstatgrab_0.92.1.bb => libstatgrab_0.92.2.bb} (77%)
 rename meta-oe/recipes-extended/p8platform/{p8platform_git.bb => p8platform_2.2.0.bb} (71%)
 delete mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ldapdb/0001-Include-sys-time.h-for-struct-timeval.patch
 rename meta-oe/recipes-extended/pam/{pam-plugin-ldapdb_2.0.0.bb => pam-plugin-ldapdb_2.0.1.bb} (79%)
 rename meta-oe/recipes-extended/parallel/{parallel_20261022.bb => parallel_20261122.bb} (86%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.3 => redis-8.12.0}/0001-hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.3 => redis-8.12.0}/0002-lua-update-Makefile-to-use-environment-build-setting.patch (77%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.3 => redis-8.12.0}/0003-hack-to-force-use-of-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.3 => redis-8.12.0}/0004-src-Do-not-reset-FINAL_LIBS.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.3 => redis-8.12.0}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.3 => redis-8.12.0}/0006-src-Makefile-do-not-build-the-test-modules-from-all.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.3 => redis-8.12.0}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.3 => redis-8.12.0}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.3 => redis-8.12.0}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_8.10.3.bb => redis_8.12.0.bb} (92%)
 rename meta-oe/recipes-extended/simpleiot/{simpleiot_0.36.1.bb => simpleiot_0.36.2.bb} (98%)
 rename meta-oe/recipes-graphics/ttf-fonts/{ttf-liberation-sans-narrow_1.07.4.bb => ttf-liberation-sans-narrow_1.07.6.bb} (73%)
 rename meta-oe/recipes-kernel/drgn/{python3-drgn_0.2.0.bb => python3-drgn_0.3.0.bb} (97%)
 delete mode 100644 meta-oe/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch
 rename meta-oe/recipes-kernel/kpatch/{kpatch_git.bb => kpatch_0.9.11.bb} (65%)
 rename meta-oe/recipes-navigation/geos/{geos_3.15.0.bb => geos_3.15.1.bb} (76%)
 rename meta-oe/recipes-navigation/proj/{proj_9.8.1.bb => proj_9.9.0.bb} (90%)
 rename meta-oe/recipes-support/ctre/{ctre_3.9.0.bb => ctre_3.11.0.bb} (86%)
 delete mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120689.patch
 delete mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120754-CVE-2026-120755.patch
 delete mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120756.patch
 delete mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120757.patch
 delete mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120758.patch
 delete mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-19023-CVE-2026-19024.patch
 delete mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-19025.patch
 delete mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-19026-CVE-2026-19027-CVE-2026-19028.patch
 rename meta-oe/recipes-support/hdf5/{hdf5_2.2.0.bb => hdf5_2.3.0.bb} (83%)
 create mode 100644 meta-oe/recipes-support/libunibreak/libunibreak_8.0.1.bb
 create mode 100644 meta-oe/recipes-support/minini/minini/0001-BUG-fix-wrong-type-used-in-prototype-for-ini_putbool.patch
 rename meta-oe/recipes-support/minini/{minini_1.2.b.bb => minini_1.5.bb} (65%)
 rename meta-oe/recipes-test/fwts/{fwts_26.09.00.bb => fwts_26.11.00.bb} (97%)

