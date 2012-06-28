Received: from host9-119-dynamic.45-79-r.retail.telecomitalia.it
	([79.45.119.9] helo=router.workgroup)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@eukrea.com>) id 1SkFea-0005iN-Rc
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jun 2012 16:25:05 +0200
Received: from denis-n73sv.local ([192.168.1.117] helo=localhost.localdomain)
	by router.workgroup with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.76) (envelope-from <denis@eukrea.com>)
	id 1SkEwP-0003Ms-1k; Thu, 28 Jun 2012 15:39:25 +0200
From: Denis Carikli <denis@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jun 2012 15:38:20 +0200
Message-Id: <1340890700-31781-1-git-send-email-denis@eukrea.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] xserver-common 1.34: sync /etc/X11/Xsession.d/90xXWindowManager with x11-common(oe-core)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jun 2012 14:25:05 -0000

Without that fix environments like sato cannot start because
  they require x-session-manager to be started instead of
  x-window-manager.

Signed-off-by: Denis Carikli <denis@eukrea.com>
---
 ...0005-add-XWindowManager-Xsession.d-script.patch |   17 +++++++----------
 .../xserver-common/xserver-common_1.34.bb          |    2 +-
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0005-add-XWindowManager-Xsession.d-script.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0005-add-XWindowManager-Xsession.d-script.patch
index f5c2c78..1782665 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0005-add-XWindowManager-Xsession.d-script.patch
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0005-add-XWindowManager-Xsession.d-script.patch
@@ -9,18 +9,15 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 files changed, 6 insertions(+), 0 deletions(-)
  create mode 100644 X11/Xsession.d/90xXWindowManager
 
-diff --git a/X11/Xsession.d/90xXWindowManager b/X11/Xsession.d/90xXWindowManager
-new file mode 100644
-index 0000000..3df8435
---- /dev/null
-+++ b/X11/Xsession.d/90xXWindowManager
-@@ -0,0 +1,6 @@
-+#!/bin/sh
+Index: xserver-common-1.34/X11/Xsession.d/90xXWindowManager
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ xserver-common-1.34/X11/Xsession.d/90xXWindowManager	2012-06-28 15:02:22.010521773 +0200
+@@ -0,0 +1,7 @@
 +if [ -x $HOME/.Xsession ]; then
 +    exec $HOME/.Xsession
++elif [ -x /usr/bin/x-session-manager ]; then
++    exec /usr/bin/x-session-manager
 +else
 +    exec /usr/bin/x-window-manager
 +fi
--- 
-1.7.8.5
-
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
index 1147fca..a7e8191 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Common X11 scripts and support files"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r6"
+PR = "r7"
 
 # we are using a gpe-style Makefile
 inherit gpe
-- 
1.7.5.4



