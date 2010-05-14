Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OCwSA-000825-DI
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 17:05:31 +0200
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 5C0B94B00BB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 17:01:33 +0200 (CEST)
Received: from localhost.localdomain (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71]) by smtp2-g21.free.fr (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 17:01:32 +0200 (CEST)
From: Eric Benard <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 May 2010 16:59:21 +0200
Message-Id: <1273849161-32171-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] module_strip.bbclass: set KERNEL_MAJOR_VERSION
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
X-List-Received-Date: Fri, 14 May 2010 15:05:31 -0000

KERNEL_MAJOR_VERSION may not be set (for example when building a module)
, this was preventing modules from being stripped.

Signed-off-by: Eric Benard <eric@eukrea.com>
---
v2: moved to module_strip.bbclass following an advice from Tom Rini

 classes/module_strip.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/classes/module_strip.bbclass b/classes/module_strip.bbclass
index 2650f71..998fb86 100644
--- a/classes/module_strip.bbclass
+++ b/classes/module_strip.bbclass
@@ -1,5 +1,8 @@
 PACKAGESTRIPFUNCS += "do_strip_modules"
 
+# may be inherited by kernel.bbclass which sets KERNEL_MAJOR_VERSION
+KERNEL_MAJOR_VERSION ?= "${@get_kernelmajorversion('${KERNEL_VERSION}')}"
+
 do_strip_modules () {
 	if test -e ${PKGD}/lib/modules; then
 		if [ "${KERNEL_MAJOR_VERSION}" == "2.6" ]; then
-- 
1.6.3.3



