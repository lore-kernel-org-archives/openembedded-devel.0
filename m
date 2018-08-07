Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A92C719AF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Aug 2018 08:16:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w778GSr1007054
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 7 Aug 2018 01:16:29 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Tue, 7 Aug 2018 01:16:27 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Aug 2018 16:16:25 +0800
Message-ID: <1533629785-216164-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] netcat-openbsd: fix netcat_do_patch problem
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
X-List-Received-Date: Tue, 07 Aug 2018 08:16:28 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

${S}/debian should not be deleted after pop the patch,
or we will met error when run below push patch command
since no debian folder found.

QUILT_PATCHES=${S}/debian/patches quilt push -a

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-support/netcat/netcat-openbsd_1.190.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.190.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.190.bb
index b4802fa..74f5c9f 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.190.bb
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.190.bb
@@ -30,7 +30,7 @@ netcat_do_patch() {
             rm -rf ${S}/.pc
             mv ${S}/.pc-netcat ${S}/.pc
             QUILT_PATCHES=${S}/debian/patches quilt pop -a
-            rm -rf ${S}/.pc ${S}/debian
+            rm -rf ${S}/.pc
     fi
     QUILT_PATCHES=${S}/debian/patches quilt push -a
     mv ${S}/.pc ${S}/.pc-netcat
-- 
2.7.4


