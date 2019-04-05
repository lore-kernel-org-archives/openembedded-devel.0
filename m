Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 419426C4DA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 21:35:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x35LZOrP028016
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 5 Apr 2019 14:35:34 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 5 Apr 2019 14:35:14 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <meta-virtualization@yoctoproject.org>,
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Apr 2019 14:35:13 -0700
Message-ID: <20190405213513.6857-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-virt][m-c-s][PATCH 1/1] libibverbs: do not try to build for arm 32 bit or any mips
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
X-List-Received-Date: Fri, 05 Apr 2019 21:35:55 -0000
Content-Type: text/plain

arch.h does not contain macros for 32 bit arm or any mips arch.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 recipes-extended/libibverbs/libibverbs_1.2.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-extended/libibverbs/libibverbs_1.2.1.bb b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
index dd74522..2becf35 100644
--- a/recipes-extended/libibverbs/libibverbs_1.2.1.bb
+++ b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
@@ -29,3 +29,7 @@ do_install_append() {
 
 PROVIDES = "virtual/libibverbs"
 RPROVIDES_${PN} = "virtual/libibverbs"
+
+# We can build for arm64
+COMPATIBLE_HOST_mipsarch = "none"
+COMPATIBLE_HOST_arm = "none"
-- 
2.7.4


