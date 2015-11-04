Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35E0D76230
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 07:49:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tA47npaf011520
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 3 Nov 2015 23:49:51 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 3 Nov 2015 23:49:51 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Nov 2015 15:36:18 +0800
Message-ID: <1446622578-21255-4-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446622578-21255-1-git-send-email-Qi.Chen@windriver.com>
References: <1446622578-21255-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH V3 4/4] rrdtool: fix do_configure to suite the latest version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Nov 2015 07:49:51 -0000
Content-Type: text/plain

Fix the do_configure task to suite the latest version so that python
modules could be installed into the correct location.

This would fix the following QA issue.

ERROR: QA Issue: rrdtool: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/python2.7
  /usr/lib/python2.7/site-packages
  /usr/lib/python2.7/site-packages/rrdtool.so
  ....

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
index b8ad383..57d39f2 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
@@ -82,8 +82,8 @@ do_configure() {
     #remove the dependency of perl-shared:Makefile
     #or perl-shared/Makefile will be regenerated
     #if any code touch bindings/Makefile after below perl bindings code
-    sed -i -e "s:\$(PYTHON) setup.py install:\$(PYTHON) setup.py install \
-        --install-lib=${D}${PYTHON_SITEPACKAGES_DIR}:" \
+    sed -i -e "s:python/setup.py install:python/setup.py install \
+        --install-lib=${PYTHON_SITEPACKAGES_DIR}:" \
         -e "s:perl-shared/Makefile.PL Makefile:perl-shared/Makefile.PL:" \
         ${B}/bindings/Makefile
 
-- 
1.9.1


