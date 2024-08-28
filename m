Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99261C54752
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:51 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.8722.1724833547092870045
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gCCcS9/N;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833547; x=1756369547;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WQh2/l8lR5U/YTItwRvmYeRTzpOKPgLulpeP+kEiIkg=;
  b=gCCcS9/N153lWlaWQxVrH4AGSS3i978rnZ3UaJCJTmH25HdAiSAvAPQu
   zvptY/4AS8PL4COWnDVyy5BqX6BWjFa02faVS5HhqLGsBuTsjcWuPqN8L
   DkXmMXBgzlqR/ZRgw318pdzwKDMZhb+LAK6FzzXE4X6IqLDE+Msp/fLZC
   7I4U2tSeCnLnoZrkOC4ivR3vxPtb+rBCEULYZ20/K6N+YiqVUeYpVIrQA
   orfAbwy38ToGysAWp8uKhckp8qb2rdCp28zgQ31Rk2cJokdwgWJRrbdhp
   bgss9AGUCi0X0DZzHy/4FI4CO1wpb+o2Cs+JJdXeKDkvYPsAxgIxh0RKm
   g==;
X-CSE-ConnectionGUID: Vk83kEsaRbyDMM3nNM4gaQ==
X-CSE-MsgGUID: +r43aI9ITia1sMsQuO1LdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="160202045"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="160202045"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:44 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A8072D7AF7
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:41 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D9024BF4AC
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6BE4120079DEA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 187F31A0002;
	Wed, 28 Aug 2024 16:25:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 17/46] postgresql: upgrade 16.3 -> 16.4
Date: Wed, 28 Aug 2024 16:24:55 +0800
Message-Id: <1724833525-2162-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--0.492200-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yWOho7buv7d9XLILvyEBT87fc2Xd6VJ+ykKJ
	Pvbg1+THKqrQ7lLcMnyK8WnR386CVm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2rzL
	UH932T/tMXgFIZHnqOndNoXv6UJm+0NbFxReSRlipNvaxbMIbfu8bT8P/COx0592Swrd60Ukomk
	qkaZHwbfLhFIildm+3gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKly/WZGKzCFGWK9fU9HyL7arsB2E
	oFWFz2hGGudD4B/xQ4CXw+D7d6IxOSl205ANRqagYgz7nmqrvH5F9xuuL3UqlXdTwl2TwWg/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111996

From: Wang Mingyu <wangmy@fujitsu.com>

0003-configure.ac-bypass-autoconf-2.69-version-check.patch
refreshed for 16.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...03-configure.ac-bypass-autoconf-2.69-version-check.patch | 6 +++---
 .../postgresql/{postgresql_16.3.bb => postgresql_16.4.bb}   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_16.3.bb => postgresql_16.4.bb} (86%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index 9df4d073f..342aeba85 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -13,12 +13,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 401ce30..27f382d 100644
+index 65715a4..4ad6340 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [16.3], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [16.4], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
@@ -28,5 +28,5 @@ index 401ce30..27f382d 100644
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
 -- 
-2.25.1
+2.34.1
 
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_16.3.bb b/meta-oe/recipes-dbs/postgresql/postgresql_16.4.bb
similarity index 86%
rename from meta-oe/recipes-dbs/postgresql/postgresql_16.3.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_16.4.bb
index 6df719cd9..1a47369e4 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_16.3.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_16.4.bb
@@ -11,6 +11,6 @@ SRC_URI += "\
    file://0005-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "331963d5d3dc4caf4216a049fa40b66d6bcb8c730615859411b9518764e60585"
+SRC_URI[sha256sum] = "971766d645aa73e93b9ef4e3be44201b4f45b5477095b049125403f9f3386d6f"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Ddoesn't apply to out configuration of postgresql so we can safely ignore it."
-- 
2.34.1


