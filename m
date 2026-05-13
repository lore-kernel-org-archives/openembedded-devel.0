Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B328FCD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:20:08 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.245.1778646000175160265
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:20:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LiU9lnqd;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778646000; x=1810182000;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=W5xl2Lu67GzoNvCS3L4JQdsLkRaI3rJGu2tJyQl8Q2I=;
  b=LiU9lnqdHuk6YlWauKrWLmSZQ0IVUNhPGmlbXskplKG85jui71LWlM8Y
   6YP0n7CYT/nKOrfsJOwKn8mk+c1bmsqTxbHezS4rJ5gAsPa4OEeXHwA5U
   Otz8FSEftslibh02YsN4ku+EGKcpfY9EJ18J6dzXOcvRGV6UOH9eaLIm5
   rHb2hXJ99NQuJbXGTbuTpkNx9U0pJ3A0z4gg4YV0Go65BtdBrCYF3KME+
   z9Eaa5ZdIXlqR5IllowaAHReykp/erm8BwVBvmO88TnVx7cSLABjJzX/s
   w2+3cb0jJE01uw0dKK6SiG4xn/PZ9BfjzJeDx2o/KuYDs+W0nbb60WWjH
   Q==;
X-CSE-ConnectionGUID: MYukRoFfQK6Wvac+2Jb10A==
X-CSE-MsgGUID: kv0l2IkDS7OfRJUNFZTl+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="228216299"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="228216299"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:19:58 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 4DA46C0022D
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:19:58 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0833A18000E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:19:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id A489F1400251;
	Wed, 13 May 2026 04:19:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 43/56] python3-traitlets: upgrade 5.14.3 -> 5.15.0
Date: Wed, 13 May 2026 12:19:39 +0800
Message-ID: <20260513041952.450-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126929

From: Wang Mingyu <wangmy@fujitsu.com>

0001-start-testing-on-3.14-and-3.14t-929.patch
removed since it's included in 5.15.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-start-testing-on-3.14-and-3.14t-929.patch | 25 -------------------
 ..._5.14.3.bb => python3-traitlets_5.15.0.bb} |  7 ++----
 2 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-traitlets/0001-start-testing-on-3.14-and-3.14t-929.patch
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.14.3.bb => python3-traitlets_5.15.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets/0001-start-testing-on-3.14-and-3.14t-929.patch b/meta-python/recipes-devtools/python/python3-traitlets/0001-start-testing-on-3.14-and-3.14t-929.patch
deleted file mode 100644
index 275f77a371..0000000000
--- a/meta-python/recipes-devtools/python/python3-traitlets/0001-start-testing-on-3.14-and-3.14t-929.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 472cf29d06edce66db4af7eb47f601e40cff71c8 Mon Sep 17 00:00:00 2001
-From: M Bussonnier <bussonniermatthias@gmail.com>
-Date: Tue, 14 Oct 2025 08:55:52 +0200
-Subject: [PATCH] start testing on 3.14 and 3.14t (#929)
-
-Upstream-Status: Backport [https://github.com/ipython/traitlets/pull/929]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- traitlets/config/application.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/traitlets/config/application.py b/traitlets/config/application.py
-index b01a11e..2860de7 100644
---- a/traitlets/config/application.py
-+++ b/traitlets/config/application.py
-@@ -215,7 +215,8 @@ class Application(SingletonConfigurable):
-     _log_formatter_cls = LevelFormatter
-
-     log_datefmt = Unicode(
--        "%Y-%m-%d %H:%M:%S", help="The date format used by logging formatters for %(asctime)s"
-+        "%Y-%m-%d %H:%M:%S",
-+        help="The date format used by logging formatters for `asctime`",
-     ).tag(config=True)
-
-     log_format = Unicode(
diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.14.3.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.15.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.14.3.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.15.0.bb
index 827fb4ca4e..9c04286030 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.14.3.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.15.0.bb
@@ -3,14 +3,11 @@ HOMEPAGE = "https://github.com/ipython/traitlets"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=13bed0ee6f46a6f6dbf1f9f9572f250a"
 
-SRC_URI[sha256sum] = "9ed0579d3502c94b4b3732ac120375cda96f923114522847de4b3bb98b96b6b7"
+SRC_URI[sha256sum] = "4fead733f81cf1c4c938e06f8ca4633896833c9d89eff878159457f4d4392971"
 
 inherit pypi python_hatchling ptest
 
-SRC_URI += "\
-        file://0001-start-testing-on-3.14-and-3.14t-929.patch \
-        file://run-ptest \
-"
+SRC_URI += "file://run-ptest"
 
 RDEPENDS:${PN}-ptest += " \
         python3-argcomplete \
-- 
2.43.0


