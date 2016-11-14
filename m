Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1B73C600EB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2016 11:22:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAEBMotJ008136
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2016 03:22:50 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 14 Nov 2016 03:22:49 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Nov 2016 06:22:48 -0500
Message-ID: <20161114112248.182506-1-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libeigen: set tarball name as ${BP}.tar.bz2
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
X-List-Received-Date: Mon, 14 Nov 2016 11:22:55 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Rename tarball name: 3.2.8.tar.bz2 -> libeigen-3.2.8.tar.bz2

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-oe/recipes-support/libeigen/libeigen_3.2.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.2.8.bb b/meta-oe/recipes-support/libeigen/libeigen_3.2.8.bb
index 9e14ee1..dcca2e9 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.2.8.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.2.8.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://eigen.tuxfamily.org/"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRC_URI = "http://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2 \
+SRC_URI = "http://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2;downloadfilename=${BP}.tar.bz2 \
            file://0001-CMakeLists.txt-install-FindEigen3.cmake-script.patch"
 SRC_URI[md5sum] = "9e3bfaaab3db18253cfd87ea697b3ab1"
 SRC_URI[sha256sum] = "722a63d672b70f39c271c5e2a4a43ba14d12015674331790414fcb167c357e55"
-- 
2.9.3


