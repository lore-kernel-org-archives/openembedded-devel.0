Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B8B5777DB8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 16:52:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v4JGqwnX016295
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 19 May 2017 09:52:59 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 19 May 2017 09:52:58 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <derek@asterius.io>, <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 May 2017 12:52:55 -0400
Message-ID: <1495212776-27436-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/2] python-zopeinterface: fixup test package
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
X-List-Received-Date: Fri, 19 May 2017 16:53:00 -0000
Content-Type: text/plain

The recipe seems to have the intent of creating a 'tests' package but
doesn't follow through on this intent. Rename 'tests' to 'test' to
match other python test packages and follow through on the intent to
actually produce a 'test' package.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-python/recipes-devtools/python/python-zopeinterface_4.3.3.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-zopeinterface_4.3.3.bb b/meta-python/recipes-devtools/python/python-zopeinterface_4.3.3.bb
index 7596394..8ad1250 100644
--- a/meta-python/recipes-devtools/python/python-zopeinterface_4.3.3.bb
+++ b/meta-python/recipes-devtools/python/python-zopeinterface_4.3.3.bb
@@ -8,11 +8,16 @@ SRC_URI[sha256sum] = "8780ef68ca8c3fe1abb30c058a59015129d6e04a6b02c2e56b9c7de607
 PYPI_PACKAGE = "zope.interface"
 inherit pypi setuptools
 
+PACKAGES =. "${PN}-test "
+
 RPROVIDES_${PN} += "zope-interfaces"
+
+RDEPENDS_${PN}-test += "python-unittest python-doctest"
+
 FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*.egg/*/*/.debug"
 FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/zope/interface/*.c"
 FILES_${PN}-doc += "${PYTHON_SITEPACKAGES_DIR}/zope/interface/*.txt"
-FILES_${PN}-tests = " \
+FILES_${PN}-test += " \
         ${PYTHON_SITEPACKAGES_DIR}/zope/interface/tests \
         ${PYTHON_SITEPACKAGES_DIR}/zope/interface/common/tests \
 "
-- 
2.7.4


