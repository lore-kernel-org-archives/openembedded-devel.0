Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LxOWR-0006eH-GG
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 18:45:11 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090424164020.TKNY6112.fed1rmmtao102.cox.net@fed1rmimpo03.cox.net>;
	Fri, 24 Apr 2009 12:40:20 -0400
Received: from localhost.localdomain ([68.230.63.214])
	by fed1rmimpo03.cox.net with bizsmtp
	id jUgH1b00L4dMFYL04UgLuW; Fri, 24 Apr 2009 12:40:20 -0400
X-Authority-Analysis: v=1.0 c=1 a=cBVyaRLOgw8A:10 a=I4P42HDpJKoA:10
	a=4HVRqb_MAAAA:8 a=LF2dOfbMAAAA:8 a=KmMC4n6P3U4tEHUnvVMA:9
	a=O09Y94yzg0OqX6kxyj0RY8T9KmoA:4 a=k-kO48AawpMA:10
X-CM-Score: 0.00
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Date: Fri, 24 Apr 2009 09:11:59 -0700
Message-Id: <1240589520-1104-12-git-send-email-trini@kernel.crashing.org>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1240589520-1104-11-git-send-email-trini@kernel.crashing.org>
References: <1240589520-1104-1-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-2-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-3-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-4-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-5-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-6-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-7-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-8-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-9-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-10-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-11-git-send-email-trini@kernel.crashing.org>
Subject: [PATCH][STABLE] mingw-gcc, mingw-runtime, mingw-w32api: Fix DEFAULT_PREFERENCES to be correct
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


Signed-off-by: Tom Rini <trini@embeddedalley.com>
---
 recipes/gcc/mingw-gcc_3.4.5-20060117-2.bb |    4 ++--
 recipes/mingw/mingw-runtime.inc           |    4 ++--
 recipes/mingw/mingw-w32api.inc            |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes/gcc/mingw-gcc_3.4.5-20060117-2.bb b/recipes/gcc/mingw-gcc_3.4.5-20060117-2.bb
index 22f9170..fd45e9f 100644
--- a/recipes/gcc/mingw-gcc_3.4.5-20060117-2.bb
+++ b/recipes/gcc/mingw-gcc_3.4.5-20060117-2.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://www.mingw.org/"
 SECTION = "devel"
 LICENSE = "GPL"
 
-DEFAULT_PREFERENCE = "0"
-DEFAULT_PREFERENCE_sdk-mingw32 = "1"
+DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_mingw32 = "1"
 
 inherit autotools gettext
 
diff --git a/recipes/mingw/mingw-runtime.inc b/recipes/mingw/mingw-runtime.inc
index d984911..5820e99 100644
--- a/recipes/mingw/mingw-runtime.inc
+++ b/recipes/mingw/mingw-runtime.inc
@@ -5,8 +5,8 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial mingw-w32api"
 
 PROVIDES = "virtual/${TARGET_PREFIX}libc virtual/${TARGET_PREFIX}libc-for-gcc"
 
-DEFAULT_PREFERENCE = "0"
-DEFAULT_PREFERENCE_sdk-mingw32 = "1"
+DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_mingw32 = "1"
 
 PACKAGES = ""
 
diff --git a/recipes/mingw/mingw-w32api.inc b/recipes/mingw/mingw-w32api.inc
index ecb1cd2..ac2ede9 100644
--- a/recipes/mingw/mingw-w32api.inc
+++ b/recipes/mingw/mingw-w32api.inc
@@ -5,8 +5,8 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial"
 
 PROVIDES = "mingw-w32api"
 
-DEFAULT_PREFERENCE = "0"
-DEFAULT_PREFERENCE_sdk-mingw32 = "1"
+DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_mingw32 = "1"
 
 PACKAGES = ""
 
-- 
1.5.6.3



