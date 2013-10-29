Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id A5A6A6D430
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 16:10:57 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id e53so35745eek.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 09:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=hZfdNj0WQrwBRF16Se7st0SETzwl821zMQcDpjz8TQw=;
	b=eFPyASxIfKJ47I20rX8QAkLK7QwUqEJtB7wgcPz8oH0PT0o9FWfokwFjYTltRdANb6
	/Qy/TjkI175xQz9Hbd8vtg7Uwu+q1iSNySq6YcrUKDpyWe0MrQEszMNieUd28HmtlefT
	C80nh4dg5LXNiXPTKY38D7orGsxQtrJcBQyFcatH0VouI/uXTWwWsnyQmrlEJUdTepN7
	Fy5fy3zBYcuW7JWk5rj34pLmHTQ8KHiHI8lt5uQUBBx4nH4gzii4Ix0CNxigJMZHRO9L
	f91MPFcWeLv6NcgavyRkBwqM3gl1os2u7gCgCLsQ3WoOoP20MGcxMaZcmzVlvSCD1Lds
	CHog==
X-Received: by 10.15.101.130 with SMTP id bp2mr402576eeb.86.1383063059213;
	Tue, 29 Oct 2013 09:10:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id w6sm71981299eeo.12.2013.10.29.09.10.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Oct 2013 09:10:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2013 17:10:56 +0100
Message-Id: <1383063056-1039-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.2
Subject: [meta-oe][PATCH] xserver-common: start Xsession when starting Xserver
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Oct 2013 16:10:58 -0000

* since this commit
  commit 305038f932fbcb39f3bb6698f8fad18172c30962
  Author: Jonathan Liu <net147@gmail.com>
  Date:   Wed Jun 12 08:30:15 2013 +0000
    xserver-nodm-init: do not execute Xsession twice

  xserver-nodm-init wasn't working correctly when it was used together
  with xserver-common which doesn't start Xsession from Xserver (unlike
  x11-common in oe-core).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...erver-Start-Xsession-like-x11-common-does.patch | 26 ++++++++++++++++++++++
 .../xserver-common/xserver-common_1.34.bb          |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0014-Xserver-Start-Xsession-like-x11-common-does.patch

diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0014-Xserver-Start-Xsession-like-x11-common-does.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0014-Xserver-Start-Xsession-like-x11-common-does.patch
new file mode 100644
index 0000000..25a18b9
--- /dev/null
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0014-Xserver-Start-Xsession-like-x11-common-does.patch
@@ -0,0 +1,26 @@
+From 8171f89944969a081be1ac193b2a59016e39a345 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 29 Oct 2013 17:07:21 +0100
+Subject: [PATCH 14/14] Xserver: Start Xsession like x11-common does
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ X11/Xserver | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/X11/Xserver b/X11/Xserver
+index 559f059..4b88637 100755
+--- a/X11/Xserver
++++ b/X11/Xserver
+@@ -4,6 +4,6 @@
+ . /etc/X11/xserver-common
+ 
+ echo "tslib: $TSLIB_TSDEVICE"
+-echo "exec $XSERVER $ARGS -dpi $DPI $*"
+-exec $XSERVER $ARGS -dpi $DPI $*
++echo "exec xinit /etc/X11/Xsession -- $XSERVER $ARGS -dpi $DPI $*"
+ 
++exec xinit /etc/X11/Xsession -- $XSERVER $ARGS -dpi $DPI $*
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
index 3bb8b61..481e438 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
@@ -23,6 +23,7 @@ SRC_URI_append = " \
     file://0011-xserver-common-add-support-for-nexus-one-alias-mahim.patch \
     file://0012-xserver-common-add-support-for-gta04-alias-OpenPhoen.patch \
     file://0013-xserver-common-add-support-for-tuna-alias-Galaxy-Nex.patch \
+    file://0014-Xserver-Start-Xsession-like-x11-common-does.patch \
 "
 
 do_install_append() {
-- 
1.8.4.2


