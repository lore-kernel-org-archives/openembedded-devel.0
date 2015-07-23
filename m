Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2668A739BE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 09:34:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98768227"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jul 2015 17:38:28 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6N9WxlV026123
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 17:32:59 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 23 Jul 2015 17:34:47 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 23 Jul 2015 17:34:41 +0800
Message-ID: <1437644081-4829-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH] lua: upgrade 5.2.2 -> 5.3.1
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
X-List-Received-Date: Thu, 23 Jul 2015 09:34:53 -0000
Content-Type: text/plain

Update the checksum, beginline and endline of LICENSE file,
but the LICENSE has not been changed.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-devtools/lua/{lua_5.2.2.bb => lua_5.3.1.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-devtools/lua/{lua_5.2.2.bb => lua_5.3.1.bb} (77%)

diff --git a/meta-oe/recipes-devtools/lua/lua_5.2.2.bb b/meta-oe/recipes-devtools/lua/lua_5.3.1.bb
similarity index 77%
rename from meta-oe/recipes-devtools/lua/lua_5.2.2.bb
rename to meta-oe/recipes-devtools/lua/lua_5.3.1.bb
index 500dd3a..a0c993c 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.2.2.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Lua is a powerful light-weight programming language designed \
 for extending applications."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=364;endline=398;md5=ad3069a42853ac3efd7d379d87f6088b"
+LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=318;endline=352;md5=68fc2aa2b751a37ff265524ddf026d7f"
 HOMEPAGE = "http://www.lua.org/"
 
 PR = "r0"
@@ -11,8 +11,8 @@ SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz \
            file://lua.pc \
 "
 
-SRC_URI[md5sum] = "efbb645e897eae37cad4344ce8b0a614"
-SRC_URI[sha256sum] = "3fd67de3f5ed133bf312906082fa524545c6b9e1b952e8215ffbd27113f49f00"
+SRC_URI[md5sum] = "797adacada8d85761c079390ff1d9961"
+SRC_URI[sha256sum] = "072767aad6cc2e62044a66e8562f51770d941e972dc1e4068ba719cd8bffac17"
 
 inherit pkgconfig binconfig
 
@@ -38,11 +38,11 @@ do_install () {
         'INSTALL_MAN=${D}${mandir}/man1' \
         'INSTALL_SHARE=${D}${datadir}/lua' \
         'INSTALL_LIB=${D}${libdir}' \
-        'INSTALL_CMOD=${D}${libdir}/lua/5.2' \
+        'INSTALL_CMOD=${D}${libdir}/lua/5.3' \
         install
     install -d ${D}${libdir}/pkgconfig
     install -m 0644 ${WORKDIR}/lua.pc ${D}${libdir}/pkgconfig/
-    rmdir ${D}${datadir}/lua/5.2
+    rmdir ${D}${datadir}/lua/5.3
     rmdir ${D}${datadir}/lua
 }
 
-- 
1.8.4.2


