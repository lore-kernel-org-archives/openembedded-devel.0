Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EEF6D7F2DF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 02:14:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7V2Eheb020190
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 30 Aug 2019 19:14:44 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 30 Aug 2019 19:14:25 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Sat, 31 Aug 2019 10:14:24 +0800
Message-ID: <1567217664-14728-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] layer.conf: add lvm2 as libdevmapper preferred rprovider
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
X-List-Received-Date: Sat, 31 Aug 2019 02:14:45 -0000
Content-Type: text/plain

Since commit [libdevmapper/lvm2: force recipe libdevmapper to populate
sysroot only] applied, if recipe DEPENDS on libdevmapper, we have to
add it to packages RDEPENDS to fix [file-rdeps] QA issue

Set PREFERRED_RPROVIDER_libdevmapper = "lvm2" in layer.conf to explicit
use lvm2 as libdevmapper preferred rprovider

Remove unnecessary insane skip

Suggested-by : peter.kjellerstedt@axis.com
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/conf/layer.conf                               | 2 ++
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 896a5d6..e48fabd 100644
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
index 194842e..0773671 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
@@ -89,6 +89,4 @@ EXTRA_OECONF += "--disable-libargon2"
 
 FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/tmpfiles.d/cryptsetup.conf', '', d)}"
 
-INSANE_SKIP_${PN} += "build-deps file-rdeps"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


