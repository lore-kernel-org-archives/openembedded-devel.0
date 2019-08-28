Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 956A87E836
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 01:24:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7S1OPJl027744
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Aug 2019 18:24:25 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Tue, 27 Aug 2019 18:24:18 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 28 Aug 2019 09:24:16 +0800
Message-ID: <1566955456-20194-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566554709-22088-2-git-send-email-hongxu.jia@windriver.com>
References: <1566554709-22088-2-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH V2] cryptsetup: add libdevmapper to RDEPENDS
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
X-List-Received-Date: Wed, 28 Aug 2019 01:24:24 -0000
Content-Type: text/plain

Since commit [libdevmapper/lvm2: force recipe libdevmapper to populate
sysroot only] applied, if recipe DEPENDS on libdevmapper, we have to
add it to packages RDEPENDS to fix [file-rdeps] QA issue

Skip [build-deps] QA checking, add lvm2 to DEPENDS will triger
circular dependencies, use recipe libdevmapper to replace,
ignore the QA checking is fine.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
index 6ebf1e2..eb155e1 100644
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
 
+INSANE_SKIP_${PN} += "build-deps"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


