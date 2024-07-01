Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93341C3065C
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:22 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.13841.1719816260499017344
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mW765V0L;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816260; x=1751352260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=dGqwCRmUtVr/vyOzsO1P++00o3wVquUaKyEidKZJ1kU=;
  b=mW765V0LLsglTjsg36Y1deNpqypI1uGzZmHMnkCBMv6u5Sekq1NErdRC
   Ml/kbBPzEqChQ7kRHt41PM30vzaucpDlwgz+U0bOP24tROeiSg+9I9bck
   ImJpdwwHftp7ccWAhPcQI4nzffiPaXRWgBuzDI4XZdnjhNN/uVWjH1QKs
   kUafsUmlQeNmCrrCfGeJedR860KamRBky4OsHxI2rhMFmU/WAC6zOVeaB
   S0LrK1qaWZZO/h4s6PeMoP25fjTY9GFFleg0IoqYJlz1uWTtCdKl16U0a
   FdviYFpYMa50CSYnWq6dA4TCS+vV0kaXHekcP/p7dbr7JcgXY+rxfOVw4
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="152872718"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="152872718"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:17 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A8CE2C68EA
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:15 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D9F95CF7C7
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 714ABE206A
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1EC201A000A;
	Mon,  1 Jul 2024 14:44:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/25] python3-alembic: upgrade 1.13.1 -> 1.13.2
Date: Mon,  1 Jul 2024 14:43:46 +0800
Message-Id: <1719816242-11839-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10--4.311600-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yXg2y0j5vXZGlEDhvi2wR879wRnyxuPjhJ8o
	ISQJyHp3EC5Hyq7Cm1FnrV0Fa6GKmlWbI3T6a+TYKLWCnRnFqorKrKWVfpQki0tYyuL5Cqax/cX
	bR0bNRT1PIwA9EKkHILl4fV0TkCmtV2+1Nt1whFWqh5pv1eDPzzsKvZyemuhsauJSrIqqokTd44
	y51ngd4eArY2JkKW9pBdRHP6FCEZVaQiLka9EcSk7nLUqYrlslNmVjpriVEtmmOWRsO8Mnh/9hZ
	eynbNVAgZBEjCNOXeLrixWWWJYrHx8TzIzimOwPC24oEZ6SpSmcfuxsiY4QFPR36JM67yyQnukt
	pC9bAO/QnXZiqLcKcC0/Ol7ZkWm6zIqludhlOhQlCV1bpxGT8JvuLbfD8aMm2xcOaBV7QihCxIR
	/7Psf8+x9n1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111177

From: Wang Mingyu <wangmy@fujitsu.com>

Lisence-Update: Copyright year updated to 1.13.2

Changelog:
=============
- Improve computed column compare function to support multi-line expressions.
- Fixed bug in alembic command stdout where long messages were not properly
  wrapping at the terminal width.
- Fixed internal issue where Alembic would call connection.execute() sending
  an empty tuple to indicate "no params". In SQLAlchemy 2.1 this case will be
  deprecated as "empty sequence" is ambiguous as to its intent.
- Fixes to support pytest 8.1 for the test suite.
- Fixed the detection of serial column in autogenerate with tables not under
  default schema on PostgreSQL

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.13.1.bb => python3-alembic_1.13.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.13.1.bb => python3-alembic_1.13.2.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.13.1.bb b/meta-python/recipes-devtools/python/python3-alembic_1.13.2.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-alembic_1.13.1.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.13.2.bb
index c4853c443..6f8fb8c33 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.13.1.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.13.2.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "A database migration tool for SQLAlchemy"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e3023b042cb6002cb398344b51c67093"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=00f8f5c8aab58c3e1cd61525a6675174"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "4932c8558bf68f2ee92b9bbcb8218671c627064d5b08939437af6d77dc05e595"
+SRC_URI[sha256sum] = "1ff0ae32975f4fd96028c39ed9bb3c867fe3af956bd7bb37343b54c9fe7445ef"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.34.1


