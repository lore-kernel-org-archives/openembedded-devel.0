Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LxOWR-0006eJ-Lq
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 18:45:11 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090424164021.HRXL15318.fed1rmmtao105.cox.net@fed1rmimpo03.cox.net>;
	Fri, 24 Apr 2009 12:40:21 -0400
Received: from localhost.localdomain ([68.230.63.214])
	by fed1rmimpo03.cox.net with bizsmtp
	id jUgH1b00L4dMFYL04UgLuZ; Fri, 24 Apr 2009 12:40:20 -0400
X-Authority-Analysis: v=1.0 c=1 a=tI54MbwbmjEA:10 a=WLlRkF-OUZYA:10
	a=pFzjghP5AAAA:8 a=4HVRqb_MAAAA:8 a=QizmSyIbjff1UW5d2FgA:9
	a=by_69zT8_J1yJkAKxIAA:7 a=MEAR9TtSgERwk8nfMsxQ0VwH1qsA:4
	a=FHE9wvvwwxcA:10 a=k-kO48AawpMA:10
X-CM-Score: 0.00
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Date: Fri, 24 Apr 2009 09:12:00 -0700
Message-Id: <1240589520-1104-13-git-send-email-trini@kernel.crashing.org>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1240589520-1104-12-git-send-email-trini@kernel.crashing.org>
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
	<1240589520-1104-12-git-send-email-trini@kernel.crashing.org>
Subject: [PATCH][STABLE] SlugOS: toolchain/sdk - add a number of missing components
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

From: Mike Westerhof <mwester@dls.net>


Signed-off-by: Tom Rini <trini@embeddedalley.com>
---
 recipes/tasks/task-slugos-toolchain-target.bb |   20 +++++---------------
 1 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/recipes/tasks/task-slugos-toolchain-target.bb b/recipes/tasks/task-slugos-toolchain-target.bb
index 489a412..fb0418f 100644
--- a/recipes/tasks/task-slugos-toolchain-target.bb
+++ b/recipes/tasks/task-slugos-toolchain-target.bb
@@ -2,31 +2,21 @@ DESCRIPTION = "Packages for a standalone SDK or external toolchain"
 LICENSE = "MIT"
 ALLOW_EMPTY = "1"
 
-PR = "r1"
+PR = "r3"
 
 PACKAGES = "${PN}"
 
-# Stuff contained in this SDK is largely taken from task-sdk-base.bb.
+DEPENDS = "task-sdk-bare"
+
 # This is a starting point, and nothing more at present -- please fill
 # this out with a reasonable set of development tools for a SlugOS image.
 # Also feel free to remove stuff that's silly.
 
 RDEPENDS_${PN} = "\
-    libgcc \
+    task-sdk-bare \
     linux-libc-headers-dev \
     libssl \
     libcrypto \
     openssl-dev \
-    libstdc++ \
-    "
-
-# Not sure if we need these or not...
-NOT_SURE_ABOUT = "\
-    libsegfault \
-    "
-
-# This one needs further investigation; seems to be some sort
-# of naming problem that breaks the SDK when it is added directly.
-ODDLY_BROKEN_PACKAGES ="\
-    libz-dev \
+    zlib-dev \
     "
-- 
1.5.6.3



