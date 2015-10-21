Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E24AD76E04
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 08:00:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9L80Dkg011550
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Oct 2015 01:00:13 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 21 Oct 2015 01:00:12 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <martin.jansa@gmail.com>
Date: Wed, 21 Oct 2015 15:47:37 +0800
Message-ID: <1445413660-30085-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2 1/4] rrdtool: fix useless-rpath QA issue
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
X-List-Received-Date: Wed, 21 Oct 2015 08:00:15 -0000
Content-Type: text/plain

When building rrdtool, we would meet the following error.

  ERROR: QA Issue: rrdtool-python: work/core2-64-poky-linux/rrdtool
  /1.5.4-r0/packages-split/rrdtool-python/usr/lib/python2.7/site-packages
  /rrdtool.so contains probably-redundant RPATH /usr/lib [useless-rpaths]

Fix this issue by removing 'LD_RUN_PATH=$(libdir)' when compiling rrdtool.so.

As we use '--disable-rpath' in EXTRA_OECONF, we don't need to the to remove
'--rpath=$(libdir)' in Makefile.am.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
index 91a30cf..d4f9834 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
@@ -70,8 +70,8 @@ do_configure() {
     sed -i -e '/PYTHON_INCLUDES="-I${/c \
     PYTHON_INCLUDES="-I=/usr/include/python${PYTHON_BASEVERSION}"' \
         ${S}/m4/acinclude.m4
-    #remove the hardcoded $(libdir) rpath
-    sed -i -e 's|--rpath=$(libdir)||g' ${S}/bindings/Makefile.am
+    #remove the useless RPATH from the rrdtool.so
+    sed -i -e 's|LD_RUN_PATH=$(libdir)||g' ${S}/bindings/Makefile.am
 
     autotools_do_configure
 
-- 
1.9.1


