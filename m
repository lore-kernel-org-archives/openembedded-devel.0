Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LxOWQ-0006e5-Bz
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 18:45:11 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090424164019.INOV16134.fed1rmmtao104.cox.net@fed1rmimpo03.cox.net>;
	Fri, 24 Apr 2009 12:40:19 -0400
Received: from localhost.localdomain ([68.230.63.214])
	by fed1rmimpo03.cox.net with bizsmtp
	id jUgH1b00L4dMFYL04UgJu1; Fri, 24 Apr 2009 12:40:19 -0400
X-Authority-Analysis: v=1.0 c=1 a=DZF4x75qkasA:10 a=6cf3OQR3334A:10
	a=4HVRqb_MAAAA:8 a=pGLkceISAAAA:8 a=9qJxKk-okkm3dTASPu0A:9
	a=tC9ajFiuEYMy54PO8Dd-Ivflza0A:4 a=k-kO48AawpMA:10 a=0pA2U7TmfLoA:10
	a=MSl-tDqOz04A:10
X-CM-Score: 0.00
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Date: Fri, 24 Apr 2009 09:11:52 -0700
Message-Id: <1240589520-1104-5-git-send-email-trini@kernel.crashing.org>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1240589520-1104-4-git-send-email-trini@kernel.crashing.org>
References: <1240589520-1104-1-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-2-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-3-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-4-git-send-email-trini@kernel.crashing.org>
Subject: [PATCH][STABLE] meta-toolchain-gpe-sbox: Drop task-sdk-gpephone (to match m-t-gpe), bump PR
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
X-List-Received-Date: Fri, 24 Apr 2009 16:46:06 -0000

From: Tom Rini <trini@embeddedalley.com>

Acked-by: Florian Boor <florian.boor@kernelconcepts.de>
Acked-by: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Tom Rini <trini@embeddedalley.com>
---
 recipes/meta/meta-toolchain-gpe-sbox.bb |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes/meta/meta-toolchain-gpe-sbox.bb b/recipes/meta/meta-toolchain-gpe-sbox.bb
index 29e39c5..679e50c 100644
--- a/recipes/meta/meta-toolchain-gpe-sbox.bb
+++ b/recipes/meta/meta-toolchain-gpe-sbox.bb
@@ -1,12 +1,11 @@
-PR = "r1"
+PR = "r2"
 TOOLCHAIN_TARGET_TASK = "\
     task-sdk-base \
     task-sdk-sbox \
     task-sdk-sbox-gpe \
     task-sdk-x11 \
     task-sdk-x11-ext \
-    task-sdk-gpe \
-    task-sdk-gpephone"
+    task-sdk-gpe"
 
 require meta-toolchain.bb
 
-- 
1.5.6.3



