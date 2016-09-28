Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0660A6071F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 21:06:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8SL6xml003284
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 14:06:59 -0700
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 28 Sep 2016 14:06:58 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Sep 2016 14:06:58 -0700
Message-ID: <1475096818-5273-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] ttf-lklug: use fedora24 for source
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
X-List-Received-Date: Wed, 28 Sep 2016 21:06:59 -0000
Content-Type: text/plain

The checksums of the fedora25 rpm do not match those
in the recipe.  We use the fedora24 version instead.

The extracted gz file is the same for both versions.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb
index fd235bd..2ef6c57 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://rpms.famillecollet.com/rpmphp/zoom.php?rpm=lklug-fonts"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "http://dl.fedoraproject.org/pub/fedora/linux/development/25/Everything/source/tree/Packages/l/lklug-fonts-0.6-14.20090803cvs.fc24.src.rpm;extract=lklug-20090803.tar.gz"
+SRC_URI = "http://dl.fedoraproject.org/pub/fedora/linux/releases/24/Everything/source/tree/Packages/l/lklug-fonts-0.6-14.20090803cvs.fc24.src.rpm;extract=lklug-20090803.tar.gz"
 SRC_URI[md5sum] = "3341dfb997043d234ab3f6e5a965e759"
 SRC_URI[sha256sum] = "f54c1f3b4df08995982657fed290b562556191fee2a0386afd9e8bf228f72b1a"
 
-- 
1.7.9.5


