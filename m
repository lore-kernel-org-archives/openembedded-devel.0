Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5128CCA0EC3
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 11:56:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.23142.1694519812493996746
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Sep 2023 04:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=QFVCQlKj;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694519812; x=1726055812;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lZeG30NtmeXIsjcIEC5RMJBgL5cTrLD2gDo6cgm3fWE=;
  b=QFVCQlKjjDouW2QNWvc0Ae58Rh3qLiH0Zcow3MoMWQAMFTdiS5TpOU8F
   fYCIDvXubv12YegchMIyWfx6+IlCRIbjTD6az+mKOuTPjWreFTKQx1aRQ
   xST2DtOD0y9ceUn1s7AkMzfh4SMqqiL+ccNl/LGKB6epK2Ma0xEA01TZA
   YxwPUBflMXrlsLiXYIftTDX98+4QWVjOrgwvUzDGX8cauMHbc+YEr45nm
   wZnPZL6bMLKYjFHtwSibePoAC8q7HSj3XfOilefz0XO/m7Si7HN4jYqzU
   rTRrABFr0QU/wTKgwzvC1EQ5PnHXSQZ0+RLt3eSTaEotAWxSksNhhN4XM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="444787048"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="444787048"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 04:56:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="809217328"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="809217328"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga008.fm.intel.com with ESMTP; 12 Sep 2023 04:56:50 -0700
From: chee.yang.lee@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] keepalived: 2.2.2 -> 2.2.8
Date: Tue, 12 Sep 2023 19:37:13 +0800
Message-Id: <20230912113713.1238493-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Sep 2023 11:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104845

From: Lee Chee Yang <chee.yang.lee@intel.com>

add EXTRA_CFLAGS to Fix reproducibility.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 ...layer4-Change-order-of-include-files.patch | 60 -------------------
 ...eepalived_2.2.2.bb => keepalived_2.2.8.bb} |  5 +-
 2 files changed, 3 insertions(+), 62 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/keepalived/keepalived/0001-layer4-Change-order-of-include-files.patch
 rename meta-networking/recipes-daemons/keepalived/{keepalived_2.2.2.bb => keepalived_2.2.8.bb} (91%)

diff --git a/meta-networking/recipes-daemons/keepalived/keepalived/0001-layer4-Change-order-of-include-files.patch b/meta-networking/recipes-daemons/keepalived/keepalived/0001-layer4-Change-order-of-include-files.patch
deleted file mode 100644
index 678a208ac3..0000000000
--- a/meta-networking/recipes-daemons/keepalived/keepalived/0001-layer4-Change-order-of-include-files.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From a85ca79143a87286f793957e803ee3daf03c2b57 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 6 Jul 2021 14:06:44 -0700
-Subject: [PATCH] layer4: Change order of include files
-
-curent order to include standard headers first is causing an isue with
-glibc 2.34 + kernel-headers 5.13+ where order of including netinet/in.h
-and linux/in.h matters and it does not define __UAPI_DEF_IN_IPPROTO
-before including linux/in.h and then later includes netinet/in.h which
-then means lot of definitions will be defined twice and compile would
-fail. Re-ordering the local headers to appear first solves the issue
-amicably, and I think this is right order too
-
-Upsteam-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- keepalived/core/layer4.c | 21 ++++++++++-----------
- 1 file changed, 10 insertions(+), 11 deletions(-)
-
-diff --git a/keepalived/core/layer4.c b/keepalived/core/layer4.c
-index 90cdc84..c122c29 100644
---- a/keepalived/core/layer4.c
-+++ b/keepalived/core/layer4.c
-@@ -23,6 +23,16 @@
- 
- #include "config.h"
- 
-+#include "layer4.h"
-+#include "logger.h"
-+#include "scheduler.h"
-+#ifdef _WITH_LVS_
-+#include "check_api.h"
-+#endif
-+#include "bitops.h"
-+#include "utils.h"
-+#include "align.h"
-+
- #include <stdio.h>
- #include <errno.h>
- #include <unistd.h>
-@@ -33,17 +43,6 @@
- #include <sys/time.h>
- #endif
- #include <linux/errqueue.h>
--#include <netinet/in.h>
--
--#include "layer4.h"
--#include "logger.h"
--#include "scheduler.h"
--#ifdef _WITH_LVS_
--#include "check_api.h"
--#endif
--#include "bitops.h"
--#include "utils.h"
--#include "align.h"
- 
- // #define ICMP_DEBUG	1
- 
diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.bb b/meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb
similarity index 91%
rename from meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.bb
rename to meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb
index 204d2fd116..dd193b12fc 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.bb
+++ b/meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb
@@ -11,9 +11,8 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.keepalived.org/software/${BP}.tar.gz \
-           file://0001-layer4-Change-order-of-include-files.patch \
            "
-SRC_URI[sha256sum] = "103692bd5345a4ed9f4581632ea636214fdf53e45682e200aab122c4fa674ece"
+SRC_URI[sha256sum] = "85882eb62974f395d4c631be990a41a839594a7e62fbfebcb5649a937a7a1bb6"
 UPSTREAM_CHECK_URI = "https://github.com/acassen/keepalived/releases"
 
 DEPENDS = "libnfnetlink openssl"
@@ -29,6 +28,8 @@ PACKAGECONFIG[systemd] = "--with-init=systemd --with-systemdsystemunitdir=${syst
 
 EXTRA_OEMAKE = "initdir=${sysconfdir}/init.d"
 
+export EXTRA_CFLAGS = "${CFLAGS}"
+
 do_install:append() {
     if [ -f ${D}${sysconfdir}/init.d/${BPN} ]; then
         chmod 0755 ${D}${sysconfdir}/init.d/${BPN}
-- 
2.37.3


