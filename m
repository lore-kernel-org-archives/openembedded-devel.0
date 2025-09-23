Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA1ECAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:57:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.15019.1758628660267361449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=X0x3eCaJ;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628661; x=1790164661;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MU9iWRailDd2Vri9ZE53upkE3orMmaJhKZIg8be0fvo=;
  b=X0x3eCaJAMe1XTPkszDo9ZUuOUjsdYVEkQcuLalC50fLpnb6TGOhHlf/
   ZzvLE35aMdzWYl1hzQqCg/c0enYUP4RE80+djqXbo4a1CwD//T7KLCwTQ
   7abhM84mRM0ADj/cWZMtgBtHcvs8Z9AWrAEo1naAyhWLrBfud2Ot/11ZR
   JXJEfTcRk4LnQsiPr+NA2ZZ1R1Bie8/8t/0JB1ozrw+MxHNI0il9dDiUU
   JQ1g0GH/dcSInef3JnHLqS6PhARHuh8mW+CLeBT3V+y1mJQwyT7DRwujj
   oTuTZfPbfYImrZfxT24f1feYD5hj918MAnH1lRGKtu9jVTj6Fs5Lc1UTk
   w==;
X-CSE-ConnectionGUID: Jzm2X238SzaKtQ4zzJIbTg==
X-CSE-MsgGUID: b0LIvaHoTjOAicj7gXX0lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821775"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821775"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:57:40 -0700
X-CSE-ConnectionGUID: QxQN54czS1GEeA6bjK1IsQ==
X-CSE-MsgGUID: AFgUNtwnSgWS+MOBmxi1qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175875122"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.223])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:57:39 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 00/24] Scarthgap pull request
Date: Tue, 23 Sep 2025 19:57:03 +0800
Message-ID: <cover.1758626365.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:57:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119689

Please consider merging these changes for scarthgap. Tested with
autobuilder and locally with qemux86-64 and qemuarm64:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/944

The following changes since commit b9fb6556a3c8a3e477dce334205b658cb79ad501:

  protobuf 4.25.8: Mark CVE-2024-7254 as patched (2025-09-12 08:15:13 +0800)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap

Anil Dongare (1):
  libssh 0.10.6: Fix CVE-2025-8114

Archana Polampalli (1):
  apache2: upgrade 2.4.64 - 2.4.65

AshishKumar Mishra (1):
  meta-oe: image: optionally remove RAW image after sparse image
    creation

Divya Chellam (2):
  libssh: fix CVE-2025-4878
  libssh: fix CVE-2025-5987

Gyorgy Sarvari (1):
  mod-dnssd: update SRC_URI

Haixiao Yan (1):
  python3-posix-ipc: fix runtime error

Hitendra Prajapati (1):
  openjpeg: fix for CVE-2025-54874

Jef Driesen (1):
  lcov: Add missing RDEPENDS for nativesdk

Jeroen Knoops (1):
  nng: Rename default branch of github.com:nanomsg/nng.git

Khem Raj (2):
  gtkwave: Add libtirpc to depends
  ssmping: Use debian mirror for SRC_URI

Marc Ferland (1):
  libvncserver: fix generated LibVNCServerTargets.cmake

Martin Jansa (1):
  nodejs: fix build with gcc-15 on host

Peter Marko (2):
  fontforge: patch CVE-2024-25081 and CVE-2024-25082
  fcgi: patch CVE-2025-23016

Shubham Pushpkar (1):
  cjson 1.7.18: Fix CVE-2025-57052

Wang Mingyu (2):
  geoip: fix do_fetch error
  rp-pppoe: update SRC_URI

Yi Zhao (1):
  wxwidgets: upgrade 3.2.1 -> 3.2.6

Yoann Congal (1):
  gutenprint: fix a build race-condition

Zhang Peng (2):
  iperf3: fix CVE-2025-54350
  wxwidgets: fix CVE-2024-58249

