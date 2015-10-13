Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 695D875F3A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2015 02:55:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9D2tvt6004470
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 Oct 2015 19:55:57 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 12 Oct 2015 19:55:57 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <martin.jansa@gmail.com>
Date: Tue, 13 Oct 2015 10:43:55 +0800
Message-ID: <1444704238-7057-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/4] rrdtool: fix useless-rpath QA issue
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
X-List-Received-Date: Tue, 13 Oct 2015 02:56:00 -0000
Content-Type: text/plain

When building rrdtool, we would meet the following error.

  ERROR: QA Issue: rrdtool-python: work/core2-64-poky-linux/rrdtool
  /1.5.4-r0/packages-split/rrdtool-python/usr/lib/python2.7/site-packages
  /rrdtool.so contains probably-redundant RPATH /usr/lib [useless-rpaths]

Fix this issue by removing the redundante RPATH section from rrdtool.so.

As we use '--disable-rpath' in EXTRA_OECONF, we don't need to the `sed'
line in do_configure.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
index 91a30cf..f2ded65 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
@@ -71,7 +71,6 @@ do_configure() {
     PYTHON_INCLUDES="-I=/usr/include/python${PYTHON_BASEVERSION}"' \
         ${S}/m4/acinclude.m4
     #remove the hardcoded $(libdir) rpath
-    sed -i -e 's|--rpath=$(libdir)||g' ${S}/bindings/Makefile.am
 
     autotools_do_configure
 
@@ -100,6 +99,11 @@ do_configure() {
         ${B}/examples/*.pl
 }
 
+do_compile_append() {
+    # Remove useless rpath
+    find ${B}/bindings/python/build -name "rrdtool.so" | xargs chrpath -d
+}
+
 PACKAGES =+ "${PN}-perl ${PN}-python"
 
 FILES_${PN}-doc += "${datadir}/examples"
-- 
1.9.1


