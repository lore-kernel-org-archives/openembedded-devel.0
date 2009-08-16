Received: from [82.195.155.133] (helo=mail.techworks.ie)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cgagneraud@techworks.ie>) id 1McjzP-00030A-6C
	for openembedded-devel@lists.linuxtogo.org;
	Sun, 16 Aug 2009 19:57:55 +0200
Received: from archeopterix.techworks.local (unknown [86.43.120.173])
	by mail.techworks.ie (Postfix) with ESMTP id 54CE43AB65
	for <openembedded-devel@lists.linuxtogo.org>;
	Sun, 16 Aug 2009 18:41:03 +0100 (IST)
Message-ID: <4A88450A.8030609@techworks.ie>
Date: Sun, 16 Aug 2009 18:42:34 +0100
From: Christian Gagneraud <cgagneraud@techworks.ie>
User-Agent: Thunderbird 2.0.0.21 (X11/20090320)
MIME-Version: 1.0
To: openembedded-devel@lists.linuxtogo.org
Subject: [stable][patch] git: Add missing patch, apply it only when version >= 1.5.3
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
X-List-Received-Date: Sun, 16 Aug 2009 17:57:55 -0000
Content-Type: multipart/mixed; boundary="------------040805010603070801030200"

--------------040805010603070801030200
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Git-native fails to build (angstrom-2008.1 on stable branch) because 
aa patch is missing in the packages/git/files folder.
According to this message [1], the missing patch is not needed for the 
version being build, but is needed for newer version

Regards,
Chris

[1] 
http://lists.linuxtogo.org/pipermail/openembedded-devel/2008-November/006910.html

--------------040805010603070801030200
Content-Type: text/x-patch;
 name="0001-Add-missing-patch-apply-it-only-when-version-1.5.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0001-Add-missing-patch-apply-it-only-when-version-1.5.patch"

From 1902d8abb10e718db2e79e9902dc800505745715 Mon Sep 17 00:00:00 2001
From: Christian Gagneraud <cgagneraud@techwork.ie>
Date: Sun, 16 Aug 2009 18:23:26 +0100
Subject: [stable][patch] Add missing patch, apply it only when version >= 1.5.3


Signed-off-by: Christian Gagneraud <cgagneraud@techwork.ie>
---
 .../files/git-gui-install-mode-arg-spaces.patch    |   32 ++++++++++++++++++++
 packages/git/git-native_1.5.2.3.bb                 |    2 +
 packages/git/git-native_1.5.3.bb                   |    3 ++
 packages/git/git.inc                               |    1 -
 4 files changed, 37 insertions(+), 1 deletions(-)
 create mode 100644 packages/git/files/git-gui-install-mode-arg-spaces.patch

diff --git a/packages/git/files/git-gui-install-mode-arg-spaces.patch b/packages/git/files/git-gui-install-mode-arg-spaces.patch
new file mode 100644
index 0000000..10e4eb2
--- /dev/null
+++ b/packages/git/files/git-gui-install-mode-arg-spaces.patch
@@ -0,0 +1,32 @@
+--- git/git-gui/Makefile.orig	2007-12-26 17:16:42.000000000 +1030
++++ git/git-gui/Makefile	2007-12-26 17:17:16.000000000 +1030
+@@ -31,11 +31,11 @@
+ 	INSTALL = install
+ endif
+ 
+-INSTALL_D0 = $(INSTALL) -d -m755 # space is required here
++INSTALL_D0 = $(INSTALL) -d -m 755 # space is required here
+ INSTALL_D1 =
+-INSTALL_R0 = $(INSTALL) -m644 # space is required here
++INSTALL_R0 = $(INSTALL) -m 644 # space is required here
+ INSTALL_R1 =
+-INSTALL_X0 = $(INSTALL) -m755 # space is required here
++INSTALL_X0 = $(INSTALL) -m 755 # space is required here
+ INSTALL_X1 =
+ INSTALL_L0 = rm -f # space is required here
+ INSTALL_L1 = && ln # space is required here
+@@ -50,11 +50,11 @@
+ 	QUIET_2DEVNULL = 2>/dev/null
+ 
+ 	INSTALL_D0 = dir=
+-	INSTALL_D1 = && echo ' ' DEST $$dir && $(INSTALL) -d -m755 "$$dir"
++	INSTALL_D1 = && echo ' ' DEST $$dir && $(INSTALL) -d -m 755 "$$dir"
+ 	INSTALL_R0 = src=
+-	INSTALL_R1 = && echo '   ' INSTALL 644 `basename $$src` && $(INSTALL) -m644 $$src
++	INSTALL_R1 = && echo '   ' INSTALL 644 `basename $$src` && $(INSTALL) -m 644 $$src
+ 	INSTALL_X0 = src=
+-	INSTALL_X1 = && echo '   ' INSTALL 755 `basename $$src` && $(INSTALL) -m755 $$src
++	INSTALL_X1 = && echo '   ' INSTALL 755 `basename $$src` && $(INSTALL) -m 755 $$src
+ 
+ 	INSTALL_L0 = dst=
+ 	INSTALL_L1 = && src=
diff --git a/packages/git/git-native_1.5.2.3.bb b/packages/git/git-native_1.5.2.3.bb
index 7ddfee0..e701b29 100644
--- a/packages/git/git-native_1.5.2.3.bb
+++ b/packages/git/git-native_1.5.2.3.bb
@@ -2,5 +2,7 @@
 inherit native
 require git_${PV}.bb
 
+SRC_URI += "file://git-gui-install-mode-arg-spaces.patch;patch=1"
+
 DEPENDS = "openssl-native curl-native zlib-native expat-native"
 RDEPENDS = ""
diff --git a/packages/git/git-native_1.5.3.bb b/packages/git/git-native_1.5.3.bb
index 935c773..ea397be 100644
--- a/packages/git/git-native_1.5.3.bb
+++ b/packages/git/git-native_1.5.3.bb
@@ -1,4 +1,7 @@
 require git.inc
+
+SRC_URI += "file://git-gui-install-mode-arg-spaces.patch;patch=1"
+
 inherit native
 DEPENDS = "openssl-native curl-native zlib-native expat-native"
 PR = "r1"
diff --git a/packages/git/git.inc b/packages/git/git.inc
index 3a80c5d..62f2d0c 100644
--- a/packages/git/git.inc
+++ b/packages/git/git.inc
@@ -4,7 +4,6 @@ LICENSE = "GPL"
 
 SRC_URI = "http://www.kernel.org/pub/software/scm/git/git-${PV}.tar.bz2 \
            file://autotools.patch;patch=1 \
-           file://git-gui-install-mode-arg-spaces.patch;patch=1 \
 	   "
 S = "${WORKDIR}/git-${PV}"
 
-- 
1.6.2


--------------040805010603070801030200--
