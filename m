Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1MR4Ba-0005zv-50
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jul 2009 15:06:16 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id A96EC68804;
	Wed, 15 Jul 2009 16:52:44 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jul 2009 16:52:41 +0400
Message-Id: <1247662361-20485-2-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1247662361-20485-1-git-send-email-khimov@altell.ru>
References: <1247662361-20485-1-git-send-email-khimov@altell.ru>
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-Spam-Status: No
Subject: [PATCH 2/2] icecc: introduce ICECC_FALLBACK_PARALLEL
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
X-List-Received-Date: Wed, 15 Jul 2009 13:06:19 -0000

icecc-blacklisted packages currently built not only without icecc environment
set but also without any parallel options enabled. The original intention was
not to kill the build machine, I guess, since having a good icecc cluster it's
easy to set '-j16' or '-j32' or whatever else which could do so. However as
the toolchain packages are blacklisted for icecc they're becoming a
bottleneck in the build process, while they can be built with local-machine
parallelism.

So, in order to solve it, introducing ICECC_FALLBACK_PARALLEL option. It's
simply used as PARALLEL_MAKE for icecc-blacklisted packages.
---
 classes/icecc.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/classes/icecc.bbclass b/classes/icecc.bbclass
index 27e0e56..f8855b6 100644
--- a/classes/icecc.bbclass
+++ b/classes/icecc.bbclass
@@ -261,7 +261,8 @@ def icc_path(bb,d):
     for black in package_blacklist:
         if black in package_tmp:
             bb.note(package_tmp, ' found in blacklist, disable icecc')
-            bb.data.setVar("PARALLEL_MAKE" , "", d) 
+            fallback_parallel = bb.data.getVar('ICECC_FALLBACK_PARALLEL', d) or ""
+            bb.data.setVar("PARALLEL_MAKE", fallback_parallel, d)
             return ""
 
     prefix = bb.data.expand('${HOST_PREFIX}', d)
-- 
1.6.3.3



