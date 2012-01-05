Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RivdA-0004U3-Je
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jan 2012 23:17:56 +0100
Received: by iakh37 with SMTP id h37so1563563iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2012 14:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=UZciwrkcuie3wnrGZB4mM8MJoDwWUt0bU1Gzi0Lq1lM=;
	b=HK/erY5KSap7KahqAGhWTG84rR1J6VjNcUBDYPA2Pn9c9mAfjZiFR5wtj4MFi9+iIg
	INNlljtJdsajIgu+F7v0T10vNSZQM+fKAq5O/f/kxVKsf4nCEDGaYGbfxKsJDxuW6TVS
	4DqRSKBC1914+iah84nHB4MDeQHyFwb6eUcIM=
Received: by 10.42.76.66 with SMTP id d2mr3878694ick.7.1325801424929;
	Thu, 05 Jan 2012 14:10:24 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id f32sm202728478ibf.9.2012.01.05.14.10.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jan 2012 14:10:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jan 2012 14:09:59 -0800
Message-Id: <1325801399-24880-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1325801399-24880-1-git-send-email-raj.khem@gmail.com>
References: <1325801399-24880-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-java][PATCH 2/2] llvm, openjdk: Add mips to known architectures
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
X-List-Received-Date: Thu, 05 Jan 2012 22:17:56 -0000

correct a typo Mips -> mips

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-core/llvm/llvm.inc                |    4 ++--
 recipes-core/openjdk/openjdk-6-common.inc |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-core/llvm/llvm.inc b/recipes-core/llvm/llvm.inc
index 5cc9957..578cd40 100644
--- a/recipes-core/llvm/llvm.inc
+++ b/recipes-core/llvm/llvm.inc
@@ -203,8 +203,8 @@ def get_llvm_arch(d):
     arch = "X86"
   elif arch == "arm":
     arch = "ARM"
-  elif arch == "mipsel":
-    arch = "Mips"
+  elif arch == "mipsel" or arch == "mips":
+    arch = "mips"
   elif arch == "powerpc":
     arch = "PowerPC"
   else:
diff --git a/recipes-core/openjdk/openjdk-6-common.inc b/recipes-core/openjdk/openjdk-6-common.inc
index 461ccd9..bc56105 100644
--- a/recipes-core/openjdk/openjdk-6-common.inc
+++ b/recipes-core/openjdk/openjdk-6-common.inc
@@ -153,7 +153,7 @@ def get_llvm_configure_arch(d):
     arch = "x86"
   elif arch == "arm":
     arch = "arm"
-  elif arch == "mipsel":
+  elif arch == "mipsel" or arch == "mips":
     arch = "mips"
   elif arch == "powerpc":
     arch = "powerpc"
-- 
1.7.5.4



