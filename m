Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EF6E771979
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 21:32:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uA3LWJkQ012832
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 Nov 2016 14:32:19 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 3 Nov 2016 14:32:18 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 3 Nov 2016 14:32:18 -0700
Message-ID: <20161103213218.128069-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] tsock: Make use of LDFLAGS
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
X-List-Received-Date: Thu, 03 Nov 2016 21:32:19 -0000
Content-Type: text/plain

Fix the QA warning:

WARNING: tsocks-1.8beta5-r0 do_package_qa: QA Issue: No GNU_HASH in the elf binary: '/opt/build-intel-x86/tmp/work/core2-64-linux/tsocks/1.8beta5-r0/packages-split/tsocks/usr/lib64/libtsocks.so.1.8' [ldflags]

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
index b3a9620..62d0411 100644
--- a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
+++ b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
@@ -21,3 +21,6 @@ S = "${WORKDIR}/tsocks-1.8"
 FILES_${PN} = "${libdir}/* ${bindir}/tsocks"
 FILES_${PN}-dev = ""
 INSANE_SKIP_${PN} = "dev-so"
+
+EXTRA_OEMAKE = "SHCC='${CC} -fPIC ${LDFLAGS}'"
+
-- 
2.10.1


