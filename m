Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C66C02188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:12 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.40065.1736843347676661173
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=D4RMv7Gk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843348; x=1768379348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=MNHLDPcoq6PuGpGsTv3TMh8xQJ9rZpY+I37/opEOGq4=;
  b=D4RMv7GkPueeoG2kieGccjlcKFVH+33g3icbjK6DsTPdwWh0DwCq+fM7
   DkUD48Ly1i7iybgFO3hRV7rWcbMCa8LFHunc21MbzYNfPGSgMwK/PuULE
   luNLDaUbwnERRwbzv9xEGWfUHsVDusyx5nsa1KUPt2txPs5+FBwklnFo5
   hlh0crBW4eFuBDc2xHv+8dZhqGVOEgNppjBNw3pe23ykJ/hAo9+H1kkyu
   bk+4AJmrxETja1fDz39pWlmgXqfyBma5ANQsz/DwR51P5C1+TKRj7bMTk
   0/BKVWMSr7FqKDUvesfJXs2uXsaER6sU1LsDrhvh5xfCX/Vj1mn58lhV6
   g==;
X-CSE-ConnectionGUID: P6mOsb3WS3mjKXcgJDq6mw==
X-CSE-MsgGUID: YxvOffmPRFeTpTg8HOCITA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="186506173"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="186506173"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:05 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 42E53E852C
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:03 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 14709F310
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 814B120071A35
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:02 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2F5531A000B;
	Tue, 14 Jan 2025 16:29:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/30] libdbi-perl: upgrade 1.644 -> 1.646
Date: Tue, 14 Jan 2025 16:28:28 +0800
Message-Id: <1736843329-4131-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10--2.969100-10.000000
X-TMASE-MatchedRID: PWXwJQp0B9ujz0nOeth/ySrLqyE6Ur/jkdS3kPlaZyVUjspoiX02F+n7
	ya/+V5vjmrS/IzG3CN3cy8zPIAV4G1yDR0kMA1NKPPov5T+l6PGm9gNLqI12Y+NzEtLhniqihud
	uVSp57KN/f0rbrsFTkhK4lG1JTzij4KdJbWzbHtvNgrlT5Ajc7jeXamXCCu1YMHDHnR8cUQIhS0
	ofkAkz2SL637QCIVpiytuC65NNIO5MGF0Ua9spp5VRzPxemJL0+KgiyLtJrSCiC7BD4niBmCmzp
	hhejKtE+xxFtXRNfNrQQxIbVlM8FbFC4KFlyR6Xtw+xHnsmQjOYkAyCbA7KV5soi2XrUn/JQYMO
	RuDWAmQa3uZ27iW8TgtuKBGekqUpnH7sbImOEBQdQ9ejLrZWTDw0a1lR2sQ8LaVY2ElzN6VtX7m
	bv0o0RDEnncCGTXP3xQ8Ppv/o9BW3KNLl7uT1tFAhZIXc/F6teBAf6Ok/8W7sfZ9V6Q6rCZgvUo
	iYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114854

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fix-building-on-Fedora-40-with-GCC-14.2.1.patch
removed since it's included in 1.646

License-Update: Copyright year updated to 2025

Changelog:
===========
* Remove "experimental" tag from statistics_info ()
* RT tickets moved to github issues
* Fix install issue
* Move developer tests to xt/
* Make Changes match CPAN::Changes::Spec and regen DBI::Changes from that
* Fixes for modern gcc i.c.w. recent perl
* Small code & doc cleanups for recent perl
* See TODO in `perldoc DBI` to see where you can help with documentation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...uilding-on-Fedora-40-with-GCC-14.2.1.patch | 28 -------------------
 ...dbi-perl_1.644.bb => libdbi-perl_1.646.bb} |  8 ++----
 2 files changed, 3 insertions(+), 33 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/0001-Fix-building-on-Fedora-40-with-GCC-14.2.1.patch
 rename meta-oe/recipes-devtools/perl/{libdbi-perl_1.644.bb => libdbi-perl_1.646.bb} (86%)

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/0001-Fix-building-on-Fedora-40-with-GCC-14.2.1.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/0001-Fix-building-on-Fedora-40-with-GCC-14.2.1.patch
deleted file mode 100644
index f29d6c4d8f..0000000000
--- a/meta-oe/recipes-devtools/perl/libdbi-perl/0001-Fix-building-on-Fedora-40-with-GCC-14.2.1.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From dc970a868a4c2d7e2051b533e0a3588ef1d35530 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Dani=C3=ABl=20van=20Eeden?= <git@myname.nl>
-Date: Mon, 26 Aug 2024 10:17:01 +0200
-Subject: [PATCH] Fix building on Fedora 40 with GCC 14.2.1
-
-Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/d6e2bf13ac6043f5b0a9a147805b4915bd70e631]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- DBI.xs | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/DBI.xs b/DBI.xs
-index 747e341..9b1d136 100644
---- a/DBI.xs
-+++ b/DBI.xs
-@@ -1106,7 +1106,7 @@ dbih_inner(pTHX_ SV *orv, const char *what)
-     if (!SvMAGICAL(ohv)) {
-         if (!what)
-             return NULL;
--        if (!hv_fetch(ohv,"_NO_DESTRUCT_WARN",17,0))
-+        if (!hv_fetch((HV*)ohv,"_NO_DESTRUCT_WARN",17,0))
- 	    sv_dump(orv);
-         croak("%s handle %s is not a DBI handle (has no magic)",
-                 what, neatsvpv(orv,0));
--- 
-2.46.0
-
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.644.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.646.bb
similarity index 86%
rename from meta-oe/recipes-devtools/perl/libdbi-perl_1.644.bb
rename to meta-oe/recipes-devtools/perl/libdbi-perl_1.646.bb
index 7f6c9059d0..947353c17c 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.644.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.646.bb
@@ -7,12 +7,10 @@ database interface independent of the actual database being used. \
 HOMEPAGE = "http://search.cpan.org/dist/DBI/"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8097b88c6165f0d43949441e6ea581cd"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=65f65488c774efe1da488e36ad6c4a36"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/H/HM/HMBRAND/DBI-${PV}.tar.gz \
-           file://0001-Fix-building-on-Fedora-40-with-GCC-14.2.1.patch \
-           "
-SRC_URI[sha256sum] = "2297b99de09e67086640b590699e0e982fb469da63a93fe28dc14782db7a53c8"
+SRC_URI = "https://cpan.metacpan.org/authors/id/H/HM/HMBRAND/DBI-${PV}.tar.gz"
+SRC_URI[sha256sum] = "53ab32ac8c30295a776dde658df22be760936cdca5a3c003a23bda6d829fa184"
 
 S = "${WORKDIR}/DBI-${PV}"
 
-- 
2.43.0


