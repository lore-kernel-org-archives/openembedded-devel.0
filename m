Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1354FCCF9E3
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 02:13:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by mx.groups.io with SMTP id smtpd.web11.5876.1761876809036415253
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 19:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=VV8edZXA;
 spf=pass (domain: intel.com, ip: 198.175.65.18, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761876809; x=1793412809;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Dtz54TR4OdoPKNL+stQi/H9Iuos/Is3RozGCqEwWskI=;
  b=VV8edZXAlKzSUoalt1Yy2bkBmkoddHb2uHwrn596oktGa9j3qDz7nJu2
   nR8LnMNESjRKDQ+I5k2vm3231dBas/FVCULarfRAhWuwZk2zm77u1Rk4N
   5pSOTzFiVPSiQgOdUckTNclZRIhSXEADgIPiJE37rTNY2kdAEIB47plfa
   GcR1isJEitFWSRAaW6PzjbbVyJMn8e7Hg/xPokGlH+Gn5s80SQNjnqFqb
   SUYPdHFWBxi6Y2BhsyDZ0A1Q1PSQNDB/t57JgZDWwaF69Xte0qKde2gb1
   F6IaRiYwCievRFU/Hxbj6cwyQavgTQpu+yxRqhJvm6wsg3UfrV5x1wCjc
   g==;
X-CSE-ConnectionGUID: nKhrou0cSKG2aNxTTVs4EA==
X-CSE-MsgGUID: 464GxvbSToO6VvPrvRvWwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64071931"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="64071931"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 19:13:28 -0700
X-CSE-ConnectionGUID: CsPjzlEmS0+3zPIeVyFz5w==
X-CSE-MsgGUID: 9gzAHVM0QguLlvMnMRm0jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="185799561"
Received: from unknown (HELO anmitta2-mobl4.png.intel.com) ([10.107.11.181])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 19:13:27 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 00/87] Scarthgap pull request
Date: Fri, 31 Oct 2025 10:13:21 +0800
Message-ID: <cover.1761876513.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 02:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121216

We had a lot of CVE fixes in past month. Thank you to everyone who
contributed. I tested this on AB and locally.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1040


The following changes since commit a8484babb6b06f5a7278e4778d13d7a19abc9502:

  uim: Stick to C17 (2025-10-29 23:07:07 +0800)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap

Alexandre Truong (1):
  evince: Update status for CVE-2011-0433 and CVE-2011-5244

Ankur Tyagi (25):
  tinyproxy: patch CVE-2023-49606
  frr: patch CVE-2024-44070
  libavif: ignore CVE-2025-48175
  libconfuse: patch CVE-2022-40320
  hdf5: patch CVE-2025-2913
  hdf5: patch CVE-2025-2914
  hdf5: patch CVE-2025-2915
  hdf5: patch CVE-2025-2923, CVE-2025-6816, CVE-2025-6856
  hdf5: patch CVE-2025-2924
  hdf5: patch CVE-2025-2925
  hdf5: patch CVE-2025-6269, CVE-2025-6270, CVE-2025-6516
  libppd: patch CVE-2024-47175
  libcupsfilters: patch CVE-2024-47076
  libraw: patch CVE-2025-43961 CVE-2025-43962
  libraw: patch CVE-2025-43963
  libraw: patch CVE-2025-43964
  zlog: fix CVE-2024-22857
  memcached: patch CVE-2023-46852
  memcached: patch CVE-2023-46853
  ndpi: ignore CVE-2025-25066
  libiec61850: patch CVE-2024-26529
  libiec61850: patch CVE-2024-45970
  libiec61850: patch CVE-2024-45971
  mbedtls: upgrade 3.6.4 -> 3.6.5
  hostapd: patch CVE-2025-24912

Christos Gavros (1):
  corosync: reproducibility issue

Divya Chellam (1):
  jq: fix CVE-2025-9403

