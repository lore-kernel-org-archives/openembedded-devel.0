Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UK3vg-0007C5-BC
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Mar 2013 10:43:12 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 38E2AD22B2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2013 10:26:07 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Mar 2013 10:25:59 +0100
Message-Id: <1364203559-24240-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] powertop: add 2.3
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
X-List-Received-Date: Mon, 25 Mar 2013 09:43:37 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-support/powertop/powertop_2.3.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-support/powertop/powertop_2.3.bb

diff --git a/meta-oe/recipes-support/powertop/powertop_2.3.bb b/meta-oe/recipes-support/powertop/powertop_2.3.bb
new file mode 100644
index 0000000..c289ac6
--- /dev/null
+++ b/meta-oe/recipes-support/powertop/powertop_2.3.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Linux tool to diagnose issues with power consumption and power management."
+HOMEPAGE = "http://01.org/powertop/"
+DEPENDS = "ncurses virtual/gettext libnl pciutils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
+
+SRC_URI = "http://01.org/powertop/sites/default/files/downloads/powertop-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "dc03608f20e56cdc99d121a6191556f6"
+SRC_URI[sha256sum] = "b8c1add69afee28c77dca56fdcedb4a46820f3a71c86aae7891b0c5c595cd744"
+
+inherit autotools
-- 
1.8.1.2



