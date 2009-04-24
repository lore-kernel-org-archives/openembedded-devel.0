Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LxOWQ-0006e9-K5
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 18:45:11 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090424164019.ZFXZ27308.fed1rmmtao101.cox.net@fed1rmimpo03.cox.net>;
	Fri, 24 Apr 2009 12:40:19 -0400
Received: from localhost.localdomain ([68.230.63.214])
	by fed1rmimpo03.cox.net with bizsmtp
	id jUgH1b00L4dMFYL04UgKu6; Fri, 24 Apr 2009 12:40:19 -0400
X-Authority-Analysis: v=1.0 c=1 a=LjpFH7613IIA:10 a=mK-FWCaCVDUA:10
	a=4HVRqb_MAAAA:8 a=AXGi9Kt-gAR-AjXNOxoA:9
	a=DUhyUngBQ8ZKiXDMzMhsTdnQ43kA:4 a=k-kO48AawpMA:10
X-CM-Score: 0.00
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Date: Fri, 24 Apr 2009 09:11:54 -0700
Message-Id: <1240589520-1104-7-git-send-email-trini@kernel.crashing.org>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1240589520-1104-6-git-send-email-trini@kernel.crashing.org>
References: <1240589520-1104-1-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-2-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-3-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-4-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-5-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-6-git-send-email-trini@kernel.crashing.org>
Subject: [PATCH][STABLE] canadian-sdk: Add SDK_REALPATH_MINGW variable, so that we can prepend a drive letter for sysroot.
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
 classes/canadian-sdk.bbclass |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/classes/canadian-sdk.bbclass b/classes/canadian-sdk.bbclass
index d73b62f..6b4fdf8 100644
--- a/classes/canadian-sdk.bbclass
+++ b/classes/canadian-sdk.bbclass
@@ -24,9 +24,12 @@ LDFLAGS = "${SDK_LDFLAGS}"
 # and otherwise just
 DEPENDS_prepend = "virtual/${HOST_PREFIX}binutils "
 
-SDK_PATH_sdk-mingw32 = "/OpenEmbedded/${SDK_NAME}"
+
+# On mingw systems we want to have the real sysroot default to c:/... and
+# assume that the default install will be on the C drive.  This can be changed
+# by setting SDK_REALPATH_MINGW.
 SDK_REALPATH = "${SDK_PATH}"
-SDK_REALPATH_sdk-mingw32 = "C:/OpenEmbedded/${SDK_NAME}"
+SDK_REALPATH_MINGW ?= "C:"
 
 # Path prefixes
 prefix = "${SDK_PATH}"
-- 
1.5.6.3



