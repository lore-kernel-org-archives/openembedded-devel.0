Received: from [150.254.30.30] (helo=libra.cs.put.poznan.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <przemyslaw.wesolek@cs.put.poznan.pl>)
	id 1N63mY-0004Pe-4Y for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 15:57:53 +0100
Received: from kas30pipe.localhost (unknown [127.0.0.1])
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 9F90C88;
	Thu,  5 Nov 2009 14:56:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cs.put.poznan.pl
Received: from libra.cs.put.poznan.pl ([127.0.0.1])
	by localhost (libra.cs.put.poznan.pl [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id cBkbJuuuchLM; Thu,  5 Nov 2009 15:56:36 +0100 (CET)
Received: from localhost.localdomain (idss-pw.cs.put.poznan.pl [150.254.31.31])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 60E4D84;
	Thu,  5 Nov 2009 15:56:36 +0100 (CET)
From: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2009 15:58:22 +0100
Message-Id: <1257433102-1767-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1256849813-10538-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>
References: <1256849813-10538-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>
X-SpamTest-Envelope-From: przemyslaw.wesolek@cs.put.poznan.pl
X-SpamTest-Group-ID: 00000000
X-SpamTest-Info: Profiles 9691 [Sep 17 2009]
X-SpamTest-Info: {received from trusted sender
	<przemyslaw.wesolek@cs.put.poznan.pl>: common white list}
X-SpamTest-Method: white email list
X-SpamTest-Rate: 0
X-SpamTest-Status: Trusted
X-SpamTest-Status-Extended: trusted
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0278], KAS30/Release
X-SA-Exim-Connect-IP: 150.254.30.30
X-SA-Exim-Mail-From: przemyslaw.wesolek@cs.put.poznan.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] boost: more elaborate and correct usage of GCC atomicity.
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
X-List-Received-Date: Thu, 05 Nov 2009 14:57:53 -0000

This patch is based on upstream corrections spotted in 1.40 version.
They allow to properly compile Boost on both <4.2 and >=4.2 GCC, for
ARM machines.

First, correct include is made on ARM machines, atomic_count_gcc.hpp
instead of atomic_count_sync.hpp.

Second, with GCC 4.2 some headers were changed (see [1]). This patch
uses appropriate header based on GCC version, so allows compilation
on both versions of GCC API. This change also affects -- in a good
way -- boost 1.33 recipe. Version 1.34 had hard-coded change to the
new header so this patch don't apply.

Applicable to both devel and stable.

[1] http://gcc.gnu.org/onlinedocs/libstdc++/manual/api.html#api.rel_420

Signed-off-by: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
---
 recipes/boost/boost_1.36.0.bb                      |    4 +++-
 recipes/boost/files/atomic_count_arm.patch         |   11 +++++++++++
 .../boost/files/atomic_count_gcc_atomicity.patch   |    7 +++++--
 3 files changed, 19 insertions(+), 3 deletions(-)
 create mode 100644 recipes/boost/files/atomic_count_arm.patch

diff --git a/recipes/boost/boost_1.36.0.bb b/recipes/boost/boost_1.36.0.bb
index 140ab29..276ca9b 100644
--- a/recipes/boost/boost_1.36.0.bb
+++ b/recipes/boost/boost_1.36.0.bb
@@ -1,9 +1,11 @@
 include boost-36.inc
 
-PR = "r6"
+PR = "r8"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2 \
            file://arm-intrinsics.patch;patch=1 \
+           file://atomic_count_gcc_atomicity.patch;patch=1 \
+           file://atomic_count_arm.patch;patch=1 \
           "
 
 BJAM_OPTS    = '${BJAM_TOOLS} \
diff --git a/recipes/boost/files/atomic_count_arm.patch b/recipes/boost/files/atomic_count_arm.patch
new file mode 100644
index 0000000..1017ebc
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
diff --git a/recipes/boost/files/atomic_count_gcc_atomicity.patch b/recipes/boost/files/atomic_count_gcc_atomicity.patch
index 7d08e73..3b09a8a 100644
--- a/recipes/boost/files/atomic_count_gcc_atomicity.patch
+++ b/recipes/boost/files/atomic_count_gcc_atomicity.patch
@@ -2,12 +2,15 @@ Index: boost_1_33_1/boost/detail/atomic_count_gcc.hpp
 ===================================================================
 --- boost_1_33_1.orig/boost/detail/atomic_count_gcc.hpp	2008-05-01 20:43:45.000000000 +0200
 +++ boost_1_33_1/boost/detail/atomic_count_gcc.hpp	2008-05-01 20:43:55.000000000 +0200
-@@ -17,7 +17,7 @@
+@@ -17,7 +17,11 @@
  //  http://www.boost.org/LICENSE_1_0.txt)
  //
  
--#include <bits/atomicity.h>
++#if __GNUC__ * 100 + __GNUC_MINOR__ >= 402
 +#include <ext/atomicity.h>
++#else
+ #include <bits/atomicity.h>
++#endif
  
  namespace boost
  {
-- 
1.6.3.3



