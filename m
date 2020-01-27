Return-Path: <tgamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 545407FDF5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 20:43:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00RKhXcb024837
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 12:43:43 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 27 Jan 2020 12:43:22 -0800
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20958)	id 8B1B4900A7C;
	Mon, 27 Jan 2020 12:43:22 -0800 (PST)
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 27 Jan 2020 12:43:21 -0800
Message-ID: <20200127204322.143707-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-python][zeus][PATCH 1/2] python-twisted: add required RDEPENDS for twistd
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
X-List-Received-Date: Mon, 27 Jan 2020 20:43:57 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

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
index d70104dc2..f55bbb033 100644
--- a/meta-python/recipes-devtools/python/python-twisted.inc
+++ b/meta-python/recipes-devtools/python/python-twisted.inc
@@ -56,7 +56,23 @@ RDEPENDS_${PN} = "\
     ${PN}-zsh \
 "
 
-RDEPENDS_${PN}-core = "${PYTHON_PN}-core ${PYTHON_PN}-zopeinterface ${PYTHON_PN}-incremental ${PYTHON_PN}-constantly ${PYTHON_PN}-hyperlink ${PYTHON_PN}-automat"
+RDEPENDS_${PN}-core = "${PYTHON_PN}-core \ 
+                       ${PYTHON_PN}-zopeinterface \
+                       ${PYTHON_PN}-incremental \
+                       ${PYTHON_PN}-constantly \
+                       ${PYTHON_PN}-hyperlink \
+                       ${PYTHON_PN}-automat \
+                       ${PYTHON_PN}-pyserial \
+                       ${PYTHON_PN}-pyhamcrest \
+                       ${PYTHON_PN}-debugger \
+                       ${PYTHON_PN}-unixadmin \
+                       ${PYTHON_PN}-pkg-resources \
+                       ${PYTHON_PN}-misc \
+                       ${PYTHON_PN}-pkgutil \
+                       ${PYTHON_PN}-plistlib \
+                       ${PYTHON_PN}-setuptools \
+"
+
 RDEPENDS_${PN}-test = "${PN}"
 RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols"
 RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
-- 
2.23.0


