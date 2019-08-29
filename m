Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 17C317F2FF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 15:58:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7TFvDk7002104
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Aug 2019 08:57:44 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Thu, 29 Aug 2019 08:57:30 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Thu, 29 Aug 2019 23:57:28 +0800
Message-ID: <1567094248-9489-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566955456-20194-1-git-send-email-hongxu.jia@windriver.com>
References: <1566955456-20194-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH V3] cryptsetup: add libdevmapper to RDEPENDS
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
X-List-Received-Date: Thu, 29 Aug 2019 15:58:09 -0000
Content-Type: text/plain

Since commit [libdevmapper/lvm2: force recipe libdevmapper to populate
sysroot only] applied, if recipe DEPENDS on libdevmapper, we have to
add it to packages RDEPENDS to fix [file-rdeps] QA issue

Skip [build-deps] and [file-rdeps] QA checking, add lvm2 to DEPENDS will
triger circular dependencies, use recipe libdevmapper to replace,
ignore the QA checking is fine.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
index 6ebf1e2..194842e 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
@@ -16,6 +16,10 @@ DEPENDS = " \
     util-linux \
 "
 
+RDEPENDS_${PN} = " \
+    libdevmapper \
+"
+
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
 SRC_URI[md5sum] = "f7818082056e5bc0be12e4c7fc20345a"
 SRC_URI[sha256sum] = "9d8f8cac2836a1623c075b5cba96032271dc81a28b2aa27fbd8331e831416bb1"
@@ -85,4 +89,6 @@ EXTRA_OECONF += "--disable-libargon2"
 
 FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/tmpfiles.d/cryptsetup.conf', '', d)}"
 
+INSANE_SKIP_${PN} += "build-deps file-rdeps"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


