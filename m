Received: from static-92-33-14-100.sme.bredbandsbolaget.se ([92.33.14.100]
	helo=mailhost.lundinova.se) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <johan.hovold@lundinova.se>) id 1ONmc7-0006Zu-IN
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Jun 2010 14:48:36 +0200
Received: from pi (unknown [10.240.22.2])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailhost.lundinova.se (Postfix) with ESMTP id 532CDB94006;
	Sun, 13 Jun 2010 14:15:55 +0200 (CEST)
Received: from johan by pi with local (Exim 4.71) (envelope-from <johan@pi>)
	id 1ONm6U-0007tr-I5; Sun, 13 Jun 2010 14:15:54 +0200
From: Johan Hovold <johan.hovold@lundinova.se>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Jun 2010 14:15:31 +0200
Message-Id: <1276431331-21243-1-git-send-email-johan.hovold@lundinova.se>
X-Mailer: git-send-email 1.7.1
Sender: <johan.hovold@lundinova.se>
X-SA-Exim-Connect-IP: 92.33.14.100
X-SA-Exim-Mail-From: johan.hovold@lundinova.se
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: gumstix-users@lists.sourceforge.net
Subject: [PATCH] iproute2-2.6.31: fix cross compile
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
X-List-Received-Date: Sun, 13 Jun 2010 12:48:36 -0000

Compilation failed (e.g. on missing xtables.h) due to configure script
using host gcc instead of cross compiler.

Signed-off-by: Johan Hovold <johan.hovold@lundinova.se>
---
 .../iproute2-2.6.31/fix-cross-compile.patch        |   38 ++++++++++++++++++++
 recipes/iproute2/iproute2_2.6.31.bb                |    1 +
 2 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 recipes/iproute2/iproute2-2.6.31/fix-cross-compile.patch

diff --git a/recipes/iproute2/iproute2-2.6.31/fix-cross-compile.patch b/recipes/iproute2/iproute2-2.6.31/fix-cross-compile.patch
new file mode 100644
index 0000000..c7e89f5
--- /dev/null
+++ b/recipes/iproute2/iproute2-2.6.31/fix-cross-compile.patch
@@ -0,0 +1,38 @@
+--- a/configure	2010-06-13 13:48:33.000000000 +0200
++++ b/configure	2010-06-13 13:48:42.000000000 +0200
+@@ -13,7 +13,7 @@ int main(int argc, char **argv) {
+ 	return 0;
+ }
+ EOF
+-gcc -I$INCLUDE -o /tmp/atmtest /tmp/atmtest.c -latm >/dev/null 2>&1 
++$CC -I$INCLUDE -o /tmp/atmtest /tmp/atmtest.c -latm >/dev/null 2>&1 
+ if [ $? -eq 0 ]
+ then
+     echo "TC_CONFIG_ATM:=y" >>Config
+@@ -47,7 +47,7 @@ int main(int argc, char **argv)
+ 
+ EOF
+ 
+-if gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl -lxtables >/dev/null 2>&1
++if $CC -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl -lxtables >/dev/null 2>&1
+ then
+ 	echo "TC_CONFIG_XT:=y" >>Config
+ 	echo "using xtables"
+@@ -84,7 +84,7 @@ int main(int argc, char **argv) {
+ }
+ 
+ EOF
+-gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl >/dev/null 2>&1
++$CC -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl >/dev/null 2>&1
+ 
+ if [ $? -eq 0 ]
+ then
+@@ -124,7 +124,7 @@ int main(int argc, char **argv) {
+ }
+ 
+ EOF
+-gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl >/dev/null 2>&1
++$CC -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl >/dev/null 2>&1
+ 
+ if [ $? -eq 0 ]
+ then
diff --git a/recipes/iproute2/iproute2_2.6.31.bb b/recipes/iproute2/iproute2_2.6.31.bb
index b952fa5..1100b27 100644
--- a/recipes/iproute2/iproute2_2.6.31.bb
+++ b/recipes/iproute2/iproute2_2.6.31.bb
@@ -4,6 +4,7 @@ PR = "${INC_PR}.0"
 
 SRC_URI = "http://developer.osdl.org/dev/iproute2/download/${P}.tar.bz2 \
 	   file://new-flex-fix.patch \
+	   file://fix-cross-compile.patch \
 	  "
 
 S = "${WORKDIR}/iproute2-${PV}"
-- 
1.7.1



