Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3ft2-0007BZ-R3
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Aug 2012 06:16:17 +0200
Received: by mail-pz0-f51.google.com with SMTP id t11so2243543daj.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 21:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=gCkHcfmrNYQ19USoeAcoLQo+Syz8JsvmZxGwM+uN3R4=;
	b=jx3h/x53h3qtQVBNY0wqkyBmi4UIdZzjGgretWIONiU22TjD05jlfxgghqsBvewjIA
	MvCCIdaxY4LHY3znKcMIovA+Sq7M0JYnnCRMf0DlnV8ABe0IyDLi9F6qwYlNHVKbFJto
	U4zW7u/OoymRaQkz50TyL567C9ZD8IE9OLJvSQ5iuBp0mwKBSD4dcOzUA9WFx2wIq6Jg
	0oGmEeB4NkOTJ5tt9u+9ckxPTjrNt+18ipVhLnS03jnAOk+rmJw7d0BndwswuAxtbxyA
	/qog5Chu6bzqsqOfgKg2MWdPsX8rZK18J8dE94/x3/q2eGsKrPtUkOjsTwyXfijCrXvh
	FCpw==
Received: by 10.66.72.197 with SMTP id f5mr34858107pav.20.1345521855482;
	Mon, 20 Aug 2012 21:04:15 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id uj3sm526674pbc.39.2012.08.20.21.04.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 21:04:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 21:03:34 -0700
Message-Id: <1345521816-2364-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345521816-2364-1-git-send-email-raj.khem@gmail.com>
References: <1345521816-2364-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-java/openjdk-7.0][PATCH 5/7] llvm: Enable ppc64
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
X-List-Received-Date: Tue, 21 Aug 2012 04:16:17 -0000

This is needed for building for ppc64 jre

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-core/llvm/llvm.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/llvm/llvm.inc b/recipes-core/llvm/llvm.inc
index 185b894..622593d 100644
--- a/recipes-core/llvm/llvm.inc
+++ b/recipes-core/llvm/llvm.inc
@@ -202,7 +202,7 @@ def get_llvm_arch(d):
         arch = "ARM"
     elif arch == "mipsel" or arch == "mips":
         arch = "mips"
-    elif arch == "powerpc":
+    elif arch == "powerpc" or arch == "powerpc64":
         arch = "PowerPC"
     else:
         bb.error("%s does not support %s yet" % (bb.data.getVar('PN', d, 1), arch) );
-- 
1.7.9.5



