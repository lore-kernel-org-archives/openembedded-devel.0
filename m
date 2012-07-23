Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1St6He-00063B-5p
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jul 2012 02:13:58 +0200
Received: by pbbrq2 with SMTP id rq2so8723308pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Jul 2012 17:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=aMs+FxrHEwrzbRXmPb5sKB1ns6XJsMIA9cH7mNVNs7c=;
	b=n9IlFI2sb4UMEQSfoSNaQjswtgNukCii7C06qdztTrKL4OIpwozaF5vhzn30GR0BJK
	H1g81zLFpIp3m/d4FONNsZanK6fdqpte4xeKBq3gX9gCTFEKsZWz4FwL6mStjbkJjzT9
	j3n4BYv0hQ6++oYXfcQCsOLae047wYMWJGDTjiIOTLNv2/GRWbRx9x75jK03cBQWrr7U
	Hz+4HIjNXPdEPlaLz7yvPCAh1mQCjo9Hf0NdJlSFNXSiIMivZ2+d0rC6qZcpuiApdlg5
	Mijo1c1nDuUyvtxVvIOYW8EG/4NnFAgzoqZQ3MfGCh9Um+oQVXNEck+6oc5xSgSD7E3V
	Am9Q==
Received: by 10.68.231.39 with SMTP id td7mr30871420pbc.3.1343001751237;
	Sun, 22 Jul 2012 17:02:31 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ot4sm8713462pbb.65.2012.07.22.17.02.29
	(version=SSLv3 cipher=OTHER); Sun, 22 Jul 2012 17:02:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Jul 2012 17:02:31 -0700
Message-Id: <1343001752-19708-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-java][PATCH 1/2] llvm: Accept ppc64
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
X-List-Received-Date: Mon, 23 Jul 2012 00:13:58 -0000

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



