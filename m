Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SwHuB-0004FY-IO
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 21:14:56 +0200
Received: by yenl13 with SMTP id l13so5803424yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2012 12:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=aMs+FxrHEwrzbRXmPb5sKB1ns6XJsMIA9cH7mNVNs7c=;
	b=CG2T3F/SaThLxm5n8ZW3L/fM5IvTzfRzFy7ZgSCzlfty1EDaAhAf2CAHnzZOxLx3bJ
	VaqKjyaX3Pfgr+Ljc+VUrpNTQii9Eg4c7HGCNcz30bqpMlooDQ2+80kTBwujl+w8Rr5K
	xSNN9UFeOyB+TISVWRy/M+1QLONlRLULXFEUYflF/+qKfXkvMzPwX6lwdmmlskV0mFGL
	62BBLq9lMcBB1HCqo1C+rDhEvf8kG2MBRzVH0SHbw10OzddWlZHsIiGAFGXZmcHMwmrO
	ESRB68sfRshGvv1Ji6bsXU7TbBxIaRucnVT991a3543LtUUQ51t8FyQEdeVkXiyiQHo7
	CBIA==
Received: by 10.66.75.104 with SMTP id b8mr34438053paw.21.1343761397633;
	Tue, 31 Jul 2012 12:03:17 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ka5sm819850pbb.37.2012.07.31.12.03.15
	(version=SSLv3 cipher=OTHER); Tue, 31 Jul 2012 12:03:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 12:03:09 -0700
Message-Id: <1343761391-3440-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-java][PATCH V2 1/3] llvm: Accept ppc64
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
X-List-Received-Date: Tue, 31 Jul 2012 19:14:56 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-core/llvm/llvm.inc                |    2 +-
 recipes-core/openjdk/openjdk-6-common.inc |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/llvm/llvm.inc b/recipes-core/llvm/llvm.inc
index c1f7f45..0718a12 100644
--- a/recipes-core/llvm/llvm.inc
+++ b/recipes-core/llvm/llvm.inc
@@ -203,7 +203,7 @@ def get_llvm_arch(d):
         arch = "ARM"
     elif arch == "mipsel" or arch == "mips":
         arch = "mips"
-    elif arch == "powerpc":
+    elif arch == "powerpc" or arch == "powerpc64":
         arch = "PowerPC"
     else:
         bb.error("%s does not support %s yet" % (bb.data.getVar('PN', d, 1), arch) );
diff --git a/recipes-core/openjdk/openjdk-6-common.inc b/recipes-core/openjdk/openjdk-6-common.inc
index 02a4cb7..c7693fe 100644
--- a/recipes-core/openjdk/openjdk-6-common.inc
+++ b/recipes-core/openjdk/openjdk-6-common.inc
@@ -151,7 +151,7 @@ def get_llvm_configure_arch(d):
         arch = "arm"
     elif arch == "mipsel" or arch == "mips":
         arch = "mips"
-    elif arch == "powerpc":
+    elif arch == "powerpc" or arch == "powerpc64":
         arch = "powerpc"
     else:
         bb.error("%s does not support %s yet" % (bb.data.getVar('PN', d, 1), arch) );
-- 
1.7.5.4



