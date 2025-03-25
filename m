Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E208C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:19 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.61529.1742893337675740995
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KPnFO2V7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893338; x=1774429338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uPQ3EY6WAs1w2UMzrqGzJLX+S17C8t6O/eOdxsK/ui8=;
  b=KPnFO2V7HqYuOxoETn/b3v/JVQWBM0Ss5U19Po3sS3ugTOserU+btiju
   b6b/l7hc860J1gGOpRxzbztrTxqGSwlsQcOobHfCwzNeqkwzuH9pRHEI6
   DL0iTrquIUGjINZ8NE/LyReqS/pnZKBOJznsq3xNTRZP6R1oVUhXs9Dhd
   I1LbJXp5JdaHYiAPMDSNpX3iM+jmy9aUzV5XHIykQWP49EXCOlFIlno6W
   +LESQy9Rgwb7HPwcC90nEUx8ZS071LnNH5XT2/w5vfZnKS5Z5+mIctVq4
   uJkK2qEj9RPyKJ7jJUc8dD0b1sMGIxlN89UcigxHEi8y10sbAtv5OdyN0
   w==;
X-CSE-ConnectionGUID: qFV8WZZAQs+A09CLLEbjcw==
X-CSE-MsgGUID: VfEFlcCoTz+X6llXqV9Waw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="194223092"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="194223092"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:16 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E43B9675C
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BF3C0CF7EE
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:12 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 54DEC1A0078;
	Tue, 25 Mar 2025 17:02:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 13/45] libnewt: upgrade 0.52.24 -> 0.52.25
Date: Tue, 25 Mar 2025 17:01:20 +0800
Message-Id: <1742893312-3809-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116237

From: Wang Mingyu <wangmy@fujitsu.com>

cross_ar.patch
refreshed for 0.52.25

Changelog:
===========
- improve Makefile
- fix "yes" in Spanish translation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../newt/files/cross_ar.patch                 | 25 +++++++++++--------
 ...{libnewt_0.52.24.bb => libnewt_0.52.25.bb} |  2 +-
 2 files changed, 15 insertions(+), 12 deletions(-)
 rename meta-oe/recipes-extended/newt/{libnewt_0.52.24.bb => libnewt_0.52.25.bb} (94%)

diff --git a/meta-oe/recipes-extended/newt/files/cross_ar.patch b/meta-oe/recipes-extended/newt/files/cross_ar.patch
index 86cc0be1d3..eb8c4134b2 100644
--- a/meta-oe/recipes-extended/newt/files/cross_ar.patch
+++ b/meta-oe/recipes-extended/newt/files/cross_ar.patch
@@ -1,4 +1,7 @@
-Fix cross link using autoconf detected AR
+From 0f33421000006f5991d1cddcb9dbc68b64141e44 Mon Sep 17 00:00:00 2001
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Wed, 19 Jun 2024 11:22:48 +0200
+Subject: [PATCH] Fix cross link using autoconf detected AR
 
 If building on 32bit host and creating 64bit libraries, the target
 package builds should not invoke the 32bit hosts's ar.  Specifically
@@ -18,10 +21,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  configure.ac | 4 ++++
  2 files changed, 6 insertions(+), 1 deletion(-)
 
-Index: newt-0.52.20/Makefile.in
-===================================================================
---- newt-0.52.20.orig/Makefile.in
-+++ newt-0.52.20/Makefile.in
+diff --git a/Makefile.in b/Makefile.in
+index f8fe290..8a44a56 100644
+--- a/Makefile.in
++++ b/Makefile.in
 @@ -7,6 +7,7 @@ CFLAGS = @CFLAGS@
  LDFLAGS = @LDFLAGS@
  CPPFLAGS = -D_GNU_SOURCE @CPPFLAGS@
@@ -30,7 +33,7 @@ Index: newt-0.52.20/Makefile.in
  
  VERSION = @VERSION@
  TAG = r$(subst .,-,$(VERSION))
-@@ -109,7 +110,7 @@ whiptcl.$(SOEXT): $(WHIPTCLOBJS) $(LIBNE
+@@ -109,7 +110,7 @@ whiptcl.$(SOEXT): $(WHIPTCLOBJS) $(LIBNEWTSH)
  	$(CC) -shared $(SHCFLAGS) $(LDFLAGS) -o whiptcl.$(SOEXT) $(WHIPTCLOBJS) -L. -lnewt  $(LIBTCL) -lpopt $(LIBS)
  
  $(LIBNEWT): $(LIBOBJS)
@@ -39,11 +42,11 @@ Index: newt-0.52.20/Makefile.in
  
  newt.o $(SHAREDDIR)/newt.o: newt.c Makefile
  
-Index: newt-0.52.20/configure.ac
-===================================================================
---- newt-0.52.20.orig/configure.ac
-+++ newt-0.52.20/configure.ac
-@@ -15,6 +15,10 @@ AC_PROG_INSTALL
+diff --git a/configure.ac b/configure.ac
+index 434121e..2cfffd6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -15,6 +15,10 @@ AC_PROG_CC
  AC_PROG_LN_S
  AC_PROG_GREP
  AC_SYS_LARGEFILE
diff --git a/meta-oe/recipes-extended/newt/libnewt_0.52.24.bb b/meta-oe/recipes-extended/newt/libnewt_0.52.25.bb
similarity index 94%
rename from meta-oe/recipes-extended/newt/libnewt_0.52.24.bb
rename to meta-oe/recipes-extended/newt/libnewt_0.52.25.bb
index 834dddd0b5..aa6b120037 100644
--- a/meta-oe/recipes-extended/newt/libnewt_0.52.24.bb
+++ b/meta-oe/recipes-extended/newt/libnewt_0.52.25.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://releases.pagure.org/newt/newt-${PV}.tar.gz \
            file://Makefile.in-Add-tinfo-library-to-the-linking-librari.patch \
            "
 
-SRC_URI[sha256sum] = "5ded7e221f85f642521c49b1826c8de19845aa372baf5d630a51774b544fbdbb"
+SRC_URI[sha256sum] = "ef0ca9ee27850d1a5c863bb7ff9aa08096c9ed312ece9087b30f3a426828de82"
 
 S = "${WORKDIR}/newt-${PV}"
 
-- 
2.43.0


