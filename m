Return-Path: <eric@eukrea.com>
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6958A60D8E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 15:20:06 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp5-g21.free.fr (Postfix) with ESMTP id BB83AD48183;
	Wed, 18 Dec 2013 16:20:03 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Dec 2013 16:20:21 +0100
Message-Id: <1387380021-20465-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.5.1
MIME-Version: 1.0
Cc: joe.macdonald@windriver.com
Subject: [meta-networking][PATCH] inetutils: fix compile error when PATH_PROCNET_DEV is undefined
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
X-List-Received-Date: Wed, 18 Dec 2013 15:20:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

patch taken from :
http://repository.timesys.com/buildsources/i/inetutils/inetutils-1.9/inetutils-1.9-PATH_PROCNET_DEV.patch

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 .../inetutils-1.9.1/inetutils-1.9-PATH_PROCNET_DEV.patch   | 14 ++++++++++++++
 .../recipes-connectivity/inetutils/inetutils_1.9.1.bb      |  1 +
 2 files changed, 15 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/inetutils-1.9-PATH_PROCNET_DEV.patch

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/inetutils-1.9-PATH_PROCNET_DEV.patch b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/inetutils-1.9-PATH_PROCNET_DEV.patch
new file mode 100644
index 0000000..54733be
--- /dev/null
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/inetutils-1.9-PATH_PROCNET_DEV.patch
@@ -0,0 +1,14 @@
+diff -Naur inetutils-1.9.orig/ifconfig/system/linux.c inetutils-1.9/ifconfig/system/linux.c
+--- inetutils-1.9.orig/ifconfig/system/linux.c	2012-01-04 16:31:36.000000000 -0500
++++ inetutils-1.9/ifconfig/system/linux.c	2012-01-04 16:40:53.000000000 -0500
+@@ -49,6 +49,10 @@
+ #include "../ifconfig.h"
+ 
+ 
++#ifndef PATH_PROCNET_DEV
++  #define PATH_PROCNET_DEV "/proc/net/dev"
++#endif
++
+ /* ARPHRD stuff.  */
+ 
+ static void
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
index d12ad39..97fc6a1 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
            file://rsh.xinetd.inetutils \
            file://telnet.xinetd.inetutils \
            file://tftpd.xinetd.inetutils \
+           file://inetutils-1.9-PATH_PROCNET_DEV.patch \
 "
 
 SRC_URI[md5sum] = "944f7196a2b3dba2d400e9088576000c"
-- 
1.8.5.1


