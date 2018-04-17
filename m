Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E67D74525
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 14:48:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3HEmj1k026008
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Apr 2018 07:48:46 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 17 Apr 2018 07:48:44 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Apr 2018 22:56:13 +0800
Message-ID: <1523976973-16676-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CA+chaQdtV1S4oq-NVt86NG2J20t51XhUpt-2C1OZJLOH86unrw@mail.gmail.com>
References: <CA+chaQdtV1S4oq-NVt86NG2J20t51XhUpt-2C1OZJLOH86unrw@mail.gmail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH V3] qtbase: add -no-opengl to configure by default
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
X-List-Received-Date: Tue, 17 Apr 2018 14:48:47 -0000
Content-Type: text/plain

The qtbase detect oepngl by default and report error if opengl is not exist.
...
ERROR: The OpenGL functionality tests failed!
...

Remove no-opengl's PACKAGECONFIG, and add -no-opengl to configure by
default, it could be override by gl and gles2's PACKAGECONFIG.

Such as `./configure -no-opengl -opengl desktop', the latter option works.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-qt/qt5/qtbase_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 5c4fe4f..fbee9b9 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -113,7 +113,6 @@ PACKAGECONFIG[pcre] = "-system-pcre,-qt-pcre,pcre"
 PACKAGECONFIG[eglfs] = "-eglfs,-no-eglfs,drm"
 PACKAGECONFIG[gl] = "-opengl desktop,,virtual/libgl"
 PACKAGECONFIG[gles2] = "-opengl es2,,virtual/libgles2 virtual/egl"
-PACKAGECONFIG[no-opengl] = "-no-opengl"
 PACKAGECONFIG[tslib] = "-tslib,-no-tslib,tslib"
 PACKAGECONFIG[cups] = "-cups,-no-cups,cups"
 PACKAGECONFIG[dbus] = "-dbus,-no-dbus,dbus"
@@ -195,6 +194,7 @@ do_configure() {
         -hostdatadir ${OE_QMAKE_PATH_HOST_DATA} \
         -platform ${OE_QMAKE_PLATFORM_NATIVE} \
         -xplatform ${XPLATFORM} \
+        -no-opengl \
         ${QT_CONFIG_FLAGS}
 }
 
-- 
2.7.4


