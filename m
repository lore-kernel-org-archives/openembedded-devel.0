Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FAC1C83F1D
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 10:02:07 +0000 (UTC)
Received: from esa7.hc324-48.eu.iphmx.com (esa7.hc324-48.eu.iphmx.com [207.54.71.126])
 by mx.groups.io with SMTP id smtpd.web11.10154.1752228116595437643
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 03:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=OxYZbjw/;
 spf=pass (domain: bmw.de, ip: 207.54.71.126, mailfrom: prvs=28004f72d=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752228116; x=1783764116;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=G1KFv3HkRz0nqlw5VcTnLCVX8W67lVCDgsp55mTbIfw=;
  b=OxYZbjw/zKJRZxS8NvLNkSaA3OrmX29ECmyUQDVjVk5z237EjBAEGRJB
   pQ05XgIJmqoSqBCLeP1ccR/Fv6F2soQ0bRuhHzajxSiOExoOWPO03MCpa
   yuDLfQIoJjcf2czMZV4xiMa9+H1vh++RKDN5u2VThkC1PapcfmZrouuIJ
   U=;
X-CSE-ConnectionGUID: 1EdOVw/UT5mdj+HcDimMBw==
X-CSE-MsgGUID: sDVI1EQiTsaejLdExLZjNw==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa7.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Jul 2025 12:01:39 +0200
Received: from unknown (HELO esabb2.muc) ([10.31.187.133]) by esagw4.muc with
 ESMTP/TLS; 11 Jul 2025 12:01:23 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb2.muc with ESMTP/TLS; 11 Jul 2025 12:01:24 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.215) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Fri, 11 Jul 2025 12:01:23 +0200
X-CSE-ConnectionGUID: /A8TyOB1QTeparC2DCNyGg==
X-CSE-MsgGUID: dZV4OS6wQ1W7YhziVJ/PYQ==
X-CSE-ConnectionGUID: blHNbKmLSa6+YkHEa/jkMA==
X-CSE-MsgGUID: qmK4cO+dR2GhZ8gIFUXFtw==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>, <alperyasinak1@gmail.com>,
	<raj.khem@gmail.com>, <f_l_k@t-online.de>, <alex.kanavin@gmail.com>
Subject: [meta-oe][PATCH 00/10] Patches to allow builds with CMake 4+
Date: Fri, 11 Jul 2025 12:00:17 +0200
Message-ID: <20250711100052.255467-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP12E.europe.bmw.corp (2a03:1e80:a15:58f::1:320) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 10:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118443

These patches are part of the coordinated effort to allow builds of
meta-openembedded with CMake 4+ as part of the ongoing bump CMake to 4.0.3 in
openembedded-core (see [0]).

[0]: https://lists.openembedded.org/g/openembedded-core/topic/patch_v5_0_7_cmake_major/113965735

CC: alperyasinak1@gmail.com
CC: raj.khem@gmail.com
CC: f_l_k@t-online.de
CC: alex.kanavin@gmail.com

Moritz Haase (10):
  zeromq: Backport patches to support builds with CMake 4+
  avro-c: upgrade 1.11.3 -> 1.12.0
  cpputest: Backport patches to support builds with CMake 4+
  redis-plus-plus: upgrade 1.3.11 -> 1.3.14
  heaptrack: Allow to build with CMake 4+
  wbxml2: upgrade 0.10.8 -> 0.11.10
  upm: Allow to build with CMake 4+
  pcapplusplus: upgrade 24.09 -> 25.05
  synergy: Allow to build with CMake 4+
  [RFC] vulkan-cts: upgrade 1.4.2.1 -> 1.4.3.1

 ...-Remove-whitespace-in-operator-_json.patch |  52 ---
 ...lusplus_24.09.bb => pcapplusplus_25.05.bb} |   6 +-
 ...make_minimum_required-before-project.patch |  41 ++
 ...pper-bound-in-cmake_minimum_required.patch |  56 +++
 .../zeromq/zeromq_4.3.5.bb                    |   2 +
 .../heaptrack/heaptrack_1.2.0.bb              |   4 +-
 ...update-cmake_minimum_required-to-3.5.patch |  34 ++
 ...us_1.3.11.bb => redis-plus-plus_1.3.14.bb} |   6 +-
 meta-oe/recipes-extended/upm/upm_git.bb       |   4 +-
 ...LAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch |  29 --
 .../vk-gl-cts/khronos-cts.inc                 |   1 -
 .../vk-gl-cts/vulkan-cts-sources.inc          |  25 +-
 ...n-cts_1.4.2.1.bb => vulkan-cts_1.4.3.1.bb} |   2 +-
 ...-Fix-typos-in-docs-and-examples-2795.patch |  59 ---
 ...O-3960-C-Fix-st-ANYARGS-warning-2798.patch | 386 ------------------
 .../{avro-c_1.11.3.bb => avro-c_1.12.0.bb}    |   8 +-
 .../{wbxml2_0.10.8.bb => wbxml2_0.11.10.bb}   |  11 +-
 .../recipes-support/synergy/synergy_git.bb    |   4 +-
 ...um_required-before-project-in-CMakeL.patch |  36 ++
 .../0002-Squelch-deprecation-warning.patch    |  43 ++
 meta-oe/recipes-test/cpputest/cpputest_4.0.bb |   5 +-
 21 files changed, 250 insertions(+), 564 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-Remove-whitespace-in-operator-_json.patch
 rename meta-oe/recipes-connectivity/pcapplusplus/{pcapplusplus_24.09.bb => pcapplusplus_25.05.bb} (83%)
 create mode 100644 meta-oe/recipes-connectivity/zeromq/files/0002-cmake_minimum_required-before-project.patch
 create mode 100644 meta-oe/recipes-connectivity/zeromq/files/0003-set-upper-bound-in-cmake_minimum_required.patch
 create mode 100644 meta-oe/recipes-extended/redis-plus-plus/files/0001-update-cmake_minimum_required-to-3.5.patch
 rename meta-oe/recipes-extended/redis-plus-plus/{redis-plus-plus_1.3.11.bb => redis-plus-plus_1.3.14.bb} (86%)
 delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch
 rename meta-oe/recipes-graphics/vk-gl-cts/{vulkan-cts_1.4.2.1.bb => vulkan-cts_1.4.3.1.bb} (92%)
 delete mode 100644 meta-oe/recipes-support/avro/avro-c/0001-AVRO-3957-C-Fix-typos-in-docs-and-examples-2795.patch
 delete mode 100644 meta-oe/recipes-support/avro/avro-c/0001-AVRO-3960-C-Fix-st-ANYARGS-warning-2798.patch
 rename meta-oe/recipes-support/avro/{avro-c_1.11.3.bb => avro-c_1.12.0.bb} (60%)
 rename meta-oe/recipes-support/opensync/{wbxml2_0.10.8.bb => wbxml2_0.11.10.bb} (50%)
 create mode 100644 meta-oe/recipes-test/cpputest/cpputest/0001-Call-cmake_minimum_required-before-project-in-CMakeL.patch
 create mode 100644 meta-oe/recipes-test/cpputest/cpputest/0002-Squelch-deprecation-warning.patch


