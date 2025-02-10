Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F897C021A7
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.46456.1739178113774934251
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:01:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AueY+vpW;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178118; x=1770714118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jqVbC5b+mfCqWx/Yln01x2Z+OixJ4I4AsWJbzrjN7PA=;
  b=AueY+vpWhLfOa1SKWQt57b57YzG6yxhvB95RA5DWg30zlnsmZg1wA8Gs
   tlfj+TwVxqTyccUBi0ey5zQ6OBEcQytIgcfLZj4iR9Y/heoOc+WiXCli+
   Z8tO+KbWgX6FFFcBEC95L6Sd80tp9hewjXI529RE1UgfJVWuc/hQ0qBSL
   PtnRWwBUP5JESuB45zXYg87tJRLK4CC/gkIva0Ppd8OcHth4IRcLPBa2m
   HkSc/xhbJn/Bcm80VNlNMx0QrG3L+iGBo6gB7AG+obG8/SaHqRh2J7oau
   rqzLFZWjXq9XE9JfSL476BTRUcpwdkCAq2JLNEPYbPmV8Aok81CTHLoou
   w==;
X-CSE-ConnectionGUID: i7V++JbBS0KbL01l99yRqg==
X-CSE-MsgGUID: Vph69ou7TjC9a5FkFbZJlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="168394094"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="168394094"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:57 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 62D10F2A5
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 20C4DD968C
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:55 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B836C1A000B;
	Mon, 10 Feb 2025 17:01:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/66] python3-alembic: upgrade 1.14.0 -> 1.14.1
Date: Mon, 10 Feb 2025 17:00:54 +0800
Message-Id: <1739178095-26432-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115351

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025

Changelog:
===========
- [usecase] [sqlite] Modified SQLite's dialect to render "ALTER TABLE RENAME COLUMN" when
  Operations.alter_column() is used with a straight rename, supporting
  SQLite's recently added column rename feature.
- [bug] [environment] Added tzdata to tz extras, which is required on some platforms such as
  Windows. Pull request courtesy Danipulok.
- [bug] [autogenerate] Fixed bug where autogen render of a "variant" type would fail to catch the
  variants if the leading type were a dialect-specific type, rather than a
  generic type.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.14.0.bb => python3-alembic_1.14.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.14.0.bb => python3-alembic_1.14.1.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.14.0.bb b/meta-python/recipes-devtools/python/python3-alembic_1.14.1.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-alembic_1.14.0.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.14.1.bb
index 5f09fb8994..1e9279977c 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.14.1.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "A database migration tool for SQLAlchemy"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=00f8f5c8aab58c3e1cd61525a6675174"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2ee18d90dcc02d96b76e9e953629936"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "b00892b53b3642d0b8dbedba234dbf1924b69be83a9a769d5a624b01094e304b"
+SRC_URI[sha256sum] = "496e888245a53adf1498fcab31713a469c65836f8de76e01399aa1c3e90dd213"
 
 RDEPENDS:${PN} += "\
     python3-dateutil \
-- 
2.43.0


