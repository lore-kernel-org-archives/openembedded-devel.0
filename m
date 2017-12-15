Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 10A97786F4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 20:22:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBFKMA2K002575
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 12:22:10 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 15 Dec 2017 12:22:10 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Dec 2017 15:21:54 -0500
Message-ID: <1513369321-18274-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513369321-18274-1-git-send-email-mark.asselstine@windriver.com>
References: <1513369321-18274-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][v2][rocko][PATCH 1/8] python-twisted: clean-up the dependencies
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
X-List-Received-Date: Fri, 15 Dec 2017 20:22:10 -0000
Content-Type: text/plain

From: Derek Straka <derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---

Cherry-pick from master
e410b5c54373ce9539f2df9840e3d987f319ee6c                                                                                                                                                                          
 meta-python/recipes-devtools/python/python-twisted.inc        | 4 ++--
 meta-python/recipes-devtools/python/python-twisted_17.9.0.bb  | 2 +-
 meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-twisted.inc b/meta-python/recipes-devtools/python/python-twisted.inc
index 4bd4788..0dd584f 100644
--- a/meta-python/recipes-devtools/python/python-twisted.inc
+++ b/meta-python/recipes-devtools/python/python-twisted.inc
@@ -41,16 +41,16 @@ PACKAGES =+ "\
 
 RDEPENDS_${PN} = "\
     ${PN}-bin \
+    ${PN}-core \
     ${PN}-conch \
     ${PN}-mail \
     ${PN}-names \
-    ${PN}-news \
     ${PN}-runner \
     ${PN}-web \
     ${PN}-words \
 "
 
-RDEPENDS_${PN}-core = "python-core python-zopeinterface python-contextlib"
+RDEPENDS_${PN}-core = "${PYTHON_PN}-core ${PYTHON_PN}-zopeinterface ${PYTHON_PN}-incremental ${PYTHON_PN}-constantly ${PYTHON_PN}-hyperlink ${PYTHON_PN}-automat"
 RDEPENDS_${PN}-test = "${PN}"
 RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols"
 RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
diff --git a/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb b/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
index 3b45110..2be1709 100644
--- a/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
+++ b/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
@@ -1,4 +1,4 @@
 inherit pypi setuptools
 require python-twisted.inc
 
-RDEPENDS_${PN}-core = "python-core python-zopeinterface python-contextlib"
+RDEPENDS_${PN}-core += "${PYTHON_PN}-contextlib"
diff --git a/meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb b/meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb
index 98016cc..d7533d8 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb
@@ -1,7 +1,7 @@
 inherit pypi setuptools3
 require python-twisted.inc
 
-RDEPENDS_${PN}-core = "python3-core python3-zopeinterface python3-lang"
+RDEPENDS_${PN}-core += "python3-lang"
 
 FILES_${PN}-core_append += " \
   ${libdir}/${PYTHON_DIR}/site-packages/twisted/__pycache__ \
-- 
2.7.4


