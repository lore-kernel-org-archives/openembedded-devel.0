Received: from [194.100.97.46] (helo=mail.inoi.fi)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <petri.lehtinen+openembedded-devel@inoi.fi>)
	id 1N0rNJ-00060P-BZ for openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2009 08:42:20 +0200
Received: from mail.inoi.fi (localhost.localdomain [127.0.0.1])
	by mail.inoi.fi (Postfix) with ESMTP id 0ABEE20013;
	Thu, 22 Oct 2009 09:37:42 +0300 (EEST)
Received: from localhost.localdomain (petri.int.inoi.fi [10.105.0.205])
	by mail.inoi.fi (Postfix) with ESMTP id DBB5620012;
	Thu, 22 Oct 2009 09:37:41 +0300 (EEST)
From: petri.lehtinen+openembedded-devel@inoi.fi
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Oct 2009 09:41:16 +0300
Message-Id: <1256193676-5082-1-git-send-email-petri.lehtinen+openembedded-devel@inoi.fi>
X-Mailer: git-send-email 1.6.5.1
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 194.100.97.46
X-SA-Exim-Mail-From: petri.lehtinen+openembedded-devel@inoi.fi
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Petri Lehtinen <petri.lehtinen@inoi.fi>
Subject: [PATCH] clish: Bump to 0.7.3
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
X-List-Received-Date: Thu, 22 Oct 2009 06:42:20 -0000

From: Petri Lehtinen <petri.lehtinen@inoi.fi>


Signed-off-by: Petri Lehtinen <petri.lehtinen@inoi.fi>
---
 conf/checksums.ini                               |    4 ++++
 recipes/clish/{clish_0.7.1.bb => clish_0.7.3.bb} |    3 ++-
 recipes/clish/files/configure.patch              |   19 +++++++++++++++++++
 3 files changed, 25 insertions(+), 1 deletions(-)
 rename recipes/clish/{clish_0.7.1.bb => clish_0.7.3.bb} (78%)
 create mode 100644 recipes/clish/files/configure.patch

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 395dcd9..58e3e72 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -3638,6 +3638,10 @@ sha256=5c7f2bf864b34d4bb17d7d046eca4f07f8174ce4ca3a73339b956fedd95c9752
 md5=27d9b5c12f7d3a1877aeb34f2048e7fa
 sha256=5c7f2bf864b34d4bb17d7d046eca4f07f8174ce4ca3a73339b956fedd95c9752
 
+[http://downloads.sourceforge.net/clish/clish-0.7.3.tar.gz]
+md5=81e20f7a888bcd8e2280e37804d342e4
+sha256=c8c2416848950ac452cd4010311554d7f232f81abd543fe9ba2d7146dbb6c96f
+
 [http://my-zaurus.narod.ru/downloads/clockapplet.tar.gz]
 md5=7265673901eacb0b72a11cd6732cc698
 sha256=80fd209d065887729fdeb81f5a91638626e7ed31dabab40c446bd12042df9057
diff --git a/recipes/clish/clish_0.7.1.bb b/recipes/clish/clish_0.7.3.bb
similarity index 78%
rename from recipes/clish/clish_0.7.1.bb
rename to recipes/clish/clish_0.7.3.bb
index 8b7a797..97f6c53 100644
--- a/recipes/clish/clish_0.7.1.bb
+++ b/recipes/clish/clish_0.7.3.bb
@@ -5,7 +5,8 @@ LICENSE = "GPL"
 SECTION = "console/utils"
 PR ="r1"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/clish/clish-0.7.1.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/clish/clish-${PV}.tar.gz \
+           file://configure.patch;patch=1"
 
 PARALLEL_MAKE=""
 
diff --git a/recipes/clish/files/configure.patch b/recipes/clish/files/configure.patch
new file mode 100644
index 0000000..2b1c462
--- /dev/null
+++ b/recipes/clish/files/configure.patch
@@ -0,0 +1,19 @@
+--- a/configure.ac   2009-10-22 08:41:30.000000000 +0300
++++ b/configure.ac        2009-10-22 08:40:26.000000000 +0300
+@@ -13,7 +13,6 @@
+ 
+ AC_CONFIG_HEADERS([config.h])
+ AM_INIT_AUTOMAKE(subdir-objects)
+-AM_PROG_CC_C_O
+ 
+ # Checks for programs.
+ AC_PROG_CC
+@@ -20,6 +21,8 @@
+ AC_LIBTOOL_WIN32_DLL
+ AC_PROG_LIBTOOL
+ 
++AM_PROG_CC_C_O
++
+ # needed to handle 64-bit architecture
+ AC_CHECK_SIZEOF(int)
+ AC_CHECK_SIZEOF(long)
-- 
1.6.5.1



