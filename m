Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2BCAB7F33F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 10:26:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7UAQMo2008347
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 30 Aug 2019 03:26:32 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Fri, 30 Aug 2019 03:26:11 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 30 Aug 2019 18:26:10 +0800
Message-ID: <1567160770-34654-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567094248-9489-1-git-send-email-hongxu.jia@windriver.com>
References: <1567094248-9489-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH V4] cryptsetup: add libdevmapper to RDEPENDS
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
X-List-Received-Date: Fri, 30 Aug 2019 10:26:59 -0000
Content-Type: text/plain

Since commit [libdevmapper/lvm2: force recipe libdevmapper to populate
sysroot only] applied, if recipe DEPENDS on libdevmapper, we have to
add it to packages RDEPENDS to fix [file-rdeps] QA issue

Set PREFERRED_RPROVIDER_libdevmapper = "lvm2" in layer.conf to explicit
RDEPENDS on libdevmapper in cryptsetup

Suggested-by : peter.kjellerstedt@axis.com
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/conf/layer.conf                               | 2 ++
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 55051de..2aedc39 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -33,6 +33,8 @@ LAYERSERIES_COMPAT_openembedded-layer = "thud warrior"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
+PREFERRED_RPROVIDER_libdevmapper = "lvm2"
+
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   mplayer-common \
   fbset-modes \
diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
index 6ebf1e2..0773671 100644
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
-- 
2.7.4


