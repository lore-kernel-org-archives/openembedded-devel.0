Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E95BC02194
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:21 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.32637.1737360857857674530
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QA5mZTMG;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360859; x=1768896859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=RvlLENeMkzRz0zsCRqd/c5qiHv1U6WSCknPN8SOhxrc=;
  b=QA5mZTMGvTrRQlgCenHltzonwOHP1CWXKh8XSYf8wwKdsG+Jczx9jOOB
   +QeST3n70kYNEZogwwRaRwWDlUMUBYNAabNm/Lw0edPA1npHOcLG/agXM
   e4vH0wbGf4MX35H9qC+9HGshMsB0FNFoUwHEBVvE8Dp/CCY7o4Xx8Itei
   rNNX0WPMdJecEytoB/PT9yQCtpGhvtUBg50CqCGsFCVgtAgeQL3GMFTaj
   zIIfHEp5pe/kJLRfKlTlWuqpy44GKtcn6dNxMqe5xG66mCx3ouzBypR1g
   x3dZY1/Xv6uvt00Kx5WU4MixFfQdUBXjdvvCCsXT/0BfCBMp86T1/pqNF
   g==;
X-CSE-ConnectionGUID: T4feqbO5RbOstOaPbXb7IQ==
X-CSE-MsgGUID: +ZdqMrCDSJ6MWpOnLnDy5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="189605705"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="189605705"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:17 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 97724D6EA1
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:14 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C828CFBC2
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DF61C20071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:13 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8F4921A0071;
	Mon, 20 Jan 2025 16:14:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/32] libtoml11: upgrade 4.2.0 -> 4.3.0
Date: Mon, 20 Jan 2025 16:13:42 +0800
Message-Id: <1737360846-4824-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 11-10.452600-10.000000
X-TMASE-MatchedRID: ZsQmnj20Xtajz0nOeth/ySrLqyE6Ur/jF4r8H5YrEqx/iZ1aNsYG7oFa
	KsEtPT2WqV/q9KFgVMi9alSWGuOKxtBUMX40Rzs4v0DcGXX8NxXai5i4sxSsjnv3ioAd9KrSJBP
	n5aBYd2nxgwYhHpmqNULuwZhVEDxdIYiqWqYhUFK/mux8PsfamT/FEHo4advasrDwfHQQaK2CDx
	bm2wVcgKE7LBRkh+1t5p98cjyQCaKN6MoIzHiu3pVRzPxemJL0G24YVeuZGmPuaxAtXRNprOGBG
	o+9EezEuXenKjShQ7UAf/HImzvCGPoLRFtw/0Cms0T0PE+KHuXQxDD776KHL41sBC/FjMNyYJA+
	HBwSFifnk+PPhXCmbIF1g/cG+RBqFA/vEqOUr4/G+nS24MzHeX0tCKdnhB589yM15V5aWpj6C0e
	Ps7A07fk39LXMSri6yjDW4j4Nbyp6a6nsoC1DsSni0W1DQKS4VblNhFndKrk=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114970

From: Wang Mingyu <wangmy@fujitsu.com>

0001-fix-add-missing-zero-initialization-to-region.patch
removed since it's included in 4.3.0

Changlog:
=========
Added
------
Support std::optional as a template argument of toml::find
Support multiple arguments toml::visit(visitor, args...)

Fixed
------
toml::detail::region::last_ may be used uninitialized
Fix use with CMake 3.21 and older
fix: prevent size_t-max length string allocation
update README.md
Make parsing faster for very long line
Avoid known problem in MSVC
Check if source_location::file_name() is null before formatting

Changed
-------
Update hugo-book theme
Add MSVC 2017 to appveyor build

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...issing-zero-initialization-to-region.patch | 35 -------------------
 ...{libtoml11_4.2.0.bb => libtoml11_4.3.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/libtoml11/files/0001-fix-add-missing-zero-initialization-to-region.patch
 rename meta-oe/recipes-devtools/libtoml11/{libtoml11_4.2.0.bb => libtoml11_4.3.0.bb} (89%)

diff --git a/meta-oe/recipes-devtools/libtoml11/files/0001-fix-add-missing-zero-initialization-to-region.patch b/meta-oe/recipes-devtools/libtoml11/files/0001-fix-add-missing-zero-initialization-to-region.patch
deleted file mode 100644
index cb3d10ee72..0000000000
--- a/meta-oe/recipes-devtools/libtoml11/files/0001-fix-add-missing-zero-initialization-to-region.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 9c7cef94a551cfdbbe2cce262c29221e22643d84 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ale=C5=A1=20Mat=C4=9Bj?= <amatej@redhat.com>
-Date: Mon, 19 Aug 2024 06:35:03 +0200
-Subject: [PATCH] fix: add missing zero initialization to region
-
-Fixes below error:
-
-/build/tmp-glibc/work/core2-64-wrs-linux/libtoml11/1_4.2.0-r0/git/include/toml11/fwd/../fwd/../fwd/region_fwd.hpp:49:5: error: '<unnamed>.toml::detail::region::first_' is used uninitialized [-Werror=uninitialized]
-   49 |     region(region&&)      = default;
-      |     ^~~~~~
-
-Upstream-Status: Backport [https://github.com/ToruNiina/toml11/commit/9c7cef94a551cfdbbe2cce262c29221e22643d84]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- include/toml11/fwd/region_fwd.hpp | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/include/toml11/fwd/region_fwd.hpp b/include/toml11/fwd/region_fwd.hpp
-index b40317d..26f1a9b 100644
---- a/include/toml11/fwd/region_fwd.hpp
-+++ b/include/toml11/fwd/region_fwd.hpp
-@@ -34,7 +34,8 @@ class region
-     // a value that is constructed manually does not have input stream info
-     region()
-         : source_(nullptr), source_name_(""), length_(0),
--          first_line_(0), first_column_(0), last_line_(0), last_column_(0)
-+          first_(0), first_line_(0), first_column_(0), last_(0), last_line_(0),
-+          last_column_(0)
-     {}
- 
-     // a value defined in [first, last).
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.2.0.bb b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.3.0.bb
similarity index 89%
rename from meta-oe/recipes-devtools/libtoml11/libtoml11_4.2.0.bb
rename to meta-oe/recipes-devtools/libtoml11/libtoml11_4.3.0.bb
index 758e258a57..9f265ea19a 100644
--- a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.2.0.bb
+++ b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.3.0.bb
@@ -11,14 +11,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=44d1fcf70c7aa6991533c38daf7befa3"
 
 PE = "1"
 
-SRCREV = "cc0bee4fd46ea1f5db147d63ea545208cc9e8405"
+SRCREV = "499be3c177bcf9b42848d5d9567153e4edfcbc8a"
 SRCREV_json = "9cca280a4d0ccf0c08f47a99aa71d1b0e52f8d03"
 SRCREV_doctest = "ae7a13539fb71f270b87eb2e874fbac80bc8dda2"
 
 SRC_URI = "git://github.com/ToruNiina/toml11;branch=main;protocol=https \
            git://github.com/nlohmann/json;destsuffix=git/tests/extlib/json;name=json;branch=develop;protocol=https \
            git://github.com/doctest/doctest;destsuffix=git/tests/extlib/doctest;name=doctest;branch=master;protocol=https \
-           file://0001-fix-add-missing-zero-initialization-to-region.patch \
            file://run-ptest \
 "
 SRCREV_FORMAT = "json_doctest"
-- 
2.43.0


