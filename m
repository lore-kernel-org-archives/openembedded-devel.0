Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UK48E-0007oc-4P
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Mar 2013 10:56:07 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 337EED22B2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2013 10:39:05 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Mar 2013 10:38:59 +0100
Message-Id: <1364204339-16695-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-oe][PATCH] libunwind: add 1.1 version
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
X-List-Received-Date: Mon, 25 Mar 2013 09:56:12 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-support/libunwind/libunwind.inc    | 12 ++++++++++++
 meta-oe/recipes-support/libunwind/libunwind_1.1.bb |  4 ++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-support/libunwind/libunwind.inc
 create mode 100644 meta-oe/recipes-support/libunwind/libunwind_1.1.bb

diff --git a/meta-oe/recipes-support/libunwind/libunwind.inc b/meta-oe/recipes-support/libunwind/libunwind.inc
new file mode 100644
index 0000000..f028766
--- /dev/null
+++ b/meta-oe/recipes-support/libunwind/libunwind.inc
@@ -0,0 +1,12 @@
+DESCRIPTION = "a portable and efficient C programming interface (API) to determine the call-chain of a program"
+HOMEPAGE = "http://www.nongnu.org/libunwind"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3fced11d6df719b47505837a51c16ae5"
+
+SRC_URI = "http://download.savannah.nongnu.org/releases/${BPN}/${BPN}-${PV}.tar.gz"
+
+inherit autotools
+
+EXTRA_OECONF_arm = "--enable-debug-frame"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/libunwind/libunwind_1.1.bb b/meta-oe/recipes-support/libunwind/libunwind_1.1.bb
new file mode 100644
index 0000000..bc38e36
--- /dev/null
+++ b/meta-oe/recipes-support/libunwind/libunwind_1.1.bb
@@ -0,0 +1,4 @@
+require libunwind.inc
+
+SRC_URI[md5sum] = "fb4ea2f6fbbe45bf032cd36e586883ce"
+SRC_URI[sha256sum] = "9dfe0fcae2a866de9d3942c66995e4b460230446887dbdab302d41a8aee8d09a"
-- 
1.8.1.2



