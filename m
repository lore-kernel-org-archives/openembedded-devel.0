Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E7D91112251
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:14:21 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7064.1775096043356987981
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TU40jDg/;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096042; x=1806632042;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N8Mk/NHkz+dJfS5eKY5jK1a7Rzj8LqgEJUPWj2W4VH4=;
  b=TU40jDg/b4vPsAXe6G7iYtipeCP72MYsIUkpaCgu64m06rYLKWfIYIq5
   5SrSBHVS9lNoAJ3+eJq+6Pk7t1qbh8JNXe0h3e4E2YG3op7GkP4PiQIzR
   Xplx32hkM2hIobcJgxEsPbPD+uZiO/1Yiba5szUSYEfViSwuPTHjqY8ZU
   CInNhN3iJvvonaxas54EDs6rGZ2flCKS6k4bkdGqOlxjQR7BHYSTdU69G
   S4LmFLKbCQPv6Fu86r1awWZNhYObsJQMKk4DczhTrrX2IzBUZQxV1eHvV
   fDpsxyVm/rzIpE9xGuqAmn9rqvurYOjtoOjNmFOXId/JWshHEuN4w5ZxV
   g==;
X-CSE-ConnectionGUID: Rru4aovORp2OsW9dMal2Jw==
X-CSE-MsgGUID: Q1/KshBSTqeL9jU6b2gZcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="235493273"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="235493273"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:14:00 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 8B2CC1C1C713
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:14:01 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 4471D14003ED
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:14:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id D47D510001CA;
	Thu,  2 Apr 2026 02:13:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/39] audit: upgrade 4.1.3 -> 4.1.4
Date: Thu,  2 Apr 2026 10:13:16 +0800
Message-ID: <20260402021355.1324-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125916

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fixed-swig-host-contamination-issue.patch
refreshed for 4.1.4

Changelog:
===========
- Update syscalls and io_uring tables for the 7.0 kernel
- Code cleanups
- Avoid blocking auditd while handling disk space alerts
- Tighten auditctl permission checks and rule deletion handling
- Fix ausearch and auparse parsing for several newer record types
- Prevent queue resize races in audisp and oversize records in af_unix
- Fix memory safety issues in auparse and the audisp filter plugin
- Improve reliability of audisp-remote, auplugin, and the ids plugin
- Fix stats collection and parsing in the audisp-statsd plugin
- Refresh ausearch and aureport man pages

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../audit/0001-Fixed-swig-host-contamination-issue.patch  | 8 ++++----
 .../audit/{audit_4.1.3.bb => audit_4.1.4.bb}              | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-security/audit/{audit_4.1.3.bb => audit_4.1.4.bb} (97%)

diff --git a/meta-oe/recipes-security/audit/audit/0001-Fixed-swig-host-contamination-issue.patch b/meta-oe/recipes-security/audit/audit/0001-Fixed-swig-host-contamination-issue.patch
index f37fbf63a7..087b31cc21 100644
--- a/meta-oe/recipes-security/audit/audit/0001-Fixed-swig-host-contamination-issue.patch
+++ b/meta-oe/recipes-security/audit/audit/0001-Fixed-swig-host-contamination-issue.patch
@@ -1,4 +1,4 @@
-From 4f78fcb8728cd4bf31175b3fa610a5c003e915d1 Mon Sep 17 00:00:00 2001
+From 14e49fe508a150d99ac18e35887b7d75e84c47d8 Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Sun, 19 Jul 2015 02:42:58 +0900
 Subject: [PATCH] Fixed swig host contamination issue
@@ -19,7 +19,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/bindings/swig/python3/Makefile.am b/bindings/swig/python3/Makefile.am
-index 428e40fa..f4dd45bc 100644
+index f8f6db18..171e96a6 100644
 --- a/bindings/swig/python3/Makefile.am
 +++ b/bindings/swig/python3/Makefile.am
 @@ -23,6 +23,7 @@
@@ -30,8 +30,8 @@ index 428e40fa..f4dd45bc 100644
  LIBS = $(top_builddir)/lib/libaudit.la
  SWIG_FLAGS = -python
  SWIG_INCLUDES = -I. -I$(top_builddir) -I${top_srcdir}/lib $(PYTHON3_INCLUDES)
-@@ -35,7 +36,7 @@ _audit_la_DEPENDENCIES =${top_srcdir}/lib/audit_logging.h ${top_builddir}/lib/li
- _audit_la_LIBADD = ${top_builddir}/lib/libaudit.la
+@@ -34,7 +35,7 @@ _audit_la_DEPENDENCIES =${top_srcdir}/lib/audit_logging.h ${top_builddir}/lib/li
+ _audit_la_LIBADD = ${top_builddir}/lib/libaudit.la $(PYTHON3_LIBS)
  nodist__audit_la_SOURCES  = audit_wrap.c
  audit.py audit_wrap.c: ${srcdir}/../src/auditswig.i 
 -	swig -o audit_wrap.c ${SWIG_FLAGS} ${SWIG_INCLUDES} ${srcdir}/../src/auditswig.i 
diff --git a/meta-oe/recipes-security/audit/audit_4.1.3.bb b/meta-oe/recipes-security/audit/audit_4.1.4.bb
similarity index 97%
rename from meta-oe/recipes-security/audit/audit_4.1.3.bb
rename to meta-oe/recipes-security/audit/audit_4.1.4.bb
index 12636045d4..05d6f1d277 100644
--- a/meta-oe/recipes-security/audit/audit_4.1.3.bb
+++ b/meta-oe/recipes-security/audit/audit_4.1.4.bb
@@ -7,12 +7,12 @@ SECTION = "base"
 LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-Fixed-swig-host-contamination-issue.patch \
            file://auditd \
           "
 
-SRCREV = "dfda9708910e4e72412e68d638087b29522df386"
+SRCREV = "07eea50408d28c953d4048dfef3da6556ce4b569"
 
 inherit autotools python3targetconfig update-rc.d systemd
 
-- 
2.43.0


