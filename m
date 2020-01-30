Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F7EF6073E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 15:34:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00UFYGZ1029225
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 07:34:26 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 30 Jan 2020 07:34:05 -0800
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Jan 2020 10:34:04 -0500
Message-ID: <20200130153405.26756-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-python][zeus][PATCH v2 1/2] python-twisted: add required RDEPENDS for twistd
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
X-List-Received-Date: Thu, 30 Jan 2020 15:34:36 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

python-twisted is currently missing some packages for its /usr/bin/twistd
executable to function. Add these to the RDEPENDS list, and also clean up
formatting since the list is getting long.

Note that a similar patch has already been submitted for master branch,
but the python2 version of twisted needs more explicit RDEPENDS than the
python3 version submitted to master in order for /usr/bin/twistd to work
properly.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-devtools/python/python-twisted.inc | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-twisted.inc b/meta-python/recipes-devtools/python/python-twisted.inc
index d70104dc2..024a9fa7c 100644
--- a/meta-python/recipes-devtools/python/python-twisted.inc
+++ b/meta-python/recipes-devtools/python/python-twisted.inc
@@ -56,7 +56,23 @@ RDEPENDS_${PN} = "\
     ${PN}-zsh \
 "
 
-RDEPENDS_${PN}-core = "${PYTHON_PN}-core ${PYTHON_PN}-zopeinterface ${PYTHON_PN}-incremental ${PYTHON_PN}-constantly ${PYTHON_PN}-hyperlink ${PYTHON_PN}-automat"
+RDEPENDS_${PN}-core = "${PYTHON_PN}-automat \
+                       ${PYTHON_PN}-constantly \
+                       ${PYTHON_PN}-core \
+		       ${PYTHON_PN}-debugger \
+                       ${PYTHON_PN}-hyperlink \
+                       ${PYTHON_PN}-incremental \
+                       ${PYTHON_PN}-misc \
+                       ${PYTHON_PN}-pkg-resources \
+                       ${PYTHON_PN}-pkgutil \
+                       ${PYTHON_PN}-plistlib \
+                       ${PYTHON_PN}-pyhamcrest \
+                       ${PYTHON_PN}-pyserial \
+                       ${PYTHON_PN}-setuptools \
+                       ${PYTHON_PN}-unixadmin \
+                       ${PYTHON_PN}-zopeinterface \
+"
+
 RDEPENDS_${PN}-test = "${PN}"
 RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols"
 RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
-- 
2.24.0


