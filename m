Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <zlo@zlo.nu>)
	id 1O79NE-000606-Fd for openembedded-devel@lists.openembedded.org;
	Wed, 28 Apr 2010 17:40:29 +0200
Received: from localhost.localdomain (seven.iphion.nl [80.255.245.169])
	by mzh.zlo.nu (Postfix) with ESMTP id ECBF914087
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Apr 2010 17:36:46 +0200 (CEST)
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Apr 2010 17:36:46 +0200
Message-Id: <1272469006-26272-1-git-send-email-zlo@zlo.nu>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: zlo@zlo.nu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Apply remove-bashisms patch for runtime and compile time bashisms in "configure".
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
X-List-Received-Date: Wed, 28 Apr 2010 15:40:29 -0000

From: Marc Olzheim <marc@iphion.nl>

---
 .../remove-configure-bashisms.patch                |   47 ++++++++++++++++++++
 recipes/iproute2/iproute2_2.6.31.bb                |    4 +-
 2 files changed, 50 insertions(+), 1 deletions(-)
 create mode 100644 recipes/iproute2/iproute2-2.6.31/remove-configure-bashisms.patch

diff --git a/recipes/iproute2/iproute2-2.6.31/remove-configure-bashisms.patch b/recipes/iproute2/iproute2-2.6.31/remove-configure-bashisms.patch
new file mode 100644
index 0000000..941c26a
--- /dev/null
+++ b/recipes/iproute2/iproute2-2.6.31/remove-configure-bashisms.patch
@@ -0,0 +1,47 @@
+--- iproute2-2.6.31/configure	2009-12-26 19:26:44.000000000 +0100
++++ iproute2-2.6.31/configure	2010-04-28 17:29:12.000000000 +0200
+@@ -3,7 +3,7 @@
+ #
+ INCLUDE=${1:-"$PWD/include"}
+ 
+-function check_atm
++check_atm()
+ {
+ cat >/tmp/atmtest.c <<EOF
+ #include <atm.h>
+@@ -24,7 +24,7 @@
+ rm -f /tmp/atmtest.c /tmp/atmtest
+ }
+ 
+-function check_xt
++check_xt()
+ {
+ #check if we have xtables from iptables >= 1.4.5.
+ cat >/tmp/ipttest.c <<EOF
+@@ -55,7 +55,7 @@
+ rm -f /tmp/ipttest.c /tmp/ipttest
+ }
+ 
+-function check_xt_old
++check_xt_old()
+ {
+ # bail if previous XT checks has already succeded.
+ if grep TC_CONFIG_XT Config > /dev/null
+@@ -94,7 +94,7 @@
+ rm -f /tmp/ipttest.c /tmp/ipttest
+ }
+ 
+-function check_xt_old_internal_h
++check_xt_old_internal_h()
+ {
+ # bail if previous XT checks has already succeded.
+ if grep TC_CONFIG_XT Config > /dev/null
+@@ -134,7 +134,7 @@
+ rm -f /tmp/ipttest.c /tmp/ipttest
+ }
+ 
+-function check_ipt
++check_ipt()
+ {
+ 	if ! grep TC_CONFIG_XT Config > /dev/null
+ 	then
diff --git a/recipes/iproute2/iproute2_2.6.31.bb b/recipes/iproute2/iproute2_2.6.31.bb
index 543e1b1..2baed56 100644
--- a/recipes/iproute2/iproute2_2.6.31.bb
+++ b/recipes/iproute2/iproute2_2.6.31.bb
@@ -1,9 +1,11 @@
 require iproute2.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI = "http://developer.osdl.org/dev/iproute2/download/${P}.tar.bz2 \
 	   file://new-flex-fix.patch;patch=1 \
+	   file://remove-configure-bashisms.patch;patch=1 \
+	   file://remove-bashisms.patch;patch=1 \
 	  "
 
 S = "${WORKDIR}/iproute2-${PV}"
-- 
1.6.3.3



