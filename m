Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7583BCAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 09:06:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by mx.groups.io with SMTP id smtpd.web11.12114.1757667987081962388
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Sep 2025 02:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=ahCalPZE;
 spf=pass (domain: intel.com, ip: 192.198.163.9, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757667987; x=1789203987;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Cl+UrlMcsk1gohW5erEMXwO59csKjW9RuWl8yA+o3Yc=;
  b=ahCalPZEwstR+wo/tykdQ9Q2m+ITZ7Drh+Pw6rWuxpUCV0srryid6nQJ
   7AyF+FVmaeQUSyae7NQH+W1tSGmZeRFVafG2Ivv//1T32X6WAdfR8OR+s
   k8cp1SvnjU4WFJtgKRz/aydecbkqUHGS9UpzkAQD1QFoHR+9v1rXIQ8Lt
   aUT7zLGSGB9QX1gOvMkwvST/dpaoyTjr5d5dIOsg3nzZqSauBEejilhfJ
   Y8ef98l9OOnhWMxcTcSKU+tUmQeDArQvz6NyrAQP/dCB3604Pt5eafNj9
   CWudRhaQ7Z4x3pV+BdaeADcyhh2CZmw6Z+RmFXWsgPis+w19UgZkkpKaq
   g==;
X-CSE-ConnectionGUID: 6Su1jcNaRBiQksixkYk4Ow==
X-CSE-MsgGUID: NKR+uG3NTmKuC6QZmc0akA==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="70695006"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="70695006"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 02:06:26 -0700
X-CSE-ConnectionGUID: mXnk92eFSWunQZGjCmzpSQ==
X-CSE-MsgGUID: fZmEagqiSuSvXvbEZNDBTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="178261337"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 02:06:25 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 00/24] Scarthgap pull request
Date: Fri, 12 Sep 2025 17:06:14 +0800
Message-ID: <cover.1757666820.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Sep 2025 09:06:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119376

Please merge these changes. Tested using qemux86-64 and qemuarm64.

