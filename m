Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3261B65D4A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2015 09:43:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAN9h83J029232
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2015 01:43:08 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 23 Nov 2015 01:42:04 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Nov 2015 17:42:03 +0800
Message-ID: <1448271723-11198-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-filesystems][PATCH] xfsprogs: fix the license
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
X-List-Received-Date: Mon, 23 Nov 2015 09:43:08 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The library named "libhandle" and some specific header files
are licensed under LGPLv2.1, all other components are licensed
under GPLv2.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
index 8df7bc1..f38239c 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
@@ -1,7 +1,7 @@
 SUMMARY = "XFS Filesystem Utilities"
 HOMEPAGE = "http://oss.sgi.com/projects/xfs"
 SECTION = "base"
-LICENSE = "GPLv2"
+LICENSE = "GPLv2 & LGPLv2.1"
 LICENSE_libhandle = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=dbdb5f4329b7e7145de650e9ecd4ac2a"
 DEPENDS = "util-linux"
-- 
2.3.5


