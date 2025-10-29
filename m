Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4526CCF9EE
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 17:23:19 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.10587.1761758368717219876
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 10:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: bst@pengutronix.de)
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <bst@pengutronix.de>)
	id 1vE9pW-00014O-Pz; Wed, 29 Oct 2025 18:19:26 +0100
From: "Bastian Krause" <bst@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Liu Yiding <liuyd.fnst@fujitsu.com>,
	Bastian Krause <bst@pengutronix.de>
Subject: [meta-networking][PATCH] chrony: upgrade 4.7 -> 4.8
Date: Wed, 29 Oct 2025 18:19:13 +0100
Message-ID: <20251029171913.3890761-1-bst@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 17:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121167

0001-Fix-compilation-with-musl.patch is obsolete due to
948ecf8 ("hash: include util.h for MIN macro") included in chrony since
version 3.5.

From chrony's NEWS [1] for the 4.8 release:

Enhancements
------------
* Add maxunreach option to limit selection of unreachable sources
* Add -u option to chronyc to drop root privileges (default chronyc user
  is set by configure script)

Bug fixes
---------
* Hide chronyc socket to mitigate unsafe permissions change
* Fix refclock extpps option to work on Linux >= 6.15
* Validate refclock samples for reachability updates

[1] https://chrony-project.org/news.html

Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
 .../0001-Fix-compilation-with-musl.patch      | 31 -------------------
 .../chrony/{chrony_4.7.bb => chrony_4.8.bb}   |  5 +--
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta-networking/recipes-support/chrony/chrony/0001-Fix-compilation-with-musl.patch
 rename meta-networking/recipes-support/chrony/{chrony_4.7.bb => chrony_4.8.bb} (97%)

diff --git a/meta-networking/recipes-support/chrony/chrony/0001-Fix-compilation-with-musl.patch b/meta-networking/recipes-support/chrony/chrony/0001-Fix-compilation-with-musl.patch
deleted file mode 100644
index 5e2bc64af3..0000000000
--- a/meta-networking/recipes-support/chrony/chrony/0001-Fix-compilation-with-musl.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 11ec10cdb5ab4b94c5999e018a9c854419997761 Mon Sep 17 00:00:00 2001
-From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
-Date: Wed, 10 Apr 2019 03:18:17 +0200
-Subject: [PATCH] Fix compilation with musl
-
-Fixes:
-../hash_intmd5.c:58: undefined reference to `MIN'
-
-Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
----
-Upstream-Status: Pending
-
- hash_intmd5.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/hash_intmd5.c b/hash_intmd5.c
-index 49da1cf..47efe4c 100644
---- a/hash_intmd5.c
-+++ b/hash_intmd5.c
-@@ -33,6 +33,8 @@
- 
- #include "md5.c"
- 
-+#include <sys/param.h>
-+
- static MD5_CTX ctx;
- 
- int
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-support/chrony/chrony_4.7.bb b/meta-networking/recipes-support/chrony/chrony_4.8.bb
similarity index 97%
rename from meta-networking/recipes-support/chrony/chrony_4.7.bb
rename to meta-networking/recipes-support/chrony/chrony_4.8.bb
index 0af542869e..826bffc323 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.7.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.8.bb
@@ -36,10 +36,7 @@ SRC_URI = "https://chrony-project.org/releases/chrony-${PV}.tar.gz \
     file://arm_eabi.patch \
 "
 
-SRC_URI:append:libc-musl = " \
-    file://0001-Fix-compilation-with-musl.patch \
-"
-SRC_URI[sha256sum] = "c0de41a8c051e5d32b101b5f7014b98ca978b18e592f30ce6840b6d4602d947b"
+SRC_URI[sha256sum] = "33ea8eb2a4daeaa506e8fcafd5d6d89027ed6f2f0609645c6f149b560d301706"
 
 DEPENDS = "pps-tools"
 
-- 
2.47.3


