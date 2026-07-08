Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE15CC44508
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:45:41 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4720.1783503936961349279
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ONf1KwkW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503938; x=1815039938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8mZXZNASp1ETC5f4GFFwFY4Y+mXuU62Xrh7jQjHpjh8=;
  b=ONf1KwkWpQnJMbhEa7sn+BlUy32treoa3OmzVTVIViUAA+A8JHWtifop
   GhncOGKVkFBlD6gpLUnHiThRhe+39qac2+37/+icR4gkkQ0XjSZ80Ik1Q
   PBkFPp7j3OXf1CwM4kKbefpWEnOymin+0GNxp7W08emaFxwXSN+wx6HRq
   LOK+DDPB6XYMxDJOeGtbEQpV9vZ0U/w2eiNs5fcAHwFrXWqwi7wossMmx
   zfMS2TSpNM9H1Va2e7hQnIOIx3EKDSYJGzO6NeJdvc9RxsFN2uGes+9E6
   6Y/Oz57DpQwGadMaiPpW0SgSN9Hc31SJWkIycji2sHLZtYRd6VTY+cCcl
   A==;
X-CSE-ConnectionGUID: cnM23bnKSnSBRrmB/92Xjw==
X-CSE-MsgGUID: Zjksa9qLSpWg86vajQ/JXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="246703350"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="246703350"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:36 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 4B85A1002812
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:35 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0756B18594A0
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3731D18030CF;
	Wed,  8 Jul 2026 09:45:32 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 13/37] ostree: upgrade 2026.1 -> 2026.2
Date: Wed,  8 Jul 2026 17:44:23 +0800
Message-ID: <20260708094508.2060-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:45:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128084

From: Wang Mingyu <wangmy@fujitsu.com>

0001-trivial-httpd-Fix-const-correctness-of-slash-pointer.patch
removed since it's included in 2026.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...x-const-correctness-of-slash-pointer.patch | 29 -------------------
 .../{ostree_2026.1.bb => ostree_2026.2.bb}    |  3 +-
 2 files changed, 1 insertion(+), 31 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-trivial-httpd-Fix-const-correctness-of-slash-pointer.patch
 rename meta-oe/recipes-extended/ostree/{ostree_2026.1.bb => ostree_2026.2.bb} (97%)

diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-trivial-httpd-Fix-const-correctness-of-slash-pointer.patch b/meta-oe/recipes-extended/ostree/ostree/0001-trivial-httpd-Fix-const-correctness-of-slash-pointer.patch
deleted file mode 100644
index cc0c3d1318..0000000000
--- a/meta-oe/recipes-extended/ostree/ostree/0001-trivial-httpd-Fix-const-correctness-of-slash-pointer.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 3b8255e24d0785d6049d473471da53b0c5fd52c1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Thu, 9 Apr 2026 16:28:07 -0700
-Subject: [PATCH] trivial-httpd: Fix const-correctness of slash pointer
-
-strrchr() returns a 'const char *' when passed a 'const char *'
-argument. Declare the local 'slash' variable as 'const char *'
-to match, fixing a build failure with clang when
--Werror,-Wincompatible-pointer-types-discards-qualifiers is active.
-
-Upstream-Status: Submitted [https://github.com/ostreedev/ostree/pull/3579]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- src/ostree/ostree-trivial-httpd.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/ostree/ostree-trivial-httpd.c b/src/ostree/ostree-trivial-httpd.c
-index 4a0c6b00..b5a52e61 100644
---- a/src/ostree/ostree-trivial-httpd.c
-+++ b/src/ostree/ostree-trivial-httpd.c
-@@ -281,7 +281,7 @@ do_get (OtTrivialHttpd *self, SoupServer *server, SoupServerMessage *msg, const
- do_get (OtTrivialHttpd *self, SoupServer *server, SoupServerMessage *msg, const char *path)
- #endif
- {
--  char *slash;
-+  const char *slash;
-   int ret;
-   struct stat stbuf;
-
diff --git a/meta-oe/recipes-extended/ostree/ostree_2026.1.bb b/meta-oe/recipes-extended/ostree/ostree_2026.2.bb
similarity index 97%
rename from meta-oe/recipes-extended/ostree/ostree_2026.1.bb
rename to meta-oe/recipes-extended/ostree/ostree_2026.2.bb
index af726fff12..69df97f7ef 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2026.1.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2026.2.bb
@@ -21,9 +21,8 @@ DEPENDS = " \
 GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
            file://run-ptest \
-           file://0001-trivial-httpd-Fix-const-correctness-of-slash-pointer.patch \
            "
-SRC_URI[sha256sum] = "8e77c285dd6fa5ec5fb063130390977be727fe11107335ed8778a40385069e95"
+SRC_URI[sha256sum] = "a281f2db631f3721ecd4b9e2779a1eaf56e2d03f2cc47629a9f0117f12016a83"
 
 S = "${UNPACKDIR}/libostree-${PV}"
 
-- 
2.43.0


