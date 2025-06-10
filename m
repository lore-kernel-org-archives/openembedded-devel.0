Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4398C61CE8
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:40 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.78427.1749526419816519734
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kedI3Ctq;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526420; x=1781062420;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N2JSWQVjvntFmU7NYcTFIzDBWNowWxZYIi2FSah4tnk=;
  b=kedI3CtqCQXSYHywtv+1Rba51l1xCxYDAmYI+O6kc1x8EEyjDUxAqsnQ
   BpzK1QrE74ySBjCnEgYjTgg3Xf8YvRX3B5wqSqfZwyo0/pjmCyZxZPm7u
   G7L9nQvWl7GXQRLDqWhLDgW78qTDpd6S/reSqkXOjZ+eZ31/pWyhLBpaB
   2WW9y2NT9tWU3Ftq522QONfBdtNYYsHV4kb5XLTAKcmLENB/qV6V427SD
   7wNiAwmq8XtbaNmxYzmykAyGRJvE3dHUsAbROYUUv5WWtaR/nMHpno/bi
   r8y+NeUEtahyxQHA3LzEnDaTUrmRqiPfHGx0FeoHl68ER+7VKFg/rj3St
   w==;
X-CSE-ConnectionGUID: WnVRQuy2TtGN2r44+99Lkg==
X-CSE-MsgGUID: iragZ5r4SaOfBUtxlYTruA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="189594968"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="189594968"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:37 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id DBBDED5051
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 73D19CFBB1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:34 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5B45D1A0071;
	Tue, 10 Jun 2025 11:33:33 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/64] audit: upgrade 4.0.4 -> 4.0.5
Date: Tue, 10 Jun 2025 11:32:27 +0800
Message-ID: <20250610033330.924-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117794

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fixed-swig-host-contamination-issue.patch
refreshed for 4.0.5

Changelog:
============
- Rework audisp queue to be lockless
- Fix missing delete command in auditctl
- Allow plus addresses (rfc5233) to auditd email.
- Reduce memory churn in auditd event dispatching
- Add configurable recurring state report in auditd
- Switch audisp-statsd to stop sending signals
- Add glibc memory stats to audisp-statsd

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Fixed-swig-host-contamination-issue.patch  | 13 +++++--------
 .../audit/{audit_4.0.4.bb => audit_4.0.5.bb}        |  2 +-
 2 files changed, 6 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-security/audit/{audit_4.0.4.bb => audit_4.0.5.bb} (98%)

diff --git a/meta-oe/recipes-security/audit/audit/0001-Fixed-swig-host-contamination-issue.patch b/meta-oe/recipes-security/audit/audit/0001-Fixed-swig-host-contamination-issue.patch
index f2755d5c08..f37fbf63a7 100644
--- a/meta-oe/recipes-security/audit/audit/0001-Fixed-swig-host-contamination-issue.patch
+++ b/meta-oe/recipes-security/audit/audit/0001-Fixed-swig-host-contamination-issue.patch
@@ -1,4 +1,4 @@
-From 5cdc667aeb7a014cdc1f8c7df8f8080408773dbe Mon Sep 17 00:00:00 2001
+From 4f78fcb8728cd4bf31175b3fa610a5c003e915d1 Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Sun, 19 Jul 2015 02:42:58 +0900
 Subject: [PATCH] Fixed swig host contamination issue
@@ -19,7 +19,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/bindings/swig/python3/Makefile.am b/bindings/swig/python3/Makefile.am
-index c2c6def4..bcc2836c 100644
+index 428e40fa..f4dd45bc 100644
 --- a/bindings/swig/python3/Makefile.am
 +++ b/bindings/swig/python3/Makefile.am
 @@ -23,6 +23,7 @@
@@ -30,7 +30,7 @@ index c2c6def4..bcc2836c 100644
  LIBS = $(top_builddir)/lib/libaudit.la
  SWIG_FLAGS = -python
  SWIG_INCLUDES = -I. -I$(top_builddir) -I${top_srcdir}/lib $(PYTHON3_INCLUDES)
-@@ -37,7 +38,7 @@ _audit_la_DEPENDENCIES =${top_srcdir}/lib/audit_logging.h ${top_builddir}/lib/li
+@@ -35,7 +36,7 @@ _audit_la_DEPENDENCIES =${top_srcdir}/lib/audit_logging.h ${top_builddir}/lib/li
  _audit_la_LIBADD = ${top_builddir}/lib/libaudit.la
  nodist__audit_la_SOURCES  = audit_wrap.c
  audit.py audit_wrap.c: ${srcdir}/../src/auditswig.i 
@@ -40,10 +40,10 @@ index c2c6def4..bcc2836c 100644
  CLEANFILES = audit.py* audit_wrap.c *~
  
 diff --git a/bindings/swig/src/auditswig.i b/bindings/swig/src/auditswig.i
-index 6b267844..5a4e442f 100644
+index 2760e516..5d0ea8b6 100644
 --- a/bindings/swig/src/auditswig.i
 +++ b/bindings/swig/src/auditswig.i
-@@ -50,7 +50,7 @@ typedef unsigned uid_t;
+@@ -52,7 +52,7 @@ typedef unsigned uid_t;
   */
  %ignore audit_rule_data::buf;
  
@@ -52,6 +52,3 @@ index 6b267844..5a4e442f 100644
  #define __extension__ /*nothing*/
  %include <stdint.i>
  %include "../lib/audit-records.h"
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-security/audit/audit_4.0.4.bb b/meta-oe/recipes-security/audit/audit_4.0.5.bb
similarity index 98%
rename from meta-oe/recipes-security/audit/audit_4.0.4.bb
rename to meta-oe/recipes-security/audit/audit_4.0.5.bb
index 952a362698..6fa025abd4 100644
--- a/meta-oe/recipes-security/audit/audit_4.0.4.bb
+++ b/meta-oe/recipes-security/audit/audit_4.0.5.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;proto
           "
 
 S = "${WORKDIR}/git"
-SRCREV = "81dcded2ed9e407dd1357eda0bdc0855f06085e6"
+SRCREV = "97c4ec3d68b5b199f2796d1e126c2144506bd228"
 
 inherit autotools python3targetconfig update-rc.d systemd
 
-- 
2.43.0


