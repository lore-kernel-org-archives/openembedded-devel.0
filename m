Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id F3C136C782
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2013 17:24:20 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id e53so819983eek.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2013 10:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UKqedUzsKzuy1wmqcSeGYbvBdUZLjPop+Iu+Ede7Gu0=;
	b=GuRX15r/lNe9dVyJcZwch0KQmgVEyUX4w0jWoAXr3YXpsrbZ8lhZDUSDfYNAjGzR19
	ObBSN8S6Cgue5E0z5Ow64OGaKUadNSwmq46PX3K09QcQ3gh2vGE1TEinFkkPUK/qRRGX
	sItI6MRYDEhWA0KzmAYfvTrsv9U1HOnapCk5J44e2enlnQtGVNMByPI/hIhEB/9hL+V6
	NdZ01vvjiOch1nFHE0usPglA4z/PhlKuvYFQjDhi7ZHFhuCeSyho8wsNlx7YV3jFyy6x
	AOQoJz7wShS/sdH2QQczat2h/0cEt50fMjd9qXGCrIElgUkBMxXU64bzUOILtFFewaRc
	UUdg==
X-Received: by 10.14.198.66 with SMTP id u42mr3377409een.80.1383153862276;
	Wed, 30 Oct 2013 10:24:22 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	u46sm85975253eep.17.2013.10.30.10.24.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Oct 2013 10:24:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Oct 2013 18:24:21 +0100
Message-Id: <1383153861-1356-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <1383063056-1039-1-git-send-email-Martin.Jansa@gmail.com>
References: <1383063056-1039-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCHv2] xserver-common: start Xsession when starting Xserver
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
X-List-Received-Date: Wed, 30 Oct 2013 17:24:22 -0000

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
index 0000000..5a75964
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
++echo "exec xinit /etc/X11/Xsession -- $BINDIR/$XSERVER $ARGS -dpi $DPI $*"
+ 
++exec xinit /etc/X11/Xsession -- $BINDIR/$XSERVER $ARGS -dpi $DPI $*
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


