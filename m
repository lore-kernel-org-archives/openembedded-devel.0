Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AB7A3605BA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 09:17:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6B9HG9C004012
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 02:17:16 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 11 Jul 2016 02:17:16 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 11 Jul 2016 17:15:26 +0800
Message-ID: <1468228526-32411-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] freeglut: add opengl to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Mon, 11 Jul 2016 09:17:17 -0000
Content-Type: text/plain

* Add opengl to REQUIRED_DISTRO_FEATURES as it depends on
  virtual/libgl

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb b/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
index 389d3fb..d54fafc 100644
--- a/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
+++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
@@ -9,8 +9,8 @@ SRC_URI[sha256sum] = "2a43be8515b01ea82bcfa17d29ae0d40bd128342f0930cd1f375f1ff99
 
 inherit cmake distro_features_check
 
-# depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES = "x11"
+# depends on virtual/libx11, virtual/libgl
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 PROVIDES += "mesa-glut"
 
-- 
2.8.1


