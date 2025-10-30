Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B696CCCF9EB
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 01:13:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by mx.groups.io with SMTP id smtpd.web11.17979.1761786794897128751
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 18:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=XpoDhgIi;
 spf=pass (domain: intel.com, ip: 192.198.163.15, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761786795; x=1793322795;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4fQgbo2LXDf2d698xYUh/p42EHr8nfdvoU6f1HZRCpc=;
  b=XpoDhgIio/gNQhRlmjt8L90yBNSuNgDfQM3bNpivs7mIS55xQw2tLLcl
   7WNk+GvfNDNCSu6R3tDCS8mGp8lwOZ56rjj5BlK7LQxQK0YKXUjH1ip2Z
   mbjSR+FHQrjxWJOUDHgj498KxGB29PKVb5QuOkj9Ps9LXSfjSIk/T2ilz
   6z2Pk8z8eslMrkj5lKtG+UUzHWSGXkajFXFyEItK1UICvKKvvDOzHI4ts
   Cix01E5Ui6szezhwNP58uHIiotADGz9rHrPu9nAbekRGyBT/gGeQeSF/w
   F+Anb/d1lkZc1wKD6lAWq/jlGJ5tz72NQiEyZ0W0Jn8/aMHdmCbslO0g5
   Q==;
X-CSE-ConnectionGUID: i4/PumsDRNuq8s1d205Igw==
X-CSE-MsgGUID: e9HU4UPzRZGhTcGonY7VmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="64018348"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="64018348"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 18:13:15 -0700
X-CSE-ConnectionGUID: MZQU49IASzW8AxguWTtMrg==
X-CSE-MsgGUID: eygqBhnpTXmOv0AhhDET2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="223038316"
Received: from unknown (HELO anmitta2-mobl4.intel.com) ([10.247.172.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 18:13:13 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Subject: [scarthgap][PATCH 00/24] Scarthgap pull request
Date: Thu, 30 Oct 2025 09:13:06 +0800
Message-ID: <cover.1761786284.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 01:13:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121174

This is an older set of changes that I wasn't able to send but
had tested earlier:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1034

This mostly includes CVE fixes sent to list and some SRC_URI and host gcc
version relat changes.

The following changes since commit e621da947048842109db1b4fd3917a02e0501aa2:

  procmail: Add -Wno-implicit-int to fix error of do_compile (2025-09-24 10:04:48 +0800)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap

Adrian Freihofer (1):
  thrift: fix build with gcc 15

Changqing Li (1):
  mariadb: correct STACK_DIRECTION setting

Grygorii Tertychnyi (1):
  libusbgx: fix gadget-stop install

Gyorgy Sarvari (6):
  mosh: set working SRC_URI
  psqlodbc: set valid SRC_URI
  collectd: set working SRC_URI
  apache2: ignore irrelevant CVEs
  civetweb: patch CVE-2025-55763
  dovecot: patch CVE-2022-30550

Jeroen Hofstee (2):
  php: ignore CVE-2024-3566
  nodejs: ignore CVE-2024-3566

Khem Raj (1):
  uim: Stick to C17

Peter Marko (6):
  ace: ignore CVE-2009-1147
  audiofile: fix multiple CVEs
  audiofile: patch CVE-2017-6829
  audiofile: fix multiple CVEs
  audiofile: patch CVE-2017-6831
  audiofile: patch CVE-2017-6839

Praveen Kumar (1):
  polkit: fix CVE-2025-7519

Saravanan (1):
  udisks2: upgrade 2.10.1 -> 2.10.2

Sunil Dora (1):
  layer.conf: add bpftrace to NON_MULTILIB_RECIPES

Yogita Urade (1):
  indent: fix CVE-2023-40305

hongxu (1):
  indent: fix CVE-2024-0911

mark.yang (1):
  srecord: fix build failure with gcc-15

 ...w-in-directory-URI-slash-redirection.patch |   57 +
 .../civetweb/civetweb_1.16.bb                 |    1 +
 ...g-passdbs-with-identical-driver-args.patch |  137 +
 .../recipes-support/dovecot/dovecot_2.3.21.bb |    1 +
 meta-oe/conf/layer.conf                       |    2 +-
 .../recipes-connectivity/ace/ace_6.5.19.bb    |    2 +
 .../recipes-connectivity/mosh/mosh_1.4.0.bb   |    5 +-
 ...missing-cstdint-include-for-int64_t-.patch |   51 +
 .../thrift/thrift_0.20.0.bb                   |    3 +-
 meta-oe/recipes-dbs/mysql/mariadb.inc         |    1 -
 .../psqlodbc/psqlodbc_16.00.0000.bb           |    2 +-
 .../recipes-devtools/nodejs/nodejs_20.18.2.bb |    1 +
 meta-oe/recipes-devtools/php/php_8.2.29.bb    |    1 +
 .../collectd/collectd_5.12.0.bb               |    4 +-
 ...ap-buffer-underread-in-set_buf_break.patch |  123 +
 .../indent/indent/CVE-2023-40305_0001.patch   | 4196 ++++++++++++++++
 .../indent/indent/CVE-2023-40305_0002.patch   | 4254 +++++++++++++++++
 .../recipes-extended/indent/indent_2.2.12.bb  |    3 +
 .../polkit/files/CVE-2025-7519.patch          |   34 +
 meta-oe/recipes-extended/polkit/polkit_124.bb |    5 +-
 .../audiofile/audiofile_0.3.6.bb              |    5 +
 ...ays-check-the-number-of-coefficients.patch |   45 +
 ...ues-to-fix-index-overflow-in-IMA.cpp.patch |   43 +
 ...multiplication-overflow-in-sfconvert.patch |   79 +
 ...ail-when-error-occurs-in-parseFormat.patch |   46 +
 ...lication-overflow-in-MSADPCM-decodeS.patch |  126 +
 .../recipes-support/libusbgx/libusbgx_git.bb  |    2 +-
 ...e-with-gcc-15-by-adding-cstdint-head.patch |   36 +
 .../recipes-support/srecord/srecord_1.65.0.bb |    4 +-
 .../udisks/udisks2/CVE-2025-6019.patch        |   51 -
 .../{udisks2_2.10.1.bb => udisks2_2.10.2.bb}  |    3 +-
 meta-oe/recipes-support/uim/uim_1.8.8.bb      |    2 +
 .../recipes-httpd/apache2/apache2_2.4.65.bb   |   12 +
 33 files changed, 9273 insertions(+), 64 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/civetweb/civetweb/0001-Fix-heap-overflow-in-directory-URI-slash-redirection.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/0001-THRIFT-5842-Add-missing-cstdint-include-for-int64_t-.patch
 create mode 100644 meta-oe/recipes-extended/indent/indent/0001-Fix-a-heap-buffer-underread-in-set_buf_break.patch
 create mode 100644 meta-oe/recipes-extended/indent/indent/CVE-2023-40305_0001.patch
 create mode 100644 meta-oe/recipes-extended/indent/indent/CVE-2023-40305_0002.patch
 create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2025-7519.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0006-Check-for-multiplication-overflow-in-sfconvert.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0007-Actually-fail-when-error-occurs-in-parseFormat.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0008-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch
 create mode 100644 meta-oe/recipes-support/srecord/files/0001-fix-build-failure-with-gcc-15-by-adding-cstdint-head.patch
 delete mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2025-6019.patch
 rename meta-oe/recipes-support/udisks/{udisks2_2.10.1.bb => udisks2_2.10.2.bb} (95%)


