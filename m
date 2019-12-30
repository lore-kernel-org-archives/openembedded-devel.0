Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4882E7E648
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Dec 2019 07:09:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xBU78lQw029316
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 29 Dec 2019 23:08:57 -0800
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Sun, 29 Dec 2019 23:08:36 -0800
From: Yongxin Liu <yongxin.liu@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Mon, 30 Dec 2019 14:58:40 +0800
Message-ID: <20191230065840.2090-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] ndctl: Upgrade to v67
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
X-List-Received-Date: Mon, 30 Dec 2019 07:09:23 -0000
Content-Type: text/plain

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 meta-oe/recipes-core/ndctl/{ndctl_v65.bb => ndctl_v67.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/ndctl/{ndctl_v65.bb => ndctl_v67.bb} (95%)

diff --git a/meta-oe/recipes-core/ndctl/ndctl_v65.bb b/meta-oe/recipes-core/ndctl/ndctl_v67.bb
similarity index 95%
rename from meta-oe/recipes-core/ndctl/ndctl_v65.bb
rename to meta-oe/recipes-core/ndctl/ndctl_v67.bb
index 69ee1d476..da0c6563a 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_v65.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v67.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e66651809cac5da60c8b80e9e4e79e08"
 
 inherit autotools-brokensep pkgconfig bash-completion systemd
 
-SRCREV = "ed17fd14608d8de072c8c090ffc5fcf78c4f48ff"
+SRCREV = "637bb424dc317a044c722a671355ef9df0e0d30f"
 SRC_URI = "git://github.com/pmem/ndctl.git"
 
 DEPENDS = "kmod udev json-c keyutils"
-- 
2.14.4


