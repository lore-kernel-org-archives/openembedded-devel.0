Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64228CF649E
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:38 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.48953.1727682216720469735
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qsYPmjs0;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682217; x=1759218217;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/H1rXvuvx05i8tAVsGi4E+STm+6X5TOXqklDQCShmrI=;
  b=qsYPmjs0BNkMQlounuhQ3uHFSbQ5ueqN2H+wugbi/JGZ1Wsbq9Q/Sdqd
   Q7fMWHrG59O4K/ms0syM36d67NShpuaqaMv+FJTcz2A0Z8wCroEeO+JP2
   OA2U3PThjfwmfXABwQlbeD40IvH7msai3JuGMg6B2w1Warqf3yxUrez5S
   78Wc/FstOFP3Sbk9O0YeDQKXs5Iz3S5SgyCknzmeSK5OopmXqOqKECEmG
   TD5IDdSGfGSogv469AugQzIcT3E7nb2a1mkgMPxAtLsRyXqyl3J8bNoYh
   76kTpiKBLMg9sI6GGJPXUZEyVXyOsqzvNOe4trp/vTPZtOG5W7yslOxNO
   w==;
X-CSE-ConnectionGUID: qOUvwXlCSxq2SO9eopC1UA==
X-CSE-MsgGUID: 7D8GjSb2QtyPxTZyvpcgfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="175192700"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="175192700"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:34 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 352B8CA1E9
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6946FD4C1D
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0073C2007B71C
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C329D1A01ED;
	Mon, 30 Sep 2024 15:43:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 09/40] pure-ftpd: upgrade 1.0.51 -> 1.0.52
Date: Mon, 30 Sep 2024 15:42:34 +0800
Message-Id: <1727682185-12664-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10--5.825100-10.000000
X-TMASE-MatchedRID: PXzrFdFmygGjz0nOeth/yTo39wOA02Lh07hVxuupa6qw2OrHLtPdX5lA
	4IpB7gNOj/bvtfhhXEuzo1yg2UoOsQvDmMxdQUEu8G8CATEgS6ZMkOX0UoduuSD1HdXyqDnE1vZ
	7s3YIVDL7tBxFpWhryf+1065WI2+4L/tBTZzO5Q2VUcz8XpiS9NhQO8CvZj/XaHvr9sOkYSt9/A
	4bJF/PM0Jn103gzaiLDpePiNkRMPoRpWi8SRd1+u9VsdrlGzy3xMZq+YajS9bGsuYyb68ajJXwt
	1rkqwjUIPSg5N7NcuSYpL1Mc22p5Ah+S7plw4stEhGH3CRdKUW41iXfjivJzJsoi2XrUn/JQYMO
	RuDWAmTfaY87m2dqxyAHAopEd76vBomv4qkMEcNf7FL55M3ea9bwtBoaGFNuurjbpH7uDJ2A92Q
	E+j/EHA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112571

From: Wang Mingyu <wangmy@fujitsu.com>

nostrip.patch
refreshed for 1.0.52

License-Update: Copyright year updated to 2024

Changelog:
==========
 - The QUIT command is now accepted during a transfer.
 - The server can be built with --with-minimal again.
 - Fixed an out of bounds read in the MLSD command.
 - Larger mmap()ed pages are used on aarch64.
 - Improved compatibility with HPUX
 - Improved OpenSSL API compatibility
 - Improved compatibility with OpenWall Linux
 - Improved compatibility with Netfilter

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch      | 7 +++----
 .../pure-ftpd/{pure-ftpd_1.0.51.bb => pure-ftpd_1.0.52.bb} | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)
 rename meta-networking/recipes-daemons/pure-ftpd/{pure-ftpd_1.0.51.bb => pure-ftpd_1.0.52.bb} (81%)

diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch
index 32d714f6f..90244cf09 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch
@@ -1,4 +1,4 @@
-From 79fd22c0def26eba130db98e312bb00fec32ac0a Mon Sep 17 00:00:00 2001
+From ed60c2ad3a7ed9762fcb6a304c7f60544606baef Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Tue, 4 Aug 2015 03:07:01 +0200
 Subject: [PATCH] Don't mess with CFLAGS and LDFLAGS when --with-minimal is
@@ -10,16 +10,15 @@ Upstream-Status: Inappropriate [config]
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
-
 ---
  configure.ac | 2 --
  1 file changed, 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 695ce68..0f28b55 100644
+index e578b2b..3874124 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -414,8 +414,6 @@ AC_ARG_WITH(minimal,
+@@ -415,8 +415,6 @@ AC_ARG_WITH(minimal,
      AC_DEFINE(NO_FTP_USERS)
      AC_DEFINE(WITHOUT_ASCII)    
      AC_DEFINE(BORING_MODE)
diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.51.bb b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb
similarity index 81%
rename from meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.51.bb
rename to meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb
index 6f03f73db..1ce3c468b 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.51.bb
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Pure-FTPd is a free (BSD license), secure, production-quality and
 HOMEPAGE = "http://www.pureftpd.org/project/pure-ftpd"
 SECTION = "net"
 LICENSE = "0BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=194bc994ad6bbd4ff5a021082fe52156"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5138d4a8a877b32de6a78cf7e9e99c25"
 
 DEPENDS = "libcap virtual/crypt"
 
@@ -11,7 +11,7 @@ SRC_URI = "http://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-${PV}.t
            file://0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch \
            file://nostrip.patch \
 "
-SRC_URI[sha256sum] = "4160f66b76615eea2397eac4ea3f0a146b7928207b79bc4cc2f99ad7b7bd9513"
+SRC_URI[sha256sum] = "1126f3a95856d08889ff89703cb1aa9ec9924d939d154e96904c920f05dc3c74"
 
 inherit autotools
 
-- 
2.34.1


