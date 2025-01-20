Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C08C02190
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:21 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.32742.1737360857382920914
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Sqyy+TEZ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360857; x=1768896857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=SmXlwuwrpKxl6akZW9t39lD9mw5w9p1iYwuvnotp8qA=;
  b=Sqyy+TEZnn4jES76QpcMrvCZuVnswVtyVGdLMaKN5+uzgATE/WNvXqg8
   4alQ2vHMD47+HNXPxqUPwlc5DW7qG2qLrHqm7bXpR+hm2+P9hW9GEriU6
   nzUEAfJ12THpX7T9YFT+YlnjwAIl7CcWEUXtwGD/BnsvuxBNzQOgaewI5
   lNeOzzZ5ehEYNxDZNIAKp+B35mxmNXvB4orRk2GvJfxNck+rvGy6NVZcU
   lmyyri9HMXCW7jQN+CiUj10SZqzhGC3BiWgTVx0tBomms8uqsgiYgifym
   mDDxTFrDg8fMsANpUfWXEeFtuoAUCNhKkIP4CASffO3UESeWCRGglflpC
   w==;
X-CSE-ConnectionGUID: o/UPAJ+QSG2UuGgdHAS8AQ==
X-CSE-MsgGUID: kJlQIhkNQ2OtUsTdeN6VpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="187149520"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="187149520"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:15 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 35423DBB87
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:13 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0F006D4C23
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A2D2F6BAD4
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:12 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 468C41A0074;
	Mon, 20 Jan 2025 16:14:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/32] freeipmi: update 1.6.14 -> 1.6.15
Date: Mon, 20 Jan 2025 16:13:39 +0800
Message-Id: <1737360846-4824-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10--16.999600-10.000000
X-TMASE-MatchedRID: tb08Jnm0CIOl1LO5A+/VNm03YawHJvPCkdS3kPlaZyXkABvhO7aBvq4r
	mQIDoB6Sijb+6maEeyhEBdPSLU0jQRs7n0Ur0F2YM6A0eGVTtgzUxCm0TmLrkN9RlPzeVuQQli+
	BaqMwTNo1gIHPPGxSe9nl43V4kx2lWkIi5GvRHEo/QdUh6LEl0ME5XPQnBzGXR/IzlV+CMbbT0P
	pHDbMis/GreLFhOYYLdtr8Cf398Wc1v/MCqtJoNdMJkd+MUUHPh3lMu2Vu1gIR34ro7k23nYplw
	qccf5fwxZBdIyJDG3eIPZUBJxmPibotpw4iUQe/ngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIqxB3
	2o9eGclVaBFytIQUtw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114967

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fix-undeclared-function-errors.patch
removed since it's included in 1.6.15

Changelog:
==========
- In ipmi-config, fix incorrect output of IPv6_Dynamic_Address_Source_Type.
- In ipmi-oem, increase precision of Dell cumulative energy output.
- Do not advertise options that are only available when special debugging
  is compiled into FreeIPMI.
- Fix build errors with implicit-function-declaration.
- libfreeipmi: remove unnecessary / duplicate parameter checks.
- Fix gcc 14.x build failures.
- Minor documentation updates.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Fix-undeclared-function-errors.patch | 48 -------------------
 ...{freeipmi_1.6.14.bb => freeipmi_1.6.15.bb} |  5 +-
 2 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/0001-Fix-undeclared-function-errors.patch
 rename meta-oe/recipes-support/freeipmi/{freeipmi_1.6.14.bb => freeipmi_1.6.15.bb} (85%)

