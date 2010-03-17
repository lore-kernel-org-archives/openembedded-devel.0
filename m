Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1Nrn8s-0001mR-EK
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 07:54:16 +0100
Received: from localhost.localdomain (c-76-115-42-183.hsd1.or.comcast.net
	[76.115.42.183])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id C869E301ED;
	Wed, 17 Mar 2010 02:51:06 -0400 (EDT)
From: Scott Garman <sgarman@zenlinux.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Mar 2010 23:51:01 -0700
Message-Id: <1268808661-13954-1-git-send-email-sgarman@zenlinux.com>
X-Mailer: git-send-email 1.6.3.3
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: C869E301ED.A2740
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-From: sgarman@zenlinux.com
X-SA-Exim-Connect-IP: 207.192.74.254
X-SA-Exim-Mail-From: sgarman@zenlinux.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] grip: Upgrade to 3.3.1
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
X-List-Received-Date: Wed, 17 Mar 2010 06:54:16 -0000

* Addresses CVE-2005-0706

Signed-off-by: Scott Garman <sgarman@zenlinux.com>
---
 conf/checksums.ini                             |    4 ++++
 recipes/grip/grip-3.3.1/no-host-includes.patch |   10 ++++++++++
 recipes/grip/grip_3.3.1.bb                     |   15 +++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 recipes/grip/grip-3.3.1/no-host-includes.patch
 create mode 100644 recipes/grip/grip_3.3.1.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 8dd9d6c..3f1f736 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -11018,6 +11018,10 @@ sha256=5a51a67f2828aa679a46bbb95cdc5346d6d4516f8ba74b7744b6049ccbe805ca
 md5=9b51933a03dd7d7ddfbb3643fc82c2d0
 sha256=5a51a67f2828aa679a46bbb95cdc5346d6d4516f8ba74b7744b6049ccbe805ca
 
+[http://downloads.sourceforge.net/grip/3.3.1/grip-3.3.1.tar.gz]
+md5=4b4233999b9f2bc85c711092553ea9aa
+sha256=d46394a1062ed066f9c633b010fd1059e63d9ed791bbb7a85bc6567cf0fd66fd
+
 [http://ftp.gnu.org/gnu/groff/groff-1.19.1.tar.gz]
 md5=57d155378640c12a80642664dfdfc892
 sha256=e07c495a18679b79c7c6f6f475689a33ab2a8ee5af4783e915f08134d1f546d2
diff --git a/recipes/grip/grip-3.3.1/no-host-includes.patch b/recipes/grip/grip-3.3.1/no-host-includes.patch
new file mode 100644
index 0000000..6a733b1
--- /dev/null
+++ b/recipes/grip/grip-3.3.1/no-host-includes.patch
@@ -0,0 +1,10 @@
+Index: grip-3.3.1/src/Makefile.am
+===================================================================
+--- grip-3.3.1.orig/src/Makefile.am	2010-03-16 14:46:01.651553829 +0800
++++ grip-3.3.1/src/Makefile.am	2010-03-16 14:46:05.240303128 +0800
+@@ -1,4 +1,4 @@
+-INCLUDES = -I$(top_srcdir) -I$(includedir) \
++INCLUDES = -I$(top_srcdir) \
+ 	-DGNOME_ICONDIR=\""$(datadir)/pixmaps"\" \
+          -DG_LOG_DOMAIN=\"grip\" -DGNOMELOCALEDIR=\""$(datadir)/locale"\" \
+         -I../intl -I$(top_srcdir)/intl \
diff --git a/recipes/grip/grip_3.3.1.bb b/recipes/grip/grip_3.3.1.bb
new file mode 100644
index 0000000..56f7120
--- /dev/null
+++ b/recipes/grip/grip_3.3.1.bb
@@ -0,0 +1,15 @@
+# grip OE build file
+# Copyright (C) 2005, Advanced Micro Devices, Inc.  All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+HOMEPAGE="http://www.nostatic.org/grip/"
+LICENSE="GPL"
+
+SRC_URI="${SOURCEFORGE_MIRROR}/grip/${PV}/grip-${PV}.tar.gz \
+         file://no-host-includes.patch;patch=1 "
+
+DEPENDS="libgnomeui vte curl cdparanoia id3lib"
+
+PR = "r1"
+
+inherit autotools
-- 
1.6.3.3



