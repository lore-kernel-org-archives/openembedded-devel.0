Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8895E765A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 06:47:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7L6lBix007982
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 23:47:11 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Thu, 20 Aug 2015 23:47:10 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Aug 2015 14:46:46 +0800
Message-ID: <fef232ae94679b4e7b00b8b51f5843aa7d353da2.1440139197.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1440139197.git.yi.zhao@windriver.com>
References: <cover.1440139197.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 5/8] openwsman: pass correct libdir to cmake
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
X-List-Received-Date: Fri, 21 Aug 2015 06:47:10 -0000
Content-Type: text/plain

Fix QA issue when enable multilib:
ERROR: QA Issue: openwsman: Files/directories were installed but not
shipped in any package:
  /usr/lib
  /usr/lib/libwsman_clientpp.so
  /usr/lib/libwsman_client.so
  /usr/lib/libwsman.so.1.0.0
  /usr/lib/libwsman.so
  /usr/lib/libwsman_client.so.4
  [snip]
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install. [installed-vs-shipped]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-extended/openwsman/openwsman_2.6.0.bb  |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.6.0.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.6.0.bb
index 67cd618..5a19264 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.6.0.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.6.0.bb
@@ -33,7 +33,7 @@ EXTRA_OECMAKE = "-DBUILD_BINDINGS=NO \
                  -DBUILD_LIBCIM=NO \
                  -DBUILD_PERL=YES \
                  -DCMAKE_INSTALL_PREFIX=${prefix} \
-                 -DLIB=lib \
+                 -DLIB=${baselib} \
                 "
 
 do_configure_prepend() {
-- 
1.7.9.5


