Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A789F6C3ED
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Nov 2018 07:47:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAE7loXs015363
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Nov 2018 23:47:50 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 13 Nov 2018 23:47:50 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Wed, 14 Nov 2018 15:47:46 +0800
Message-ID: <1542181667-210743-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] tk: update the parameter for --with-tcl
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
X-List-Received-Date: Wed, 14 Nov 2018 07:47:51 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Update the parameter for --with-tcl to fix
below do_configure issue:
$ bitbake tk-native
| checking for Tcl configuration... configure: error: /mybuild/tmp/work/x86_64-linux/tk-native/8.6.8-r0/recipe-sysroot-native/usr/bin directory doesn't contain tclConfig.sh

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-oe/recipes-devtools/tcltk/tk_8.6.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.8.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.8.bb
index 10281b2..d0f6fe0 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.8.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.8.bb
@@ -42,7 +42,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 EXTRA_OECONF = "\
     --enable-threads \
     --with-x \
-    --with-tcl=${STAGING_BINDIR_CROSS} \
+    --with-tcl=${STAGING_BINDIR}/crossscripts \
     --libdir=${libdir} \
 "
 
-- 
2.7.4


