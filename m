Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 268F371AAF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 18:21:20 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 999E8B81F65; Wed, 30 Nov 2016 19:21:18 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 19:21:18 +0100
Message-Id: <1480530078-8159-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-networking][PATCH] samba: Avoid timeout for nmbd if started offline with systemd
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Nov 2016 18:21:21 -0000

If no network connection appears within DefaultTimeoutStartSec
(~ 90s) after startup, nmbd fails to notify systemd and will
therefore get killed.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 ...void-timeout-for-nmbd-if-started-offline-.patch | 31 ++++++++++++++++++++++
 .../recipes-connectivity/samba/samba_4.4.5.bb      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.4.5/0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba-4.4.5/0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch b/meta-networking/recipes-connectivity/samba/samba-4.4.5/0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch
new file mode 100644
index 0000000..0ab3436
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba-4.4.5/0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch
@@ -0,0 +1,31 @@
+Upstream-Status: Submitted [https://github.com/samba-team/samba/pull/70]
+
+Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
+
+From 50eac4fd30944e5e1d83060757633fe0ed572723 Mon Sep 17 00:00:00 2001
+From: Andreas Oberritter <obi@opendreambox.org>
+Date: Wed, 30 Nov 2016 16:25:06 +0100
+Subject: [PATCH] packaging: Avoid timeout for nmbd if started offline with
+ systemd
+
+If no network connection appears within DefaultTimeoutStartSec
+(~ 90s) after startup, nmbd fails to notify systemd and will
+therefore get killed.
+
+Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
+---
+ packaging/systemd/nmb.service | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/packaging/systemd/nmb.service b/packaging/systemd/nmb.service
+index 992c0cd..555c9ab 100644
+--- a/packaging/systemd/nmb.service
++++ b/packaging/systemd/nmb.service
+@@ -10,6 +10,7 @@ EnvironmentFile=-/etc/sysconfig/samba
+ ExecStart=/usr/sbin/nmbd $NMBDOPTIONS
+ ExecReload=/usr/bin/kill -HUP $MAINPID
+ LimitCORE=infinity
++TimeoutStartSec=0
+ 
+ [Install]
+ WantedBy=multi-user.target
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 8c5f6d8..e6347b8 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -17,6 +17,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://16-do-not-check-xsltproc-manpages.patch \
            file://20-do-not-import-target-module-while-cross-compile.patch \
            file://21-add-config-option-without-valgrind.patch \
+           file://0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch \
            file://0006-avoid-using-colon-in-the-checking-msg.patch \
            file://volatiles.03_samba \
           "
-- 
2.7.4


