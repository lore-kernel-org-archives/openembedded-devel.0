Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id E13DF77629
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Sep 2016 01:38:00 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1bhRoO-0005VG-IS from drew_moseley@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2016 18:38:00 -0700
Received: from sb-ubuntu-1404-64bit.alm.mentorg.com (147.34.91.1) by
	svr-orw-fem-03.mgc.mentorg.com (147.34.97.39) with Microsoft SMTP
	Server id 14.3.224.2; Tue, 6 Sep 2016 18:37:59 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 6 Sep 2016 21:37:58 -0400
Message-ID: <20160907013758.21987-1-drew_moseley@mentor.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [meta-oe][PATCH] xpext-dev: Remove RDEPEND on empty xpext package.
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
X-List-Received-Date: Wed, 07 Sep 2016 01:38:03 -0000
Content-Type: text/plain

If xpext is included in a build (ie via dependency on mpv) then
builds of core-image-sato-sdk will fail with errors such as below.

     warning: Can't install mpv-dev-0.15.0-r0@i586: Can't install xpext-dev-1.0+5-r0@i586: no package provides xpext = 1.0+5-r0

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
index d65546d..526659e 100644
--- a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
+++ b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
@@ -13,5 +13,8 @@ inherit autotools pkgconfig distro_features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
+# Remove runtime dependency on empty package ${PN}
+RDEPENDS_${PN}-dev = ""
+
 SRC_URI[md5sum] = "1b0cb67b6f2bd7c4abef17648b062896"
 SRC_URI[sha256sum] = "a3b06f5188fd9effd0799ae31352b3cd65cb913b964e2c1a923ffa9d3c08abbe"
-- 
2.9.3


