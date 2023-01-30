Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE103C636CD
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 12:34:27 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.39763.1675082061691117193
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jan 2023 04:34:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1pMTMZ-0006GV-60; Mon, 30 Jan 2023 13:34:19 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pMTMY-001TBz-TF; Mon, 30 Jan 2023 13:34:18 +0100
Received: from jlu by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pMTMX-009Kp4-4c; Mon, 30 Jan 2023 13:34:17 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Jan Luebbe <jlu@pengutronix.de>
Subject: [meta-oe][PATCH 1/2] softhsm: avoid unnecessary check for native sqlite binary
Date: Mon, 30 Jan 2023 13:34:02 +0100
Message-Id: <20230130123402.2218385-1-jlu@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 12:34:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100860

SoftHSMv2 actually only uses the sqlite library. With the check for the
sqlite3 binary, building with the DB backend would mean depending on
sqlite-native.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 ...unnecessary-check-for-sqlite3-binary.patch | 40 +++++++++++++++++++
 .../recipes-security/softhsm/softhsm_2.6.1.bb |  4 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-security/softhsm/files/0001-avoid-unnecessary-check-for-sqlite3-binary.patch

diff --git a/meta-oe/recipes-security/softhsm/files/0001-avoid-unnecessary-check-for-sqlite3-binary.patch b/meta-oe/recipes-security/softhsm/files/0001-avoid-unnecessary-check-for-sqlite3-binary.patch
new file mode 100644
index 000000000000..7dddcdb78b09
--- /dev/null
+++ b/meta-oe/recipes-security/softhsm/files/0001-avoid-unnecessary-check-for-sqlite3-binary.patch
@@ -0,0 +1,40 @@
+From 88d968346184058df18dc69171dcd4fd612c2341 Mon Sep 17 00:00:00 2001
+From: Jan Luebbe <sho@stratum0.net>
+Date: Mon, 30 Jan 2023 12:48:23 +0100
+Subject: [PATCH] avoid unnecessary check for sqlite3 binary
+
+Only the library is used, not the sqlite3 binary. Drop this check to simplify
+cross-compilation (as no native sqlite3 binary is needed).
+
+Upstream-Status: Submitted [https://github.com/opendnssec/SoftHSMv2/pull/694]
+---
+ m4/acx_sqlite3.m4 | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/m4/acx_sqlite3.m4 b/m4/acx_sqlite3.m4
+index fd942a75e1a6..17c126d161f5 100644
+--- a/m4/acx_sqlite3.m4
++++ b/m4/acx_sqlite3.m4
+@@ -4,19 +4,13 @@ AC_DEFUN([ACX_SQLITE3],[
+ 		[
+ 			SQLITE3_INCLUDES="-I$withval/include"
+ 			SQLITE3_LIBDIRS="-L$withval/lib"
+-			AC_PATH_PROGS(SQLITE3, sqlite3, sqlite3, $withval/bin)
+ 			
+ 		],[
+ 			SQLITE3_INCLUDES=""
+ 			SQLITE3_LIBDIRS=""
+-			AC_PATH_PROGS(SQLITE3, sqlite3, sqlite3, $PATH)
+ 		])
+ 
+ 	
+-	if ! test -x "$SQLITE3"; then
+-		AC_MSG_ERROR([sqlite3 command not found])
+-	fi
+-	
+ 	AC_MSG_CHECKING(what are the SQLite3 includes)
+ 	AC_MSG_RESULT($SQLITE3_INCLUDES)
+ 
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
index d7bcd4f03bb2..44e51fda9181 100644
--- a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
+++ b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ef3f77a3507c3d91e75b9f2bdaee4210"
 
 DEPENDS = "sqlite3"
 
-SRC_URI = "https://dist.opendnssec.org/source/softhsm-2.6.1.tar.gz"
+SRC_URI = "https://dist.opendnssec.org/source/softhsm-2.6.1.tar.gz \
+           file://0001-avoid-unnecessary-check-for-sqlite3-binary.patch \
+"
 SRC_URI[sha256sum] = "61249473054bcd1811519ef9a989a880a7bdcc36d317c9c25457fc614df475f2"
 
 inherit autotools pkgconfig siteinfo
-- 
2.30.2


