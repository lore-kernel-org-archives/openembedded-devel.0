Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 011736D352
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 07:06:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wB575Bs7024838
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Dec 2018 23:05:57 -0800
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 4 Dec 2018 23:05:18 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 5 Dec 2018 15:22:48 +0800
Message-ID: <1543994568-27576-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1543992181-27004-1-git-send-email-hongxu.jia@windriver.com>
References: <1543992181-27004-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH V2] ndctl: remove useless module-base inheriting
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
X-List-Received-Date: Wed, 05 Dec 2018 07:06:23 -0000
Content-Type: text/plain

While inheriting module-base, PACKAGE_ARCH = ${MACHINE_ARCH},
it caused building lib32-libblockdev do_configure failure:
[snip]
checking for libndctl >= 58.4... no
No package 'libndctl' found
[snip]

The lib32-ndctl with MACHINE_ARCH deployed to /usr/lib64/pkgconfig/
libndctl.pc rather than expected /usr/lib/pkgconfig/libndctl.pc

Inherit module-base is helpless, remove it.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-core/ndctl/ndctl_v63.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/ndctl/ndctl_v63.bb b/meta-oe/recipes-core/ndctl/ndctl_v63.bb
index 17f3405..0c62743 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_v63.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v63.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://git.kernel.org/cgit/linux/kernel/git/nvdimm/nvdimm.git/tree/
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e66651809cac5da60c8b80e9e4e79e08"
 
-inherit autotools-brokensep pkgconfig module-base bash-completion systemd
+inherit autotools-brokensep pkgconfig bash-completion systemd
 
 SRCREV = "cb2d678dd6d286dd96d31548c32449a8b883ae32"
 SRC_URI = "git://github.com/pmem/ndctl.git"
-- 
2.7.4


