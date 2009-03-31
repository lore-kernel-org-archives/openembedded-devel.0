Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1Lokkd-0001Gi-7k
	for openembedded-devel@lists.linuxtogo.org;
	Tue, 31 Mar 2009 22:40:03 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id E3C0E189476; Tue, 31 Mar 2009 22:40:11 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.linuxtogo.org
Date: Tue, 31 Mar 2009 22:40:11 +0200
Message-Id: <1238532011-2963-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] gcc 4.3.x: disable thumb mode for now, glibc builds don't like it
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
X-List-Received-Date: Tue, 31 Mar 2009 20:40:03 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gcc/gcc-4.3.1.inc |    1 +
 recipes/gcc/gcc-4.3.2.inc |    1 +
 recipes/gcc/gcc-4.3.3.inc |    1 +
 3 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes/gcc/gcc-4.3.1.inc b/recipes/gcc/gcc-4.3.1.inc
index 7f7f15e..cdab6dc 100644
--- a/recipes/gcc/gcc-4.3.1.inc
+++ b/recipes/gcc/gcc-4.3.1.inc
@@ -1,5 +1,6 @@
 # No armeb and thumb patches - really needs checking 
 DEFAULT_PREFERENCE = "-99"
+ARM_INSTRUCTION_SET = "arm"
 
 require gcc-common.inc
 
diff --git a/recipes/gcc/gcc-4.3.2.inc b/recipes/gcc/gcc-4.3.2.inc
index 1fc05af..aeb3477 100644
--- a/recipes/gcc/gcc-4.3.2.inc
+++ b/recipes/gcc/gcc-4.3.2.inc
@@ -1,5 +1,6 @@
 # No armeb and thumb patches - really needs checking 
 DEFAULT_PREFERENCE = "-999"
+ARM_INSTRUCTION_SET = "arm"
 
 require gcc-common.inc
 
diff --git a/recipes/gcc/gcc-4.3.3.inc b/recipes/gcc/gcc-4.3.3.inc
index d5d5db0..4bed0e4 100644
--- a/recipes/gcc/gcc-4.3.3.inc
+++ b/recipes/gcc/gcc-4.3.3.inc
@@ -1,5 +1,6 @@
 # No armeb and thumb patches - really needs checking 
 DEFAULT_PREFERENCE = "-999"
+ARM_INSTRUCTION_SET = "arm"
 
 require gcc-common.inc
 
-- 
1.5.6.5



