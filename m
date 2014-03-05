Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 690F86F171
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Mar 2014 17:41:51 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d17so614239eek.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Mar 2014 09:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SrzUFktEQ5XNBfj3JdNhGZt9AbUqEM3a/6sWdu3angM=;
	b=i5CDYfIzPrF5kM7y0Io5dJT5RqJheDL85vBMcUe2SQNdOIMXoWx/RAxYK2mg107mq8
	6GM0Dtpe8R626fnfqHfIZk9aENPHUjfc8BGTvdHQgdvREUC3G8Ij0aprcb50eK4azOZ+
	7UHbY5pGMsoV1j/SXrAHGujmre5GmrmEY/ZTSfrN5Ne3eE1cYH6agnGCo0WSYy13Fnq9
	JM7PR/b5M/0wtAJ2LesBB2ORQr+aC2wf8Anl05ES9+TZ6aiTFFCMNbBfFGTn2+D8bWAk
	M9laeKH3VTUE0iZYyBju0wh78wn4x6SYitjQ4HqzZ1+vUIrUFG+iqU5vX0wuy2Yrec1j
	4ljg==
X-Received: by 10.15.75.66 with SMTP id k42mr7431851eey.2.1394041312173;
	Wed, 05 Mar 2014 09:41:52 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o5sm11589877eeg.8.2014.03.05.09.41.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Mar 2014 09:41:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Mar 2014 18:41:54 +0100
Message-Id: <1394041314-10550-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-oe][PATCH] networkmanager: make it compatible with systemd-209
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
X-List-Received-Date: Wed, 05 Mar 2014 17:41:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...c-Check-only-for-libsystemd-not-libsystem.patch | 30 ++++++++++++++++++++++
 .../networkmanager/networkmanager_0.9.8.0.bb       |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
new file mode 100644
index 0000000..e356e9b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
@@ -0,0 +1,30 @@
+From 10427a19302e871daeeb245581e930dc58195492 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 27 Feb 2014 12:59:03 +0100
+Subject: [PATCH] configure.ac: Check only for libsystemd not libsystemd-login
+
+* they were merged into libsystemd in systemd-209
+
+Upstream-Status: Pending (it would need to be conditional on systemd version for upstream to accept this)
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index cc66e9b..3fe958e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -283,7 +283,7 @@ AS_IF([! (echo "$with_session_tracking" | grep -q -E "^(systemd|consolekit|no)$"
+ AM_CONDITIONAL(SESSION_TRACKING_CK, test "$with_session_tracking" = "consolekit")
+ AM_CONDITIONAL(SESSION_TRACKING_SYSTEMD, test "xwith_session_tracking" = "systemd")
+ if test "$with_session_tracking" = "systemd"; then
+-	PKG_CHECK_MODULES(SYSTEMD_LOGIN, [libsystemd-login])
++	PKG_CHECK_MODULES(SYSTEMD_LOGIN, [libsystemd])
+ 	AC_SUBST(SYSTEMD_LOGIN_CFLAGS)
+ 	AC_SUBST(SYSTEMD_LOGIN_LIBS)
+ fi
+-- 
+1.9.0
+
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
index 46b3cc7..3c7944d 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
     file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
     file://0002-NetworkManager.service-remove-reference-to-NetworkMa.patch \
+    file://0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch \
 "
 SRC_URI[md5sum] = "38d28f6bd9220d85dfff47210706195c"
 SRC_URI[sha256sum] = "c366bcded6354d8186ad93c05d26d6a20bc550aa0391f974704e7a60e9f6096b"
-- 
1.9.0


