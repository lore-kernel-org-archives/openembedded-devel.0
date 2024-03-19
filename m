Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86528C54E74
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:26 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.8211.1710827176492809700
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KKIGSqZ4;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827182; x=1742363182;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=18Y8tBepSNU5B5Y6fgznegVGYEwTQ/kbKdghzuSSPDI=;
  b=KKIGSqZ4vwXcBUKThCx7vUIcHCVyptkfTjgwShzJqTE/bPW+txmP6Ekv
   u9NUEHSieY8XcCRQe1CGrXT3WuMwjqadzFZjeFZZu5TImnr2S5njyV2g8
   QN2R7/1sTcJQ3vF3/A2CxjygAmObgFjTSuXXNsVWQ4pZAW9AAvkVtu4Wm
   gdEhFQunQHT/pGBrIa051tH3DdSPpfCHpJWCIs4y+W392NJjDvXAthM0c
   7bbxsVdOoVRrPo5/fqDejExSvepbA8EGhS8wJeWbupcf7Pc2X0w37ccL8
   JwVSS6fyXbUQV7E8ZdR5UmpsyKSkyUQdNN8st8+8deQyEiEYuwQa9Qbbn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152562769"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152562769"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:21 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 36DC727A821
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:18 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 62AECD7B7E
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E80792009325C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8FA9B1A006B;
	Tue, 19 Mar 2024 13:46:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 14/50] openlldp: upgrade 1.1.0 -> 1.1.1
Date: Tue, 19 Mar 2024 13:45:03 +0800
Message-Id: <1710827139-30056-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10-2.026200-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yaoXHZz/dXlxWfgivgcUPZNIyDY579vwTEKJ
	Pvbg1+THKqrQ7lLcMnyK8WnR386CVm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl76S7Hfu9IUxpJl
	XzGkPOFnhphqipnEX3EI0R6LaSDW0rWL/xQJnm45vTnqYKYXTRn0tCKdnhB589yM15V5aWpj6C0
	ePs7A07bxtFR53UcYCGGSvhIMu2whHRqrlH4/JOHry7QKsXD5SptAFR+7vaxzi64jr68gf0Il+K
	SD4ClXoRtSagLlyzk33t47QNyGC3tGpax40CWzE8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4A
	EOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109431

From: Wang Mingyu <wangmy@fujitsu.com>

0001-autotools-Add-option-to-disable-installation-of-syst.patch
refreshed for 1.1.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ls-Add-option-to-disable-installation-of-syst.patch | 10 +++++-----
 .../openlldp/{openlldp_1.1.0.bb => openlldp_1.1.1.bb}  |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-networking/recipes-protocols/openlldp/{openlldp_1.1.0.bb => openlldp_1.1.1.bb} (95%)

diff --git a/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch b/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch
index 98ecd3864..b1d746f8b 100644
--- a/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch
+++ b/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch
@@ -1,4 +1,4 @@
-From dc3f2250908587710f109c80ddf8a94f0bc40b82 Mon Sep 17 00:00:00 2001
+From 7147add9fedfb28909639ae419f995041d086266 Mon Sep 17 00:00:00 2001
 From: Jonathan Richardson <jonathan.richardson@broadcom.com>
 Date: Fri, 6 Apr 2018 10:49:04 -0700
 Subject: [PATCH] autotools: Add option to disable installation of systemd conf
@@ -23,10 +23,10 @@ Upstream-Status: Pending
  2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 292c0fd..0fb9bb0 100644
+index 86174e9..e90e966 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -138,8 +138,9 @@ install-data-hook:	installdirs-local
+@@ -141,8 +141,9 @@ install-data-hook:	installdirs-local
  pkgconfigdir = ${libdir}/pkgconfig
  pkgconfig_DATA = lldpad.pc liblldp_clif.pc
  
@@ -38,10 +38,10 @@ index 292c0fd..0fb9bb0 100644
  bashcompletiondir = $(sysconfdir)/bash_completion.d
  dist_bashcompletion_DATA = contrib/bash_completion/lldpad contrib/bash_completion/lldptool
 diff --git a/configure.ac b/configure.ac
-index 0667446..f75f433 100644
+index fa2f3a0..1a038cd 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -95,6 +95,15 @@ AC_TYPE_UINT16_T
+@@ -132,6 +132,15 @@ AC_TYPE_UINT16_T
  AC_TYPE_UINT32_T
  AC_TYPE_UINT8_T
  
diff --git a/meta-networking/recipes-protocols/openlldp/openlldp_1.1.0.bb b/meta-networking/recipes-protocols/openlldp/openlldp_1.1.1.bb
similarity index 95%
rename from meta-networking/recipes-protocols/openlldp/openlldp_1.1.0.bb
rename to meta-networking/recipes-protocols/openlldp/openlldp_1.1.1.bb
index 71d738ddc..010cd5af8 100644
--- a/meta-networking/recipes-protocols/openlldp/openlldp_1.1.0.bb
+++ b/meta-networking/recipes-protocols/openlldp/openlldp_1.1.1.bb
@@ -12,7 +12,7 @@ inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}
 
 DEPENDS = "libnl libconfig readline"
 
-SRCREV = "85e55837a81d710e5baa7da47f7ed0d205c8ede5"
+SRCREV = "f1dd9eb961fab06723d2bedb2f7e2b81e45ee9ab"
 PV .= "+git"
 SRC_URI = "git://github.com/intel/openlldp.git;protocol=https;branch=branch-1.1 \
            file://0001-Fix-musl-libc-build-issue.patch \
-- 
2.34.1


