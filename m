Received: from static.88-198-71-155.clients.your-server.de ([88.198.71.155]
	helo=socrates.bennee.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kernel-hacker@bennee.com>) id 1PzYu7-0000V6-2y
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 19:23:35 +0100
Received: from localhost ([127.0.0.1] helo=sloy.cambridgebroadband.com)
	by socrates.bennee.com with esmtp (Exim 4.72)
	(envelope-from <kernel-hacker@bennee.com>)
	id 1PzYsW-0008WL-Vl; Tue, 15 Mar 2011 19:21:57 +0100
From: kernel-hacker@bennee.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Mar 2011 18:21:34 +0000
Message-Id: <1300213294-4046-1-git-send-email-kernel-hacker@bennee.com>
X-Mailer: git-send-email 1.7.4.1
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: kernel-hacker@bennee.com
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
Cc: Alex Bennee <ajb@cbnl.com>
Subject: [PATCH] valgrind: update to 3.6.1
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
X-List-Received-Date: Tue, 15 Mar 2011 18:23:35 -0000

From: Alex Bennee <ajb@cbnl.com>

I took the opportunity to move the common stuff for building Valgrind
into a common valgrind.inc. I also removed the fix-link-tool.patch
which was breaking the build. I'm not sure what the patch was trying
to achieve.

Signed-off-by: Alex Bennee <ajb@cbnl.com>
---
 .../valgrind/valgrind-3.6.0/fix-link-tool.patch    |   26 --------------------
 recipes/valgrind/valgrind.inc                      |   18 +++++++++++++
 recipes/valgrind/valgrind_3.6.0.bb                 |   20 +--------------
 recipes/valgrind/valgrind_3.6.1.bb                 |    4 +++
 4 files changed, 23 insertions(+), 45 deletions(-)
 delete mode 100644 recipes/valgrind/valgrind-3.6.0/fix-link-tool.patch
 create mode 100644 recipes/valgrind/valgrind.inc
 create mode 100644 recipes/valgrind/valgrind_3.6.1.bb

diff --git a/recipes/valgrind/valgrind-3.6.0/fix-link-tool.patch b/recipes/valgrind/valgrind-3.6.0/fix-link-tool.patch
deleted file mode 100644
index 0e39530..0000000
--- a/recipes/valgrind/valgrind-3.6.0/fix-link-tool.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-diff -rupN valgrind-3.6.0/coregrind/link_tool_exe_linux.in new/coregrind/link_tool_exe_linux.in
---- valgrind-3.6.0/coregrind/link_tool_exe_linux.in	2010-10-21 00:19:45.000000000 +0400
-+++ new/coregrind/link_tool_exe_linux.in	2010-10-25 17:11:47.000000000 +0400
-@@ -60,20 +60,13 @@ my $ala = $ARGV[0];
- die "Bogus alt-load address"
-     if (length($ala) < 3 || index($ala, "0x") != 0);
- 
--# The cc invokation to do the final link
--my $cc = $ARGV[1];
--
--# and the 'restargs' are argv[2 ..]
--
--# so, build up the complete command here:
--# 'cc' -static -Ttext='ala' 'restargs'
--
--my $cmd="$cc -static -Wl,-Ttext=$ala";
-+my $cmd="";
- 
- # Add the rest of the parameters
- foreach my $n (2 .. $#ARGV) {
-    $cmd = "$cmd $ARGV[$n]";
- }
-+$cmd = "$cmd -static -Wl,-Ttext=$ala";
- 
- #print "link_tool_exe_linux: $cmd\n";
- 
diff --git a/recipes/valgrind/valgrind.inc b/recipes/valgrind/valgrind.inc
new file mode 100644
index 0000000..9c38d70
--- /dev/null
+++ b/recipes/valgrind/valgrind.inc
@@ -0,0 +1,18 @@
+DESCRIPTION = "Valgrind memory debugger"
+HOMEPAGE = "http://www.valgrind.org/"
+SECTION = "devel"
+LICENSE = "GPLv2"
+DEPENDS = "virtual/libx11"
+PR = "r0"
+
+SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2"
+
+inherit autotools
+
+EXTRA_OECONF = "--enable-tls"
+
+PARALLEL_MAKE=""
+COMPATIBLE_HOST = "^(i.86|x86_64).*-linux"
+
+FILES_${PN}-dbg += "/usr/lib/valgrind/x86-linux/.debug"
+FILES_${PN}-dbg += "/usr/lib/valgrind/amd64-linux/.debug"
diff --git a/recipes/valgrind/valgrind_3.6.0.bb b/recipes/valgrind/valgrind_3.6.0.bb
index 885e81f..b69bfef 100644
--- a/recipes/valgrind/valgrind_3.6.0.bb
+++ b/recipes/valgrind/valgrind_3.6.0.bb
@@ -1,22 +1,4 @@
-DESCRIPTION = "Valgrind memory debugger"
-HOMEPAGE = "http://www.valgrind.org/"
-SECTION = "devel"
-LICENSE = "GPLv2"
-DEPENDS = "virtual/libx11"
-PR = "r0"
-
-SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
-	file://fix-link-tool.patch"
-
-inherit autotools
-
-EXTRA_OECONF = "--enable-tls"
-
-PARALLEL_MAKE=""
-COMPATIBLE_HOST = "^(i.86|x86_64).*-linux"
-
-FILES_${PN}-dbg += "/usr/lib/valgrind/x86-linux/.debug"
-FILES_${PN}-dbg += "/usr/lib/valgrind/amd64-linux/.debug"
+require valgrind.inc
 
 SRC_URI[md5sum] = "b289c5f4ab8e39741602445f1dd09b34"
 SRC_URI[sha256sum] = "bc0f0153b5a47b986f1d8efa2c488e0aea85a1cf2c4b11c52be127903080285f"
diff --git a/recipes/valgrind/valgrind_3.6.1.bb b/recipes/valgrind/valgrind_3.6.1.bb
new file mode 100644
index 0000000..9484c43
--- /dev/null
+++ b/recipes/valgrind/valgrind_3.6.1.bb
@@ -0,0 +1,4 @@
+require valgrind.inc
+
+SRC_URI[md5sum] = "2c3aa122498baecc9d69194057ca88f5"
+SRC_URI[sha256sum] = "49bdcc4fbcf060049b5f0dcfd8a187a6e90e0b0e57309f633b64e44430726a0e"
-- 
1.7.4.1



