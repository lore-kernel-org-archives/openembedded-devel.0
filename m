Received: from [150.254.30.30] (helo=libra.cs.put.poznan.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <przemyslaw.wesolek@cs.put.poznan.pl>)
	id 1N67k7-0005Xr-Vy for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 20:11:39 +0100
Received: from kas30pipe.localhost (unknown [127.0.0.1])
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 572AF85;
	Thu,  5 Nov 2009 19:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cs.put.poznan.pl
Received: from libra.cs.put.poznan.pl ([127.0.0.1])
	by localhost (libra.cs.put.poznan.pl [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 41ErlAIrsHIX; Thu,  5 Nov 2009 20:10:22 +0100 (CET)
Received: from localhost.localdomain (idss-pw.cs.put.poznan.pl [150.254.31.31])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 236F882;
	Thu,  5 Nov 2009 20:10:21 +0100 (CET)
From: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2009 20:12:15 +0100
Message-Id: <1257448335-22623-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <hcuv77$uhe$1@ger.gmane.org>
References: <hcuv77$uhe$1@ger.gmane.org>
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
Subject: [PATCH] boost: corrected atomicity.h include for GCC<4.2
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
X-List-Received-Date: Thu, 05 Nov 2009 19:11:39 -0000

This patch is based on upstream correction spotted in 1.40 version.
They allow to properly compile Boost on both <4.2 and >=4.2 GCC.

With GCC 4.2 some headers were changed (see [1]). This patch uses
appropriate header based on GCC version, so allows compilation on
both versions of GCC API. This change affects boost 1.33 and 1.36.
Upstream version 1.34 has hard-coded change to the new header,
so this patch don't apply.

Applicable to both devel and stable.

[1] http://gcc.gnu.org/onlinedocs/libstdc++/manual/api.html#api.rel_420

Signed-off-by: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
---
 .../boost/files/atomic_count_gcc_atomicity.patch   |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

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



