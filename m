Received: from [87.193.137.100] (helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1N3ToI-00082A-1O
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Oct 2009 13:09:01 +0100
Received: from hiob.intern.dresearch.de (unknown [10.32.0.138])
	by mail.dresearch.de (Postfix) with ESMTP id 5D91F491278
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2009 13:07:52 +0100 (CET)
Received: from fsc-480-012-88.intern.dresearch.de ([10.32.10.177]) by
	hiob.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 29 Oct 2009 13:10:04 +0100
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 10000)
	id 2C8457225F; Thu, 29 Oct 2009 13:07:50 +0100 (CET)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Oct 2009 13:07:27 +0100
Message-Id: <1256818047-19717-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <4AE830DE.5030209@dresearch.de>
References: <4AE830DE.5030209@dresearch.de>
X-OriginalArrivalTime: 29 Oct 2009 12:10:04.0968 (UTC)
	FILETIME=[BFC9AA80:01CA5890]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/2] busybox-1.11.3: undefined reference __cpu_to_be16 fixed for busybox-static
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
X-List-Received-Date: Thu, 29 Oct 2009 12:09:01 -0000


Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/busybox/busybox-1.11.3/iptunnel.patch |   11 +++++++++++
 recipes/busybox/busybox.inc                   |    2 +-
 recipes/busybox/busybox_1.11.3.bb             |    1 +
 3 files changed, 13 insertions(+), 1 deletions(-)
 create mode 100644 recipes/busybox/busybox-1.11.3/iptunnel.patch

diff --git a/recipes/busybox/busybox-1.11.3/iptunnel.patch b/recipes/busybox/busybox-1.11.3/iptunnel.patch
new file mode 100644
index 0000000..18734fc
--- /dev/null
+++ b/recipes/busybox/busybox-1.11.3/iptunnel.patch
@@ -0,0 +1,11 @@
+diff -Nurd busybox-1.11.3.orig//networking/libiproute/iptunnel.c busybox-1.11.3/networking/libiproute/iptunnel.c
+--- busybox-1.11.3.orig//networking/libiproute/iptunnel.c	2009-10-29 12:49:58.000000000 +0100
++++ busybox-1.11.3/networking/libiproute/iptunnel.c	2009-10-29 12:50:33.000000000 +0100
+@@ -21,6 +21,7 @@
+ #ifndef __constant_htons
+ #define __constant_htons htons
+ #endif
++#include <asm/byteorder.h>
+ #include <linux/if_tunnel.h>
+ 
+ #include "ip_common.h"  /* #include "libbb.h" is inside */
diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index 0ff65a4..753b402 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -11,7 +11,7 @@ LICENSE = "GPL"
 SECTION = "base"
 PRIORITY = "required"
 
-INC_PR = "r22"
+INC_PR = "r23"
 
 SRC_URI = "\
   http://www.busybox.net/downloads/busybox-${PV}.tar.gz \
diff --git a/recipes/busybox/busybox_1.11.3.bb b/recipes/busybox/busybox_1.11.3.bb
index 293608b..0ec753f 100644
--- a/recipes/busybox/busybox_1.11.3.bb
+++ b/recipes/busybox/busybox_1.11.3.bb
@@ -7,6 +7,7 @@ SRC_URI = "\
   file://udhcpscript.patch;patch=1 \
   file://B921600.patch;patch=1 \
   file://fdisk_lineedit_segfault.patch;patch=1 \
+  file://iptunnel.patch;patch=1 \
   file://busybox-appletlib-dependency.patch;patch=1 \
   file://busybox-cron \
   file://busybox-httpd \
-- 
1.6.4.2




