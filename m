Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 73A367F292
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 10:06:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7NA62BA017854
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 23 Aug 2019 03:06:03 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Fri, 23 Aug 2019 03:06:02 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 23 Aug 2019 18:05:09 +0800
Message-ID: <1566554709-22088-3-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566554709-22088-1-git-send-email-hongxu.jia@windriver.com>
References: <1566554709-22088-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] multipath-tools: lvm2 to DEPENDS
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
X-List-Received-Date: Fri, 23 Aug 2019 10:06:02 -0000
Content-Type: text/plain

Since commit [libdevmapper/lvm2: force recipe libdevmapper to populate
sysroot only] applied, if recipe DEPENDS on libdevmapper, we have to
add lvm2 to DEPENDS

Remove duplicated bash from RDEPENDS

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.1.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.1.bb
index 55866e9..8d86e60 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.1.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.1.bb
@@ -19,6 +19,7 @@ and deletion"
 HOMEPAGE = "http://christophe.varoqui.free.fr/"
 
 DEPENDS = "libdevmapper \
+           lvm2 \
            libaio \
            liburcu \
            readline \
@@ -108,4 +109,4 @@ FILES_kpartx = "${base_sbindir}/kpartx \
                 ${nonarch_libdir}/udev/kpartx_id \
                "
 
-RDEPENDS_${PN} += "bash kpartx"
+RDEPENDS_${PN} += "kpartx"
-- 
2.7.4


