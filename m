Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1PtxQa-0003Lx-PS
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 08:21:56 +0100
Received: from p5b033721.dip.t-dialin.net ([91.3.55.33] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1PtxLN-000077-FA by authid <stefan@sostec.de> with cram_md5;
	Mon, 28 Feb 2011 08:20:33 +0100
Received: from stefan by excalibur.local with local (Exim 4.74)
	(envelope-from <stefan@excalibur.local>)
	id 1PtxLK-0004rT-QN; Mon, 28 Feb 2011 08:16:30 +0100
From: Stefan Schmidt <stefan@buglabs.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Feb 2011 08:16:30 +0100
Message-Id: <1298877390-18656-1-git-send-email-stefan@buglabs.net>
X-Mailer: git-send-email 1.7.4.1
Cc: Stefan Schmidt <stefan@buglabs.net>
Subject: [PATCH] llvm.inc: Empty TOOLCHAIN_OPTIONS to fix the build.
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
X-List-Received-Date: Mon, 28 Feb 2011 07:21:56 -0000

This fixes a problem introduced by ebd905685a339814c36bf658a8e58bf8f457f14e

Signed-off-by: Stefan Schmidt <stefan@buglabs.net>

---
 recipes/llvm/llvm.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/llvm/llvm.inc b/recipes/llvm/llvm.inc
index 03ff61d..b53af6e 100644
--- a/recipes/llvm/llvm.inc
+++ b/recipes/llvm/llvm.inc
@@ -60,6 +60,8 @@ EXTRA_OECMAKE = "\
   -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo \
   -DBUILD_SHARED_LIBS:BOOL=ON \
 "
+# We need to reset this to avoid breakage as we build out of tree
+TOOLCHAIN_OPTIONS = ""
 
 PACKAGES = "${PN} ${PN}-dev ${PN}-dbg ${PN}-doc"
 
-- 
1.7.4.1



