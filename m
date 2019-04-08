Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1DA987D588
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Apr 2019 21:23:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x38LN2nn000530
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Apr 2019 14:23:18 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 8 Apr 2019 14:23:12 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <meta-virtualization@yoctoproject.org>,
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Apr 2019 14:23:12 -0700
Message-ID: <20190408212312.86791-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-virt][m-c-s][v2][PATCH 1/1] libibverbs: do not try to build for arm 32 bit or any mips
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
X-List-Received-Date: Mon, 08 Apr 2019 21:23:38 -0000
Content-Type: text/plain

arch.h does not contain macros for 32 bit arm or any mips arch.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 recipes-extended/libibverbs/libibverbs_1.2.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-extended/libibverbs/libibverbs_1.2.1.bb b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
index dd74522..fa7eee6 100644
--- a/recipes-extended/libibverbs/libibverbs_1.2.1.bb
+++ b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
@@ -29,3 +29,6 @@ do_install_append() {
 
 PROVIDES = "virtual/libibverbs"
 RPROVIDES_${PN} = "virtual/libibverbs"
+
+COMPATIBLE_HOST_mipsarch = "none"
+COMPATIBLE_HOST_arm = "none"
-- 
2.7.4


