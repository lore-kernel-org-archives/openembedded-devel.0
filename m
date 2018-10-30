Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 64C2D79BAD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 15:14:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9UFELEg028474
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 08:14:21 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 30 Oct 2018 08:14:20 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 30 Oct 2018 11:14:18 -0400
Message-ID: <1540912458-5943-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-twisted: Add more python-twisted-* packages to the "meta" package
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
X-List-Received-Date: Tue, 30 Oct 2018 15:14:20 -0000
Content-Type: text/plain

Whereas the python-twisted-core package is used to install the minimum
components of python-twisted, the python-twisted package is
essentially a 'meta' package which installs all of the
python-twisted-* packages (used by folks that don't want to determine
which components they are interested in). Add additional packages to
the python-twisted 'meta' package.

NOTE: that there are still modules of python-twisted which have not
been ported to python3 (see src/twisted/python/_setup.py
"notPortedModules") so the installed packages for py2 vs. py3 will not
be the same (ie. python-twisted-news is only part of the py2 package).

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

Please consider this for the 'thud' branch as well. Thanks.

 meta-python/recipes-devtools/python/python-twisted.inc       | 3 +++
 meta-python/recipes-devtools/python/python-twisted_18.4.0.bb | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-twisted.inc b/meta-python/recipes-devtools/python/python-twisted.inc
index 260909b..01616b1 100644
--- a/meta-python/recipes-devtools/python/python-twisted.inc
+++ b/meta-python/recipes-devtools/python/python-twisted.inc
@@ -49,9 +49,12 @@ RDEPENDS_${PN} = "\
     ${PN}-conch \
     ${PN}-mail \
     ${PN}-names \
+    ${PN}-pair \
+    ${PN}-protocols \
     ${PN}-runner \
     ${PN}-web \
     ${PN}-words \
+    ${PN}-zsh \
 "
 
 RDEPENDS_${PN}-core = "${PYTHON_PN}-core ${PYTHON_PN}-zopeinterface ${PYTHON_PN}-incremental ${PYTHON_PN}-constantly ${PYTHON_PN}-hyperlink ${PYTHON_PN}-automat"
diff --git a/meta-python/recipes-devtools/python/python-twisted_18.4.0.bb b/meta-python/recipes-devtools/python/python-twisted_18.4.0.bb
index 2be1709..5903db3 100644
--- a/meta-python/recipes-devtools/python/python-twisted_18.4.0.bb
+++ b/meta-python/recipes-devtools/python/python-twisted_18.4.0.bb
@@ -2,3 +2,7 @@ inherit pypi setuptools
 require python-twisted.inc
 
 RDEPENDS_${PN}-core += "${PYTHON_PN}-contextlib"
+
+RDEPENDS_${PN} += " \
+    ${PN}-news \
+"
-- 
2.7.4


