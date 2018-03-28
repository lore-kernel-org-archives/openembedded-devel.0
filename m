Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 737F6605C2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2018 20:51:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2SKpI6Z003058
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2018 13:51:18 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 28 Mar 2018 13:51:17 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Mar 2018 16:51:13 -0400
Message-ID: <1522270273-6645-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] zeromq: Fixup do_install_ptest_base failure
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
X-List-Received-Date: Wed, 28 Mar 2018 20:51:17 -0000
Content-Type: text/plain

The following error is being hit:

| install: cannot stat
|  '.../tmp/work/core2-64-poky-linux/zeromq/4.2.3-r0/build/.libs/test_*':
|  No such file or directory

This is being hit in the 'state of the world' builds (see [oe] State
of the world, 2018-03-19). The uprev to v4.2.3 (commit 50eb3504c83c)
did not take into account that the location of the tests changed in
the 'build' directory as part of the new release. Updating to use the
proper directory.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb
index 71d7e7c..6cad335 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb
@@ -28,5 +28,5 @@ do_compile_ptest () {
 
 do_install_ptest () {
     install -d ${D}${PTEST_PATH}/tests
-    install -m 0755 ${B}/.libs/test_* ${D}${PTEST_PATH}/tests
+    install -m 0755 ${B}/tests/.libs/test_* ${D}${PTEST_PATH}/tests
 }
-- 
2.7.4


