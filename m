Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 78384605BA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 08:57:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3H8vFcu017184
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 01:57:16 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 17 Apr 2018 01:57:14 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Apr 2018 17:04:44 +0800
Message-ID: <1523955884-38040-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qtbase: add disable option to opengl PACKAGECONFIG
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
X-List-Received-Date: Tue, 17 Apr 2018 08:57:16 -0000
Content-Type: text/plain

The qtbase detect oepngl by default and report error if not found,
add disable option while explicitly disable it.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-qt/qt5/qtbase_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 5c4fe4f..db70b9e 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -111,7 +111,7 @@ PACKAGECONFIG[ico] = "-ico,-no-ico"
 PACKAGECONFIG[zlib] = "-system-zlib,-qt-zlib,zlib"
 PACKAGECONFIG[pcre] = "-system-pcre,-qt-pcre,pcre"
 PACKAGECONFIG[eglfs] = "-eglfs,-no-eglfs,drm"
-PACKAGECONFIG[gl] = "-opengl desktop,,virtual/libgl"
+PACKAGECONFIG[gl] = "-opengl desktop,-no-opengl,virtual/libgl"
 PACKAGECONFIG[gles2] = "-opengl es2,,virtual/libgles2 virtual/egl"
 PACKAGECONFIG[no-opengl] = "-no-opengl"
 PACKAGECONFIG[tslib] = "-tslib,-no-tslib,tslib"
-- 
2.7.4


