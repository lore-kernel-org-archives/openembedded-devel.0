Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id C410565DE0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 16:15:54 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Apr 2014 17:15:52 +0100
Message-Id: <1398442553-18995-3-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1398442553-18995-1-git-send-email-ml@communistcode.co.uk>
References: <1398442553-18995-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: [meta-oe][PATCH 3/4] tcpdump: inherit brokensep
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
 meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb
index fcb2964..0d88990 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
 SRC_URI[md5sum] = "a3fe4d30ac85ff5467c889ff46b7e1e8"
 SRC_URI[sha256sum] = "efd08b610210d39977ec3175fa82dad9fbd33587930081be2a905a712dba4286"
 
-inherit autotools
+inherit autotools-brokensep
 CACHED_CONFIGUREVARS = "ac_cv_linux_vers=${ac_cv_linux_vers=2}"
 
 EXTRA_OECONF = "--without-crypto \
-- 
1.9.2


