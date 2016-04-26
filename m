Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id A67EF65CB5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 07:56:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5962545"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Apr 2016 15:56:13 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9B288408D296
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 15:56:11 +0800 (CST)
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 26 Apr 2016 15:56:11 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Apr 2016 10:56:05 +0300
Message-ID: <1461657365-1844-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
X-yoursite-MailScanner-ID: 9B288408D296.AE616
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe]PATCH] mozjs_17.0.0.bb: Fix do_srpm error
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
X-List-Received-Date: Tue, 26 Apr 2016 07:56:18 -0000
Content-Type: text/plain

The function do_sourceclean() will lead to do_srpm failed, so use
do_unpack instead.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index be4b50b..7d66978 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -52,17 +52,11 @@ do_configure() {
 }
 
 # patch.bbclass will try to apply the patches already present and fail, so clean them out
-do_sourceclean() {
-    (
-    cd ${WORKDIR}/${BPN}${PV}/patches
-    for i in $(cat series | awk '{print $1}') ; do
-        rm -f $i
-    done
-    rm -f series
-    )
+do_unpack() {
+    tar -xvf ${DL_DIR}/mozjs17.0.0.tar.gz -C ${WORKDIR}/
+    rm -rf ${WORKDIR}/${BPN}${PV}/patches
 }
 
-addtask sourceclean before do_patch after do_unpack
 
 PACKAGES =+ "lib${PN}"
 FILES_lib${PN} += "${libdir}/lib*.so"
-- 
1.8.4.2




