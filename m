Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1MR4B9-0005zN-G8
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jul 2009 15:05:48 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id 2C50868803;
	Wed, 15 Jul 2009 16:52:11 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jul 2009 16:52:01 +0400
Message-Id: <1247662322-20408-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.3.3
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-Spam-Status: No
Subject: [PATCH 1/2] icecc: remove bb.errors on un-built compilers
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
X-List-Received-Date: Wed, 15 Jul 2009 13:05:51 -0000

Building things with icecc and BB_NUMBER_THREADS more then 1 you could see
a lot of messages:

ERROR: no cross compiler built yet?

before gcc-cross would be properly built. There is technically nothing wrong,
cross compiler is not there yet and it's not needed when bitbake does
fetch-unpack-patch and other things to prepare package build. But it makes
people uncomfortable.

We can safely kill this messages.
---
 classes/icecc.bbclass |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/classes/icecc.bbclass b/classes/icecc.bbclass
index 0eb2d9f..27e0e56 100644
--- a/classes/icecc.bbclass
+++ b/classes/icecc.bbclass
@@ -62,7 +62,6 @@ def create_cross_env(bb,d):
         os.stat(os.path.join(ice_dir, target_sys, 'lib', 'libstdc++.so'))
         os.stat(os.path.join(ice_dir, target_sys, 'bin', 'g++'))
     except: # no cross compiler built yet
-        bb.error('no cross compiler built yet?')
         return ""
 
     VERSION = icc_determine_gcc_version( os.path.join(ice_dir,target_sys,"bin","g++") )
@@ -159,7 +158,6 @@ def create_cross_kernel_env(bb,d):
     try:
         os.stat(os.path.join(ice_dir, 'bin', kernel_cc))
     except: # no cross compiler built yet
-        bb.error('no kernel cross compiler built yet')
         return ""
 
     VERSION = icc_determine_gcc_version( os.path.join(ice_dir,"bin",kernel_cc) )
-- 
1.6.3.3



