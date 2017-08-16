Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 80F137861C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 06:55:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7G6th5T001382
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 23:55:44 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 15 Aug 2017 23:55:43 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Aug 2017 23:55:43 -0700
Message-ID: <20170816065543.62218-1-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] fontforge: update to 20170731 to fix CVEs
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
X-List-Received-Date: Wed, 16 Aug 2017 06:55:43 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Fixed CVEs & Issues:
  CVE-2017-11577: #3088
  CVE-2017-11576: #3091
  CVE-2017-11575: #3096
  CVE-2017-11574: #3090
  CVE-2017-11572: #3092
  CVE-2017-11571: #3087
  CVE-2017-11569: #3093
  CVE-2017-11568: #3089

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../fontforge/{fontforge_20161012.bb => fontforge_20170731.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/fontforge/{fontforge_20161012.bb => fontforge_20170731.bb} (96%)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20161012.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20170731.bb
similarity index 96%
rename from meta-oe/recipes-graphics/fontforge/fontforge_20161012.bb
rename to meta-oe/recipes-graphics/fontforge/fontforge_20170731.bb
index 1c3376d42..d9f086749 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20161012.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20170731.bb
@@ -14,8 +14,8 @@ inherit autotools pkgconfig pythonnative distro_features_check gettext
 REQUIRED_DISTRO_FEATURES_append_class-target = " x11"
 
 SRC_URI = "git://github.com/${BPN}/${BPN}.git"
-# tag 20161012
-SRCREV = "072edb0235cd163d6c3391da9cc3754c3c66f47a"
+# tag 20170731
+SRCREV = "b9149c13e8f9464fc21473f1f676b36a2130775d"
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF_append_class-native = " with_x=no"
-- 
2.13.0