Zoltán Böszörményi (1):
  gutenprint: 5.3.5

 .../recipes-connectivity/nanomsg/nng_1.7.3.bb |    2 +-
 .../rp-pppoe/rp-pppoe_3.15.bb                 |    2 +-
 .../recipes-support/geoip/geoip_1.6.12.bb     |    8 +-
 .../recipes-support/ssmping/ssmping_0.9.1.bb  |    3 +-
 meta-oe/classes/image_types_sparse.bbclass    |    6 +
 .../iperf3/iperf3/CVE-2025-54350.patch        |   39 +
 .../recipes-benchmark/iperf3/iperf3_3.18.bb   |    1 +
 .../cjson/cjson/CVE-2025-57052.patch          |   33 +
 .../recipes-devtools/cjson/cjson_1.7.18.bb    |    1 +
 .../0001-src-fix-build-with-GCC-15.patch      |   33 +
 .../recipes-devtools/nodejs/nodejs_20.18.2.bb |    1 +
 ...using-glibc-specific-defines-on-musl.patch |   26 -
 ...able-cross-magic-it-does-not-work-fo.patch |    8 +-
 ...tch => 0002-fix-libdir-for-multilib.patch} |   35 +-
 ...003-create-links-with-relative-path.patch} |   22 +-
 ...-not-append-system-name-to-lib-name.patch} |   12 +-
 ...5-wx-config-fix-libdir-for-multilib.patch} |   29 +-
 ...-l.patch => 0006-Fix-locale-on-musl.patch} |   18 +-
 ...E_LARGEFILE_SUPPORT-to-1-explicitly.patch} |    9 +-
 .../wxwidgets/wxwidgets/CVE-2024-58249.patch  |  178 ++
 ...{wxwidgets_3.2.1.bb => wxwidgets_3.2.6.bb} |   18 +-
 .../CVE-2024-25081_CVE-2024-25082.patch       |  181 ++
 .../fontforge/fontforge_20230101.bb           |    1 +
 .../gtkwave/gtkwave_3.3.119.bb                |    1 +
 .../libvncserver/libvncserver_0.9.14.bb       |    4 +-
 .../openjpeg/openjpeg/CVE-2025-54874.patch    |   44 +
 .../openjpeg/openjpeg_2.5.3.bb                |    1 +
 ...-race-condition-around-empty-directo.patch |   60 +
 ...utenprint_5.3.4.bb => gutenprint_5.3.5.bb} |    6 +-
 meta-oe/recipes-support/lcov/lcov_1.16.bb     |    6 +
 .../libssh/libssh/CVE-2025-4878-0001.patch    | 2552 +++++++++++++++++
 .../libssh/libssh/CVE-2025-4878-0002.patch    |   34 +
 .../libssh/libssh/CVE-2025-5987.patch         |   37 +
 .../libssh/libssh/CVE-2025-8114.patch         |   49 +
 .../recipes-support/libssh/libssh_0.10.6.bb   |    4 +
 ...ndle-runtime-errors-and-return-None-.patch |   47 +
 .../python/python3-posix-ipc_1.2.0.bb         |    1 +
 .../recipes-httpd/apache-mod/mod-dnssd_0.6.bb |    2 +-
 .../{apache2_2.4.64.bb => apache2_2.4.65.bb}  |    2 +-
 .../fcgi/fcgi/CVE-2025-23016.patch            |   40 +
 .../recipes-support/fcgi/fcgi_git.bb          |    1 +
 41 files changed, 3467 insertions(+), 90 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch
 create mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-src-fix-build-with-GCC-15.patch
 delete mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-locale-Avoid-using-glibc-specific-defines-on-musl.patch
 rename meta-oe/recipes-extended/wxwidgets/wxwidgets/{fix-libdir-for-multilib.patch => 0002-fix-libdir-for-multilib.patch} (82%)
 rename meta-oe/recipes-extended/wxwidgets/wxwidgets/{create-links-with-relative-path.patch => 0003-create-links-with-relative-path.patch} (72%)
 rename meta-oe/recipes-extended/wxwidgets/wxwidgets/{not-append-system-name-to-lib-name.patch => 0004-don-not-append-system-name-to-lib-name.patch} (73%)
 rename meta-oe/recipes-extended/wxwidgets/wxwidgets/{wx-config-fix-libdir-for-multilib.patch => 0005-wx-config-fix-libdir-for-multilib.patch} (74%)
 rename meta-oe/recipes-extended/wxwidgets/wxwidgets/{musl-locale-l.patch => 0006-Fix-locale-on-musl.patch} (70%)
 rename meta-oe/recipes-extended/wxwidgets/wxwidgets/{0001-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch => 0007-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch} (83%)
 create mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/CVE-2024-58249.patch
 rename meta-oe/recipes-extended/wxwidgets/{wxwidgets_3.2.1.bb => wxwidgets_3.2.6.bb} (89%)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2024-25081_CVE-2024-25082.patch
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-54874.patch
 create mode 100644 meta-oe/recipes-printing/gutenprint/gutenprint/0001-cups-fix-a-build-race-condition-around-empty-directo.patch
 rename meta-oe/recipes-printing/gutenprint/{gutenprint_5.3.4.bb => gutenprint_5.3.5.bb} (91%)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-4878-0001.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-4878-0002.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-5987.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-8114.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-posix-ipc/0004-build_support-handle-runtime-errors-and-return-None-.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.64.bb => apache2_2.4.65.bb} (99%)
 create mode 100644 meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-23016.patch


