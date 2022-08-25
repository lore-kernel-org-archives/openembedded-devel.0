Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F8A9C28D13
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 14:21:49 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web08.24605.1661437305291878636
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 07:21:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1oRDjr-0005KN-Ck; Thu, 25 Aug 2022 16:21:43 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1oRDjq-001uoK-Mp; Thu, 25 Aug 2022 16:21:42 +0200
Received: from jlu by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1oRDjp-00Dzxs-Mx; Thu, 25 Aug 2022 16:21:41 +0200
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [meta-oe][PATCH v2] gensio: upgrade 2.3.1 -> 2.5.2
Date: Thu, 25 Aug 2022 16:21:34 +0200
Message-Id: <20220825142133.3336408-1-jlu@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Aug 2022 14:21:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98433

Version 2.5.2 contains an include sys/unistd.h, which is not available
with musl, so fix the include path.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 ...01-tools-gensiot-Fix-build-with-musl.patch | 29 +++++++++++++++++++
 .../{gensio_2.3.1.bb => gensio_2.5.2.bb}      |  6 ++--
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/gensio/files/0001-tools-gensiot-Fix-build-with-musl.patch
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.3.1.bb => gensio_2.5.2.bb} (85%)

diff --git a/meta-oe/recipes-connectivity/gensio/files/0001-tools-gensiot-Fix-build-with-musl.patch b/meta-oe/recipes-connectivity/gensio/files/0001-tools-gensiot-Fix-build-with-musl.patch
new file mode 100644
index 000000000000..93831c380f72
--- /dev/null
+++ b/meta-oe/recipes-connectivity/gensio/files/0001-tools-gensiot-Fix-build-with-musl.patch
@@ -0,0 +1,29 @@
+From 823b6754a4d7655480b6e8576a9d0037f842d653 Mon Sep 17 00:00:00 2001
+From: Jan Luebbe <jlu@pengutronix.de>
+Date: Thu, 25 Aug 2022 12:19:16 +0200
+Subject: [PATCH] tools:gensiot: Fix build with musl
+
+According to POSIX getpid() is available in unistd.h, not sys/unistd.h.
+
+Upstream-Status: Submitted [https://github.com/cminyard/gensio/pull/47]
+Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
+---
+ tools/gensiotool.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/gensiotool.c b/tools/gensiotool.c
+index cac531bb4b74..ab0bb9583f9f 100644
+--- a/tools/gensiotool.c
++++ b/tools/gensiotool.c
+@@ -44,7 +44,7 @@
+ #include <signal.h>
+ #include <errno.h>
+ #include <sys/types.h>
+-#include <sys/unistd.h>
++#include <unistd.h>
+ #include <syslog.h>
+ #endif
+ 
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.3.1.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.5.2.bb
similarity index 85%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.3.1.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.5.2.bb
index a6e0075538c3..9de21209caf5 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.3.1.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.5.2.bb
@@ -5,9 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a0fd36908af843bcee10cb6dfc47fa67 \
                     file://COPYING;md5=bae3019b4c6dc4138c217864bd04331f \
                     "
 
-SRCREV = "c500d8705c517f96e591c060105a789f053d2b7a"
+SRCREV = "b6cd354afe6d5f63bc859c94fd3a455a3cdf0449"
 
-SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master"
+SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master \
+           file://0001-tools-gensiot-Fix-build-with-musl.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


