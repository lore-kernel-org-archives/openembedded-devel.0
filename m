Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CCF4278843
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 20:22:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBFKMBSW023617
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 12:22:11 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 15 Dec 2017 12:22:11 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Dec 2017 15:21:55 -0500
Message-ID: <1513369321-18274-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513369321-18274-1-git-send-email-mark.asselstine@windriver.com>
References: <1513369321-18274-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][v2][rocko][PATCH 2/8] python-twisted: restore RDEPENDS on -news for py2
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
X-List-Received-Date: Fri, 15 Dec 2017 20:22:11 -0000
Content-Type: text/plain

Although this plugin has not yet been ported to py3 it is available in
py2. The previous commit isn't clear about what is being addressed but
I assume it is:

nothing provides python3-twisted-news needed by python3-twisted-17.9.0-r0.corei7_64

For py2 this package is valid and so we should maintain the RDEPENDS,
restore this RDEPENDS for py2.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-python/recipes-devtools/python/python-twisted_17.9.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb b/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
index 2be1709..7fc8c65 100644
--- a/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
+++ b/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
@@ -2,3 +2,9 @@ inherit pypi setuptools
 require python-twisted.inc
 
 RDEPENDS_${PN}-core += "${PYTHON_PN}-contextlib"
+
+# Not yet ported to py3 yet available in py2
+# See src/twisted/python/_setup.py -- notPortedModules
+RDEPENDS_${PN} += "\
+    ${PN}-news \
+    "
-- 
2.7.4


