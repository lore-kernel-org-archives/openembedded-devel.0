Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F47C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 05:56:37 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.web10.1444.1743573376235430938
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 22:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.53 with ESMTP; 2 Apr 2025 14:56:13 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.121.109)
	by 156.147.1.125 with ESMTP; 2 Apr 2025 14:56:13 +0900
X-Original-SENDERIP: 10.177.121.109
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-networking][PATCH] freediameter: fix build with gcc-15.0.1
Date: Wed,  2 Apr 2025 14:56:03 +0900
Message-Id: <20250402055603.1245502-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 05:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116502

From: "mark.yang" <mark.yang@lge.com>

* backport fix from:
  https://github.com/freeDiameter/freeDiameter/issues/72
  https://github.com/freeDiameter/freeDiameter/commit/a54f10082f819dadfa6931166e71edffadb565dd

  to fix:
  http://errors.yoctoproject.org/Errors/Details/850312/
  TOPDIR/tmp/work/qemux86_64-oe-linux/freediameter/1.5.0+git/git/libfdcore/sctp.c:622:21: note: 'bool' is a keyword with '-std=c23' onwards
  TOPDIR/tmp/work/qemux86_64-oe-linux/freediameter/1.5.0+git/git/libfdcore/sctp.c:622:26: error: expected identifier or '(' before '=' token
  622 |                 int bool = 1;
      |                          ^

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 .../files/0001-fixes-for-gcc-15.patch         | 69 +++++++++++++++++++
 .../freediameter/freediameter_1.5.0.bb        |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/freediameter/files/0001-fixes-for-gcc-15.patch

diff --git a/meta-networking/recipes-protocols/freediameter/files/0001-fixes-for-gcc-15.patch b/meta-networking/recipes-protocols/freediameter/files/0001-fixes-for-gcc-15.patch
new file mode 100644
index 0000000000..41aeec4ee0
--- /dev/null
+++ b/meta-networking/recipes-protocols/freediameter/files/0001-fixes-for-gcc-15.patch
@@ -0,0 +1,69 @@
+From a54f10082f819dadfa6931166e71edffadb565dd Mon Sep 17 00:00:00 2001
+From: Victor Seva <vseva@debian.org>
+Date: Sun, 23 Feb 2025 13:38:48 +0100
+Subject: [PATCH] fixes for gcc-15
+
+fixes #72
+
+Upstream-Status: Backport [https://github.com/freeDiameter/freeDiameter/commit/a54f10082f819dadfa6931166e71edffadb565dd]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ libfdcore/sctp.c | 22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/libfdcore/sctp.c b/libfdcore/sctp.c
+index 95e822e..a4a7f40 100644
+--- a/libfdcore/sctp.c
++++ b/libfdcore/sctp.c
+@@ -532,29 +532,29 @@ static int fd_setsockopt_prebind(int sk)
+ 	/* SCTP_EXPLICIT_EOR: we assume implicit EOR in freeDiameter, so let's ensure this is known by the stack */
+ 	#ifdef SCTP_EXPLICIT_EOR
+ 	{
+-		int bool;
++		int _bool;
+ 		
+ 		if (TRACE_BOOL(ANNOYING)) {
+ 			sz = sizeof(bool);
+ 			/* Read socket defaults */
+-			CHECK_SYS(  getsockopt(sk, IPPROTO_SCTP, SCTP_EXPLICIT_EOR, &bool, &sz)  );
+-			if (sz != sizeof(bool))
++			CHECK_SYS(  getsockopt(sk, IPPROTO_SCTP, SCTP_EXPLICIT_EOR, &_bool, &sz)  );
++			if (sz != sizeof(_bool))
+ 			{
+-				TRACE_DEBUG(INFO, "Invalid size of socket option: %d / %d", sz, (socklen_t)sizeof(bool));
++				TRACE_DEBUG(INFO, "Invalid size of socket option: %d / %d", sz, (socklen_t)sizeof(_bool));
+ 				return ENOTSUP;
+ 			}
+-			fd_log_debug( "Def SCTP_EXPLICIT_EOR value : %s", bool ? "true" : "false");
++			fd_log_debug( "Def SCTP_EXPLICIT_EOR value : %s", _bool ? "true" : "false");
+ 		}
+ 
+-		bool = 0;
++		_bool = 0;
+ 		
+ 		/* Set the option to the socket */
+-		CHECK_SYS(  setsockopt(sk, IPPROTO_SCTP, SCTP_EXPLICIT_EOR, &bool, sizeof(bool))  );
++		CHECK_SYS(  setsockopt(sk, IPPROTO_SCTP, SCTP_EXPLICIT_EOR, &_bool, sizeof(_bool))  );
+ 		
+ 		if (TRACE_BOOL(ANNOYING)) {
+ 			/* Check new values */
+-			CHECK_SYS(  getsockopt(sk, IPPROTO_SCTP, SCTP_EXPLICIT_EOR, &bool, &sz)  );
+-			fd_log_debug( "New SCTP_EXPLICIT_EOR value : %s", bool ? "true" : "false");
++			CHECK_SYS(  getsockopt(sk, IPPROTO_SCTP, SCTP_EXPLICIT_EOR, &_bool, &sz)  );
++			fd_log_debug( "New SCTP_EXPLICIT_EOR value : %s", _bool ? "true" : "false");
+ 		}
+ 	}
+ 	#else /* SCTP_EXPLICIT_EOR */
+@@ -619,10 +619,10 @@ static int fd_setsockopt_prebind(int sk)
+ 	
+ 	#ifdef SCTP_RECVRCVINFO /* Replaces SCTP_SNDRCV */
+ 	{
+-		int bool = 1;
++		int _bool = 1;
+ 		
+ 		/* Set the option to the socket */
+-		CHECK_SYS(  setsockopt(sk, IPPROTO_SCTP, SCTP_RECVRCVINFO, &bool, sizeof(bool))  );
++		CHECK_SYS(  setsockopt(sk, IPPROTO_SCTP, SCTP_RECVRCVINFO, &_bool, sizeof(_bool))  );
+ 		
+ 	}
+ 	#else /* SCTP_RECVRCVINFO */
diff --git a/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
index c9756c941e..15368a9a3d 100644
--- a/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
+++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/freeDiameter/freeDiameter;protocol=https;branch=mast
     file://install_test.patch \
     file://0001-tests-use-EXTENSIONS_DIR.patch \
     file://0001-bison-flex-Add-flags-for-carrying-user-specified-par.patch \
+    file://0001-fixes-for-gcc-15.patch \
     "
 
 S = "${WORKDIR}/git"

