Received: from out3.smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OFTQQ-0006C6-Em
	for Openembedded-devel@lists.openembedded.org;
	Fri, 21 May 2010 16:42:11 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 33F66F7D64;
	Fri, 21 May 2010 10:37:25 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Fri, 21 May 2010 10:37:25 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	s=smtpout; bh=+yWQDstFkLW3+I9Xh931YdcSLog=;
	b=JKtphmclPF7ViYDdwl9ry2u5j7iDVD/++T92Q+VsYVF4bTSCI8jJZU4YrBtGQvuUSU+PU4Hv8WIVmCWkXcHOj/V4CjOMYP9TgJKCn6+y78W1DGAj2ofwN07L1whrJoxFHJihK3Zo5+mwJW/u5pL1KNFDG+EY1SeSujGSMO4I8BE=
X-Sasl-enc: UIwadDl4f1z0rQt8DWuPJRiQBy6uUgTEZnVpp/Q6Es0V 1274452644
Received: from localhost.localdomain (hnvr-4d078ae5.pool.mediaWays.net
	[77.7.138.229])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5B22158000;
	Fri, 21 May 2010 10:37:24 -0400 (EDT)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Date: Fri, 21 May 2010 16:38:04 +0200
Message-Id: <1274452686-17891-1-git-send-email-vjensen@gmx.de>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <alpine.LNX.2.00.1005162211110.21508@asterix.crazy-teaparty.dyndns.org>
References: <alpine.LNX.2.00.1005162211110.21508@asterix.crazy-teaparty.dyndns.org>
X-SA-Exim-Connect-IP: 66.111.4.27
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Vitus Jensen <vjensen@gmx.de>
Subject: [PATCH v3 1/3] libsocketcan: new recipes
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
X-List-Received-Date: Fri, 21 May 2010 14:42:11 -0000

Build pengutronix' libsocketcan (netlink interface), used
by newer versions of canutils.  can_netlink.h is really
linux/can/netlink.h from linux-libc-headers but installed
here to be independ of staged linux-libc-headers versions.
libsocketcan 0.0.8 automatically installs can_netlink.h,
version 0.0.7 is patched to do so.

Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 .../socketcan/files/install-can_netlink.h.patch    |   21 ++++++++++++++++++++
 recipes/socketcan/libsocketcan.inc                 |   16 +++++++++++++++
 recipes/socketcan/libsocketcan_0.0.7.bb            |    7 ++++++
 recipes/socketcan/libsocketcan_0.0.8.bb            |    4 +++
 4 files changed, 48 insertions(+), 0 deletions(-)
 create mode 100644 recipes/socketcan/files/install-can_netlink.h.patch
 create mode 100644 recipes/socketcan/libsocketcan.inc
 create mode 100644 recipes/socketcan/libsocketcan_0.0.7.bb
 create mode 100644 recipes/socketcan/libsocketcan_0.0.8.bb

diff --git a/recipes/socketcan/files/install-can_netlink.h.patch b/recipes/socketcan/files/install-can_netlink.h.patch
new file mode 100644
index 0000000..36f5e10
--- /dev/null
+++ b/recipes/socketcan/files/install-can_netlink.h.patch
@@ -0,0 +1,21 @@
+commit 2470d91a6254b062aae8ab6120795a0f28344687
+Author: Vitus Jensen <vitus@vitus.devnet.local>
+Date:   Tue May 18 16:59:01 2010 +0200
+
+    install can_netlink.h
+
+diff --git a/include/GNUmakefile.am b/include/GNUmakefile.am
+index 4ba2798..eb35a3a 100644
+--- a/include/GNUmakefile.am
++++ b/include/GNUmakefile.am
+@@ -1,8 +1,6 @@
+-noinst_HEADERS = \
+-	can_netlink.h
+-
+ nobase_include_HEADERS = \
+-	libsocketcan.h	
++	libsocketcan.h	\
++	can_netlink.h
+ 
+ MAINTAINERCLEANFILES = \
+ 	libsocketcan_config.h.in \
diff --git a/recipes/socketcan/libsocketcan.inc b/recipes/socketcan/libsocketcan.inc
new file mode 100644
index 0000000..367766c
--- /dev/null
+++ b/recipes/socketcan/libsocketcan.inc
@@ -0,0 +1,16 @@
+DESCRIPTION = "Control basic functions in socketcan from userspace"
+AUTHOR = "Luotao Fu"
+HOMEPAGE = "http://www.pengutronix.de"
+SECTION = "libs/network"
+PRIORITY = "optional"
+LICENSE = "LGPL"
+
+TAG = "v${PV}"
+INC_PR = "r0"
+
+SRC_URI = "git://git.pengutronix.de/git/tools/libsocketcan.git;protocol=git;tag=${TAG} \
+	"
+
+S = "${WORKDIR}/git"
+
+inherit autotools_stage pkgconfig
diff --git a/recipes/socketcan/libsocketcan_0.0.7.bb b/recipes/socketcan/libsocketcan_0.0.7.bb
new file mode 100644
index 0000000..7dd4fef
--- /dev/null
+++ b/recipes/socketcan/libsocketcan_0.0.7.bb
@@ -0,0 +1,7 @@
+TAG = "v${PV}"
+require libsocketcan.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://install-can_netlink.h.patch;patch=1 \
+	"
diff --git a/recipes/socketcan/libsocketcan_0.0.8.bb b/recipes/socketcan/libsocketcan_0.0.8.bb
new file mode 100644
index 0000000..5598a0f
--- /dev/null
+++ b/recipes/socketcan/libsocketcan_0.0.8.bb
@@ -0,0 +1,4 @@
+TAG = "v${PV}"
+require libsocketcan.inc
+
+PR = "${INC_PR}.0"
-- 
1.6.4.4



