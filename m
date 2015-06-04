Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8CFCF74050
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 07:48:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t547mJNm005396
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Jun 2015 00:48:19 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 4 Jun 2015 00:48:19 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Jun 2015 15:48:11 +0800
Message-ID: <a55cd1ca790ecc6a173648bc60bf3b37f98a82b0.1433403866.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433403866.git.yi.zhao@windriver.com>
References: <cover.1433403866.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 1/3] luajit: fix build failure for multilib
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
X-List-Received-Date: Thu, 04 Jun 2015 07:48:20 -0000
Content-Type: text/plain

Fix libdir in Makefile

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
index 48137e3..f3235c9 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
@@ -16,8 +16,8 @@ inherit pkgconfig binconfig
 BBCLASSEXTEND = "native"
 
 do_configure_prepend() {
-    sed -i -e s:/usr/local:${prefix}:g ${S}/Makefile
-    sed -i -e s:/lib$:${base_libdir}:g ${S}/Makefile
+    sed -i 's:PREFIX= /usr/local:PREFIX= ${prefix}:g' ${S}/Makefile
+    sed -i 's:MULTILIB= lib:MULTILIB= ${base_libdir}:g' ${S}/Makefile
 }
 
 EXTRA_OEMAKE = 'CROSS=${HOST_PREFIX} \
-- 
1.7.9.5


