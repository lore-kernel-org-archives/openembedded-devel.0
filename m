Received: from [150.254.31.31] (helo=idss-pw)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jest@idss-pw.cs.put.poznan.pl>) id 1N3tL5-0002mU-Du
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Oct 2009 16:24:34 +0100
Received: from jest by idss-pw with local (Exim 4.69)
	(envelope-from <jest@idss-pw.cs.put.poznan.pl>)
	id 1N3tKf-0003ez-0p; Fri, 30 Oct 2009 16:24:05 +0100
From: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Oct 2009 16:23:36 +0100
Message-Id: <1256916216-14027-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 150.254.31.31
X-SA-Exim-Mail-From: jest@idss-pw.cs.put.poznan.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Correct ARM detection in Boost 1.36 atomic count.
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
X-List-Received-Date: Fri, 30 Oct 2009 15:24:34 -0000

Signed-off-by: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
---
 recipes/boost/boost_1.36.0.bb              |    4 +++-
 recipes/boost/files/atomic_count_arm.patch |   11 +++++++++++
 2 files changed, 14 insertions(+), 1 deletions(-)
 create mode 100644 recipes/boost/files/atomic_count_arm.patch

diff --git a/recipes/boost/boost_1.36.0.bb b/recipes/boost/boost_1.36.0.bb
index 140ab29..550405f 100644
--- a/recipes/boost/boost_1.36.0.bb
+++ b/recipes/boost/boost_1.36.0.bb
@@ -1,9 +1,11 @@
 include boost-36.inc
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2 \
            file://arm-intrinsics.patch;patch=1 \
+           file://atomic_count_gcc_atomicity.patch;patch=1 \
+           file://atomic_count_arm.patch;patch=1 \
           "
 
 BJAM_OPTS    = '${BJAM_TOOLS} \
diff --git a/recipes/boost/files/atomic_count_arm.patch b/recipes/boost/files/atomic_count_arm.patch
new file mode 100644
index 0000000..2c4c682
--- /dev/null
+++ b/recipes/boost/files/atomic_count_arm.patch
@@ -0,0 +1,11 @@
+--- boost_1_36_0/boost/detail/atomic_count.hpp.orig	2007-11-23 18:03:14.000000000 +0100
++++ boost_1_36_0/boost/detail/atomic_count.hpp	2009-09-25 18:17:12.602907541 +0200
+@@ -101,7 +101,7 @@
+ 
+ #  include <boost/detail/atomic_count_win32.hpp>
+ 
+-#elif defined( __GNUC__ ) && ( __GNUC__ * 100 + __GNUC_MINOR__ >= 401 )
++#elif defined( __GNUC__ ) && ( __GNUC__ * 100 + __GNUC_MINOR__ >= 401 ) && !defined( __arm__ ) && !defined( __armel__ )
+ 
+ #  include <boost/detail/atomic_count_sync.hpp>
+ 
-- 
1.6.3.3



