Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <zlo@zlo.nu>)
	id 1NAhwX-0006mH-Rp for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 11:39:24 +0100
Received: from localhost.localdomain (seven.iphion.nl [80.255.245.169])
	by mzh.zlo.nu (Postfix) with ESMTP id 4DF3C140B4;
	Wed, 18 Nov 2009 11:37:58 +0100 (CET)
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Nov 2009 11:37:51 +0100
Message-Id: <1258540671-652-4-git-send-email-zlo@zlo.nu>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1258540671-652-3-git-send-email-zlo@zlo.nu>
References: <1258540671-652-1-git-send-email-zlo@zlo.nu>
	<1258540671-652-2-git-send-email-zlo@zlo.nu>
	<1258540671-652-3-git-send-email-zlo@zlo.nu>
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: zlo@zlo.nu
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Marc Olzheim <marc@iphion.nl>
Subject: [PATCH 3/3] Remove unneeded bash dependency.
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
X-List-Received-Date: Wed, 18 Nov 2009 10:39:25 -0000

From: Marc Olzheim <marc@iphion.nl>

Even though the recipes did not list it in REDEPENDS, two scripts in
this package depended on bash. Since this was unneeded, I removed that
dependency. (Upstream notified)
---
 recipes/iproute2/files/remove-bashisms.patch |   59 ++++++++++++++++++++++++++
 recipes/iproute2/iproute2_2.6.20.bb          |    3 +-
 recipes/iproute2/iproute2_2.6.22.bb          |    3 +-
 recipes/iproute2/iproute2_2.6.29.bb          |    3 +-
 4 files changed, 65 insertions(+), 3 deletions(-)
 create mode 100644 recipes/iproute2/files/remove-bashisms.patch

diff --git a/recipes/iproute2/files/remove-bashisms.patch b/recipes/iproute2/files/remove-bashisms.patch
new file mode 100644
index 0000000..f90149a
--- /dev/null
+++ b/recipes/iproute2/files/remove-bashisms.patch
@@ -0,0 +1,59 @@
+From ddf7948f9a088f26e7ed9ba01479029cd4e6f060 Mon Sep 17 00:00:00 2001
+From: Marc Olzheim <marc@iphion.nl>
+Date: Wed, 18 Nov 2009 10:43:53 +0100
+Subject: [PATCH] Get rid of bashisms.
+
+---
+ ip/ifcfg |   12 ++++++------
+ ip/rtpr  |    2 +-
+ 2 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/ip/ifcfg b/ip/ifcfg
+index 083d9df..cd78d61 100644
+--- a/ip/ifcfg
++++ b/ip/ifcfg
+@@ -1,4 +1,4 @@
+-#! /bin/bash
++#! /bin/sh
+ 
+ CheckForwarding () {
+   local sbase fwd
+@@ -6,7 +6,7 @@ CheckForwarding () {
+   fwd=0
+   if [ -d $sbase ]; then
+     for dir in $sbase/*/forwarding; do
+-      fwd=$[$fwd + `cat $dir`]
++      fwd=$(($fwd + `cat $dir`))
+     done
+   else
+     fwd=2
+@@ -127,12 +127,12 @@ fi
+ arping -q -A -c 1 -I $dev $ipaddr
+ noarp=$?
+ ( sleep 2 ;
+-  arping -q -U -c 1 -I $dev $ipaddr ) >& /dev/null </dev/null &
++  arping -q -U -c 1 -I $dev $ipaddr ) >/dev/null 2>&1 </dev/null &
+ 
+-ip route add unreachable 224.0.0.0/24 >& /dev/null
+-ip route add unreachable 255.255.255.255 >& /dev/null
++ip route add unreachable 224.0.0.0/24 >/dev/null 2>&1
++ip route add unreachable 255.255.255.255 >/dev/null 2>&1
+ if [ `ip link ls $dev | grep -c MULTICAST` -ge 1 ]; then
+-  ip route add 224.0.0.0/4 dev $dev scope global >& /dev/null
++  ip route add 224.0.0.0/4 dev $dev scope global >/dev/null 2>&1
+ fi
+ 
+ if [ $fwd -eq 0 ]; then
+diff --git a/ip/rtpr b/ip/rtpr
+index c3629fd..674198d 100644
+--- a/ip/rtpr
++++ b/ip/rtpr
+@@ -1,4 +1,4 @@
+-#! /bin/bash
++#! /bin/sh
+ 
+ exec tr "[\\\\]" "[
+ ]"
+-- 
+1.6.3.3
+
diff --git a/recipes/iproute2/iproute2_2.6.20.bb b/recipes/iproute2/iproute2_2.6.20.bb
index 2509f36..920e24d 100644
--- a/recipes/iproute2/iproute2_2.6.20.bb
+++ b/recipes/iproute2/iproute2_2.6.20.bb
@@ -1,12 +1,13 @@
 require iproute2.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DATE = "070313"
 
 SRC_URI_append = " file://iproute2-2.6.20_new-flex-fix.patch;patch=1 \
                    file://ip6tunnel.patch;patch=1 \
                    file://man-pages-fix.patch;patch=1 \
+                   file://remove-bashisms.patch;patch=1 \
                    file://no-strip.patch;patch=1"
 
 S = "${WORKDIR}/iproute-${PV}-${DATE}"
diff --git a/recipes/iproute2/iproute2_2.6.22.bb b/recipes/iproute2/iproute2_2.6.22.bb
index fe13d6c..0904517 100644
--- a/recipes/iproute2/iproute2_2.6.22.bb
+++ b/recipes/iproute2/iproute2_2.6.22.bb
@@ -1,11 +1,12 @@
 require iproute2.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DATE = "070710"
 
 SRC_URI_append = " file://iproute2-2.6.20_new-flex-fix.patch;patch=1 \
                    file://ip6tunnel.patch;patch=1 \
+                   file://remove-bashisms.patch;patch=1 \
                    file://no-strip.patch;patch=1"
 
 S = "${WORKDIR}"
diff --git a/recipes/iproute2/iproute2_2.6.29.bb b/recipes/iproute2/iproute2_2.6.29.bb
index 0554d6b..491f23c 100644
--- a/recipes/iproute2/iproute2_2.6.29.bb
+++ b/recipes/iproute2/iproute2_2.6.29.bb
@@ -1,9 +1,10 @@
 require iproute2.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI = "http://developer.osdl.org/dev/iproute2/download/${P}.tar.bz2 \
 	   file://iproute2-2.6.20_new-flex-fix.patch;patch=1 \
+	   file://remove-bashisms.patch;patch=1 \
 	   file://missing_linux_ip_header.patch;patch=1 \
 	  "
 
-- 
1.6.3.3



