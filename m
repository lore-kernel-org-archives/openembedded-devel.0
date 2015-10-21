Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E6CE676E3F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 08:00:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9L80H3w001578
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Oct 2015 01:00:18 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 21 Oct 2015 01:00:17 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <martin.jansa@gmail.com>
Date: Wed, 21 Oct 2015 15:47:40 +0800
Message-ID: <1445413660-30085-4-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445413660-30085-1-git-send-email-Qi.Chen@windriver.com>
References: <1445413660-30085-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2 4/4] rrdtool: fix multilib problem
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
X-List-Received-Date: Wed, 21 Oct 2015 08:00:19 -0000
Content-Type: text/plain

When building rrdtool with multilib enabled, we would meet the following error.

ERROR: QA Issue: rrdtool: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/python2.7
  /usr/lib/python2.7/site-packages
  /usr/lib/python2.7/site-packages/rrdtool.so
  ....

Fix this problem by using nonarch_libdir instead of libdir.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
index 9b54deb..d9ac924 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
@@ -117,8 +117,8 @@ RDEPENDS_${PN}-perl = "perl perl-module-lib perl-module-getopt-long perl-module-
 
 DESCRIPTION_${PN}-python = \
 "The ${PN}-python package includes RRDtool bindings for python."
-FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
+FILES_${PN}-python = "${nonarch_libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
 RDEPENDS_${PN}-python = "python"
 
 FILES_${PN}-dbg += "${libdir}/perl/vendor_perl/*/auto/RRDs/.debug \
-    ${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug"
+    ${nonarch_libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug"
-- 
1.9.1