Gyorgy Sarvari (27):
  pm-qa: update git fetch protocol
  tokyocabinet: switch to working SRC_URI
  tokyocabinet: fix license
  iperf2: ignore irrelevant CVEs
  jasper: patch CVE-2025-8835
  jasper: patch CVE-2025-8836
  jasper: patch CVE-2025-8837
  etcd: patch CVE-2023-32082
  freerdp3: patch CVE-2024-32039 and CVE-2024-32041
  freerdp3: patch CVE-2024-32040
  freerdp3: patch CVE-2024-32458
  freerdp3: patch CVE-2024-32459
  freerdp3: patch CVE-2024-32460
  freerdp3: patch CVE-2024-32658
  freerdp3: patch CVE-2025-32659
  freerdp3: patch CVE-2024-32660
  freerdp3: patch CVE-2024-32661
  freerdp3: patch CVE-2024-32662
  exiv2: patch CVE-2025-26623
  exiv2: patch CVE-2025-54080
  exiv2: patch CVE-2025-55304
  redis: upgrade 6.2.18 -> 6.2.20
  emacs: patch CVE-2024-30202
  emacs: patch CVE-2024-30203
  emacs: patch CVE-2024-30204
  emacs: patch CVE-2024-30205
  emacs: patch CVE-2024-39331

Hitendra Prajapati (1):
  libjxl: fix CVE-2024-11403 & CVE-2024-11498

Jiaying Song (2):
  webkitgtk3: update 2.44.1 -> 2.44.3
  webkitgtk3: fix do_configure error on beaglebone-yocto

Khem Raj (2):
  freerdp: Upgrade 2.11.2 -> 2.11.7
  influxdb: Do not remove non-existing files

Ninette Adhikari (3):
  xsp: CVE status update for CVE-2006-2658
  influxdb: Update CVE status for CVE-2019-10329
  monkey: Update status for CVE-2013-2183

Peter Marko (12):
  emlog: set CVE_PRODUCT
  freerdp: patch CVE-2024-32661
  freerdp: mark CVE-2024-32662 as fixed
  freerdp3: set CVE_PRODUCT
  corosync: fix upstream version check
  corosync: upgrade 3.1.6 -> 3.1.9
  corosync: patch CVE-2025-30472
  dash: set CVE_PRODUCT
  gattlib: mark CVE-2019-6498 as fixed
  memcached: ignore disputed CVE-2022-26635
  monkey: ignore CVE-2013-1771
  squid: patch CVE-2025-59362

Praveen Kumar (2):
  yasm: fix CVE-2024-22653
  cjson: upgrade 1.7.18 -> 1.7.19

Rajeshkumar Ramasamy (1):
  open-vm-tools: fix CVE-2025-41244

Saravanan (1):
  fio: fix CVE-2025-10823

Soumya Sambu (1):
  python3-django: upgrade 4.2.18 -> 4.2.20

Vijay Anusuri (4):
  poppler: Fix CVE-2025-43718
  redis: upgrade 7.2.8 -> 7.2.11
  redis: upgrade 6.2.16 -> 6.2.18
  vorbis-tools: Fix CVE-2023-43361

Wang Mingyu (1):
  libiec61850: upgrade 1.5.1 -> 1.5.3

Yi Zhao (1):
  redis: upgrade 6.2.14 -> 6.2.16

