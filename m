Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A8F6460116
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 12:34:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w85CYIeH012138
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Sep 2018 05:34:18 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 5 Sep 2018 05:34:17 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Sep 2018 08:33:20 -0400
Message-ID: <1536150801-171989-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] gradm: do not use 'exit 1' to postpone to first boot
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
X-List-Received-Date: Wed, 05 Sep 2018 12:34:17 -0000
Content-Type: text/plain

Since `229f4e9 package.bbclass: add support for
pkg_postinst_ontarget()' applied in oe-core, use
pkg_postinst_ontarget to run postinst at first boot.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/gradm/gradm_3.1.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/gradm/gradm_3.1.bb b/meta-oe/recipes-support/gradm/gradm_3.1.bb
index 1a4261a..a7d0607 100644
--- a/meta-oe/recipes-support/gradm/gradm_3.1.bb
+++ b/meta-oe/recipes-support/gradm/gradm_3.1.bb
@@ -43,10 +43,6 @@ do_install() {
     rm -rf ${D}/dev
 }
 
-pkg_postinst_${PN}() {
-    # make sure running on the target
-    if [ x"$D" != "x" ]; then
-        exit 1
-    fi
+pkg_postinst_ontarget_${PN}() {
     /bin/mknod -m 0622 /dev/grsec c 1 13
 }
-- 
2.8.1


