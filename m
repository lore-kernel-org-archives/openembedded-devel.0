Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B7B67ED3D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2019 09:37:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7K9b3rO028704
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Aug 2019 02:37:13 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Tue, 20 Aug 2019 02:36:51 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 20 Aug 2019 17:36:50 +0800
Message-ID: <1566293810-37527-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] poppler: compile with -fpermissive to workaround code diagnostics errors on armv5
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
X-List-Received-Date: Tue, 20 Aug 2019 09:37:39 -0000
Content-Type: text/plain

Build on qemuarmv5 failed:
...
|poppler-0.79.0/splash/SplashFont.h:69:36: error: passing '    const
SplashCoord' {aka 'const FixedPoint'} as 'this' argument discards
qualifiers [-fpermissive]
...

Compile with -fpermissive to workaround error with warning

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/poppler/poppler_0.79.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.79.0.bb b/meta-oe/recipes-support/poppler/poppler_0.79.0.bb
index b285eec..7a5ec13 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.79.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.79.0.bb
@@ -28,6 +28,8 @@ inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
 
 SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
 
+CXXFLAGS_append_armv5 = " -fpermissive"
+
 EXTRA_OECMAKE += " \
     -DENABLE_CMS=lcms2 \
     -DENABLE_UNSTABLE_API_ABI_HEADERS=ON \
-- 
2.7.4


