Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TbvLo-0007PK-Eg
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Nov 2012 16:39:32 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id E910A4A02A;
	Fri, 23 Nov 2012 16:25:34 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Nov 2012 16:24:47 +0100
Message-Id: <1353684287-19180-10-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1353684287-19180-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1353684287-19180-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [meta-oe][PATCH 9/9] python-phoneutils: drop due to lack of libphone-utils
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
X-List-Received-Date: Fri, 23 Nov 2012 15:39:32 -0000

ERROR: Nothing PROVIDES 'libphone-utils' (but meta-openembedded/meta-oe/recipes-devtools/python/python-phoneutils_git.bb DEPENDS on or otherwise requires it)
ERROR: Required build target 'python-phoneutils' has no buildable providers.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-devtools/python/python-phoneutils_git.bb | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python-phoneutils_git.bb

diff --git a/meta-oe/recipes-devtools/python/python-phoneutils_git.bb b/meta-oe/recipes-devtools/python/python-phoneutils_git.bb
deleted file mode 100644
index 36f5241..0000000
--- a/meta-oe/recipes-devtools/python/python-phoneutils_git.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Python Bindings for libphone-utils"
-SECTION = "devel/python"
-DEPENDS = "libphone-utils python-cython-native python-pyrex-native"
-RDEPENDS_${PN} = "libphone-utils"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://phoneutils/c_phoneutils.pyx;endline=18;md5=ca321e4ec3a30a44469b23ebca782665"
-
-SRCREV = "8a7c719e0c3f1f8c10f77f17422da02d7177f0dd"
-PV = "0.0.2+gitr${SRCPV}"
-PR = "r5"
-
-SRC_URI = "git://git.shr-project.org/repo/libphone-utils.git;protocol=http;branch=master"
-S = "${WORKDIR}/git/src/python"
-
-inherit setuptools
-- 
1.8.0



