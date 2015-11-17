Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 69D1F60108
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2015 09:57:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAH9vcRu029103
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2015 01:57:38 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 17 Nov 2015 01:57:38 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Nov 2015 17:57:42 +0800
Message-ID: <1447754262-19980-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] netmap-modules: skip the arch check for kernel module
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
X-List-Received-Date: Tue, 17 Nov 2015 09:57:39 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

When building on a multilib capable BSP, it's possible for the
kernel bit size to be different then the userspace. Avoid the
QA test when building the kernel module.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-kernel/netmap/netmap-modules_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
index c1c319d..286b429 100644
--- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
+++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
@@ -9,6 +9,11 @@ CLEANBROKEN = "1"
 
 export INSTALL_MOD_DIR="kernel/netmap-modules"
 
+# When building on a multilib capable BSP, it's possible for the
+# kernel bit size to be different then the userspace. Avoid the QA test
+# when building modules
+INSANE_SKIP_kernel-module-netmap = "arch"
+
 EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR} \
                 --kernel-sources=${STAGING_KERNEL_DIR} \
                 --install-mod-path=${D} \
-- 
2.3.5


