Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0C7447EA35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 05:54:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5S5slpb002008
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 22:54:47 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 27 Jun 2019 22:54:34 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Jun 2019 13:54:33 +0800
Message-ID: <1561701273-246802-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] uthash: remove uthash-ptest dependencies
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
X-List-Received-Date: Fri, 28 Jun 2019 05:54:48 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

after commit https://git.openembedded.org/openembedded-core/
commit/meta/classes/ptest.bbclass?id=b47194b57d94260b4e6438c5bf74914027f0b520
package ${PN}-ptest will depend on ${PN} by default,
but for uthash, ${PN} is empty package, remove it from dependency
to avoid image do rootfs failure since nothing provides error.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-support/uthash/uthash_2.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/uthash/uthash_2.1.0.bb b/meta-oe/recipes-support/uthash/uthash_2.1.0.bb
index d01a06c..09cef44 100644
--- a/meta-oe/recipes-support/uthash/uthash_2.1.0.bb
+++ b/meta-oe/recipes-support/uthash/uthash_2.1.0.bb
@@ -41,5 +41,6 @@ do_install_ptest() {
 # The main package is empty and non-existent, so -dev
 # should not depend on it...
 RDEPENDS_${PN}-dev = ""
+RDEPENDS_${PN}-ptest_remove = "${PN}"
 
 BBCLASSEXTEND = "native"
-- 
2.7.4


