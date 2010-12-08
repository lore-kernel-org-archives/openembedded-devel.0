Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1PQKsh-0008Vh-0n
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Dec 2010 15:20:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 8EAC391560A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 09:19:01 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24608-08 for <openembedded-devel@lists.openembedded.org>; 
	Wed,  8 Dec 2010 09:19:01 -0500 (EST)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 4C329914022; Wed,  8 Dec 2010 09:19:00 -0500 (EST)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id D8D39916327
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 09:18:54 -0500 (EST)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id BD51F502022; Wed,  8 Dec 2010 09:18:54 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Dec 2010 09:18:54 -0500
Message-Id: <1291817934-20226-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3.2
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] iproute2: upgrade to 2.6.35.1
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
X-List-Received-Date: Wed, 08 Dec 2010 14:20:34 -0000

Upgrade 2.6.35 to 2.6.35.1. The new version fixes "ip route get" and
"ip addr flush".

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 .../iproute2-2.6.35.1/configure-cross.patch        |   58 ++++++++++++++++++++
 .../iproute2/iproute2-2.6.35/configure-cross.patch |   58 --------------------
 recipes/iproute2/iproute2_2.6.35.1.bb              |   19 +++++++
 recipes/iproute2/iproute2_2.6.35.bb                |   19 -------
 4 files changed, 77 insertions(+), 77 deletions(-)
 create mode 100644 recipes/iproute2/iproute2-2.6.35.1/configure-cross.patch
 delete mode 100644 recipes/iproute2/iproute2-2.6.35/configure-cross.patch
 create mode 100644 recipes/iproute2/iproute2_2.6.35.1.bb
 delete mode 100644 recipes/iproute2/iproute2_2.6.35.bb