Yogita Urade (1):
  poppler: fix CVE-2025-52885

 .../recipes-gnome/evince/evince_46.0.bb       |   4 +
 .../libavif/libavif_1.0.1.bb                  |   2 +
 .../vorbis-tools/CVE-2023-43361.patch         |  57 ++
 .../vorbis-tools/vorbis-tools_1.4.2.bb        |   1 +
 .../libiec61850/files/CVE-2024-26529.patch    |  33 +
 .../libiec61850/files/CVE-2024-45970.patch    |  74 +++
 .../libiec61850/files/CVE-2024-45971.patch    | 218 +++++++
 ...iec61850_1.5.1.bb => libiec61850_1.5.3.bb} |   5 +-
 .../{mbedtls_3.6.4.bb => mbedtls_3.6.5.bb}    |   2 +-
 .../squid/files/CVE-2025-59362.patch          |  52 ++
 .../recipes-daemons/squid/squid_6.9.bb        |   1 +
 .../corosync/corosync/CVE-2025-30472.patch    |  69 ++
 .../{corosync_3.1.6.bb => corosync_3.1.9.bb}  |  17 +-
 .../frr/frr/CVE-2024-44070.patch              |  54 ++
 .../recipes-protocols/frr/frr_9.1.bb          |   1 +
 .../net-snmp/net-snmp_5.9.4.bb                |   3 +
 .../libconfuse/files/CVE-2022-40320.patch     |  42 ++
 .../libconfuse/libconfuse_3.3.bb              |   5 +-
 .../memcached/memcached/CVE-2023-46852.patch  |  71 +++
 .../memcached/memcached/CVE-2023-46853.patch  | 117 ++++
 .../memcached/memcached_1.6.17.bb             |   4 +
 .../recipes-support/ntopng/ndpi_4.2.bb        |   2 +
 .../open-vm-tools/CVE-2025-41244.patch        | 123 ++++
 .../open-vm-tools/open-vm-tools_12.3.5.bb     |   1 +
 .../tinyproxy/0001-CVE-2023-49606.patch       |  59 ++
 .../tinyproxy/tinyproxy_1.11.1.bb             |   1 +
 .../fio/fio/CVE-2025-10823.patch              |  37 ++
 meta-oe/recipes-benchmark/fio/fio_3.36.bb     |   2 +
 .../recipes-benchmark/iperf2/iperf2_2.0.13.bb |   3 +
 .../gattlib/gattlib_git.bb                    |   2 +
 .../hostapd/hostapd/CVE-2025-24912_01.patch   |  80 +++
 .../hostapd/hostapd/CVE-2025-24912_02.patch   |  72 +++
 .../hostapd/hostapd_2.10.bb                   |   2 +
 meta-oe/recipes-core/emlog/emlog.inc          |   2 +
 .../recipes-dbs/influxdb/influxdb_1.8.10.bb   |   9 +-
 .../cjson/cjson/CVE-2025-57052.patch          |  33 -
 .../{cjson_1.7.18.bb => cjson_1.7.19.bb}      |   3 +-
 .../jq/jq/CVE-2025-9403.patch                 |  49 ++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |   1 +
 .../yasm/yasm/CVE-2024-22653.patch            |  32 +
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |   1 +
 .../etcd/etcd/CVE-2023-32082.patch            |  86 +++
 meta-oe/recipes-extended/etcd/etcd_3.5.7.bb   |   1 +
 ...-hiredis-use-default-CC-if-it-is-set.patch |   0
 ...ile-to-use-environment-build-setting.patch |   0
 ...003-hack-to-force-use-of-libc-malloc.patch |   8 +-
 .../0004-src-Do-not-reset-FINAL_LIBS.patch    |  10 +-
 ...RCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch |   0
 ...006-Define-correct-gregs-for-RISCV32.patch |   0
 .../init-redis-server                         |   0
 .../{redis-7.2.8 => redis-7.2.11}/redis.conf  |   0
 .../redis.service                             |   0
 .../redis/redis-7.2.8/CVE-2025-32023.patch    | 218 -------
 ...hiredis-use-default-CC-if-it-is-set.patch} |  14 +-
 ...le-to-use-environment-build-setting.patch} |  10 +-
 ...03-hack-to-force-use-of-libc-malloc.patch} |   9 +-
 ...=> 0004-src-Do-not-reset-FINAL_LIBS.patch} |   8 +-
 ...CE-to-get-PTHREAD_MUTEX_INITIALIZER.patch} |   6 +-
 ...006-Define-correct-gregs-for-RISCV32.patch |  12 +-
 .../redis/redis/init-redis-server             |   0
 .../{redis_6.2.14.bb => redis_6.2.20.bb}      |  17 +-
 .../redis/{redis_7.2.8.bb => redis_7.2.11.bb} |   3 +-
 ...E-2024-22857-buffer-overflow-patched.patch |  31 +
 meta-oe/recipes-extended/zlog/zlog_1.2.16.bb  |   4 +-
 .../jasper/jasper/0001-Fixes-400.patch        | 171 +++++
 .../jasper/jasper/0001-Fixes-401.patch        |  78 +++
 .../jasper/jasper/0001-Fixes-402-403.patch    |  62 ++
 .../recipes-graphics/jasper/jasper_4.1.1.bb   |   6 +-
 .../libjxl/libjxl/CVE-2024-11403.patch        |  70 ++
 .../libjxl/libjxl/CVE-2024-11498.patch        | 113 ++++
 .../libjxl/libjxl_0.10.2.bb                   |   6 +-
 meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb |   2 +
 .../libcupsfilters/0001-CVE-2024-47076.patch  |  38 ++
 .../cups/libcupsfilters_2.0.0.bb              |   1 +
 .../cups/libppd/0001-CVE-2024-47175.patch     | 600 ++++++++++++++++++
 meta-oe/recipes-printing/cups/libppd_2.0.0.bb |   5 +-
 meta-oe/recipes-shells/dash/dash_0.5.12.bb    |   2 +
 meta-oe/recipes-support/emacs/emacs_29.1.bb   |   5 +
 ...w.el-mm-display-inline-fontify-Mark-.patch |  27 +
 ...nts-Consider-all-remote-files-unsafe.patch |  38 ++
 ...w-Add-protection-when-untrusted-cont.patch |  60 ++
 ...abbrev-Do-not-evaluate-arbitrary-uns.patch |  71 +++
 ...et-templates-Prevent-code-evaluation.patch |  47 ++
 ...ppendIccProfile-to-fix-quadratic-per.patch |  96 +++
 .../exiv2/exiv2/0001-CVE-2025-54080-fix.patch |  77 +++
 .../0001-Revert-fix-copy-constructors.patch   |  82 +++
 meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb |   6 +-
 .../0001-Fixed-compilation-warnings.patch     |  27 +
 .../freerdp/freerdp/CVE-2024-32661.patch      |  27 +
 .../freerdp/freerdp3/CVE-2024-32039.patch     |  68 ++
 .../freerdp/freerdp3/CVE-2024-32040.patch     |  29 +
 .../freerdp/freerdp3/CVE-2024-32458.patch     | 119 ++++
 .../freerdp/freerdp3/CVE-2024-32459.patch     |  30 +
 .../freerdp/freerdp3/CVE-2024-32460.patch     |  26 +
 .../freerdp/freerdp3/CVE-2024-32658.patch     |  35 +
 .../freerdp/freerdp3/CVE-2024-32659.patch     |  27 +
 .../freerdp/freerdp3/CVE-2024-32660.patch     | 151 +++++
 .../freerdp/freerdp3/CVE-2024-32661.patch     |  28 +
 .../freerdp/freerdp3/CVE-2024-32662.patch     |  28 +
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  15 +-
 .../{freerdp_2.11.2.bb => freerdp_2.11.7.bb}  |   6 +-
 .../hdf5/files/CVE-2025-2913.patch            |  32 +
 .../hdf5/files/CVE-2025-2914.patch            |  47 ++
 .../hdf5/files/CVE-2025-2915.patch            |  50 ++
 ...025-2923-CVE-2025-6816-CVE-2025-6856.patch |  65 ++
 .../hdf5/files/CVE-2025-2924.patch            |  37 ++
 .../hdf5/files/CVE-2025-2925.patch            |  53 ++
 ...-6269-CVE-2025-6270-CVE-2025-6516_01.patch |  65 ++
 ...-6269-CVE-2025-6270-CVE-2025-6516_02.patch | 252 ++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   8 +
 .../0001-CVE-2025-43961-CVE-2025-43962.patch  | 108 ++++
 .../libraw/libraw/0002-CVE-2025-43963.patch   |  40 ++
 .../libraw/libraw/0003-CVE-2025-43964.patch   |  29 +
 .../recipes-support/libraw/libraw_0.21.2.bb   |   7 +-
 .../poppler/poppler/CVE-2025-43718.patch      |  31 +
 .../poppler/poppler/CVE-2025-52885.patch      |  30 +
 .../poppler/poppler_23.04.0.bb                |   2 +
 .../tokyocabinet/tokyocabinet_1.4.48.bb       |   4 +-
 ...kitgtk3_2.44.1.bb => webkitgtk3_2.44.3.bb} |  14 +-
 meta-oe/recipes-test/pm-qa/pm-qa_git.bb       |   2 +-
 ...ngo_4.2.18.bb => python3-django_4.2.20.bb} |   4 +-
 .../recipes-httpd/monkey/monkey_1.6.9.bb      |   2 +
 122 files changed, 4597 insertions(+), 347 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-43361.patch
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-26529.patch
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45970.patch
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45971.patch
 rename meta-networking/recipes-connectivity/libiec61850/{libiec61850_1.5.1.bb => libiec61850_1.5.3.bb} (88%)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.4.bb => mbedtls_3.6.5.bb} (98%)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2025-59362.patch
 create mode 100644 meta-networking/recipes-extended/corosync/corosync/CVE-2025-30472.patch
 rename meta-networking/recipes-extended/corosync/{corosync_3.1.6.bb => corosync_3.1.9.bb} (84%)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch
 create mode 100755 meta-networking/recipes-support/libconfuse/files/CVE-2022-40320.patch
 create mode 100644 meta-networking/recipes-support/memcached/memcached/CVE-2023-46852.patch
 create mode 100644 meta-networking/recipes-support/memcached/memcached/CVE-2023-46853.patch
 create mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-41244.patch
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/0001-CVE-2023-49606.patch
 create mode 100644 meta-oe/recipes-benchmark/fio/fio/CVE-2025-10823.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912_01.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912_02.patch
 delete mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
 rename meta-oe/recipes-devtools/cjson/{cjson_1.7.18.bb => cjson_1.7.19.bb} (95%)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2025-9403.patch
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2024-22653.patch
 create mode 100644 meta-oe/recipes-extended/etcd/etcd/CVE-2023-32082.patch
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.11}/0001-hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.11}/0002-lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.11}/0003-hack-to-force-use-of-libc-malloc.patch (86%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.11}/0004-src-Do-not-reset-FINAL_LIBS.patch (79%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.11}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.11}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.11}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.11}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.8 => redis-7.2.11}/redis.service (100%)
 delete mode 100644 meta-oe/recipes-extended/redis/redis-7.2.8/CVE-2025-32023.patch
 rename meta-oe/recipes-extended/redis/redis/{hiredis-use-default-CC-if-it-is-set.patch => 0001-hiredis-use-default-CC-if-it-is-set.patch} (85%)
 rename meta-oe/recipes-extended/redis/redis/{lua-update-Makefile-to-use-environment-build-setting.patch => 0002-lua-update-Makefile-to-use-environment-build-setting.patch} (93%)
 rename meta-oe/recipes-extended/redis/redis/{oe-use-libc-malloc.patch => 0003-hack-to-force-use-of-libc-malloc.patch} (92%)
 rename meta-oe/recipes-extended/redis/redis/{0001-src-Do-not-reset-FINAL_LIBS.patch => 0004-src-Do-not-reset-FINAL_LIBS.patch} (86%)
 rename meta-oe/recipes-extended/redis/redis/{GNU_SOURCE.patch => 0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch} (91%)
 mode change 100755 => 100644 meta-oe/recipes-extended/redis/redis/init-redis-server
 rename meta-oe/recipes-extended/redis/{redis_6.2.14.bb => redis_6.2.20.bb} (79%)
 rename meta-oe/recipes-extended/redis/{redis_7.2.8.bb => redis_7.2.11.bb} (95%)
 create mode 100644 meta-oe/recipes-extended/zlog/zlog/0001-CVE-2024-22857-buffer-overflow-patched.patch
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-400.patch
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-401.patch
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-402-403.patch
 create mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-11403.patch
 create mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-11498.patch
 create mode 100644 meta-oe/recipes-printing/cups/libcupsfilters/0001-CVE-2024-47076.patch
 create mode 100644 meta-oe/recipes-printing/cups/libppd/0001-CVE-2024-47175.patch
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-file-contents-Consider-all-remote-files-unsafe.patch
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-latex-preview-Add-protection-when-untrusted-cont.patch
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-link-expand-abbrev-Do-not-evaluate-arbitrary-uns.patch
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-macro-set-templates-Prevent-code-evaluation.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-Add-new-method-appendIccProfile-to-fix-quadratic-per.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-CVE-2025-54080-fix.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-Revert-fix-copy-constructors.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32661.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32039.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32040.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32458.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32459.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32460.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32658.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32659.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32660.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32661.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32662.patch
 rename meta-oe/recipes-support/freerdp/{freerdp_2.11.2.bb => freerdp_2.11.7.bb} (93%)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2913.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2914.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2915.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2923-CVE-2025-6816-CVE-2025-6856.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2924.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2925.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_01.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_02.patch
 create mode 100644 meta-oe/recipes-support/libraw/libraw/0001-CVE-2025-43961-CVE-2025-43962.patch
 create mode 100644 meta-oe/recipes-support/libraw/libraw/0002-CVE-2025-43963.patch
 create mode 100644 meta-oe/recipes-support/libraw/libraw/0003-CVE-2025-43964.patch
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-43718.patch
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-52885.patch
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.44.1.bb => webkitgtk3_2.44.3.bb} (89%)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.18.bb => python3-django_4.2.20.bb} (63%)


