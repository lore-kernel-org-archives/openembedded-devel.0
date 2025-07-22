Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BB5C83F1A
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 03:14:40 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.4309.1753154076080480018
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 20:14:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IMeolrWW;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753154076; x=1784690076;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xHpCDqyjfuu2FieX267EfayGz2PYQXWtCsyGW4MfyEc=;
  b=IMeolrWWL4dvCsaPUjsf78o4zxCRTO6I/yiqqBtR9Sun2g8PW0ICENVa
   4TVzpc78b2jCLvBRbg49Y1Zr19y10xQY1O+xKsgF1NRDaYFTZHxGN5Uyl
   TZhsYS6XX43NMHQyT9Dn7LUzBJtoIpg0EGHa/Rw6aOFssK51APbOgS/BI
   QI7AwwGmF+mUmRV7qFaK43gGo+d7neJmX+HzYgzTkc2zA3GYvNB13rOJ9
   DLpK4ZQjkI5E62FL55Soa3KL1hal6nV1gfPehgUaGHu7njECu76f/RXqF
   GfSZTEptUkdYVdtuSakDpfTf8CoKz+7mYZUtKTzfUmZSWYlXVWsRmutzY
   g==;
X-CSE-ConnectionGUID: ygvOPknwQVyM79doiACOjg==
X-CSE-MsgGUID: r5b0jrKuSD+2IKJJkijWJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="185923138"
X-IronPort-AV: E=Sophos;i="6.16,330,1744038000"; 
   d="scan'208";a="185923138"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 12:14:34 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 886741402
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:14:34 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id EFFC51C002B2
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:14:33 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DE9491A0071;
	Tue, 22 Jul 2025 11:14:30 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-python] [PATCH 07/21] python3-gevent: upgrade 25.4.2 -> 25.5.1
Date: Tue, 22 Jul 2025 11:14:29 +0800
Message-ID: <20250722031429.908-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118686

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../0001-_setuputils.py-Do-not-add-sys_inc_dir.patch           | 3 +--
 .../{python3-gevent_25.4.2.bb => python3-gevent_25.5.1.bb}     | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gevent_25.4.2.bb => python3-gevent_25.5.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-gevent/0001-_setuputils.py-Do-not-add-sys_inc_dir.patch b/meta-python/recipes-devtools/python/python3-gevent/0001-_setuputils.py-Do-not-add-sys_inc_dir.patch
index 49903d6ce8..68ef5d6d9a 100644
--- a/meta-python/recipes-devtools/python/python3-gevent/0001-_setuputils.py-Do-not-add-sys_inc_dir.patch
+++ b/meta-python/recipes-devtools/python/python3-gevent/0001-_setuputils.py-Do-not-add-sys_inc_dir.patch
@@ -1,4 +1,4 @@
-From 9eb453283a7ac8a9b1dd3eac86d936c7a430476b Mon Sep 17 00:00:00 2001
+From 21b8f74c3d0006c80549452743d50e6f012aa7ef Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 11 Oct 2022 17:37:01 -0700
 Subject: [PATCH] _setuputils.py: Do not add sys_inc_dir
@@ -10,7 +10,6 @@ we really do not need setuptools to deduce it for us.
 
 Upstream-Status: Inappropriate [ Cross-compile specific ]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  _setuputils.py | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
diff --git a/meta-python/recipes-devtools/python/python3-gevent_25.4.2.bb b/meta-python/recipes-devtools/python/python3-gevent_25.5.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-gevent_25.4.2.bb
rename to meta-python/recipes-devtools/python/python3-gevent_25.5.1.bb
index b66fd5c8cf..05c4ea2205 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_25.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_25.5.1.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} = "python3-greenlet \
 
 SRC_URI += "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch"
 
-SRC_URI[sha256sum] = "7ffba461458ed28a85a01285ea0e0dc14f883204d17ce5ed82fa839a9d620028"
+SRC_URI[sha256sum] = "582c948fa9a23188b890d0bc130734a506d039a2e5ad87dae276a456cc683e61"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.43.0


