Return-Path: <prvs=756920f33=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 668F178FA5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 15:19:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.53,233,1531778400"; d="scan'208";a="11811442"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Aug 2018 17:20:21 +0200
Message-ID: <20180813152021.29931-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH] openjdk-7: clarify a bitbake warning
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Aug 2018 15:19:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We get a bitbake warning during recipe building complaining about
unsupported architectures unconditionally. That check is relevant
only for shark builds, so it is quite confusing for non-shark
builds.

Make the warning conditional on whether shark builds are enabled
or not.

This is the same patch as the one for openjdk-8 by André Draszik
(commit 86c729cb51f880fd5a1ec6485baddfa2bedaa998)

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/openjdk/openjdk-common.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-common.inc b/recipes-core/openjdk/openjdk-common.inc
index 816b463..c92af40 100644
--- a/recipes-core/openjdk/openjdk-common.inc
+++ b/recipes-core/openjdk/openjdk-common.inc
@@ -55,7 +55,8 @@ def get_llvm_configure_arch(d):
     elif arch == "powerpc" or arch == "powerpc64":
         arch = "powerpc"
     else:
-        bb.warn("%s does not support %s yet" % (d.getVar('PN', True), arch) );
+        if 'shark' in d.getVar('PACKAGECONFIG').split():
+            bb.warn("%s does not support %s in Shark builds yet" % (d.getVar('PN', True), arch) );
 
     return arch
 
-- 
2.11.0


