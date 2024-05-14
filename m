Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13692C27C41
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:41 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.10753.1715677834352617882
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Faj/W9Xg;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677835; x=1747213835;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=IT4+T3vCdsRajZqzQTACHinNYAIMRTgGeB5IRphwJj8=;
  b=Faj/W9XgqiNLQy2D66q+WMM5TEatOlLqm/OhsLvmYiVtFbMmZ8PPdOaS
   b6KI9DwGxtny6MeR8AH9JVYVaANNY11BY6q+l/lCBrb25FiHXWd+v7BXu
   zPFYEqyauzVWBcbV5EWz0kgrqFhiJkiFtx+Yxrk7o3+YEl0UEyqvvAcVt
   0orbrZ9FhrcW0adDceq4M/p4Qpdhw8HDQNUQYAt0rKJDeut9cT9LiZGvT
   sZZQ79EIwXnbvFOQLkbvucLYtAfoVoYnZUaQuXLaEZz/VFaBIND0oufTZ
   xZNdFIHCv8LxHl4e4S3XVWgQ8BrPdBYUkgiaEtaEBdrN1nmFCEI+Smglz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="146707018"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="146707018"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:32 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 38AF1CD6E9
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F176D3F2D
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id F390720076D15
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A19251A000B;
	Tue, 14 May 2024 17:10:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH 14/44] postgresql: upgrade 16.2 -> 16.3
Date: Tue, 14 May 2024 17:09:47 +0800
Message-Id: <1715677817-2223-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10-1.241400-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yWOho7buv7d9XLILvyEBT87fc2Xd6VJ+ynYW
	2eXId8+tdB9aRZ3DyIR3TaF7+lCZvgDNPxu11HXj/HTKStsDGMJHNQ8CqEKO2GAN6i+va16uIUt
	KH5AJM9ki+t+0AiFaYnCTmnujr22dUUvcVJ+45/ZZNYSHk3Zr0WhADSmwSTddSMg2Oe/b8Ewomk
	qkaZHwbceVn5FG/3x2eTjw/FyRX6QfE8yM4pjsD/HQN6v7o/y/xEHRux+uk8hxKpvEGAbTDqmrF
	fg2r3qIntFO7FOsqQRlmsDMqdHdmYO0eLO68amBYyIf70NeX1D79GywZ47psOTAZGoZAr5qcysm
	HyKLiFR+KKfsjGfFzYK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110363

From: Wang Mingyu <wangmy@fujitsu.com>

0003-configure.ac-bypass-autoconf-2.69-version-check.patch
refreshed for 16.3

Changelog:
 https://www.postgresql.org/docs/release/16.3/

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0003-configure.ac-bypass-autoconf-2.69-version-check.patch  | 2 +-
 meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch    | 2 +-
 .../postgresql/{postgresql_16.2.bb => postgresql_16.3.bb}       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_16.2.bb => postgresql_16.3.bb} (86%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index d76d1991b..9df4d073f 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -18,7 +18,7 @@ index 401ce30..27f382d 100644
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [16.2], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [16.3], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
index fa46912ee..1f735f322 100644
--- a/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
@@ -23,7 +23,7 @@ diff --git a/configure.ac b/configure.ac
 index fba79ee..7170f26 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2261,7 +2261,7 @@ Use --without-tcl to disable building PL/Tcl.])
+@@ -2297,7 +2297,7 @@ Use --without-tcl to disable building PL/Tcl.])
  fi
  
  # check for <perl.h>
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_16.2.bb b/meta-oe/recipes-dbs/postgresql/postgresql_16.3.bb
similarity index 86%
rename from meta-oe/recipes-dbs/postgresql/postgresql_16.2.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_16.3.bb
index 31f83a564..6df719cd9 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_16.2.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_16.3.bb
@@ -11,6 +11,6 @@ SRC_URI += "\
    file://0005-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "446e88294dbc2c9085ab4b7061a646fa604b4bec03521d5ea671c2e5ad9b2952"
+SRC_URI[sha256sum] = "331963d5d3dc4caf4216a049fa40b66d6bcb8c730615859411b9518764e60585"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Ddoesn't apply to out configuration of postgresql so we can safely ignore it."
-- 
2.34.1


