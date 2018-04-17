Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CD6017450B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 09:10:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3H9A74N025651
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 02:10:07 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 17 Apr 2018 02:10:06 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Apr 2018 17:17:36 +0800
Message-ID: <1523956656-12896-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523955884-38040-1-git-send-email-hongxu.jia@windriver.com>
References: <1523955884-38040-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH V2] qtbase: add disable option to opengl PACKAGECONFIG
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
X-List-Received-Date: Tue, 17 Apr 2018 09:10:07 -0000
Content-Type: text/plain

The qtbase detect oepngl by default and report error if not found,
add disable option while explicitly disable it.

Remove useless no-opengl PACKAGECONFIG

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-qt/qt5/qtbase_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 5c4fe4f..ca056af 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -111,9 +111,8 @@ PACKAGECONFIG[ico] = "-ico,-no-ico"
 PACKAGECONFIG[zlib] = "-system-zlib,-qt-zlib,zlib"
 PACKAGECONFIG[pcre] = "-system-pcre,-qt-pcre,pcre"
 PACKAGECONFIG[eglfs] = "-eglfs,-no-eglfs,drm"
-PACKAGECONFIG[gl] = "-opengl desktop,,virtual/libgl"
+PACKAGECONFIG[gl] = "-opengl desktop,-no-opengl,virtual/libgl"
 PACKAGECONFIG[gles2] = "-opengl es2,,virtual/libgles2 virtual/egl"
-PACKAGECONFIG[no-opengl] = "-no-opengl"
 PACKAGECONFIG[tslib] = "-tslib,-no-tslib,tslib"
 PACKAGECONFIG[cups] = "-cups,-no-cups,cups"
 PACKAGECONFIG[dbus] = "-dbus,-no-dbus,dbus"
-- 
2.7.4


