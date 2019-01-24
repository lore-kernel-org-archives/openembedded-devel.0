Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 340307C121
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 09:24:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0O9P0nd025524
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 01:25:00 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 24 Jan 2019 01:24:59 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Jan 2019 01:24:59 -0800
Message-ID: <20190124092459.30180-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] yaffs2-utils: Set CLEANBROKEN
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
X-List-Received-Date: Thu, 24 Jan 2019 09:24:59 -0000
Content-Type: text/plain

Fixed make clean error:
NOTE: make -e MAKEFLAGS= clean
make -C /lib/modules/4.4.0-112-generic/build M=<snip>
make: *** /lib/modules/4.4.0-112-generic/build: No such file or directory.  Stop.
make: *** [clean] Error 2

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
index 6095e27a7..8628bea0b 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
@@ -43,3 +43,9 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native"
+
+# Fixed make clean error:
+#make -C /lib/modules/4.4.0-112-generic/build M=<snip>
+#make: *** /lib/modules/4.4.0-112-generic/build: No such file or directory.  Stop.
+#make: *** [clean] Error 2
+CLEANBROKEN = "1"
-- 
2.11.0