The following changes since commit c29a18fa39ede952f3f6108ec007c1906e2d9a0d:

  mbedtls: drop tag parameter from SRC_URI. (2025-08-18 08:35:05 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap

Alexandre Truong (1):
  hunspell-dictionaries: switch branch from master to main

Changqing Li (1):
  luajit: fix several CVEs

Deepak Rathore (1):
  protobuf 4.25.8: Mark CVE-2024-7254 as patched

Gyorgy Sarvari (1):
  poppler: fix typos in CVE-2025-52886-0001.patch

Hitendra Prajapati (1):
  libssh: fix CVE-2025-4877

Jan Vermaete (1):
  python3-werkzeug: added python3-difflib as RDEPENDS

Jiaying Song (1):
  v4l-utils: Fix QA and build errors related to _TIME_BITS on 32-bit

Martin Jansa (1):
  abseil-cpp: fix build with gcc-15 on host

Martin Schwan (1):
  linuxptp: Add systemd instance specifier for ptp4l dependency

Michael Opdenacker (1):
  kernel-hardening-checker: backport recipe

Peter Marko (1):
  nginx: patch CVE-2025-53859

Praveen Kumar (1):
  php: upgrade 8.2.28 -> 8.2.29

Randolph Sapp (1):
  vulkan-cts: allow vulkan versions > 1.3

Roland Kovacs (1):
  jq: add Upstream-Status and CVE tags into .patch files

Yogita Urade (2):
  poppler: fix CVE-2025-50420
  postgresql: upgrade 16.9 -> 16.10

Zhang Peng (8):
  gnuplot: fix CVE-2025-3359
  gnuplot: fix CVE-2025-31176
  gnuplot: fix CVE-2025-31177
  gnuplot: fix CVE-2025-31178
  gnuplot: fix CVE-2025-31179
  gnuplot: fix CVE-2025-31180
  gnuplot: fix CVE-2025-31181
  iperf3: fix CVE-2025-54349

 .../iperf3/iperf3/CVE-2025-54349.patch        |  97 +++++++++++
 .../recipes-benchmark/iperf3/iperf3_3.18.bb   |   1 +
 .../linuxptp/systemd/phc2sys@.service.in      |   4 +-
 ...c-bypass-autoconf-2.69-version-check.patch |   4 +-
 ...postgresql_16.9.bb => postgresql_16.10.bb} |   4 +-
 ...r-internal-Explicitly-include-cstdin.patch |  34 ++++
 .../abseil-cpp/abseil-cpp_20240116.3.bb       |   1 +
 .../jq/jq/CVE-2024-23337.patch                |   3 +
 .../jq/jq/CVE-2024-53427.patch                |   3 +
 .../jq/jq/CVE-2025-48060.patch                |   3 +
 .../luajit/luajit/CVE-2024-25176.patch        |  32 ++++
 .../luajit/luajit/CVE-2024-25177.patch        |  47 +++++
 .../luajit/luajit/CVE-2024-25178.patch        | 162 ++++++++++++++++++
 meta-oe/recipes-devtools/luajit/luajit_git.bb |   3 +
 .../php/{php_8.2.28.bb => php_8.2.29.bb}      |   2 +-
 .../protobuf/protobuf_4.25.8.bb               |   2 +
 .../gnuplot/gnuplot/CVE-2025-31176.patch      |  86 ++++++++++
 .../gnuplot/gnuplot/CVE-2025-31177.patch      |  40 +++++
 .../gnuplot/gnuplot/CVE-2025-31178.patch      |  95 ++++++++++
 .../gnuplot/gnuplot/CVE-2025-31179.patch      |  35 ++++
 .../gnuplot/gnuplot/CVE-2025-31180.patch      |  43 +++++
 .../gnuplot/gnuplot/CVE-2025-31181.patch      |  43 +++++
 .../gnuplot/gnuplot/CVE-2025-3359.patch       |  67 ++++++++
 .../recipes-extended/gnuplot/gnuplot_5.4.3.bb |   7 +
 ...e-CTS-with-unknown-versions-of-Vulka.patch |  41 +++++
 .../vk-gl-cts/vulkan-cts_1.3.7.3.bb           |   1 +
 ...on.build-fix-arm-_TIME_BITS-64-error.patch |  38 ++++
 .../v4l2apps/v4l-utils_1.26.1.bb              |   5 +-
 ...ject.toml-fix-up-license-information.patch |  31 ++++
 ...-relax-setuptool-version-requirement.patch |  29 ++++
 .../kernel-hardening-checker_0.6.10.2.bb      |  41 +++++
 .../hunspell/hunspell-dictionaries.bb         |   2 +-
 .../libssh/libssh/CVE-2025-4877.patch         |  57 ++++++
 .../recipes-support/libssh/libssh_0.10.6.bb   |   1 +
 .../poppler/poppler/CVE-2025-50420.patch      |  38 ++++
 .../poppler/poppler/CVE-2025-52886-0001.patch | 144 ++++++++--------
 .../poppler/poppler_23.04.0.bb                |   1 +
 .../python/python3-werkzeug_3.0.6.bb          |   1 +
 .../nginx/files/CVE-2025-53859.patch          | 131 ++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx.inc  |   1 +
 40 files changed, 1293 insertions(+), 87 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_16.9.bb => postgresql_16.10.bb} (75%)
 create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-PR-1739-container-internal-Explicitly-include-cstdin.patch
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25176.patch
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25177.patch
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25178.patch
 rename meta-oe/recipes-devtools/php/{php_8.2.28.bb => php_8.2.29.bb} (99%)
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31176.patch
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31177.patch
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31178.patch
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31179.patch
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31180.patch
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31181.patch
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-3359.patch
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts/0001-Allow-running-the-CTS-with-unknown-versions-of-Vulka.patch
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-meson.build-fix-arm-_TIME_BITS-64-error.patch
 create mode 100644 meta-oe/recipes-security/kernel-hardening-checker/files/0001-pyproject.toml-fix-up-license-information.patch
 create mode 100644 meta-oe/recipes-security/kernel-hardening-checker/files/0002-pyproject.toml-relax-setuptool-version-requirement.patch
 create mode 100644 meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.2.bb
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-4877.patch
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-50420.patch
 create mode 100755 meta-webserver/recipes-httpd/nginx/files/CVE-2025-53859.patch


