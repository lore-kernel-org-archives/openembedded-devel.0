Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1U0Sgd-0005rC-No
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2013 09:06:27 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 508FCD22B4;
	Wed, 30 Jan 2013 08:50:46 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Jan 2013 08:50:38 +0100
Message-Id: <1359532239-30333-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
Subject: [meta-oe][PATCH 1/2] python-nose: add 1.2.1
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
X-List-Received-Date: Wed, 30 Jan 2013 08:06:28 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-devtools/python/python-nose_1.2.1.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-nose_1.2.1.bb

diff --git a/meta-oe/recipes-devtools/python/python-nose_1.2.1.bb b/meta-oe/recipes-devtools/python/python-nose_1.2.1.bb
new file mode 100644
index 0000000..083d052
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-nose_1.2.1.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "nose extends the test loading and running features of unittest, \
+making it easier to write, find and run tests."
+SECTION = "devel/python"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://lgpl.txt;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+SRC_URI = "http://pypi.python.org/packages/source/n/nose/nose-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "735e3f1ce8b07e70ee1b742a8a53585a"
+SRC_URI[sha256sum] = "2171e9202d118d302d5db1decb52dd862b79e2a626ca19653a6914574a6ca7d9"
+
+S = "${WORKDIR}/nose-${PV}"
+
+inherit distutils
-- 
1.8.0



