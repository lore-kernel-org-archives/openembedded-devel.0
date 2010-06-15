Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OOQ8U-00057o-2m
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 09:01:06 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 5275D491278
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jun 2010 08:56:07 +0200 (CEST)
Received: from fsc-480-012-88.intern.dresearch.de ([10.32.10.177]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 15 Jun 2010 08:56:07 +0200
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 10000)
	id C8D0472078; Tue, 15 Jun 2010 08:56:06 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Jun 2010 08:55:50 +0200
Message-Id: <1276584950-22168-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <61003.195.148.62.38.1276533099.squirrel@webmail3.nebula.fi>
References: <61003.195.148.62.38.1276533099.squirrel@webmail3.nebula.fi>
X-OriginalArrivalTime: 15 Jun 2010 06:56:07.0240 (UTC)
	FILETIME=[D4393C80:01CB0C57]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] busybox-1.11.3/busybox-1.13.2: enable backgrounding for udhcpc
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
X-List-Received-Date: Tue, 15 Jun 2010 07:01:06 -0000

* The former default behaviour was to exit with failure if lease is not
  immediately obtained. This results in permanent network disconnect if DHCP
  server is (accidentally) not available at boot time. :(

* Since bb 1.14 this is no longer hardcoded and can be configured.

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 .../busybox/busybox-1.11.3/udhcpc-background.patch |   21 ++++++++++++++++++++
 .../busybox/busybox-1.13.2/udhcpc-background.patch |   21 ++++++++++++++++++++
 recipes/busybox/busybox_1.11.3.bb                  |    1 +
 recipes/busybox/busybox_1.13.2.bb                  |    1 +
 4 files changed, 44 insertions(+), 0 deletions(-)
 create mode 100644 recipes/busybox/busybox-1.11.3/udhcpc-background.patch
 create mode 100644 recipes/busybox/busybox-1.13.2/udhcpc-background.patch

diff --git a/recipes/busybox/busybox-1.11.3/udhcpc-background.patch b/recipes/busybox/busybox-1.11.3/udhcpc-background.patch
new file mode 100644
index 0000000..072ce88
--- /dev/null
+++ b/recipes/busybox/busybox-1.11.3/udhcpc-background.patch
@@ -0,0 +1,21 @@
+diff -Nurd busybox-1.11.3.orig//networking/ifupdown.c busybox-1.11.3/networking/ifupdown.c
+--- busybox-1.11.3.orig//networking/ifupdown.c	2010-06-15 08:45:44.000000000 +0200
++++ busybox-1.11.3/networking/ifupdown.c	2010-06-15 08:46:09.000000000 +0200
+@@ -476,7 +476,7 @@
+ 		"pump -i %iface% -k",
+ 	},
+ 	{ "udhcpc",
+-		"udhcpc -R -n -p /var/run/udhcpc.%iface%.pid -i %iface%[[ -H %hostname%]][[ -c %clientid%]]"
++		"udhcpc -R -b -p /var/run/udhcpc.%iface%.pid -i %iface%[[ -H %hostname%]][[ -c %clientid%]]"
+ 				"[[ -s %script%]][[ %udhcpc_opts%]]",
+ 		"kill `cat /var/run/udhcpc.%iface%.pid` 2>/dev/null",
+ 	},
+@@ -507,7 +507,7 @@
+ 	if (!execute("ip link set %iface% up", ifd, exec))
+ 		return 0;
+ #endif
+-	return execute("udhcpc -R -n -p /var/run/udhcpc.%iface%.pid "
++	return execute("udhcpc -R -b -p /var/run/udhcpc.%iface%.pid "
+ 			"-i %iface%[[ -H %hostname%]][[ -c %clientid%]][[ -s %script%]][[ %udhcpc_opts%]]",
+ 			ifd, exec);
+ }
diff --git a/recipes/busybox/busybox-1.13.2/udhcpc-background.patch b/recipes/busybox/busybox-1.13.2/udhcpc-background.patch
new file mode 100644
index 0000000..792023d
--- /dev/null
+++ b/recipes/busybox/busybox-1.13.2/udhcpc-background.patch
@@ -0,0 +1,21 @@
+diff -Nurd busybox-1.13.2.orig//networking/ifupdown.c busybox-1.13.2/networking/ifupdown.c
+--- busybox-1.13.2.orig//networking/ifupdown.c	2010-06-15 08:37:32.000000000 +0200
++++ busybox-1.13.2/networking/ifupdown.c	2010-06-15 08:38:05.000000000 +0200
+@@ -487,7 +487,7 @@
+ 		"pump -i %iface% -k",
+ 	},
+ 	{ "udhcpc",
+-		"udhcpc -R -n -p /var/run/udhcpc.%iface%.pid -i %iface%[[ -H %hostname%]][[ -c %clientid%]]"
++		"udhcpc -R -b -p /var/run/udhcpc.%iface%.pid -i %iface%[[ -H %hostname%]][[ -c %clientid%]]"
+ 				"[[ -s %script%]][[ %udhcpc_opts%]]",
+ 		"kill `cat /var/run/udhcpc.%iface%.pid` 2>/dev/null",
+ 	},
+@@ -526,7 +526,7 @@
+ 	if (!execute("ifconfig %iface%[[ hw %hwaddress%]] up", ifd, exec))
+ 		return 0;
+ #endif
+-	return execute("udhcpc -R -n -p /var/run/udhcpc.%iface%.pid "
++	return execute("udhcpc -R -b -p /var/run/udhcpc.%iface%.pid "
+ 			"-i %iface%[[ -H %hostname%]][[ -c %clientid%]][[ -s %script%]][[ %udhcpc_opts%]]",
+ 			ifd, exec);
+ }
diff --git a/recipes/busybox/busybox_1.11.3.bb b/recipes/busybox/busybox_1.11.3.bb
index fa169ef..7ddfd9e 100644
--- a/recipes/busybox/busybox_1.11.3.bb
+++ b/recipes/busybox/busybox_1.11.3.bb
@@ -5,6 +5,7 @@ SRC_URI = "\
   http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
   \
   file://udhcpscript.patch \
+  file://udhcpc-background.patch \
   file://B921600.patch \
   file://fdisk_lineedit_segfault.patch \
   file://iptunnel.patch \
diff --git a/recipes/busybox/busybox_1.13.2.bb b/recipes/busybox/busybox_1.13.2.bb
index 57815f6..2b28c0b 100644
--- a/recipes/busybox/busybox_1.13.2.bb
+++ b/recipes/busybox/busybox_1.13.2.bb
@@ -18,6 +18,7 @@ SRC_URI = "\
   \
   file://udhcpscript.patch \
   file://udhcpc-fix-nfsroot.patch \
+  file://udhcpc-background.patch \
   file://B921600.patch \
   file://get_header_tar.patch \
   file://busybox-appletlib-dependency.patch \
-- 
1.6.4.2



