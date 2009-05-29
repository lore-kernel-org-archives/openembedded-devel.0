Received: from [195.135.220.15] (helo=mx2.suse.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mhrusecky@suse.cz>) id 1MABrQ-0007zH-4Y
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 May 2009 01:51:40 +0200
Received: from relay1.suse.de (relay-ext.suse.de [195.135.221.8])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id AF0E65FC9F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2009 01:43:12 +0200 (CEST)
Date: Sat, 30 May 2009 01:43:10 +0200
From: Michal Hrusecky <mhrusecky@suse.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090529234310.GA19576@misibook.miska.isageek.net>
MIME-Version: 1.0
X-Operating-System: WindowsKiller Linux
User-Agent: Mutt - the best e-mail client in the world
Subject: [PATCH] justreader: fixed build
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
X-List-Received-Date: Fri, 29 May 2009 23:51:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adding missing include file so package can be built again.

Signed-off-by: Michal Hrusecky <Michal@Hrusecky.net>
---
 recipes/justreader/files/missing-include.patch |   10 ++++++++++
 recipes/justreader/justreader_2.0k.bb          |    3 ++-
 2 files changed, 12 insertions(+), 1 deletions(-)
 create mode 100644 recipes/justreader/files/missing-include.patch

diff --git a/recipes/justreader/files/missing-include.patch b/recipes/justreader/files/missing-include.patch
new file mode 100644
index 0000000..4831f38
--- /dev/null
+++ b/recipes/justreader/files/missing-include.patch
@@ -0,0 +1,10 @@
+--- a/shcm.cpp	2009-05-25 09:07:19.928704817 +0200
++++ b/shcm.cpp	2009-05-25 09:07:38.225747505 +0200
+@@ -19,6 +19,7 @@
+ ****************************************************************************/
+ 
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <vector>
+ 
+ #include "shcm.h"
diff --git a/recipes/justreader/justreader_2.0k.bb b/recipes/justreader/justreader_2.0k.bb
index f3f7149..e05baf7 100644
--- a/recipes/justreader/justreader_2.0k.bb
+++ b/recipes/justreader/justreader_2.0k.bb
@@ -6,7 +6,8 @@ HOMEPAGE = "http://justreader.sourceforge.net/"
 PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/justreader/justreader_${PV}.tgz \
-file://correct-settings-path.patch;patch=1"
+file://correct-settings-path.patch;patch=1 \
+file://missing-include.patch;patch=1"
 
 S = "${WORKDIR}/TextReader2"
 
-- 
1.6.3.1


