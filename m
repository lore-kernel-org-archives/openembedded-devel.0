Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id C250C65DD8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 16:15:54 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Apr 2014 17:15:53 +0100
Message-Id: <1398442553-18995-4-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1398442553-18995-1-git-send-email-ml@communistcode.co.uk>
References: <1398442553-18995-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: [meta-oe][PATCH 4/4] bridge-utils: apply brokensep
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Apr 2014 16:15:57 -0000

From: Jack Mitchell <jmitchell@cbnl.com>

Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
---
 meta-networking/recipes-support/bridge-utils/bridge-utils.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils.inc b/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
index e06c32e..feeba74 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
@@ -11,7 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/bridge/bridge-utils-${PV}.tar.gz \
           file://bridge-utils-1.5-fix-incorrect-command-in-manual.patch \
 "
 
-inherit autotools update-alternatives
+inherit autotools-brokensep update-alternatives
 
 ALTERNATIVE_${PN} = "brctl"
 ALTERNATIVE_PRIORITY[brctl] = "100"
-- 
1.9.2


