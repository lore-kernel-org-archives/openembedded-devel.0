Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23DC0E7719C
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.30502.1735032438455142389
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RaEcK4ks;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032447; x=1766568447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=6Qo9MhGiIn2qgZ935H81WuqIcKklYknR48xVBuZVZOc=;
  b=RaEcK4ks5ZCwos1Cal59GCVm8AdI2Pb2Lxg8sRuXYboG4p5yp57rNwcZ
   qKSTVFUGrknqtbrQIsqY6h1qY1M8vie7ALI811gWoAXuXOFaLlCQBL5Kn
   Ghleym+aepDVSGJYZZlhRm5ELqVe4PpifbNLSDaLiNpvYqynPoastbM+W
   QA6O8YGTkeZ8fVKE4MpcYX1HRc5hDTWStL7L9tEAEfxEpV6MPllhVq8Em
   oqMB1vZ00eopLYhZaJxwq7MYese69mVNHd21DWtqC5J5TPcYT/8H8WVzf
   KeQ5fQkQde+bRCciphvERTyT/8RDN2CpNHBluXNZPVRzfJvRiwZ5dhtds
   g==;
X-CSE-ConnectionGUID: svi3wYuvRX6Gv5zWR2mP1g==
X-CSE-MsgGUID: ORisyaKiTMSwsAVi1BdE0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="164248059"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="164248059"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:25 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B9795D4C2B
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:22 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8DD47D5B40
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 254CF20071A3A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:22 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C20721A006C;
	Tue, 24 Dec 2024 17:27:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/67] python3-inline-snapshot: upgrade 0.14.0 -> 0.18.1
Date: Tue, 24 Dec 2024 17:26:30 +0800
Message-Id: <1735032421-13513-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-0.658400-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mra9qiaDSLgo3MB0kPsl40w3YQ
	gGZ2at+typB17+9nJJkep5R/z/M+Rww8Nmue9wz3OWUWxTQJdI8Jlr1xKkE5ueKYpwtG+wHVjVV
	Nz1gSksjxitpmz4Mmm8R69WiuSmmVVZsjdPpr5NgD2WXLXdz+AYOeZuUUsCzC/gMNehoKqTv2ws
	olTCi3+vu0HEWlaGvJxiiH+oQX+1WhhjsqgSuNbxF4zyLyne+AmJAMgmwOylebKItl61J/yZ+in
	TK0bC9eKrauXd3MZDUhuwoCNaUZqqcrJOtJu+f/XTB2xYl7E6AFs/LovYE0bH4MFiUlO5WhRr1n
	NkEz3OUZt1hLPxBN8HHsaIbeADimHOcGOPNWgFjyvrjvn2gBWVPJnXL2yNYdkuo847l05tDEzMy
	Amsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114508

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- uv is now only used during test time if you run the inline-snapshot tests
  with pytest --use-uv
- Add support for a new storage-dir configuration option, to tell
  inline-snapshot where to store data files such as external snapshots.
- pydantic v1 is supported again. pydantic v1 & v2 create now the same
  snapshots.
- Find pyproject.toml file in parent directories, not just next to the Pytest
  configuration file.
- Code generation for sets is now deterministic.
- attrs can now contain unmanaged values
- Add inline_snapshot.extra.warns to captures warnings and compares them
  against expected warnings.
- solved a bug caused by a variable inside a snapshot
- snapshots inside snapshots are now supported.
- runtime values can now be part of snapshots.
- f-strings can now also be used within snapshots, but are currently not
  fixed by inline-snapshot.
- dirty-equals expressions are now treated like runtime values or snapshots
  within snapshots and are not modified by inline-snapshot.
- inline-snapshot checks now if the given command line flags
  (--inline-snapshot=...) are valid
- Example(...).run_pytest(raise=snapshot(...)) uses now the flags from the
  current run and not the flags from the Example.
- do not crash when handling raw f-strings (rf"",RF"",...)
- Don't crash for snapshots like snapshot(f"")
- skip formatting if black returns an error

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.14.0.bb => python3-inline-snapshot_0.18.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.14.0.bb => python3-inline-snapshot_0.18.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.14.0.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.18.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.14.0.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.18.1.bb
index 3886493820..cd5e850455 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.18.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "54fdf7831055d06a2423054875d640102865a164cc8291a8086e44dd9b4fd316"
+SRC_URI[sha256sum] = "a93bcf0aec68edf27323fa8dfc902354ef9a730050ab8939a4b174419828db6b"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


