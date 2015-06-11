Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2A79373E36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2015 09:17:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5B9HKkm010669
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2015 02:17:20 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 11 Jun 2015 02:17:20 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Jun 2015 17:16:54 +0800
Message-ID: <f642f40f569a507360138e8aae0bf0ce6255a9f3.1434013953.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1434013953.git.yi.zhao@windriver.com>
References: <cover.1434013953.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 7/9] openjpeg: pass correct libdir to cmake
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Jun 2015 09:17:19 -0000
Content-Type: text/plain

When MACHINE=qemux86-64 and enable multilib:
ERROR: QA Issue: openjpeg: Files/directories were installed but not
shipped in any package:
  /usr/lib
  /usr/lib/libopenjp2.so
  /usr/lib/libopenjp2.so.2.1.0
  /usr/lib/libopenjp2.so.7
  /usr/lib/.debug
  /usr/lib/pkgconfig
  /usr/lib/.debug/libopenjp2.so.2.1.0
  /usr/lib/pkgconfig/libopenjp2.pc
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install. [installed-vs-shipped]

Pass the correct libdir configuration option to cmake.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-graphics/openjpeg/openjpeg_2.1.0.bb    |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb
index 9f6dd57..d28a865 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb
@@ -13,6 +13,7 @@ inherit cmake
 DEPENDS = "libpng tiff lcms"
 
 # standard path for *.cmake
-EXTRA_OECMAKE += "-DOPENJPEG_INSTALL_PACKAGE_DIR=${baselib}/cmake"
+EXTRA_OECMAKE += "-DOPENJPEG_INSTALL_PACKAGE_DIR=${baselib}/cmake \
+                  -DOPENJPEG_INSTALL_LIB_DIR:PATH=${libdir}"
 
 FILES_${PN}-dev += "${libdir}/cmake/*.cmake"
-- 
1.7.9.5


