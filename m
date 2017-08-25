Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6FDE3784A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 22:44:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7PMi8cH016943
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 15:44:08 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 25 Aug 2017 15:44:07 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Aug 2017 15:44:07 -0700
Message-ID: <20170825224407.4461-1-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] multipath-tools: RDEPEND on bash
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
X-List-Received-Date: Fri, 25 Aug 2017 22:44:07 -0000
Content-Type: text/plain

Make sure /bin/bash will be on the target if we are.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb
index 610ba7a..a614d5b 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb
@@ -110,4 +110,4 @@ FILES_kpartx = "${base_sbindir}/kpartx \
                 ${nonarch_libdir}/udev/kpartx_id \
                "
 
-RDEPENDS_${PN} += "kpartx"
+RDEPENDS_${PN} += "bash kpartx"
-- 
2.7.4


