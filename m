Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UKSds-0005AT-Ef
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Mar 2013 13:06:21 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id C4984D22B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Mar 2013 12:49:22 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Mar 2013 12:49:15 +0100
Message-Id: <1364298555-27203-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-oe][PATCH] gperftools: add 2.0
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
X-List-Received-Date: Tue, 26 Mar 2013 12:06:33 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-support/gperftools/gperftools_2.0.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-support/gperftools/gperftools_2.0.bb

diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.0.bb b/meta-oe/recipes-support/gperftools/gperftools_2.0.bb
new file mode 100644
index 0000000..1717752
--- /dev/null
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.0.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Fast, multi-threaded malloc() and nifty performance analysis tools"
+HOMEPAGE = "http://code.google.com/p/gperftools/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/g/google-perftools/google-perftools_${PV}.orig.tar.gz"
+
+SRC_URI[md5sum] = "13f6e8961bc6a26749783137995786b6"
+SRC_URI[sha256sum] = "7de3dd91f018825b1e7d332af1edace15c6211f430186febede1835069861080"
+
+inherit autotools
-- 
1.8.1.2



