Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A39DC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:20:55 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.6369.1704720047376274947
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="133464912"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="133464912"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:20:44 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 93063DCC15
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:20:42 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 740ABD9C5F
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:20:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 04FD3202CFE9F
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:20:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B241B1A0072;
	Mon,  8 Jan 2024 21:20:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] iwd: upgrade 2.8 -> 2.12
Date: Mon,  8 Jan 2024 21:20:02 +0800
Message-Id: <1704720002-29880-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10--6.672500-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrTfK5j0EZbysli8Y5a0svL6EW
	UPx8K79aSnrw7RxmP3GghdqjkPMyFj4pt4Z7puj9Ojf3A4DTYuEQhNjZQYyI3AfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmizCsOCBxDp3UdZEkR8Y/meYd5TLtlbtYCEd+K6O5Nt517Qq
	ML/wIrSiF7r1KLtjtCRL/JBgHPRCovhYHDok+vI6zGfgakLdjaHo5fF1EYvHwcPalz4HK2fhfDV
	Tv7ELb9oa8IWqgpLBOAMuqetGVetnyef22ep6XYOwBXM346/+z6gT4dgtvV1JEgaRE62j9C0FoB
	kKJqarTpBUFrfG7elzJtOThsdRwF
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108133

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog
========
-Fix issue with DPP extra settings not being used.
-Fix issue with DPP and PRF+ handling on AARCH64.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...s_top_srcdir-instead-of-abs_srcdir-for-e.patch | 15 +++++++--------
 .../iwd/{iwd_2.8.bb => iwd_2.12.bb}               |  2 +-
 2 files changed, 8 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_2.8.bb => iwd_2.12.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd/0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch b/meta-oe/recipes-connectivity/iwd/iwd/0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch
index 9ed73104e..bc72f17e0 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd/0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch
+++ b/meta-oe/recipes-connectivity/iwd/iwd/0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch
@@ -1,20 +1,22 @@
-From b0b51d762f45ff9d320b96bd0acb89313148a446 Mon Sep 17 00:00:00 2001
+From 2e782b849a2202d5a77bd5ac67160c4a47ae306d Mon Sep 17 00:00:00 2001
 From: Zang Ruochen <zangrc.fnst@fujitsu.com>
 Date: Wed, 12 May 2021 14:28:24 +0900
-Subject: [PATCH] build: Use abs_top_srcdir instead of abs_srcdir for ell sources
+Subject: [PATCH] build: Use abs_top_srcdir instead of abs_srcdir for ell
+ sources
 
 this makes it build when build dir is outside of sources dir
 
 Upstream-Status: Submitted [https://lists.01.org/hyperkitty/list/iwd@lists.01.org/message/SYX6Z7SUQHU7UWM6ECZTTJ6SPODIS6KB/]
+
 ---
  Makefile.am | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 68035e4..e3f7990 100644
+index 5ed6ab3..e0e3c87 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -628,7 +628,7 @@ ell/shared: Makefile
+@@ -697,7 +697,7 @@ ell/shared: Makefile
  	$(AM_V_at)$(MKDIR_P) ell
  	$(AM_V_GEN)for f in $(ell_shared) ; do \
  		if [ ! -f $$f ] ; then \
@@ -23,7 +25,7 @@ index 68035e4..e3f7990 100644
  		fi \
  	done > $@
  
-@@ -636,7 +636,7 @@ ell/internal: Makefile
+@@ -705,7 +705,7 @@ ell/internal: Makefile
  	$(AM_V_at)$(MKDIR_P) ell
  	$(AM_V_GEN)for f in $(ell_headers) $(ell_sources) ; do \
  		if [ ! -f $$f ] ; then \
@@ -32,6 +34,3 @@ index 68035e4..e3f7990 100644
  		fi \
  	done > $@
  
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-connectivity/iwd/iwd_2.8.bb b/meta-oe/recipes-connectivity/iwd/iwd_2.12.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_2.8.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_2.12.bb
index ee310d295..2ed13afe3 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_2.8.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_2.12.bb
@@ -8,7 +8,7 @@ DEPENDS = "ell"
 SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
            "
-SRC_URI[sha256sum] = "a90e621f45b9c2f9021beea0fa6477ee0334fcd2ee34beaab42e31ea0fd3be29"
+SRC_URI[sha256sum] = "6b71a78c1e1a0200c6b0097efe0f4055a76f445c0e17cdd6225d89538d7dc35e"
 
 inherit autotools manpages pkgconfig python3native systemd
 
-- 
2.34.1