diff --git a/meta-oe/recipes-support/freeipmi/freeipmi/0001-Fix-undeclared-function-errors.patch b/meta-oe/recipes-support/freeipmi/freeipmi/0001-Fix-undeclared-function-errors.patch
deleted file mode 100644
index 43e905f33a..0000000000
--- a/meta-oe/recipes-support/freeipmi/freeipmi/0001-Fix-undeclared-function-errors.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 3018aa9822c680663ebd19542bcd757dc9baf20a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 8 Sep 2024 20:16:49 -0700
-Subject: [PATCH] Fix undeclared function errors
-
-e.g.
-
-ipmi-sel-string-supermicro-x10dimm-common.c:87:14: error: call to undeclared function 'sel_string_output_supermicro_dimm_event_d
-    |    87 |   if ((ret = sel_string_output_supermicro_dimm_event_data2_event_data3 (ctx,
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/freeipmi-devel/2024-09/msg00001.html]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ipmi-sensors/ipmi-sensors-oem-intel.c               | 1 +
- libfreeipmi/sel/ipmi-sel-string-supermicro-common.h | 9 +++++++++
- 2 files changed, 10 insertions(+)
-
-diff --git a/ipmi-sensors/ipmi-sensors-oem-intel.c b/ipmi-sensors/ipmi-sensors-oem-intel.c
-index 5e0f373..872a730 100644
---- a/ipmi-sensors/ipmi-sensors-oem-intel.c
-+++ b/ipmi-sensors/ipmi-sensors-oem-intel.c
-@@ -36,6 +36,7 @@
- #include "ipmi-sensors-oem-intel-s2600jf.h"
- #include "ipmi-sensors-oem-intel-quanta-qssc-s4r.h"
- #include "ipmi-sensors-oem-intel-node-manager.h"
-+#include "ipmi-sensors-oem-intel-s2600wp.h"
- 
- #include "freeipmi-portability.h"
- #include "pstdout.h"
-diff --git a/libfreeipmi/sel/ipmi-sel-string-supermicro-common.h b/libfreeipmi/sel/ipmi-sel-string-supermicro-common.h
-index 5785f2b..9e29bd6 100644
---- a/libfreeipmi/sel/ipmi-sel-string-supermicro-common.h
-+++ b/libfreeipmi/sel/ipmi-sel-string-supermicro-common.h
-@@ -39,4 +39,13 @@ int sel_string_output_supermicro_overheat_event_data1_class_oem (ipmi_sel_ctx_t
-                                                                  unsigned int *wlen,
-                                                                  struct ipmi_sel_system_event_record_data *system_event_record_data);
- 
-+int sel_string_output_supermicro_dimm_event_data2_event_data3 (ipmi_sel_ctx_t ctx,
-+                                                               struct ipmi_sel_entry *sel_entry,
-+                                                               uint8_t sel_record_type,
-+                                                               char *buf,
-+                                                               unsigned int buflen,
-+                                                               unsigned int flags,
-+                                                               unsigned int *wlen,
-+                                                               struct ipmi_sel_system_event_record_data *system_event_record_data,
-+                                                               int *oem_rv);
- #endif /* IPMI_SEL_STRING_SUPERMICRO_COMMON_H */
diff --git a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.14.bb b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.15.bb
similarity index 85%
rename from meta-oe/recipes-support/freeipmi/freeipmi_1.6.14.bb
rename to meta-oe/recipes-support/freeipmi/freeipmi_1.6.15.bb
index e9b28cee38..e977bbcd9e 100644
--- a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.14.bb
+++ b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.15.bb
@@ -13,9 +13,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.pstdout;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.sunbmc;md5=c03f21cd76ff5caba6b890d1213cbfbb"
 
-SRC_URI = "${GNU_MIRROR}/freeipmi/freeipmi-${PV}.tar.gz \
-           file://0001-Fix-undeclared-function-errors.patch"
-SRC_URI[sha256sum] = "1a3dac5c76b7ccc4d4f86aa12b8ef9b212baef7489bf05e899b89abb7e14edb5"
+SRC_URI = "${GNU_MIRROR}/freeipmi/freeipmi-${PV}.tar.gz"
+SRC_URI[sha256sum] = "d6929c354639f5ce75b5b1897e8b366eb63625c23e5c4590a7aea034fe2b8caf"
 
 DEPENDS = "libgcrypt"
 DEPENDS:append:libc-musl = " argp-standalone"
-- 
2.43.0