diff --git a/recipes/iproute2/iproute2-2.6.35.1/configure-cross.patch b/recipes/iproute2/iproute2-2.6.35.1/configure-cross.patch
new file mode 100644
index 0000000..631d6bf
--- /dev/null
+++ b/recipes/iproute2/iproute2-2.6.35.1/configure-cross.patch
@@ -0,0 +1,58 @@
+Index: iproute2-2.6.34/configure
+===================================================================
+--- iproute2-2.6.34.orig/configure
++++ iproute2-2.6.34/configure
+@@ -4,7 +4,7 @@
+ INCLUDE=${1:-"$PWD/include"}
+ 
+ TABLES=
+-
++SYSROOT=$1
+ check_atm()
+ {
+ cat >/tmp/atmtest.c <<EOF
+@@ -15,7 +15,7 @@ int main(int argc, char **argv) {
+ 	return 0;
+ }
+ EOF
+-gcc -I$INCLUDE -o /tmp/atmtest /tmp/atmtest.c -latm >/dev/null 2>&1 
++$CC -I$INCLUDE -o /tmp/atmtest /tmp/atmtest.c -latm >/dev/null 2>&1
+ if [ $? -eq 0 ]
+ then
+     echo "TC_CONFIG_ATM:=y" >>Config
+@@ -49,7 +49,7 @@ int main(int argc, char **argv)
+ 
+ EOF
+ 
+-if gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl -lxtables >/dev/null 2>&1
++if $CC -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl -lxtables >/dev/null 2>&1
+ then
+ 	echo "TC_CONFIG_XT:=y" >>Config
+ 	echo "using xtables"
+@@ -86,7 +86,7 @@ int main(int argc, char **argv) {
+ }
+ 
+ EOF
+-gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl >/dev/null 2>&1
++$CC -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl >/dev/null 2>&1
+ 
+ if [ $? -eq 0 ]
+ then
+@@ -126,7 +126,7 @@ int main(int argc, char **argv) {
+ }
+ 
+ EOF
+-gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl >/dev/null 2>&1
++$CC -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl >/dev/null 2>&1
+ 
+ if [ $? -eq 0 ]
+ then
+@@ -150,7 +150,7 @@ check_ipt()
+ check_ipt_lib_dir()
+ {
+ 	IPT_LIB_DIR=""
+-	for dir in /lib /usr/lib /usr/local/lib
++	for dir in $SYSROOT/lib $SYSROOT/usr/lib $SYSROOT/usr/local/lib
+ 	do
+ 		for file in $dir/$TABLES/lib*t_*so ; do
+ 			if [ -f $file ]; then
diff --git a/recipes/iproute2/iproute2-2.6.35/configure-cross.patch b/recipes/iproute2/iproute2-2.6.35/configure-cross.patch
deleted file mode 100644
index 631d6bf..0000000
--- a/recipes/iproute2/iproute2-2.6.35/configure-cross.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-Index: iproute2-2.6.34/configure
-===================================================================
---- iproute2-2.6.34.orig/configure
-+++ iproute2-2.6.34/configure
-@@ -4,7 +4,7 @@
- INCLUDE=${1:-"$PWD/include"}
- 
- TABLES=
--
-+SYSROOT=$1
- check_atm()
- {
- cat >/tmp/atmtest.c <<EOF
-@@ -15,7 +15,7 @@ int main(int argc, char **argv) {
- 	return 0;
- }
- EOF
--gcc -I$INCLUDE -o /tmp/atmtest /tmp/atmtest.c -latm >/dev/null 2>&1 
-+$CC -I$INCLUDE -o /tmp/atmtest /tmp/atmtest.c -latm >/dev/null 2>&1
- if [ $? -eq 0 ]
- then
-     echo "TC_CONFIG_ATM:=y" >>Config
-@@ -49,7 +49,7 @@ int main(int argc, char **argv)
- 
- EOF
- 
--if gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl -lxtables >/dev/null 2>&1
-+if $CC -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl -lxtables >/dev/null 2>&1
- then
- 	echo "TC_CONFIG_XT:=y" >>Config
- 	echo "using xtables"
-@@ -86,7 +86,7 @@ int main(int argc, char **argv) {
- }
- 
- EOF
--gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl >/dev/null 2>&1
-+$CC -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl >/dev/null 2>&1
- 
- if [ $? -eq 0 ]
- then
-@@ -126,7 +126,7 @@ int main(int argc, char **argv) {
- }
- 
- EOF
--gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl >/dev/null 2>&1
-+$CC -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl >/dev/null 2>&1
- 
- if [ $? -eq 0 ]
- then
-@@ -150,7 +150,7 @@ check_ipt()
- check_ipt_lib_dir()
- {
- 	IPT_LIB_DIR=""
--	for dir in /lib /usr/lib /usr/local/lib
-+	for dir in $SYSROOT/lib $SYSROOT/usr/lib $SYSROOT/usr/local/lib
- 	do
- 		for file in $dir/$TABLES/lib*t_*so ; do
- 			if [ -f $file ]; then
diff --git a/recipes/iproute2/iproute2_2.6.35.1.bb b/recipes/iproute2/iproute2_2.6.35.1.bb
new file mode 100644
index 0000000..7b4c2d6
--- /dev/null
+++ b/recipes/iproute2/iproute2_2.6.35.1.bb
@@ -0,0 +1,19 @@
+require iproute2.inc
+
+PR = "${INC_PR}.0"
+
+# There is no tarball for v2.6.35.1, but there is a tag.
+SRCREV = "v${PV}"
+
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/iproute2.git;protocol=git \
+	   file://configure-cross.patch \
+	  "
+
+S = "${WORKDIR}/git"
+
+do_configure () {
+    ./configure ${STAGING_DIR_TARGET}
+}
+
+FILES_${PN} += "${base_libdir}/tc/*.so"
+FILES_${PN}-dbg += "${base_libdir}/tc/.debug"
diff --git a/recipes/iproute2/iproute2_2.6.35.bb b/recipes/iproute2/iproute2_2.6.35.bb
deleted file mode 100644
index eaa511f..0000000
--- a/recipes/iproute2/iproute2_2.6.35.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require iproute2.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "http://devresources.linuxfoundation.org/dev/iproute2/download/${P}.tar.bz2 \
-	   file://configure-cross.patch \
-	  "
-
-SRC_URI[md5sum] = "b0f281b3124bf04669e18f5fe16d4934"
-SRC_URI[sha256sum] = "8ab2f47e129925fb8acb09421008d07aeafa01b2ddd1fcba4a056de079f090a3"
-
-S = "${WORKDIR}/iproute2-${PV}"
-
-do_configure () {
-    ./configure ${STAGING_DIR_TARGET}
-}
-
-FILES_${PN} += "${base_libdir}/tc/*.so"
-FILES_${PN}-dbg += "${base_libdir}/tc/.debug"
\ No newline at end of file
-- 
1.6.3.2



